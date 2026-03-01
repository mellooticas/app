-- =====================================================================
-- MIGRAÇÃO 08: ADICIONAR VALIDAÇÃO DE CAMPOS NUMÉRICOS
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🟡 ALTO
-- Descrição: Adiciona CHECK constraints para notas, anos e outros números
-- =====================================================================

BEGIN;

-- =====================================================================
-- AULA_AVALIACOES - Nota entre 0 e 10
-- =====================================================================

ALTER TABLE aula_avaliacoes
ADD CONSTRAINT check_nota_valida
CHECK (nota IS NULL OR (nota >= 0 AND nota <= 10));

COMMENT ON CONSTRAINT check_nota_valida ON aula_avaliacoes IS
'Garante que a nota está entre 0 e 10';

-- =====================================================================
-- HISTORIA_EVENTOS_TIMELINE - Ano válido
-- =====================================================================

ALTER TABLE historia_eventos_timeline
ADD CONSTRAINT check_ano_valido
CHECK (ano IS NULL OR (ano >= 1000 AND ano <= 2100));

COMMENT ON CONSTRAINT check_ano_valido ON historia_eventos_timeline IS
'Garante que o ano está entre 1000 e 2100';

-- =====================================================================
-- HISTORIA_TIMELINE - Ano válido
-- =====================================================================

ALTER TABLE historia_timeline
ADD CONSTRAINT check_ano_timeline_valido
CHECK (ano IS NULL OR (ano >= 1000 AND ano <= 2100));

COMMENT ON CONSTRAINT check_ano_timeline_valido ON historia_timeline IS
'Garante que o ano está entre 1000 e 2100';

-- =====================================================================
-- ALPHA_NIVEIS - Nível positivo
-- =====================================================================

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
            AND table_name = 'alpha_niveis'
            AND column_name = 'nivel'
    ) THEN
        ALTER TABLE alpha_niveis
        ADD CONSTRAINT check_nivel_positivo
        CHECK (nivel IS NULL OR nivel > 0);
        
        RAISE NOTICE '✅ Constraint adicionada em alpha_niveis.nivel';
    ELSE
        RAISE NOTICE 'ℹ️ Coluna nivel não existe em alpha_niveis';
    END IF;
END $$;

-- =====================================================================
-- ALPHA_NIVEIS - XP necessário positivo
-- =====================================================================

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
            AND table_name = 'alpha_niveis'
            AND column_name = 'xp_necessario'
    ) THEN
        ALTER TABLE alpha_niveis
        ADD CONSTRAINT check_xp_necessario_positivo
        CHECK (xp_necessario IS NULL OR xp_necessario >= 0);
        
        RAISE NOTICE '✅ Constraint adicionada em alpha_niveis.xp_necessario';
    ELSE
        RAISE NOTICE 'ℹ️ Coluna xp_necessario não existe em alpha_niveis';
    END IF;
END $$;

-- =====================================================================
-- ALPHA_RANKING - Top 3 válido (1, 2 ou 3)
-- =====================================================================

-- Verifica se a coluna top_3 existe E é numérica
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
            AND table_name = 'alpha_ranking'
            AND column_name = 'top_3'
            AND data_type IN ('integer', 'smallint', 'bigint', 'numeric')
    ) THEN
        ALTER TABLE alpha_ranking
        ADD CONSTRAINT check_top_3_valido
        CHECK (top_3 IS NULL OR (top_3 >= 1 AND top_3 <= 3));
        
        RAISE NOTICE '✅ Constraint adicionada em alpha_ranking.top_3';
    ELSE
        RAISE NOTICE 'ℹ️ Coluna top_3 não existe ou não é numérica em alpha_ranking';
    END IF;
END $$;

-- =====================================================================
-- VALIDAÇÃO DOS DADOS EXISTENTES
-- =====================================================================

-- Verifica se há notas inválidas
DO $$
DECLARE
    invalid_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO invalid_count
    FROM aula_avaliacoes
    WHERE nota IS NOT NULL
        AND (nota < 0 OR nota > 10);
    
    IF invalid_count > 0 THEN
        RAISE WARNING '⚠️ ATENÇÃO: % notas inválidas em aula_avaliacoes', invalid_count;
        RAISE WARNING '⚠️ Corrija com: UPDATE aula_avaliacoes SET nota = GREATEST(0, LEAST(10, nota));';
    ELSE
        RAISE NOTICE '✅ Todas as notas estão válidas!';
    END IF;
END $$;

-- Verifica se há anos inválidos
DO $$
DECLARE
    invalid_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO invalid_count
    FROM historia_eventos_timeline
    WHERE ano IS NOT NULL
        AND (ano < 1000 OR ano > 2100);
    
    IF invalid_count > 0 THEN
        RAISE WARNING '⚠️ ATENÇÃO: % anos inválidos em historia_eventos_timeline', invalid_count;
    ELSE
        RAISE NOTICE '✅ Todos os anos estão válidos!';
    END IF;
    
    SELECT COUNT(*) INTO invalid_count
    FROM historia_timeline
    WHERE ano IS NOT NULL
        AND (ano < 1000 OR ano > 2100);
    
    IF invalid_count > 0 THEN
        RAISE WARNING '⚠️ ATENÇÃO: % anos inválidos em historia_timeline', invalid_count;
    ELSE
        RAISE NOTICE '✅ Todos os anos em timeline estão válidos!';
    END IF;
END $$;

-- =====================================================================
-- SCRIPT PARA CORREÇÃO DE DADOS INVÁLIDOS
-- =====================================================================
/*
-- Corrigir notas fora do range
UPDATE aula_avaliacoes
SET nota = CASE
    WHEN nota < 0 THEN 0
    WHEN nota > 10 THEN 10
    ELSE nota
END
WHERE nota IS NOT NULL AND (nota < 0 OR nota > 10);

-- Corrigir anos inválidos (definir para NULL ou ano correto)
UPDATE historia_eventos_timeline
SET ano = NULL
WHERE ano IS NOT NULL AND (ano < 1000 OR ano > 2100);

UPDATE historia_timeline
SET ano = NULL
WHERE ano IS NOT NULL AND (ano < 1000 OR ano > 2100);
*/

-- =====================================================================
-- VERIFICAÇÃO FINAL
-- =====================================================================

DO $$
DECLARE
    total_constraints INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_constraints
    FROM information_schema.check_constraints
    WHERE constraint_schema = 'public'
        AND (
            constraint_name LIKE '%nota%' OR
            constraint_name LIKE '%ano%' OR
            constraint_name LIKE '%nivel%' OR
            constraint_name LIKE '%xp%' OR
            constraint_name LIKE '%top%'
        );
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'MIGRAÇÃO 08 CONCLUÍDA';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'Constraints numéricas criadas: %', total_constraints;
    RAISE NOTICE '===================================';
    RAISE NOTICE '✅ Validações:';
    RAISE NOTICE '   - Notas: 0 a 10';
    RAISE NOTICE '   - Anos: 1000 a 2100';
    RAISE NOTICE '   - Níveis: > 0';
    RAISE NOTICE '   - XP: >= 0';
    RAISE NOTICE '===================================';
END $$;

COMMIT;

-- =====================================================================
-- ROLLBACK (se necessário)
-- =====================================================================
--
-- BEGIN;
-- ALTER TABLE aula_avaliacoes DROP CONSTRAINT IF EXISTS check_nota_valida;
-- ALTER TABLE historia_eventos_timeline DROP CONSTRAINT IF EXISTS check_ano_valido;
-- ALTER TABLE historia_timeline DROP CONSTRAINT IF EXISTS check_ano_timeline_valido;
-- ALTER TABLE alpha_niveis DROP CONSTRAINT IF EXISTS check_nivel_positivo;
-- ALTER TABLE alpha_niveis DROP CONSTRAINT IF EXISTS check_xp_necessario_positivo;
-- ALTER TABLE alpha_ranking DROP CONSTRAINT IF EXISTS check_top_3_valido;
-- COMMIT;
--
-- =====================================================================
