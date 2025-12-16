-- =====================================================
-- FUNÇÃO: submeter_portfolio_transaction
-- =====================================================
-- Descrição: Submete portfólio e atualiza gamificação em uma transação
-- Uso: Chamada via RPC pelos server actions

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
    -- Criar portfolio
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
    
    -- Calcular pontos baseado no tipo de obra
    v_points_to_award := CASE p_tipo_obra
        WHEN 'composicao_original' THEN 100
        WHEN 'arranjo' THEN 80
        WHEN 'interpretacao' THEN 60
        WHEN 'improvisacao' THEN 70
        ELSE 50
    END;
    
    -- Adicionar pontos
    PERFORM increment_user_points(
        p_aluno_id,
        v_points_to_award,
        'portfolio_submitted',
        'Portfólio submetido: ' || p_titulo,
        'portfolio_' || v_portfolio_id::TEXT
    );
    
    -- Verificar conquista de primeiro portfólio
    SELECT COUNT(*) INTO v_total_portfolios
    FROM portfolios
    WHERE aluno_id = p_aluno_id
      AND deleted_at IS NULL;
    
    IF v_total_portfolios = 1 THEN
        -- Desbloquear conquista "Primeiro Portfólio"
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
    
    -- Retornar resultado
    RETURN QUERY SELECT 
        true as success,
        v_portfolio_id,
        v_points_to_award as points_awarded,
        'Portfólio submetido com sucesso!'::TEXT as message;
END;
$$;

COMMENT ON FUNCTION submeter_portfolio_transaction IS 
'Submete portfólio e atualiza gamificação em uma transação atômica';

REVOKE ALL ON FUNCTION submeter_portfolio_transaction FROM PUBLIC;
GRANT EXECUTE ON FUNCTION submeter_portfolio_transaction TO authenticated;
