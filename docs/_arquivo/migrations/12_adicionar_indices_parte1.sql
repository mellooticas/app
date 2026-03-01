-- =====================================================
-- MIGRAÇÃO 12: ÍNDICES PARA QUERIES FREQUENTES - PARTE 1
-- =====================================================
-- Descrição: Adiciona índices para as queries mais frequentes do sistema
-- Estimativa: ~2 minutos para executar

-- Perfis por tipo de usuário
CREATE INDEX IF NOT EXISTS idx_profiles_tipo_usuario 
ON profiles(tipo_usuario) 
WHERE tipo_usuario IS NOT NULL;

-- Perfis por user_level
CREATE INDEX IF NOT EXISTS idx_profiles_user_level 
ON profiles(user_level);

-- Aulas por data programada (dashboard admin, calendário)
CREATE INDEX IF NOT EXISTS idx_aulas_data_programada 
ON aulas(data_programada);

-- Aulas por status
CREATE INDEX IF NOT EXISTS idx_aulas_status 
ON aulas(status) 
WHERE status IS NOT NULL;

-- Aulas por responsável
CREATE INDEX IF NOT EXISTS idx_aulas_responsavel_id 
ON aulas(responsavel_id) 
WHERE responsavel_id IS NOT NULL;

-- Aulas por nível
CREATE INDEX IF NOT EXISTS idx_aulas_nivel 
ON aulas(nivel) 
WHERE nivel IS NOT NULL;

-- Aulas não deletadas
CREATE INDEX IF NOT EXISTS idx_aulas_not_deleted 
ON aulas(deleted_at) 
WHERE deleted_at IS NULL;

-- Portfolios por user_id (query muito frequente)
CREATE INDEX IF NOT EXISTS idx_portfolios_user_id 
ON portfolios(user_id) 
WHERE deleted_at IS NULL;

-- Portfolios por tipo
CREATE INDEX IF NOT EXISTS idx_portfolios_tipo 
ON portfolios(tipo) 
WHERE deleted_at IS NULL;

-- Portfolios por status
CREATE INDEX IF NOT EXISTS idx_portfolios_status 
ON portfolios(status) 
WHERE deleted_at IS NULL;

COMMENT ON INDEX idx_profiles_tipo_usuario IS 'Otimiza busca de usuários por tipo';
COMMENT ON INDEX idx_aulas_data_programada IS 'Otimiza queries de aulas por data (calendário)';
COMMENT ON INDEX idx_portfolios_user_id IS 'Otimiza busca de portfolio do usuário';
