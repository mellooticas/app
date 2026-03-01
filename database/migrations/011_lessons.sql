-- =============================================
-- Migration: 011_lessons.sql
-- Table: core.lessons
-- Source CSV: aulas_rows.csv
-- Generated: 2026-02-28T16:15:03.496Z
-- Rows: 30
-- =============================================

BEGIN;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '053b763b-5606-42bc-b02a-a94364239a74', NULL, 26, $$Ensaio Geral II$$, $$Realizar o segundo ensaio geral, consolidando integração entre grupos, corrigindo detalhes finais e preparando para a apresentação oficial.$$, '2025-11-29'::date, NULL, 'draft', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '0beed730-fa51-467d-9805-9415149ba916', NULL, 23, $$Repertório Gospel e Louvor$$, $$Praticar músicas do repertório gospel e de louvor, desenvolver arranjos simples em grupo e estimular a integração espiritual e musical dos alunos.$$, '2025-11-08'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '1168d1e0-4f46-4970-876e-6dc5f2d1f21c', NULL, 18, $$Músicas do Japão$$, $$Apresentar músicas tradicionais japonesas, estimular o contato com a diversidade cultural e integrar práticas de escuta, canto e execução instrumental.$$, '2025-10-04'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '14e59217-40f5-4163-b724-e911314d213a', NULL, 14, $$Oficina de Composição Coletiva$$, $$Estimular a criatividade, desenvolver a escuta coletiva e orientar os alunos na criação de uma música em grupo.$$, '2025-09-06'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '1e357f0c-44ee-4f3b-a39a-851d4f5220b6', NULL, 12, $$Melodia Criativa$$, $$Desenvolver criatividade melódica, incentivar a composição coletiva e estimular a autonomia musical dos alunos.$$, '2025-08-23'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '1f48497c-d8e0-4a9b-b9d1-75b3df353047', NULL, 17, $$Improvisação Guiada$$, $$Estimular a criação espontânea, desenvolver escuta ativa e oferecer técnicas de improvisação simples em grupo.$$, '2025-09-27'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '2a1cd10b-89d2-45f0-a051-93cdf98bc888', NULL, 22, $$Oficina de Bandas/Duplas$$, $$Estimular a prática em pequenos grupos, desenvolver autonomia musical e promover integração entre alunos através da formação de bandas e duplas.$$, '2025-11-01'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '2b58068f-1294-44e2-b9b9-365ef995372d', NULL, 7, $$Alfabetização Musical II$$, $$Fixar leitura básica de notação, estimular leitura prática através de jogos, desenvolver a autonomia musical e o trabalho em grupo.$$, '2025-07-19'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '37b53845-821a-4d7e-9b13-2598e34a42ff', NULL, 3, $$Iniciação Instrumental I$$, $$Apresentar os instrumentos principais do grupo, ensinar postura correta, empunhadura, cuidados básicos e explorar os primeiros sons em conjunto, promovendo consciência corporal e autoestima musical.$$, '2025-06-21'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '3d52bedb-3cb0-4ccc-86bf-6eddd4632364', NULL, 15, $$Semana Criativa$$, $$Estimular a liberdade criativa, promover experimentação musical sem regras rígidas e valorizar a expressão individual e coletiva.$$, '2025-09-13'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '494c3d0d-692b-4509-b90b-b92bd1345eb1', NULL, 28, $$Ensaio Final/Preparação Show$$, $$Consolidar todo o repertório, ajustar detalhes finais de performance e preparar emocionalmente e tecnicamente os alunos para a apresentação final.$$, '2025-12-13'::date, NULL, 'draft', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '57abf3d9-0c1a-4903-a518-81d88c4b7544', NULL, 21, $$Revisão Geral$$, $$Revisar os principais conteúdos trabalhados até aqui, reforçar pontos de dificuldade e consolidar o aprendizado coletivo através de atividades práticas.$$, '2025-10-25'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '59d864ba-84ca-47e1-b31d-b5819021a986', NULL, 27, $$Avaliação Criativa$$, $$Realizar avaliação criativa em formato de roda Alpha e mini-apresentações, proporcionando feedback construtivo, autoexpressão e registro da evolução dos alunos.$$, '2025-12-06'::date, NULL, 'draft', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '5b8d46c4-0bed-4f6b-b743-615035679b6b', NULL, 8, $$Repertório Brasileiro I$$, $$Introduzir repertório popular brasileiro, estimular prática coletiva de canções, trabalhar arranjos simples e integração cultural.$$, '2025-07-26'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '65e4f168-9b96-41e4-b0e7-a79d090fa7aa', NULL, 9, $$Repertório Brasileiro II$$, $$Aprofundar a prática de repertório brasileiro, trabalhar arranjos simples e promover integração cultural por meio da música coletiva.$$, '2025-08-02'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '86fcfcbc-59fb-4769-8435-8bc12d2ed432', NULL, 1, $$Som do Corpo e Ritmo Básico$$, $$Despertar a consciência rítmica, promover a escuta ativa e a integração do grupo usando o corpo como principal instrumento musical.$$, '2025-06-07'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '923053d3-e54a-4698-9517-a46397c0584c', NULL, 19, $$Arranjos Pop/TikTok$$, $$Explorar músicas populares atuais, desenvolver arranjos colaborativos em grupo e estimular a criatividade na adaptação para o formato coletivo.$$, '2025-10-11'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', '9ae951f2-e006-4afd-a07e-1ad588afcd09', NULL, 11, $$Técnicas de Afinação$$, $$Ensinar fundamentos de afinação, promover a escuta ativa e estimular o cuidado e manutenção dos instrumentos.$$, '2025-08-16'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'a7d5335f-94f1-4646-8bc4-cc0c4cd663ea', NULL, 29, $$Show Final/Aula de Encerramento$$, $$Realizar a apresentação final, celebrar conquistas individuais e coletivas, promover integração da comunidade escolar e encerrar o ciclo de aulas com feedback e celebração.$$, '2025-12-20'::date, NULL, 'draft', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'b154f8a4-d7be-40b8-8bde-c64d409bde2b', NULL, 0, $$Aula Inaugural$$, $$Apresentar o projeto, criar vínculos, montar grupos$$, '2025-05-31'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'b9d6f98c-1f40-42de-b346-0c5e18eac1f5', NULL, 5, $$Jogo de Ritmos e Grupos$$, $$Desenvolver coordenação motora, cooperação em grupo e resposta musical rápida, utilizando jogos rítmicos e dinâmicas coletivas.$$, '2025-07-05'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'c23b8c68-a284-4c6d-82c8-8f54d00b3e00', NULL, 2, $$Sons do Dia a Dia (Orff)$$, $$Explorar sons do cotidiano, desenvolver percepção auditiva e criatividade a partir de objetos do dia a dia.$$, '2025-06-14'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'c368b564-6704-4c95-9d82-b2672babead5', NULL, 13, $$Harmonia na Prática$$, $$Introduzir conceitos básicos de harmonia, explorar acordes simples e promover a prática coletiva tocando em conjunto.$$, '2025-08-30'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'd5291adc-06b1-47d7-ba66-1735ec3c3a24', NULL, 6, $$Alfabetização Musical I$$, $$Apresentar os símbolos e figuras rítmicas básicas, estimular o reconhecimento visual/sonoro da notação musical e iniciar jogos de leitura e escrita musical coletiva.$$, '2025-07-12'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'd5414bcb-4d76-4cb0-bf0a-8f166cca5b47', NULL, 4, $$Iniciação Instrumental II$$, $$Aprofundar o domínio da postura, fixar a técnica de empunhadura e som, iniciar a experiência de tocar junto, desenvolver escuta coletiva e coordenação em grupo.$$, '2025-06-28'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'eb103e6c-7aa9-43ab-8b2e-ac7dfcde918f', NULL, 20, $$Performance de Grupos$$, $$Preparar os alunos para apresentações coletivas, desenvolver postura de palco, sincronia e confiança na performance em grupo.$$, '2025-10-18'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec18f04f-e44f-4a0f-97d1-bb4eadb3931a', NULL, 25, $$Ensaio Geral I$$, $$Realizar ensaio geral do repertório da apresentação final, integrando grupos e ajustando aspectos técnicos e musicais.$$, '2025-11-22'::date, NULL, 'draft', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'f4ef0c67-c714-4152-a0c3-644d09d94d9d', NULL, 16, $$Tecnologia na Música$$, $$Apresentar ferramentas tecnológicas acessíveis para gravação e criação musical, estimular o uso de celular/tablet como recurso criativo e aproximar os alunos da produção musical digital.$$, '2025-09-20'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'f925d0ab-4eb4-4502-aad5-5b617d0db260', NULL, 24, $$Produção de Vídeo Musical$$, $$Introduzir os alunos ao processo de produção de vídeo musical, estimulando a criatividade audiovisual e o registro de apresentações artísticas.$$, '2025-11-15'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe1d98e4-3a4c-4cd2-a68e-b5b3a8e2e51c', NULL, 10, $$Revisão e Mostra de Grupos$$, $$Revisar conteúdos anteriores, fortalecer a prática coletiva e realizar uma mini-apresentação interna para desenvolver confiança e espírito de grupo.$$, '2025-08-09'::date, NULL, 'completed', '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz, true)
ON CONFLICT (id) DO NOTHING;

COMMIT;