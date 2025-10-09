-- ============================================
-- 📊 ÍNDICES ADICIONAIS - APENAS TABELAS CONFIRMADAS
-- ============================================
-- ⚠️ ATENÇÃO: Execute APENAS se as tabelas já existirem no Supabase
-- Data: 05/10/2025
-- Status: Este arquivo está VAZIO propositalmente
-- Motivo: As tabelas alpha_*, portfolios e gamification_* ainda não foram criadas

-- ============================================
-- 📝 INSTRUÇÕES
-- ============================================
-- 1. Primeiro execute: create_alpha_system.sql
-- 2. Depois execute: create_portfolio_system.sql  
-- 3. Depois execute: create-gamification-tables.sql
-- 4. Depois execute: TABELAS_FALTANTES_COMPLETAS.sql
-- 5. Só então volte aqui e descomente os índices abaixo

-- ============================================
-- 📚 SISTEMA ALPHA (Descomentar após criar as tabelas)
-- ============================================
-- CREATE INDEX IF NOT EXISTS idx_alpha_desafios_nivel ON alpha_desafios(nivel);
-- CREATE INDEX IF NOT EXISTS idx_alpha_desafios_ativo ON alpha_desafios(ativo) WHERE ativo = TRUE;
-- CREATE INDEX IF NOT EXISTS idx_alpha_desafios_busca ON alpha_desafios USING GIN(to_tsvector('portuguese', titulo || ' ' || descricao));

-- CREATE INDEX IF NOT EXISTS idx_alpha_submissoes_usuario ON alpha_submissoes(user_id);
-- CREATE INDEX IF NOT EXISTS idx_alpha_submissoes_desafio ON alpha_submissoes(desafio_id);
-- CREATE INDEX IF NOT EXISTS idx_alpha_submissoes_status ON alpha_submissoes(status);
-- CREATE INDEX IF NOT EXISTS idx_alpha_submissoes_data ON alpha_submissoes(submitted_at DESC);

-- ============================================
-- 📂 PORTFÓLIO (Descomentar após criar as tabelas)
-- ============================================
-- CREATE INDEX IF NOT EXISTS idx_portfolios_usuario ON portfolios(user_id);
-- CREATE INDEX IF NOT EXISTS idx_portfolios_status ON portfolios(status);
-- CREATE INDEX IF NOT EXISTS idx_portfolios_criado_em ON portfolios(created_at DESC);

-- ============================================
-- 🎮 GAMIFICAÇÃO (Descomentar após criar as tabelas)
-- ============================================
-- CREATE INDEX IF NOT EXISTS idx_gamification_usuarios_total_pontos ON gamification_usuarios(total_pontos DESC);
-- CREATE INDEX IF NOT EXISTS idx_gamification_usuarios_nivel ON gamification_usuarios(nivel_atual);

-- CREATE INDEX IF NOT EXISTS idx_gamification_pontos_usuario ON gamification_pontos(usuario_id);
-- CREATE INDEX IF NOT EXISTS idx_gamification_pontos_data ON gamification_pontos(data_conquista DESC);
-- CREATE INDEX IF NOT EXISTS idx_gamification_pontos_fonte ON gamification_pontos(fonte);

-- CREATE INDEX IF NOT EXISTS idx_gamification_badges_usuario ON gamification_badges(usuario_id);
-- CREATE INDEX IF NOT EXISTS idx_gamification_badges_tipo ON gamification_badges(tipo_badge);

-- CREATE INDEX IF NOT EXISTS idx_gamification_conquistas_usuario ON gamification_conquistas(usuario_id);
-- CREATE INDEX IF NOT EXISTS idx_gamification_conquistas_tipo ON gamification_conquistas(tipo_conquista);
-- CREATE INDEX IF NOT EXISTS idx_gamification_conquistas_data ON gamification_conquistas(data_conquista DESC);

-- ============================================
-- ✅ COMENTÁRIOS (Descomentar após criar índices)
-- ============================================
-- COMMENT ON INDEX idx_alpha_desafios_busca IS 'Índice full-text para busca de desafios Alpha';
-- COMMENT ON INDEX idx_gamification_usuarios_total_pontos IS 'Índice para ranking de pontos';



TUDO OK