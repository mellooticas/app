-- =============================================
-- Migration: 044_lesson_criteria_2026.sql
-- Table: core.evaluation_criteria
-- Year 2 Curriculum Evaluation Criteria
-- Generated: 2026-03-01T13:48:29.216Z
-- =============================================

BEGIN;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f8e4e53a-0e47-48c0-b32f-b40c6529e4c5', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Participação na dinâmica de reencontro$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'da303139-a8a7-4d00-a0b5-2e86ca8c145f', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Engajamento na formação de grupos$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2e180257-99d0-490b-8778-b37217149171', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Clareza na apresentação de metas$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8e3262d-b30f-469c-9e12-f32d8cd2db7c', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0f3210a5-eaf3-4e78-80c1-dcb8721a87b2', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Domínio de figuras rítmicas básicas$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '19fce1fb-10b9-4dbf-891d-f7e91349ea2b', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Postura e empunhadura correta$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0f39b025-dd4e-42fa-98df-340954b187e3', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Capacidade de leitura melódica$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f63f9166-67b1-4aeb-a3bc-96f7de5d21cf', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '32a18191-ec41-4c11-8b08-20001c2bd7c7', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Execução correta de semicolcheias$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ecb01a98-a55e-4433-89a9-190bf1421c33', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Domínio da síncope$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9124e0d8-cc6a-461c-af2b-dc964290b1d5', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Coordenação na peça a 3 vozes$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '252b8314-1c8d-44e0-b7d3-756c5ab9211e', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3e2b72b9-9c9a-4263-a493-0cb7fca86891', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Reconhecimento auditivo de intervalos$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6b42e177-5b4d-46df-be4e-fda6682ea7d2', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Leitura correta de melodias com intervalos$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3475b284-6568-43c8-ad1d-e478cb615fc3', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Participação no solfejo$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '34424e3e-21d5-42a2-8fbb-0e9150dd0a22', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2aca6e06-6eca-47b5-998f-71b21ce38a17', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Compreensão dos sinais de dinâmica$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c5e5f8c9-8007-4ce0-b962-554c0f749a01', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Execução com variações expressivas$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '38ff3cc7-cdad-4e8d-a508-b27164a76408', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Resposta ao regente na dinâmica coletiva$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '12a1793b-5eca-4cf1-8cd5-3487d8d3345d', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '94654e6a-70e0-4844-b3b6-e8f4148c5bf6', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Sincronia no conjunto$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1694acb5-2e67-4e5f-b8f8-aa30a24d9c9a', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Aplicação de dinâmica nas peças$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '08ea37dc-6a40-48e6-bda6-129645bf7c68', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Participação na liderança/regência$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'bb68e14e-a4dd-4c03-a600-827a441f4bb6', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '645c6bce-9523-41ce-8499-5025926a28a7', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Clareza sonora nas articulações$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '58da9a35-01e7-45f4-9d53-8d96b5e272cb', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Controle de velocidade progressiva$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e89507d4-10e3-495a-981c-0d8df12896e0', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Postura e empunhadura corretas$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1d9720c6-ffb0-4b61-af62-6ada176302c4', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'df3a7505-dca0-49f0-83ba-8da909610c67', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Execução correta de ornamentos$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '80c67322-c533-4038-910a-7b9dd3a01432', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Desenvolvimento do vibrato$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '89384e4f-6a23-467b-9b73-ff05b8407bae', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Musicalidade na aplicação dos ornamentos$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5783f78c-13cb-49d3-aea9-09304876293c', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '49313ae2-0f4a-4d93-81b3-888bce67c5d7', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Execução correta das escalas$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'dfb84455-0827-418d-bc2d-4af6e526bcc7', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Identificação auditiva dos modos$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6c30fcbc-28ab-4018-b0a1-c25ac6bbf071', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Criatividade na improvisação modal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c5b323bd-a49c-4152-9eb0-eacf4d111d6f', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f932fa2a-c9a2-4614-987f-b67a055718d4', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Formação correta dos acordes$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7ead9590-4fe7-4720-a3ad-d666aebf3677', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Fluência nas trocas de acordes$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'dbb991d0-508c-4695-a951-c6cf052c27b1', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Acompanhamento harmônico em grupo$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '731a1652-28d8-4553-817c-017ebf7e438c', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'de2ffcd9-a64b-4126-bc64-cf2913b5473a', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Leitura correta da partitura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9ac83d7c-003f-4bbd-9e66-cdf7b290abd1', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Interpretação das cifras$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9fb0d0eb-e226-4c69-a97d-56fd0bad9911', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Integração melodia-harmonia no grupo$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '87b0b2d6-f5fa-4447-94cd-595500c4a195', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6788d033-8278-4b68-aa9f-2cc23bd46927', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Qualidade da apresentação musical$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'daac14f6-74a3-4000-9d0c-7392a212cae1', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Postura de palco e confiança$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2c4cfa2e-d4fd-4187-b9d5-3824bbefce1e', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Capacidade de dar feedback construtivo$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '764c6bab-7ff0-4fcd-8723-b07e9e805a20', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '34edde2a-cbfe-4a32-8b21-56464e05d66a', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Compreensão das seções de uma canção$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5e6b542d-422a-436a-a3c4-5cfc6c0274e0', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Criatividade no esboço melódico$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '26a1eb62-1bbe-4525-8830-0b4da8e7e465', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Colaboração no grupo de composição$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '46a4e975-fc82-441b-b168-15712c0cc56f', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2c36f2e6-dd53-497d-b274-b13f1b311ee9', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Qualidade e coerência da letra$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3e30f274-423f-48d3-baa1-68a85fb09b0b', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Encaixe letra-melodia (prosódia)$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'dfbb29e9-c208-49a2-b046-6df43ccfd07c', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Participação no processo criativo$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '89a25991-546f-4cac-a8bf-19b8d8964f1f', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1e183f9b-0035-4dba-8183-30960da59e9b', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Compreensão dos conceitos de arranjo$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '94e24664-626c-4e7b-bfb0-7a0f9baf8eaa', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Criatividade na distribuição de vozes$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c44e8722-66b0-40a8-af28-9e19b461ad56', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Funcionalidade do arranjo criado$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2c784d5a-32ba-4367-bcf8-325d9c774965', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a563c631-1b2c-4f23-9ada-033deaa7e354', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Funcionalidade da parte do naipe$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0bba7cd-5f61-43fa-b753-aa844f463119', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Equilíbrio sonoro no conjunto$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2a7ff58c-6290-439b-bae6-76fc3ffaf33e', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Coesão entre os naipes$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'bff0f2de-bce6-4036-ba69-efca6871764d', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd38e2c15-018b-4693-b69c-4d9284a0b0f4', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Capacidade de usar a DAW$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '813f794a-7d26-4509-8313-54e9c44e8131', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Criatividade na produção$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3b172871-262d-4d64-bb87-8d5fa262e30d', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Qualidade da edição de áudio$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ed0f29f0-68f5-487c-b952-c00c82f42972', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c6d9e400-b6c1-4a4c-91de-93bd2643cc58', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Qualidade da gravação (níveis, ruído)$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '54c24942-95cf-4bf7-9034-24982fe34e26', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Aplicação dos conceitos de mixagem$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'de64463a-c4ac-41e2-bca4-9e6443c02c5f', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Trabalho em equipe na sessão de gravação$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9b7793a2-2641-4ef5-8742-d90dc90d3ee6', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1f9b56e1-6959-488d-a904-022bf60253f9', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Execução dos ritmos afro-brasileiros$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3a8381df-ba5a-43fa-93d6-2a82a537ffcb', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Participação nas atividades culturais$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '72023afd-61d0-49a4-aec1-69d3a8f189e4', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Compreensão do contexto histórico$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f3815961-4502-40cf-b984-f58990be6193', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4a22f18f-501f-46de-82b4-af1f91b682a9', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Execução do ritmo latino$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4c5f09e2-642a-4a6d-930b-70a8edd0268b', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Compreensão da diversidade musical latina$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1d0f2e5e-8d20-4f1f-aa41-178408ae1d20', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Qualidade do conjunto na peça$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '597c89db-399b-4741-a68e-ab003e0e16fd', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '22766fc3-9c1d-4cd2-997a-b6d15b0a5c15', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Execução da escala pentatônica japonesa$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b68cd09a-db2d-435f-977c-7cad963f3161', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Qualidade da adaptação para conjunto$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7266c6b6-1982-401c-8f39-07e05bbbef85', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Reflexão cultural nipo-brasileira$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'af72129b-0d7d-42f1-a214-759e0d91f69b', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2d2e39fa-95a2-461b-a062-443d9533bd27', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Execução do 12-bar blues$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9f78f74-4494-42c1-ab67-e8f3f39fe056', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Uso de blue notes na improvisação$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c01679ac-bc23-46dd-95e9-a7305b496308', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Swing e feeling no groove$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c8cced5a-2320-4de6-a739-3038ec170202', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8355c878-6903-4e77-806f-ed510a616e37', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Domínio do groove do gênero escolhido$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ae8b541c-acbd-4044-9fc4-27694ac19b26', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Criatividade no arranjo$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '67c70af9-837f-41eb-b9cb-1929e33a6bdb', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Energia e engajamento na performance$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8f78469c-4f10-42fa-8c81-930c70314e4b', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '03b975ec-06cb-4264-9d27-990cc6645342', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Qualidade da apresentação$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '47ba1ee7-59ea-497d-bbe4-d8b0620c4e41', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Conexão com o tema escolhido$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2e0fec10-74e9-4a8a-9724-11e9a78520d8', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Evolução musical desde o início do ano$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '446da154-f517-4413-9973-db35b0b0cb0b', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f5e01fac-41cd-4dad-af5d-b4c6eb87c480', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Presença de palco e postura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '288c06e1-7ab4-40c6-b1dd-a1603fb5aa07', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Comunicação com a plateia$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f7125b85-7d79-4298-8f81-20b1151f4645', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Controle emocional na simulação$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '398560fa-ad26-4adb-bcd3-bbfe8524da48', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2285ee0b-44c5-4a16-a48e-9118776b6f5b', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Compreensão do sistema de som$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '99738fce-f9c6-489c-9bb9-4312f03e6a3b', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Capacidade de montar conexões básicas$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd3ce2125-30ca-434e-a5ad-a1511249575c', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Participação no soundcheck$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8bc001b-493c-41da-9602-20e6b5224e21', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'bbc1418e-15d6-4d0a-9048-97ad1f4cac25', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Fluência na improvisação$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '14f31f79-746a-4ddb-a809-49a6a88a1961', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Uso consciente de escalas/modos$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3ef4516a-0fed-467f-9392-c40fb373cffb', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Diálogo musical com outros improvisadores$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '03b544a7-d07c-4128-ad4c-7b70fe8c6b71', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c91f8cfe-fb0e-47c2-9a51-962e2ae1c1f3', 'd98bb535-a591-4262-97be-a8e909038c93', $$Equilíbrio dinâmico na formação$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '491a8fc0-cc33-4572-98ce-94453bc88479', 'd98bb535-a591-4262-97be-a8e909038c93', $$Escuta mútua e interação$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '97630598-fca1-420a-a2e6-895ca2df7000', 'd98bb535-a591-4262-97be-a8e909038c93', $$Comunicação visual entre músicos$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c30e60a4-59bc-4b26-af18-c6a3bd65c714', 'd98bb535-a591-4262-97be-a8e909038c93', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '22cf9df3-7805-42ad-ad5f-74a7de27349b', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Viabilidade do projeto escolhido$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '11d8203a-1b9e-4307-a0ef-897e976a4257', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Organização do cronograma$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ddb7c8a1-f36a-4687-b6e1-4e47dc4dbe13', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Clareza na distribuição de funções$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8e7532c5-8c19-4504-bfa9-5792095e9633', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '848ddf31-9ae1-4bba-afdb-bdf7ddd07cf7', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Progresso no repertório$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b788b9a3-6a72-4aba-9af6-eafac520c97b', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Organização do ensaio$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4a9c4011-b483-4316-a045-973d9c65ac2b', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Capacidade de resolver problemas técnicos$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7271220e-f98a-4e2c-98f5-d52e479f82ec', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8f39812f-983b-4a6a-ad66-be2f74c79d36', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Criatividade do conceito visual$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5c13241f-9f7c-45c6-8b74-85769785c067', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Qualidade da filmagem$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9b60c794-8bd2-42bb-b829-7c9f84ddb3cb', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Coerência entre imagem e música$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '98eed5cc-dbe4-4158-8972-324e55edd289', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f7552d84-ed17-4930-9ae3-8ff043b9f4fb', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Reflexão sobre música e comunidade$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '86e74a34-dc00-440a-906c-a56c8c9ac96f', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Viabilidade do plano de ação$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '123df7a6-e1d0-4dca-aaef-cbe944815ff0', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Qualidade da peça ensaiada$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ce850e16-87ef-40f0-8f00-8dc828246bdb', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5e6e8d20-b577-4808-bce2-7342214a4350', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Leitura das partes do Show Final$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'afff6a87-5375-472d-9371-6b29ecf5b338', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Comprometimento com o repertório$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7b874014-ee9e-45ce-9864-13717f7300b6', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Participação no primeiro ensaio coletivo$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e37afd12-8399-40b9-9b39-de0d4c9c84eb', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'cd1a8f32-0c95-4681-9cf0-167501386542', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Execução das dinâmicas marcadas$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c27f4f37-0f6b-4dcf-a735-5eab6209a6de', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Fluência nas transições$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '71190d32-8d68-4042-a534-a470a40d3c5d', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Atenção aos detalhes musicais$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa77f470-9690-4316-8912-d89d8cac20cb', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a02740cd-7245-4460-b1f2-c3728f74724b', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Continuidade no run-through$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b586c54b-86c4-4ed0-b3b9-960cd331fc62', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Transições fluentes entre peças$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e0398d8e-3992-4975-b14c-f40d15676be4', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Postura de palco durante todo o show$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5f5b535f-eee2-406c-800d-be240060370c', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '79f5d0c6-31de-4a79-9dda-f3530e565e5b', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Melhoria nos pontos fracos identificados$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5ac07616-109e-4137-a218-93617ef5a810', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Resiliência em situações-problema$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '11d79b0c-ea3a-42dd-a616-beb9f6d0bc1b', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Confiança e apoio entre colegas$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'cbf18988-1821-4040-942a-c035667c7292', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'dd58d31f-4ef4-4220-9bbb-1d930397dc1c', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Execução completa sem interrupções$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '115fe482-8755-4bd9-a5cd-3d805370ca4e', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Uso correto de figurino e posicionamento$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0faceb32-4d5c-43b4-b99a-1dec36270161', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Sincronia com som e iluminação$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '602b7eb9-49cd-4f65-acf5-d6d571bfd717', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6ce2cea3-6f9e-41e2-8730-d272fb9f3ed4', 'b3733049-d482-4882-a484-e092fe79324d', $$Excelência na execução final$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '43b01db2-0d66-40bf-8e96-da736b63d37e', 'b3733049-d482-4882-a484-e092fe79324d', $$Postura e profissionalismo$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8b82f97e-715d-44ae-8b20-6fb886d0d6f0', 'b3733049-d482-4882-a484-e092fe79324d', $$Preparação emocional e foco$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '60872d1f-c56a-4a2c-87f6-6f669ea03853', 'b3733049-d482-4882-a484-e092fe79324d', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4da5e359-2854-4abc-b3fa-1600edd01b96', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Qualidade da passagem de som$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '983a31a6-fff2-462f-8200-4d2ff932428d', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Foco e concentração nos últimos ajustes$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f20af5bf-a550-4e7d-b1b8-265a45657424', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Preparação técnica e emocional$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'bf5fe06c-8c74-4617-b30e-b10f003d9210', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Cumprimento do desafio Alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c45a9817-a71f-482d-8eef-1ac3d5ab5a2d', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Qualidade da performance no show$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6cc0019f-4243-400a-8b12-2c19c7d7909f', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Postura de palco e profissionalismo$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9583ab74-60f2-4ee0-ae8a-fa5e68cf3c51', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Emoção e entrega artística$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'da552d5a-9fcf-4e8f-bd0b-db2b5cb410e3', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Participação na celebração final$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1.00, 3)
ON CONFLICT (id) DO NOTHING;

-- Total: 160 criteria
COMMIT;