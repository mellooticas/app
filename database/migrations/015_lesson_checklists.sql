-- =============================================
-- Migration: 015_lesson_checklists.sql
-- Table: core.lesson_checklists
-- Source CSV: aula_checklist_rows.csv
-- Generated: 2026-02-28T16:15:03.564Z
-- Rows: 112
-- =============================================

BEGIN;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '02f0dcc7-ce03-483c-86a7-529dd890108d', '57abf3d9-0c1a-4903-a518-81d88c4b7544', $$Espaço para apresentações preparado$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '03cc1576-14eb-49e5-b20e-0f98c08cda3f', '494c3d0d-692b-4509-b90b-b92bd1345eb1', $$Espaço preparado para simulação$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0810a563-722b-4ed0-a00a-57256ef4f7a4', 'b154f8a4-d7be-40b8-8bde-c64d409bde2b', $$App testado nas contas dos alunos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0d65f651-2c4f-4d03-943c-68673e7e7efd', '1e357f0c-44ee-4f3b-a39a-851d4f5220b6', $$App liberado para uploads$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0f654c01-c5b4-49ab-bb20-cdd4f7ebba3a', '1e357f0c-44ee-4f3b-a39a-851d4f5220b6', $$PDFs, slides, apps prontos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '101147e1-69bd-4a17-ac92-ed1890d43fef', '1168d1e0-4f46-4970-876e-6dc5f2d1f21c', $$Instrumentos afinados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1021beb0-9cae-44e0-9af7-36acfeaf08ef', 'a7d5335f-94f1-4646-8bc4-cc0c4cd663ea', $$App pronto para receber postagens de encerramento$$, $$evaluation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '128f9981-01a6-4afb-b9e3-ac59e629cfbf', '65e4f168-9b96-41e4-b0e7-a79d090fa7aa', $$Músicas e repertório impresso/disponível$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1385c3cb-ef8d-451e-9b1b-5a61951759b5', '3d52bedb-3cb0-4ccc-86bf-6eddd4632364', $$Sala organizada para livre movimentação$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '13ccfd7d-b063-4fbb-88d3-e20a8efffd16', '2a1cd10b-89d2-45f0-a051-93cdf98bc888', $$PDFs liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '14549b14-6c54-4e50-970c-b05e58994a86', 'f925d0ab-4eb4-4502-aad5-5b617d0db260', $$Espaço organizado para gravação$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b02645e-d186-4505-ba30-6c199361c10d', '37b53845-821a-4d7e-9b13-2598e34a42ff', $$App testado para uploads e feedback$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1ba355f7-8d9b-46d6-932f-fe3932ec86a2', 'f4ef0c67-c714-4152-a0c3-644d09d94d9d', $$App da escola testado para uploads$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1cb1934a-41b8-44db-bfb3-1a1bd2047664', '86fcfcbc-59fb-4769-8435-8bc12d2ed432', $$Presença/avaliação prontas para registro$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1fc2ef9c-6543-45e2-9973-ab8929f4683f', 'b154f8a4-d7be-40b8-8bde-c64d409bde2b', $$Materiais e links liberados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '212d08b0-8550-4315-affa-49b362a2148a', '923053d3-e54a-4698-9517-a46397c0584c', $$Instrumentos e apps preparados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '22357442-ab58-44b8-92a5-e906b084e5f7', 'c368b564-6704-4c95-9d82-b2672babead5', $$Quadro para escrever cifras$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '24eb39f0-bfd7-41de-9cca-646703a9e08c', 'c368b564-6704-4c95-9d82-b2672babead5', $$PDFs/slides prontos no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '277b9edf-174b-48cd-9a5f-d6b197387b61', 'fe1d98e4-3a4c-4cd2-a68e-b5b3a8e2e51c', $$Materiais revisados e disponíveis$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2a7f9e5b-c8c7-4ca4-8929-af1d750c4cf7', '65e4f168-9b96-41e4-b0e7-a79d090fa7aa', $$App liberado para uploads/comentários$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2acd31f6-2a04-40fa-8604-7a6928720d68', 'd5291adc-06b1-47d7-ba66-1735ec3c3a24', $$Cartões e PDFs prontos/disponíveis$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2c4d079a-73c6-4482-bef2-ac2032cca0fa', '37b53845-821a-4d7e-9b13-2598e34a42ff', $$PDFs/vídeos de apoio liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2ec30a44-c0dd-4119-ad16-b16f25f06e4c', 'ec18f04f-e44f-4a0f-97d1-bb4eadb3931a', $$Partituras/impressos organizados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '33dc5ddd-4c0c-45a3-be18-608807535f09', '37b53845-821a-4d7e-9b13-2598e34a42ff', $$Presença/feedback registrados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '380ee948-5db7-4573-8fa2-dd1cd30bd21c', '053b763b-5606-42bc-b02a-a94364239a74', $$Instrumentos afinados e prontos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b3d1259-003d-44ab-9796-ac52fdf9868e', '59d864ba-84ca-47e1-b31d-b5819021a986', $$Materiais digitais liberados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3e4df7f1-58dc-4f3d-a680-14d35162a309', 'ec18f04f-e44f-4a0f-97d1-bb4eadb3931a', $$App testado para uploads de vídeos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3ec2223d-9947-463b-8c5a-2ffaf1bc59ac', '59d864ba-84ca-47e1-b31d-b5819021a986', $$Espaço organizado para apresentações$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4001226d-2d4e-4ec0-ad06-6c7e4b044b84', '86fcfcbc-59fb-4769-8435-8bc12d2ed432', $$Sala arrumada (espaço para roda/círculo)$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '44b89a8f-1cb5-4a05-86bb-19b010695df6', '86fcfcbc-59fb-4769-8435-8bc12d2ed432', $$App testado e com login funcionando para todos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '46a5a60b-f39e-416e-a13c-1dfad3829996', 'c368b564-6704-4c95-9d82-b2672babead5', $$App liberado para uploads/comentários$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '46c2e77c-e833-48ba-92cb-075d690d4d90', '3d52bedb-3cb0-4ccc-86bf-6eddd4632364', $$PDFs/vídeos liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '472789eb-443e-4070-bc5d-1f3c796d4c8e', '1f48497c-d8e0-4a9b-b9d1-75b3df353047', $$Instrumentos e base rítmica prontos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '47c1f226-91f9-4a64-8d4c-796109ee721a', '57abf3d9-0c1a-4903-a518-81d88c4b7544', $$PDFs e slides prontos no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4b966f6e-68bb-4eb5-adf1-4b2ccfd0014a', '1e357f0c-44ee-4f3b-a39a-851d4f5220b6', $$Espaço para grupos/duplas$$, $$evaluation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4b9c02a2-b525-4bb0-bb72-0fab628fc483', '14e59217-40f5-4163-b724-e911314d213a', $$PDFs e slides liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '544ce6a5-135b-44de-9800-d14cfbe3aabd', '1168d1e0-4f46-4970-876e-6dc5f2d1f21c', $$PDFs e slides liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '57752b15-c0af-4fdc-bf9e-c38cd44c8fee', 'eb103e6c-7aa9-43ab-8b2e-ac7dfcde918f', $$Instrumentos e microfones preparados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '59d982b9-a4ba-479f-bb72-c49af88e7946', '57abf3d9-0c1a-4903-a518-81d88c4b7544', $$App testado para uploads/reflexões$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ad331f8-f050-4ef3-9a05-fc9cab977af7', '3d52bedb-3cb0-4ccc-86bf-6eddd4632364', $$App testado para uploads criativos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ae96bdc-8002-4a74-a240-4dd9538cfcbe', 'eb103e6c-7aa9-43ab-8b2e-ac7dfcde918f', $$Espaço organizado para simulação de palco$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c038855-9312-4642-b062-10c5046e9ce5', 'ec18f04f-e44f-4a0f-97d1-bb4eadb3931a', $$Espaço preparado para ensaio coletivo$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5f8c2ea7-828e-4c1e-95ef-0da871e568bd', '053b763b-5606-42bc-b02a-a94364239a74', $$Partituras completas$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '625196a6-6f57-4938-8f34-2972d40e5242', '2a1cd10b-89d2-45f0-a051-93cdf98bc888', $$App testado para uploads$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '645ef08b-468b-401e-976b-bca4e58fc120', '1168d1e0-4f46-4970-876e-6dc5f2d1f21c', $$Vídeos culturais preparados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6496b1f6-df40-463e-8c67-ba914ca3f577', '0beed730-fa51-467d-9805-9415149ba916', $$Cifras e letras impressas ou projetadas$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '653df7e2-bf8b-42d5-b70e-43ff20895c55', 'd5414bcb-4d76-4cb0-bf0a-8f166cca5b47', $$PDFs/vídeos liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6986d6ef-736a-47f1-b20c-ee9a2553b7a3', 'c23b8c68-a284-4c6d-82c8-8f54d00b3e00', $$PDFs/vídeos liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6b5bc103-df40-458d-a9cb-6380c47d870c', 'a7d5335f-94f1-4646-8bc4-cc0c4cd663ea', $$Instrumentos e equipamentos prontos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6f606ac9-eb91-46ed-a4ea-5d907cf3bf34', 'f925d0ab-4eb4-4502-aad5-5b617d0db260', $$Celulares/tablets carregados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6f7ca862-fbe0-48ae-b6d7-e2654e370448', '86fcfcbc-59fb-4769-8435-8bc12d2ed432', $$Materiais digitais liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '72fd19fc-404a-4b92-ac76-f9141069242c', '5b8d46c4-0bed-4f6b-b743-615035679b6b', $$App liberado para uploads/comentários$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '777dd35c-ead0-46f6-8f9d-9c04dbb146f1', 'f4ef0c67-c714-4152-a0c3-644d09d94d9d', $$PDFs/slides liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7b7dbea4-0752-404f-9853-4cefc93d01c7', '37b53845-821a-4d7e-9b13-2598e34a42ff', $$Sala organizada para prática em grupo$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7be27a11-37bd-450d-b206-2b3670d790d9', 'fe1d98e4-3a4c-4cd2-a68e-b5b3a8e2e51c', $$App testado para uploads e comentários$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7c1fb53e-3033-4ab3-872f-ca7309e7fa48', 'eb103e6c-7aa9-43ab-8b2e-ac7dfcde918f', $$PDFs/slides disponíveis no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7d2d46e8-5a79-4758-970e-0ddf36108623', '494c3d0d-692b-4509-b90b-b92bd1345eb1', $$Cronograma do show impresso ou projetado$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '854388d3-9df0-4ee9-b2c7-5151110eac00', '14e59217-40f5-4163-b724-e911314d213a', $$App testado para uploads/coletivos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '85c966f5-c289-4c3b-bd77-7d69f59580d4', 'a7d5335f-94f1-4646-8bc4-cc0c4cd663ea', $$Espaço preparado e testado (som, iluminação, palco)$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '87d57e80-10b3-4b8e-af31-33a5d29d1153', '1f48497c-d8e0-4a9b-b9d1-75b3df353047', $$Espaço organizado para roda/grupo$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '884d3a2d-1500-4814-930d-63fbe34b6e13', '2b58068f-1294-44e2-b9b9-365ef995372d', $$App testado, jogos digitais liberados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '892ccef5-d8b7-484a-b21b-b8f865b4d507', '5b8d46c4-0bed-4f6b-b743-615035679b6b', $$PDFs, slides, áudios prontos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8e75a756-5ece-4598-9b1b-f3f1f35a7271', '2b58068f-1294-44e2-b9b9-365ef995372d', $$Cartões, PDFs, materiais prontos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '90ca5d2a-5bd0-4cd9-b5a6-0d3167d44066', '9ae951f2-e006-4afd-a07e-1ad588afcd09', $$Afinadores e apps testados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '93265b93-4b91-4a15-8752-ea9b8e5b3c6d', 'f925d0ab-4eb4-4502-aad5-5b617d0db260', $$App testado para upload de vídeos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '95bd0420-f8ae-4510-b184-2d8b2feaa294', '9ae951f2-e006-4afd-a07e-1ad588afcd09', $$Espaço para limpeza$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '96c8075d-cf3a-436e-b92a-5bb64b935b5e', '494c3d0d-692b-4509-b90b-b92bd1345eb1', $$Instrumentos prontos e afinados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '987f5ab9-4ed7-4658-b0f9-5010707761df', 'eb103e6c-7aa9-43ab-8b2e-ac7dfcde918f', $$App testado para uploads$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9dbe451b-345b-43b5-a982-46bdbcfcf49a', '9ae951f2-e006-4afd-a07e-1ad588afcd09', $$PDFs e slides liberados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0096b31-d22e-4fd9-ba8c-05fa001c34ee', '1f48497c-d8e0-4a9b-b9d1-75b3df353047', $$App testado para uploads$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a1532dfb-e9a2-488d-86a7-57af966940e9', 'b154f8a4-d7be-40b8-8bde-c64d409bde2b', $$Ambiente preparado$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a4500972-202d-4c81-9c27-7442ddd00738', 'ec18f04f-e44f-4a0f-97d1-bb4eadb3931a', $$Instrumentos afinados e prontos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a4798119-797e-49b9-9308-14e07c6d425a', '14e59217-40f5-4163-b724-e911314d213a', $$Sala preparada para trabalho em grupo$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a49d1cb4-5930-4c98-ad0b-a4c27607f001', '9ae951f2-e006-4afd-a07e-1ad588afcd09', $$Instrumentos disponíveis e revisados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a8ca84de-152e-49bf-968a-7ad6b962f187', 'c368b564-6704-4c95-9d82-b2672babead5', $$Instrumentos afinados (teclado, violão, etc.)$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b18f7bf5-eed1-41dc-be5f-9a187d5ced82', '2b58068f-1294-44e2-b9b9-365ef995372d', $$Quadro/sala organizada para leitura em grupo$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b34ce3a2-3d1c-43bb-b100-a4fa09dbceba', 'd5291adc-06b1-47d7-ba66-1735ec3c3a24', $$Sala preparada para movimentação$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b39226f1-8b0e-4d09-bfe7-518935ff54a1', '053b763b-5606-42bc-b02a-a94364239a74', $$App testado para upload e feedback$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b60913f5-05ca-4e6d-9b63-26366744dd93', '1f48497c-d8e0-4a9b-b9d1-75b3df353047', $$PDFs/slides liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8339961-8ce9-4670-b407-c0c82a8b87c5', '5b8d46c4-0bed-4f6b-b743-615035679b6b', $$Músicas/repertório impresso/disponível$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c1d58b9f-6f8f-45ac-84d2-6f66a3c4b9d1', 'c23b8c68-a284-4c6d-82c8-8f54d00b3e00', $$Objetos variados disponíveis na sala (ou aviso para trazer)$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c21bac7d-3b76-4865-a537-bb1e6998def8', '2a1cd10b-89d2-45f0-a051-93cdf98bc888', $$Instrumentos disponíveis e organizados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c38b6965-5e40-4a20-b505-0becf3856f4f', '2a1cd10b-89d2-45f0-a051-93cdf98bc888', $$Espaço para ensaios simultâneos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c4c96824-2b84-4534-9871-8f498f4cbd2f', '0beed730-fa51-467d-9805-9415149ba916', $$PDFs liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c90c532d-016e-4bf8-984b-1498fb902c51', 'f925d0ab-4eb4-4502-aad5-5b617d0db260', $$PDFs/slides liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca30c8e6-70c6-413b-8d4b-3182d88dc0db', '59d864ba-84ca-47e1-b31d-b5819021a986', $$Ficha de avaliação disponível$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cb484d4a-510f-4078-9d5d-015ae0d9f165', '053b763b-5606-42bc-b02a-a94364239a74', $$Espaço preparado para ensaio$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ce865dd5-4f58-4de0-8293-f165a05aff72', '0beed730-fa51-467d-9805-9415149ba916', $$Instrumentos disponíveis e afinados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cfc1b5c8-e7f2-45b5-9a6e-b4290f957a94', 'c23b8c68-a284-4c6d-82c8-8f54d00b3e00', $$App testado e pronto para uploads$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cfdb5f18-154c-4b5b-87e0-9b2b5a3d2629', 'a7d5335f-94f1-4646-8bc4-cc0c4cd663ea', $$Equipe organizada para recepção e registro$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd032b53c-dbac-46ff-978d-53661ce06fea', '923053d3-e54a-4698-9517-a46397c0584c', $$App testado para uploads$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd374a34d-de53-4e8d-a295-1f1a1c79cd30', '14e59217-40f5-4163-b724-e911314d213a', $$Instrumentos disponíveis e afinados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd3fc3a5f-0164-410e-bd2d-672f9d8a2106', '59d864ba-84ca-47e1-b31d-b5819021a986', $$App testado para registros$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd7758999-b95b-4ea2-9239-54d6765d6be9', 'b9d6f98c-1f40-42de-b346-0c5e18eac1f5', $$App pronto para uploads/coleta de feedback$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd7e2419b-d3a1-40d6-a0d5-2216a0f8302f', '65e4f168-9b96-41e4-b0e7-a79d090fa7aa', $$PDFs, slides, áudios prontos$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd9cb4761-d799-480d-acbc-52dff71d5aac', '923053d3-e54a-4698-9517-a46397c0584c', $$Espaço para apresentações em grupo$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd9ff357e-aee2-4788-8b7e-a24aff55b9e2', 'fe1d98e4-3a4c-4cd2-a68e-b5b3a8e2e51c', $$Espaço preparado para apresentações$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'da34b071-ec7e-422b-9267-00428d23cfc3', 'b9d6f98c-1f40-42de-b346-0c5e18eac1f5', $$Espaço organizado para movimentação em roda/grupo$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dcff1262-caa2-486d-9c9f-50071c1cf480', '0beed730-fa51-467d-9805-9415149ba916', $$App testado para uploads$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dffafdcf-d346-4abd-b1ba-baf0688c4a9b', '37b53845-821a-4d7e-9b13-2598e34a42ff', $$Instrumentos afinados, higienizados e prontos para uso$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e0d26b7a-d0b7-419f-b1e7-daa991d7544a', '3d52bedb-3cb0-4ccc-86bf-6eddd4632364', $$Objetos e instrumentos disponíveis$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2a3a996-879b-45a3-ae9f-50904b8eadce', '1168d1e0-4f46-4970-876e-6dc5f2d1f21c', $$App testado para uploads$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e7a77beb-f9af-4fe5-9a3a-42e311ef2747', 'f4ef0c67-c714-4152-a0c3-644d09d94d9d', $$Apps de gravação instalados/testados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9a98e4a-e40a-4db3-8eb6-397772b5c5d3', 'd5414bcb-4d76-4cb0-bf0a-8f166cca5b47', $$Instrumentos afinados e organizados em duplas/trios$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ee0344ad-6465-469c-9424-60782d13f56d', '923053d3-e54a-4698-9517-a46397c0584c', $$Cifras e PDFs liberados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f4a126e7-569d-444e-8ca2-4925a1759f40', 'f4ef0c67-c714-4152-a0c3-644d09d94d9d', $$Celulares/tablets carregados$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f605cd07-1a6d-4edc-936b-06236d4c7e0e', 'd5414bcb-4d76-4cb0-bf0a-8f166cca5b47', $$App testado para uploads/comentários$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f626ef3e-2dd2-43f3-8ee4-9ed9e3be54c2', '1e357f0c-44ee-4f3b-a39a-851d4f5220b6', $$Instrumentos afinados e livres para criação$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f916c078-8206-45ca-9127-f8edaf70034c', 'b9d6f98c-1f40-42de-b346-0c5e18eac1f5', $$PDFs/vídeos liberados no app$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa8d393d-6726-4ced-85c5-be39966dd741', 'd5414bcb-4d76-4cb0-bf0a-8f166cca5b47', $$Sala preparada para prática coletiva$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fbcba4c0-8113-4d19-96a2-5de05597f0c2', '494c3d0d-692b-4509-b90b-b92bd1345eb1', $$App testado para motivação final$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fecc8e9a-7868-42be-8bd8-5b7beeb5be5c', 'd5291adc-06b1-47d7-ba66-1735ec3c3a24', $$App/jogo de notação liberado/testado$$, $$preparation$$, false, '2025-12-16 00:06:50.606873+00'::timestamptz, '2025-12-16 00:06:50.606873+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;