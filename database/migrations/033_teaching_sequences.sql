-- =============================================
-- Migration: 033_teaching_sequences.sql
-- Table: core.teaching_sequences
-- Source CSV: sequencias_didaticas_rows.csv
-- Generated: 2026-02-28T16:15:03.870Z
-- Rows: 3
-- =============================================

BEGIN;

INSERT INTO core.teaching_sequences (tenant_id, id, title, methodology_id, age_range, duration_weeks, objectives, week_number, main_activity, circle_activity, game_dynamic, required_materials, notes, created_by, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05296eba-16a5-47d5-86be-51a9d8e9e2b3', $$Sons do Corpo e Exploração Rítmica$$, NULL, $$6-7 anos$$, 3, $$["Desenvolver percepção rítmica e musicalidade através do corpo","Estimular criatividade, coordenação motora e socialização"]$$, 1, $$Descobrindo os Sons do Corpo (palmas, estalos, batidas no peito, pés)$$, $$Cada criança faz um som; grupo imita$$, $$Jogo de sequência de sons (Simon musical)$$, $$["Apenas o corpo","Espaço para movimento"]$$, NULL, NULL, '2025-09-22 13:29:43.16074'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.teaching_sequences (tenant_id, id, title, methodology_id, age_range, duration_weeks, objectives, week_number, main_activity, circle_activity, game_dynamic, required_materials, notes, created_by, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c01c6229-2e72-4799-b8fd-2fec9feaee81', $$Sons do Corpo e Exploração Rítmica$$, NULL, $$6-7 anos$$, 3, $$["Desenvolver percepção rítmica e musicalidade através do corpo","Estimular criatividade, coordenação motora e socialização"]$$, 2, $$Ritmos do Cotidiano (usar objetos como lápis, cadeiras, garrafas)$$, $$Criação de batidas em grupo, passando o ritmo de um para o outro$$, $$Ritmo viajante (cada um acrescenta um som à sequência)$$, $$["Lápis","Cadeiras","Garrafas","Objetos diversos"]$$, NULL, NULL, '2025-09-22 13:29:43.16074'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.teaching_sequences (tenant_id, id, title, methodology_id, age_range, duration_weeks, objectives, week_number, main_activity, circle_activity, game_dynamic, required_materials, notes, created_by, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e421c1b1-80dc-4d0b-8ed5-9e13b7590578', $$Sons do Corpo e Exploração Rítmica$$, NULL, $$6-7 anos$$, 3, $$["Desenvolver percepção rítmica e musicalidade através do corpo","Estimular criatividade, coordenação motora e socialização"]$$, 3, $$Canções de roda e movimento (integração com dança/euritmia)$$, $$Cantar e movimentar conforme a música (usar músicas folclóricas, sazonais)$$, $$Roda de conversa, cada criança fala de um som/música que gostou$$, $$["Música folclórica","Espaço para dança"]$$, NULL, NULL, '2025-09-22 13:29:43.16074'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;