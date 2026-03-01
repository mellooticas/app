-- =============================================
-- Migration: 007_instrument_quizzes.sql
-- Table: core.instrument_quizzes
-- Source CSV: instrumento_quiz_rows.csv
-- Generated: 2026-02-28T16:15:03.417Z
-- Rows: 483
-- =============================================

BEGIN;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '001f17ef-2ae7-4198-bcd2-c5dd74dd6c75', 'fb125188-c48e-4d89-a46e-11c3b600dabd', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '017d10bc-8d1d-4316-8b0e-6d253f42625b', '35da6877-2528-4f37-9ab4-b44893ad1dbf', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '019c071e-3cb2-4321-942b-1b11a645cf95', 'e48ad87b-d237-45e4-a707-05374c4240fa', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '01bcf247-f854-4d03-a6a1-000aa0e87fc2', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', 'true_false', $$Mozart compôs um famoso concerto para clarinete?$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 18:41:05.950814'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '02a500d5-90a9-416f-aed7-c0c52b525860', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0304cec4-3aba-4ebf-a9b3-61b9e53e69a2', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', 'multiple_choice', $$Como são produzidos os harmônicos no oboé?$$, NULL, '["Controle da coluna de ar e embocadura","Pressão das chaves","Toque na campana","Uso do pedal"]'::jsonb, '2025-06-20 13:35:33.950749'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '03848f50-af0e-4236-aaf5-4b1d35e663ef', '1b699036-0f72-4c48-9801-e01f6f25e165', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '04b707d8-5b32-489f-be43-8003c8e766e0', '453ca164-6f0e-4554-b008-dd68bf4586c2', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '059be357-dcf5-4054-a028-eaca5af30b9c', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '05c2b1ef-b9d2-4f44-a5f8-6de2dc37a646', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', 'true_false', $$O vibrato no saxofone é feito pela variação da pressão da mandíbula.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-16 02:27:56.351591'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '05dbe4d8-f9b5-4053-b1cd-6c6f7d098947', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', 'multiple_choice', $$Quem inventou o saxofone?$$, NULL, '["Adolphe Sax","Antonio Stradivari","Johann Sebastian Bach","Claude Debussy"]'::jsonb, '2025-06-16 02:27:56.351591'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '069cf5d8-89f0-4f17-b772-2cf899af4da8', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '08712fb6-273b-4416-80e1-0e28ccbac319', 'c75fe646-ff86-4420-98f0-a0f25d39de45', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0892b20d-4a22-48c2-bce3-02717bc745bc', '453ca164-6f0e-4554-b008-dd68bf4586c2', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0973ef7b-a442-4eab-a331-913e200833d2', '35da6877-2528-4f37-9ab4-b44893ad1dbf', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '09e950a1-7d56-47f6-b7be-694bbae604da', 'df42056c-8a3e-454c-aeca-73b4d608b85c', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '09f98048-3c25-43cd-996b-67df9174635b', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '09fc906f-7a16-429b-b169-ef50b2fa7cb7', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0a804b62-527f-47af-bcc7-0b03f9e73718', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', 'true_false', $$O arco do violoncelo é geralmente mais longo que o do violino.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 19:36:14.631505'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0ac61b7e-07d6-4637-8a83-7a2ae8707f43', '7b6ae164-dfdf-452d-a5c3-d01554861444', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0b2ee10e-80db-49d1-ad40-fd1ecbd3f770', '761a3318-9a5e-46f3-88f2-62159b96100c', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0b47a3c3-cdfb-4e65-9471-bc18f4b7807e', '82052c70-0a9d-4d94-873e-3b402e032f55', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0c7a0f03-1045-45f4-95fa-4bb78c094ea9', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0c950bf6-23f1-4da0-a29d-5b46f9b8d430', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', 'multiple_choice', $$O oboé pertence a qual família instrumental?$$, NULL, '["Madeiras","Metais","Cordas","Teclado"]'::jsonb, '2025-06-20 13:35:33.950749'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0d59c7b7-61e0-4a43-bef5-dfde8685e0ed', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', 'true_false', $$O trombone surgiu na Europa no século XV.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-20 14:38:50.726656'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0e50ab13-36da-4817-a2ff-5cc836b0c5d1', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0e54417d-a866-4c80-82c5-82e380c13549', 'e48ad87b-d237-45e4-a707-05374c4240fa', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0f04f98e-e1e2-4e4d-94bc-a99d3bd4ed84', '453ca164-6f0e-4554-b008-dd68bf4586c2', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0f4f663b-8f94-41a5-8cbf-a5cffbad5266', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '0fefe250-9540-4d12-a212-fd9061a996e8', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', 'multiple_choice', $$Quem é considerado o "pai do violão moderno"?$$, NULL, '["A) Andrés Segovia", "B) Antonio de Torres", "C) Francisco Tárrega", "D) Julian Bream"]'::jsonb, '2025-06-08 01:08:54.801634'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1095c543-fb7b-49cd-a08c-5aeef3f44486', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', 'multiple_choice', $$O clarinete pertence a qual família instrumental?$$, NULL, '["Metais","Cordas","Madeiras","Percussão"]'::jsonb, '2025-06-15 18:41:05.950814'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '10ad8757-dd5b-4585-84ed-4b2e7a9e90c3', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '10ed8c29-1fe8-460a-9d0f-a9bc21f92fe4', '36040329-1aa6-428a-ad39-cd85de03493e', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '12d1ca1d-b221-4b02-abb7-820c5b64d4b9', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1367a3d4-bb51-437e-a8fa-058c32fffba7', 'e48ad87b-d237-45e4-a707-05374c4240fa', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '13b98dac-1136-4de2-81e7-d70e7e3b3a45', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '14b36e54-5cc3-4072-92cf-b7fc046c5531', 'c75fe646-ff86-4420-98f0-a0f25d39de45', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '16797454-3243-44e9-b3ff-8bcb2f5ee0e1', '9a5e0eac-114e-4173-90af-32b55c870675', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '16a2f094-e1af-472b-833d-e0b3688e6f5f', '9c3a903d-8750-4ded-9341-c876a6d6de93', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '170e514d-b13c-4313-a80e-2fec8bc85371', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '178a0d83-ff75-43d1-b163-bd892fa28f9c', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '17d7a6e7-55b2-4b4f-a923-ffd086f8bfbb', '56e32061-7ed6-495d-9bc1-00cdb345b02e', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '17f63fb0-8f76-4755-9cce-3452504e3584', '6925f61b-ba48-473a-b69a-e3548036c1df', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1808f150-caa9-4662-9ab8-b2af4d4540a8', '36040329-1aa6-428a-ad39-cd85de03493e', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '182f4922-b7e0-48ae-b4a2-3b43583b6171', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '19477fac-9a20-4a4e-8b8e-3f8d34ad9a4e', '56f643e0-a3e2-4067-84ac-334c454426f8', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '19ec9e01-214d-4d71-9166-6aacb41a5900', 'cca87ab1-8ad4-4876-a8d8-190f85927952', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1a5bcae9-fecd-4ddf-8ec6-c1e8b6b7e5ef', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1a6e2a7b-a6d7-40f8-b8d5-c423229391cf', '7b6ae164-dfdf-452d-a5c3-d01554861444', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1b3673e5-54d2-4a6c-9db7-b4ebbe503cc9', '0b9c8c6b-0e47-471c-b83b-01c931410692', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1b40685a-73fe-4005-ab41-9e8a2c7f4241', '453ca164-6f0e-4554-b008-dd68bf4586c2', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1cc63612-bffb-48f5-9f93-847fa278094a', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1d058307-89f1-4732-81a4-404adf3bf7c1', 'c75fe646-ff86-4420-98f0-a0f25d39de45', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1e0df16b-c9b7-492e-9e50-a2cb7f3ba200', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', 'true_false', $$O contrabaixo acústico pode ser tocado com arco e pizzicato.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-16 05:35:57.478232'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1e635b35-dc4e-478c-875a-34012fb7e38e', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', 'true_false', $$O saxofone é usado em gêneros como jazz e samba.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-16 02:27:56.351591'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1f95b7e6-8e9b-49fe-ab8d-c3bc89709cff', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '1ff11734-3e03-4103-a5b9-fb6515bcf5c7', '36040329-1aa6-428a-ad39-cd85de03493e', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '212790f4-c8f9-4b46-9149-fd12450bfa75', '1b699036-0f72-4c48-9801-e01f6f25e165', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '21b29f2b-d3e5-492d-ac86-7df0e550d6ab', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', 'true_false', $$O oboé surgiu na França no século XVII.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-20 13:35:33.950749'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '21b3b593-7be6-4481-84e0-7d6ef05c2373', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', 'true_false', $$Mozart compôs um concerto para clarinete?$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 19:29:35.990833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '21bd8bef-6d0d-4e6e-a491-90ba4789fb9b', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '23c7577b-14ee-4658-b6c4-f73466784144', '92ecdeff-3480-4f27-85cd-86f12622cf9f', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2425017e-2033-43ae-98bc-72efd2cafbd4', '92ecdeff-3480-4f27-85cd-86f12622cf9f', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '24b21049-e3de-4a74-8e2d-589f172a88fa', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '25224d53-3040-407c-a87d-5d00c4950a36', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '28a41ce2-fd51-428b-9657-bbe39eacc8a5', 'e48ad87b-d237-45e4-a707-05374c4240fa', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '28e1d6b0-d84a-40e0-8117-8743ed303ed1', 'df42056c-8a3e-454c-aeca-73b4d608b85c', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '28e8c88a-3d0a-447c-9a79-604b953b32f4', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '29ece028-1db6-4e0a-9954-b75be9821c45', 'cca87ab1-8ad4-4876-a8d8-190f85927952', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2a07f04c-89ef-4383-b0bb-27b76f63543c', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', 'multiple_choice', $$Qual parte está indicada na imagem?$$, $$Pickup$$, '["Pickup", "Ponte", "Tarraxas", "Trastes"]'::jsonb, '2025-06-09 04:31:33.040825'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2a4ed2f6-e2b4-4d3e-a45a-e552dbb0ad2c', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2a97d2de-d286-4de2-9d9a-eb086d36a85e', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', 'multiple_choice', $$Qual função principal do fagote na orquestra?$$, NULL, '["Linhas graves e efeitos cômicos","Melodia principal","Percussão","Acompanhamento de cordas"]'::jsonb, '2025-06-20 02:52:13.984571'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2acc7a60-b49b-4935-a3be-76c953c4ade1', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2b2d414b-7bb8-469c-8c1f-f375bc92e41c', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2b2f12a2-8831-4a82-bef9-0d21c8ecf32a', '509d6a26-159a-4976-aa46-83f914f930aa', 'true_false', $$O vibrato no trompete é feito variando a pressão dos lábios.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-16 03:59:18.685879'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2b7269c3-42e5-43ed-913c-48379cfdd925', '761a3318-9a5e-46f3-88f2-62159b96100c', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2be443a3-9320-4f33-9e23-4dd5a31722e2', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2be56ee0-c5d0-4311-b237-0e4b1cd1fabe', '92ecdeff-3480-4f27-85cd-86f12622cf9f', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2bec2232-1f3c-4064-b8d2-711d435a9701', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2daad8f5-cf7d-4174-bd38-332e3c44793c', 'bc665a4e-e301-44d3-b8bf-decb09422d71', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2e3d79a2-7307-4fbf-b2d5-660df3cde847', 'fb125188-c48e-4d89-a46e-11c3b600dabd', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2e552538-27bb-4533-acbe-5d71eb597108', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', 'multiple_choice', $$Qual dessas técnicas é usada para manter um som contínuo no clarinete?$$, NULL, '["Staccato","Respiração circular","Trinado","Glissando"]'::jsonb, '2025-06-15 19:29:35.990833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '2fde319e-535b-40c5-a44e-96f0f22800f8', '56f643e0-a3e2-4067-84ac-334c454426f8', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '30106705-1d85-4e8e-beb4-29aca43b7e73', '9c3a903d-8750-4ded-9341-c876a6d6de93', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '312de518-6e78-4ba1-98b7-2371c791fd54', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', 'multiple_choice', $$Qual dessas técnicas pode produzir harmônicos no fagote?$$, NULL, '["Toque leve sobre pontos da palheta","Toque leve sobre pontos da coluna de ar","Sopro forçado","Pressão sobre as chaves"]'::jsonb, '2025-06-20 02:52:13.984571'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '31819b4f-be34-4380-b71c-21e8c80f9d96', '56f643e0-a3e2-4067-84ac-334c454426f8', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '32689b88-3376-4e38-8d08-1da7b79f062b', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', 'multiple_choice', $$Qual técnica altera a afinação esticando a corda?$$, $$Bend$$, '["Slide", "Hammer-on", "Bend", "Pull-off"]'::jsonb, '2025-06-09 04:31:33.040825'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '32e06fe2-e208-4015-ac1d-8c12c9ec61b5', '35aff373-706c-47d8-8004-d8edcddb1e0c', 'multiple_choice', $$O baixo elétrico pertence a qual família instrumental?$$, NULL, '["Cordas","Sopro","Percussão","Teclado"]'::jsonb, '2025-06-16 04:46:25.659791'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '333c04c4-9b70-495e-b0ee-a58ca0ce55ab', '9a5e0eac-114e-4173-90af-32b55c870675', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '33513ecf-a94d-4c1a-b96d-a680265f5e92', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '341e1d74-3581-432f-bed0-721d014b8734', '56f643e0-a3e2-4067-84ac-334c454426f8', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '34616aec-92c5-4c2c-9a67-b8d57de3decb', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '34ee9a9d-8c2a-43ed-924d-96149c8410c7', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', 'multiple_choice', $$Qual função do espigão no violoncelo?$$, NULL, '["Apoiar o instrumento no chão","Ajustar a afinação","Prender as cordas","Sustentar o arco"]'::jsonb, '2025-06-15 19:36:14.631505'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '34f5f171-3eb3-4e10-85ce-4f82ce8de78d', '6925f61b-ba48-473a-b69a-e3548036c1df', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '36308a8b-77d7-447c-a11b-98da56257a0d', '56f643e0-a3e2-4067-84ac-334c454426f8', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '379047a2-5acb-4c46-8033-b66482afa71e', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '379e3150-acee-4ae2-b7dd-a2343a768643', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '38184f1c-58ca-4b3f-a873-0e18a7bea6bf', '9edff4db-9ef5-43fc-970a-7d2086de223b', 'multiple_choice', $$Aberturas acústicas são chamadas:$$, $$F-holes$$, '["Rosetas","Orelhas","F-holes","Respiros"]'::jsonb, '2025-09-22 11:49:42.121841'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3999d6f4-59c3-459f-84d9-937cd3feae97', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '39c4b6b9-f118-42a6-b4dc-ba92fed16a08', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3a7eac8c-0a1a-4a8c-894c-4365ae127d2e', 'df42056c-8a3e-454c-aeca-73b4d608b85c', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3a8fc1e8-967b-4fce-a7e0-a22642ad0909', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', 'multiple_choice', $$Qual destas opções corresponde a um acorde maior?$$, NULL, '["C-E-G","C-D-G","C-D-F","C-E-F"]'::jsonb, '2025-06-15 20:40:25.874273'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3ad0ccd8-6d99-4128-a493-4dbac064380f', '36040329-1aa6-428a-ad39-cd85de03493e', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3b69c86b-6e4f-40bf-9b86-c8152ee7a335', 'fb125188-c48e-4d89-a46e-11c3b600dabd', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3bc00617-8f59-4790-8495-46f6c7fc9524', 'df168c2e-275a-44ed-9ee7-af356bf724e5', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3cbe4309-f844-4170-b919-1cc1d77a77eb', '761a3318-9a5e-46f3-88f2-62159b96100c', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3ce2ee0c-0f3b-45a3-89e0-3ae1fb54d577', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3d2b8fe3-6bbd-4a63-ae79-b510eed4aaaf', 'ab9720a5-1973-484e-9a44-d4aa62594336', 'multiple_choice', $$Qual pedal é usado para sustentar o som?$$, NULL, '["A) Pedal direito (sustain)", "B) Pedal esquerdo (una corda)", "C) Pedal central (sostenuto)", "D) Todos os pedais"]'::jsonb, '2025-06-08 18:58:30.227177'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3e5d5908-9857-4763-997a-ee1451a137cd', '0b9c8c6b-0e47-471c-b83b-01c931410692', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3f06284a-c5ca-48e7-bc12-433ca50c2c17', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3f3a9d99-0bba-4ddb-b7e0-ac514cc9629c', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '3fbef726-96d6-4f4a-9970-e2861e9cbcd7', 'df42056c-8a3e-454c-aeca-73b4d608b85c', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4066a090-db2b-4a5a-b9b1-5af285c93a7b', '82052c70-0a9d-4d94-873e-3b402e032f55', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4083ae12-f0ea-4d80-b701-450eb122861f', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', 'multiple_choice', $$O saxofone pertence a qual família instrumental?$$, NULL, '["Sopro","Cordas","Percussão","Teclado"]'::jsonb, '2025-06-16 02:27:56.351591'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '40c568b6-5fa7-4ab7-a797-c4a2e47fdc83', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '40d6a220-4029-49dd-85de-e8a8068e890b', '57d10b2f-c49f-460d-8fab-3da3065c15c2', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '40f7c56b-243d-4264-b684-11179660504a', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '415099f7-0970-4e46-bf5f-692d9efc05c4', '82052c70-0a9d-4d94-873e-3b402e032f55', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '431ccd30-282c-4f8b-879c-a98bdc9db4ae', '509d6a26-159a-4976-aa46-83f914f930aa', 'true_false', $$O som do trompete é produzido pela vibração dos lábios no bocal.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-16 03:59:18.685879'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4342c68e-a6ff-41c4-9b4d-00681f0f0510', 'df168c2e-275a-44ed-9ee7-af356bf724e5', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '43782c5f-5d8b-4f32-a4a3-3e2af8f7a4fb', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '439c57f9-0d24-4d8a-88aa-0c7c3547c79f', '56f643e0-a3e2-4067-84ac-334c454426f8', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '44058692-1ab7-40a5-8a3b-6c8e0c558d00', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', 'true_false', $$O trombone pode produzir harmônicos naturais.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-20 14:38:50.726656'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4443d6a7-cf08-4c72-8747-af98c22e832c', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4477a81c-9356-416f-87f9-b64419251278', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', 'multiple_choice', $$O teclado pertence a qual família instrumental?$$, NULL, '["Teclado","Cordas","Sopro","Percussão"]'::jsonb, '2025-06-15 20:40:25.874273'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '449d0d1c-f4f2-422a-b146-f4760627adea', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', 'true_false', $$O oboé usa uma palheta dupla para produzir o som.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-20 13:35:33.950749'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '44e07ec4-57df-47b1-9a6e-69644add9132', '57d10b2f-c49f-460d-8fab-3da3065c15c2', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '455c85d0-2823-43d6-a430-2d77d7c0edd8', '36040329-1aa6-428a-ad39-cd85de03493e', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '456aa5b3-d5f6-413a-9fae-c45fce332f10', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', 'multiple_choice', $$A flauta pertence a qual família instrumental?$$, NULL, '["Sopro","Cordas","Percussão","Teclado"]'::jsonb, '2025-06-15 19:44:31.82833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '462a59dd-02e2-4356-8c71-bf3885a21dc8', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', 'true_false', $$O trombone possui teclas para alterar as notas.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-20 14:38:50.726656'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '464a5352-7cf1-42d8-afec-7d128a14bff5', '492f792b-8d0c-46b7-a195-c8c32114696d', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '47f8d716-ad3f-478b-84a5-e52ceee97d4d', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', 'multiple_choice', $$Qual a diferença entre single coil e humbucker?$$, $$Cancelamento de ruído$$, '["Potência", "Cancelamento de ruído", "Número de cordas", "Material das cordas"]'::jsonb, '2025-06-09 04:31:33.040825'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '48469632-f072-4962-98ea-af59c9e703cb', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4895fa4e-b116-4bb4-a4f2-615f81f4bfdb', '56e32061-7ed6-495d-9bc1-00cdb345b02e', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '48eb79ce-6753-450a-8dc3-6dbea6f39e78', '7b6ae164-dfdf-452d-a5c3-d01554861444', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '49724f21-4d5e-40fa-b375-c83f46cb92f5', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', 'multiple_choice', $$Os harmônicos no contrabaixo são obtidos como?$$, NULL, '["Tocando levemente sobre certos pontos da corda","Batendo com o arco","Usando cravelhas","Puxando forte a corda"]'::jsonb, '2025-06-16 05:35:57.478232'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '49862c40-9c92-4315-8de8-acd64afae4df', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', 'multiple_choice', $$Qual estilo musical é famoso pelo uso do glissando no clarinete?$$, NULL, '["Clássico","Jazz","Rock","Samba"]'::jsonb, '2025-06-15 19:29:35.990833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '49a60adc-0707-4645-b520-e8663cbe6082', '9c3a903d-8750-4ded-9341-c876a6d6de93', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4a9c0f6c-f910-406c-aea5-c7add71a1f5f', '57d10b2f-c49f-460d-8fab-3da3065c15c2', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4aa54400-fe75-457a-90db-6bf630df0e69', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4c90461b-94fa-42df-8b99-b30560f9c52f', '32705505-7727-4d27-b7bd-b08e7c90c233', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4cfa3a18-db68-4d47-8d8d-11c31e961702', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', 'multiple_choice', $$O que são power chords?$$, $$Acordes de quinta$$, '["Acordes de sétima", "Acordes de quinta", "Acordes diminutos", "Acordes maiores"]'::jsonb, '2025-06-09 04:31:33.040825'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4d044458-fe31-4e2e-aaec-e0b3fd957e94', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4d3cba93-376a-4ccd-ba77-a2cc7e415eae', 'f8653cdb-e2e7-479a-bfff-c8643859b866', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4e8f99b6-fd57-44c1-a3bb-7edf4bc9f1c9', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '4ed6e7d1-062d-4d9c-95c7-42dcec104666', '9edff4db-9ef5-43fc-970a-7d2086de223b', 'multiple_choice', $$Articulação de notas curtas:$$, $$Staccato$$, '["Legato","Staccato","Tremolo","Portamento"]'::jsonb, '2025-09-22 11:49:42.121841'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '50e56ced-2540-4fce-8d44-e72ad33faa8d', '35aff373-706c-47d8-8004-d8edcddb1e0c', 'multiple_choice', $$Qual função principal do baixo em uma banda?$$, NULL, '["Base harmônica e rítmica","Melodia principal","Percussão","Sons de fundo"]'::jsonb, '2025-06-16 04:46:25.659791'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '510986bd-0316-4033-937a-0100d7ef6975', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '51b44df5-faea-4370-a8cd-ba0c6bfef48a', '9edff4db-9ef5-43fc-970a-7d2086de223b', 'multiple_choice', $$Arco saltado controlado é o:$$, $$Spiccato$$, '["Spiccato","Martelé","Ricochet","Pizzicato"]'::jsonb, '2025-09-22 11:49:42.121841'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '520a3b64-29ee-4340-9071-016b370e1756', '82052c70-0a9d-4d94-873e-3b402e032f55', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5230b10b-a0c2-426a-898a-6f068974fe70', 'f8653cdb-e2e7-479a-bfff-c8643859b866', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5247efe2-2a90-4032-bf0a-4c3df4b2307a', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '525a82cd-70f4-497b-9856-28869e6a275f', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5375fd1d-b89c-4240-b6f5-2ee7ebb951c4', '492f792b-8d0c-46b7-a195-c8c32114696d', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '538b7dc3-4e0a-4a16-bc79-2727b469e2c9', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '53e90dec-9457-4ef3-bdbc-e994ac009f69', '35da6877-2528-4f37-9ab4-b44893ad1dbf', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '541a08cf-8dbc-4b26-903b-5554df3eb65e', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '57476678-c4db-48ec-9561-987b9dfe6c1c', '56e32061-7ed6-495d-9bc1-00cdb345b02e', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '57679606-0f2a-4a0d-be64-9a34041ed064', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '57e41e35-14b1-4fa7-9cfb-730040ab5c63', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '589798b9-edeb-4e7e-bd3a-a4ede8213c5d', '57d10b2f-c49f-460d-8fab-3da3065c15c2', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5908a186-4e82-4a01-a514-477ca16d7cba', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '590df4a7-6844-4298-a876-a71c39dc0364', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5a35fa44-3728-44cf-b420-c9487079a47c', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5a74c433-5fb7-4de3-8799-84baddef8993', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', 'multiple_choice', $$Qual a afinação padrão do violão (da corda mais grave para a mais aguda)?$$, NULL, '["A) Mi-Lá-Ré-Sol-Si-Mi", "B) Lá-Ré-Sol-Dó-Mi-Lá", "C) Ré-Sol-Dó-Fá-Lá-Ré", "D) Sol-Dó-Fá-Sib-Ré-Sol"]'::jsonb, '2025-06-08 01:08:54.801634'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5a8e2b8c-85e8-4544-aba5-964c2dd5385d', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5af75837-d0b5-44f5-996a-2cba59d7755f', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5b8ea2db-e94b-4073-8f35-a4e9c20d7bb4', '80436b4f-15c1-452f-9442-34e42b5117e4', 'multiple_choice', $$Qual parte está destacada em vermelho?$$, $$Cavalete$$, '["Cavalete", "Cordas", "Cravelhas", "Arco"]'::jsonb, '2025-06-09 03:50:33.78352'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5b9b457d-5a19-4763-98ca-90740ae93a36', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5bbbd495-4a21-4ad1-9260-3915c9de19b4', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', 'true_false', $$É possível tocar acordes e melodias ao mesmo tempo no teclado.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 20:40:25.874273'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5bee2707-881a-4585-8bcb-b3b09159aeab', '2abbd218-b737-410e-934b-f9c8f3d2b806', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5bff0e1b-434e-4d68-b575-463fd294ba03', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', 'multiple_choice', $$O trombone pertence a qual família instrumental?$$, NULL, '["Metais","Madeiras","Cordas","Teclado"]'::jsonb, '2025-06-20 14:38:50.726656'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5c57f914-d1f8-4653-b474-40ca2dff9fb2', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5c7e9d0f-4b09-4546-98be-8e96c318e1da', 'ab9720a5-1973-484e-9a44-d4aa62594336', 'multiple_choice', $$Quem inventou o piano?$$, NULL, '["A) Mozart", "B) Beethoven", "C) Bartolomeo Cristofori", "D) Steinway"]'::jsonb, '2025-06-08 18:58:30.227177'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5d11e77b-e291-48ab-b280-ef99cf5f6833', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5db1a797-58c7-4269-9b33-3e0028372c7a', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '5f3223d3-a210-4b3a-8284-dd2a30bfa3e8', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '60d7123f-f13a-4269-ba4d-07c5516c42f8', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '60f18559-f94e-4994-a8c2-029dd689a76d', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '611a5eda-4601-4161-a622-e42535618d59', '80436b4f-15c1-452f-9442-34e42b5117e4', 'multiple_choice', $$Qual som você ouve neste exemplo?$$, $$Pizzicato$$, '["Corda solta", "Vibrato", "Pizzicato", "Harmônicos"]'::jsonb, '2025-06-09 03:50:33.78352'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6160ca59-b594-4742-8c09-45cb35795664', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6172166d-75cf-4a41-a2b4-f70aa236168e', '1b699036-0f72-4c48-9801-e01f6f25e165', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '620c859f-5368-4b28-b302-bae830e97b2f', '0b9c8c6b-0e47-471c-b83b-01c931410692', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '628f3129-574b-4ca8-b258-8cc165293183', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '62bcf4a1-ff5a-4bca-b7a2-f0a9add85812', '761a3318-9a5e-46f3-88f2-62159b96100c', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '630bb094-5337-4bf2-b576-dacb127a9322', 'df42056c-8a3e-454c-aeca-73b4d608b85c', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '63565fe3-0f7f-4637-8d35-605ae08c1c63', '509d6a26-159a-4976-aa46-83f914f930aa', 'true_false', $$O trompete pode ser usado no samba e no jazz.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-16 03:59:18.685879'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6390d376-4de9-47c7-98a0-7e35a4081916', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '63af7010-9a56-4b3f-a0ee-6c72240706de', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '63f945c7-4ff2-4753-96b4-12ace820cd0e', '57d10b2f-c49f-460d-8fab-3da3065c15c2', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '644a0aac-3212-475e-a83d-23aa88f80f66', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '65040d75-152f-42d9-a936-7198f4e8ed56', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', 'multiple_choice', $$O fagote pertence a qual família instrumental?$$, NULL, '["Madeiras","Metais","Cordas","Teclado"]'::jsonb, '2025-06-20 02:52:13.984571'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6546bd6d-2003-44c3-a100-8342b4852dce', 'c75fe646-ff86-4420-98f0-a0f25d39de45', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '65948996-efe3-4691-aba4-b77924aa7ef2', 'f8653cdb-e2e7-479a-bfff-c8643859b866', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '664f9bac-fb7c-466c-acdb-d3c47517fb48', 'cca87ab1-8ad4-4876-a8d8-190f85927952', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '66748ccd-d30e-42f8-9982-9874763faf67', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6688a597-77cf-4344-ac75-e144f60ab7e5', '80436b4f-15c1-452f-9442-34e42b5117e4', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2025-06-09 03:50:33.78352'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '66d77fdd-da39-4681-a64b-72566d693338', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '66e923ea-62e5-473f-a698-9d96002d40bf', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', 'multiple_choice', $$Qual função principal do contrabaixo em uma orquestra?$$, NULL, '["Base harmônica e rítmica","Melodia principal","Percussão","Sons de fundo"]'::jsonb, '2025-06-16 05:35:57.478232'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '67a8da97-ef71-42da-a953-cabc02da65b1', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '67cc924e-6801-492b-9925-20cfeac6c674', '761a3318-9a5e-46f3-88f2-62159b96100c', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '68542507-1b19-4fab-a056-44cd0638ce57', '0b9c8c6b-0e47-471c-b83b-01c931410692', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '68fc4476-15c1-49db-890f-ea6396ad735d', 'bc665a4e-e301-44d3-b8bf-decb09422d71', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '691f1e39-9f10-43ca-a901-9b1349ab4754', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', 'true_false', $$O tubo do oboé mede mais de 2 metros quando desenrolado.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-20 13:35:33.950749'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '694b9508-6fa7-4a23-ae98-ff92c67859c6', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '69a881a6-43c9-417b-9b35-81aea92c553a', 'e48ad87b-d237-45e4-a707-05374c4240fa', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '69e7f5d8-40e1-464d-bda3-bbc05c364bbf', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', 'true_false', $$O fagote utiliza palheta dupla.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-20 02:52:13.984571'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6a02ace9-ee65-4b4a-898e-31c7a0673ffd', '56e32061-7ed6-495d-9bc1-00cdb345b02e', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6a3e6834-f99b-4a22-a424-b0c795f53445', 'fb125188-c48e-4d89-a46e-11c3b600dabd', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6a7f30ac-55d1-4dfa-a9e8-fca134b06edd', '35aff373-706c-47d8-8004-d8edcddb1e0c', 'multiple_choice', $$Qual técnica envolve estalar a corda contra o braço do baixo?$$, NULL, '["Slap","Pop","Legato","Staccato"]'::jsonb, '2025-06-16 04:46:25.659791'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6b0cac5e-967d-4bbb-b988-2579738e250b', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6b8444bb-6d1f-4481-8959-8413e5b6cf97', '2abbd218-b737-410e-934b-f9c8f3d2b806', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6b85c297-9b83-4449-aedf-3121dbdf1d2e', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', 'true_false', $$O contrabaixo acústico surgiu no século XVI.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-16 05:35:57.478232'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6b86511a-fac8-4b5d-b2b9-0a2370b5227f', '492f792b-8d0c-46b7-a195-c8c32114696d', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6bde0018-3dfa-4693-9a36-84f07fc93963', '9edff4db-9ef5-43fc-970a-7d2086de223b', 'multiple_choice', $$Função típica em quartetos:$$, $$Vozes internas/contracantos$$, '["Conduzir o baixo","Duplicar 1º violino","Vozes internas/contracantos","Somente percussão"]'::jsonb, '2025-09-22 11:49:42.121841'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6bf61152-2861-4e56-8f61-d2fbced37d58', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6cb31f81-0c09-49ae-b2f9-a1d184d7c2e8', '56e32061-7ed6-495d-9bc1-00cdb345b02e', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6d809d89-5798-4759-be6d-f46bcfcbbf0f', 'f8653cdb-e2e7-479a-bfff-c8643859b866', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6e286d61-c733-47b2-9601-c8e6c95c80c3', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', 'multiple_choice', $$Qual compositor é famoso por obras com solos de flauta?$$, NULL, '["Mozart","Chopin","Bach","Beethoven"]'::jsonb, '2025-06-15 19:44:31.82833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6e7d76c0-0ea5-4f27-82d7-6e772706b067', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6f19ecaa-543e-479d-83c3-590aeffa19e5', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '6f72b9b1-6770-45a6-bbf2-4992c663f868', '509d6a26-159a-4976-aa46-83f914f930aa', 'multiple_choice', $$Para que servem as válvulas do trompete?$$, NULL, '["Alterar a afinação","Aumentar o volume","Reduzir o peso","Decorar o instrumento"]'::jsonb, '2025-06-16 03:59:18.685879'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '71467d6b-f6bd-4ed8-9eb3-97f835a7d7e0', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '71a62027-dd6c-4163-85fc-fb19e049b599', '6925f61b-ba48-473a-b69a-e3548036c1df', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '7327f6a8-4825-4a98-b6c9-18c60f40b755', '492f792b-8d0c-46b7-a195-c8c32114696d', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '734953f5-9ec4-4521-a22a-b12f9435acfb', 'ab9720a5-1973-484e-9a44-d4aa62594336', 'true_false', $$Chopin é conhecido principalmente por suas obras para piano.$$, NULL, '["Verdadeiro", "Falso"]'::jsonb, '2025-06-08 18:58:30.227177'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '73cdb5d8-9669-4822-9f28-3551613a4631', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '74e9b436-f165-4672-af6b-914c022a9622', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '79051c9b-bd2f-4792-9e04-4ddaf5c72193', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '7957551d-220c-4e5b-a2d4-58dad32d2f2b', '453ca164-6f0e-4554-b008-dd68bf4586c2', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '79945e77-e379-4830-91f4-42a0fd61a373', 'bc665a4e-e301-44d3-b8bf-decb09422d71', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '79f5c409-c677-438a-a6c4-71c6e6fb1104', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '7d7f8973-2979-41b5-9659-53a6ecf07722', '56e32061-7ed6-495d-9bc1-00cdb345b02e', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '7d87e8e5-30a2-45e2-9e5f-e29909087151', '35aff373-706c-47d8-8004-d8edcddb1e0c', 'true_false', $$O baixo elétrico foi criado na década de 1950.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-16 04:46:25.659791'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '7e34fe0f-a94c-4cd7-9701-183175ed650d', '9a5e0eac-114e-4173-90af-32b55c870675', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '7e55bbe4-6943-4010-ad9d-ac516cfab3da', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', 'multiple_choice', $$Para que serve a curva do corpo do saxofone?$$, NULL, '["Facilitar a pegada","Melhorar a afinação","Reduzir o peso","Aumentar o volume"]'::jsonb, '2025-06-16 02:27:56.351591'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '7f5ddcea-2d69-49aa-8c74-670774ff8d97', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '802f35ab-6e92-4721-9f37-bc473901603c', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '80418c26-7c09-4eef-9e40-92250d694e22', 'df168c2e-275a-44ed-9ee7-af356bf724e5', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '813f59ab-512f-4ef5-9038-bd905743269c', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', 'multiple_choice', $$Em qual gênero o teclado é frequentemente usado como instrumento harmônico?$$, NULL, '["Jazz","Samba","Rock","Todos os anteriores"]'::jsonb, '2025-06-15 20:40:25.874273'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '815c1d78-338f-4a50-8478-416ec3dd3b6d', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8182cef2-202d-472a-9e03-20a29ef2d102', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', 'true_false', $$O legato no teclado é quando as notas são tocadas de forma contínua e ligada.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 20:40:25.874273'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '81bb4a2f-eacb-4bcf-84b1-7b92d5f96129', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', 'multiple_choice', $$Qual técnica envolve notas curtas e destacadas no fagote?$$, NULL, '["Staccato","Legato","Glissando","Harmônico"]'::jsonb, '2025-06-20 02:52:13.984571'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '81c777b7-8760-4811-9964-10614e50b392', 'f8653cdb-e2e7-479a-bfff-c8643859b866', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '822726b6-3531-4a52-a4bd-0092e41b374e', '35aff373-706c-47d8-8004-d8edcddb1e0c', 'multiple_choice', $$A técnica walking bass é usada em qual gênero tradicionalmente?$$, NULL, '["Jazz","Rock","Funk","Reggae"]'::jsonb, '2025-06-16 04:46:25.659791'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '827d5985-3c3d-4378-bdb2-86e4573cedbf', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', 'multiple_choice', $$Qual dessas técnicas envolve uso da madeira do arco?$$, NULL, '["Col legno","Spiccato","Pizzicato","Legato"]'::jsonb, '2025-06-15 19:36:14.631505'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8282464f-0fa6-4b4c-906b-30202fb42fed', '80436b4f-15c1-452f-9442-34e42b5117e4', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2025-06-09 03:50:33.78352'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '83c3c9e2-d0c1-4d90-9e11-0f1352edcb1a', '7b6ae164-dfdf-452d-a5c3-d01554861444', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8490ff4b-04b7-4276-b359-c95b7555e963', 'bc665a4e-e301-44d3-b8bf-decb09422d71', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '86ea4a86-c129-4c85-a697-41f7bc942ddb', 'bc665a4e-e301-44d3-b8bf-decb09422d71', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8825ac57-645d-4a4d-8cdc-75e289f0a6c4', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', 'multiple_choice', $$O que significa "pizzicato" no violão?$$, NULL, '["A) Tocar muito forte", "B) Tocar com a lateral da mão abafando as cordas", "C) Tocar harmônicos", "D) Tocar tremolo"]'::jsonb, '2025-06-08 01:08:54.801634'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '88321846-0eef-40b7-98d9-f0b8bcf130e1', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', 'auditiva', $$Escute o áudio e identifique a técnica utilizada$$, NULL, '["A) Tremolo", "B) Rasgueado", "C) Harmônicos", "D) Arpejo"]'::jsonb, '2025-06-08 01:08:54.801634'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8850de62-a191-45ba-92a4-e9c1735b643d', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '89032c80-0220-49ef-a08b-1b93129471b3', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '89378320-a7d2-4114-8927-2aa55b4789dd', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8a8af651-9c60-4135-93d5-214e253eb405', 'c75fe646-ff86-4420-98f0-a0f25d39de45', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8b70a967-206e-4205-a55e-22ce4c9e6cf9', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8d1b7b64-19df-4203-9f2a-5816e5a9374e', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8e334fcf-1c7f-4245-8c55-e096f19078d0', '2abbd218-b737-410e-934b-f9c8f3d2b806', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8f2b2dd2-41b6-4f3a-81b1-0ff4aa6666b8', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8fd14dbe-0df6-48ca-a478-865e90c195b2', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '8fda01c8-400c-44f0-a1a8-f67b279b0718', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '91216355-08f4-4a6a-9636-172fe3cb56c7', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '92074062-d2d0-46e4-b8ae-aa3617f78a33', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '92d1d67e-ab16-43f8-b758-43b325c759ea', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', 'multiple_choice', $$Qual dessas técnicas produz notas curtas e destacadas no trombone?$$, NULL, '["Staccato","Legato","Glissando","Pedal"]'::jsonb, '2025-06-20 14:38:50.726656'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '92e507ef-ff4a-4b17-a015-0519ea3d1d46', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', 'multiple_choice', $$Em qual gênero o contrabaixo faz a linha de walking bass?$$, NULL, '["Jazz","Rock","Samba","Reggae"]'::jsonb, '2025-06-16 05:35:57.478232'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '93ed7588-8cbf-4197-8c24-2cf8531ce8a6', '9c3a903d-8750-4ded-9341-c876a6d6de93', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '942c7c86-c512-4b86-b851-f1ab09e6e244', '56f643e0-a3e2-4067-84ac-334c454426f8', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '9531f057-ab06-448a-a642-c8a72671ae33', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '95e60f6a-b14b-4c53-906e-8d8e09def9ae', '57d10b2f-c49f-460d-8fab-3da3065c15c2', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '96c105bb-7f6c-4c31-8181-70a654881b86', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '97aed2f0-9a19-4558-9959-9cf548e421aa', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '97e18df0-128c-4127-b6e5-4766d62ad182', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '97f0765e-c2b5-47ef-945f-f897fae01a6d', '761a3318-9a5e-46f3-88f2-62159b96100c', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '98c4a18b-a2e7-4116-8ea9-bd543fea2952', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '99373460-1945-458c-a9a4-9c24187f81b9', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', 'multiple_choice', $$Qual técnica envolve deslizar entre notas no contrabaixo?$$, NULL, '["Glissando","Staccato","Legato","Harmônico"]'::jsonb, '2025-06-16 05:35:57.478232'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '99541e7d-d815-441d-8816-0ba5021b3ffa', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '99bddb6c-576f-46aa-a928-0c7b8730a4a1', 'ab9720a5-1973-484e-9a44-d4aa62594336', 'multiple_choice', $$Qual a origem da palavra "piano"?$$, NULL, '["A) Do italiano piano (suave)", "B) Do latim planus (plano)", "C) Do grego planetos (errante)", "D) Do francês plaine (planície)"]'::jsonb, '2025-06-08 18:58:30.227177'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '99c26414-ce5f-481f-a414-5377391a782a', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', 'multiple_choice', $$Qual função típica do oboé em uma orquestra?$$, NULL, '["Dá o tom para afinação","Percussão de apoio","Base harmônica","Melodia das cordas"]'::jsonb, '2025-06-20 13:35:33.950749'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '9a370187-62a5-40ed-8f8b-913b64021b18', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '9a85204e-033b-4c5e-aa82-4be7b554c378', '6925f61b-ba48-473a-b69a-e3548036c1df', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '9b3b70b8-51de-431b-9139-1454c8b1221f', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', 'true_false', $$O clarinete usa palheta dupla para produzir som.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 19:29:35.990833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '9c42578c-9410-4951-9a8a-db7edfa1e78f', 'cca87ab1-8ad4-4876-a8d8-190f85927952', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '9f6c2e5b-f236-48b1-902d-de1259b543d7', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', '9ff39937-685f-4eca-85b6-38faccb27ca7', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a076c13e-c0ce-4a2b-b58d-3a45d7dcd35d', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0e9d4bf-ea27-4361-826f-4c1218bf3463', '9edff4db-9ef5-43fc-970a-7d2086de223b', 'multiple_choice', $$Alternância rápida entre cordas:$$, $$Bariolage$$, '["Portamento","Bariolage","Vibrato","Glissando"]'::jsonb, '2025-09-22 11:49:42.121841'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a12e3019-205b-43ad-a469-364364712503', '6925f61b-ba48-473a-b69a-e3548036c1df', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a2398c90-cfa1-423c-8e4a-ca4bf287f74f', 'fb125188-c48e-4d89-a46e-11c3b600dabd', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a28188f1-be75-47d4-8b62-c50e69b0234f', '32705505-7727-4d27-b7bd-b08e7c90c233', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a3588b82-4ffb-4a9b-8d64-0d4d85e06291', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a366eaa6-34c7-4a70-9c56-c2a003c2e669', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', 'multiple_choice', $$Qual é a função principal do pedal de expressão em teclados eletrônicos?$$, NULL, '["Controlar o volume","Trocar timbres","Ativar ritmos","Ligar o instrumento"]'::jsonb, '2025-06-15 20:40:25.874273'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a3f5049c-f901-4fbd-9712-1a0aeb873f5e', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', 'true_false', $$Na flauta transversal, o som é produzido pela vibração de uma palheta.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 19:44:31.82833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a4b0d515-ab8a-49ad-b6d6-79f8ae036a4d', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', 'multiple_choice', $$O clarinete pertence a qual família instrumental?$$, NULL, '["Metais","Cordas","Madeiras","Percussão"]'::jsonb, '2025-06-15 19:29:35.990833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a5381ca6-06bb-4459-b1fe-be43027dcd2d', 'df168c2e-275a-44ed-9ee7-af356bf724e5', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a5fbd5cb-ff39-4b50-98d0-3c428d68b105', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', 'true_false', $$O trombone utiliza uma vara deslizante para alterar as notas.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-20 14:38:50.726656'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a6649545-ef81-4a49-b4a0-f3d0935c4807', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a697a335-f53c-4605-9fca-e45e8c867422', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a6f9a914-bc71-4331-baa4-74560bbdd3a2', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', 'multiple_choice', $$Qual efeito você ouve neste exemplo?$$, $$Distortion$$, '["Reverb", "Distortion", "Chorus", "Delay"]'::jsonb, '2025-06-09 04:31:33.040825'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a7e3c5b2-c212-4c8b-8948-37b21b9908e6', '32705505-7727-4d27-b7bd-b08e7c90c233', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a874d282-69bd-408d-81f1-bdad38a5ac44', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'a9e8fbea-28b7-4c62-8793-99afb1a17d0f', '9edff4db-9ef5-43fc-970a-7d2086de223b', 'multiple_choice', $$Peça que transmite vibração ao tampo:$$, $$Cavalete$$, '["Estandarte","Cravelhas","Cavalete","Pestana"]'::jsonb, '2025-09-22 11:49:42.121841'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa005b2f-52db-4b03-b2bc-1bda8910608d', '1b699036-0f72-4c48-9801-e01f6f25e165', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa0e8400-e29b-41d4-a716-446655550001', '86f83611-c0db-470c-87e7-31ee81b1a009', 'multiple_choice', $$Em que ano foi inventado o pedal de bumbo?$$, $$1909$$, '["1905", "1909", "1915", "1920"]'::jsonb, '2025-06-09 03:02:15.181032'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa0e8400-e29b-41d4-a716-446655550002', '86f83611-c0db-470c-87e7-31ee81b1a009', 'multiple_choice', $$Onde surgiu a bateria moderna?$$, $$New Orleans$$, '["Chicago", "New York", "New Orleans", "Memphis"]'::jsonb, '2025-06-09 03:02:15.181032'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa0e8400-e29b-41d4-a716-446655550003', '86f83611-c0db-470c-87e7-31ee81b1a009', 'multiple_choice', $$Quem montou a primeira bateria completa?$$, $$William Ludwig$$, '["Buddy Rich", "Gene Krupa", "William Ludwig", "Ringo Starr"]'::jsonb, '2025-06-09 03:02:15.181032'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa0e8400-e29b-41d4-a716-446655550006', '86f83611-c0db-470c-87e7-31ee81b1a009', 'multiple_choice', $$Quantas notas por segundo Buddy Rich tocava?$$, $$32$$, '["28", "30", "32", "35"]'::jsonb, '2025-06-09 03:02:15.181032'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa0e8400-e29b-41d4-a716-446655550007', '86f83611-c0db-470c-87e7-31ee81b1a009', 'multiple_choice', $$O que é linear playing?$$, $$Sem sobreposição de membros$$, '["Tocar em linha reta", "Sem sobreposição de membros", "Tocar rápido", "Usar só uma mão"]'::jsonb, '2025-06-09 03:02:15.181032'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa0e8400-e29b-41d4-a716-446655550008', '86f83611-c0db-470c-87e7-31ee81b1a009', 'multiple_choice', $$Qual peça produz o som mais grave?$$, $$Bumbo$$, '["Caixa", "Tom", "Bumbo", "Prato"]'::jsonb, '2025-06-09 03:02:15.181032'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa0e8400-e29b-41d4-a716-446655550009', '86f83611-c0db-470c-87e7-31ee81b1a009', 'multiple_choice', $$Que tipo de som produz o chimbal fechado?$$, $$Agudo e curto$$, '["Grave e longo", "Agudo e curto", "Médio e sustentado", "Grave e curto"]'::jsonb, '2025-06-09 03:02:15.181032'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa2bd5ff-4af0-42e8-b27c-215b43ed6786', '2abbd218-b737-410e-934b-f9c8f3d2b806', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab3ce12c-2d99-411d-98a8-19889a882777', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac1de430-c160-483f-9ba2-29582d8e3e46', '2abbd218-b737-410e-934b-f9c8f3d2b806', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac75f702-eaf8-4e7c-ac92-904a7738f6fe', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ad2dd6e1-aa55-45d9-8edd-51b132887055', '80436b4f-15c1-452f-9442-34e42b5117e4', 'multiple_choice', $$Identifique a dinâmica musical$$, $$Crescendo$$, '["Pianissimo", "Forte", "Crescendo", "Staccato"]'::jsonb, '2025-06-09 03:50:33.78352'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ae09f92d-49e3-42a6-b31d-d6add7741781', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ae0dabb0-369a-4905-9abf-b6ce2b0c9e2e', 'df168c2e-275a-44ed-9ee7-af356bf724e5', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'aea394b5-47a4-4881-bb7a-925f9f945de2', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'af0da5b3-890b-47ff-804f-d6e465309421', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'af8b9188-fe5c-41f8-b4c7-c346347a8230', '92ecdeff-3480-4f27-85cd-86f12622cf9f', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b0645a3d-793b-4f98-ae87-1ee71d4ae8b8', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', 'true_false', $$A flauta é capaz de executar harmônicos.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 19:44:31.82833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b0f17be6-1775-4763-a9e3-7c4f14cac23a', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b10f4caf-7fb6-486a-8c7b-3faa6ac4deb5', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', 'multiple_choice', $$Qual técnica envolve notas curtas e destacadas no oboé?$$, NULL, '["Staccato","Legato","Glissando","Harmônico"]'::jsonb, '2025-06-20 13:35:33.950749'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b2dc6d5f-b07e-4b52-b690-bbd6f5b5cf49', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b30d418b-0866-461c-b80b-2629095a1d2d', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b369fc41-e877-475b-a9b6-4d03b01bf213', '492f792b-8d0c-46b7-a195-c8c32114696d', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b38aa849-e11c-4738-9070-e0172b1a7f9d', 'cca87ab1-8ad4-4876-a8d8-190f85927952', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b3e888a4-31bf-43f2-b897-1af20c492b2d', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b3fed0d3-994b-4960-8cdd-0a377256e379', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b42480c7-74b5-40ce-9514-3362c448f5a3', 'df42056c-8a3e-454c-aeca-73b4d608b85c', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b4ca9580-7f2a-468e-85db-50038d65ef3b', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b4f49186-30f3-4b9a-9ae9-1eba2eacdfd7', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', 'multiple_choice', $$Qual técnica é característica no trombone e permite deslizar entre notas?$$, NULL, '["Glissando","Staccato","Legato","Harmônicos"]'::jsonb, '2025-06-20 14:38:50.726656'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b54db841-4674-452e-829a-b24ad579d9d6', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b55d21fd-53c6-4b55-abc4-90fd30ee276c', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b62de4dd-fabd-498b-8b62-af9e02ec8d92', 'fb125188-c48e-4d89-a46e-11c3b600dabd', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b6652526-ce83-40c2-ad6c-9209d5b0ccd7', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b74e9618-4588-46de-adc5-a09b4cbc643b', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b7c1cedf-4cbc-416f-b7d5-59f3519eaf9c', '9c3a903d-8750-4ded-9341-c876a6d6de93', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8e7866f-1fdf-4304-ac77-316bd025b295', 'df42056c-8a3e-454c-aeca-73b4d608b85c', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8f079e8-7f34-4bb8-9b3b-b6ef1ec10ffb', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'b91d6c26-96c3-424a-96bd-d45987093d34', '9a5e0eac-114e-4173-90af-32b55c870675', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ba90eb1f-5956-4e3b-82f0-c49b02e1f262', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'bb1fa6fa-0ebd-4e51-b2aa-b45f7f3844a3', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc7e30ca-cb94-4402-a1eb-d084bd42dad1', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', 'multiple_choice', $$O contrabaixo acústico pertence a qual família instrumental?$$, NULL, '["Cordas Friccionadas","Sopro","Percussão","Teclado"]'::jsonb, '2025-06-16 05:35:57.478232'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'bcac25a0-586c-4f09-91e3-f09c10584223', '492f792b-8d0c-46b7-a195-c8c32114696d', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'bcb9b8ee-4f40-48ab-9bc8-9279a23fe8f3', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'bcf18157-9b83-44b0-8e6f-a1bb51e8a1cf', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'bd0b9996-e931-4c8a-9bbb-04f1c502c185', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'be04673d-d68f-456d-bce4-0eb31ec311b0', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', 'true_false', $$O fagote tem tubo reto com pouco mais de 1 metro.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-20 02:52:13.984571'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'be339e62-c624-4114-a973-c6e9ef68ca2d', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'bf542959-e216-4344-8848-19bc9b403c7e', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'bf5b4b11-f473-478b-85d0-1a8dc699df19', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c028235f-02d2-4158-be39-a2993640a338', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c1098d26-dc2b-4d14-bda8-d92485c90697', 'bc665a4e-e301-44d3-b8bf-decb09422d71', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c152513a-419e-44b0-864a-a444e3ad8b4d', 'cca87ab1-8ad4-4876-a8d8-190f85927952', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c19fd03b-a6cb-46ac-8e2e-856327a9f3ef', '35da6877-2528-4f37-9ab4-b44893ad1dbf', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c21cce9a-d162-4be8-9e6f-750bc84ada59', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', 'multiple_choice', $$Identifique a técnica sendo executada$$, $$Tapping$$, '["Power chord", "Bend", "Tapping", "Palm mute"]'::jsonb, '2025-06-09 04:31:33.040825'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c27c39a6-cd23-4304-b1c2-ce272ebc1170', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c2b0f3f1-e186-439f-99dc-cce15b22cba4', 'c75fe646-ff86-4420-98f0-a0f25d39de45', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c2cce2c4-6421-42f2-a568-3ea1ff2c27c8', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c398bdd3-7734-4a30-8591-a4ecb91d347b', 'f8653cdb-e2e7-479a-bfff-c8643859b866', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c3f3392e-3550-4fa9-adaf-1155272049ed', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c3f53d07-598f-4d79-a635-61ce74f40fa4', '32705505-7727-4d27-b7bd-b08e7c90c233', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c6bfdebd-db32-4c12-8057-0f9c914e0641', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c7b954e2-decd-4108-aacb-7f623d8b5b64', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c7c263e1-5f90-4304-8388-41dbe9b13833', '36040329-1aa6-428a-ad39-cd85de03493e', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c7dd0cd5-6af9-40d6-b7ad-57a8f6bb85ff', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c8187623-9a8f-4999-bf62-3b7bf976efdf', 'df168c2e-275a-44ed-9ee7-af356bf724e5', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c86cb7f4-5d31-47a3-9d33-981e07d06c10', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c8a1ad2e-f269-40ef-8c3c-90de758adec1', '80436b4f-15c1-452f-9442-34e42b5117e4', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2025-06-09 03:50:33.78352'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c97e7517-cee5-4b7d-b050-1718fb96a35d', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c9af57f2-4c53-440e-9b3d-60f7d291ef05', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', 'multiple_choice', $$Em que século o violão chegou ao Brasil?$$, NULL, '["A) Século XV", "B) Século XVI", "C) Século XVII", "D) Século XVIII"]'::jsonb, '2025-06-08 01:08:54.801634'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'c9e8e53a-e58c-4ab7-8238-ea15d484aa3f', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca77f537-11e7-4761-a0a1-9dd024e46c0e', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cb88c24f-5a90-475c-8dd9-75fe6efd9b79', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cb92b00f-1ce0-454d-a7bc-43b495f2b181', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', 'true_false', $$O saxofone utiliza palheta simples para produção de som.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-16 02:27:56.351591'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cc20281a-b64e-4736-b356-3e3e1d54bb3d', '32705505-7727-4d27-b7bd-b08e7c90c233', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cc769d6a-f6c2-461c-a466-b0eb519811fa', '9a5e0eac-114e-4173-90af-32b55c870675', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ccee9775-8a14-454e-87f4-c7e54f2469fc', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', 'multiple_choice', $$O violoncelo pertence a qual família instrumental?$$, NULL, '["Cordas","Sopro","Percussão","Teclado"]'::jsonb, '2025-06-15 19:36:14.631505'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cd8a89f6-e10b-49ad-8d0b-0a7294a7cfbd', '1b699036-0f72-4c48-9801-e01f6f25e165', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cda384c9-97ca-4f44-b4d5-135bb30f8850', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cebeca89-7446-4504-a058-50bc4d3591f9', 'df168c2e-275a-44ed-9ee7-af356bf724e5', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cef30aa4-1581-4dec-9267-9370db271233', '9a5e0eac-114e-4173-90af-32b55c870675', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cf1fd061-7649-4e27-beeb-28999405a77d', '80436b4f-15c1-452f-9442-34e42b5117e4', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2025-06-09 03:50:33.78352'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cf430d64-56ea-405c-a5cf-62132c072b09', '7b6ae164-dfdf-452d-a5c3-d01554861444', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cf612c4c-acbf-4f20-bdfa-1b15ad832429', 'f8653cdb-e2e7-479a-bfff-c8643859b866', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'cff79c08-26c2-455a-9ea8-10cc79675b2d', '9c3a903d-8750-4ded-9341-c876a6d6de93', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd0469867-6c61-4b74-b848-0a0836dfc051', '92ecdeff-3480-4f27-85cd-86f12622cf9f', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd13bf1a8-faf6-4006-948e-e93b454c43bd', '509d6a26-159a-4976-aa46-83f914f930aa', 'multiple_choice', $$Quem popularizou o trompete no jazz?$$, NULL, '["Louis Armstrong","Johann Sebastian Bach","Adolphe Sax","Antonio Vivaldi"]'::jsonb, '2025-06-16 03:59:18.685879'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1585401-abc5-4e73-8bf2-3bfa71240944', '92ecdeff-3480-4f27-85cd-86f12622cf9f', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1e295ba-1e12-4aee-8c5a-8728431ac81f', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd2d99b55-8a86-487b-ad6e-c4ba3d6c9954', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd3357462-3f93-4600-ab36-05043b4c7a03', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd35faab7-e5fb-40d1-80bd-eb41a96a84a4', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd39300c8-dc58-42ef-a8b0-ecde8a37fb79', 'ab9720a5-1973-484e-9a44-d4aa62594336', 'multiple_choice', $$Quantas cordas aproximadamente tem um piano de cauda?$$, NULL, '["A) 88 cordas", "B) 150 cordas", "C) 240 cordas", "D) 300 cordas"]'::jsonb, '2025-06-08 18:58:30.227177'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd58d5f52-8839-4209-8f23-c92f57d4f83e', '82052c70-0a9d-4d94-873e-3b402e032f55', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd5c9d964-50e2-4e8c-b76a-8f26a31f0a92', 'e48ad87b-d237-45e4-a707-05374c4240fa', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd6174e5d-5c50-4298-9959-818984eff79b', '1b699036-0f72-4c48-9801-e01f6f25e165', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd6206c37-511b-4675-bc5e-d562a8446ea6', '761a3318-9a5e-46f3-88f2-62159b96100c', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd62589f9-93d0-410e-b3f1-cd3860e90e4b', '453ca164-6f0e-4554-b008-dd68bf4586c2', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd63f7a54-28fc-411f-ba46-802826785741', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd64980cc-6551-4190-8f8d-09bed6fbc093', '7b6ae164-dfdf-452d-a5c3-d01554861444', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd8c9b188-7102-4b3a-b676-acbc0ce4deda', 'cca87ab1-8ad4-4876-a8d8-190f85927952', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'd9cd01e3-53f6-4dc1-bfc8-2b6184e414ed', '1b699036-0f72-4c48-9801-e01f6f25e165', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'da2cc710-fa62-488d-bbd7-f0426a7c3934', '0b9c8c6b-0e47-471c-b83b-01c931410692', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'da6b3694-2336-4607-8cd9-afde4e5eebe6', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', 'true_false', $$A técnica de pinçar as cordas com os dedos chama-se pizzicato.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 19:36:14.631505'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'daabeb48-bfb2-4f03-9251-01845c349217', '56e32061-7ed6-495d-9bc1-00cdb345b02e', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'db4ec284-16bb-4b81-9559-8d2545c71956', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc2d2826-a683-4d42-ba60-4fb70b6d499a', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc6bc1de-4f3b-4876-b679-9281000db9f6', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'dcbc7597-4c33-4261-8517-0cdc95e90739', '492f792b-8d0c-46b7-a195-c8c32114696d', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ddcbaf62-59bf-4cc7-b003-dab987f4c9c4', 'bc665a4e-e301-44d3-b8bf-decb09422d71', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'de71e11f-ca36-418d-ac59-df5d60d790f1', '32705505-7727-4d27-b7bd-b08e7c90c233', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'de727052-b27e-461e-b5f6-f089fedb6959', '9edff4db-9ef5-43fc-970a-7d2086de223b', 'multiple_choice', $$Afinação padrão da viola é:$$, $$C3–G3–D4–A4$$, '["G3–D4–A4–E5","C3–G3–D4–A4","B2–E3–A3–D4","D3–A3–E4–B4"]'::jsonb, '2025-09-22 11:49:42.121841'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'df0bdfb7-e853-47e9-8a70-d6771408e6f4', '35aff373-706c-47d8-8004-d8edcddb1e0c', 'true_false', $$O som do baixo elétrico é amplificado por captadores eletrônicos.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-16 04:46:25.659791'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'df1f01db-e00a-4964-90e2-72f83c669a1b', '2abbd218-b737-410e-934b-f9c8f3d2b806', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'dffbfe82-9523-4c6c-9299-fa090aa48630', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', 'multiple_choice', $$Em qual estilo o col legno é usado com frequência?$$, NULL, '["Clássico","Jazz","Samba","Rock"]'::jsonb, '2025-06-15 19:36:14.631505'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e0c00f91-6a06-4d07-8182-0fa520537e56', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e0d2b9bb-fcba-477f-b734-ee30d14eaca3', '509d6a26-159a-4976-aa46-83f914f930aa', 'multiple_choice', $$Qual destas técnicas envolve deslizar entre notas no trompete?$$, NULL, '["Glissando","Trinado","Staccato","Legato"]'::jsonb, '2025-06-16 03:59:18.685879'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1014d69-d7b8-4954-9f77-43c847169554', 'e48ad87b-d237-45e4-a707-05374c4240fa', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1b88396-05f1-45a5-a426-58aa6e2593ff', 'c75fe646-ff86-4420-98f0-a0f25d39de45', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1cfbc2f-8665-4df3-a466-82391e4bcbda', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e21faa5f-47d3-4fc1-a973-6cac855e0733', '35da6877-2528-4f37-9ab4-b44893ad1dbf', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e23ce379-d76a-4b22-9a2e-fe76cb76eb83', '9c3a903d-8750-4ded-9341-c876a6d6de93', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2ee070a-9a81-4bc6-b6d8-8d819f0c7faa', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e3444bc4-ef40-48a2-9898-a138a11d4561', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e3670e9e-60e9-4dd1-828c-fc27bcd5deb9', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e3758984-6395-4aa0-adee-2bab5039c76a', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', 'true_false', $$As cordas de nylon foram inventadas especificamente para o violão.$$, NULL, '["Verdadeiro", "Falso"]'::jsonb, '2025-06-08 01:08:54.801634'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e58ca915-a949-4144-88ef-30d4f9475cb3', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e6c4e953-58a6-4b14-a2e3-510987f97440', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e78fce30-26d0-4424-9673-b699bf33aa21', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', 'multiple_choice', $$O vibrato na flauta é criado principalmente por:$$, NULL, '["Movimento da mão","Movimento dos dedos","Variação da pressão do ar","Uso das chaves"]'::jsonb, '2025-06-15 19:44:31.82833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e7f9f128-a973-4714-9942-7b665dfb8298', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e8335d03-99ce-49ff-9675-8c6d227a9073', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9978664-beff-4942-98b7-e1624bbde4e7', '7b6ae164-dfdf-452d-a5c3-d01554861444', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9d6993a-a1e0-44b5-bb70-c89190eb89f1', 'ab9720a5-1973-484e-9a44-d4aa62594336', 'multiple_choice', $$Quantas teclas tem um piano moderno?$$, NULL, '["A) 76", "B) 88", "C) 61", "D) 96"]'::jsonb, '2025-06-08 18:58:30.227177'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ea364da6-dfe4-4b85-8620-ebb99acba96a', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', 'multiple_choice', $$Qual destas técnicas envolve deslizar entre notas?$$, NULL, '["Glissando","Trinado","Staccato","Legato"]'::jsonb, '2025-06-16 02:27:56.351591'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ea527b2f-6751-4612-b880-22591b14d592', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'eba657f2-e262-4b7a-b27b-54da8a9f31e9', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', 'multiple_choice', $$Qual a função principal das chaves na flauta?$$, NULL, '["Alterar o comprimento da coluna de ar","Afinar a flauta","Sustentar o instrumento","Aumentar o volume"]'::jsonb, '2025-06-15 19:44:31.82833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ebdcf896-7347-4514-a39c-4bffdab87d7d', '82052c70-0a9d-4d94-873e-3b402e032f55', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec074641-76f6-41b1-804d-e9ebe924b38d', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ecedeaca-aca3-4054-8b49-d8b1135f8778', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ed1957dc-c715-4c98-b24b-b4dc27f1c8cc', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ed3bed98-d7e3-4971-becd-6c8aef9a6154', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', 'visual', $$Na imagem, qual parte do violão está destacada?$$, NULL, '["A) Cavalete", "B) Pestana", "C) Boca", "D) Tarraxas"]'::jsonb, '2025-06-08 01:08:54.801634'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'edfdccb3-1094-4912-8de1-938a52a29d63', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef1c8bc3-fd58-4017-b3cb-9221caf2583d', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', 'true_false', $$O registro agudo da flauta soa mais suave do que o grave.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 19:44:31.82833'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef90f6aa-2953-4e88-90e6-3a2d53896f40', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', 'multiple_choice', $$Quantas cordas possui uma guitarra padrão?$$, $$6$$, '["4", "5", "6", "7"]'::jsonb, '2025-06-09 04:31:33.040825'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'efaad2d6-ff34-4690-8a6f-ec6fc14d1899', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f07c611a-128c-4874-a7bb-62c578a4b15f', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', 'true_false', $$O pedal de sustentação serve para prolongar o som das notas.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 20:40:25.874273'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f09b8959-a578-49a5-b345-e07d7050d336', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0b3012b-7eea-4576-9dbd-656d152c95b1', '35da6877-2528-4f37-9ab4-b44893ad1dbf', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0ed4f8c-c786-4860-8714-1dc0c9e226b1', 'fb125188-c48e-4d89-a46e-11c3b600dabd', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f11aa556-8140-427f-8c42-1d41cd7a08b2', '509d6a26-159a-4976-aa46-83f914f930aa', 'multiple_choice', $$O trompete pertence a qual família instrumental?$$, NULL, '["Metais","Madeiras","Cordas","Percussão"]'::jsonb, '2025-06-16 03:59:18.685879'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f199c373-5a63-4a88-b3ba-824d9e1f2ff7', '2abbd218-b737-410e-934b-f9c8f3d2b806', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f24d4c34-b07b-49f4-9928-d8c9233f71c2', '9a5e0eac-114e-4173-90af-32b55c870675', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f29ea0cb-8ea8-45f3-a972-5d2e6aa4968d', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2b71879-b2c8-4a57-806a-98bfc8f89f06', 'ab9720a5-1973-484e-9a44-d4aa62594336', 'multiple_choice', $$O piano é um instrumento de qual família?$$, NULL, '["A) Cordofones", "B) Aerofones", "C) Membranofones", "D) Idiofones"]'::jsonb, '2025-06-08 18:58:30.227177'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f3640b61-c408-47fa-98aa-7245698ae6fe', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', 'true_false', $$O fagote surgiu no período renascentista.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-20 02:52:13.984571'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f3aecf9e-7e80-470a-ba64-9b6a3a020b0a', '32705505-7727-4d27-b7bd-b08e7c90c233', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f423e171-4dc9-456a-ba90-4f075569d98c', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f4452f0b-e817-4c46-8791-22ce886599a0', '6925f61b-ba48-473a-b69a-e3548036c1df', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f480d45d-16bf-48b9-b7d5-ee73d9a5f9e7', '36040329-1aa6-428a-ad39-cd85de03493e', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f57a67b3-4d3c-4d26-bcdb-accb4d7b86d0', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f5abab0d-a678-4d64-9a36-c54c706abfde', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f631729a-a6b4-46a3-8c47-848d7910cf58', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f84b617a-2165-4b1e-9767-d36f8d2b1a0f', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f84f8ca4-6bad-47df-8be4-b3c18c62d55b', '57d10b2f-c49f-460d-8fab-3da3065c15c2', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f89cbd98-4dbe-454e-a4a4-c428ccd85edd', '35da6877-2528-4f37-9ab4-b44893ad1dbf', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f95fadd5-2075-4a65-b57f-8e4f58453c8a', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', 'true_false', $$O violoncelo cobre uma faixa de som mais grave que o violino.$$, NULL, '["Verdadeiro","Falso"]'::jsonb, '2025-06-15 19:36:14.631505'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'f986fe5a-d464-4f0d-85a3-d6cbdb25ca58', '92ecdeff-3480-4f27-85cd-86f12622cf9f', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa16836c-a8ab-43dd-bc6e-c3b31a2295f2', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', 'multiple_choice', $$Quantas cordas possui um violino?$$, $$4$$, '["3", "4", "5", "6"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'faeecd15-db6d-40ef-9b9e-27a1a70e976e', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fb40104e-3e9e-46a2-9179-e22dd91a36cd', '453ca164-6f0e-4554-b008-dd68bf4586c2', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fb5bb1bb-a6d9-4213-ac7d-4d84046a16b6', '35aff373-706c-47d8-8004-d8edcddb1e0c', 'multiple_choice', $$O baixo elétrico pode ter quantas cordas?$$, NULL, '["4","5","6","Todas as anteriores"]'::jsonb, '2025-06-16 04:46:25.659791'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fc5ce532-f0f1-4c52-8d55-124b2744e1e4', '82052c70-0a9d-4d94-873e-3b402e032f55', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fc60b87b-b6a0-4e18-bc60-1534d686d192', '0b9c8c6b-0e47-471c-b83b-01c931410692', 'multiple_choice', $$Como se chama a peça interna do violino?$$, $$Alma$$, '["Cavalete", "Alma", "Pestana", "Cravelha"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fcd4fc92-5cb3-4d66-b0e9-31953d9d5ae8', '0b9c8c6b-0e47-471c-b83b-01c931410692', 'multiple_choice', $$Em que país surgiu o violino moderno?$$, $$Itália$$, '["França", "Itália", "Alemanha", "Inglaterra"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe3943d6-1e27-4f2c-81a1-7a59d99eade7', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe516318-a09f-4272-bdcc-8cabbc2238dd', '6925f61b-ba48-473a-b69a-e3548036c1df', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe7048f6-b4ba-4d33-8760-5c0f13d1b272', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', 'multiple_choice', $$Que cientista famoso tocava violino?$$, $$Albert Einstein$$, '["Isaac Newton", "Albert Einstein", "Galileu Galilei", "Charles Darwin"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe96c8f5-4778-4cd5-b2b5-9fcb8cbe24af', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', 'multiple_choice', $$Qual a extensão sonora do violino?$$, $$4 oitavas$$, '["2 oitavas", "3 oitavas", "4 oitavas", "5 oitavas"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fee315ec-5e99-4953-a8c6-6615c01c3572', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', 'multiple_choice', $$Qual técnica oscila a afinação?$$, $$Vibrato$$, '["Pizzicato", "Staccato", "Vibrato", "Legato"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'ffa0b661-4504-4fb8-8652-40905959bd95', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_quizzes (tenant_id, id, instrument_id, question_type, question, correct_answer, options, created_at, points)
VALUES ('00000000-0000-0000-0000-000000000001', 'fff12e9d-24fb-4ffb-8d1a-bf7cc0189daa', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', 'multiple_choice', $$Qual luthier é considerado o mais famoso?$$, $$Antonio Stradivarius$$, '["Giuseppe Guarneri", "Antonio Stradivarius", "Andrea Amati", "Nicolò Amati"]'::jsonb, '2026-02-13 17:39:51.350782'::timestamptz, 10)
ON CONFLICT (id) DO NOTHING;

COMMIT;