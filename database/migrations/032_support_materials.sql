-- =============================================
-- Migration: 032_support_materials.sql
-- Table: core.support_materials
-- Source CSV: materiais_apoio_rows.csv
-- Generated: 2026-02-28T16:15:03.864Z
-- Rows: 19
-- =============================================

BEGIN;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b21469f-92b9-49d5-af7b-e7ac9ef7b4f2', $$Como Afinar seu Instrumento - Vídeo Tutorial$$, $$video$$, $$tutorial$$, $$Tutorial passo a passo mostrando técnicas de afinação para diferentes instrumentos.$$, NULL, NULL, NULL, NULL, NULL, '["afinacao","manutencao","cuidados"]'::jsonb, NULL, NULL, $$Prof. Priscila Souza$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:29:26.210084'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '34473aaf-e517-46cf-8bd2-251e2da43cea', $$Guia de Percussão Corporal - Nível Iniciante$$, $$pdf$$, $$exercicio$$, $$Manual completo com 15 exercícios progressivos de percussão corporal para desenvolver consciência rítmica.$$, NULL, NULL, NULL, NULL, 1, '["percussao","corpo","ritmo","orff"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:35:52.217455'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '478d0b9a-28a2-43e3-a6d7-1f1da15f4879', $$Jogos de Notação Musical Interativos$$, $$jogo$$, $$jogo$$, $$Conjunto de 10 jogos lúdicos para aprender figuras rítmicas, notas e leitura musical de forma divertida.$$, NULL, NULL, NULL, NULL, 1, '["notacao","leitura","jogos","ludico"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:35:52.217455'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4a97ecdf-e2bc-4ea5-9884-daa25789ecd0', $$Banco de Sons Cotidianos$$, $$audio$$, $$backing_track$$, $$Coletânea com 25 sons do cotidiano para exploração sonora: chuva, carros, pássaros, objetos domésticos.$$, NULL, NULL, NULL, NULL, NULL, '["sons","cotidiano","orff","exploracao"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:35:52.217455'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ffbb74b-e316-4d28-865b-95bd06b088d9', $$Banco de Sons Cotidianos$$, $$audio$$, $$backing_track$$, $$Coletânea com 25 sons do cotidiano para exploração sonora: chuva, carros, pássaros, objetos domésticos.$$, NULL, NULL, NULL, NULL, NULL, '["sons","cotidiano","orff","exploracao"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:43:42.861002'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5033faa5-2907-40d4-b8cd-f765574297e8', $$Tutorial de Afinação por Instrumento$$, $$video$$, $$tutorial$$, $$Série de vídeos curtos mostrando técnicas específicas de afinação para cada instrumento do projeto.$$, NULL, NULL, NULL, NULL, NULL, '["afinacao","manutencao","cuidados","instrumento"]'::jsonb, NULL, NULL, $$Prof. Priscila Souza$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:43:42.861002'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '60388417-1851-4f20-a835-d2e1067076c3', $$Roteiro para Making-Of Musical$$, $$pdf$$, $$tutorial$$, $$Template de roteiro e checklist para produzir making-of e vídeos musicais com equipamento simples.$$, NULL, NULL, NULL, NULL, NULL, '["video","producao","making-of","roteiro"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:43:42.861002'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '65929bea-4bf1-4aa9-b4d3-ecc616426900', $$Apps Gratuitos para Gravação Musical$$, $$link$$, $$tutorial$$, $$Lista curada de aplicativos gratuitos para gravação, edição e criação musical usando celular e tablet.$$, NULL, NULL, NULL, NULL, NULL, '["tecnologia","apps","gravacao","mobile"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:35:52.217455'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6da67eeb-bd2c-41db-8dc7-92452c42ea1f', $$Partituras Japonesas Tradicionais$$, $$pdf$$, $$partitura$$, $$Coletânea de 8 músicas japonesas tradicionais com partituras simplificadas e contexto cultural.$$, NULL, NULL, NULL, NULL, 2, '["japao","tradicional","cultural","partitura"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:43:42.861002'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8cdfe33b-d0f0-475f-b563-d0a1e701bc81', $$Roteiro para Making-Of Musical$$, $$pdf$$, $$tutorial$$, $$Template de roteiro e checklist para produzir making-of e vídeos musicais com equipamento simples.$$, NULL, NULL, NULL, NULL, NULL, '["video","producao","making-of","roteiro"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:35:52.217455'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '90295adc-870a-4075-855f-ed638d852e60', $$Partituras Simplificadas - Repertório Brasileiro$$, $$pdf$$, $$partitura$$, $$Coletânea de partituras simplificadas de clássicos da música brasileira.$$, NULL, NULL, NULL, NULL, 2, '["partitura","brasileiro","mpb"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:29:26.210084'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '914ec3af-bef9-4f46-8f60-110b7bc76dea', $$Tutorial de Afinação por Instrumento$$, $$video$$, $$tutorial$$, $$Série de vídeos curtos mostrando técnicas específicas de afinação para cada instrumento do projeto.$$, NULL, NULL, NULL, NULL, NULL, '["afinacao","manutencao","cuidados","instrumento"]'::jsonb, NULL, NULL, $$Prof. Priscila Souza$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:35:52.217455'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9cc03861-7c06-478e-ad81-31dbc8ac2006', $$Guia de Percussão Corporal - Nível Iniciante$$, $$pdf$$, $$exercicio$$, $$Manual completo com 15 exercícios progressivos de percussão corporal para desenvolver consciência rítmica.$$, NULL, NULL, NULL, NULL, 1, '["percussao","corpo","ritmo","orff"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:43:42.861002'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b1bc982d-c875-4407-9045-7925b8b89f3e', $$Exercícios de Respiração para Instrumentos de Sopro$$, $$pdf$$, $$exercicio$$, $$Série de exercícios progressivos para desenvolver capacidade respiratória e controle de ar.$$, NULL, NULL, NULL, NULL, 1, '["respiracao","sopro","tecnica"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:29:26.210084'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c194c3fa-9e5a-4a89-97b1-8087d62e5cda', $$Backing Track - Asa Branca (Baião)$$, $$audio$$, $$backing_track$$, $$Base musical para praticar a música Asa Branca em diferentes velocidades.$$, NULL, NULL, NULL, NULL, 1, '["baiao","nordeste","pratica"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:29:26.210084'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c2db32f4-1e31-4e53-8f9b-3ecf461e95c3', $$Apps Gratuitos para Gravação Musical$$, $$link$$, $$tutorial$$, $$Lista curada de aplicativos gratuitos para gravação, edição e criação musical usando celular e tablet.$$, NULL, NULL, NULL, NULL, NULL, '["tecnologia","apps","gravacao","mobile"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:43:42.861002'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e07c16f0-66e9-484d-8337-cbb39ccb4d29', $$Jogos Rítmicos para Grupos$$, $$pdf$$, $$jogo$$, $$Manual com 20 jogos rítmicos para desenvolver coordenação motora e trabalho em equipe.$$, NULL, NULL, NULL, NULL, NULL, '["ritmo","grupo","dinamica","orff"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:29:26.210084'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e8a824ec-fc12-45fa-9e6f-4737bd59a2ba', $$Partituras Japonesas Tradicionais$$, $$pdf$$, $$partitura$$, $$Coletânea de 8 músicas japonesas tradicionais com partituras simplificadas e contexto cultural.$$, NULL, NULL, NULL, NULL, 2, '["japao","tradicional","cultural","partitura"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:35:52.217455'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.support_materials (tenant_id, id, title, material_type, category, description, file_url, module_id, methodology_id, instrument_id, difficulty_level, tags, file_size_mb, duration_seconds, author, license, download_count, view_count, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f935df53-3a8c-4144-9d91-f7aee46f3d75', $$Jogos de Notação Musical Interativos$$, $$jogo$$, $$jogo$$, $$Conjunto de 10 jogos lúdicos para aprender figuras rítmicas, notas e leitura musical de forma divertida.$$, NULL, NULL, NULL, NULL, 1, '["notacao","leitura","jogos","ludico"]'::jsonb, NULL, NULL, $$Equipe Nipo School$$, $$uso_educacional$$, 0, 0, true, '2025-09-22 13:43:42.861002'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;