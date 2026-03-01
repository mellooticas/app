-- =====================================================================
-- MIGRAÇÃO 11: ADICIONAR SOFT DELETE
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🟢 MÉDIO
-- Descrição: Adiciona campo deleted_at para soft delete em tabelas críticas
-- =====================================================================

BEGIN;

-- =====================================================================
-- FUNÇÃO AUXILIAR PARA SOFT DELETE
-- =====================================================================

CREATE OR REPLACE FUNCTION soft_delete(table_name TEXT, record_id UUID)
RETURNS BOOLEAN AS $$
DECLARE
    query TEXT;
BEGIN
    query := format('UPDATE %I SET deleted_at = CURRENT_TIMESTAMP WHERE id = $1 AND deleted_at IS NULL', table_name);
    EXECUTE query USING record_id;
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION soft_delete IS 'Marca um registro como deletado sem removê-lo fisicamente';

-- =====================================================================
-- 1. AULAS - Principal tabela sem deleted_at
-- =====================================================================

ALTER TABLE aulas ADD COLUMN IF NOT EXISTS deleted_at TIMESTAMPTZ;

CREATE INDEX IF NOT EXISTS idx_aulas_deleted_at ON aulas(deleted_at)
WHERE deleted_at IS NULL;

COMMENT ON COLUMN aulas.deleted_at IS 'Data de exclusão lógica da aula';

-- =====================================================================
-- 2. OUTRAS TABELAS IMPORTANTES
-- =====================================================================

-- Adiciona em tabelas que já têm 'ativo' mas seria melhor com deleted_at
ALTER TABLE instrumentos ADD COLUMN IF NOT EXISTS deleted_at TIMESTAMPTZ;
ALTER TABLE turmas ADD COLUMN IF NOT EXISTS deleted_at TIMESTAMPTZ;
ALTER TABLE matriculas ADD COLUMN IF NOT EXISTS deleted_at TIMESTAMPTZ;
ALTER TABLE portfolios ADD COLUMN IF NOT EXISTS deleted_at TIMESTAMPTZ;

-- Índices para performance (apenas registros não deletados)
CREATE INDEX IF NOT EXISTS idx_instrumentos_not_deleted ON instrumentos(id) WHERE deleted_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_turmas_not_deleted ON turmas(id) WHERE deleted_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_matriculas_not_deleted ON matriculas(id) WHERE deleted_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_portfolios_not_deleted ON portfolios(id) WHERE deleted_at IS NULL;

-- =====================================================================
-- VIEWS PARA DADOS ATIVOS (sem soft deleted)
-- =====================================================================

CREATE OR REPLACE VIEW aulas_ativas AS
SELECT * FROM aulas WHERE deleted_at IS NULL;

CREATE OR REPLACE VIEW instrumentos_ativos AS
SELECT * FROM instrumentos WHERE deleted_at IS NULL AND (ativo = true OR ativo IS NULL);

CREATE OR REPLACE VIEW turmas_ativas AS
SELECT * FROM turmas WHERE deleted_at IS NULL AND (ativo = true OR ativo IS NULL);

COMMENT ON VIEW aulas_ativas IS 'View que mostra apenas aulas não deletadas';
COMMENT ON VIEW instrumentos_ativos IS 'View que mostra apenas instrumentos ativos e não deletados';
COMMENT ON VIEW turmas_ativas IS 'View que mostra apenas turmas ativas e não deletadas';

-- =====================================================================
-- FUNÇÃO PARA RESTAURAR REGISTRO
-- =====================================================================

CREATE OR REPLACE FUNCTION restore_deleted(table_name TEXT, record_id UUID)
RETURNS BOOLEAN AS $$
DECLARE
    query TEXT;
BEGIN
    query := format('UPDATE %I SET deleted_at = NULL WHERE id = $1 AND deleted_at IS NOT NULL', table_name);
    EXECUTE query USING record_id;
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION restore_deleted IS 'Restaura um registro que foi soft deleted';

-- =====================================================================
-- FUNÇÃO PARA LISTAR DELETADOS
-- =====================================================================

CREATE OR REPLACE FUNCTION get_deleted_records(
    table_name TEXT,
    days_ago INTEGER DEFAULT 30
)
RETURNS TABLE (
    id UUID,
    deleted_at TIMESTAMPTZ
) AS $$
DECLARE
    query TEXT;
BEGIN
    query := format(
        'SELECT id, deleted_at FROM %I WHERE deleted_at IS NOT NULL AND deleted_at > CURRENT_TIMESTAMP - INTERVAL ''%s days''',
        table_name,
        days_ago
    );
    RETURN QUERY EXECUTE query;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION get_deleted_records IS 'Retorna registros deletados nos últimos N dias';

-- =====================================================================
-- VERIFICAÇÃO
-- =====================================================================

DO $$
DECLARE
    tabelas_com_deleted INTEGER;
    total_views INTEGER;
BEGIN
    SELECT COUNT(DISTINCT table_name) INTO tabelas_com_deleted
    FROM information_schema.columns
    WHERE table_schema = 'public'
        AND column_name = 'deleted_at';
    
    SELECT COUNT(*) INTO total_views
    FROM information_schema.views
    WHERE table_schema = 'public'
        AND table_name LIKE '%_ativas%';
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'MIGRAÇÃO 11 CONCLUÍDA';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'Tabelas com deleted_at: %', tabelas_com_deleted;
    RAISE NOTICE 'Views de ativos criadas: %', total_views;
    RAISE NOTICE '===================================';
    RAISE NOTICE '✅ Soft delete implementado!';
    RAISE NOTICE '📝 Use: soft_delete(''tabela'', id)';
    RAISE NOTICE '📝 Restaurar: restore_deleted(''tabela'', id)';
    RAISE NOTICE '===================================';
END $$;

COMMIT;

-- =====================================================================
-- EXEMPLOS DE USO
-- =====================================================================
/*

-- Deletar uma aula (soft delete)
SELECT soft_delete('aulas', 'uuid-da-aula');

-- Ou via UPDATE direto
UPDATE aulas SET deleted_at = CURRENT_TIMESTAMP WHERE id = 'uuid';

-- Restaurar aula deletada
SELECT restore_deleted('aulas', 'uuid-da-aula');

-- Listar aulas deletadas nos últimos 30 dias
SELECT * FROM get_deleted_records('aulas', 30);

-- Ver apenas aulas ativas
SELECT * FROM aulas_ativas;

-- Limpar aulas deletadas há mais de 1 ano (hard delete)
DELETE FROM aulas
WHERE deleted_at IS NOT NULL
    AND deleted_at < CURRENT_TIMESTAMP - INTERVAL '1 year';

*/

-- =====================================================================
-- ROLLBACK
-- =====================================================================
/*
BEGIN;
ALTER TABLE aulas DROP COLUMN IF EXISTS deleted_at;
ALTER TABLE instrumentos DROP COLUMN IF EXISTS deleted_at;
ALTER TABLE turmas DROP COLUMN IF EXISTS deleted_at;
ALTER TABLE matriculas DROP COLUMN IF EXISTS deleted_at;
ALTER TABLE portfolios DROP COLUMN IF EXISTS deleted_at;
DROP VIEW IF EXISTS aulas_ativas;
DROP VIEW IF EXISTS instrumentos_ativos;
DROP VIEW IF EXISTS turmas_ativas;
DROP FUNCTION IF EXISTS soft_delete;
DROP FUNCTION IF EXISTS restore_deleted;
DROP FUNCTION IF EXISTS get_deleted_records;
COMMIT;
*/
