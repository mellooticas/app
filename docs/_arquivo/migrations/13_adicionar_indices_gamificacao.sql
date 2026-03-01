-- =====================================================
-- MIGRAÇÃO 13: ÍNDICES PARA GAMIFICAÇÃO - PARTE 2
-- =====================================================
-- Descrição: Índices para sistema de pontos e conquistas
-- Estimativa: ~1 minuto para executar

-- User points log por usuário
CREATE INDEX IF NOT EXISTS idx_user_points_log_user_id 
ON user_points_log(user_id);

-- User points log por action
CREATE INDEX IF NOT EXISTS idx_user_points_log_action 
ON user_points_log(action);

-- User points log por source_type
CREATE INDEX IF NOT EXISTS idx_user_points_log_source_type 
ON user_points_log(source_type);

-- User points log por data
CREATE INDEX IF NOT EXISTS idx_user_points_log_created 
ON user_points_log(created_at DESC);

-- User points log composto (user + data)
CREATE INDEX IF NOT EXISTS idx_user_points_log_user_date 
ON user_points_log(user_id, created_at DESC);

-- Achievements ativos
CREATE INDEX IF NOT EXISTS idx_achievements_active 
ON achievements(is_active) 
WHERE is_active = true;

-- Achievements por categoria
CREATE INDEX IF NOT EXISTS idx_achievements_category 
ON achievements(category) 
WHERE is_active = true;

COMMENT ON INDEX idx_user_points_log_user_id IS 'Otimiza queries de pontos por usuário';
COMMENT ON INDEX idx_achievements_active IS 'Otimiza busca de conquistas ativas';
