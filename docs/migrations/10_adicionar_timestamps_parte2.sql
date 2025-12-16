-- =====================================================================
-- MIGRAÇÃO 10: ADICIONAR TIMESTAMPS - PARTE 2
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🟡 ALTO
-- Descrição: Adiciona created_at e updated_at nas demais 16 tabelas
-- =====================================================================

BEGIN;

-- Nota: A função update_updated_at_column() já foi criada na Migração 09

-- =====================================================================
-- 16. AULA_ATIVIDADES
-- =====================================================================

ALTER TABLE aula_atividades ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aula_atividades ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_aula_atividades_updated_at
    BEFORE UPDATE ON aula_atividades
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 17. AULA_CHECKLIST
-- =====================================================================

ALTER TABLE aula_checklist ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aula_checklist ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_aula_checklist_updated_at
    BEFORE UPDATE ON aula_checklist
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 18. AULA_CRITERIOS_AVALIACAO
-- =====================================================================

ALTER TABLE aula_criterios_avaliacao ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aula_criterios_avaliacao ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_aula_criterios_updated_at
    BEFORE UPDATE ON aula_criterios_avaliacao
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 19-26. DEMAIS TABELAS DE AULA
-- =====================================================================

ALTER TABLE aula_desafio_alpha ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aula_desafio_alpha ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE aula_desafios ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aula_desafios ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE aula_feedbacks ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aula_feedbacks ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE aula_materiais ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aula_materiais ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE aula_permissoes ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aula_permissoes ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE aula_registros ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aula_registros ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE aula_tags ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aula_tags ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

-- =====================================================================
-- 27-31. TABELAS ADMINISTRATIVAS
-- =====================================================================

ALTER TABLE professores_categorias ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE professores_categorias ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE professores_conteudos ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE professores_conteudos ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE role_permissions ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE role_permissions ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE turma_alunos ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE turma_alunos ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE user_devotional_progress ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE user_devotional_progress ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

-- =====================================================================
-- POPULA DATAS EXISTENTES
-- =====================================================================

UPDATE aula_atividades SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;
UPDATE aula_checklist SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;
UPDATE aula_criterios_avaliacao SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;

-- =====================================================================
-- VERIFICAÇÃO FINAL
-- =====================================================================

DO $$
DECLARE
    total_tabelas_com_timestamps INTEGER;
    total_sem_timestamps INTEGER;
BEGIN
    SELECT COUNT(DISTINCT c.table_name) INTO total_tabelas_com_timestamps
    FROM information_schema.columns c
    JOIN information_schema.tables t ON t.table_name = c.table_name AND t.table_schema = c.table_schema
    WHERE c.table_schema = 'public'
        AND c.column_name = 'created_at'
        AND t.table_type = 'BASE TABLE';
    
    SELECT COUNT(*) INTO total_sem_timestamps
    FROM information_schema.tables t
    WHERE t.table_schema = 'public'
        AND t.table_type = 'BASE TABLE'
        AND NOT EXISTS (
            SELECT 1
            FROM information_schema.columns c
            WHERE c.table_schema = 'public'
                AND c.table_name = t.table_name
                AND c.column_name = 'created_at'
        );
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'MIGRAÇÃO 10 CONCLUÍDA';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'Total tabelas com timestamps: %', total_tabelas_com_timestamps;
    RAISE NOTICE 'Tabelas ainda sem timestamps: %', total_sem_timestamps;
    RAISE NOTICE '===================================';
    RAISE NOTICE '✅ Auditoria temporal implementada!';
    RAISE NOTICE '===================================';
END $$;

COMMIT;
