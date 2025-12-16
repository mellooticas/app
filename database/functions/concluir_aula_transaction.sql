-- =====================================================
-- FUNÇÃO: concluir_aula_transaction
-- =====================================================
-- Descrição: Conclui aula e atualiza progresso em uma transação atômica
-- Uso: Chamada via RPC pelos server actions
-- Retorna: success, points_awarded, achievement_unlocked

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
    -- Verificar se já existe progresso
    SELECT id, concluida INTO v_progresso_id, v_already_completed
    FROM aula_progresso
    WHERE aluno_id = p_aluno_id
      AND aula_id = p_aula_id
    FOR UPDATE;
    
    -- Se já estava concluída, retornar sem fazer nada
    IF v_already_completed THEN
        RETURN QUERY SELECT 
            true as success,
            0 as points_awarded,
            false as achievement_unlocked,
            'Aula já estava concluída'::TEXT as message;
        RETURN;
    END IF;
    
    -- Atualizar ou criar progresso
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
    
    -- Adicionar pontos (50 pontos por aula concluída)
    v_points_to_award := 50;
    
    PERFORM increment_user_points(
        p_aluno_id,
        v_points_to_award,
        'lesson_completed',
        'Aula concluída: ' || p_aula_id::TEXT,
        'lesson_' || p_aula_id::TEXT
    );
    
    -- Verificar conquistas
    -- Contar total de aulas concluídas
    SELECT COUNT(*) INTO v_total_aulas_concluidas
    FROM aula_progresso
    WHERE aluno_id = p_aluno_id
      AND concluida = true;
    
    -- Desbloquear conquistas baseadas em aulas concluídas
    -- 1ª aula (achievement_id = 1, assumindo que existe)
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
    
    -- Retornar resultado
    RETURN QUERY SELECT 
        true as success,
        v_points_to_award as points_awarded,
        (v_total_aulas_concluidas = 1) as achievement_unlocked,
        'Aula concluída com sucesso!'::TEXT as message;
END;
$$;

COMMENT ON FUNCTION concluir_aula_transaction IS 
'Conclui aula e atualiza progresso em uma transação atômica';

REVOKE ALL ON FUNCTION concluir_aula_transaction FROM PUBLIC;
GRANT EXECUTE ON FUNCTION concluir_aula_transaction TO authenticated;
