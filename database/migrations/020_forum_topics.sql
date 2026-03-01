-- =============================================
-- Migration: 020_forum_topics.sql
-- Table: core.forum_topics
-- Source CSV: forum_perguntas_rows.csv
-- Generated: 2026-02-28T16:15:03.624Z
-- Rows: 11
-- =============================================

BEGIN;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '07a0776c-ad94-498e-8402-672c1626a23b', 'a57eeb22-a246-4243-8e32-98297c6f3bad', $$Quais apps vocês recomendam para iniciantes?$$, $$Vi na aula 16 sobre apps musicais. Quais são os melhores para quem está começando e são gratuitos?$$, $$pratica$$, '2025-09-22 13:36:04.89978'::timestamptz, '2025-09-22 13:36:04.89978'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1e60fd9b-5806-4bd9-80e7-cf85ca5bed22', '54e79a05-59f7-4cc8-b67f-f522a1b452e4', $$Como treinar em casa sem incomodar os vizinhos?$$, $$Moro em apartamento e quero treinar mais, mas tenho medo de incomodar. Existem alternativas para treinar em casa?$$, $$pratica$$, '2025-09-22 13:29:10.251136'::timestamptz, '2025-09-22 13:29:10.251136'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '309f2740-b4f3-4a97-a9fb-9a944f10212f', '54e79a05-59f7-4cc8-b67f-f522a1b452e4', $$Como gravar com celular sem ruído de fundo?$$, $$Na aula de tecnologia musical tentei gravar mas sempre fica com ruído. Tem alguma dica para melhorar a qualidade?$$, $$tecnica$$, '2025-09-22 13:36:04.89978'::timestamptz, '2025-09-22 13:36:04.89978'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '567c221e-d7db-47f6-a383-8b20781f9b8f', '54e79a05-59f7-4cc8-b67f-f522a1b452e4', $$Como gravar com celular sem ruído de fundo?$$, $$Na aula de tecnologia musical tentei gravar mas sempre fica com ruído. Tem alguma dica para melhorar a qualidade?$$, $$tecnica$$, '2025-09-22 13:43:55.50021'::timestamptz, '2025-09-22 13:43:55.50021'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '63149b6b-4f8b-4aee-b5e8-942da6f2103d', '54e79a05-59f7-4cc8-b67f-f522a1b452e4', $$Como formar uma dupla musical?$$, $$Quero participar da oficina de bandas mas sou tímida. Como encontrar alguém compatível para formar dupla?$$, $$geral$$, '2025-09-22 13:43:55.50021'::timestamptz, '2025-09-22 13:43:55.50021'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '82fe8bd6-b22a-425f-a468-15df48ce6a6c', '54e79a05-59f7-4cc8-b67f-f522a1b452e4', $$Como melhorar minha postura no instrumento?$$, $$Estou com dificuldade para manter a postura correta durante as aulas. Meu pescoço dói depois de tocar por alguns minutos. Vocês têm dicas?$$, $$tecnica$$, '2025-09-22 13:29:10.251136'::timestamptz, '2025-09-22 13:29:10.251136'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91d58a9a-7173-4a58-afae-8fac45a201e4', 'a57eeb22-a246-4243-8e32-98297c6f3bad', $$Qual a diferença entre ritmo e tempo?$$, $$Na aula de alfabetização musical ficei confusa sobre ritmo e tempo. Alguém pode explicar de forma simples?$$, $$teoria$$, '2025-09-22 13:29:10.251136'::timestamptz, '2025-09-22 13:29:10.251136'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c7dc3e9b-9f48-44ec-8d4a-b330356f5fe3', 'a57eeb22-a246-4243-8e32-98297c6f3bad', $$Dicas para não errar na apresentação final?$$, $$Estou nervosa para o show final. Alguém tem dicas de como controlar ansiedade no palco?$$, $$geral$$, '2025-09-22 13:36:04.89978'::timestamptz, '2025-09-22 13:36:04.89978'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1ff88e4-e5bd-4e9e-855e-084902fa7caa', 'a57eeb22-a246-4243-8e32-98297c6f3bad', $$Dicas para não errar na apresentação final?$$, $$Estou nervosa para o show final. Alguém tem dicas de como controlar ansiedade no palco?$$, $$geral$$, '2025-09-22 13:43:55.50021'::timestamptz, '2025-09-22 13:43:55.50021'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2c49d73-2b7f-4a29-9bae-139357c4bd08', '54e79a05-59f7-4cc8-b67f-f522a1b452e4', $$Como formar uma dupla musical?$$, $$Quero participar da oficina de bandas mas sou tímida. Como encontrar alguém compatível para formar dupla?$$, $$geral$$, '2025-09-22 13:36:04.89978'::timestamptz, '2025-09-22 13:36:04.89978'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.forum_topics (tenant_id, id, author_id, title, content, category, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f5c924ee-87bb-4a2d-af75-723cc73bcc42', 'a57eeb22-a246-4243-8e32-98297c6f3bad', $$Quais apps vocês recomendam para iniciantes?$$, $$Vi na aula 16 sobre apps musicais. Quais são os melhores para quem está começando e são gratuitos?$$, $$pratica$$, '2025-09-22 13:43:55.50021'::timestamptz, '2025-09-22 13:43:55.50021'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;