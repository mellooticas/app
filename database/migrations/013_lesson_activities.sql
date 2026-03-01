-- =============================================
-- Migration: 013_lesson_activities.sql
-- Table: core.lesson_activities
-- Source CSV: aula_atividades_rows.csv
-- Generated: 2026-02-28T16:15:03.539Z
-- Rows: 94
-- =============================================

BEGIN;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0002aafe-b54d-4c14-ab30-7ebba1e80b35', 'b154f8a4-d7be-40b8-8bde-c64d409bde2b', $$Formação de grupos — Organização para as próximas aulas.$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0143eb94-1055-4577-ae2a-862edbe1c051', 'b154f8a4-d7be-40b8-8bde-c64d409bde2b', $$Tour pelo app — Como postar, comentar e acessar materiais.$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '017ac26b-b6bd-4ed5-907b-6042e7757c3b', 'd5414bcb-4d76-4cb0-bf0a-8f166cca5b47', $$Atividade Principal — Repetição dos exercícios da última aula com feedback. F...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '06a6e554-5d94-44ec-b192-307e4b789977', '65e4f168-9b96-41e4-b0e7-a79d090fa7aa', $$Abertura/Integração — Roda de conversa: O que aprenderam sobre estilos brasil...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0a816712-73a5-4b88-9ef6-28357a42a163', '9ae951f2-e006-4afd-a07e-1ad588afcd09', $$Atividade App/Desafio Alpha — Gravar vídeo mostrando o processo de afinação d...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0ec81c2c-4eef-4436-975f-3a97ab0e11e9', 'a7d5335f-94f1-4646-8bc4-cc0c4cd663ea', $$Abertura/Integração — Breve devocional e boas-vindas à comunidade. Apresentaç...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '19a37fae-32c7-4c46-90cc-1a092275446a', 'b9d6f98c-1f40-42de-b346-0c5e18eac1f5', $$Atividade App/Desafio Alpha — Gravar vídeo em grupo executando um jogo rítmic...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '19ec5130-1fde-42d8-8f4c-d80f2bfb62dc', '37b53845-821a-4d7e-9b13-2598e34a42ff', $$Atividade App/Desafio Alpha — Cada aluno grava um vídeo em casa segurando cor...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1cd39aef-e367-4483-aaa7-6ab546d1bb7e', '37b53845-821a-4d7e-9b13-2598e34a42ff', $$Atividade Principal — Demonstração coletiva dos instrumentos disponíveis (vio...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1dc9d020-a7b0-463f-a915-e1887b42106a', '65e4f168-9b96-41e4-b0e7-a79d090fa7aa', $$Atividade App/Desafio Alpha — Gravar vídeo em grupo tocando um novo arranjo b...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1f77e80a-0018-4417-a9a3-520d89f2f3dd', 'c368b564-6704-4c95-9d82-b2672babead5', $$Abertura/Integração — Roda de conversa: o que é harmonia? Escuta de músicas s...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '216aa5e0-a04a-4da4-ab3f-92d362107347', '1f48497c-d8e0-4a9b-b9d1-75b3df353047', $$Abertura/Integração — Dinâmica: cada aluno cria um som curto/gesto musical e ...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '234519a7-54ba-41c7-9a59-11c0bb29632b', 'ec18f04f-e44f-4a0f-97d1-bb4eadb3931a', $$Atividade Principal — Execução do repertório completo da apresentação final. ...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '238b1a17-44dc-4681-bd99-982be3526a8a', 'fe1d98e4-3a4c-4cd2-a68e-b5b3a8e2e51c', $$Atividade App/Desafio Alpha — Gravar um trecho da apresentação do grupo, post...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2a327c40-4ec9-4c95-a17a-4490d2e3c9be', 'b154f8a4-d7be-40b8-8bde-c64d409bde2b', $$Boas-vindas e apresentação do projeto — Visão geral, valores e combinados.$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2b7d73a7-f561-44f1-a723-c83f364460c5', 'f925d0ab-4eb4-4502-aad5-5b617d0db260', $$Abertura/Integração — Debate inicial: como os clipes musicais impactam nossa ...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2de53964-83fb-4250-9590-2aad1e351492', '923053d3-e54a-4698-9517-a46397c0584c', $$Atividade App/Desafio Alpha — Postar no app um vídeo do arranjo pop/TikTok cr...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '313744dc-ea96-4226-8dcd-a81d7a60470d', '5b8d46c4-0bed-4f6b-b743-615035679b6b', $$Atividade App/Desafio Alpha — Gravar vídeo tocando música do repertório (grup...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3414cfb4-9443-4378-9cfc-f64fe1c8d90b', '2a1cd10b-89d2-45f0-a051-93cdf98bc888', $$Atividade Principal — Divisão dos alunos em bandas pequenas ou duplas. Cada g...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '353b66e8-ddb9-444d-bc80-3a5cfc51a8ec', '86fcfcbc-59fb-4769-8435-8bc12d2ed432', $$Roda de feedback e lançamento do Desafio Alpha — O que foi divertido/difícil?...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '39df41f2-dfc9-412c-926b-fbead2355cad', 'f4ef0c67-c714-4152-a0c3-644d09d94d9d', $$Atividade App/Desafio Alpha — Gravar e postar no app um loop ou trecho musica...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3b4b6cdf-5060-4390-baab-4b3fc17a747f', 'a7d5335f-94f1-4646-8bc4-cc0c4cd663ea', $$Atividade Principal — Execução do repertório completo em formato de show. Inc...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3dfe3880-b36b-4d95-8648-63b8d17c70a3', 'd5414bcb-4d76-4cb0-bf0a-8f166cca5b47', $$Atividade App/Desafio Alpha — Gravar vídeo tocando as notas/sons da aula (soz...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4128bbf5-91dd-441e-ad0e-e0306aecfb27', '86fcfcbc-59fb-4769-8435-8bc12d2ed432', $$Dinâmica de nomes e sons corporais — Cada participante diz o nome e faz um so...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4238af6b-0ffc-4715-aca7-1e95166d7f2e', '5b8d46c4-0bed-4f6b-b743-615035679b6b', $$Atividade Principal — Prática de repertório em grupo (músicas simples). Traba...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '44fe1db4-4c2b-4b41-abaf-2b1a14252d66', 'a7d5335f-94f1-4646-8bc4-cc0c4cd663ea', $$Encerramento — Roda de celebração: cada aluno compartilha um aprendizado e um...$$, $$final$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '47890806-ec62-436f-ab56-31bbf4433b72', '9ae951f2-e006-4afd-a07e-1ad588afcd09', $$Atividade Principal — Demonstração de afinação em diferentes instrumentos; at...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '588c5228-ab47-42d0-91dc-3eb3937d7332', '1168d1e0-4f46-4970-876e-6dc5f2d1f21c', $$Abertura/Integração — Apresentação cultural: breve vídeo ou imagens sobre a m...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5d3b9d43-c4e8-4f3c-a978-4e4381f595bc', '5b8d46c4-0bed-4f6b-b743-615035679b6b', $$Abertura/Integração — Roda de conversa sobre samba, baião, gospel. Audição de...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6053e9d4-4ff1-4501-8470-2cb4eea3ceeb', '494c3d0d-692b-4509-b90b-b92bd1345eb1', $$Atividade App/Desafio Alpha — No app, postar uma mensagem ou vídeo de motivaç...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '62a3bba7-1100-4f4e-8622-e8107473938f', '1e357f0c-44ee-4f3b-a39a-851d4f5220b6', $$Atividade App/Desafio Alpha — Gravar áudio ou vídeo da melodia criada, postar...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '636c4fc0-c3e6-4c08-b8f0-e1fe0b7336e3', '2a1cd10b-89d2-45f0-a051-93cdf98bc888', $$Atividade App/Desafio Alpha — Cada banda/dupla posta no app um vídeo curto en...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '65e04032-5a98-48ff-aceb-5f1c161e964f', 'f4ef0c67-c714-4152-a0c3-644d09d94d9d', $$Atividade Principal — Demonstração prática de apps de gravação (BandLab, Gara...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '669ffbdf-78c7-4395-9ce5-ad95fda77dfd', '1168d1e0-4f46-4970-876e-6dc5f2d1f21c', $$Atividade App/Desafio Alpha — Postar no app um vídeo em grupo tocando ou cant...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6cabad15-9987-4ab5-b747-8f7e55ff8277', 'eb103e6c-7aa9-43ab-8b2e-ac7dfcde918f', $$Abertura/Integração — Dinâmica de confiança: cada aluno simula subir ao palco...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6d0b7b12-c73e-495e-8811-a234de47ce9f', '2b58068f-1294-44e2-b9b9-365ef995372d', $$Abertura/Integração — Revisão das figuras rítmicas, jogo de leitura no quadro...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6ecee88c-902a-49ac-8bd2-a7a08aa174f9', '65e4f168-9b96-41e4-b0e7-a79d090fa7aa', $$Atividade Principal — Prática de novas músicas do repertório; arranjo coletiv...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6f362e3c-afaa-4355-ab52-0b46b675aced', 'eb103e6c-7aa9-43ab-8b2e-ac7dfcde918f', $$Atividade Principal — Divisão dos grupos e escolha do repertório a ser aprese...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '71645065-2f73-4488-9bd7-253a9483877e', '923053d3-e54a-4698-9517-a46397c0584c', $$Abertura/Integração — Audição de músicas populares do momento (sugestões dos ...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '731f668f-a18a-4507-a7de-ba77aa2bb42c', 'f925d0ab-4eb4-4502-aad5-5b617d0db260', $$Atividade Principal — Divisão em grupos: cada grupo grava um pequeno vídeo mu...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '73714e51-8e1a-4064-a63f-696860d3cf67', '2a1cd10b-89d2-45f0-a051-93cdf98bc888', $$Abertura/Integração — Roda de conversa: como seria sua banda ideal? Debate rá...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '73950727-cc11-48f7-bbd6-8712d7559e9f', '86fcfcbc-59fb-4769-8435-8bc12d2ed432', $$Boas-vindas e devocional de abertura — Integração, reflexão e valores Nipo.$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '73f839cf-06ed-4a7b-91aa-614184350678', '57abf3d9-0c1a-4903-a518-81d88c4b7544', $$Atividade Principal — Roda de revisão: leitura, ritmo, harmonia, improviso e ...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '79738813-ac44-4d52-a191-de5939bd233c', 'd5291adc-06b1-47d7-ba66-1735ec3c3a24', $$Atividade Principal — Apresentação da pauta e figuras, leitura coletiva, ativ...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7aa857be-b416-4370-8623-89936ff9fdfd', '3d52bedb-3cb0-4ccc-86bf-6eddd4632364', $$Atividade Principal — Espaço livre para grupos criarem algo novo: pode ser mú...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7b249d9f-f714-4318-8ffe-f692b6fe5285', '86fcfcbc-59fb-4769-8435-8bc12d2ed432', $$Atividade principal: Padrões rítmicos em grupo — Criar, repetir e inventar se...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7c00e877-aa40-4877-9ac4-e6f5f0495614', '3d52bedb-3cb0-4ccc-86bf-6eddd4632364', $$Abertura/Integração — Roda de conversa: O que é criatividade para você? Debat...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7f65d1bd-539c-4934-bf3c-f16022d6e91f', 'eb103e6c-7aa9-43ab-8b2e-ac7dfcde918f', $$Atividade App/Desafio Alpha — Cada grupo grava um trecho de sua performance e...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8622ea99-1572-4ef3-944d-961ac26e3b1d', '1e357f0c-44ee-4f3b-a39a-851d4f5220b6', $$Atividade Principal — Exploração de instrumentos livres para criação de frase...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '926d07f7-198c-40d1-a3f3-239c9540867d', '37b53845-821a-4d7e-9b13-2598e34a42ff', $$Abertura/Integração — Roda de apresentação: cada aluno compartilha o instrume...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '92851a18-4928-49a6-9197-3e8ef3358774', 'd5291adc-06b1-47d7-ba66-1735ec3c3a24', $$Abertura/Integração — Roda de perguntas sobre notas musicais, exposição de fi...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '973930f1-5de6-4e9c-9c99-6049e2626861', '57abf3d9-0c1a-4903-a518-81d88c4b7544', $$Abertura/Integração — Dinâmica de perguntas e respostas rápidas sobre conteúd...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '98d0a92f-d49b-4fcd-b34d-50ed573b8cfa', 'c23b8c68-a284-4c6d-82c8-8f54d00b3e00', $$Atividade Principal — Pequenos grupos ou duplas exploram sons diferentes com ...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '99275495-f50a-4add-91b2-f3073f229942', 'f4ef0c67-c714-4152-a0c3-644d09d94d9d', $$Abertura/Integração — Debate inicial: como a tecnologia mudou a forma de ouvi...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '99f613f6-6fdb-464a-a157-d428acdc5d7e', '494c3d0d-692b-4509-b90b-b92bd1345eb1', $$Abertura/Integração — Reflexão e devocional sobre coragem e união. Dinâmica r...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9cd799ab-92ad-47ff-b70b-29208bdee8e6', '14e59217-40f5-4163-b724-e911314d213a', $$Atividade Principal — Dividir turma em grupos de 4–6 pessoas. Cada grupo cria...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9dbe2c53-a569-4399-bae7-44f331ad9d53', 'fe1d98e4-3a4c-4cd2-a68e-b5b3a8e2e51c', $$Abertura/Integração — Dinâmica de aquecimento (ritmo ou canto em círculo); co...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9f404692-3fdc-4ab7-b4d6-aed2499ec149', '0beed730-fa51-467d-9805-9415149ba916', $$Atividade Principal — Aprender 2 músicas de louvor em grupo. Dividir papéis e...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a234693e-07c1-4745-bf37-bdef7d300c62', '86fcfcbc-59fb-4769-8435-8bc12d2ed432', $$Jogo Alpha — Simon Musical — Desafio de memória e coordenação em roda.$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a349fb4e-c6c3-41a2-a176-e7f6a79e47f2', '494c3d0d-692b-4509-b90b-b92bd1345eb1', $$Atividade Principal — Execução integral do repertório na ordem da apresentaçã...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a6628e24-7a9a-4efb-80ef-c990c716ef1e', 'c23b8c68-a284-4c6d-82c8-8f54d00b3e00', $$Desafio Alpha/App — Em casa, gravar um vídeo criando uma música só com sons d...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'abe8cec4-396f-4755-9683-a0ec8c1f8785', '053b763b-5606-42bc-b02a-a94364239a74', $$Atividade Principal — Execução integral do repertório com foco em sincronia e...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ad852649-56fa-46d3-9782-d69c01c5aa34', '1f48497c-d8e0-4a9b-b9d1-75b3df353047', $$Atividade Principal — Improvisação individual sobre base rítmica simples. Imp...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b0b830f1-5a6e-43b9-9f86-75d17b2771e7', '0beed730-fa51-467d-9805-9415149ba916', $$Atividade App/Desafio Alpha — Gravar e postar no app um vídeo de grupo cantan...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b4896334-d4ed-4612-8225-df38ee211681', 'c368b564-6704-4c95-9d82-b2672babead5', $$Atividade App/Desafio Alpha — Gravar vídeo tocando uma progressão simples (ex...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b5dd61c8-900c-4e68-89d9-fb5850962009', 'a7d5335f-94f1-4646-8bc4-cc0c4cd663ea', $$Atividade App/Desafio Alpha — No app, postar uma foto ou vídeo pessoal do sho...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b60bcaff-c5bc-4595-8e34-d0fcd6fff1f5', '59d864ba-84ca-47e1-b31d-b5819021a986', $$Atividade Principal — Mini-apresentações (individuais ou em duplas). Após cad...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b7d4fe97-8f83-474a-b193-b66b2d841589', '1f48497c-d8e0-4a9b-b9d1-75b3df353047', $$Atividade App/Desafio Alpha — Gravar e postar no app uma improvisação de até ...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'baf21b99-10bf-4865-b017-50b273b8f5fb', 'b154f8a4-d7be-40b8-8bde-c64d409bde2b', $$Dinâmica de nomes e expectativas — Cada aluno compartilha objetivo pessoal.$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc771f5f-aa36-40b4-b16a-90d22f437abb', 'f925d0ab-4eb4-4502-aad5-5b617d0db260', $$Atividade App/Desafio Alpha — Postar no app o vídeo musical criado em grupo (...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'be3b1d41-82a7-443b-8a30-474416fc88cd', '59d864ba-84ca-47e1-b31d-b5819021a986', $$Abertura/Integração — Momento devocional breve sobre valorização do esforço. ...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c055f195-836c-48b8-9666-5040d17902a3', '2b58068f-1294-44e2-b9b9-365ef995372d', $$Atividade Principal — Grupos criam jogos de leitura, apresentam desafios, esc...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c3345e8b-db61-4b73-ab29-87a09c4c8f83', '1e357f0c-44ee-4f3b-a39a-851d4f5220b6', $$Abertura/Integração — Roda musical: cada dupla/grupo apresenta um pequeno mot...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c35b3ca7-dea2-4102-a2d8-0923f9552910', '1168d1e0-4f46-4970-876e-6dc5f2d1f21c', $$Atividade Principal — Aprender uma canção tradicional japonesa (melodia e rit...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c41ae6c8-a82f-4fe5-9c15-a755ce618a2b', '9ae951f2-e006-4afd-a07e-1ad588afcd09', $$Abertura/Integração — Dinâmica auditiva: adivinhar notas desafinadas vs. afin...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c93ffeaa-3c40-43d8-a4a0-c1898482b5ab', '3d52bedb-3cb0-4ccc-86bf-6eddd4632364', $$Atividade App/Desafio Alpha — Cada aluno ou grupo deve postar no app uma cria...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'cffa5f40-ea71-4c3e-8acd-c0aebb5a861d', '053b763b-5606-42bc-b02a-a94364239a74', $$Abertura/Integração — Reflexão e devocional sobre união e propósito coletivo....$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd142c40a-6113-4d83-a9ac-26e5c085af49', 'b9d6f98c-1f40-42de-b346-0c5e18eac1f5', $$Atividade Principal — Jogo do Maestro: um lidera, grupo responde. Ritmos em R...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd864e398-2e6f-4234-93d9-7ec10d1c7208', 'ec18f04f-e44f-4a0f-97d1-bb4eadb3931a', $$Atividade App/Desafio Alpha — Registrar no app um trecho do ensaio (vídeo cur...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'dd20f4a5-3d33-4189-84eb-71f755b0e8e0', 'fe1d98e4-3a4c-4cd2-a68e-b5b3a8e2e51c', $$Atividade Principal — Ensaio dos grupos para a mini-apresentação; prática de ...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'df456e76-8173-4c6d-8f32-80b0671c0b9e', '57abf3d9-0c1a-4903-a518-81d88c4b7544', $$Atividade App/Desafio Alpha — Cada aluno deve postar no app um resumo em víde...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4554a03-1861-4322-a62b-2e412364131b', '053b763b-5606-42bc-b02a-a94364239a74', $$Atividade App/Desafio Alpha — No app, escrever um diário breve sobre o ensaio...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec55157d-56fa-497f-b900-5acc424876da', '2b58068f-1294-44e2-b9b9-365ef995372d', $$Atividade App/Desafio Alpha — Escrever/fotografar/filmar leitura rítmica cria...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'efdfc363-9e9d-4b17-9f93-aab4918cd3be', 'c368b564-6704-4c95-9d82-b2672babead5', $$Atividade Principal — Explicação de acordes maiores/menores; demonstração em ...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f1403735-eab0-47a8-88c8-4bd4baca3d2a', '0beed730-fa51-467d-9805-9415149ba916', $$Abertura/Integração — Breve devocional musical. Conversa: qual música gospel/...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2da96ff-c8ce-4f83-a694-6deea51dff0b', 'b9d6f98c-1f40-42de-b346-0c5e18eac1f5', $$Abertura/Integração — Aquecimento corporal com palmas, estalos, batidas. Jogo...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f3b3896e-ef8b-4545-b1e2-c8ba1d9e0fba', '14e59217-40f5-4163-b724-e911314d213a', $$Atividade App/Desafio Alpha — Cada grupo deve postar no app um registro (áudi...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f46bb895-7d5d-488b-864a-450157791768', 'd5291adc-06b1-47d7-ba66-1735ec3c3a24', $$Atividade App/Desafio Alpha — Criar e postar no app um padrão rítmico em víde...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f511802e-29fb-4c8d-bfcf-5db94e289e14', 'c23b8c68-a284-4c6d-82c8-8f54d00b3e00', $$Abertura/Integração — Roda de escuta: o professor executa sequências de sons ...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f80a99fd-bcfe-4630-9b48-b957b785a712', '59d864ba-84ca-47e1-b31d-b5819021a986', $$Atividade App/Desafio Alpha — No app, cada aluno deve postar um resumo da pró...$$, $$alpha$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa7a9b5a-c358-4593-9fb0-6bce86ce8dc4', '14e59217-40f5-4163-b724-e911314d213a', $$Abertura/Integração — Dinâmica rápida de improviso: cada aluno cria uma frase...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'fbb5481b-c78f-435b-87d2-bdb5da8bf5ee', 'd5414bcb-4d76-4cb0-bf0a-8f166cca5b47', $$Abertura/Integração — Roda de conversa: Como foi praticar em casa? Alguma dif...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'fc70a219-5606-4a9a-9981-d1c7fb9f479f', 'ec18f04f-e44f-4a0f-97d1-bb4eadb3931a', $$Abertura/Integração — Breve devocional de motivação e foco coletivo. Reflexão...$$, $$abertura$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'fefbb06d-e911-4ec7-a562-b829c989f765', '923053d3-e54a-4698-9517-a46397c0584c', $$Atividade Principal — Divisão da turma em grupos: cada grupo escolhe uma músi...$$, $$principal$$, '2025-12-16 00:06:50.606873+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

COMMIT;