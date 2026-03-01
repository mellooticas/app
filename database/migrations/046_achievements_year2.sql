-- =============================================
-- Migration: 046_achievements_year2.sql
-- Year 2 achievements + practice achievements
-- =============================================

BEGIN;

-- ── Year 2 Progress Achievements ──

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000001', $$Veterano Musical$$, $$Complete 35 aulas no total - voce ja esta no Ano 2!$$, $$🎖️$$, $$#D69E2E$$, 75, 'progress', $$lessons_completed$$, 35, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000002', $$Meio Caminho$$, $$Complete 45 aulas - metade da jornada completa!$$, $$⚡$$, $$#DD6B20$$, 100, 'progress', $$lessons_completed$$, 45, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000003', $$Quase Mestre$$, $$Complete 55 aulas - a maestria esta proxima!$$, $$🔮$$, $$#805AD5$$, 150, 'progress', $$lessons_completed$$, 55, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000004', $$Mestre Completo$$, $$Complete 65 aulas - dominou quase tudo!$$, $$🏅$$, $$#E53E3E$$, 200, 'progress', $$lessons_completed$$, 65, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000005', $$Lenda da Musica$$, $$Complete todas as 70 aulas - voce e uma lenda!$$, $$👑$$, $$#FFD700$$, 500, 'progress', $$lessons_completed$$, 70, true)
ON CONFLICT (id) DO NOTHING;

-- ── Points Milestones ──

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000006', $$Colecionador de Ouro$$, $$Acumule 2000 pontos no total$$, $$🥇$$, $$#D69E2E$$, 150, 'special', $$total_points$$, 2000, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000007', $$Colecionador de Diamante$$, $$Acumule 5000 pontos - diamante puro!$$, $$💠$$, $$#3182CE$$, 300, 'special', $$total_points$$, 5000, true)
ON CONFLICT (id) DO NOTHING;

-- ── Streak Achievements ──

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000008', $$Duas Semanas de Fogo$$, $$Mantenha uma sequencia de 14 dias$$, $$🔥$$, $$#E53E3E$$, 100, 'consistency', $$days_streak$$, 14, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000009', $$Disciplina Samurai$$, $$Mantenha uma sequencia de 60 dias - disciplina oriental!$$, $$⚔️$$, $$#2D3748$$, 500, 'consistency', $$days_streak$$, 60, true)
ON CONFLICT (id) DO NOTHING;

-- ── Practice Achievements ──

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000010', $$Praticante Iniciante$$, $$Registre 10 sessoes de pratica$$, $$🎵$$, $$#48BB78$$, 30, 'progress', $$total_points$$, 50, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000011', $$Praticante Dedicado$$, $$Registre 30 sessoes de pratica$$, $$🎶$$, $$#38A169$$, 75, 'progress', $$total_points$$, 150, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000012', $$Mestre da Pratica$$, $$Registre 100 sessoes de pratica - pratica leva a perfeicao!$$, $$🎼$$, $$#276749$$, 200, 'progress', $$total_points$$, 500, true)
ON CONFLICT (id) DO NOTHING;

-- ── Graduation Achievement ──

INSERT INTO core.achievements (tenant_id, id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0000001-a200-4000-b000-000000000013', $$Formado Nipo School$$, $$Complete a Formatura 2026 - parabens formando!$$, $$🎓$$, $$#2B6CB0$$, 1000, 'milestone', $$lessons_completed$$, 70, true)
ON CONFLICT (id) DO NOTHING;

COMMIT;
