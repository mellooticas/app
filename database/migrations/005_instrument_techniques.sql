-- =============================================
-- Migration: 005_instrument_techniques.sql
-- Table: core.instrument_techniques
-- Source CSV: instrumento_tecnicas_rows.csv
-- Generated: 2026-02-28T16:15:03.233Z
-- Rows: 828
-- =============================================

BEGIN;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0018ad41-dee0-4f42-952f-220ace78ea2b', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Respiração contínua$$, $$Respiração controlada para manter o som sem pausas.$$, 'advanced', $$https://www.youtube.com/watch?v=sax_tecnica9$$, 9, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '001e39db-079b-4488-9259-5fe755e8d4c4', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Martelé$$, $$Ataque definido e curta sustentação$$, 'intermediate', NULL, 5, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '00dac112-3d6c-479a-acdc-fbba64cfd867', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Postura correta$$, $$Posição do corpo e do instrumento para execução confortável.$$, 'beginner', $$https://www.youtube.com/watch?v=contrabaixo_tecnica1$$, 1, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '012dfbb5-7eda-43ef-9e32-97aba950c783', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '014b5379-7860-4a40-8e7f-d33e3b8dc29a', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '016ab4e1-ef23-405e-863b-a555ef445bbe', '509d6a26-159a-4976-aa46-83f914f930aa', $$Escala cromática$$, $$Execução fluida da escala cromática.$$, 'advanced', $$https://www.youtube.com/watch?v=trompete_tecnica10$$, 10, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '01795192-7834-4e93-ad92-3f1fc37fb910', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '019dfb35-7c40-47d7-9213-0fe3ee26baac', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Acordes$$, $$Formação e execução de acordes maiores.$$, 'intermediate', $$https://www.youtube.com/watch?v=teclado_tecnica6$$, 6, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '019e0572-06ee-4506-8bb5-13f1b946c893', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '01b99d75-b0c7-4058-b19e-c7064c47d262', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Escala cromática$$, $$Execução da escala cromática completa.$$, 'advanced', $$https://www.youtube.com/watch?v=trombone_tecnica11$$, 11, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '01c3d08c-121e-4d05-bc89-89e8f0253884', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '02126601-0b64-4f84-aeb5-e17df495c9bb', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '026d28bb-7948-4bee-9724-6fd3779bb278', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0281984c-fa5d-486c-86a7-c691f3db5be2', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '02a1d632-575d-4a21-b46c-7705c4fe1649', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '02e67876-56d3-48c8-95e4-88f280a881a7', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '036c8f70-c76b-4cea-abc3-e957a2f80280', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '03a6c0e7-c0db-420f-ba0b-6085f29cbcec', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '03b9504d-5c83-4150-8d4c-f328ecfdca98', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Hammer-on e Pull-off$$, $$Técnicas de ligadura que criam notas sem usar a palheta, essenciais para fluência.$$, 'intermediate', NULL, 8, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0445bd2c-2182-4a36-b328-7555652f5b8e', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0499bf20-ddad-4511-a10a-b8612df96765', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '04a98b22-ff37-4a05-9ddf-2350c9dc16a5', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0543e41b-97e5-498f-84fa-dace233234d4', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Escala cromática$$, $$Execução da escala cromática completa.$$, 'advanced', $$https://www.youtube.com/watch?v=contrabaixo_tecnica11$$, 11, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '054c7735-2656-4599-95f4-4c0190ba8dcd', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0553908a-4ddb-4c30-8295-566ab128d5d3', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Ligados (Hammer-on e Pull-off)$$, $$Técnicas para ligar notas sem atacar todas com a mão direita$$, 'intermediate', $$/video/ligados.mp4$$, 12, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05749b65-3664-49a6-8dbc-9684d9c5df19', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05b285b5-17d0-44c1-8ba4-985791cdd828', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05bca8e1-6b94-4e8c-9bb2-fb0215c47540', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '062ce949-ee7b-4755-a333-5876f8dba34f', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '067277a9-d9df-427a-b0d5-749b2fcd1b88', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '067c4e75-8e1e-4f07-91ae-1bb44e56602d', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Legato$$, $$Execução contínua entre notas.$$, 'beginner', $$https://www.youtube.com/watch?v=vc_tecnica3$$, 3, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0689107e-0ffa-4439-98ad-1664f59f39af', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0695cad2-e952-41df-a4d3-8e160fcdccdf', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '06d46a94-e339-4e9d-8e46-a6bbf970b1fe', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '070803dc-f860-42a5-8157-2ec4897b54cc', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '074d8ee8-2b68-48c4-80cf-a731c6fd81f9', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '078e8810-788e-4e7b-a99a-742b40079192', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '079351f6-0fbf-4580-ae05-4afdf50b0056', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '087d3a38-2bb0-425c-a51c-8ec1b2a7cc1d', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0934873c-5a2d-4599-8e0f-d888eb7e797b', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '093b6df9-2f6e-4a1f-acc2-465191a96f83', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Palm Mute$$, $$Técnica de abafar levemente as cordas com a palma da mão direita para criar textura percussiva.$$, 'intermediate', NULL, 9, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '09aa27db-ad67-4cc8-a254-1b867eb8414a', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '09dca4f1-895b-4be6-af0f-9efca014ab3c', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '09dee130-e726-4fc0-a4e7-7f27fc2417ca', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Dinâmica$$, $$Controle de intensidade sonora.$$, 'intermediate', $$https://www.youtube.com/watch?v=contrabaixo_tecnica7$$, 7, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '09ebeabd-4794-4d0e-88ed-a4cc9eb7a41a', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '09f9dc93-86fb-418f-96f6-d912d6e9d0a5', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0a183228-d023-4ac1-9959-8878180cc54b', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0a19ca6c-4387-4788-bbfd-025b164845a7', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0a8765bb-6be1-48e5-af10-41a236dd1ba0', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b033e7f-c9af-440e-a4dc-dbe1507f54c3', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b523e40-15ab-462b-a975-07038d06bdd6', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Tremolo$$, $$Rápida repetição de uma nota ou alternância entre duas.$$, 'advanced', $$https://www.youtube.com/watch?v=flauta_tecnica11$$, 11, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b547c86-a3ea-40a8-a2a0-d199b524db71', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Respiração contínua$$, $$Controle respiratório para manter o som sem pausas.$$, 'advanced', $$https://www.youtube.com/watch?v=flauta_tecnica9$$, 9, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0bb9c484-7db3-43e9-b2c1-14c85ba716df', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Respiração circular$$, $$Permite som contínuo ao usar ar armazenado nas bochechas.$$, 'advanced', $$https://www.youtube.com/watch?v=clarinete_respcirc1$$, 9, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0bbde935-728e-4e92-802c-df5ac27efa68', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0beb58d9-8505-4591-9e61-b6420bbd6edd', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0cb2b73e-c8e5-4d65-82cf-91a9d46b0944', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0cb3e68f-aeb1-4e50-a3bf-c034b77ed931', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0d7d97e9-f94a-42f5-bde5-6dc6d3022f9a', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0d86b7d5-49b4-4ff6-b86e-63800716c41d', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e242c3d-19ce-401c-b483-69e442231b80', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Acordes Básicos$$, $$Tríades maiores e menores, inversões$$, 'beginner', $$/video/acordes_basicos.mp4$$, 7, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e4385c0-6b00-4980-8cd3-9c99949d0382', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e882b9e-0981-46ab-ba3a-35187def8633', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Trinado$$, $$Alternância rápida entre duas notas adjacentes.$$, 'intermediate', $$https://www.youtube.com/watch?v=clarinete_trinado1$$, 6, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0edb2d33-fec9-4c50-b751-a6a39620816f', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0ef3da65-24f7-426b-bc8a-b1d401c86adb', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Improvisação$$, $$Improviso livre com técnicas variadas.$$, 'advanced', $$https://www.youtube.com/watch?v=trombone_tecnica10$$, 10, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0f794692-e914-41d5-a448-9b718ebbf374', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0f8542c3-0420-474e-93fa-ac6d8720de3e', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0fe233ae-eec3-4ef2-a71a-7f0c66066faa', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '116a8ba0-a7f7-4be1-b395-471b4e45d9a3', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '11bdb0db-bd91-4836-b8eb-199d3ce535df', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1224eec2-a2eb-4d4c-9f48-6ee420b56194', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '128d9b56-12fd-4204-802e-19eb8b00a4e4', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '13fe86b2-ffe8-433d-afac-b591316fe8ca', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1429514c-d151-4cea-814e-741faf437164', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1534000f-6976-4593-8b34-1be9220478a4', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Velocidade$$, $$Execução rápida e precisa.$$, 'advanced', $$https://www.youtube.com/watch?v=sax_tecnica11$$, 11, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '157f5837-0291-42f9-be4e-979ab5da14db', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '16859556-8444-48bd-bc64-89f2d663bc8a', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1720e42e-8de4-4a69-8b9a-47552f12a03e', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '174f33d1-58aa-408c-ac2d-fd779f868403', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1774ce26-11c2-4c2b-b0ec-cf3603d0be32', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '17be3e11-240a-4027-be44-cf4c8ea7d5f0', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '18700f98-bb0e-4457-b8a4-b1efc8c2e064', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '18efb6d5-e635-46d0-a3e5-5cf020d1b128', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '194de44d-0437-47e1-9161-0d8b67e12417', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b1a5907-5d74-4bee-8563-306fa0f61073', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b43474d-bf96-48a6-9353-2aead46e2811', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b44d3eb-3e28-404d-9b9f-07bac4887b2b', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b677796-267f-4455-92ea-fa1c7eef3ce7', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b87b222-b491-49f4-aefb-851e62af14ac', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1bcb1a97-5034-43d0-a118-21aa7f00fddd', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1be60a15-fbf1-4900-bc03-9041c3d7f287', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1c64f69a-8c9f-4316-ae95-a65c9ba51193', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1d147571-1d38-4349-a738-f5139cde48b3', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1d790ab9-db62-4005-ac42-b85c8c746141', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1e170512-ab62-4556-b13c-7494f18581a3', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Respiração controlada$$, $$Controle do ar para embocadura adequada.$$, 'beginner', $$https://www.youtube.com/watch?v=fagote_tecnica2$$, 2, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1e38917a-2d8b-4135-9c05-8a8db8234ffe', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1e5353f9-dd97-4dc3-8c61-d09a4eeea82d', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Improvisação jazz$$, $$Improviso em contexto jazzístico.$$, 'advanced', $$https://www.youtube.com/watch?v=contrabaixo_tecnica10$$, 10, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1ec5cb0b-ad9e-4873-b209-334a3e71dd87', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1ed7bfd5-b055-49f1-a5d7-9689f72be89b', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1f808f4f-90d2-45c7-af8f-2cb922036fd5', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1f84688e-1aed-4411-840d-abae8e17a733', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1f85e73a-d66f-4524-b22d-1ba2ee11317b', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1fe8e0e3-888d-4f8b-b381-adad96851361', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2006be96-7029-4807-8d20-6ccdbb1f5800', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '204887ca-792e-46c4-ac9e-3dea0d765755', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '205e1574-7334-45ab-a4f5-d4416c6ce709', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '20e862b7-e22c-443f-b48c-b1c45cdbf148', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '21c9c9dd-f0b1-4538-beaa-11ad3c3cc6e1', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '21efe4cd-5b5c-4fde-87c3-bb09e81c3783', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Trinado$$, $$Alternância rápida entre duas notas.$$, 'intermediate', $$https://www.youtube.com/watch?v=sax_tecnica6$$, 6, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '220f9946-52f8-4259-9168-f1afdce5c752', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '224ac5be-c5d2-4c39-b906-22fd702fd3a1', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '225bf309-8460-45b3-9576-9b2be5b5142d', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '22c3ed2e-3565-469f-a0bd-da6a567cab62', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '22cbaf78-0528-4b8c-b20f-8130ab8346a2', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Improvisação$$, $$Improviso em estilo contemporâneo.$$, 'advanced', $$https://www.youtube.com/watch?v=fagote_tecnica10$$, 10, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '22e9002a-6e8a-403d-af9d-be3e914567eb', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '23089479-dd6a-4f72-9d4a-d1ec2148b406', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '232af234-3cc0-488c-925b-98dc0dd19b1a', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Trinado$$, $$Alternância rápida entre duas notas adjacentes.$$, 'intermediate', $$https://www.youtube.com/watch?v=flauta_tecnica6$$, 6, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '23547c1f-f1ef-4ffd-af1c-4da3ab02ca7b', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '23bbbebf-2e69-4e33-9e20-ab402207045f', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '23e82819-2686-46ef-a9f5-342f2196c4eb', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '245b9229-6255-4a02-9788-3197cf98bb50', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '249acff7-8fff-4889-9506-c1315ff928e1', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '24a95cc2-485f-40ab-9ec2-1a263e34e891', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '24ebe2ce-8320-4db6-a008-7717f3d290e0', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2512c585-7f2d-4cea-ac05-91bcabef4859', '36040329-1aa6-428a-ad39-cd85de03493e', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '253bbc63-03c8-434c-b67d-212a812454d7', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '25438d37-ed87-4070-b111-af9f05f2cbec', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '257d5eba-fb23-44b5-b051-9d779f314b8f', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Velocidade$$, $$Execução rápida e precisa.$$, 'advanced', $$https://www.youtube.com/watch?v=fagote_tecnica9$$, 9, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '25a539a9-1df4-431d-aeab-06a1def46918', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Legato$$, $$Execução contínua e suave entre notas.$$, 'beginner', $$https://www.youtube.com/watch?v=flauta_tecnica3$$, 3, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '25f16451-fee5-4bc5-9f4a-88b280041e70', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Harmônicos$$, $$Produção de sons agudos especiais.$$, 'intermediate', $$https://www.youtube.com/watch?v=sax_tecnica8$$, 8, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2611ed70-4304-4ee3-8211-70b898a81ce2', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2637251f-42dd-4526-b446-6f1697f2e84c', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2638260a-1ce4-4c00-9ab1-829afc589a2e', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '268bb564-fe69-4d1b-84eb-a1a493bdf60f', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2715877c-2a61-400f-be15-d112980a69f8', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '279159be-d9db-475a-94e2-ffcb676a536a', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '27ea1225-aac1-42d9-98c0-0c8a4a52b3bb', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '280ebc47-21d5-46c2-a7f0-7a42505960f0', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '288ef404-86b4-4158-9dc1-5d9c4d258cfe', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '293cffd2-c4eb-465e-97a8-584cb4556bd0', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '29f91fc0-a6a1-47c7-bb31-dc1c1490d2d9', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2ab0c542-69ba-4c80-8b77-a63573775d95', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2afbeb7f-da6b-4422-a60b-106c9f5551dc', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2bbbab17-335a-4145-bf09-a6238ec09bb9', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2c938b2e-0f1f-457f-984c-60eb543e2f92', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d1950b1-a809-4250-8b4f-88066f9ffb85', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Vara básica$$, $$Movimento da vara para notas padrão.$$, 'beginner', $$https://www.youtube.com/watch?v=trombone_tecnica3$$, 3, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d648450-9123-4067-965c-6ca59c9ceceb', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d7a3a97-9210-43e0-98a0-0f634a4fc172', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2da6ad48-da40-4b21-b9da-05808b904717', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2dd656f2-3547-4efa-ba5c-13a885437aa9', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2deb33f8-20e0-4f69-85a7-760b7a8e7a3a', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2e263f1b-4594-42a3-a178-6539056ba64d', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2e333b80-5ff8-46de-b811-0f3d82c8325b', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2e393ab6-5ab2-4e13-b15a-f3d4909572d2', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2e5f3d80-ce39-4ab6-9091-6be2a346af99', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Escalas Cromáticas$$, $$Técnica para tocar todas as teclas em sequência$$, 'intermediate', $$/video/escala_cromatica.mp4$$, 10, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2eb78f9a-1a1f-4f6c-9389-47354011c7ce', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2f22d392-f1b4-4de8-865c-c24d3d1d2038', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2f69b339-72e9-43cb-80b1-ae3ac10d2f02', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2f91855e-b1eb-40d3-830f-1144038f6322', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2fc046c0-4ca6-4915-88e6-849e9ce8682f', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2fd96425-0b26-4974-861e-a295f1f2bb70', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '30d95e99-2b68-41b3-883a-9356576bca27', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3140bb11-bcb7-495a-a36e-701962e5f7ca', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '31df9a27-2c56-4bdb-843b-7f32e6fa6fd0', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Postura correta$$, $$Posição do corpo e da flauta para execução confortável.$$, 'beginner', $$https://www.youtube.com/watch?v=flauta_tecnica1$$, 1, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3298231b-92af-4d72-9173-181e7ccc6df4', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Groove funk$$, $$Construção de grooves em estilo funk.$$, 'intermediate', $$https://www.youtube.com/watch?v=baixo_tecnica6$$, 6, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '32f47ae1-1b2f-482f-adb1-19a65e9a9e70', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '33544acd-9663-4c56-93f9-7d7c8c130942', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '336e50bb-1772-4873-ac25-4c746167c471', '36040329-1aa6-428a-ad39-cd85de03493e', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '33cb1309-0e06-4103-afc2-4babdc113206', '509d6a26-159a-4976-aa46-83f914f930aa', $$Legato$$, $$Execução contínua entre notas.$$, 'beginner', $$https://www.youtube.com/watch?v=trompete_tecnica3$$, 3, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '33cdb7d2-cd35-4751-a324-cdcae224cc07', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3402f1be-466b-497f-9565-f2c35b6cddbe', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '344dc6af-a045-4ac4-a133-687af5bb108f', '36040329-1aa6-428a-ad39-cd85de03493e', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '34535f61-9f93-4c91-80a0-f8ce79024088', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '34cf42a8-7ee1-4659-8ed5-121b50a69e6a', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3520d15d-282d-4abf-9389-3c3a96510597', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '353aaa5a-62c5-4d2d-b4b8-53f06a5851c8', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '35d249de-9548-41a6-a237-cc0696e0cdda', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Legato$$, $$Execução suave entre notas.$$, 'beginner', $$https://www.youtube.com/watch?v=teclado_tecnica3$$, 3, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '364fd604-b244-4ba6-bcef-3934594739d8', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '36d0ea87-2451-4c36-8938-640984f315b8', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '37083e13-96a5-4068-ab88-dcf3de93f62f', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Articulação básica$$, $$Articulação clara nas notas.$$, 'beginner', $$https://www.youtube.com/watch?v=trombone_tecnica4$$, 4, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '373955ec-73d8-40e5-a964-1e09a1abcb4e', '36040329-1aa6-428a-ad39-cd85de03493e', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '379d3c86-33c4-476d-98a4-31e98ced05d4', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '37a2a01c-f814-40ec-b016-f535ce11e28c', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '37cde3c2-1b0e-433b-ab25-2d15a7526cd9', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '37d2125d-4f73-4f2a-8b67-e1890551391a', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '37d2c285-c14e-4b05-9bca-db3cde039dca', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '37ddf9e2-450e-436e-8841-3c5ba9ca3cb7', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Harmônicos$$, $$Produção de sons agudos especiais.$$, 'advanced', $$https://www.youtube.com/watch?v=vc_tecnica10$$, 10, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '380c5c4b-ae78-4742-8ae9-0417f35d0d73', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a00e8b7-1857-4324-9645-84ed68ea5fd7', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a279f61-1cd0-4072-866d-cab0da901e45', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a583a55-3d62-41e4-a6ca-22259462d04b', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Saltos de registro$$, $$Domínio das transições rápidas entre registros.$$, 'advanced', $$https://www.youtube.com/watch?v=clarinete_saltos1$$, 11, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a590e95-349a-4c39-b940-7938938a2f58', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a6aa20b-4670-4519-b704-b405092e7b98', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a9eb8d2-2cc8-43a1-a29a-6bc6c21b8c4d', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b35e5e6-4cd0-407b-b90c-480a178135c4', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Escala cromática$$, $$Execução da escala cromática completa.$$, 'advanced', $$https://www.youtube.com/watch?v=fagote_tecnica11$$, 11, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b9b674d-15a8-47bb-a18b-cd28e3acea86', '9a5e0eac-114e-4173-90af-32b55c870675', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3c1414b9-e8ec-42c8-9338-eda13bd94b65', '9a5e0eac-114e-4173-90af-32b55c870675', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d06dfb3-4c03-4b58-8289-c56e1cd1bf2b', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d41e57d-5e54-4eee-8d97-b8af4412cc52', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d437d73-f5b3-425e-9ae6-7d1659b6cd37', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d60b22e-8e0d-4b86-a32d-7866a67ee725', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3f547c3a-75f9-4150-8ae4-c7d9e356b6c2', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3f59d628-a36d-435a-9862-5ec3312457a2', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Leitura de Partitura$$, $$Claves de sol e fá, notas nas duas mãos simultaneamente$$, 'beginner', $$/video/leitura_partitura.mp4$$, 3, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3f98eb36-eb8c-4852-ae87-eff4d2fe1581', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3fa022f3-84ea-4d19-ab45-dcd4f661f673', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3fbb6cd0-8253-44f7-ae5d-ea28d5ec1af7', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Pizzicato básico$$, $$Execução básica com os dedos.$$, 'beginner', $$https://www.youtube.com/watch?v=contrabaixo_tecnica2$$, 2, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3fe1fd52-5842-45de-b203-e9e8327ec36b', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Postura correta$$, $$Posição do corpo e do instrumento para execução confortável.$$, 'beginner', $$https://www.youtube.com/watch?v=fagote_tecnica1$$, 1, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4051715b-cfbd-4630-8704-bc112b3ced89', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4065d0f1-a341-4fb8-aaad-95e200207923', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '40e821ce-39c2-4c9a-8ccb-a000971bcecf', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4194bbc9-42e6-4905-a7d7-eae3fef8584d', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '42aff565-3557-4e02-8dbc-3e6b1e91105f', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Postura correta$$, $$Posição do corpo e apoio do instrumento.$$, 'beginner', $$https://www.youtube.com/watch?v=vc_tecnica1$$, 1, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '42cf0eba-a571-4cd5-ae48-7f91e1ba6e2e', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '42e87b5d-cf2f-42dd-a2ee-d8d760fbdc2f', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '43084616-cdb4-4642-b21a-62bff764461a', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4331e7c1-c249-4ff0-90d0-107ca3b3f3c6', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '43c606db-fb70-453b-ab56-b638b009c9b7', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '43d5013d-b7c9-466d-a09f-b37140f60bf0', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '44611d46-9f4c-4f58-a12a-c2e72fd4b4a3', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '44a9c43a-f9f0-4413-bede-eebd6566c1f7', '36040329-1aa6-428a-ad39-cd85de03493e', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '452d5bd5-027e-4c5a-a821-f19d0c526495', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '45e3ca75-df45-4786-aa43-cd353be76bc4', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '465ccedf-de94-4856-9c2b-e337bb96f184', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '46fc4a9f-e22f-478d-8ade-2c4a17e672b2', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '47286656-e320-4dbd-96cc-6139445a7ff0', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4742626d-6133-4d92-978b-4c645c9ab548', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4743a50d-3ebb-46ed-be88-a01e12ec9654', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '475271d5-519d-4332-ad0b-b856b85912fe', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Saltos de registro$$, $$Mudanças rápidas entre registros.$$, 'advanced', $$https://www.youtube.com/watch?v=vc_tecnica11$$, 11, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '47590ca2-6abb-4a53-b695-43d51faf5cec', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '47671abb-3b05-48b2-839d-157b376a2570', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Pestana (Barre)$$, $$Técnica de usar um dedo para pressionar múltiplas cordas, expandindo o vocabulário de acordes.$$, 'intermediate', NULL, 5, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '487f2b4e-920a-4f4b-8586-82ada6e71157', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Progressões Harmônicas$$, $$Sequências de acordes comuns na música tonal$$, 'intermediate', $$/video/progressoes.mp4$$, 9, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '48826171-670b-4cea-8f71-183d082d711a', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '48a47965-4c39-4803-ad7a-f5e6941bb0d4', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '495e2241-6c2d-4802-8faf-4912ab8a28c4', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Escala cromática$$, $$Execução fluida da escala cromática em toda a extensão do instrumento.$$, 'advanced', $$https://www.youtube.com/watch?v=clarinete_cromatica1$$, 10, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '49f46ba8-5058-416d-9ef7-0e0128700a58', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4a618ae7-464f-4530-a150-93a0901015ca', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Postura correta$$, $$Posição do corpo e apoio do saxofone para execução confortável.$$, 'beginner', $$https://www.youtube.com/watch?v=sax_tecnica1$$, 1, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ac728e4-319d-49b4-a280-a0a5856d5e65', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Postura correta$$, $$Posição adequada ao teclado e ao banco.$$, 'beginner', $$https://www.youtube.com/watch?v=teclado_tecnica1$$, 1, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4b1b65d0-d9f3-4956-ba7f-48288c138479', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Ornamentação barroca$$, $$Uso de ornamentos típicos do barroco.$$, 'intermediate', $$https://www.youtube.com/watch?v=fagote_tecnica7$$, 7, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4b92d477-6091-4c4e-8dc7-b61017762159', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4bdbc55f-533f-4c49-9fb1-dda3535472b7', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4c2e2834-f860-4383-958d-ce4596de0bd2', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4cc46923-f775-4237-b63c-b1a14923d5d0', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4d03d992-0e4a-4483-986f-93b40e5981cf', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4d1d219b-f7a0-4c14-b5dd-9269f6917b4d', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4db1d497-dfc5-4698-88fe-94c5228434e4', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Transições entre Acordes$$, $$Como mudar de um acorde para outro de forma fluida$$, 'beginner', $$/video/transicoes_acordes.mp4$$, 7, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ddbcb04-2102-4d35-a46d-9b5054ef43be', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4e3b101b-60ef-4b67-9051-2fc6c33c4ca4', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4e41b5e0-e23a-4943-8f2c-4426756d03a2', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ea3d190-a927-4a45-a902-4ed6656d8d04', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4eba6cfc-0450-4a88-821e-082278aa5bbe', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ed09050-a2c5-4904-81d3-85afa30a005a', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4f2b8c6a-41f6-4635-a286-7df580e569d7', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4f4ab736-9fb1-4c0b-a0d3-b85168a0ae09', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '501a9e23-a8cf-4d54-84ff-3bc3870d3d5d', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '501ea91d-a3e7-4313-8c53-024b24d58677', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Articulação com língua$$, $$Separação das notas com o uso da língua para maior clareza sonora.$$, 'beginner', $$https://www.youtube.com/watch?v=clarinete_artic1$$, 1, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '507952fe-a77e-42df-8c86-c8db3924832d', '36040329-1aa6-428a-ad39-cd85de03493e', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5097a5d5-dc2b-4277-b83f-5045c0ce2c48', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '50cd93b8-9cee-466a-9c5e-a9541103bc3e', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '50e9e1b6-36a4-448a-9771-757c83fb639b', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '50f6c98d-006b-45ed-8aab-bb6b9c6c56ea', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '510f9394-5c0e-4fdb-afd9-d06e6a2e6c1e', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5150265e-bd44-4904-a8c2-ae46aa3a361e', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '516b231f-721f-4b55-8a93-c69f23f063cd', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Staccato$$, $$Notas curtas e destacadas.$$, 'beginner', $$https://www.youtube.com/watch?v=vc_tecnica4$$, 4, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '522302eb-e90e-4f30-a080-80607c0e3d51', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5239af8d-3376-4148-b554-fb8e12f2a0b1', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5250acba-75ea-48b2-a228-fb2b04a0583b', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5257a7d8-b09d-4d7e-8fb3-a9805bec23e8', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '52d906a9-69e1-4923-86b5-f82c158381f3', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '536fd95b-cacf-438e-bb4f-e82357bf4fc1', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Postura e Posicionamento$$, $$Posição correta do corpo, braços e mãos no piano$$, 'beginner', $$/video/postura_piano.mp4$$, 1, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '53a2247a-d7f5-4b55-b685-16e4bed6cbcf', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '53b54141-23d1-4e47-8946-27249cbd03c5', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '53e44c80-190d-4a5d-8f89-07c4682da280', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5496785b-4865-467e-b869-0bcb5c5e5137', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '54a3b29b-1ddd-4484-813d-3392c57d8066', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '54c1d0c1-72bd-493d-ad42-1b6fe5dae098', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Legato$$, $$Conexão suave entre notas.$$, 'intermediate', $$https://www.youtube.com/watch?v=fagote_tecnica5$$, 5, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '54d53116-4cab-48e9-ae41-cd48e2da5cac', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '55502377-eb80-4f51-a6d7-ab6ed9193f85', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Pop básico$$, $$Complemento ao slap com puxada da corda.$$, 'beginner', $$https://www.youtube.com/watch?v=baixo_tecnica4$$, 4, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '557180fc-5a58-40b0-bfe6-180a208fbcb1', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5597bd8c-0be8-4a51-835e-e076950f1930', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '562cda7a-489a-4482-ad5d-17add27364a0', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '565eb7e2-a363-4342-af09-252605e1f432', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '56eb24dc-e1ff-4b13-8dfa-79b02ae6af81', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '56edd7b9-0738-4d83-8245-7a57ade6bf9c', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '570fb9a5-2e19-442f-aaf9-09033549af34', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Dedilhado das Escalas$$, $$Numeração e sequência correta dos dedos nas escalas$$, 'beginner', $$/video/dedilhado_escalas.mp4$$, 2, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5710d2f9-6f0e-4ba0-9ad1-9543f3a016aa', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '57743e36-fa5f-4160-a36b-f41a72a49767', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '57a3296b-0471-4d56-9d21-bb291310d543', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '586beb9a-cf9a-43c0-a32c-f7b267532656', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Staccato$$, $$Notas curtas e destacadas.$$, 'beginner', $$https://www.youtube.com/watch?v=teclado_tecnica4$$, 4, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '588eab28-cb91-42fe-bd63-a3e4ad27ff0e', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Afinação do Violão$$, $$Como afinar o violão usando afinador ou ouvido$$, 'beginner', $$/video/afinacao.mp4$$, 3, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5898d3f8-363f-441b-8e4b-09ceec707581', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Power Chords$$, $$Acordes de quinta muito usados no rock. Formação móvel e aplicação em diferentes trastes.$$, 'intermediate', NULL, 4, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '59375ad3-4b52-4336-b092-4a4b18284914', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a0afaa5-95bc-4c48-aeac-9755281cb161', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a185c2a-7e0f-4c37-be48-7bb84df3c6f6', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a2c9d56-08e9-46ec-bb7c-98d72000bca0', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a2fbe0e-2a35-4520-9a4f-bcfbe0cdab3e', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a60f5e8-99ec-4cda-87dc-a095188fd1e6', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Col legno$$, $$Uso da madeira do arco para percussão.$$, 'advanced', $$https://www.youtube.com/watch?v=vc_tecnica9$$, 9, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a61d68f-00ca-4e98-9285-81622d0e622c', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5af5b827-f7e3-46da-8be1-28e64f45c70e', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5b6385a6-96d6-40ee-b611-595496923fb3', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5bfe1a27-985a-4973-95f7-e9b886509199', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Glissando básico$$, $$Deslize entre notas.$$, 'beginner', $$https://www.youtube.com/watch?v=contrabaixo_tecnica4$$, 4, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c14eb27-9c92-46ea-bdd5-ecc32ce2f8d5', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Dinâmica$$, $$Controle de intensidade ao tocar.$$, 'intermediate', $$https://www.youtube.com/watch?v=teclado_tecnica7$$, 7, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c620158-c5dd-4137-85c3-4d75488d4763', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Empunhadura do arco$$, $$Forma correta de segurar o arco.$$, 'beginner', $$https://www.youtube.com/watch?v=vc_tecnica2$$, 2, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ca64380-96c7-4ab2-bd16-57078012e51c', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ca7fa7f-6b67-481c-a41d-044a4dcf57fa', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5d678a57-7e2e-4118-ba12-fd982cfdaa7f', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Spiccato$$, $$Movimento saltado do arco.$$, 'intermediate', $$https://www.youtube.com/watch?v=vc_tecnica6$$, 6, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ddebf97-e0de-44d9-8d89-ab394dee0aa8', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Glissando$$, $$Deslize contínuo entre notas, típico do jazz.$$, 'intermediate', $$https://www.youtube.com/watch?v=clarinete_glissando1$$, 7, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5e78bb20-a9de-4518-9f9d-e35f9d37f596', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5e8e66ba-8387-4672-8923-74f181f64928', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ea7f4c3-dc45-43ad-9a24-90b061447b2e', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Improvisação$$, $$Bases para improviso no baixo.$$, 'advanced', $$https://www.youtube.com/watch?v=baixo_tecnica10$$, 10, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ee874ed-525a-4265-bb6c-906e8ccc0467', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5f49b338-8eee-4e9d-af9d-3b950c562f4b', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Glissando$$, $$Deslize contínuo entre notas.$$, 'intermediate', $$https://www.youtube.com/watch?v=sax_tecnica7$$, 7, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5fa66433-c3f9-4b44-b56d-3681aa051363', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Postura correta$$, $$Posição do corpo e do instrumento para execução confortável.$$, 'beginner', $$https://www.youtube.com/watch?v=baixo_tecnica1$$, 1, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5fae1841-bf68-41a9-b751-58a7fe4c8b19', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5feaec7e-791b-4346-880a-e0137eafef87', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ff36830-a301-4b18-8d17-67898ceee494', '509d6a26-159a-4976-aa46-83f914f930aa', $$Respiração contínua$$, $$Manter o som sem pausas visíveis.$$, 'advanced', $$https://www.youtube.com/watch?v=trompete_tecnica9$$, 9, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '60090a3e-ff72-420b-b0e3-7be62f4e13ba', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '60170c66-fe27-45c7-bfe2-61241a77f73a', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '60f27e35-a032-4128-9c51-ee93413394a0', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '610b5e13-b314-45fc-a92a-501b290c5ba6', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6179a467-05c1-4c71-9df0-062494e1732f', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61c509c6-ebcb-47f3-a0af-87f490bc4fd2', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61f3d499-2886-4a66-b3e9-45e38ceb6e38', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '620d7858-f820-4578-b8a3-72cd8fb3b708', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '62bbc31d-0eab-4042-aab9-40c5c57894a1', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '62e2c196-810f-4e1b-8e7a-58ae556cf8f2', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '63110e74-035b-448f-9394-92d92fa6cc3f', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Escala cromática$$, $$Execução de escala cromática fluida.$$, 'advanced', $$https://www.youtube.com/watch?v=teclado_tecnica9$$, 9, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '63119880-8dcd-454f-aee7-aa01fb5043b5', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '633d1843-62b0-4db2-82dc-a15691f8e86d', '36040329-1aa6-428a-ad39-cd85de03493e', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '634edae8-839a-4e97-a1a8-a9fa8c636903', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '637a5062-8caa-4bec-b5cc-36e16be5228e', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '63e6eea7-9ace-4a26-873d-e93c67b8c1f9', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '643fbc3c-208c-4238-954f-2585a749d168', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '650acf8c-3909-4b2c-bdb8-8fb0a4e4f24f', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '651d4816-5f16-4de6-b0e2-bae8b07383c6', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '653f677f-6782-445c-a902-efadba2755ff', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6542aa7c-107a-46fb-bc41-2b34b02aae57', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '659ad60a-4747-4298-b3fb-51e188c418da', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '659d16d3-8c6e-4dcc-8b94-3d3d7b474602', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '65c51347-264d-45c6-ac79-85775038bd41', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Embocadura$$, $$Formação correta da embocadura no bocal com a palheta.$$, 'beginner', $$https://www.youtube.com/watch?v=sax_tecnica2$$, 2, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '668774f8-7577-46c2-98f3-fc8baf0f6cc3', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '668d385c-f367-400c-81a7-a263184751ae', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Coordenacão mãos$$, $$Sincronia entre as mãos.$$, 'advanced', $$https://www.youtube.com/watch?v=baixo_tecnica12$$, 12, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '66b22941-7f6d-4b42-85dd-b863728b7da5', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Posicionamento das Mãos$$, $$Posição correta da mão esquerda no braço e da mão direita nas cordas$$, 'beginner', $$/video/posicao_maos.mp4$$, 2, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '676a496d-b502-41d1-895d-2b51308e6d54', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '683e8722-66d0-4e2e-b6a4-3bf01858fc9c', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '687b05dc-6e63-42ac-b130-10762819c314', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Alternate Picking Avançado$$, $$Palhetada alternada em alta velocidade com precisão rítmica e dinâmica controlada.$$, 'advanced', NULL, 12, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6881be5c-aa0d-4278-938a-7a284743131d', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '68d91390-9084-4d90-833f-238c797454ec', '9a5e0eac-114e-4173-90af-32b55c870675', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '68f0e064-0182-40de-8140-9f949e33f972', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6903ea81-f243-4d0d-aabb-4f37213d4937', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '69293d88-523c-4e11-885e-a4a70269e96c', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6986ab42-3e43-40d2-b51f-06f5515d1109', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6a2f3bda-0eaf-4386-981e-ba18d1c1b04e', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Legato de arco$$, $$Conexão suave entre notas$$, 'facil', NULL, 2, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6b6c1ab3-a80d-4d67-b4ff-a1f531156a13', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6c93a2a2-5ea8-40cb-b755-1e947609b504', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6d489aa0-d44f-43e9-ac61-6de9b072e2a4', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6d5545fd-574f-4524-a33f-ddfc0a9588c0', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Embocadura$$, $$Formação correta da boca no bocal com a palheta.$$, 'beginner', $$https://www.youtube.com/watch?v=exemplo2$$, 1, '2025-06-15 18:43:37.153885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6d861dca-e254-4832-8b54-aeaa163bf78e', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6da7fd5f-aac5-4fc2-9a59-0900bbc93146', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Velocidade$$, $$Execução rápida e precisa.$$, 'advanced', $$https://www.youtube.com/watch?v=teclado_tecnica10$$, 10, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6dc45e3d-532e-4714-b290-04ce346aafe4', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Velocidade$$, $$Execução rápida e precisa com a vara.$$, 'advanced', $$https://www.youtube.com/watch?v=trombone_tecnica9$$, 9, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6deecdbb-8973-4371-8a34-b39132703d09', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Coordenacão vara e sopro$$, $$Sincronia do movimento da vara com sopro.$$, 'advanced', $$https://www.youtube.com/watch?v=trombone_tecnica12$$, 12, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6ef2581f-69fe-414a-a4c7-1427358bf2e9', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6ef303b6-ce53-477b-ae6b-a825a28b4f6e', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Improvisação$$, $$Bases para improviso no saxofone.$$, 'advanced', $$https://www.youtube.com/watch?v=sax_tecnica12$$, 12, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6f207272-147f-4eaf-ab2d-77952823859d', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6f917d20-c255-4b22-bfed-7c435abe7e1b', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6f963fe2-7d04-49b5-93ac-ec4d86031aad', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6fb30f58-bb2d-42c2-94d9-28fe749f2fcb', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6fb41bb0-db0f-4cbb-8e85-04476e155392', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6fc245a5-434a-42b2-9f71-536d634cc2e6', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6feae8ba-ab5c-459c-bae0-bfb84df2b57b', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '701b0630-d33e-43c0-81ad-27584da249ab', '509d6a26-159a-4976-aa46-83f914f930aa', $$Glissando$$, $$Deslize entre notas.$$, 'intermediate', $$https://www.youtube.com/watch?v=trompete_tecnica6$$, 6, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '703945c2-e586-4a73-8bdf-b9617e01f349', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7069669f-3d97-461f-b2d9-96f4b507875f', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7120720f-492d-4d86-b739-eeace6f59102', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71502d2e-dec9-4df0-bdef-45d610781569', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71729a3b-6e80-43dc-b2b2-2c3ab1c1bbb2', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '719d32f5-22b6-46fd-bfcc-0109a791cf14', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71b6b3c9-ec75-4320-a2e5-f20e16cb616d', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7227f8ab-b57b-4c11-a57b-2c4d5d3aacae', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '72383061-5b10-40d1-a11f-9d912e512955', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7259a62a-4077-4d93-a2c4-2939324f4c39', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Postura Corporal$$, $$Aprenda a posição correta do corpo, braços e mãos para tocar violão$$, 'beginner', $$/video/postura_violao.mp4$$, 1, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '72896722-fb3f-414e-aeb6-9b89a7d7db6c', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '72b000f4-d4a6-44c1-9701-d30518ca6d43', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '72d74384-6e27-475e-934f-a10f60c291f4', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '732874ec-d5ed-43f1-b45f-00e1812a2279', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '732a23f7-0945-4428-8e4e-86d9c9cee53d', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '73567100-4555-4913-96a4-4e4efba5f927', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Pizzicato$$, $$Produção de som com os dedos da mão direita$$, 'facil', NULL, 7, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '736d7500-7a04-4d65-8502-721a7fb6c1ec', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Digitacão básica$$, $$Colocação dos dedos na escala.$$, 'beginner', $$https://www.youtube.com/watch?v=baixo_tecnica2$$, 2, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '73c29c60-9479-4676-9e90-992dcfaf092c', '9a5e0eac-114e-4173-90af-32b55c870675', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '74f14ceb-f85d-462e-9684-f79fe28a9dd9', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Legato e Staccato$$, $$Articulações básicas: notas ligadas e destacadas$$, 'beginner', $$/video/legato_staccato.mp4$$, 4, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75e5725d-c3ec-494f-acaf-e6342093caab', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75f80e7e-d20f-4fd3-926c-aa02ab66c2b3', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '76e42708-45e2-436e-8299-ce436eaa4c87', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550001', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Empunhadura Básica$$, $$Como segurar corretamente as baquetas para máximo controle$$, 'beginner', NULL, 1, '2025-06-09 03:00:56.389554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550002', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Postura e Setup$$, $$Posicionamento correto do corpo e ajuste da bateria$$, 'beginner', NULL, 2, '2025-06-09 03:00:56.389554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550003', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Ritmo Básico Rock$$, $$Padrão fundamental: bumbo no 1 e 3, caixa no 2 e 4$$, 'beginner', NULL, 3, '2025-06-09 03:00:56.389554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550004', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Paradiddles$$, $$Rudimento RLRR LRLL para coordenação$$, 'intermediate', NULL, 4, '2025-06-09 03:01:04.55053'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550005', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Ghost Notes$$, $$Notas fantasma na caixa para groove sofisticado$$, 'intermediate', NULL, 5, '2025-06-09 03:01:04.55053'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550006', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Bumbo Duplo$$, $$Técnica de double kick rápido$$, 'intermediate', NULL, 6, '2025-06-09 03:01:04.55053'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550007', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Linear Playing$$, $$Técnica sem sobreposição de membros$$, 'intermediate', NULL, 7, '2025-06-09 03:01:04.55053'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550008', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Shuffle e Swing$$, $$Interpretação ternária no blues e jazz$$, 'intermediate', NULL, 8, '2025-06-09 03:01:04.55053'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550009', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Blast Beats$$, $$Técnica de alta velocidade do metal$$, 'advanced', NULL, 9, '2025-06-09 03:01:04.55053'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550010', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Polyrhythms$$, $$Sobreposição de ciclos rítmicos diferentes$$, 'advanced', NULL, 10, '2025-06-09 03:01:49.252565'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550011', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Técnica Moeller$$, $$Movimento de chicote para velocidade$$, 'advanced', NULL, 11, '2025-06-09 03:01:49.252565'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '770e8400-e29b-41d4-a716-446655550012', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Metric Modulation$$, $$Mudança de percepção métrica$$, 'advanced', NULL, 12, '2025-06-09 03:01:49.252565'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '77838996-ad6a-4be5-a71a-59db398c6d6e', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7784c080-dcc6-4807-bfb8-fa05add9b523', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '78b2d4f0-4ab7-431c-a350-41bd6621b238', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '78cbb0bd-dbeb-437f-aea9-36bd090eac10', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '79a9dad6-4e20-4f8d-a22b-55649f73fc4a', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7a30e443-2562-40d2-813a-884df3af065c', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7add0853-3f01-4631-9ca2-adbffb30be63', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7c73b6e9-e4a5-42c5-a272-617a33a65526', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7cc91bc8-ae37-4b50-8981-95751827188c', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7d1d494c-e5ed-4d04-a728-958c756c35b0', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7d208cbf-80ba-4d9a-a6a9-f3b0058048c1', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7d324cd3-1a7d-4767-9eac-3e7ca60a9214', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7d6dd6d6-e791-422c-8663-87490d9c0013', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7e43bcfd-44af-4f45-9426-cb35bdea59cc', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Polifonia$$, $$Execução de múltiplas vozes independentes$$, 'advanced', $$/video/polifonia.mp4$$, 12, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7e788b67-de71-4413-a580-ce89efdde5dd', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7e97bc82-54db-4158-8c8f-96c2574a855e', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7ec78ec2-a912-4e4e-a09d-5b04ac8c75e6', '36040329-1aa6-428a-ad39-cd85de03493e', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7f2b37d9-827f-4445-a45c-26dfee67144a', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7f327e47-1279-45d2-8ca1-4b189ffe4e64', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7f7f8bc1-f8ae-4cfa-ae2f-4fa59ace223a', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7f8eb362-43b9-4b4b-9272-4f12772acca3', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7ff5a341-d341-4fc6-9d9d-17eca9d258ba', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Arpejo Simples$$, $$Exercícios de arpejo para desenvolver independência dos dedos$$, 'beginner', $$/video/arpejo_simples.mp4$$, 5, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '80267a91-9635-4d3b-bb61-b47c39dfcfbe', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '807c78c2-1193-4e3b-a53d-8e1887ae1290', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Digitacão básica$$, $$Execução de notas graves e médias.$$, 'beginner', $$https://www.youtube.com/watch?v=fagote_tecnica3$$, 3, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '811fbe22-e1f3-413b-a18a-dd449d275eb6', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '81ef8bda-9b61-44a6-9f60-d6fcafb37e24', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Postura básica$$, $$Alinhamento de corpo e instrumentação$$, 'facil', NULL, 1, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '82261255-bd34-4ed0-ade2-18e07f2e1f41', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8404fff2-248a-4d1c-b6b1-af5a11ae163a', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Escala Pentatônica$$, $$Escala fundamental para solos. Padrões móveis e aplicação prática em improvisação.$$, 'intermediate', NULL, 6, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '848721db-9941-44a6-9ceb-7795173f0a67', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '849dd581-d953-4a94-98f0-0f38d4bceba8', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Harmônicos Naturais$$, $$Produção de sons etéreos tocando sobre os trastes$$, 'intermediate', $$/video/harmonicos.mp4$$, 10, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '84a7dca6-7b78-4f04-88be-5af1bbd5b06e', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '854d9897-6e71-4123-9df0-a7581c497d26', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8600f6dd-7d51-4d32-947b-0f7704ad38cf', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86362713-f769-4e60-8d09-d30e3da51721', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86517925-a6a0-4907-b5fe-a2c7ce92e1d6', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86a8fff0-f665-4221-bf30-15ec19a88a4e', '36040329-1aa6-428a-ad39-cd85de03493e', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '870bef83-eb95-4951-9d3c-30047e6af402', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '87949df8-3a12-435b-a01a-af8ba618473f', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Walking bass$$, $$Execução de linha walking bass.$$, 'intermediate', $$https://www.youtube.com/watch?v=contrabaixo_tecnica5$$, 5, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '87d8523c-7888-4d4b-85cd-40abb864dd0f', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '87fe40a0-f624-44c9-a3cd-9734091648d9', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Escala cromática$$, $$Execução fluida da escala cromática.$$, 'advanced', $$https://www.youtube.com/watch?v=sax_tecnica10$$, 10, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8891e961-a49e-4bf8-9d3e-41258a641c46', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '88b3a560-fb3a-4e95-8914-de0fa55b47d9', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Sul tasto$$, $$Arco sobre o espelho (timbre aveludado)$$, 'intermediate', NULL, 12, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '891ae8f1-3c34-45ac-b567-f8776f551e06', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8956c6fe-a98c-4965-b937-b32a0745b6be', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Coordenacão mãos$$, $$Sincronia entre mãos.$$, 'advanced', $$https://www.youtube.com/watch?v=teclado_tecnica11$$, 11, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '899d9f2e-fb54-49a6-9309-a10d5969299a', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '89cc85bd-f8d3-4441-b32a-4d287c17e9cf', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '89fe6136-fbec-43a4-b501-36eb5572fe25', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8a0e98d4-db42-4871-b502-f794ab2449db', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Uso da Palheta$$, $$Forma correta de segurar e usar a palheta para dedilhar as cordas com precisão e dinâmica.$$, 'beginner', NULL, 2, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8a43671b-54b6-4e0f-9038-b16182732c17', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8a4e68b8-fe7b-4b47-a93f-a75379c8a6bd', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8a512826-4d91-4416-9eae-d2b073eddcfb', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Staccato$$, $$Notas destacadas e curtas.$$, 'intermediate', $$https://www.youtube.com/watch?v=trombone_tecnica6$$, 6, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8a73c54e-7c69-4a08-87a1-bf47c2daabd4', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Coordenacão mãos$$, $$Sincronia entre as mãos.$$, 'advanced', $$https://www.youtube.com/watch?v=contrabaixo_tecnica12$$, 12, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8ac61d7a-38ef-435d-926f-51cc03dedf96', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8b088d3a-d9fb-4a71-b024-0c0c010593a9', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8b9a5a93-85bc-45d9-9ee6-8102c4507371', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8bc15d1c-8791-4c32-993a-4b7039f4f7d2', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8c09814c-d5a1-442d-9519-8f24217c9d4f', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8c10534f-7ad7-40b1-b083-86f42412718c', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8c8befe9-66e2-4ae9-9368-963efe2d145f', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8cae2aa8-0deb-423b-8566-fabb30e73e57', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8cc6e93a-758c-4730-85e9-1a1e061cf099', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8d506528-cb27-40f9-b386-b4cc32b1f7a6', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8dd8c962-2613-4f2d-ae86-a9203e95131b', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Harmônicos naturais$$, $$Produção de harmônicos.$$, 'intermediate', $$https://www.youtube.com/watch?v=fagote_tecnica8$$, 8, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8df60aa5-a6ec-4de2-95d0-55f8f7277898', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Legato$$, $$Execução contínua entre notas sem interrupção no fluxo de ar.$$, 'beginner', $$https://www.youtube.com/watch?v=clarinete_legato1$$, 3, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8e1aea4a-5650-42dc-9668-e1b445283d62', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8f24d939-ca30-46e8-96c3-c923f9e538c3', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8f44c183-d26c-4810-8177-d94456691605', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8fa54ca9-89e6-4e2b-b352-f1b4195244b0', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8fc872b7-30de-4b44-a27e-b7362accc986', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '900c989a-de04-46bd-af09-2d5f8f1a2f32', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '901c7b04-d7b7-490e-9b1c-e3d55ab2180d', '36040329-1aa6-428a-ad39-cd85de03493e', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9027a6e4-106b-49e3-b512-d093e4d78adb', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '909dfd1b-60b1-411a-8e8c-7ac41adf6dbb', '509d6a26-159a-4976-aa46-83f914f930aa', $$Improvisação$$, $$Bases para improviso no trompete.$$, 'advanced', $$https://www.youtube.com/watch?v=trompete_tecnica12$$, 12, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91128ae9-a35c-4f29-a3fb-cff7fb5fe088', '509d6a26-159a-4976-aa46-83f914f930aa', $$Postura correta$$, $$Posição adequada do corpo e do instrumento.$$, 'beginner', $$https://www.youtube.com/watch?v=trompete_tecnica1$$, 1, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91935817-00d4-40b5-9132-c2769c600879', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91a708d2-e602-469a-a5a3-0d5be2316e48', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Pestana (Barré)$$, $$Técnica de pressionar várias cordas com um só dedo$$, 'intermediate', $$/video/pestana.mp4$$, 9, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9209fc23-9cd9-44e1-b535-26caa2351325', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '93cb9399-db76-40ab-b891-bdf87363fd83', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '94076168-c9b1-46ab-8892-17854e634e84', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Velocidade$$, $$Execução rápida e precisa.$$, 'advanced', $$https://www.youtube.com/watch?v=contrabaixo_tecnica9$$, 9, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '94830c99-101a-4114-b59d-a279ad7b36a3', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '949b68bf-e235-45dd-8189-9d437a001845', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '949cf53b-90c6-4255-9877-cea2129cbf00', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Tremolo$$, $$Repetição rápida de uma nota para criar efeito contínuo$$, 'advanced', $$/video/tremolo.mp4$$, 11, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '94bdde63-636d-4e93-aaed-d4e4869e8919', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9533b4ba-453a-4ba8-873a-d57cd01c991a', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9562cac0-1ecf-4bd0-8da2-5e9395894877', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '958520cf-339b-486d-9076-b8191e96dee8', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '96057b61-1908-4ecb-9201-ce17af0a986d', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '96a5ecac-60aa-4533-949b-ea43c3180dad', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '96a987d7-9be4-434a-9982-b02795704106', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9721ad5f-0f4e-4244-afbe-eb166023b7d9', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '97393ec7-0a91-4457-b124-c7e14b56f5b6', '509d6a26-159a-4976-aa46-83f914f930aa', $$Embocadura$$, $$Formação correta dos lábios no bocal.$$, 'beginner', $$https://www.youtube.com/watch?v=trompete_tecnica2$$, 2, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '97978065-d9f1-4f96-b966-09ca9b724828', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '97dd8a1d-96b4-420a-807f-76ea543a0310', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '988e63d4-2dea-4756-b6e3-068d782eaadc', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '98c84511-c9e3-4535-868e-58ef7e20efac', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '98f2957b-513a-4b36-8b34-0d2ee771e3d3', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9988d999-5618-4fec-b811-ee66f776338c', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '99893f82-370c-41d4-9ab9-747ab4df588d', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9a0249eb-dc73-41d2-88fe-5d3048f8bad6', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9a185c4b-d8d1-4ed2-822a-8364bff5f0c1', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9b6dc5f9-1d6e-4584-a4ae-d77c89d3d882', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9bd8c758-9942-40cf-b118-c48128a4ee83', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Uso do arco$$, $$Primeiros passos com o arco.$$, 'beginner', $$https://www.youtube.com/watch?v=contrabaixo_tecnica3$$, 3, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9c06bbb7-d8ac-454c-8bf1-5a51f90d3d92', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9c23f1ad-71d3-4641-b9c7-f0901a850a03', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Articulação básica$$, $$Articulação de notas com clareza.$$, 'beginner', $$https://www.youtube.com/watch?v=fagote_tecnica4$$, 4, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9c7b2307-1d91-4468-a123-4056fee99cf1', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9d699b62-2183-415c-863e-929c4cbf40ff', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9df2fd35-6552-43bc-9658-994d5405bbbc', '509d6a26-159a-4976-aa46-83f914f930aa', $$Staccato$$, $$Notas curtas e destacadas.$$, 'beginner', $$https://www.youtube.com/watch?v=trompete_tecnica4$$, 4, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9e06a0e8-66f7-4692-a372-f86db225c6f4', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9ec1b3c6-6698-4686-af5e-448be6646f89', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9f120a63-eead-4740-a2f7-a2d0239979bb', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9f257705-97e5-4357-a02a-fcc14ab1c0c0', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9f6ff1cb-1186-431f-829a-c6b985202208', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9fdb240b-c5d6-4bb6-8c07-96eb2b741cb0', '9a5e0eac-114e-4173-90af-32b55c870675', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a032ccb5-4661-4514-b38e-908def13ca79', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a05b3198-e1af-4696-9dfe-89a25de0dccc', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a07996e6-b8de-4379-b789-a358aee705ec', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0b99e41-b1ac-4693-b56d-9fb66a00128d', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0c08223-9e28-4e4c-9702-a5f957d5fc80', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0d82c10-7366-45e1-8a54-a0571d720abd', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0fb0dc0-00b9-4b9d-a484-12683839d783', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a18c6cd6-a875-455c-9948-9a4b60fbdce4', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Harmônicos$$, $$Produção de harmônicos naturais.$$, 'intermediate', $$https://www.youtube.com/watch?v=contrabaixo_tecnica6$$, 6, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a1b8c79b-f8f9-479e-902b-6df783603feb', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a1c832aa-9311-4c65-8c43-7d8afc419540', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a1e51e08-1d80-4a9a-a9e4-5813edbd40df', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a217fd1f-6f6c-4a51-a4e2-e22eb587adbc', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a2617e69-cda1-4fea-81f9-243a23193d88', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a28230e4-6e1a-40da-8595-2707be8cce2e', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a29f07b9-b0ef-4e88-b44f-03b76d84eb10', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a2e9cfa4-c3f2-408b-8f3f-a5209998e9ba', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a32aa15d-c707-4d6e-99a6-5b3f6b073eb7', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a3356ebb-2c42-481b-b673-40a0bcfc5900', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a37b0b64-b741-4e9c-95ea-fbc5b2792f93', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a3904983-9a8e-4de4-8b44-2590eccb77dc', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a3d1aa7b-c70f-4733-accb-bccebdd9c884', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a3ec338d-9853-4d48-9571-1dcc14825595', '9a5e0eac-114e-4173-90af-32b55c870675', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a52a71c5-12b2-4502-a00b-6526ff9495eb', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a55bf28c-209b-4c37-a278-c10c65f2d1c9', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a55e99d5-9dd3-4feb-946e-93be57dc3b83', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a5769206-2124-404a-bd74-0f6788e537f5', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a599e5e9-921d-405e-9168-3d821c599831', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a5b1358a-fbf3-4bad-8f5f-6ba11d6bd905', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a600deb5-93d8-4dfb-b749-08eca674d066', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a61ba392-9807-44cb-9b65-e0dcdb6ff6dc', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a69a9ff2-005c-4203-91c1-528c2c8c90d4', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a7b5d68d-fa64-4f33-a4a3-c9b3241c6b11', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Sweep Picking$$, $$Técnica de varrer a palheta através das cordas em sequência para criar arpejos rápidos.$$, 'advanced', NULL, 11, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a7cc0f02-11ed-49ac-9ef0-bcfa7f50d783', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a828f1ec-9bf5-4368-9d53-0cb67590f9d3', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a8dc3639-6471-4a3f-b4af-39f2d231fabb', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a8fa192f-fc85-4e7d-bd2b-5c31e03456e3', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Pedal de sustentação$$, $$Uso correto do pedal.$$, 'intermediate', $$https://www.youtube.com/watch?v=teclado_tecnica8$$, 8, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a9650091-5102-4f6c-aa84-9edf07b40619', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a995225a-d6dc-4424-9338-f945f4591998', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a9ecd5f2-54fe-4517-aefd-6b7d59ef406b', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Legato$$, $$Execução contínua entre notas.$$, 'beginner', $$https://www.youtube.com/watch?v=sax_tecnica3$$, 3, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aaa138f2-63f3-4170-a43c-e4430977863a', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aae30fbd-8731-4406-bcf0-117385206c49', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aae8710e-e5c2-426a-af27-354f046c32a1', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab5b466f-bde6-4671-90e1-4ff9e70fc105', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Arpejos$$, $$Execução de acordes quebrados com ambas as mãos$$, 'intermediate', $$/video/arpejos_piano.mp4$$, 8, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab66f5f0-c628-4803-90d0-4385fc5ff2f1', '509d6a26-159a-4976-aa46-83f914f930aa', $$Velocidade$$, $$Execução rápida e precisa.$$, 'advanced', $$https://www.youtube.com/watch?v=trompete_tecnica11$$, 11, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab70ea95-c7b9-4244-9a8f-014e5a2e7a81', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Vibrato$$, $$Adição de variação controlada na altura da nota para efeito expressivo.$$, 'intermediate', $$https://www.youtube.com/watch?v=clarinete_vibrato1$$, 5, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab7b8518-3a59-48ee-95bf-a83e7a1b5456', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Escala cromática$$, $$Execução da escala cromática completa.$$, 'advanced', $$https://www.youtube.com/watch?v=baixo_tecnica11$$, 11, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab83196c-68b5-4f9d-b296-72f4f7e3da7c', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Pizzicato$$, $$Técnica de pinçar as cordas com os dedos.$$, 'intermediate', $$https://www.youtube.com/watch?v=vc_tecnica5$$, 5, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac59c550-84c8-4cbd-8b1f-e5e3a6186daa', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac72ff14-a83b-48bd-a8c8-3723bf5d1289', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac85a538-c930-4540-a265-a3b5af10923f', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'acb43bb4-b066-492d-86fe-79a28c9c83a9', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'acb5eb07-79e4-4638-9415-af7799dfade3', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aceee89e-5afd-4398-9e86-01351c1206b3', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Multifônicos$$, $$Produção de mais de uma nota simultaneamente.$$, 'advanced', $$https://www.youtube.com/watch?v=flauta_tecnica12$$, 12, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ad39cb91-7020-4757-9cbc-24421a54dbed', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ad5fbc46-57ec-42a2-a40c-cfc28b7dca70', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ad6de648-246f-4b90-b8ae-6282d92e504a', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Tremolo$$, $$Repetição rápida do arco$$, 'intermediate', NULL, 9, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ad7cf4f9-4d93-40a5-9be9-60080e2c74d2', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ad7e4f9a-2e9c-45b7-ab13-65089274dab1', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'adb5b907-0541-4105-83b5-40617b8c09f1', '9a5e0eac-114e-4173-90af-32b55c870675', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ae4ef2cb-a6bb-4929-b332-3d7bb60a4e5e', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aedf5c8b-79a4-4ebd-8578-b9f25749061e', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'af433ce8-ac76-4fe7-a44a-008c83b3e863', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'af89fee9-a80b-459a-956a-3243a004a681', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'af921f9b-3caa-4f75-b471-37d10982b84a', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'afe6db67-1624-49ac-ad59-861095469ff1', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b0362442-5192-4f86-beca-970f316f3843', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b05c2755-493b-4ba8-b91f-fa1151917645', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b10c9e08-ec81-4cdc-88b8-8a63d839e10d', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b124dc7f-cb02-45a1-9601-fcfed22dccb9', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b12ea27a-0151-419d-a796-e81d79e92cbf', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Staccato$$, $$Notas curtas e destacadas.$$, 'beginner', $$https://www.youtube.com/watch?v=flauta_tecnica4$$, 4, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b144fa9d-f4f3-4e60-9db5-e9bf9f534c58', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b209d02a-c684-4320-8336-3c9ae3421b14', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b20fb062-18a7-4b19-835c-57171c0b581d', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b3b54af8-7b89-4450-ba9d-ee5e5b4be03a', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b3c9c0a3-9f3b-41f8-81f5-54038c6d30cf', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b3d63097-305a-4a63-8d79-27a88e01feae', '509d6a26-159a-4976-aa46-83f914f930aa', $$Dinâmica$$, $$Controle da intensidade do som.$$, 'intermediate', $$https://www.youtube.com/watch?v=trompete_tecnica8$$, 8, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b4201e25-0f07-455a-8634-92d297dc1e5e', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b42d0f7b-614c-43fa-830b-124eb7f7d5e1', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b42ea4ba-c871-466c-abb9-662177f0303c', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Glissando$$, $$Deslize suave entre notas.$$, 'intermediate', $$https://www.youtube.com/watch?v=trombone_tecnica7$$, 7, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b51c9575-49f4-48cd-8a47-81e236931565', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b55667cd-0e95-411d-9727-1cda8bb00173', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b5791f80-c580-44e3-84bd-58a8e7c84435', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b6bf3f95-8a9f-4d05-92f5-396168f1dd0a', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b70e2917-debc-4177-a3cb-82452a6e02f4', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b781f61a-4437-4b65-aa0d-4260214ad4b6', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b797fcd9-2070-4f88-8147-997616bb8888', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b80b7b0d-bebc-4734-bd2a-ed2da093e53f', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b857c849-a4fa-4377-a603-3c55b066435d', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8807585-16f1-4d8a-a822-55610cccdcd3', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b89e0dc8-6130-4c41-b31e-99c38fcbc9ba', '36040329-1aa6-428a-ad39-cd85de03493e', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8b99055-a1d0-41f5-b01d-e5bf07979066', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b979c57c-ce6c-4f06-a14a-db34424b6157', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b99796fd-9f8f-4a2d-9d9e-3c79da5a3a0b', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b9c400e4-c608-4f64-b081-bd9f3404e5c9', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b9ef03d1-4578-4422-9b9f-44d936729706', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ba0df980-c8a5-4082-ba72-61577901bb28', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ba26137b-1cca-4e28-b071-8153f9a84161', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'babcb992-9688-4c19-967f-f4995cacccd6', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bb091122-b084-4f91-8ec2-92bd6a035428', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bb1ce121-941d-4c91-90e6-3afd1490a72c', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bb1e9664-8300-42bf-af16-ff9e8f0da8be', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc03568e-de7e-4c51-a36d-5b112ed99954', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bd2a19a9-5bcb-4dc9-a9e3-26ce6828a7f0', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bd589565-ee06-436e-a9e3-cf2ac0d8f463', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bdb41f47-9d1a-4ef2-ad65-5e9a81fd645f', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bdbd260f-0eda-48ea-b369-83ffa05779a0', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'be87bc13-776d-45f6-8f8b-8b945df5e275', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'beae4f9b-8452-47e4-a1eb-bb1a88583ade', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Walking bass$$, $$Execução de linha de baixo em jazz.$$, 'intermediate', $$https://www.youtube.com/watch?v=baixo_tecnica5$$, 5, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bf2ddd4b-06ef-40a8-9470-434fee1f922b', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Staccato$$, $$Notas curtas e destacadas com precisão.$$, 'beginner', $$https://www.youtube.com/watch?v=clarinete_staccato1$$, 4, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bfc057fe-b603-4eda-921a-1ff4d06ff5a2', '9a5e0eac-114e-4173-90af-32b55c870675', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c06ac9c0-cdd1-4605-8220-4b9f2185a310', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Coordenacão dedos$$, $$Sincronia entre as chaves e a embocadura.$$, 'advanced', $$https://www.youtube.com/watch?v=fagote_tecnica12$$, 12, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c08afa58-776f-4319-98a7-297339c6873f', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c08ea6a2-1fa3-41f1-8e19-c7e805e58280', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c1a19de0-faee-42d6-99c9-e2b5ef22d3c7', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c1afda69-dedb-4ec9-86ac-e61eca1e167b', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c1f0efe2-42d6-472f-84d8-8e966f6599ef', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c201e04d-5328-41d2-b5fa-fd0c20e4e085', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Duplas cordas$$, $$Execução simultânea em duas cordas$$, 'dificil', NULL, 10, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c25cd904-812f-48e2-ae95-77f303a3d2b3', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c2b32a88-8b1f-4d21-b835-6db4fd63bb0c', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c3108c41-92f8-43d0-89ee-a74661f3cf52', '36040329-1aa6-428a-ad39-cd85de03493e', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c37f72ac-f3aa-4592-a11b-baf942e34ed5', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Arpejos$$, $$Execução de arpejos básicos.$$, 'intermediate', $$https://www.youtube.com/watch?v=teclado_tecnica5$$, 5, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c38daf5c-bf9c-42f7-a5db-096b83262da0', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c3fb062a-d329-4ea3-8e49-1170581a939b', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Dedilhado Básico (p-i-m-a)$$, $$Técnica fundamental usando polegar, indicador, médio e anular$$, 'beginner', $$/video/dedilhado_pima.mp4$$, 4, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c412c49d-63e3-455f-9139-52b7c383328a', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c44664a7-abc7-4acb-a1a8-a3bd676487a3', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c463a972-0df3-4f98-ad9d-f2ea01e60595', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c48e5642-86f5-4f65-bcc7-ded9fe4ccf52', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Vibrato$$, $$Oscilação controlada para expressividade.$$, 'intermediate', $$https://www.youtube.com/watch?v=sax_tecnica5$$, 5, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c4ecc7cf-768d-4be6-94da-8acf3af3e03c', '9a5e0eac-114e-4173-90af-32b55c870675', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c527ec76-67f4-4866-902a-5432da4f77a7', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c5f7e876-8141-4f13-a912-e8b7c2722339', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c646f1d8-7867-44ef-b317-1d0f8d7136bf', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c68b3519-44b6-4948-94a8-d5f959c07118', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c6bacc9f-a72a-4cd7-a2b2-bf9fe3cc0409', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c9c71826-c04e-409c-91ba-f608fca6efbf', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c9df6c85-03fb-471c-92d9-4374d48e43cb', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Sul ponticello$$, $$Arco próximo ao cavalete (timbre brilhante)$$, 'intermediate', NULL, 11, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca085014-ca7b-4046-9e8a-1dca2feb9c21', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'caf60986-89ce-47df-8e71-5c5ca79cf94e', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cb239eb8-f5a3-437c-9514-5b4787970f4b', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Glissando$$, $$Deslizar contínuo entre notas.$$, 'intermediate', $$https://www.youtube.com/watch?v=vc_tecnica8$$, 8, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cb67a526-363c-47ce-8c51-f32c9a6b50dc', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Velocidade$$, $$Execução rápida e precisa.$$, 'advanced', $$https://www.youtube.com/watch?v=baixo_tecnica9$$, 9, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cb9c9ef5-665d-497e-8026-f4a0dba5ad00', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cd9c6f6b-cf45-4fb1-9fbb-5e08949a8fcf', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cdc7b807-77b5-4bca-98da-0ff3275d930e', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cde1717d-124e-4a52-babe-08c7de706fcf', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ce310e26-6e53-4673-b2f0-7af3789d0010', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ce480443-2767-4b3b-8244-0f9e88fed9d7', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cf070929-c3c7-426a-96f0-90ed711a66a0', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cf077a70-19aa-469e-8184-f65a6c9a90b6', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cfa3c74e-c5df-410c-a299-d5f79e974e8d', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cfcadb35-f6fc-4c64-b1c3-8fff6011515d', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Tapping$$, $$Técnica de usar dedos da mão direita no braço para criar notas, popularizada por Eddie Van Halen.$$, 'advanced', NULL, 10, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd006380e-9026-4359-b7ee-586d2f9d7dd0', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd035fe8a-e7b8-4c9b-b9c6-6ad389d06fb6', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Escala cromática$$, $$Execução completa da escala cromática.$$, 'advanced', $$https://www.youtube.com/watch?v=flauta_tecnica10$$, 10, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd037d836-39d4-4408-9bb5-266ccd313e2e', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Legato$$, $$Conexão suave entre as notas.$$, 'intermediate', $$https://www.youtube.com/watch?v=trombone_tecnica5$$, 5, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd09f8d46-a37c-4729-9953-201bbd5b615b', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd0ddf95f-6937-45e1-902f-54c33f0186ae', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd11292a8-01b8-4abc-a2be-7f425b301240', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd12b33f6-5689-4f84-9c34-8f7949f02a42', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1a6d560-0b13-4df1-8b64-6d0c07afee61', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1da5c87-ef71-4a36-97a0-f9656aa3ed99', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1e440ad-d431-430e-98c9-23a6a07e8580', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1f37af6-7e13-47b6-a024-3c4bbe026ede', '509d6a26-159a-4976-aa46-83f914f930aa', $$Vibrato$$, $$Oscilação controlada do som para expressividade.$$, 'intermediate', $$https://www.youtube.com/watch?v=trompete_tecnica5$$, 5, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1fab1b5-aee9-462a-bf93-9f8ac699cd46', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd32a26fa-8b86-46c4-aa97-1fa54ebf1bc2', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd32bc9d1-2e64-4b0f-aec2-8d523379e30b', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Vibrato$$, $$Oscilação controlada para expressividade.$$, 'intermediate', $$https://www.youtube.com/watch?v=vc_tecnica7$$, 7, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd3536fe6-1df3-409a-8c0e-6cf13b3a2e36', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd3ebb000-3f66-4e74-bf74-ebbabf819aee', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Glissando$$, $$Deslize contínuo entre notas.$$, 'intermediate', $$https://www.youtube.com/watch?v=flauta_tecnica7$$, 7, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd3f70d5d-fddb-4df3-af92-904b2dd2d495', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd4169c1c-08ec-4f9e-9a87-12e8246502c1', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd447b00e-c926-407b-ba4e-7efb7c5594ad', '9a5e0eac-114e-4173-90af-32b55c870675', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd48442b1-3cbe-40e0-9769-3e981094045d', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd4dd7d2f-0014-4e1c-915d-4c597fce9e99', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd582c5ae-64a0-41b1-857e-5cca2dc411f6', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd5bff404-0131-4531-bbfb-24ed0749e8fa', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd64c1301-4712-4313-b8bd-ca5f6844fefd', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd6607c1e-baa2-4aee-a99e-04ceccddf6cd', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd6d6e215-3f60-48fb-b95c-a1ff1c62168e', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd71f996a-10de-4ad2-9da5-800fb480b88b', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Bend (Esticada)$$, $$Técnica de esticar cordas para alterar a afinação, criando expressividade nos solos.$$, 'intermediate', NULL, 7, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd73d05dd-c257-42f3-8ef8-f4598b40cdd8', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd73e1630-3768-49c3-a5ca-9dbb235ddd6e', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Spiccato$$, $$Arco saltado controlado$$, 'intermediate', NULL, 4, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd7a45b59-99fb-4ef4-a760-3dccdcd696db', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Harmônicos$$, $$Produção de harmônicos no trombone.$$, 'intermediate', $$https://www.youtube.com/watch?v=trombone_tecnica8$$, 8, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd7a7c636-62d1-4d18-89e1-7fe90e640cbe', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd7d64e07-f5a0-4a7c-8e53-aee01f1a8835', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd84201ac-40d5-4988-88c5-60005c778c31', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Harmônicos$$, $$Produção de sons agudos por técnica especial de sopro.$$, 'intermediate', $$https://www.youtube.com/watch?v=flauta_tecnica8$$, 8, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd866707f-8af4-440c-abe1-df282e0dca94', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd919303e-8b71-453d-8832-f4c11c13c573', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'da0f14c9-6c17-4619-9fef-299e31b63594', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db40b0c4-58e9-4c67-9f82-aab188b0c3e8', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Staccato$$, $$Notas curtas e destacadas.$$, 'beginner', $$https://www.youtube.com/watch?v=sax_tecnica4$$, 4, '2025-06-16 00:58:00.775213'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db697459-5388-4c1a-b706-a014251cdd44', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db919b61-0cfc-45c5-a251-5d6c7cf69f5f', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc250e3c-2af3-404f-9086-2b4d0de615a2', '509d6a26-159a-4976-aa46-83f914f930aa', $$Trinado$$, $$Alternância rápida entre notas.$$, 'intermediate', $$https://www.youtube.com/watch?v=trompete_tecnica7$$, 7, '2025-06-16 03:54:33.683073'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc563e3a-1c26-4d1f-9a06-10599feadcf6', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc8db430-b89f-455d-95ce-e12efe10e7f8', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Postura correta$$, $$Posição do corpo e instrumento para conforto e controle.$$, 'beginner', $$https://www.youtube.com/watch?v=trombone_tecnica1$$, 1, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dcc4e2e8-9f9c-44f2-8780-8a3b1511d2e9', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dcc66e65-fd4e-4505-8efb-a60c37d5e3f2', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Escala de Dó maior$$, $$Execução da escala de Dó maior com precisão de afinação e articulação.$$, 'beginner', $$https://www.youtube.com/watch?v=clarinete_escala1$$, 2, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dccde71a-92db-430d-857b-701cd0a60242', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Acordes Básicos$$, $$Formação e execução dos acordes fundamentais: Em, Am, C, D, G em primeira posição.$$, 'beginner', NULL, 3, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dcff7678-a8d4-4de5-99c1-0016fcf1ecb9', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dd55555f-3e89-4166-90ff-4007d9509526', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ddb89f65-8313-45d2-b105-31247a29f55b', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ddd6b615-0819-46d1-a847-830f2335390e', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'de271ba2-24ae-4674-a81b-125ba2f19d7a', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'de2879f9-c97c-4083-a408-66d854c8847f', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'de6f72bb-d1e8-4a0f-b64a-c8c525dc97fb', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Expressão$$, $$Uso expressivo do som.$$, 'intermediate', $$https://www.youtube.com/watch?v=contrabaixo_tecnica8$$, 8, '2025-06-16 05:32:54.413249'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'de7f4b78-16e4-400b-85b6-f877889fa638', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Vibrato$$, $$Oscilação controlada na altura da nota para expressividade.$$, 'intermediate', $$https://www.youtube.com/watch?v=flauta_tecnica5$$, 5, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dfb9d4a2-452a-46ae-88f2-e6eb3749417a', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Improvisação$$, $$Bases para improvisação no teclado.$$, 'advanced', $$https://www.youtube.com/watch?v=teclado_tecnica12$$, 12, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dfe0e5b5-b431-4632-8694-e1ed37440527', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e0047832-d26a-47e1-b0dd-6c8c2a55c9f1', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e08f5b15-1e27-4cbb-b157-9128d568f468', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e107d53b-a4e2-4d2f-bf4e-2c256f7bf228', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1295906-7615-4404-a98b-a70b4c6153c2', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e15212f3-3e17-43e6-855d-ffecad1a28a8', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e15d74b1-5f9d-4f6d-8e2b-ad5bbaf307f6', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e20c1287-2fd8-4322-ac07-05e9dd5d227f', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Respiração controlada$$, $$Respiração diafragmática para som firme.$$, 'beginner', $$https://www.youtube.com/watch?v=trombone_tecnica2$$, 2, '2025-06-20 14:37:59.078554'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2592a61-e8f7-4004-8a76-7958e0d319fc', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e262f0bf-f88d-43cb-8d6a-3ac92d457ed9', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e299e8d4-7b5d-4248-9a03-e1d010b272a3', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2db86d4-8db6-43a8-baec-63df10d5aedf', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e303af1b-9c2b-4985-adbe-8b82ceb0b76c', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Digitacão básica$$, $$Posição inicial dos dedos nas teclas.$$, 'beginner', $$https://www.youtube.com/watch?v=teclado_tecnica2$$, 2, '2025-06-15 20:38:41.149388'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e36540f7-a182-434d-847d-4c55c35d06e5', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4a2e7ab-dbbd-4d55-9c5e-d63b3cd9bf85', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4a9f402-7f4a-41f3-9295-c21e845464f6', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4da5530-7644-4646-8477-697895b29e58', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e51b229c-fe3e-4a2c-b5ef-e8be484ce49e', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e533e7ef-e781-4ddc-a70b-c7048da550ae', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e5b04064-b80d-448e-ad28-94ab2ffc9db7', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Rasgueado$$, $$Técnica de rasgar as cordas com movimentos rítmicos$$, 'intermediate', $$/video/rasgueado.mp4$$, 8, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e606afea-16ae-46bf-8df5-e9ffe22980de', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Embocadura básica$$, $$Formação correta da embocadura para geração do som.$$, 'beginner', $$https://www.youtube.com/watch?v=flauta_tecnica2$$, 2, '2025-06-15 19:43:31.102149'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e68b8b45-c0a5-421d-b927-95cd840eb465', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e6d9f458-a25d-4b1b-b191-a3991288be93', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Uso do Pedal Sustain$$, $$Técnica de pedalização para conectar harmonias$$, 'intermediate', $$/video/pedal_sustain.mp4$$, 6, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e769fd28-b200-44e2-8aec-0bb68b38d82a', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e84e249e-a32a-4d45-b92b-7734007235e6', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e8715834-8bab-418b-b0b7-63cf54ee0442', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e88cc246-5858-467c-851f-5308fbea5e76', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e8a89cef-0e65-498e-b389-7b679cbd7fc9', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e8b5ee59-988e-492c-a7b9-48b0d536b813', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e8da76e2-678f-41b4-a3f0-438d8daa564c', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e97d8827-95aa-49d1-ac08-b4d2ce9be083', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9bc9c96-e66e-4023-ad76-96c2999e0473', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Postura e Setup$$, $$Posição correta do corpo, braços e mãos. Altura da alça, ângulo da guitarra e posicionamento dos dedos.$$, 'beginner', NULL, 1, '2025-06-09 04:27:39.947846'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9c44331-2deb-4a46-9eca-7ec59d74d49d', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ea29de0b-8e34-44f5-b4d0-2124443f409d', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ea54efc8-4c46-4cdb-9bf9-10fe029d3d5b', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec096f92-3877-4727-b7cf-4d63f08961fa', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec0d3876-99a1-473b-b87a-55fe973c7dcc', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Bariolage$$, $$Trocando cordas rapidamente$$, 'dificil', NULL, 6, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec52f770-ad4f-4151-83bf-25f45b6e7ac9', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec682be1-2e91-463c-b221-32c343dceedb', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec806e71-f892-4835-98de-4299a9d5f850', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ecbf6ecf-0151-41ed-b140-e9b9da24e472', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ecd2acde-8d46-4830-aa8f-6222cbbe0b10', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ed073f6d-7541-4a8e-be83-5f538f2be621', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ed80b86a-63d4-43bb-be65-9741a20d331d', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ee53934e-5ff8-4650-b5b2-74bde90e6080', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ee56688c-816e-4f41-8c8d-7698efd13a1e', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eed93d0a-8501-486a-bea2-f8d5d46469c9', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef2fd3ed-ca59-4577-bdf3-9232ec6db3a5', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef8160af-0088-4313-8400-2571dba52dea', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef879127-ed12-42ec-962c-c080e95d4e9c', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'efe9b3f5-12df-4464-a485-4accc74b2f8a', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eff5976e-35cb-4731-9cf4-b8ac4dc369ca', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f01502f8-d13c-4768-ad2a-c1158aad858d', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f01abcc7-11ce-411e-a004-5142f9e61378', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f01cb93d-1666-49b0-b198-218dc07aec92', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Articulação staccato$$, $$Notas curtas e separadas$$, 'intermediate', NULL, 3, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0410924-cba7-4ad7-b6a0-fffa9790e124', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f068a542-a4cc-468c-a63f-ceafc535063a', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0cc4628-d847-4a6a-be97-922120d34cf9', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f116a447-98d4-45f0-add1-755efcf7329c', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f12a4861-8326-4978-9ab0-455cecde2457', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f175a586-e8f5-4558-971a-6cb68490e522', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f17e0b0e-c3ec-4393-be7f-d60ea8bc9ab3', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f17e4eaa-1004-4dbd-954d-485012a0487c', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f18eaa1a-5292-4ccf-8ac7-486e34a25aa8', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f199d57a-db7e-4ff4-b49e-578fe143fc91', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Staccato$$, $$Notas destacadas e curtas.$$, 'intermediate', $$https://www.youtube.com/watch?v=fagote_tecnica6$$, 6, '2025-06-20 02:50:49.052579'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f1a1b38a-4a8d-4b5e-8a1a-0b1ef7715e08', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2b1fe5d-05f2-4c8d-be19-c04b3003a7a6', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2d10708-9aac-4d5e-bb53-fee5d6cf0d69', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2e50707-9ac2-4c7c-9d95-52165adb4030', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Harmônicos$$, $$Produção de harmônicos naturais.$$, 'intermediate', $$https://www.youtube.com/watch?v=baixo_tecnica7$$, 7, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f33071dc-0ddc-4151-89fa-cb8eb5447722', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f3524676-0dc4-49b7-8423-f36b778be683', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f37294da-d4bd-4e29-ba37-d2f69beda8fd', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f4244acb-6249-4392-9c1c-5c6dbdfd16c9', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f43c366d-6f3e-4b7f-9135-40613f143ff5', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f459691b-625a-498d-b663-f62fe365e639', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Harmônicos$$, $$Produção de harmônicos por controle de embocadura e coluna de ar.$$, 'intermediate', $$https://www.youtube.com/watch?v=clarinete_harmonico1$$, 8, '2025-06-15 19:29:09.73476'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f5875e51-b604-4d96-85f2-2e2db6d9e847', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Primeiros Acordes$$, $$Acordes básicos: Am, C, D, E, F, G$$, 'beginner', $$/video/primeiros_acordes.mp4$$, 6, '2025-06-08 01:07:37.593134'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f5b3547e-836e-402d-96ff-71910e3973c1', '9a5e0eac-114e-4173-90af-32b55c870675', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f697db57-0c3b-4502-8556-80c9f684be5f', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f71496fc-16db-4d91-a8ad-e687cc5f890a', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Slap básico$$, $$Início da técnica de slap.$$, 'beginner', $$https://www.youtube.com/watch?v=baixo_tecnica3$$, 3, '2025-06-16 04:41:35.610426'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f7200aaa-628f-409f-9762-f70e1e5cfdfa', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f806f40f-4995-4534-a6b8-3633175b1af3', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f809f8ff-2ba8-4fb5-91b7-f4f829f2e5f2', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f8672d0c-3f8f-4fe4-968f-9a95096d8c4d', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f8893170-d68d-4a4f-baad-6bbc4a58e8ba', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f8d89fd9-4478-4794-b387-b6141daaf0ee', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Dinâmicas$$, $$Controle de intensidade: pianissimo ao fortissimo$$, 'beginner', $$/video/dinamicas_piano.mp4$$, 5, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f94e695d-f2ef-46a4-a5b4-a89b8f2515a7', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Escala cromática$$, $$Execução fluida da escala cromática.$$, 'advanced', $$https://www.youtube.com/watch?v=vc_tecnica12$$, 12, '2025-06-15 19:35:47.11382'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f9ae4556-f895-48bc-8899-d975c8d2ef4b', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Empunhadura do Arco$$, $$Forma correta de segurar o arco com flexibilidade e controle. Posição dos dedos e movimento natural do punho.$$, 'beginner', NULL, 2, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa04c237-5242-4c84-8ab6-a5d00bf4cba3', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa3f74bf-3a87-4406-b3bc-3fa1abd57021', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa810f34-2908-4f9e-a81a-1e3fb925a188', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fb507ed1-92f8-4b72-a149-52e58169cf86', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fbc4a13b-1917-4077-acdc-5b0dfa9ad971', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fbde68f4-c378-4c71-9d01-aef8a322ae1c', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fc3d86ff-d7d2-4e74-b059-adf02650dfcd', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Legato Simples$$, $$Conexão suave entre notas usando o arco de forma contínua.$$, 'intermediate', NULL, 8, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fc4a5224-cf05-4804-be46-703f5ecd592f', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fc5b724c-13f0-4d04-b709-46dc069bb8bd', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Vibrato$$, $$Oscilação controlada da afinação para adicionar expressividade e calor ao som.$$, 'advanced', NULL, 10, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fd85a4c3-fe04-4949-94da-d92ba43d4b82', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Oitavas$$, $$Execução de intervalos de oitava com potência e controle$$, 'advanced', $$/video/oitavas_piano.mp4$$, 11, '2025-06-08 18:58:05.594323'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fd89b4e6-c21f-4eea-9d89-2ce4c25b6f80', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Terceira Posição$$, $$Posição avançada da mão esquerda que permite tocar notas mais agudas.$$, 'advanced', NULL, 11, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fdffd7d5-6314-4898-b2a9-c64ba8d7ad1e', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Pizzicato Básico$$, $$Técnica de beliscar as cordas com os dedos da mão direita antes de usar o arco.$$, 'beginner', NULL, 3, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe14a197-6b22-4faf-acba-c0a012df8572', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe241ff2-bc3e-4f88-b95c-89cecc813b9b', '9a5e0eac-114e-4173-90af-32b55c870675', $$Detaché$$, $$Técnica básica de arco com um movimento para cada nota, separadas claramente.$$, 'intermediate', NULL, 4, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe47e42b-492b-426c-9537-b4e1490a269c', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Vibrato$$, $$Oscilação expressiva de altura$$, 'intermediate', NULL, 8, '2025-09-22 11:49:23.689965'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fea3d897-d041-4ab0-8807-1e08872b319e', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Dinâmicas Básicas$$, $$Controle de volume e intensidade do som através da pressão e velocidade do arco.$$, 'intermediate', NULL, 9, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fec0da51-547d-4dac-a95e-99ea0170b3f5', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Staccato Volante$$, $$Técnica avançada de staccato com movimento fluido e saltitante do arco.$$, 'advanced', NULL, 12, '2025-06-09 03:41:50.544795'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fef3cc77-ab30-4b24-bfcc-a01d47693fea', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Primeira Posição$$, $$Posicionamento básico da mão esquerda no braço do violino para tocar notas fundamentais.$$, 'intermediate', NULL, 6, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff445232-8422-4884-b00b-bd6fd63f1801', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Dinâmica$$, $$Controle de intensidade.$$, 'intermediate', $$https://www.youtube.com/watch?v=baixo_tecnica8$$, 8, '2025-06-16 04:45:13.675524'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff83b9d9-33a8-4690-b843-668169bf7757', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Postura Corporal$$, $$Posição correta do corpo, braços e mãos para tocar violino. Inclui posicionamento da queixeira, espaleira e equilíbrio do instrumento.$$, 'beginner', NULL, 1, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff872627-8f15-4375-81ea-6d5b45dd7dce', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Escalas Maiores$$, $$Execução de escalas maiores de uma oitava em diferentes tonalidades.$$, 'intermediate', NULL, 7, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_techniques (tenant_id, id, instrument_id, name, description, difficulty, video_url, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ffde3444-4d4a-4391-9c61-59d62916d091', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Mudanças de Cordas$$, $$Transição suave entre diferentes cordas mantendo a continuidade sonora.$$, 'intermediate', NULL, 5, '2026-02-13 16:48:46.597597'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;