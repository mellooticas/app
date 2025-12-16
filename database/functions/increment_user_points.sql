-- =====================================================
-- FUNÇÃO: increment_user_points
-- =====================================================
-- Descrição: Incrementa pontos do usuário de forma atômica
-- Uso: Chamada via RPC pelos server actions de gamificação
-- Parâmetros:
--   - p_user_id: UUID do usuário
--   - p_points: Quantidade de pontos a adicionar
--   - p_category: Categoria da pontuação
--   - p_description: Descrição opcional
--   - p_reference_id: ID de referência opcional (para evitar duplicatas)

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
    -- Verificar se já existe um log com o mesmo reference_id (evitar duplicatas)
    IF p_reference_id IS NOT NULL THEN
        SELECT id INTO v_existing_log_id
        FROM user_points_log
        WHERE user_id = p_user_id
          AND category = p_category
          AND reference_id = p_reference_id
          AND deleted_at IS NULL
        LIMIT 1;
        
        -- Se já existe, retornar sucesso sem adicionar pontos
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

    -- Bloquear linha do usuário para evitar race conditions
    SELECT total_points INTO v_current_points
    FROM profiles
    WHERE id = p_user_id
    FOR UPDATE;
    
    -- Se usuário não existe, retornar erro
    IF NOT FOUND THEN
        RETURN QUERY SELECT 
            false as success,
            0 as new_total,
            NULL::BIGINT as log_id;
        RETURN;
    END IF;
    
    -- Calcular novo total
    v_new_total := COALESCE(v_current_points, 0) + p_points;
    
    -- Atualizar pontos do usuário
    UPDATE profiles
    SET 
        total_points = v_new_total,
        updated_at = NOW()
    WHERE id = p_user_id;
    
    -- Criar log de pontos
    INSERT INTO user_points_log (
        user_id,
        points,
        category,
        description,
        reference_id
    )
    VALUES (
        p_user_id,
        p_points,
        p_category,
        p_description,
        p_reference_id
    )
    RETURNING id INTO v_log_id;
    
    -- Retornar sucesso
    RETURN QUERY SELECT 
        true as success,
        v_new_total as new_total,
        v_log_id as log_id;
END;
$$;

-- Comentário da função
COMMENT ON FUNCTION increment_user_points IS 
'Incrementa pontos do usuário de forma atômica, evita duplicatas via reference_id';

-- Permissões: apenas authenticated users podem chamar
REVOKE ALL ON FUNCTION increment_user_points FROM PUBLIC;
GRANT EXECUTE ON FUNCTION increment_user_points TO authenticated;
