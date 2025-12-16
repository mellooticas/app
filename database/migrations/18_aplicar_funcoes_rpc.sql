-- =====================================================
-- SCRIPT DE APLICAÇÃO: Todas as funções RPC
-- =====================================================
-- Descrição: Aplica todas as funções de banco de dados
-- Uso: Executar via Supabase Dashboard > SQL Editor

-- 1. Função de incremento de pontos
CREATE OR REPLACE FUNCTION increment_user_points(
    p_user_id UUID,
    p_points INTEGER,
    p_category TEXT,
    p_description TEXT DEFAULT NULL,
    p_reference_id TEXT DEFAULT NULL
)
RETURNS TABLE(
    success BOOLEAN,
    new_total INTEGER,
    log_id BIGINT
) 
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_current_points INTEGER;
    v_new_total INTEGER;
    v_log_id BIGINT;
    v_existing_log_id BIGINT;
BEGIN
    IF p_reference_id IS NOT NULL THEN
        SELECT id INTO v_existing_log_id
        FROM user_points_log
        WHERE user_id = p_user_id
          AND category = p_category
          AND reference_id = p_reference_id
          AND deleted_at IS NULL
        LIMIT 1;
        
        IF v_existing_log_id IS NOT NULL THEN
            SELECT total_points INTO v_current_points
            FROM profiles
            WHERE id = p_user_id;
            
            RETURN QUERY SELECT 
                true as success,
                COALESCE(v_current_points, 0) as new_total,
                v_existing_log_id as log_id;
            RETURN;
        END IF;
    END IF;

    SELECT total_points INTO v_current_points
    FROM profiles
    WHERE id = p_user_id
    FOR UPDATE;
    
    IF NOT FOUND THEN
        RETURN QUERY SELECT 
            false as success,
            0 as new_total,
            NULL::BIGINT as log_id;
        RETURN;
    END IF;
    
    v_new_total := COALESCE(v_current_points, 0) + p_points;
    
    UPDATE profiles
    SET 
        total_points = v_new_total,
        updated_at = NOW()
    WHERE id = p_user_id;
    
    INSERT INTO user_points_log (
        user_id,
        points,
        category,
        description,
        reference_id
    )
    VALUES (
        p_aluno_id,
        p_points,
        p_category,
        p_description,
        p_reference_id
    )
    RETURNING id INTO v_log_id;
    
    RETURN QUERY SELECT 
        true as success,
        v_new_total as new_total,
        v_log_id as log_id;
END;
$$;

-- 2. Função de conclusão de aula
CREATE OR REPLACE FUNCTION concluir_aula_transaction(
    p_aluno_id UUID,
    p_aula_id BIGINT,
    p_tempo_estudo_minutos INTEGER DEFAULT 0,
    p_notas_aluno TEXT DEFAULT NULL
)
RETURNS TABLE(
    success BOOLEAN,
    points_awarded INTEGER,
    achievement_unlocked BOOLEAN,
    message TEXT
) 
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_progresso_id BIGINT;
    v_already_completed BOOLEAN;
    v_total_aulas_concluidas INTEGER;
    v_points_to_award INTEGER := 0;
    v_achievement_id BIGINT;
BEGIN
    SELECT id, concluida INTO v_progresso_id, v_already_completed
    FROM aula_progresso
    WHERE aluno_id = p_aluno_id
      AND aula_id = p_aula_id
    FOR UPDATE;
    
    IF v_already_completed THEN
        RETURN QUERY SELECT 
            true as success,
            0 as points_awarded,
            false as achievement_unlocked,
            'Aula já estava concluída'::TEXT as message;
        RETURN;
    END IF;
    
    IF v_progresso_id IS NOT NULL THEN
        UPDATE aula_progresso
        SET 
            concluida = true,
            data_conclusao = NOW(),
            tempo_estudo_minutos = p_tempo_estudo_minutos,
            notas_aluno = p_notas_aluno,
            updated_at = NOW()
        WHERE id = v_progresso_id;
    ELSE
        INSERT INTO aula_progresso (
            aluno_id,
            aula_id,
            concluida,
            data_conclusao,
            tempo_estudo_minutos,
            notas_aluno
        )
        VALUES (
            p_aluno_id,
            p_aula_id,
            true,
            NOW(),
            p_tempo_estudo_minutos,
            p_notas_aluno
        )
        RETURNING id INTO v_progresso_id;
    END IF;
    
    v_points_to_award := 50;
    
    PERFORM increment_user_points(
        p_aluno_id,
        v_points_to_award,
        'lesson_completed',
        'Aula concluída: ' || p_aula_id::TEXT,
        'lesson_' || p_aula_id::TEXT
    );
    
    SELECT COUNT(*) INTO v_total_aulas_concluidas
    FROM aula_progresso
    WHERE aluno_id = p_aluno_id
      AND concluida = true;
    
    IF v_total_aulas_concluidas = 1 THEN
        SELECT id INTO v_achievement_id
        FROM achievements
        WHERE codigo = 'primeira_aula'
        LIMIT 1;
        
        IF v_achievement_id IS NOT NULL THEN
            INSERT INTO user_achievements (user_id, achievement_id, is_unlocked, unlocked_at)
            VALUES (p_aluno_id, v_achievement_id, true, NOW())
            ON CONFLICT (user_id, achievement_id) DO NOTHING;
        END IF;
    END IF;
    
    RETURN QUERY SELECT 
        true as success,
        v_points_to_award as points_awarded,
        (v_total_aulas_concluidas = 1) as achievement_unlocked,
        'Aula concluída com sucesso!'::TEXT as message;
END;
$$;

-- 3. Função de submissão de portfólio
CREATE OR REPLACE FUNCTION submeter_portfolio_transaction(
    p_aluno_id UUID,
    p_titulo TEXT,
    p_descricao TEXT,
    p_tipo_obra TEXT,
    p_nivel_dificuldade TEXT DEFAULT 'iniciante',
    p_arquivo_url TEXT DEFAULT NULL,
    p_video_url TEXT DEFAULT NULL,
    p_audio_url TEXT DEFAULT NULL,
    p_tags TEXT[] DEFAULT NULL
)
RETURNS TABLE(
    success BOOLEAN,
    portfolio_id BIGINT,
    points_awarded INTEGER,
    message TEXT
) 
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_portfolio_id BIGINT;
    v_points_to_award INTEGER;
    v_total_portfolios INTEGER;
BEGIN
    INSERT INTO portfolios (
        aluno_id,
        titulo,
        descricao,
        tipo_obra,
        nivel_dificuldade,
        arquivo_url,
        video_url,
        audio_url,
        tags
    )
    VALUES (
        p_aluno_id,
        p_titulo,
        p_descricao,
        p_tipo_obra,
        p_nivel_dificuldade,
        p_arquivo_url,
        p_video_url,
        p_audio_url,
        p_tags
    )
    RETURNING id INTO v_portfolio_id;
    
    v_points_to_award := CASE p_tipo_obra
        WHEN 'composicao_original' THEN 100
        WHEN 'arranjo' THEN 80
        WHEN 'interpretacao' THEN 60
        WHEN 'improvisacao' THEN 70
        ELSE 50
    END;
    
    PERFORM increment_user_points(
        p_aluno_id,
        v_points_to_award,
        'portfolio_submitted',
        'Portfólio submetido: ' || p_titulo,
        'portfolio_' || v_portfolio_id::TEXT
    );
    
    SELECT COUNT(*) INTO v_total_portfolios
    FROM portfolios
    WHERE aluno_id = p_aluno_id
      AND deleted_at IS NULL;
    
    IF v_total_portfolios = 1 THEN
        INSERT INTO user_achievements (user_id, achievement_id, is_unlocked, unlocked_at)
        SELECT 
            p_aluno_id,
            id,
            true,
            NOW()
        FROM achievements
        WHERE codigo = 'primeiro_portfolio'
        LIMIT 1
        ON CONFLICT (user_id, achievement_id) DO NOTHING;
    END IF;
    
    RETURN QUERY SELECT 
        true as success,
        v_portfolio_id,
        v_points_to_award as points_awarded,
        'Portfólio submetido com sucesso!'::TEXT as message;
END;
$$;

-- Comentários e permissões
COMMENT ON FUNCTION increment_user_points IS 'Incrementa pontos do usuário de forma atômica';
COMMENT ON FUNCTION concluir_aula_transaction IS 'Conclui aula e atualiza progresso em transação';
COMMENT ON FUNCTION submeter_portfolio_transaction IS 'Submete portfólio e atualiza gamificação em transação';

REVOKE ALL ON FUNCTION increment_user_points FROM PUBLIC;
REVOKE ALL ON FUNCTION concluir_aula_transaction FROM PUBLIC;
REVOKE ALL ON FUNCTION submeter_portfolio_transaction FROM PUBLIC;

GRANT EXECUTE ON FUNCTION increment_user_points TO authenticated;
GRANT EXECUTE ON FUNCTION concluir_aula_transaction TO authenticated;
GRANT EXECUTE ON FUNCTION submeter_portfolio_transaction TO authenticated;
