-- =============================================
-- Migration: 045_lesson_checklists_2026.sql
-- Table: core.lesson_checklists
-- Year 2 Curriculum Checklists
-- Generated: 2026-03-01T13:48:29.218Z
-- =============================================

BEGIN;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd3116d9a-ab9e-4ce7-99e4-6f386697cb82', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Sala organizada em roda$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'faa012f9-8157-471c-81df-103e34ef3bb0', '8235b262-bd54-4697-b3bb-7008349b46ac', $$App atualizado e testado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'df90713f-6871-4120-a2c8-978703e246e2', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Projetor/TV preparado para retrospectiva$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dae62f9f-7465-4105-8853-23cd8a088a76', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Fichas de metas impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '81b7b5f6-5e8f-4abd-b74a-cc6425112d6e', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Estações rotativas montadas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '19b6623f-88c6-4060-bc1c-944ee5593061', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Fichas de diagnóstico impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '424151ad-c9c7-4cbf-a147-40721f449af7', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Instrumentos afinados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc8ced31-a8a1-4663-b01f-a1cc9922736d', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$App liberado para uploads$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '94cc1098-5f51-43a8-827a-5717e67c45c2', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Quadro branco preparado com figuras$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ce41d0ba-0990-46a3-89e8-690f66813595', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Apostilas impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a03827c-3ba6-48d1-a62b-0fe065a11420', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Metrônomo disponível$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '134e0ffb-bc4f-4f0a-9147-c610c1a9cc82', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Instrumentos de percussão separados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd200aa54-9bc2-4751-b442-cd9557832f2e', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Teclado/piano disponível para demonstrações$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '889443c5-62d4-4ff4-b998-e22556de0d10', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Material de intervalos impresso$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '12d4afbf-16b5-44e9-ae15-1756c0aa7c18', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Caixas de som para áudios$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f50460b5-73c7-4068-8cd3-2e3265527433', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$App de treinamento auditivo testado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc99f6c8-5359-4b47-ad04-7f84dff434d0', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Cartões coloridos preparados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd5e0ea13-6829-4181-b16b-dcf0a2b5cf8d', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Partituras com dinâmica impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '38c51306-53df-474e-abd6-a0e536c0eb4c', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Instrumentos afinados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '134ca028-8c5a-4e99-a023-6b8d33ef97c9', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Vídeo de demonstração carregado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b612efcd-82f0-48c7-983c-0bbf4250b77d', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Partituras impressas para todos$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '95ba86b1-d0a9-46bd-bbb4-699a52a6c814', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Instrumentos afinados e organizados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b14f7fc3-e344-4df1-afdf-c197890f7b0f', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Playbacks testados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ad302b51-25c1-41e4-86a8-144388f66537', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Fichas de auto-avaliação impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b37193c5-5134-4d5f-ad53-8e097cc39d34', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Exercícios por naipe impressos$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b18fba6a-7b76-4028-ab48-ac0fe6682105', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Metrônomo preparado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bb39f613-cfc6-43e8-b2b5-f290a055aebb', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Estantes de partitura organizadas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '01025570-5fcb-4ef3-8787-2f54e7a2c645', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Instrumentos afinados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '33195a4f-dc2b-4db7-a4a8-402cf2ed4469', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Material de ornamentos impresso$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75d2224d-c8ce-4221-badc-dd8f35989268', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Vídeos de demonstração preparados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '31ce57b7-764e-4c57-a4fc-5a7fc5912e23', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Instrumentos afinados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8e7fe0da-17b0-4b6e-aab1-c41b9bd0f94f', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$App liberado para uploads$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '717f387d-2659-42e9-ace7-62c91460008f', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Quadro com mapa de escalas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ba96ce9b-a2ce-4204-8957-d98d295ea477', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Playbacks modais testados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e65a482d-6e53-4483-9ba6-0b581cbcf8cf', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Instrumentos afinados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '802657c3-48ad-41b9-aae9-ed59fe81d24f', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Material impresso distribuído$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6b274dc1-09a4-4261-94cd-8e65242eaadc', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Teclados/violões disponíveis$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ad44d7f2-c8b3-4c4e-a0ea-3b9aca39e8c8', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Tabelas de acordes impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'de809fc0-7a04-476d-acbc-aa7bc0d6e4cf', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Cifras da canção distribuídas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '74f54f51-1728-40ef-991e-4ef3863f4d3e', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Bases harmônicas testadas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a21414ed-2a74-4a52-b24d-3fc99dee20eb', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Partituras e cifras impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd9241f0d-5007-41b8-accb-9f391524da75', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Projetor para quiz de leitura$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e22c6038-db5b-430e-9a14-ce17c7999f36', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Instrumentos afinados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '443d8002-dfb5-481f-9515-0576c8b3f3aa', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Gravação de referência preparada$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91f49715-9e16-4dd7-95dd-96ba22fec81a', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Espaço organizado como mini-palco$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '674f5490-e7f4-4573-938f-e9b984f19e52', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Fichas de avaliação impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '18b0afcf-0cc9-47c9-ba2a-412f6a97c1b9', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Câmera/celular para gravação$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e41fad2f-5fdc-4b86-b018-05301c2be727', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Premiações preparadas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6a7b937c-11bb-4e44-92a8-b3d6df0127ec', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Material de composição impresso$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '526f364b-9be0-47fe-a590-36e4ec7634d0', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Caixas de som para escuta analítica$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '73054370-3d63-4f51-8a47-b3d84987b515', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Folhas grandes e canetas disponíveis$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6800aa0c-6956-4676-82f9-396d9feb011f', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$App liberado para uploads de áudio$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '961c57cd-fd63-4aa0-9128-c4c757c27170', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Material de escrita distribuído$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9473603-417c-4022-ab8b-3bb156b317e2', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Bases instrumentais preparadas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4618c79f-3282-45db-a534-86db0d52f57e', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Dicionário de rimas disponível$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '358bb26b-fa23-404a-885b-9641169479ad', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Espaço silencioso para criação$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5351df7f-02af-4405-9bb6-326d3fa852bd', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Melodias-base impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '40019f3d-725d-43ce-8194-504ed5841390', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Fichas de arranjo impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8eebe147-e219-462d-863b-533f3ac9fd68', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Exemplos de arranjo preparados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fde56203-0d58-45ee-bea5-8771c28aeea6', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Instrumentos por naipe organizados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dce93fa5-da69-4462-ad4e-327becab745a', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Partes por naipe impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dbdaae5c-a5b4-402e-927e-fd5942e140cc', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Salas/espaços para ensaio separado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c62ffb4-2640-43e2-8d99-a84a804f27e8', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Gravação de referência testada$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7091c680-d0b5-40e0-adcf-f73b78b6edda', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Cronômetro para gerenciar ensaios$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8c398928-a8f3-4d69-8530-a66e5bdfe1b8', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Celulares/tablets carregados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd75f23b7-a856-4e3d-bd47-8deef62d366d', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Apps de DAW instalados e testados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd304be24-4b3c-42df-933f-2981146f34ef', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Fones de ouvido disponíveis$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '28be4082-42c4-4527-bbe2-1a86815dda9b', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Wi-Fi estável$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b022fd04-cd6d-43ae-8a46-73db2c521ac5', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Microfone e interface testados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '23345746-efd5-4335-b9a5-e440fef6499c', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Software de gravação instalado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3fc71959-e244-49de-ad1f-685ff957617f', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Ambiente acústico preparado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bcb71f7b-c6f1-4e67-9057-67950a36fd02', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Fones de ouvido para mixagem$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4feee3bf-92a7-4497-89cb-4c37a62e5e54', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Instrumentos de percussão separados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c679352b-b943-44ee-85e2-bf998602451d', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Vídeo documentário preparado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '95b80da5-3bea-46ea-8a1e-6024624ef9c3', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Material cultural impresso$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'afafeee4-a312-4ffb-ad68-a7d6dd6a7edb', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Espaço para dança e movimento$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '446c2eaa-a984-4bde-95e2-82035e40404c', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Material de referência impresso$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'edddaa3c-77b3-48f7-bca8-29031f84a883', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Partituras distribuídas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a1392d5c-0677-4c7e-9fa7-46edd989ef9f', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Áudios de gêneros latinos testados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b90ee036-f339-4f3c-a787-4bf6b9dc981d', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Instrumentos de percussão latina disponíveis$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '68a6fac4-0733-482d-aa17-49c44a71c52b', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Material de escalas japonesas impresso$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8cc9ac60-2f70-4539-bae2-bf1c4dac9495', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Vídeos de instrumentos tradicionais preparados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd8e470dd-da26-4ed5-8666-bb2f5d729f11', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Partituras adaptadas distribuídas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd36c4f33-37e4-4676-9642-8177c61072b2', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Espaço preparado para prática$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b7abd5e-c1b4-4b31-9517-e8e826a2d2a3', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Playbacks de blues preparados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9614a3df-bd2d-4583-9bcf-88418cabd0b4', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Partituras de blues impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '643c3a4c-47d9-440d-b906-4416520b155d', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Linha do tempo visual montada$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc57c869-5fa5-485b-9de0-955e410fc74d', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Instrumentos afinados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a74775fe-ef4e-4f8a-95bf-7ca1badcf182', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Lista de músicas atuais preparada$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '902032e4-52a8-4129-b24a-deb4c87c3270', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Caixas de som para escuta$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '69283be0-6446-4c3b-a48a-f7b7721fe6c1', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Instrumentos organizados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1b5e719-100e-46be-b288-9aff7d831d47', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$App preparado para enquete$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0a37dc78-2bad-4a2c-ad47-353eb850b3b5', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Espaço de mini-palco preparado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd7d14090-3f50-4501-97a3-57ed2f53e6a1', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Fichas de avaliação impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7c49014f-7ff8-419d-a87c-2c7955d2b077', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Câmera para gravação$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '685be9d6-6088-4465-9067-37e01dcff57d', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Certificados e premiações prontos$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '26975d23-7e12-4664-ba5a-9f1ce0e74f97', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Espaço simulando palco preparado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '22c9bfee-b788-4817-b401-88b38c9f5ba2', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Microfone e som testados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e6d3bf26-76c1-480a-b6ef-4c99cdd210e3', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Vídeos de referência preparados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '52464676-c6dc-41be-b3b9-10dfd45f0dc4', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Exercícios de teatro impressos$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0617c477-a657-4b15-9075-109dc00f23cb', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Equipamento de som disponível e testado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7df0ae87-b668-438e-83f6-c4aa31c46ab4', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Cabos e adaptadores suficientes$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6b571232-e323-4a9c-8dde-5c20a23ef487', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Diagrama de conexões impresso$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61b9d27d-08ea-4454-92b0-20ad570dd681', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Espaço seguro para prática$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f64a465c-bc7d-4277-959f-73da614f86df', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Playbacks de jam preparados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd403c448-9344-4d4f-b3f1-14dc32335115', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Mapas de escalas impressos$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bfa40aba-d1a8-48fa-89e0-8ad17374bfef', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Instrumentos afinados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a6f98d41-f662-4908-8779-ba1cd612e0bf', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Espaço organizado para jam session$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc6d760b-5144-4ad9-8fe9-beebb95d0a22', 'd98bb535-a591-4262-97be-a8e909038c93', $$Partituras para formações distribuídas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9b62c1e2-354e-483d-b5d8-aa14a6f72d29', 'd98bb535-a591-4262-97be-a8e909038c93', $$Espaços separados para ensaio$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4b2909f-24f2-4000-8515-c63dd3640fdb', 'd98bb535-a591-4262-97be-a8e909038c93', $$Ambiente silencioso preparado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7b05a819-9c61-4024-9743-63e1f1cf8fbd', 'd98bb535-a591-4262-97be-a8e909038c93', $$Câmera para gravação acústica$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d0d39c5-6618-419d-b9f6-96e0259ded8c', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Fichas de projeto impressas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '699d9276-1cc8-4726-bd90-ba6880db7d28', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Lista de repertório disponível$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9e0da4ef-748a-4852-bfa6-7b996a3e57dd', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Folhas grandes e canetas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8d437343-6cba-4313-9581-2b0d76e9b867', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$App preparado para postagens$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5abad087-d180-412d-be74-70922a975802', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Espaços de ensaio por grupo preparados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '714dddc8-55e8-4e3b-b417-4ef24ef87874', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Partituras de cada grupo disponíveis$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6817c7b9-f943-4f4d-82bd-f46b26125dae', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Metrônomos e afinadores distribuídos$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa7ab9fe-9b7e-48b7-96fb-bd97dcf94ff9', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Professor com roteiro de orientação$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f69cee45-a628-4a60-8a57-cdefdfae2c66', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Celulares carregados para filmagem$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2b2db49d-87b2-41c7-b405-4b5fea8b616b', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Apps de edição instalados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '14e53be8-b75a-416d-ac01-f8657fd54be0', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Espaços para filmagem preparados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6378a98d-5fa7-427e-9567-bbae7c53db70', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Templates de storyboard impressos$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9017c061-2a03-4f74-9454-96ce51b97e83', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Material de referência preparado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7bb0a120-9272-4a75-b17a-e17672a918e4', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Repertório acessível selecionado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f1875a42-275a-4667-9c8a-9430ecd6af51', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Vídeo de documentário pronto$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e5a0df9e-735f-4405-b50e-29b11011c0f1', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Espaço para ensaio em grupo$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9e61fa36-2ed4-4aee-85ad-9fec660cfaa1', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Partituras completas impressas e distribuídas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ade24488-58be-446f-8a2d-c350a0ed069e', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Gravações de referência preparadas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b708414f-10b3-4e2d-a86a-06b292151cf5', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Mapa de palco definido$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b39e57b3-fa92-4423-bc48-8d8fda0b7031', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Setlist oficial finalizado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b3433e18-37ad-44d1-8b6d-30d144673fc4', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Partituras com marcações atualizadas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '07b09160-24f9-4332-9c0d-558fac0c8d59', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Roteiro do show impresso$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '63b10661-cad7-4e8e-a1ff-c43b114edcba', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Gravações de referência testadas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a7b75de-209b-4ed4-af2d-3defaafdcdf4', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Lista de correções distribuída$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a6d28de3-2d62-4d86-b8fc-7beda54e24a3', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Espaço simulando palco completo$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5867f325-ca23-4bb0-bec4-734e86d81fa7', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Roteiro de palco distribuído$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '945d721a-a1c6-4704-a1e5-f9ff7262d7a8', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Cronômetro preparado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe6d00d5-76fc-4071-9133-9fae8bcd31dc', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Câmera para gravar o ensaio$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab769669-9f9e-4870-b4ca-932f46d4086a', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Lista de correções revisada$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b7f183af-0ff4-463d-8601-ff0d3b85d4c9', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Partituras atualizadas$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '633a1480-98bd-4a67-a326-8c1b04930af9', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Protocolo de emergência distribuído$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e375d844-5eef-45d6-b12c-2b1bb313586d', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Click track testado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1e11ba5a-19a7-456c-a875-65a9034adab0', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Espaço de apresentação reservado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8f42ebd4-a7cb-437e-9e9a-f1492a00b49a', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Sistema de som montado e testado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b3e1d737-eaa7-4db0-be00-90c52b4fefd0', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Figurinos conferidos$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2a928506-0883-44c3-a180-0ffcb6ff51fe', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Iluminação preparada (se disponível)$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3be0eae9-5e4c-4677-81da-b222d86cfe60', 'b3733049-d482-4882-a484-e092fe79324d', $$Todos os elementos de produção testados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b9949dd2-fb3f-47e3-9ef6-ccdb4a9bc40f', 'b3733049-d482-4882-a484-e092fe79324d', $$Certificados impressos e conferidos$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8628cdb0-5d12-4fcf-a21c-d268db04c244', 'b3733049-d482-4882-a484-e092fe79324d', $$Roteiro da cerimônia finalizado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9eaa55ce-2a67-4ab8-86c7-4cb2dc00a728', 'b3733049-d482-4882-a484-e092fe79324d', $$Convites distribuídos para famílias$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c8aa5a53-090d-4fd2-8c79-a2fecd74200b', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Local do evento reservado e acessível$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1f42036c-5d46-453b-ab22-6d0bcaf7a7db', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Sistema de som completo no local$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b85c8fde-b9d0-4bf6-827d-4c2c3c693a66', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Kit de emergência preparado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '842d08a1-842f-45fa-9721-da0a23389deb', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Cronograma do dia distribuído$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2ab2b262-f9b2-4f22-9919-4f3b59f5ee42', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Local do evento preparado e decorado$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '45fb6186-b5b9-4221-9b1f-cb5598a70bfa', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Sistema de som testado e funcionando$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3c6c214d-d77e-4e15-b78f-eac7b476efeb', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Certificados e premiações organizados$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '44628e52-b897-4bb7-957d-0fb340f49146', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Confraternização organizada (comida, bebida)$$, $$preparation$$, false, '2026-03-01 00:00:00.000000+00'::timestamptz, '2026-03-01 00:00:00.000000+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

-- Total: 160 checklist items
COMMIT;