-- =============================================
-- Migration: 006_instrument_performances.sql
-- Table: core.instrument_performances
-- Source CSV: instrumento_performances_rows.csv
-- Generated: 2026-02-28T16:15:03.343Z
-- Rows: 552
-- =============================================

BEGIN;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '00d19b8e-25cb-4271-a17b-7d6bfb84642d', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '012998df-cd60-43b0-8242-76f6c8cbd715', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '01818556-aee2-4474-972d-540be4111b96', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '01ea18c1-d2ab-4a36-bd9d-917604cc1529', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '03bf1651-15ce-4c3e-9a6a-b492fb6a7133', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '042b0803-4029-40b2-9945-c659baa44dfb', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '04a5b983-c91f-4d4f-b92f-a00f886a8e12', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0525b3dc-7a04-4598-9a02-54f8957cf222', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '054e0319-abf3-4ce8-a406-4fcdfa186db0', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05c69063-7c94-460c-84f0-d4453a660571', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0727cb5e-4056-4c7c-8a66-191acbbbef3f', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Claire Chase$$, $$Solo moderno$$, $$https://www.youtube.com/watch?v=flauta_perf8$$, $$Uso de multifônicos e efeitos estendidos.$$, '2025-06-15 19:44:57.490283'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '07ad68d5-ba8d-4267-ac62-4357eaeb776e', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '08039f8c-48f5-473a-a69c-1cd2c4ff734b', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '08414a7b-d315-4492-a814-5a57bfce064e', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '08608e92-a00b-4826-82a0-5be75cbc60a5', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0870fa13-b4fb-4fe0-87d3-416ca8853fff', '9a5e0eac-114e-4173-90af-32b55c870675', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0870fc05-ec8c-409d-b3ac-5df6e22f2ca9', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0892c488-920d-4628-9a2e-8d651253c98c', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '08d96479-2ce6-4a28-a1e2-2b8474320bd4', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '08e97658-746c-4fb3-8a8b-8117162cf968', '36040329-1aa6-428a-ad39-cd85de03493e', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '094faff0-c314-4f7e-ab81-0232d3f75a8c', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0991e38a-1423-479d-bb94-4d574c738a4a', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0a16d664-2e9f-4bc2-bbc5-db3d5e54cdc6', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0a9a2355-bf72-42de-b3fd-a8f42a9e5117', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0ab6ff5c-61e8-4e58-862b-04607c370bcc', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b3413fb-4077-42ea-8f5b-8b124f294b1f', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0bca35a2-072a-479f-bf3f-4805babed5ac', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0c47a0b3-e3d2-4df3-8b10-c854325eaead', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0c92847b-47b5-49a5-87cf-d51572bbda41', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0ccd8e5b-1244-4594-b825-5eab29b8b4b9', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Maurice Allard$$, $$Fagote Solo Barroco$$, $$https://www.youtube.com/watch?v=fagote_perf3$$, $$Uso expressivo do legato e ornamentos barrocos.$$, '2025-06-20 02:55:51.102555'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0cd1eac6-7121-4e9b-8658-b78c69f86dab', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0df82c22-f128-4d63-be9e-34833d1090e6', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e01cd4e-00eb-49e4-8bdf-f0ec33657fda', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e0ec764-429c-4171-8300-228f5a9f1a48', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e6395a0-3e58-46fc-90dc-94cb0d54013b', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$London Symphony Orchestra$$, $$Suite Clássica$$, $$https://www.youtube.com/watch?v=trombone_perf7$$, $$Execução em conjunto com linhas harmônicas.$$, '2025-06-20 15:06:58.188449'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e79bb91-6bee-4654-a87c-b78fbd7e8fee', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Tosin Abasi$$, $$Animals as Leaders - CAFO$$, $$https://youtube.com/watch?v=animals_cafo$$, $$Guitarra de 8 cordas com técnicas extended range, tapping complexo e composição matematicamente precisa do metal progressivo moderno.$$, '2025-06-09 04:28:04.425232'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0f7ff8a4-4d57-4d2a-af85-e54c4ec481a9', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '108c7427-c8e1-4a9d-86ba-7168a3f48142', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$James Galway$$, $$Solo em orquestra$$, $$https://www.youtube.com/watch?v=flauta_perf2$$, $$Expressividade e uso refinado de vibrato.$$, '2025-06-15 19:44:57.490283'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '11304ac2-7f15-462a-a981-f950c1a6b248', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '11550f0d-6230-4a63-b25f-c8b1c711a19e', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '11dfc991-a59b-455c-96a1-7d908ce1a633', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '122eaf75-b007-4f95-af8c-a8d79c1c9ae0', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$András Schiff$$, $$Peça Barroca$$, $$https://www.youtube.com/watch?v=teclado_perf4$$, $$Contraponto limpo e articulação precisa.$$, '2025-06-15 20:41:08.924393'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '13813011-14bb-48a9-99e0-22aeab179f6d', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '138fd079-4b20-4237-a01c-5afec2260575', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '13d9bcf2-7988-40a9-bbcc-ff54e0123b62', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Orquestra Jovem do Estado$$, $$Marcha Militar$$, $$https://www.youtube.com/watch?v=trombone_perf4$$, $$Execução rítmica e precisa nas linhas de marcha.$$, '2025-06-20 15:06:58.188449'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '152acc59-c85c-4bc4-99dd-8f782d8c9c39', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '15c46fe2-6dce-46b8-93a0-69b071d524ab', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '15f38b69-df04-4acf-ac1e-82cf2df6b022', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Paco de Lucía$$, $$Concierto de Aranjuez - Adagio$$, $$https://youtube.com/watch?v=aranjuez_paco$$, $$Fusão histórica entre flamenco e música clássica. Técnicas: rasgueados flamengos, falsetas, compás complexo.$$, '2025-06-08 01:08:28.465107'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1658a45a-8fa9-41d6-bdab-8a10fa484b47', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '16624b16-9cc0-41a2-ace1-da6d4b44e8ca', '9a5e0eac-114e-4173-90af-32b55c870675', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '16e0cd11-cb05-4f6b-977e-0044cd675a5f', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1710066b-8466-41f6-b303-3246a91f1735', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1710870d-1bbd-449b-ae75-1d0bbe772492', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '180a6e73-dd41-4784-a4e3-0845fc9e498f', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '180cd06e-e33b-4634-a0b8-20fd4add01ac', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '187f7e1a-382b-4345-8327-de5acf13305f', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '18c413c0-f3d4-4ead-b336-998bb727a838', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Rui Lopes$$, $$Peça Contemporânea Solo$$, $$https://www.youtube.com/watch?v=fagote_perf7$$, $$Mistura de técnicas modernas: slap tongue, harmônicos e glissando.$$, '2025-06-20 02:55:51.102555'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '193a2cc8-2697-4a2e-ac19-0a2b434165cf', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Daniel Barenboim$$, $$Moonlight Sonata (1º movimento)$$, $$https://www.youtube.com/watch?v=teclado_perf1$$, $$Uso refinado do pedal e dinâmica expressiva.$$, '2025-06-15 20:41:08.924393'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1a1d58f6-d8a4-4a08-acd0-4ecf49da4c50', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1af5e80d-4ca1-41f4-bd74-fb5ab23a53bf', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b042522-14d0-47f8-bcf0-87d519faa6e2', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b3574a8-329d-43de-abec-dad800d4324c', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b993736-2d8a-436c-87d5-728cdf9bd6b7', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1c6b5b75-5fe6-47b1-8afb-6baf02b7dba0', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Prof. Almeida$$, $$Concerto para Viola em Ré maior$$, $$https://youtube.com/watch?v=xxxx$$, $$Passagens rápidas no 3º movimento$$, '2025-09-22 12:06:41.590946'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1cb6e46e-53f6-4789-8109-548fe4b0091c', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1ccaef0f-a489-49e4-9be8-e50f534d7db5', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$B.B. King$$, $$The Thrill is Gone$$, $$https://youtube.com/watch?v=bbking_thrill$$, $$Performance definitiva do blues elétrico. Uso magistral de vibrato, bends expressivos e fraseo minimalista mas profundamente emocional.$$, '2025-06-09 04:28:04.425232'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1d0f0cdd-e495-44ef-a52b-2c9c686bbd27', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1d51a8e7-4bc0-4950-b9b0-282175c2496a', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Frédéric Chopin$$, $$Revolucionário - Étude Op. 10 No. 12$$, $$https://youtube.com/watch?v=revolutionnaire$$, $$Étude técnico com arpejos rápidos na mão esquerda. Técnicas: arpejos, oitavas, resistência, dramaticidade.$$, '2025-06-08 18:58:23.268751'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1e53b681-97c1-4af4-9962-e912726d5fc3', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1ec499a8-9f9b-4bdf-82f5-ca40ab5ece5b', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1ed01f8f-9d98-42e3-be34-ca0734f4d71d', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1edcfc81-9e61-432a-9fb8-7122a8a6cbfe', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '20268c0b-d750-4f54-9604-e96e578bdab1', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '207bc096-9a0c-415d-9b14-ddff5f6ce91d', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '20d6e2b4-a705-4888-9ebc-5599dc31ca74', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '20f6734b-e8a9-4a1b-b394-8fd82bd7a970', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Altamiro Carrilho$$, $$Flauta e samba$$, $$https://www.youtube.com/watch?v=flauta_perf5$$, $$Síncopes e fraseados típicos do samba.$$, '2025-06-15 19:44:57.490283'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '21850d11-9b25-46b2-b27a-e79dbc39af3a', '9a5e0eac-114e-4173-90af-32b55c870675', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '218ab34f-b068-4689-b87c-5f66a4b82dec', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Johann Sebastian Bach$$, $$Invenção No. 1 em Dó Maior$$, $$https://youtube.com/watch?v=bach_invencao1$$, $$Polifonia a duas vozes. Técnicas: independência das mãos, articulação clara, estrutura contrapontística.$$, '2025-06-08 18:58:23.268751'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '21aeef9b-b68d-472e-a4bf-33721495b80f', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '21ef1533-3c7e-463b-8995-d2a45570dcd5', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Dave Brubeck$$, $$Take Five$$, $$https://youtube.com/watch?v=take_five$$, $$Jazz em compasso 5/4. Técnicas: acordes de jazz, improvisação, swing, comping.$$, '2025-06-08 18:58:23.268751'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2266ead3-6e1f-4cff-93e7-bade135f7d32', '9a5e0eac-114e-4173-90af-32b55c870675', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '22ce683b-5247-4c87-8c08-bbec99115caa', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Ray Brown$$, $$Walking bass standard$$, $$https://www.youtube.com/watch?v=baixo_perf8$$, $$Execução típica de walking bass com fluidez harmônica.$$, '2025-06-16 04:47:46.049126'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '23668f63-8f2c-40e2-a676-a8f50788efce', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '246d2865-eefe-4c0a-b9f2-cfa209b389e4', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Orquestra de Paris$$, $$O Aprendiz de Feiticeiro$$, $$https://www.youtube.com/watch?v=fagote_perf4$$, $$Passagens típicas com caráter cômico.$$, '2025-06-20 02:55:51.102555'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '25d6d98d-ca90-4ca8-adb2-0461cd5727f3', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '26114749-e4d4-4196-aa70-071ced514777', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '262b35e3-5d06-4e94-8483-0db30a6724a5', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '26fb3a98-bbb3-4f31-99e1-f96c28ec265a', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Claude Delangle$$, $$Solo em orquestra$$, $$https://www.youtube.com/watch?v=sax_perf6$$, $$Expressividade e controle de dinâmica.$$, '2025-06-16 02:29:10.849734'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '271c6e3a-687f-4aee-a2b4-b58217473315', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '277db102-df5d-474e-9bdb-0b039dd411e2', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '27bf3eef-3c7e-4992-bf47-db6b84243c21', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '28daa033-d329-4400-b95a-3d8f38f3b0cc', '9a5e0eac-114e-4173-90af-32b55c870675', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2946f989-a3f1-461f-8748-6b62504d8b4e', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2956246b-9c4c-4478-9006-60a70a360efd', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '29dbfd3e-3769-4199-9dc4-92ffa5665cb4', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Eddie Van Halen$$, $$Eruption$$, $$https://youtube.com/watch?v=eruption_live$$, $$Performance revolucionária que introduziu o tapping na guitarra mainstream. Técnica inovadora que influenciou uma geração inteira de guitarristas.$$, '2025-06-09 04:28:04.425232'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2a2de85f-adb7-4a22-9f02-6d2f34743a34', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2ae66467-eb66-4cd8-8ada-27aadb369e59', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2b1b2b3a-c4a1-44c1-8913-ff534e28bf13', '509d6a26-159a-4976-aa46-83f914f930aa', $$Dizzy Gillespie$$, $$Improviso livre$$, $$https://www.youtube.com/watch?v=trompete_perf8$$, $$Uso de fraseado rápido e multifônicos.$$, '2025-06-16 04:00:10.000819'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2b8ada36-6aa6-44f8-a2a1-46ab25fb0d02', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2cc29207-7447-4ea8-829b-5259d3b426be', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2cc41da1-21a7-43bd-b939-b592db152b92', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d23c83f-3f6d-4872-a5a7-5c52e6669e46', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2dd6e0cf-1d2c-4c2a-9840-cba54d5ae572', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2e140d3d-4062-4fb8-ad50-153e6fe3fa7e', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2e1d8e10-05ef-4de7-9973-edfc74ea6780', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2e62947c-c59d-47ae-b601-db7dcb04bcc3', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Tania Lisboa$$, $$Violoncelo popular brasileiro$$, $$https://www.youtube.com/watch?v=vc_perf8$$, $$Técnicas mistas com ritmos brasileiros.$$, '2025-06-15 19:37:09.758845'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '300930b1-3a66-455b-9db4-f1e391c403e4', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '302a4924-82ce-4eb2-9655-8ef2fcb2c7a6', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '310ff212-efae-43f7-b42f-15dc9ed69dcc', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Ney Conceição$$, $$Contrabaixo no Samba$$, $$https://www.youtube.com/watch?v=contrabaixo_perf4$$, $$Pizzicato com ritmo sincopado e balanço.$$, '2025-06-16 05:36:46.170572'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3235098e-2019-4222-aa07-25efe86fd53a', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Flea$$, $$Aeroplane$$, $$https://www.youtube.com/watch?v=baixo_perf7$$, $$Combinação de slap, pop e fraseado veloz.$$, '2025-06-16 04:47:46.049126'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3241c170-8dde-4765-9928-5792d49269ed', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3367b7f9-f9df-48dd-83d6-bc93e1d68e1a', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '35437fff-54b3-4be9-88fa-263a0200564c', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Eddie Daniels$$, $$Solo de jazz improvisado$$, $$https://www.youtube.com/watch?v=clarinete_perf2$$, $$Improviso com uso de glissando, trinado e escalas cromáticas.$$, '2025-06-15 19:30:04.561852'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '35f10631-eba3-44b0-9b9f-01c47992b849', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$John Deacon$$, $$Another One Bites The Dust$$, $$https://www.youtube.com/watch?v=baixo_perf3$$, $$Groove repetitivo e pulsante, foco na precisão rítmica.$$, '2025-06-16 04:47:46.049126'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '36a6751a-2341-407a-8d5d-252e9f3c3826', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '38676d26-be0d-4eca-af1f-280d934eebe3', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3937b245-d05b-40a0-b858-27eb9ea86cbf', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '393d97c1-0946-4781-a4d3-4429f5fcf204', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a1a894a-62b9-41f1-87c3-750ab05af414', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Paulo Moura$$, $$Sax no Samba$$, $$https://www.youtube.com/watch?v=sax_perf2$$, $$Fraseado com balanço e síncopes.$$, '2025-06-16 02:29:10.849734'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3aac4c7b-8032-4d62-af9c-cdeb6b9d8450', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Marcel Ponseele$$, $$Solo barroco$$, $$https://www.youtube.com/watch?v=oboe_perf3$$, $$Execução de ornamentos barrocos com clareza.$$, '2025-06-20 13:36:22.078165'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3af39678-49c4-47ae-8473-556ae00edff0', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b0b213a-2b63-4965-9a38-bad178ece387', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b55c951-47cf-4548-a44d-fd5ff8e9bf54', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Wycliffe Gordon$$, $$Solo de Jazz$$, $$https://www.youtube.com/watch?v=trombone_perf3$$, $$Improviso com uso expressivo do glissando e staccato.$$, '2025-06-20 15:06:58.188449'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b86d5cf-274f-4415-9742-d4c18023ebfb', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3c0f627a-bfb4-4174-85d1-42c3d1777df4', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Martha Argerich$$, $$Concerto para Piano n.º 21$$, $$https://www.youtube.com/watch?v=teclado_perf8$$, $$Toque leve e fraseado clássico refinado.$$, '2025-06-15 20:41:08.924393'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3c454065-29f7-4ee8-9472-76be624bb6f6', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3c9d64d2-a11a-4e9c-8bf2-9b4e53cda433', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d7f6fa4-f037-480d-9878-f4ca7a9c64b5', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Sabine Meyer$$, $$Piano Quartet Op. 1 (clarinete)$$, $$https://www.youtube.com/watch?v=clarinete_perf4$$, $$Trabalho de câmara com dinâmica refinada.$$, '2025-06-15 19:30:04.561852'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3e055e33-f5b4-44db-a080-7467cddef316', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3e830404-315d-4822-bb74-572bed2ba8af', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '40029371-3a7f-49a0-add2-3d607e1a7278', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '406a3fd7-c5e8-46b6-81f1-535643ce661b', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4079131f-0c78-4e88-b2de-e8b31ba79491', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '40881e6d-21cd-4bbc-a632-a4ccf3bbe150', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4088684d-6ed8-4411-b799-531b66b54f46', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '40c412ef-0cd0-429b-911b-c8d3f3dedd31', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '40e4d4ab-29bb-40cf-963d-b62f8f747c5b', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '41af3a3a-9f0b-4770-bee7-4f1e2c1abe0c', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Jean-Pierre Rampal$$, $$Concerto duplo Flauta e Harpa$$, $$https://www.youtube.com/watch?v=flauta_perf6$$, $$Interação com harpa e articulação refinada.$$, '2025-06-15 19:44:57.490283'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '41fff0e2-39c0-46ce-81f6-e2d24460705b', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '42e64a09-5b48-443c-9975-23c17f19e0b3', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4341c4f8-7561-4752-8f99-830a2fde1759', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '43a15bbb-6385-47ea-ba1b-bca655d43e06', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '43af55d5-de79-4680-82cb-46023442afb7', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '46018922-4f72-4f1e-b41c-e855fdeccaab', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '46b54628-5180-4524-96f4-a9a8f15292b8', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Jeanne Baxtresser$$, $$Bach Suite para Flauta Solo$$, $$https://www.youtube.com/watch?v=flauta_perf4$$, $$Uso de trinado e controle de respiração.$$, '2025-06-15 19:44:57.490283'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4792ee67-8e74-4e73-b601-6dae342fd6e3', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '47aab7b8-f6ff-4945-8f8e-ff5909f1ee89', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '48a5e928-8f20-4e93-b131-f42141b3255e', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '48ba6120-72c4-4e92-9e1d-010798a37ed8', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '48fbb241-62e6-4d78-be8f-460b1ec527bd', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4922c3fd-3b04-49b4-a3b5-c01490669aeb', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '49c7a981-a9f2-45e1-87da-c8a8e3f8d378', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '49ec156c-1873-4b67-95be-90241f7e9591', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4b1753b4-3a66-4149-b978-0b3aa5a1735a', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4b3403ea-c2be-4cb0-999f-b6c54ef33a21', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Orquestra de Paris$$, $$O Aprendiz de Feiticeiro$$, $$https://www.youtube.com/watch?v=oboe_perf4$$, $$Melodias características e articulação clara.$$, '2025-06-20 13:36:22.078165'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ba9f231-cd38-4f84-80e0-bb0c72ca2d99', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Sharon Kam$$, $$Clarinet Concerto No. 1$$, $$https://www.youtube.com/watch?v=clarinete_perf5$$, $$Uso avançado de saltos de registro e passagens rápidas.$$, '2025-06-15 19:30:04.561852'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4bff0e06-5ab4-45aa-898b-c8e3eca02c97', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4c41e7d3-1192-4349-848a-bd66b55d9ec9', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4cdf47c6-617f-4c36-9878-e533ce32407f', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4d71b927-9611-460c-8099-b43d44feef15', '509d6a26-159a-4976-aa46-83f914f930aa', $$Louis Armstrong$$, $$West End Blues$$, $$https://www.youtube.com/watch?v=trompete_perf1$$, $$Uso de fraseado complexo e vibrato expressivo.$$, '2025-06-16 04:00:10.000819'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4db2f78c-eb28-48e3-881c-9744ec930b9f', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ebd4dc2-9097-47e0-8099-8714c0b16821', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ef0c871-ad71-4558-bd71-03f00975f7a8', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '50b935f7-a656-43a6-a0b6-954feabb14c8', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '50e2bc8f-8dfa-43f1-9aaa-9061096b1155', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '520c3da0-bf9e-4065-8d09-0b088b79e1f4', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '527d49ef-6e3c-4755-8ac4-5d1654adfd3c', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Orquestra Filarmônica de Viena$$, $$Sinfonia Fantástica$$, $$https://www.youtube.com/watch?v=trombone_perf2$$, $$Trombone reforçando as linhas graves e efeitos dramáticos.$$, '2025-06-20 15:06:58.188449'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '528c6c06-724a-4550-8e7f-64a0356b394f', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '52dd6514-9b4e-4cbf-9070-d9c23ed10e53', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Proveta$$, $$Sax no choro$$, $$https://www.youtube.com/watch?v=sax_perf7$$, $$Síncopes e fraseado típico do choro.$$, '2025-06-16 02:29:10.849734'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '531f9ea6-8618-4a3a-af11-4a64e11853ae', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Filarmônica de Berlim$$, $$Orquestra Sinfônica nº 5$$, $$https://www.youtube.com/watch?v=contrabaixo_perf1$$, $$Uso do arco em passagens graves e potentes.$$, '2025-06-16 05:36:46.170572'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '536762dc-6506-42e1-b98e-38e73a2d2bfa', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '542a6c60-d620-4ca2-930d-04ce86bf74fc', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '54ebf6cd-cc31-49e8-9284-7e8c2f27acf0', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '55f0b551-5cf8-4504-a70d-170bdb97b8f4', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Eliane Elias$$, $$Teclado no samba$$, $$https://www.youtube.com/watch?v=teclado_perf7$$, $$Fraseado com balanço típico do samba.$$, '2025-06-15 20:41:08.924393'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '57481321-9cb3-43ea-b77e-48277749f26e', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '583c4688-6995-4d2d-8d3d-d75c0ccb2dd3', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Benny Goodman$$, $$Rhapsody in Blue (trecho inicial)$$, $$https://www.youtube.com/watch?v=clarinete_perf3$$, $$Glissando icônico na abertura da peça.$$, '2025-06-15 19:30:04.561852'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '584527c4-7250-4e3b-a71c-c97973ee5d78', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a73eede-0d90-45f1-8520-cdbe0d1ccbf8', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5abf7acf-4b2f-4edb-af24-d7f0844469e9', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5b0cb2f3-8c19-4019-9ee8-177ba4112e5e', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$João Gilberto$$, $$Aquarela do Brasil$$, $$https://youtube.com/watch?v=aquarela_joao$$, $$Interpretação que definiu o violão na Bossa Nova. Técnicas: batida sincopada, acordes com dissonâncias, voz e violão.$$, '2025-06-08 01:08:28.465107'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c3dff86-6e9d-4e6a-a135-3ba0616f86b1', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2025-06-09 03:42:55.40634'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c8d1e72-fab7-4205-89d4-4ff9f80c4a0e', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5cb8ec5e-55af-4cf5-bf8f-e89162624437', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5cd8571b-5065-462e-a260-ff0e735b1dc9', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$François Leleux$$, $$Improviso contemporâneo$$, $$https://www.youtube.com/watch?v=oboe_perf5$$, $$Uso de harmônicos e técnicas modernas no improviso.$$, '2025-06-20 13:36:22.078165'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5d84d582-e7ec-43b3-b7af-251ea11ea414', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5dfe9e7f-a4d2-4bc2-ad55-8796d60cb289', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Bernard Edwards$$, $$Good Times$$, $$https://www.youtube.com/watch?v=baixo_perf6$$, $$Groove clássico de disco music, foco no ritmo e repetição.$$, '2025-06-16 04:47:46.049126'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5e0eca08-45cb-4c37-af3f-d3cd945d5564', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5e6a0c75-9060-4248-a663-746bb3ce4b97', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ecb0d0a-0d3c-49b9-8bd5-ea4287703626', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ed2a89d-5d57-46c8-8c4b-60f3f5246693', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5f32ad74-f8d1-43da-9b36-79660c44d2ea', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5f44cac2-a33f-4aba-9b17-27ee5728a285', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Artie Shaw$$, $$Clarinet Polka$$, $$https://www.youtube.com/watch?v=clarinete_perf6$$, $$Articulação clara e fraseado rápido.$$, '2025-06-15 19:30:04.561852'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5f5e4b20-020a-4d0d-ae5b-3a82dda08e4b', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5f9ec9d6-ff2c-4d96-9c39-9659439cf611', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5fb7c1d2-f045-42e1-acec-780425589ec2', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '605f87d1-d879-49de-9c7e-f56d334fc229', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Emmanuel Pahud$$, $$Concerto para Flauta em Ré maior$$, $$https://www.youtube.com/watch?v=flauta_perf1$$, $$Domínio de articulação e registro agudo.$$, '2025-06-15 19:44:57.490283'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '60744ab9-09fa-483b-8d70-a4504efb5b08', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Franz Liszt$$, $$La Campanella$$, $$https://youtube.com/watch?v=campanella$$, $$Transcrição virtuosística de Paganini. Técnicas: saltos, oitavas, velocidade, precisão técnica extrema.$$, '2025-06-08 18:58:23.268751'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '60844c4f-07fa-4f8b-aa67-b2427a053733', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '60dad27a-4c01-4c29-8752-e7d4a9f9a217', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61ae4135-854f-439a-aa55-1aa61894c437', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61afcf40-6816-43b9-814e-457214dda61d', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61fa4aee-59a4-4965-a0d9-cea8447164f0', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '622624d3-492f-4c74-9f5f-63569115ae2b', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Marcel Mule$$, $$Concerto Clássico para Saxofone$$, $$https://www.youtube.com/watch?v=sax_perf3$$, $$Execução precisa com articulação refinada.$$, '2025-06-16 02:29:10.849734'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '62895c75-8fe1-4b01-8eaf-98cc97041966', '9a5e0eac-114e-4173-90af-32b55c870675', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '62a65b56-d338-4c44-ae3d-d9a887d02b36', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '643136bb-77a6-44fa-9394-ab77191a80f0', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '649588d8-ce93-4819-ae1d-ab680d62c402', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '658939be-bb69-432e-afc8-47dd7b54df9d', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Stan Getz & João Gilberto$$, $$Garota de Ipanema$$, $$https://youtube.com/watch?v=garota_ipanema$$, $$Gravação histórica que levou a Bossa Nova ao mundo. Violão com acordes sofisticados e ritmo sutil.$$, '2025-06-08 01:08:28.465107'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '668dd036-8d27-42d4-b90f-66328add3140', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '68291e66-d00a-4a9f-aeb2-20120678817f', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Renaud Garcia-Fons$$, $$Peça Contemporânea$$, $$https://www.youtube.com/watch?v=contrabaixo_perf8$$, $$Mistura de arco, pizzicato e percussão na caixa acústica.$$, '2025-06-16 05:36:46.170572'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '68861ea2-0ccd-4a13-861a-a399b99f5866', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Jacqueline du Pré$$, $$Concerto para Violoncelo em Mi menor, Op. 85$$, $$https://www.youtube.com/watch?v=vc_perf1$$, $$Grande controle de arco e expressão intensa.$$, '2025-06-15 19:37:09.758845'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6909eb69-2e47-4882-8965-c3d66bd37bff', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Pablo Casals$$, $$Double Concerto para Violino e Violoncelo$$, $$https://www.youtube.com/watch?v=vc_perf4$$, $$Passagens rápidas e saltos de registro.$$, '2025-06-15 19:37:09.758845'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '69a575f6-1567-49f8-8ab9-5d27f452dbbc', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '69af89b9-4e8b-4eb6-bc1c-20fd75d4fcb0', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6a4374ee-fdd6-421c-89d8-05ba7dad3ed9', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6a47ace6-bac3-49d8-a865-77ef4d8e7a61', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6b6bfc07-ea0a-4e04-9f02-3cf026b7a700', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Andrés Segovia$$, $$Asturias (Leyenda)$$, $$https://youtube.com/watch?v=asturias_segovia$$, $$Peça originalmente para piano, transcrita magistralmente por Segovia. Técnicas: tremolo, escalas rápidas, acordes complexos.$$, '2025-06-08 01:08:28.465107'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6bddd8fc-101b-42f3-9f79-5761a7d8e5f6', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6c76b6a4-fbdd-4e4c-9ddb-64431d5183cc', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6d38f55f-6267-4b0e-b065-a2d3ffd90c18', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6d3ad1ec-33a2-4b54-ae1e-86f346650400', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Paul Chambers$$, $$So What$$, $$https://www.youtube.com/watch?v=contrabaixo_perf2$$, $$Linha de walking bass com improvisação harmônica.$$, '2025-06-16 05:36:46.170572'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6dafe6c0-977a-4209-8014-126bc31d21e2', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6df35772-af06-458b-a843-5e90d5968715', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6e172674-784e-4726-919a-8e0ab6497ddb', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6ea88fc4-4e72-4fa5-98de-80ee98abbdbb', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Yann Tiersen$$, $$Comptine d'un autre été$$, $$https://youtube.com/watch?v=comptine$$, $$Estilo minimalista moderno. Técnicas: arpejos repetitivos, melodia expressiva, dinâmicas sutis.$$, '2025-06-08 18:58:23.268751'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6edb506f-180c-469c-9235-abaeac48fe3f', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6f25040c-7fcb-4253-8060-3070ad8c2564', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6fb0ba5b-cc3d-439a-88ee-b8d131d7bb24', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Don Felder e Joe Walsh$$, $$Hotel California - Solo$$, $$https://youtube.com/watch?v=hotel_california_live$$, $$Dual guitar solo icônico com harmonias complexas e interação entre dois guitarristas, demonstrando trabalho em equipe musical.$$, '2025-06-09 04:28:04.425232'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6ff4de22-0c25-4356-89d3-96c05c0f88c4', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$London Symphony Orchestra$$, $$Marcha sinfônica$$, $$https://www.youtube.com/watch?v=oboe_perf6$$, $$Oboé na base e apoio de conjunto.$$, '2025-06-20 13:36:22.078165'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7026d514-41a4-458a-9369-c4cdb6037fbf', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7049d44b-5c94-43df-bf81-5189a718efe3', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '70783eee-4e61-4f62-b05b-be4ab406d78e', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '70926547-1143-4aa6-b47d-0d2bec793213', '509d6a26-159a-4976-aa46-83f914f930aa', $$Arturo Sandoval$$, $$Improviso no Jazz Contemporâneo$$, $$https://www.youtube.com/watch?v=trompete_perf5$$, $$Improvisação com uso de registro agudo e dinâmica variada.$$, '2025-06-16 04:00:10.000819'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '70d28111-a9ff-4870-a962-eba390399a49', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71724a78-12ac-4531-a2a2-02af61c6002e', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71a90590-e704-4f01-81b3-1225793b3b28', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '72357c96-df4d-431f-bc41-7196c4059ce2', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7275eca8-d7ba-4552-8d92-ffcfc95c5899', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '72ec27ef-6da4-42b2-b74b-383c9ff311a9', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '731606f1-4b9f-4af3-b427-714f162214bc', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '737f3bae-9400-45a4-b640-e08a2a91a952', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7425b4d3-2f49-4555-9ba9-7aad42644f90', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '753c9ca0-0584-4456-9d8b-f2d17e3a5109', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75531277-55b6-46e0-98db-12191c4be519', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75f0d80f-1822-42ef-a818-dad8b0d5e54f', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Tigran Hamasyan$$, $$Solo de teclado contemporâneo$$, $$https://www.youtube.com/watch?v=teclado_perf6$$, $$Mistura de ritmo complexo e harmonia moderna.$$, '2025-06-15 20:41:08.924393'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7639bf03-296f-4ccd-85ec-c25b11ce747c', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '763a1065-c574-4003-9432-d2ee30a3bd2b', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '76584d8e-0d82-4791-9241-e11feee1ec0b', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Jaco Pastorius$$, $$Portrait of Tracy$$, $$https://www.youtube.com/watch?v=baixo_perf1$$, $$Uso intensivo de harmônicos naturais e dinâmica sutil.$$, '2025-06-16 04:47:46.049126'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '765eaad0-5620-4a31-9dd5-f4bf90b1d76b', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '76844c00-d87a-47d7-b366-6940733b115c', '36040329-1aa6-428a-ad39-cd85de03493e', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '778cc10c-1b46-4882-881b-2def99d31fff', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '77cc3b79-6186-4b23-af30-4ed08a3cb5f7', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '77d2bf8e-ee05-4db0-ab85-0137bf1be360', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$John Williams$$, $$La Catedral$$, $$https://youtube.com/watch?v=catedral_williams$$, $$Obra monumental de Barrios. Três movimentos com técnicas virtuosísticas: harmônicos, tremolo, escalas cromáticas.$$, '2025-06-08 01:08:28.465107'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '77db158f-0aa2-4d32-9d9a-4f8654828fdd', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '783c9b1a-522a-48f1-a27e-f7d999509607', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '783ee1e9-d228-45f7-ace5-3891cb98494b', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '784310a5-5444-48b4-ae15-f4ac3d111054', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '78982b53-a01d-4cb5-a1f4-5e7c3169f230', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Sax Quartet USA$$, $$Sax em banda marcial$$, $$https://www.youtube.com/watch?v=sax_perf4$$, $$Execução em conjunto com articulação forte.$$, '2025-06-16 02:29:10.849734'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '78a03ad4-80b3-461b-af78-b7e99efb879d', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7968741d-13f7-40d3-a2d3-cf4ffbd5f4cf', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '798b8251-efec-4884-a173-bcdc4d8aa4ac', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7997838a-dc15-4610-9323-c34454577850', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '79a7c307-291f-4178-89be-07fa41012ead', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '79a8efba-d6ae-43b4-a5f1-17303e5aa0bc', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2025-06-09 03:42:55.40634'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '79be89a3-fc9a-4488-9a4e-610c0535dcbc', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7a16fc15-314d-4519-8863-06ccb20a365a', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7a2004fa-2d84-487f-af67-5140a16a116f', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7a2a435b-202a-478e-b3cf-4486d02d4447', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7b201566-3599-4fa7-aaf4-ac77421fdba5', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7b56e83d-cba6-48c6-9cb8-c92b26209c90', '509d6a26-159a-4976-aa46-83f914f930aa', $$Maurice André$$, $$Concerto para Trompete em Mi Bemol$$, $$https://www.youtube.com/watch?v=trompete_perf2$$, $$Execução precisa de passagens rápidas e controle de dinâmica.$$, '2025-06-16 04:00:10.000819'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7b95d30e-2c32-4e69-95b7-137890436ea1', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7f33192d-688d-4cc4-9d60-24cc27247051', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7fa06797-51c0-41df-b97f-9ca28901fcf9', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7fd114d1-a0fd-49c9-af29-aa8947e05d2f', '9a5e0eac-114e-4173-90af-32b55c870675', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '808a317a-c8b0-402a-8062-c414f63eba48', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8124c3e7-89bb-490d-b96b-4002619f0895', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Jaques Morelenbaum$$, $$Samba para Violoncelo$$, $$https://www.youtube.com/watch?v=vc_perf3$$, $$Improviso com pizzicato e ritmo sincopado.$$, '2025-06-15 19:37:09.758845'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8132dfd5-ba76-4cac-8680-276f484fe035', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '81618059-a4dd-4c5a-804a-90b5cce27fbd', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '81ef5e48-9825-46cd-bfbd-b3f4ba3d89bd', '36040329-1aa6-428a-ad39-cd85de03493e', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '82fabec9-c5fb-4fb9-b53e-b496a8bfe1ab', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Christian Lindberg$$, $$Concerto para Trombone em Mi bemol$$, $$https://www.youtube.com/watch?v=trombone_perf1$$, $$Uso expressivo do legato e passagens rápidas.$$, '2025-06-20 15:06:58.188449'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8353f40a-636d-429b-a7a1-fc938c48b841', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '841c2c22-e09d-40e0-9688-5390ccddb542', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8428a0a6-8f4e-474c-a5da-45e26b0cc827', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8590378d-b4e6-4e77-b82b-39edce9ee33c', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '85fc18e0-b159-4f52-b46c-15e3910a2ee8', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '864083c3-153d-4388-bf6a-b8fe10406488', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8697c1d6-1958-441e-b056-ce4a667a9784', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Joshua Redman$$, $$Improviso solo contemporâneo$$, $$https://www.youtube.com/watch?v=sax_perf8$$, $$Exploração de multifônicos e glissandi.$$, '2025-06-16 02:29:10.849734'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86b5b3ec-fa60-4ea6-ad49-32cb56169bfc', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86cbe11a-4383-40a5-a062-79fd26f24448', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '88b2714a-985f-443c-bc94-70a54742cd56', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '88ce9875-5961-4d5c-a520-3e389316b046', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '88ebe6ed-b142-488c-958c-b27814f1bb44', '9a5e0eac-114e-4173-90af-32b55c870675', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '895c3b42-fccb-4593-806c-5d99035e3841', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8973dfe6-569d-4a1f-8a6e-d6c307948df2', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8974a99b-2b8c-4b57-b81d-35ec7a1462d0', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Quarteto Jovem$$, $$Sinfonia Concertante$$, $$https://youtube.com/watch?v=zzzz$$, $$Equilíbrio entre viola e violino solistas$$, '2025-09-22 12:06:41.590946'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8999d48a-403e-4cc9-aa8f-9b1b3a0dd15f', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2025-06-09 03:42:55.40634'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '89cb7387-34dd-42a6-8807-b8fb3d1c1a11', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2025-06-09 03:42:55.40634'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '89d929a3-f76d-4a78-b3ff-675dec4cccd3', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2025-06-09 03:42:55.40634'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8a0ffe65-8fc8-4b5a-95cd-0fcb9f2080d1', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8a2be883-e604-474d-bd62-a0968e07c6be', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8aa2f53b-0517-4bae-ac0a-31b44eecddb2', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8b1fb3a5-3798-44b0-9ef7-26bfda45a6ea', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8b7a9a86-87a7-4e93-98e0-ab14d0c27552', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$James Morrison$$, $$Solo em Big Band$$, $$https://www.youtube.com/watch?v=trombone_perf8$$, $$Improviso em contexto de big band com uso criativo do glissando.$$, '2025-06-20 15:06:58.188449'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8c0d59aa-f544-4286-aaa6-6072f3bb826c', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8e3991d4-4a57-40f5-9e85-5080382134b5', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8e5861fd-4c99-4382-8256-7407deb3db2c', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Paul McCartney$$, $$Come Together$$, $$https://www.youtube.com/watch?v=baixo_perf2$$, $$Linha de baixo marcante com groove constante.$$, '2025-06-16 04:47:46.049126'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8ee0a259-40a1-4fae-9a52-b9bec7c9bd06', '509d6a26-159a-4976-aa46-83f914f930aa', $$Alison Balsom$$, $$Solo em orquestra sinfônica$$, $$https://www.youtube.com/watch?v=trompete_perf7$$, $$Controle de dinâmica e afinação em frases longas.$$, '2025-06-16 04:00:10.000819'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8f962557-465e-44d5-a95e-ca648c1517ad', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8fe27184-8402-496f-8e1d-b1f65ef20b82', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '902f21cb-9684-49b7-8576-59817e0eb427', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '90443cc7-1195-4731-a58c-358688aa2d14', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Orquestra Barroca de Paris$$, $$Peça Solo Barroca$$, $$https://www.youtube.com/watch?v=trombone_perf6$$, $$Execução de fraseados típicos do barroco.$$, '2025-06-20 15:06:58.188449'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '90f04b8c-f753-4500-8bde-7f153abd9c9c', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Carlos Malta$$, $$Flauta no choro brasileiro$$, $$https://www.youtube.com/watch?v=flauta_perf7$$, $$Fraseado e ritmo característico do choro.$$, '2025-06-15 19:44:57.490283'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '911b07eb-7a4b-4fb1-b6c7-9a578a0255ed', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91493697-ef5b-48a2-9c19-9fc5f4ec10d2', '36040329-1aa6-428a-ad39-cd85de03493e', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9268dce6-86dd-46ed-a75e-1deed404737d', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$George Gershwin$$, $$Rhapsody in Blue$$, $$https://youtube.com/watch?v=rhapsody_blue$$, $$Fusão de jazz e música clássica. Técnicas: glissandos, ritmos sincopados, blue notes, técnica orquestral.$$, '2025-06-08 18:58:23.268751'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '92e82491-9c30-4cbc-b6f2-41d9a3248480', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '937ac5c2-633b-4576-9317-98786966532c', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '938d9911-c82b-436f-a921-78a91a9da511', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$London Symphony Orchestra$$, $$Marcha Sinfônica$$, $$https://www.youtube.com/watch?v=contrabaixo_perf6$$, $$Execução de base rítmica com arco em conjunto.$$, '2025-06-16 05:36:46.170572'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '93966180-d826-4dbf-a712-70ad0ba7a781', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '94019ae0-487e-4d83-9851-cb6627fa59b0', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9489900a-370b-464f-8c1e-ba0f77fff367', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '94ce6509-3456-426a-8779-72be0dd70289', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '96820db3-f81f-47f3-8ffa-fa46dd220799', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '96e1a5c5-71e3-4e8b-aeb8-d0a816761d25', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '96eb3892-c35b-4a9d-90f7-2a4682756ab5', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '972258b3-d9c0-40e1-ae38-0e6274d6f9d7', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Orquestra Filarmônica de Viena$$, $$Sinfonia nº 5$$, $$https://www.youtube.com/watch?v=fagote_perf2$$, $$Linhas graves com suporte ao conjunto.$$, '2025-06-20 02:55:51.102555'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9867ce1e-24f1-46e0-9239-b20ad66c17d0', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9890ded7-ac88-4ff4-9072-996b9871cbda', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '98e380f7-2a3f-4c92-864e-ebb92506cfec', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Orquestra Jovem de São Paulo$$, $$Suite Clássica$$, $$https://www.youtube.com/watch?v=fagote_perf8$$, $$Execução em conjunto com fraseados típicos do período clássico.$$, '2025-06-20 02:55:51.102555'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '990e8400-e29b-41d4-a716-446655550001', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Gene Krupa$$, $$Sing Sing Sing$$, NULL, $$Solo icônico que definiu o papel da bateria no swing$$, '2025-06-09 02:55:37.370251'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '990e8400-e29b-41d4-a716-446655550002', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Phil Collins$$, $$In the Air Tonight$$, NULL, $$Fill mais famoso da história do rock$$, '2025-06-09 02:55:37.370251'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '990e8400-e29b-41d4-a716-446655550003', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Neil Peart$$, $$YYZ$$, NULL, $$Showcase de técnica e complexidade rítmica$$, '2025-06-09 02:55:37.370251'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '990e8400-e29b-41d4-a716-446655550004', '86f83611-c0db-470c-87e7-31ee81b1a009', $$John Bonham$$, $$Moby Dick$$, NULL, $$Solo épico de 15 minutos ao vivo$$, '2025-06-09 02:55:37.370251'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '990e8400-e29b-41d4-a716-446655550005', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Joe Morello$$, $$Take Five$$, NULL, $$Masterclass em compasso 5/4$$, '2025-06-09 02:55:37.370251'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '990e8400-e29b-41d4-a716-446655550006', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Jeff Porcaro$$, $$Rosanna$$, NULL, $$Groove shuffle perfeito$$, '2025-06-09 02:55:37.370251'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '990e8400-e29b-41d4-a716-446655550007', '86f83611-c0db-470c-87e7-31ee81b1a009', $$John Bonham$$, $$The Ocean$$, NULL, $$Compasso 7/8 revolucionário$$, '2025-06-09 02:55:37.370251'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '990e8400-e29b-41d4-a716-446655550008', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Neil Peart$$, $$Tom Sawyer$$, NULL, $$Precisão técnica em prog rock$$, '2025-06-09 02:55:37.370251'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9962cda0-f110-4de3-bae5-a449ffa5e01c', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '99c3820f-ade9-44a7-8443-68341dd5ea21', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '99e9acf7-331d-42e3-a6f1-324d419783e3', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '99fed006-e2e5-42cb-953d-4191969e996d', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Christian McBride$$, $$Solo em Jazz Moderno$$, $$https://www.youtube.com/watch?v=contrabaixo_perf5$$, $$Uso expressivo de harmônicos e fraseado rápido.$$, '2025-06-16 05:36:46.170572'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9b0ee5b0-68ce-4c1d-9179-0003c93c95e0', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9bf41c14-8c6b-4488-9df7-bf7c48e261cc', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9c878c82-9b5a-49a3-8a70-1e534bea8f20', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Ludwig van Beethoven$$, $$Für Elise$$, $$https://youtube.com/watch?v=fur_elise$$, $$Peça popular para iniciantes. Técnicas: melodia cantabile, acompanhamento Alberti, dinâmicas contrastantes.$$, '2025-06-08 18:58:23.268751'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9c91f4b0-cd6c-47da-8893-81f1953bd141', '36040329-1aa6-428a-ad39-cd85de03493e', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9cf706a1-6303-426f-8e58-2fb49e5b4504', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9d2e2c67-19d9-40ef-a6ac-062685df2a14', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9daea08f-b406-4e4b-95bd-245008969586', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9e38aeea-5511-4761-8b22-395a02c186ee', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Claude Debussy$$, $$Clair de Lune$$, $$https://youtube.com/watch?v=clair_de_lune$$, $$Peça impressionista com uso sutil de pedal e dinâmicas delicadas. Técnicas: legato, rubato, controle dinâmico.$$, '2025-06-08 18:58:23.268751'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9f93e19c-4a91-4307-a3d2-9a43473a6b7e', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a01fd7da-2bc9-4dd0-9c58-878156ff76b5', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a114f648-1bae-4b65-9265-6bc3cce3ca70', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a19be1be-0fdf-4193-9f38-8671a628a88d', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a1efd4b4-8f17-420c-9c71-2e18051d354c', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a2ebed71-44a0-4304-8224-cebdbcca6899', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a2f0d75d-4d37-46bd-898e-66422491e393', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a3350dee-13e8-4c35-b8af-a2a84784beee', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a352f931-963d-4c59-94c3-66253407dc3b', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a41bfb8e-99be-4126-8933-ceb76447d691', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a52a9890-2a91-4a82-971b-3c3f35cee41f', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a547467e-af30-42d3-bf41-9643ce8b0905', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a5b5b619-dbcf-43f1-baba-338e792acb3e', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Charles Mingus$$, $$Improviso livre$$, $$https://www.youtube.com/watch?v=contrabaixo_perf7$$, $$Improviso com pizzicato e técnicas avançadas de glissando.$$, '2025-06-16 05:36:46.170572'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a6d5782d-b26a-43e6-b58a-c3e4b557b820', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Candy Dulfer$$, $$Sax moderno$$, $$https://www.youtube.com/watch?v=sax_perf5$$, $$Uso de técnicas estendidas e groove moderno.$$, '2025-06-16 02:29:10.849734'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a6f9357a-cf3e-4998-9067-c4c3e24977e2', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a7ae4e89-8a7b-4047-a35d-715e97e3b0ca', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa03e030-6a19-4d31-a167-81f3d5844ba3', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa0cba24-e83e-4821-8d5f-5ff4ec50ed70', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa29d56c-65b2-49ce-be07-e01dcd32945a', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Hubert Laws$$, $$Improviso em jazz$$, $$https://www.youtube.com/watch?v=flauta_perf3$$, $$Combinação de glissando e fraseado rápido.$$, '2025-06-15 19:44:57.490283'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa30ce46-77e1-4c4f-baf6-79687f1b1f80', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aae9efc4-9a43-4cfa-9502-95b3a5402a1b', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab34950c-ca05-4d93-aa30-30b065050add', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'abb975d7-7b7c-4067-8b95-96e2f29bd567', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'abe20934-6dc2-45a0-9e30-9a0c63ba9a65', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac055534-8fcd-47c6-bf89-6a1466ba99c9', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac21a2fa-a1b9-418b-85cc-94bd17420747', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac5cf147-6ff5-4d5b-8db9-991ed7cf5496', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac616563-1948-42b1-9a6b-9cd49afc09f5', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac779bfd-cca2-4d09-b07e-aff138423c96', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac7ba510-8c7f-4064-8ce3-91df5a8eb6cb', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac8a63cb-eeaa-486d-9200-8a26e8ee4a5e', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac9da69a-83b3-462f-8f22-6daa485dcc75', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'acc86a36-736e-4213-a625-0b6921358abc', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'adaffb47-d345-48d4-9057-320fc4b793ba', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ae7059a5-1a23-4944-a054-6bf601803ee2', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'af2e367a-6cfe-43e6-a059-90baedfa7421', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$John Coltrane$$, $$Improviso em Jazz$$, $$https://www.youtube.com/watch?v=sax_perf1$$, $$Fraseado rápido e uso intenso de vibrato.$$, '2025-06-16 02:29:10.849734'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b083740b-494c-486e-a47f-63663e160d00', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Sergio Azzolini$$, $$Concerto para Fagote em Si bemol maior$$, $$https://www.youtube.com/watch?v=fagote_perf1$$, $$Uso completo do registro e articulação rápida.$$, '2025-06-20 02:55:51.102555'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b0d488bd-4b8f-4104-b417-ccbc20bb9d9e', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b0eb8e23-3f80-43eb-8e91-f8945faa7a08', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b18276dd-1a07-4ac1-b1a7-6b34e9a92c2e', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b1a6beb6-825e-4482-8acf-54871589c183', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Orquestra Filarmônica$$, $$Harold in Italy$$, $$https://youtube.com/watch?v=yyyy$$, $$Uso de registros graves e agudos extremos$$, '2025-09-22 12:06:41.590946'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b2cb47a4-a1b5-401a-bf4a-8f35b42631d5', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b3a5a159-c93f-4f07-a330-4e2eda4069e0', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b4c0619e-fd3f-45d2-bb26-25e1824b2278', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b5232939-ac73-45e3-a42c-f8f1b181fea9', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b579d108-bfdb-4854-ab8c-e57cb35cd875', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b645f805-6761-48b7-a7f8-f862911f1549', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Orquestra Filarmônica de Berlim$$, $$Sinfonia nº 9$$, $$https://www.youtube.com/watch?v=oboe_perf2$$, $$Linhas melódicas típicas do oboé no contexto sinfônico.$$, '2025-06-20 13:36:22.078165'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b6716bbf-6d87-42be-9946-849c496157a0', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b6ea6a33-2796-4604-9134-378e6035f7ce', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b728a8a4-24d0-43ae-8c08-c78ee5d25bb1', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b7d0a38b-746a-42f8-9f68-3d25c02fe5dd', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b7d5dc34-198c-455c-8242-90d4663a4dce', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b7f48d30-abc1-40cd-838b-6312bdbea750', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b7f90e7f-a239-4ebd-ad97-65ac488981b2', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b877c936-12cc-4b28-83e7-e7dded17a5ab', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8ac21d1-b924-45cb-b229-9b07a3854ed8', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Maria Souza$$, $$Recital Solo Viola$$, $$https://youtube.com/watch?v=aaaa$$, $$Exploração de técnicas estendidas$$, '2025-09-22 12:06:41.590946'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8b59e60-74ec-41a2-9b89-1176d6bcb53b', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8d118be-8ee7-4866-ad49-c30f34f50443', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b92e4c10-2f96-4058-97fc-5e213ee371eb', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b948f428-dfdf-40a2-b1ae-942628c7ff81', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Mischa Maisky$$, $$Clair de Lune (arranjo)$$, $$https://www.youtube.com/watch?v=vc_perf5$$, $$Uso expressivo de vibrato e legato.$$, '2025-06-15 19:37:09.758845'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b97e86a3-0632-42e3-9ed2-a856d8337ee4', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b98adb9c-9890-465b-8132-f6ebb0a66d66', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'baee99a0-a929-450f-8a50-f8980fb3059a', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'baf17c98-09e1-473a-a0ee-b0579b8c5127', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bb5b93c4-ec7d-4bc7-b7df-0a587eee8367', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Edgar Meyer$$, $$Solo Barroco$$, $$https://www.youtube.com/watch?v=contrabaixo_perf3$$, $$Execução solo com arco em peça barroca.$$, '2025-06-16 05:36:46.170572'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bbe77ce9-b7b1-40a7-bfb2-851b5f06efac', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc3b9629-ea90-4afe-9e9b-7abefc55aac6', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bd63f039-fe69-41f5-b509-4c50535e277c', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bdf269a8-97f2-4627-9da7-6ff5a9d69c69', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Paul McCartney$$, $$Blackbird$$, $$https://youtube.com/watch?v=blackbird_acoustic$$, $$Peça fingerstyle que combina melodia e baixo simultaneamente, inspirada na música clássica e demonstrando versatilidade da guitarra.$$, '2025-06-09 04:28:04.425232'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'be849c5a-534d-417d-ae41-2a768fd0d8e3', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bebe5374-5dd0-4add-987a-2e1e06df009a', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bec41cad-db1b-447f-a5ae-90af866fdd7f', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bf42d9ec-7895-4c14-bd29-ba967f3d0ccb', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bfdec516-f4ea-435e-9cf9-f2986e7a9db1', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Baden Powell$$, $$Choro da Saudade$$, $$https://youtube.com/watch?v=choro_saudade$$, $$Choro brasileiro com elementos do jazz. Técnicas: dedilhado sincopado, acordes com baixo alternado.$$, '2025-06-08 01:08:28.465107'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c005323b-5f61-4379-afde-01397cfc4426', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Erik Friedlander$$, $$Cello Suite in Jazz$$, $$https://www.youtube.com/watch?v=vc_perf6$$, $$Combinação de arco e pizzicato com improviso.$$, '2025-06-15 19:37:09.758845'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c0079c07-38b2-44c2-8e17-d722c1d95800', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Sophie Dartigalongue$$, $$Improviso Contemporâneo$$, $$https://www.youtube.com/watch?v=fagote_perf5$$, $$Improviso com uso de harmônicos e efeitos modernos.$$, '2025-06-20 02:55:51.102555'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c11ec0e0-a409-4830-ab83-f99a4cbb2e08', '509d6a26-159a-4976-aa46-83f914f930aa', $$Wynton Marsalis$$, $$Concerto Barroco$$, $$https://www.youtube.com/watch?v=trompete_perf4$$, $$Fraseado barroco com articulação clara.$$, '2025-06-16 04:00:10.000819'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c14f6163-29d8-4816-a303-6820c9ddd5e8', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c1af6ae9-4b9d-4e25-983d-2d03bb6aa71f', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c215fc5f-3b11-48b9-98cf-2eca9fcd173f', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c2239968-ea44-4318-966c-d6ab95d73384', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c2469dd5-6589-4b5b-9e62-9b5beb998769', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Francisco Tárrega$$, $$Recuerdos de la Alhambra$$, $$https://youtube.com/watch?v=recuerdos_alhambra$$, $$Obra-prima do tremolo. Uma das peças mais difíceis do repertório clássico, exigindo tremolo perfeito por minutos seguidos.$$, '2025-06-08 01:08:28.465107'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c271a97c-96db-4cfe-ada1-267e49fd02d2', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c427a248-840c-42d8-ae04-d2562cceb0ab', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c43b4ca4-1b7c-422f-812f-a70eb4780c82', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c534de3a-beaf-415f-b3c6-602efac7d4f3', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c58454af-12b5-46bf-a820-2a6ca76da316', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c678a821-cba5-477f-9ede-0d0b2208eff6', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c685f307-ac39-4995-89cf-306b33321a07', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c8146b2c-495e-42e2-a979-d46b79316abc', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c838304a-75ad-4885-980a-ba09aff81a47', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Herman Li$$, $$Through the Fire and Flames$$, $$https://youtube.com/watch?v=dragonforce_fire$$, $$Demonstração extrema de velocidade e precisão técnica. Alternate picking em alta velocidade, sweep picking e uso extensivo de effects.$$, '2025-06-09 04:28:04.425232'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c94f6b20-8191-4af4-a315-14ff4775b87c', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c96fa254-6245-4160-ac25-33cba3f9ccea', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c980608f-2bd4-48b5-accb-502d91b8650d', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca1bd916-638e-418b-813d-a492ea041dab', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Orquestra Jovem do Estado$$, $$Suite clássica$$, $$https://www.youtube.com/watch?v=oboe_perf8$$, $$Execução de fraseados típicos do período clássico.$$, '2025-06-20 13:36:22.078165'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca4f5389-2a7e-4994-adb5-7156dffb1c70', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Yo-Yo Ma$$, $$Suites para Violoncelo Solo n°1$$, $$https://www.youtube.com/watch?v=vc_perf2$$, $$Uso de legato e harmônicos, interpretação solo refinada.$$, '2025-06-15 19:37:09.758845'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca956537-e4a7-4f9e-87e4-3f31f70d0c70', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cb0f7297-bdd3-45bb-92ae-c540528ff02f', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cc04f4c4-676c-45bc-8b46-8bc6c08ebf31', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cc07365d-930f-4029-b2fc-9f771dc54f74', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cc0f7836-bdd5-4634-b44a-9c8c101d36d6', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cc10cd12-0127-4ead-b1ad-7011c51d6ec3', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ce514b1b-ad0e-464e-8550-19f270d21357', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ceaf5423-6e7a-4201-8925-6da9c4b629a9', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cec48382-7bf5-444a-88e9-768257448259', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Chick Corea$$, $$Improviso em Jazz$$, $$https://www.youtube.com/watch?v=teclado_perf2$$, $$Improviso livre com harmonias complexas.$$, '2025-06-15 20:41:08.924393'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cf41561c-9ca3-43e0-83bc-819bd69428f5', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cf6f8309-642a-438c-ab07-56808bf6f0ba', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cfc57c70-ed5b-49d5-b8ec-595afb42e82f', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2025-06-09 03:42:55.40634'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cfd9535e-c579-4f94-9900-4c7b7f62e72d', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd026bf1e-6826-458c-908b-2e65c39943f9', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd100714f-9ed9-45f1-bfe7-64015dd03318', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1b5c412-3d08-46c3-a047-7bc42ef2843e', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Carlos Santana$$, $$Europa$$, $$https://youtube.com/watch?v=santana_europa$$, $$Fusão de jazz, rock e música latina. Sustain prolongado, uso expressivo de effects e melodias que transcendem barreiras culturais.$$, '2025-06-09 04:28:04.425232'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd337fcfe-4487-428d-8f42-717c11214273', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd43112d3-d7e2-4c28-bcf0-58cd81a77c41', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd450452c-b25d-40ea-bb4e-e2b315753a93', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd480e14f-1a10-4f94-91a1-52bec7543aa0', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd48a092c-5edd-448f-8bed-bd9dc2a8d496', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd4c425d1-27b1-4a03-a8b5-7e00d026a451', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd58f59cd-350a-4eab-91ca-1f819cc361e1', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd5cc3ded-8d95-4779-a08c-bc49f8fcb00a', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd6125332-255e-4aed-bf0c-e9abad9e38a2', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd70747ee-4cfa-40ac-a324-f9b30fac2eda', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2025-06-09 03:42:55.40634'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd73e41cc-68f9-49a7-ae1a-13b4a67a7095', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd78ffb74-bbbf-4743-8ee7-c4439b35dd2f', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd7c26fa2-575a-450f-986f-6a6476fd5ac1', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Albrecht Mayer$$, $$Concerto para Oboé em Dó maior$$, $$https://www.youtube.com/watch?v=oboe_perf1$$, $$Passagens rápidas e uso expressivo do legato.$$, '2025-06-20 13:36:22.078165'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd80c67e9-86be-4962-87cf-239a718bf50d', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd9405548-86d5-4dc0-8f44-209ce3fb8024', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd970f7ad-3f8e-4666-9894-81cae8d174ca', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd9e16ca1-48f5-4284-9528-4293eaee7a0c', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'da3342be-b379-4020-a9cb-d6903180cef2', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'da86fa61-4c91-4fa8-92fd-51fe34baaecc', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db12cdbb-cddd-498e-a72b-1eb1d33ac371', '509d6a26-159a-4976-aa46-83f914f930aa', $$Banda Sinfônica Brasileira$$, $$Trompete em banda marcial$$, $$https://www.youtube.com/watch?v=trompete_perf6$$, $$Execução potente e articulação forte em conjunto.$$, '2025-06-16 04:00:10.000819'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db299bef-e52d-4fbb-a3e3-94e4d245be1c', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Flea$$, $$Higher Ground$$, $$https://www.youtube.com/watch?v=baixo_perf5$$, $$Uso agressivo do slap e pop com grande dinâmica.$$, '2025-06-16 04:47:46.049126'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db6460f7-7821-40a9-8c17-876737020fab', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db76ee5f-d497-422d-96f0-a5fab36e9d7c', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db8a9607-ae24-415d-8e77-1e9d0e9194bf', '36040329-1aa6-428a-ad39-cd85de03493e', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dbb5decf-7359-4e67-8031-c6cc2fefb878', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc419627-2fc9-43ab-b028-b80a3565f42f', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc975a8f-5d0c-4776-a47e-1f4249ec67c2', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dd13cb11-b138-4205-aece-15ed4c7d7bb6', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dd954fda-136f-41e0-82c1-982af83d3193', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Jordan Rudess$$, $$Teclado no Rock$$, $$https://www.youtube.com/watch?v=teclado_perf3$$, $$Riffs rápidos e uso expressivo do pitch bend.$$, '2025-06-15 20:41:08.924393'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ddf71f8f-77a2-44c8-9013-9adda218dc3c', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'df83196f-cabb-456a-9c58-89942e705416', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$London Symphony Orchestra$$, $$Marcha Sinfônica$$, $$https://www.youtube.com/watch?v=fagote_perf6$$, $$Base rítmica e linhas graves com o conjunto.$$, '2025-06-20 02:55:51.102555'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dfaca387-83a0-4444-adfa-d20845f34fb6', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Eagles$$, $$Hotel California$$, $$https://youtube.com/watch?v=hotel_california$$, $$Solo de violão mais famoso do rock. Técnicas: bends, slides, dual guitar harmony, fingerpicking e palheta.$$, '2025-06-08 01:08:28.465107'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e0454fda-bb07-4559-b011-37533133e05b', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e08bddbf-075d-4359-bfec-9151f087d4fa', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e0f44863-92e0-459c-8c08-a735b241c8c3', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1161d22-6396-40c4-b5ea-354017c0abbf', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1a037fa-15d3-4f09-a824-9945274ff14f', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1d83837-3e52-42bd-ab9b-93465f577124', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2500fc0-457b-4043-ac72-7feccf336e18', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Alexei Ogrintchouk$$, $$Peça contemporânea solo$$, $$https://www.youtube.com/watch?v=oboe_perf7$$, $$Mistura de técnicas: slap tongue, harmônicos e glissando.$$, '2025-06-20 13:36:22.078165'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e25ba625-ab7c-4355-aa4d-7f6c5462bc92', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2630360-3a9e-490d-b05a-fb4f38bd3915', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e29be7e4-d889-4c45-8858-102f9d58a253', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e3a1da34-7997-4db4-8ef3-a1eb4ce88cc1', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e424e226-c972-4717-859a-1649dc262f20', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4467b5b-1aaa-4289-8f5a-1e28788c7d07', '509d6a26-159a-4976-aa46-83f914f930aa', $$Wilsinho$$, $$Trompete no Samba$$, $$https://www.youtube.com/watch?v=trompete_perf3$$, $$Fraseado com balanço e síncopes típicas do samba.$$, '2025-06-16 04:00:10.000819'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4900c6c-cfc9-4d4c-99e2-5c2bd5bab33a', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4cf1b71-61ed-48a1-af9c-8702dac43ee4', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Martin Fröst$$, $$Concerto em Lá maior, K. 622$$, $$https://www.youtube.com/watch?v=exemplo5$$, $$Exploração completa do registro e dinâmica do clarinete.$$, '2025-06-15 18:40:59.643685'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4ef5162-308b-46c3-8aa3-e52b999851f7', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e735f961-ac69-4d99-9f52-bc82af982b11', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e8840321-b4d5-4dae-b3b7-7ce476b530c2', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e89aaefd-5a56-4711-ad00-26a63c69f442', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9a25b24-d8d3-4733-9a99-d0fe5009b7d1', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9b33ca9-ba6a-4c58-9702-bf757f5fa5ee', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Jaco Pastorius$$, $$Teen Town$$, $$https://www.youtube.com/watch?v=baixo_perf4$$, $$Execução rápida com técnica de digitacão avançada.$$, '2025-06-16 04:47:46.049126'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ea569088-580b-4750-b98f-70f046b94d02', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eaaa626b-c41f-4b98-b9e7-bb9a0dde4d0a', '36040329-1aa6-428a-ad39-cd85de03493e', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eac8d5ae-5089-4908-ba29-f6577b300398', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eae4eb22-0e29-471f-8076-3401d11c8082', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2025-06-09 03:42:55.40634'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eaf3c3bc-33d6-43d9-870a-c63e401a9456', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Stuff Smith$$, $$Stuff Smith - I se a Muggin$$, $$https://youtube.com/watch?v=stuff_smith_muggin$$, $$Performance revolucionária que estabeleceu o violino como instrumento legítimo no jazz, com técnicas de swing e improvisação inovadoras.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ebf81437-968c-4316-af91-fb92e6ef1f97', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec2cc03d-ffe9-453a-97b8-57c96db2ee10', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Steven Isserlis$$, $$Violoncelo solo em orquestra$$, $$https://www.youtube.com/watch?v=vc_perf7$$, $$Expressividade e domínio técnico em solos orquestrais.$$, '2025-06-15 19:37:09.758845'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ed5cc717-57b3-4a27-99ec-6dc991510b9e', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'edba7f1d-a2e2-4790-82ce-a78876277e34', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef068c57-6f97-488d-bd4b-41eed7d53bb7', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef152f97-d941-4c6c-a8f0-1429b3f4cef2', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef59e80b-27b8-4936-92f5-c1df06f18fd7', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f01e3322-5a47-4115-b82a-ac06cc6a524f', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Jimmy Page$$, $$Stairway to Heaven - Solo$$, $$https://youtube.com/watch?v=stairway_madison$$, $$Solo épico que combina melodia, técnica e emoção. Progressão do clean para distortion, uso magistral de bends e fraseo expressivo.$$, '2025-06-09 04:28:04.425232'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f03b8341-83c8-48b6-a91e-ff2620461a56', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$David Shifrin$$, $$Trio para clarinete, violino e piano$$, $$https://www.youtube.com/watch?v=clarinete_perf8$$, $$Interpretação com foco em timbre e contrastes rítmicos.$$, '2025-06-15 19:30:04.561852'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f03ef272-4296-489e-8bf5-dbf5d5a7d4c8', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0a7467a-562a-4021-b860-5bd38580e857', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0fc34e9-c740-454f-b0c5-2c03fdb79259', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Máire Ní Chathasaigh$$, $$Celtic Woman - She Moved Through the Fair$$, $$https://youtube.com/watch?v=celtic_woman_fair$$, $$Performance emocionante de balada tradicional irlandesa, mostrando o violino como narrador de histórias na tradição celta.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f1982c1c-474c-4627-8983-bcda82ac43a2', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2a437d4-6d97-48da-971b-23a6dae8b7aa', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2cff001-66b1-4703-97dc-b7f912e60cd3', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f3584dcf-a3b0-4063-ab34-b48dae3587cf', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f36c310f-26be-452d-8171-e9c62a2d13d5', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Marshall Gilkes$$, $$Improviso Contemporâneo$$, $$https://www.youtube.com/watch?v=trombone_perf5$$, $$Uso de harmônicos e efeitos modernos no improviso.$$, '2025-06-20 15:06:58.188449'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f52f93c9-4d01-483e-8761-ed82604dc4a7', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Alicia Keys$$, $$Teclado em banda pop$$, $$https://www.youtube.com/watch?v=teclado_perf5$$, $$Acompanhamento com acordes ricos e groove.$$, '2025-06-15 20:41:08.924393'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f565ae34-015f-46f3-859b-6922b74c8f0c', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f5998eda-9f11-4478-b2cf-c8162cbd3c1d', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f5d451db-e0c6-4400-95c9-a14ebdea7e89', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f88a56f5-de7a-4135-aa20-a60f09994671', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f88d0759-ffec-4c3b-a814-e6ca6f13d07a', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Itzhak Perlman$$, $$Concerto para Violino de Tchaikovsky$$, $$https://youtube.com/watch?v=perlman_tchaikovsky$$, $$Performance legendária do concerto mais popular do repertório violinístico, demonstrando técnica impecável e interpretação emocional profunda.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f8ea4bbd-3686-46ad-8b32-90f653b0be81', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Hilary Hahn$$, $$Hilary Hahn - Bach Partita No. 2$$, $$https://youtube.com/watch?v=hahn_bach_partita$$, $$Interpretação moderna de obra barroca clássica, demonstrando como técnicas históricas podem ser revigoradas por artistas contemporâneos.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa07b81c-eab9-4907-b48b-4e4e4be75724', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fc3d8457-c6bb-414d-a80f-e3f84648e79e', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Mark O Connor$$, $$Orange Blossom Special$$, $$https://youtube.com/watch?v=oconnor_orange$$, $$Versão definitiva do clássico fiddle americano, demonstrando a versatilidade do violino na música popular e técnicas específicas do bluegrass.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fc68c63e-b41c-46c3-9cce-0c605ae7771a', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fce0b1a2-50fc-4348-90b4-2a5607a20c26', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fddd1d84-ca4e-401d-ac31-5cdd8c2bf122', '36040329-1aa6-428a-ad39-cd85de03493e', $$Lindsey Stirling$$, $$Lindsey Stirling - Crystallize$$, $$https://youtube.com/watch?v=stirling_crystallize$$, $$Fusão inovadora de violino clássico com música eletrônica e dubstep, criando novo subgênero e inspirando uma geração de violinistas.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe402b6e-4954-4860-a244-94cc3676321d', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe86e775-ca91-4d84-91a1-cc86fd6c6d6c', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Anne-Sophie Mutter$$, $$As Quatro Estações - Primavera$$, $$https://youtube.com/watch?v=mutter_vivaldi$$, $$Interpretação virtuosística da obra mais famosa de Vivaldi, destacando a narrativa musical que retrata sons da natureza através do violino.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff169b21-133d-41ba-ac08-c613c8e5cb58', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Martin Fröst$$, $$Concerto em Lá maior, K. 622$$, $$https://www.youtube.com/watch?v=clarinete_perf1$$, $$Execução completa com variação de registro e dinâmica.$$, '2025-06-15 19:30:04.561852'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_performances (tenant_id, id, instrument_id, artist, title, video_url, description, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff89ce8c-0a80-4d65-ad43-976c874330b0', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Jean-Luc Ponty$$, $$Jean-Luc Ponty - Enigmatic Ocean$$, $$https://youtube.com/watch?v=ponty_enigmatic$$, $$Performance pioneira de jazz fusion com violino elétrico, expandindo as possibilidades sonoras do instrumento através da eletrônica.$$, '2026-02-13 17:48:24.878397'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;