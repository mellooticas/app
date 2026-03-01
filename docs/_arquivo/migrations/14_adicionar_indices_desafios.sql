-- =====================================================
-- MIGRAÇÃO 14: ÍNDICES PARA MÓDULOS E RELACIONAMENTOS - PARTE 3
-- =====================================================
-- Descrição: Índices para módulos e relações
-- Estimativa: ~1 minuto para executar

-- Aulas por módulo
CREATE INDEX IF NOT EXISTS idx_aulas_modulo_id 
ON aulas(modulo_id) 
WHERE modulo_id IS NOT NULL;

-- Portfolios por metodologia
CREATE INDEX IF NOT EXISTS idx_portfolios_metodologia_id 
ON portfolios(metodologia_id) 
WHERE metodologia_id IS NOT NULL;

-- Portfolios por competência
CREATE INDEX IF NOT EXISTS idx_portfolios_competencia_id 
ON portfolios(competencia_id) 
WHERE competencia_id IS NOT NULL;

COMMENT ON INDEX idx_aulas_modulo_id IS 'Otimiza busca de aulas por módulo';
COMMENT ON INDEX idx_portfolios_metodologia_id IS 'Otimiza busca de portfolios por metodologia';
