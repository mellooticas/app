-- =============================================
-- Migration: 042_lesson_activities_2026.sql
-- Table: core.lesson_activities
-- Year 2 Curriculum Activities
-- Generated: 2026-03-01T13:48:29.185Z
-- =============================================

BEGIN;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6e3885c0-177b-42c2-bc00-813b4eb5bfd9', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Abertura/Integração — Devocional de boas-vindas e dinâmica de reencontro. Cada aluno compartilha uma memória musical do ano passado ou uma expectativa para o ano novo.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6a09e009-b02c-440f-b992-e4c6ecf8ca61', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Atividade Principal — Apresentação do plano anual 2026 (7 blocos temáticos). Dinâmica de formação de grupos: sorteio de instrumentos e afinidades. Tour pelo app atualizado: novas funcionalidades.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd8cddb96-3660-4f29-82ca-26e263c26fdd', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Atividade App/Desafio Alpha — Gravar um vídeo de apresentação pessoal: nome, instrumento e meta musical para 2026. Postar no feed do app.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9d87696f-aae5-4946-8736-5f5d8b5cb420', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Encerramento — Roda de expectativas: cada grupo compartilha 3 metas coletivas para o ano. Foto oficial dos grupos 2026.$$, $$final$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8e324135-2e0c-4b20-88f8-2aa6418cd971', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Abertura/Integração — Aquecimento corporal e vocal. Jogo de memória rítmica: professor toca padrões, alunos repetem e variam.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c27c626b-e35c-4497-b205-e79701fe9c11', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Atividade Principal — Diagnóstico musical: exercícios de leitura rítmica, melódica e prática instrumental em estações rotativas. Professor avalia e anota nível individual.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '73e5728e-05c1-4072-a516-8906823412da', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Atividade App/Desafio Alpha — Gravar vídeo tocando uma peça livre de até 1 minuto. Postar no app como "baseline" do Ano 2.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6a7a8542-a3db-4907-8bec-ff7da2a353fe', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Abertura/Integração — Aquecimento com palmas em cânone. Jogo do "Ritmo Viajante" em roda: cada aluno adiciona uma célula rítmica à sequência.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5c6f50e7-049f-43cd-b17c-2a8ce84b1841', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Atividade Principal — Explicação de semicolcheias, síncopas e quiálteras com exemplos no quadro e no instrumento. Exercícios de leitura em grupo. Prática: peça rítmica a 3 vozes.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c68586cb-b2b5-4cd8-a46f-a86ed0fe5cef', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Atividade App/Desafio Alpha — Gravar vídeo executando um exercício rítmico com síncope. Postar no app com a hashtag #RitmoAvançado.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5692d4ff-18c4-4baa-9f75-24783bbe64f2', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Abertura/Integração — Jogo de intervalos: professor toca dois sons, alunos identificam se é 2ª, 3ª, 5ª ou 8ª. Dinâmica de competição amigável entre grupos.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ae3aab17-c9b7-44ce-9145-e2d13c4abefc', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Atividade Principal — Explicação visual e sonora dos intervalos de 2ª a 8ª. Associação com músicas conhecidas (ex: 5ª = Star Wars). Prática de solfejo com intervalos. Leitura de melodia com intervalos variados.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'fcc8dbe2-afa3-42d1-a042-a1357bc3be21', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Atividade App/Desafio Alpha — Gravar áudio cantando ou tocando uma sequência de intervalos. Postar no app identificando cada intervalo.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '73244051-2181-49b9-9db6-a7afd58baf03', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Abertura/Integração — Dinâmica do "Semáforo Musical": verde = forte, amarelo = mezzo, vermelho = piano. Professor rege e alunos respondem em tempo real.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '770b09de-71f4-4d4a-b1cf-570c80f07caf', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Atividade Principal — Explicação dos sinais de dinâmica. Prática em grupo: mesma peça tocada com diferentes dinâmicas. Exercício de crescendo/diminuendo em cânone. Ensaio de peça expressiva.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '364766bf-d679-4304-b844-deaabb326e09', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Atividade App/Desafio Alpha — Gravar vídeo tocando uma peça com variações de dinâmica claras (piano → forte → piano). Postar no app.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '08fe1b0a-eb26-40ff-ad57-6d8f5edc17c3', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Abertura/Integração — Aquecimento coletivo: escalas em uníssono, depois em terças. Exercício de escuta: tocar sussurrado e crescer juntos.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'eb63c97e-b653-410f-bd8f-6738252d9a5c', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Atividade Principal — Ensaio de 2 peças em conjunto (uma rítmica, uma melódica). Foco em sincronia, dinâmica e afinação. Rodízio de liderança: cada aluno rege por 1 minuto.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc1180ff-294a-431e-89b3-c91bdacf3e2c', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Atividade App/Desafio Alpha — Gravar vídeo do grupo tocando uma das peças ensaiadas. Postar no app com comentário sobre o que melhorou desde o Ano 1.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8fbc40dc-05da-49df-8a58-743ddcfb5a05', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Encerramento — Roda de feedback: o que cada grupo precisa melhorar? Definição de metas para o Bloco 2.$$, $$final$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1ef150dc-135f-4bc9-87df-ab13814ca42f', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Abertura/Integração — Aquecimento técnico: escalas cromáticas lentas com foco em legato e staccato. Dinâmica de respiração para sopros / postura para cordas e percussão.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9a9061be-d372-4cd9-8f26-2118db040089', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Atividade Principal — Exercícios técnicos por naipe: escalas em diferentes articulações, arpejos, padrões de velocidade progressiva. Professor circula e orienta individualmente.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1b4bc271-3c98-4784-8e30-e452e3e9d95d', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Atividade App/Desafio Alpha — Gravar vídeo praticando um exercício técnico em 3 velocidades (lento, médio, rápido). Postar no app.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'db794d9c-df9c-4b93-beb8-2146a61db6ca', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Abertura/Integração — Escuta comparativa: trechos musicais com e sem ornamentos. Alunos identificam onde os ornamentos aparecem.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd78178b0-f082-4e04-b82f-501d811dee26', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Atividade Principal — Demonstração e prática de ornamentos por naipe. Exercícios de vibrato (cordas/sopros). Introdução a técnicas estendidas (harmônicos, pizzicato, flutter-tongue). Aplicação em trecho musical.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '82808913-9ba2-47dd-a8f3-b9dea646d94a', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Atividade App/Desafio Alpha — Gravar vídeo demonstrando um ornamento aprendido aplicado em uma melodia. Postar no app.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6aa85cab-06ea-493f-9e1f-bc019f96c273', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Abertura/Integração — Jogo de "adivinha o modo": professor toca trechos em diferentes modos, alunos descrevem a emoção/cor que sentem (alegre, triste, misterioso, festivo).$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '143a40ba-d8ee-466e-b780-3dd3d45fc6ff', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Atividade Principal — Explicação das escalas maior e menor natural. Introdução aos modos: jônio, eólio, dórico e mixolídio com exemplos musicais conhecidos. Prática: tocar escalas e improvisar sobre cada modo.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c8cf6dc2-bcdd-40c9-94b7-47ddad6c0cde', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Atividade App/Desafio Alpha — Gravar improvisação curta (30s) usando um modo aprendido. Postar no app identificando qual modo usou e que emoção quis transmitir.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6f6ac0c4-c24e-4099-bb61-2fb488afc04c', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Abertura/Integração — Escuta ativa: professor toca 3 músicas famosas, alunos tentam identificar os acordes/progressão. Debate sobre o "efeito" de cada progressão.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '67514c7c-a0a6-455b-8d95-8fa7953efd49', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Atividade Principal — Formação de acordes no teclado/violão: maiores, menores, com 7ª. Prática de progressões I-IV-V e I-V-vi-IV em grupo. Aplicação: acompanhar uma canção popular usando as progressões.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '88a15e06-e71b-41d0-b151-ed238a665a2d', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Atividade App/Desafio Alpha — Gravar vídeo tocando uma progressão harmônica enquanto outro colega faz a melodia. Postar no app em dupla.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '13bbee82-41c2-45d6-b3e5-de4407003f06', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Abertura/Integração — Quiz rápido: projetar trechos de cifras e partituras, alunos identificam tonalidade, compasso e acordes.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '47f77c30-7d75-4006-a590-0f10cb0f74e7', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Atividade Principal — Leitura guiada de partitura com cifras. Prática em naipes: melodia (leitura de partitura) + harmonia (leitura de cifras). Montagem de uma peça completa com ambas as notações.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2ee3db4d-1cf7-49e9-abdb-37427ccdd19c', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Atividade App/Desafio Alpha — Gravar vídeo do grupo executando a peça lida na aula. Postar no app com o PDF da partitura/cifra como referência.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '45600bb5-7eed-431b-9af2-acc199698b93', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Abertura/Integração — Aquecimento coletivo com escala em cânone. Revisão rápida dos conceitos-chave: ritmo avançado, intervalos, dinâmica, técnica, escalas, acordes, leitura.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0d788de5-b343-47a6-8b07-ff95638c092d', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Atividade Principal — Mini-recital interno: cada grupo apresenta 1 peça preparada. Plateia (outros grupos) avalia usando critérios combinados. Feedback construtivo do professor.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0c0cf14-c20b-496c-8a43-096fe51d6fe7', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Atividade App/Desafio Alpha — Gravar o mini-recital do grupo e postar no app. Cada aluno comenta o vídeo de outro grupo com feedback positivo.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f5998e86-0e00-49f1-824a-9c927fefc449', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Encerramento — Premiação simbólica (destaque de cada grupo). Roda de feedback geral sobre o 1º semestre parcial.$$, $$final$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9f80447f-7db7-4f21-9bb6-bcc753cbe8fc', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Abertura/Integração — Escuta analítica: ouvir 2 músicas populares e mapear a estrutura (intro, verso, refrão, ponte). Alunos desenham o "mapa da canção" no papel.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '22922e04-1e69-43f7-857b-b84df3755a44', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Atividade Principal — Explicação das seções de uma canção com exemplos. Cada grupo recebe uma estrutura (ex: AABA, ABAB) e deve criar uma melodia curta para cada seção. Apresentação das primeiras ideias.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f1adeb23-3a3e-4cc8-bb40-e32e29c24b49', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Atividade App/Desafio Alpha — Gravar áudio da primeira ideia de composição do grupo (pode ser esboço). Postar no app pedindo feedback dos colegas.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '865ca60c-4e4f-44d9-9575-94e4257a16e6', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Abertura/Integração — Jogo de palavras musicais: professor dá um tema, cada aluno escreve 3 palavras/frases em 2 minutos. Compartilhar em roda.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '05cdd059-c44b-45d2-8271-33a94dc123b9', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Atividade Principal — Técnicas de escrita de letra: rima, métrica, prosódia (encaixe letra-melodia). Cada grupo escolhe um tema e escreve verso e refrão. Prática de cantar a letra sobre a melodia criada na aula anterior.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0bcec18f-7c5a-4cf5-bf07-f93afd56f86b', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Atividade App/Desafio Alpha — Gravar vídeo cantando ou falando a letra criada sobre uma base. Postar no app.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3425ada4-0aad-4005-ac9f-4e7ff4089b8e', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Abertura/Integração — Escuta comparativa: mesma melodia tocada solo vs. com arranjo para grupo. Debate: o que muda? O que é arranjo?$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1462a50e-d0f6-4780-aedb-8cf343928442', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Atividade Principal — Conceitos de arranjo: uníssonos, oitavas, terças, contracantos. Cada grupo recebe uma melodia simples e deve criar um arranjo para seus instrumentos. Professor orienta cada grupo.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f3f2975b-9a4a-4ffd-a595-e2976f81d1aa', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Atividade App/Desafio Alpha — Gravar a primeira versão do arranjo do grupo. Postar no app comparando com a melodia original.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3afb864b-fa0e-40ab-b25d-45c1a10c4a14', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Abertura/Integração — Demonstração ao vivo: professor toca 3 arranjos da mesma música com texturas diferentes (unísono, homofônico, polifônico). Debate sobre o efeito de cada um.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4bbb1e2e-3d3e-4ec5-a054-bc9a37a40440', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Atividade Principal — Divisão por naipes: cada naipe cria sua parte para a peça da semana. Ensaio por naipes separados, depois junção. Ajustes de equilíbrio e dinâmica no conjunto.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7a7767fa-34ef-448e-b893-2f50fb92c305', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Atividade App/Desafio Alpha — Gravar vídeo do arranjo completo com todos os naipes juntos. Postar no app.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c6ad31d8-4acb-4473-9688-7bd45c97d14a', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Abertura/Integração — Demonstração: professor monta uma música ao vivo em DAW usando loops, samples e gravação. Debate: como a tecnologia amplia a criatividade?$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f32c2422-af8d-4bb2-a327-6124a6d732a5', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Atividade Principal — Tutorial hands-on: BandLab/GarageBand/Soundtrap. Cada dupla cria uma produção de 1 minuto usando loops + gravação de instrumento real. Edição básica: cortar, colar, volume, pan, efeitos.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '35ab0ba4-6084-460f-ae72-8828ec163062', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Atividade App/Desafio Alpha — Exportar a produção digital e postar no app como áudio. Descrever os elementos usados (loops, gravação, efeitos).$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c0fca0a6-7384-430e-8616-0bbf9fb40062', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Abertura/Integração — Escuta crítica: comparar gravações de baixa e alta qualidade da mesma música. Alunos identificam diferenças e problemas técnicos.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ece2060c-fae2-40ae-b936-e1ee63c273f2', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Atividade Principal — Demonstração de gravação: posicionamento de microfone, níveis de entrada, tratamento acústico improvisado. Cada grupo grava um take de sua peça. Introdução à mixagem: volume, pan, EQ simples.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0bd8eeb5-1e95-462e-ae9b-cbb876d57f7d', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Atividade App/Desafio Alpha — Postar no app a gravação finalizada com mixagem básica. Comparar com a versão "crua" sem mixagem.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'cf5c3f4f-3d10-4726-a4fb-abc303697311', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Abertura/Integração — Roda de conversa: o que sabemos sobre a influência africana na música brasileira? Escuta de exemplos: maracatu, ijexá, samba de roda, jongo.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd8c9b1f9-4924-4160-918e-5d747b3931a5', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Atividade Principal — Prática de ritmos africanos em percussão corporal e instrumentos: djembê, agogô, ganzá. Aprender uma canção afro-brasileira em grupo. Contexto cultural: história e significado dos ritmos.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9829f575-bab9-4d36-92f6-a44b1e3c2997', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Atividade App/Desafio Alpha — Gravar vídeo do grupo tocando um ritmo afro-brasileiro aprendido. Postar no app com informação cultural sobre o ritmo.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6bc236b8-b290-4ea3-8541-1a3d0bbfbec7', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Abertura/Integração — Viagem sonora: ouvir 1 minuto de cada gênero latino (salsa, cumbia, bossa, tango, son). Alunos adivinham o país de origem.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '39a6411a-63ca-4ce4-838d-01cee6683c05', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Atividade Principal — Prática de clave latina e ritmos de bossa nova no conjunto. Aprender uma peça latino-americana em grupo. Comparação de padrões rítmicos entre gêneros.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2be7ec20-3d0e-4f5a-ab1f-f472412999b0', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Atividade App/Desafio Alpha — Gravar vídeo tocando uma peça latina aprendida. Postar no app com pesquisa sobre o gênero escolhido.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '530bb6f8-b321-494c-9ad1-b3012b39d7f3', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Abertura/Integração — Escuta meditativa: peça tradicional para koto. Debate: quais emoções a música oriental desperta? Comparação com a escala ocidental.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9645517f-383e-4650-9ae3-18384d4166ff', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Atividade Principal — Prática da escala pentatônica japonesa (in, yo, miyako-bushi). Aprender trecho de música tradicional + adaptação de J-Pop para o conjunto. Conexão cultural: a herança nipo-brasileira.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '54b8a907-c6db-4b94-9534-f5b4e7b402e9', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Atividade App/Desafio Alpha — Gravar vídeo tocando na escala pentatônica japonesa ou a adaptação de J-Pop. Postar no app com reflexão sobre a identidade nipo-brasileira.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a1c21752-25b2-4772-ad64-d3a93750599e', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Abertura/Integração — Escuta histórica: do blues do Delta do Mississippi ao jazz de New Orleans. Linha do tempo visual. Debate: como o blues influenciou toda a música popular?$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4d6572d-a33c-4920-a7ea-1304cdc971eb', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Atividade Principal — Prática do 12-bar blues em conjunto: base harmônica + melodia blues. Introdução às blue notes e ao swing. Improvisação guiada sobre o 12-bar blues: cada aluno faz um chorus.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '678ca871-bfef-4d1b-848e-daa75e06720f', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Atividade App/Desafio Alpha — Gravar improvisação de 12 compassos sobre base de blues. Postar no app.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc18e5d4-6791-4b17-840a-a1e5b3e8369b', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Abertura/Integração — Playlist colaborativa: cada aluno traz 1 música que representa "sua geração". Escuta coletiva e debate sobre diversidade de gêneros.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '183d303e-07de-44ff-a373-522c9fd8f6a5', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Atividade Principal — Prática de grooves: rock (8th note feel), pop (4 on the floor), hip-hop (boom-bap). Cada grupo escolhe um gênero e cria um arranjo curto de uma música atual. Ensaio e apresentação.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '15f1098a-ca54-4bc3-843f-a1f498c80905', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Atividade App/Desafio Alpha — Gravar vídeo do arranjo pop/rock/urbano criado. Postar no app com enquete: qual gênero a turma mais curtiu?$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '061a5273-cadc-4805-8278-7b01ce34e27a', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Abertura/Integração — Quiz musical relâmpago: perguntas sobre composição, arranjo, escalas modais, gêneros mundiais. Competição entre grupos.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd35e0e8c-609c-41b4-96bd-dbcdffbc1ac9', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Atividade Principal — Mini-recital temático: cada grupo apresenta 1 peça que represente um dos temas dos Blocos 3-4 (composição original, arranjo, música mundial, produção digital). Avaliação pela plateia.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4052a4c4-b948-4064-9122-07b182f919f5', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Atividade App/Desafio Alpha — Gravar e postar o mini-recital no app. Cada aluno vota na melhor apresentação.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f7a0ff95-eeb0-4205-ae9d-e170dc628943', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Encerramento — Premiação e feedback coletivo. Reflexão sobre o 1º semestre completo. Celebração das conquistas.$$, $$final$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'bcc16111-689d-44c8-8fac-20d19237b26e', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Abertura/Integração — Dinâmica de confiança: exercícios teatrais de projeção de voz, contato visual e expressão corporal. "Diga seu nome como uma estrela do rock."$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '63d97813-6db1-40be-b35e-cff223967ca0', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Atividade Principal — Workshop de palco: posicionamento no palco (onde ficar, como se mover), comunicação com a plateia (olhar, gestos, falar ao microfone), técnicas de controle da ansiedade (respiração, visualização). Prática: simular entrada no palco, performance e saída.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6424bcbb-58c6-4fc7-9d65-e691bfc0139b', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Atividade App/Desafio Alpha — Gravar vídeo simulando uma entrada de palco + performance + agradecimento. Postar no app.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7f2d75ab-d581-499e-9c6a-833ec10d9f83', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Abertura/Integração — Tour técnico: apresentar cada equipamento de som (microfone, mesa, caixas, cabos, retorno). Quiz: para que serve cada um?$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0bd14e18-eda5-4942-9992-94d10324739d', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Atividade Principal — Prática hands-on: montar um sistema de som simples. Cada dupla conecta microfone → mesa → caixa. Prática de passagem de som: ajustar volume, EQ e retorno para cada instrumento. Simulação de soundcheck completo.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b86dd3f3-1e48-491b-aced-55a3ca2ae37d', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Atividade App/Desafio Alpha — Gravar vídeo-tutorial curto explicando como conectar um microfone à mesa de som. Postar no app.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5cd95b95-f0ec-4b5f-8aa0-9258ddd21d0a', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Abertura/Integração — "Conversa musical": 2 alunos improvisam juntos como se estivessem conversando (pergunta e resposta musical). Turma observa e comenta.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0a6a727f-f30e-479b-bc6a-c0681d04cd28', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Atividade Principal — Improvisação sobre progressões: ii-V-I em diferentes tonalidades. Uso de escalas modais na improvisação. Prática de improvisação coletiva: formato de jam session com revezamento de solistas.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2a8c213-6ef7-472c-8824-3ad3dbe574a7', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Atividade App/Desafio Alpha — Gravar improvisação de 1 minuto sobre uma base harmônica. Postar no app descrevendo a escala/modo usado.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'bfdefde2-df12-4f92-904b-95a725681f99', 'd98bb535-a591-4262-97be-a8e909038c93', $$Abertura/Integração — Escuta de quarteto de cordas e trio de jazz. Debate: o que muda quando não há amplificação? Como os músicos se comunicam?$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '36fcfaa7-055a-43ff-93b1-525d6fd13660', 'd98bb535-a591-4262-97be-a8e909038c93', $$Atividade Principal — Formação de duos, trios e quartetos. Cada formação ensaia uma peça curta com foco em equilíbrio dinâmico, escuta mútua e comunicação visual. Apresentação para a turma.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5204120e-22ab-4a1c-8708-88f4cf15ac87', 'd98bb535-a591-4262-97be-a8e909038c93', $$Atividade App/Desafio Alpha — Gravar vídeo da formação acústica tocando. Postar no app. Desafio extra: gravar sem edição (take único).$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '344191d7-b19b-4b6d-96d0-d9ca5cd3e679', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Abertura/Integração — Brainstorm coletivo: cada grupo discute ideias para seu projeto musical. Quais músicas? Qual formação? Vão compor ou arranjar?$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7871d8da-0f2e-4144-a88c-220504dbfa26', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Atividade Principal — Cada grupo preenche a ficha de projeto: repertório escolhido (1-2 músicas), formação dos músicos, estilo de arranjo, cronograma de ensaios. Professor orienta e valida cada projeto.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '470ec1b0-000c-4c9f-9b53-514e6aa12a3e', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Atividade App/Desafio Alpha — Postar no app o plano do projeto musical do grupo: nome do grupo, repertório e foto da equipe.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa355070-f47e-43a2-a3f1-68e51f67c6e3', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Abertura/Integração — Check-in rápido: cada grupo apresenta em 1 minuto o que preparou durante a semana. O que funcionou? O que travou?$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2a8d605f-1724-4490-af23-306b5743478a', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Atividade Principal — Ensaio dirigido por grupo: professor circula entre os grupos orientando. Foco em leitura do repertório, distribuição de partes e primeiros ensaios musicais. Resolução de problemas técnicos.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ecf850e3-e730-4576-af47-ea456e596c1b', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Atividade App/Desafio Alpha — Gravar vídeo do primeiro ensaio do projeto (mesmo que incompleto). Postar no app como "work in progress".$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7cd8cefc-9e7c-48a2-8977-05d5cc3c8cb5', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Abertura/Integração — Análise de videoclipes: assistir 2 clips (um simples, um elaborado). Debate: o que torna um clipe interessante? Qual a relação entre imagem e música?$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'fc00acb9-0c1b-44a2-9da5-05392b17d93d', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Atividade Principal — Workshop de produção de videoclipe: planejamento (storyboard básico), filmagem (enquadramentos, iluminação com celular), edição (CapCut/iMovie). Cada grupo planeja e filma um trecho de seu videoclipe.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9fd20752-2046-4c5d-8b2b-73789f41cc0f', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Atividade App/Desafio Alpha — Postar no app o trecho filmado do videoclipe (mesmo que seja um teaser de 30s).$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '94616b19-0f10-43a1-9cbc-182988e8009a', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Abertura/Integração — Debate: como a música pode transformar uma comunidade? Exemplos de projetos sociais musicais no Brasil e no mundo. Conexão com a missão Nipo School.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9e248445-46f8-483c-9022-924391857766', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Atividade Principal — Cada grupo planeja uma "ação musical comunitária" hipotética: onde tocariam? Para quem? Que repertório? Prática de peça acessível para público leigo (simples, envolvente, com participação da plateia).$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c7694292-d7cf-492d-b12e-2cd76c860c6a', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Atividade App/Desafio Alpha — Gravar vídeo da peça ensaiada com convite para a comunidade. Postar no app como "preview" da ação comunitária.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc0fae3a-3c63-41c6-a903-6cc088666821', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Abertura/Integração — Apresentação do setlist oficial do Show Final. Votação final sobre ordem das músicas. Definição dos grupos e solistas para cada peça.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3e947616-3da9-4f32-bf5b-c7282b893d42', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Atividade Principal — Distribuição de partes e partituras do Show Final. Primeiro ensaio das peças coletivas (toda a turma junta). Foco na leitura e nas entradas de cada naipe.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4d8a3738-ea1e-4935-993c-be3bd5d12344', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Atividade App/Desafio Alpha — Postar no app o setlist oficial do Show Final com foto do grupo. Cada aluno comenta qual peça está mais animado para tocar.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3948f92e-122f-4d8d-ab0b-e4e3b4e37f30', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Abertura/Integração — Escuta da gravação de referência: cada peça é ouvida com partitura na mão. Marcar pontos de atenção (dinâmica, cortes, entradas).$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '36049c2e-5588-454f-a510-c1d9332e652d', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Atividade Principal — Ensaio focado: trabalhar cada peça do setlist com atenção a dinâmicas, articulações e transições. Ensaiar momentos especiais: solos, participação da plateia, momentos de silêncio.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '001e7d20-8736-464f-9f12-c786fff09107', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Atividade App/Desafio Alpha — Gravar trecho do ensaio mostrando evolução. Postar no app comparando com o primeiro ensaio.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1194d14-fc9f-4a0d-af39-788a0c18a4fe', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Abertura/Integração — Aquecimento coletivo: vocalize, escalas e alongamento. Devocional motivacional sobre confiança e união.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3d0406a7-0db2-4853-9bbf-abdb1f03ea29', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Atividade Principal — Run-through completo: executar todo o setlist na ordem, sem parar. Simular entradas, saídas, transições e momentos de fala/apresentação. Feedback do professor ao final de cada peça.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1961107-4bc0-4787-acd2-3ba4434eac22', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Atividade App/Desafio Alpha — Gravar o run-through completo (ou trechos). Postar no app como "contagem regressiva para o Show Final".$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3d0b9bd7-0bac-49d1-8279-28a53bd67813', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Abertura/Integração — Revisão dos pontos de melhoria do ensaio anterior. Exercício de confiança: "Diga algo que admira no colega ao lado."$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8769805a-fe52-4b18-aa4c-ebffc3ed815d', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Atividade Principal — Trabalho focado nos pontos fracos identificados. Depois: run-through completo novamente. Ensaio de situações-problema: o que fazer se errar? Se o som falhar? Se esquecer a parte?$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '05bf12a0-ad6b-4b68-94e8-f16b3af1d245', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Atividade App/Desafio Alpha — Postar no app um "diário de ensaio": o que melhorou, o que ainda precisa de atenção. Encorajar os colegas nos comentários.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'cea3da6a-1682-44f4-bc3d-5892733d7f1a', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Abertura/Integração — Devocional de motivação: reflexão sobre a jornada do ano. Cada aluno recebe uma carta de si mesmo escrita na aula inaugural (aula 30).$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd2b524f7-1127-4bc5-89a2-f050f68d3fc5', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Atividade Principal — Ensaio geral completo no espaço de apresentação (ou simulação). Com figurino, posições de palco, iluminação e som amplificado. Run-through do início ao fim sem interrupções.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '219f81c4-e328-4b47-b32d-1bd8a6e9f0a5', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Atividade App/Desafio Alpha — Gravar bastidores do ensaio geral (fotos e vídeos). Postar no app como "behind the scenes" do Show Final.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7393dbdc-7499-4bd4-ae6b-a227d9ddba1a', 'b3733049-d482-4882-a484-e092fe79324d', $$Abertura/Integração — Círculo de gratidão: cada aluno agradece a alguém do grupo por algo específico do ano. Momento de oração/reflexão coletiva.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '497ef22d-7f89-4608-87c1-30ca4ba733fa', 'b3733049-d482-4882-a484-e092fe79324d', $$Atividade Principal — Ensaio geral final: run-through completo com todos os elementos. Ajustes finais de som, posicionamento e transições. Ensaio da cerimônia de formatura (entrega de certificados, discursos, agradecimentos).$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'aca12610-2f50-4e2e-8b6e-2cca76a08546', 'b3733049-d482-4882-a484-e092fe79324d', $$Atividade App/Desafio Alpha — Postar no app uma mensagem de agradecimento à equipe Nipo School. Compartilhar expectativas para o Show Final.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2d72e772-e133-44b0-9dde-113db0a9070c', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Abertura/Integração — Momento de concentração: exercício de respiração profunda e visualização do show perfeito. Palavras de encorajamento do professor.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c0c283a6-d646-4422-852f-2a507e22df51', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Atividade Principal — Passagem de som completa no local do evento: testar cada instrumento, vozes, retorno, volume de cada naipe. Run-through final das peças mais desafiadoras. Ensaio da cerimônia de formatura com todos os elementos.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f47f1de5-27e1-490a-903d-5902caede3e1', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Atividade App/Desafio Alpha — Postar no app uma mensagem motivacional para si mesmo: "Carta para o eu de amanhã". Compartilhar com o grupo.$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a72bf1fb-1683-45cc-b3dd-9b089b62e340', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Abertura/Integração — Devocional de abertura com famílias e comunidade. Palavras de boas-vindas do diretor/coordenador. Apresentação dos alunos e professores.$$, $$abertura$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a5c2e771-126c-46e6-8832-4844b65f942d', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Atividade Principal — Show Final completo: execução de todo o repertório na ordem do setlist. Momentos especiais: solos, duetos, participação da plateia, homenagens. Cerimônia de formatura: entrega de certificados, premiações especiais e discurso de encerramento.$$, $$principal$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '94710c74-be28-4827-82a9-3db3620e3015', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Atividade App/Desafio Alpha — Postar no app foto ou vídeo pessoal do Show Final. Escrever reflexão final: "O que a música me ensinou neste ano."$$, $$alpha$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b0d34e52-d600-4ce7-bc5d-2b9d2eaf9b6a', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Encerramento — Roda de celebração com alunos, professores e famílias. Foto oficial da turma 2026. Confraternização e agradecimentos.$$, $$final$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

-- Total: 125 activities
COMMIT;