-- =====================================================
-- MIGRAÇÃO 16: ÍNDICES COMPOSTOS - PARTE 5
-- =====================================================
-- Descrição: Índices compostos para queries complexas
-- Estimativa: ~1 minuto para executar

-- Portfolios por user e status
CREATE INDEX IF NOT EXISTS idx_portfolios_user_status 
ON portfolios(user_id, status) 
WHERE deleted_at IS NULL;

-- Aulas por status e data
CREATE INDEX IF NOT EXISTS idx_aulas_status_data 
ON aulas(status, data_programada) 
WHERE deleted_at IS NULL;

-- User points log por user e source
CREATE INDEX IF NOT EXISTS idx_user_points_user_source 
ON user_points_log(user_id, source_type, created_at DESC);

COMMENT ON INDEX idx_portfolios_user_status IS 'Otimiza busca de portfolios do usuário por status';
COMMENT ON INDEX idx_aulas_status_data IS 'Otimiza busca de aulas por status e data';
