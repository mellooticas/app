-- =====================================================
-- MIGRAÇÃO 15: ÍNDICES PARA PROFILES - PARTE 4
-- =====================================================
-- Descrição: Índices adicionais para profiles
-- Estimativa: ~1 minuto para executar

-- Profiles por total_points (ranking)
CREATE INDEX IF NOT EXISTS idx_profiles_total_points 
ON profiles(total_points DESC);

-- Profiles por lessons_completed
CREATE INDEX IF NOT EXISTS idx_profiles_lessons_completed 
ON profiles(lessons_completed DESC);

-- Profiles por current_streak
CREATE INDEX IF NOT EXISTS idx_profiles_current_streak 
ON profiles(current_streak DESC);

-- Profiles por instrument
CREATE INDEX IF NOT EXISTS idx_profiles_instrument 
ON profiles(instrument) 
WHERE instrument IS NOT NULL;

-- Profiles por last_active
CREATE INDEX IF NOT EXISTS idx_profiles_last_active 
ON profiles(last_active DESC);

COMMENT ON INDEX idx_profiles_total_points IS 'Otimiza ranking de pontos';
COMMENT ON INDEX idx_profiles_current_streak IS 'Otimiza ranking de sequências';
