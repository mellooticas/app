-- =============================================
-- Migration: 043_lesson_materials_2026.sql
-- Table: core.lesson_materials
-- Year 2 Curriculum Materials
-- Generated: 2026-03-01T13:48:29.189Z
-- =============================================

BEGIN;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '48a0c955-776a-4ef9-b1be-84ca7c5f118a', '8235b262-bd54-4697-b3bb-7008349b46ac', $$PDF: Plano Anual 2026 – Visão geral dos blocos temáticos$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ce9b2244-cc5b-4684-9f62-538d46515617', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Vídeo: Retrospectiva 2025 – Melhores momentos do ano anterior$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7482bff8-bc3b-46aa-8495-3b7cab7df6fd', '8235b262-bd54-4697-b3bb-7008349b46ac', $$PDF: Ficha de metas pessoais e coletivas$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9bfb49b8-6502-42a8-aed5-39dd48fb9188', '8235b262-bd54-4697-b3bb-7008349b46ac', $$Link: Acesso ao app Nipo School atualizado$$, 'link', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4e4e410e-6de2-423e-90dd-ef87508ab46e', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$PDF: Apostila de Revisão – Figuras rítmicas e notas musicais$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e57d5578-2673-423b-a427-d3d42debc59b', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$PDF: Ficha de diagnóstico individual do professor$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '33d6a28b-75be-4aea-be49-91a4db38e2eb', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Instrumentos variados para as estações rotativas$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '388f8f3b-f0a1-41c7-bb7c-6033e987619d', '0cb421a7-5ec5-48b9-9125-42ff540bcf8c', $$Áudio: Playbacks para exercícios de leitura$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '77994cee-508c-41d6-a23e-52bb4d4aedd9', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$PDF: Apostila Rítmica Avançada – Semicolcheias e síncopas$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0a1be4d4-30ea-4249-a7df-467c6592d297', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$PDF: Peça rítmica a 3 vozes – Partitura$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8310f286-be26-480a-9813-3a1d05074935', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Áudio: Base rítmica para prática de síncope$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '417dce13-77d6-4355-b2fa-e14e7558a927', '0997c381-730d-4c2d-8e6e-cc033df02f89', $$Vídeo: Demonstração de figuras rítmicas compostas$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'eff50b20-2213-445e-82bd-2ce1a68ae3ba', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$PDF: Guia de Intervalos Musicais – Tabela de referência$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8c28a9e5-ec9a-4583-970a-4a7515f265ae', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$PDF: Melodias para prática de intervalos$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '528a6f01-22e2-4b67-b069-0fd7016b2386', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Áudio: Intervalos de referência para treinamento auditivo$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '40153a75-af16-4f9c-87f1-3b509c7baec0', 'ed021923-2d3b-4c1e-93f3-a3c4750cd801', $$Link: App de treinamento auditivo (sugestão externa)$$, 'link', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'af46ce18-f9d6-4f43-9ab6-6a29524e8acb', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$PDF: Tabela de sinais de dinâmica musical$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1c5f08a9-735b-4bd1-b978-4c71bdc08852', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Partitura: Peça expressiva com marcações de dinâmica$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '26d4cd4b-f5ad-4c0b-99ce-1399bcbc1da8', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Vídeo: Demonstração de dinâmica em orquestra$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'fbbe4d81-4cd7-433b-8699-e30aef7496d9', '84d0f9b9-fe4e-4af3-a0f9-85e406e7c83c', $$Cartões coloridos para o Semáforo Musical$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1332219a-2d9f-402e-8142-87c89304ee72', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Partitura: Peça rítmica para conjunto$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3b7e943c-3cff-47f5-9bd0-f84678c2f6a8', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Partitura: Peça melódica para conjunto$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '39ddda5e-efa0-4ed4-9bd9-622386c8c15a', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$Áudio: Playback para acompanhamento das peças$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ae6bb183-2bb1-4d20-86ea-c6ac87448d7b', '4e2645f1-265c-4289-a08a-adee01d59ffc', $$PDF: Ficha de auto-avaliação do Bloco 1$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '38cb0ef9-22ee-4b53-9a97-d3592faa2084', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$PDF: Exercícios técnicos por instrumento – Nível 2$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '63787b4a-4fad-4831-a230-051bf0a7d840', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$PDF: Tabela de articulações (legato, staccato, tenuto, accent)$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5ff6cb3c-0f0b-4bf8-a294-4baa8e12ca2a', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Áudio: Metrônomo com velocidades progressivas$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f10ac275-6f21-4726-9016-36e9c7e7b44d', 'c9fcd418-20f3-46b3-bd0a-c5fad048b15c', $$Vídeo: Demonstração de articulações em diferentes instrumentos$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c8990283-cbfb-4431-8178-da9ddd754356', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$PDF: Guia de ornamentos musicais por instrumento$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0b14a25d-1052-4e68-b84c-6564a069fafd', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Partitura: Peça com ornamentos escritos$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2069d57d-5c85-4dfc-ab12-24c77531df6f', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Vídeo: Demonstração de vibrato e ornamentos$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b03d219a-5648-461c-874e-9b42d8c3d8c2', '2da2e4ee-27bf-4874-b9a6-e408747787ea', $$Áudio: Exemplos de técnicas estendidas$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e6173803-11e9-4b92-a0b5-7c3a66ba0baf', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$PDF: Mapa das Escalas e Modos – Guia visual$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b4da3b76-5fa8-4fbd-858b-ede2c2116b03', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$PDF: Exercícios de escalas em todos os modos$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2e935fd-25e0-4a4b-9b94-c6c2c2a2b0b4', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Áudio: Playbacks modais para improvisação$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '013994bb-e063-4059-b667-bc1e6e96238c', '09bfb0ed-c06c-4557-be39-38739e0c853c', $$Link: Referências de modos em músicas populares$$, 'link', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '34a6f5bc-8537-4519-9dc2-18f732b1f87f', 'f15a2aef-5997-415d-8636-e21752bea94d', $$PDF: Tabela de acordes maiores, menores e com 7ª$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'aae5237a-7216-4b8c-92a3-033dc866cd98', 'f15a2aef-5997-415d-8636-e21752bea94d', $$PDF: Progressões harmônicas mais usadas na música popular$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2ae90003-f4c7-4069-b829-dbe521a897d6', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Cifra: Canção popular para prática de acompanhamento$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '49e15cbc-85a7-4f51-a60e-69394bfb5bdd', 'f15a2aef-5997-415d-8636-e21752bea94d', $$Áudio: Bases harmônicas para prática em grupo$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b145ef54-af21-4536-9a89-d44bc636d482', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$PDF: Partitura com cifras integradas – Peça do dia$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'bf25ee50-4db2-4dd2-82bd-98a9905aade0', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$PDF: Guia de leitura de cifras para iniciantes/intermediários$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '171a3a13-8d11-40fb-a581-38db29948ae0', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Partitura: Peça completa para leitura em grupo$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9a6e95e9-bca0-4247-9ee1-767d1bb3d2f1', '8b6911bc-67b8-4e9f-9ffe-f645d692b61c', $$Áudio: Gravação de referência da peça do dia$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab0c1671-e0b6-47b8-a546-83a35bcd4ced', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$PDF: Ficha de avaliação do mini-recital (para plateia)$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'aed6b48d-432a-467b-90f1-25ea123100a4', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$PDF: Resumo dos conteúdos – Blocos 1 e 2$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '75bb6a32-452b-44fa-9022-d84df5247d1c', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Certificados/premiações simbólicas$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4881b846-12e5-4703-a3bf-820ccefe7899', '23b9eace-a54d-4346-9712-5d623d12d2cd', $$Partituras das peças escolhidas pelos grupos$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7ffe832c-174d-48c7-96c4-1cbdaf90dc27', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$PDF: Estruturas de canção – Guia visual com exemplos$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '103c8552-3d09-46a1-9d10-697cee1a84af', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$PDF: Ficha de composição – Template em branco$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8684d0b8-c5d2-4b6a-8d7d-bed67cd78bcf', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Áudio: Exemplos de diferentes estruturas de canção$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff2c29c9-38f0-4b2f-87dd-84815b99e8ce', '9c7b0b65-1f16-4a73-af35-5884bce4b249', $$Folhas grandes e canetas para mapeamento visual$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac242af4-8a55-4a1e-a480-aa9a70bb38d2', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$PDF: Guia de escrita de letras – Rima, métrica e prosódia$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '34c1d493-7031-44a4-ac3c-7cb33b541b74', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$PDF: Banco de temas para inspiração de letras$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8ecd03de-a24c-4222-82dd-95816175743e', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Áudio: Bases instrumentais para encaixe de letra$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '25d20eed-304b-44cb-9d0d-009d77a6fa33', 'b98084f6-0e03-47e0-af38-f5737da81ba5', $$Cadernos/folhas para rascunho de letras$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '240de932-348d-4f35-a7f1-14c08a14bddb', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$PDF: Introdução ao arranjo musical – Conceitos e técnicas$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '417b2322-184f-40b2-a946-1fbcf6d815b5', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Partitura: Melodias simples para arranjar$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b1943452-c849-4c71-b4e7-d1f8d1f819e7', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$Áudio: Exemplos de arranjos progressivos (solo → dueto → grupo)$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8dc65c0b-51f8-4fe8-b13f-d253743cd8ca', '0124b63d-3ffa-484e-9275-f387aa9ea439', $$PDF: Ficha de arranjo – Template para vozes$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2a6192d-f683-4e5a-b277-75eabf4a27ff', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$PDF: Guia de escrita para naipes – Sopros, cordas e percussão$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c6a04438-b34a-49f9-b1cd-e9b290a34ef4', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Partitura: Arranjo-base com partes separadas por naipe$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f8a8f0d4-ca5f-48f4-bd21-475eedbd3f6a', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$Áudio: Referência do arranjo completo$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f6045e21-eb48-417e-b69b-4db183592695', '692058d6-9fd2-4c80-be07-076e5ead8d13', $$PDF: Ficha de equilíbrio e dinâmica entre naipes$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd99a5972-0c97-4233-a839-592271d44ab4', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$PDF: Tutorial BandLab/GarageBand – Passo a passo$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c858dd3e-ff92-4048-a153-cc6d523b3dae', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Link: Acesso ao BandLab (gratuito e online)$$, 'link', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '81cd43e8-9d2d-44af-84db-fc33fa79eeee', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Áudio: Banco de loops e samples para uso livre$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0c26c620-efc7-45bf-9542-b13ef6796e80', 'd4d0f169-07ae-43ee-8fbc-528777468d45', $$Vídeo: Tutorial de edição de áudio básica$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1ad54c1-40fe-4dd7-b133-77914601d56b', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$PDF: Guia de gravação caseira – Dicas práticas$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '09618348-121b-4893-a930-c3fc3cb0a4a6', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$PDF: Introdução à mixagem – Volume, pan e EQ$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'eb2d7f58-af0b-4df4-b5a9-33c4b4d56e23', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Vídeo: Posicionamento de microfone por instrumento$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '60e06395-6c3a-439d-8a1a-dc244e2e6761', '6abd7b70-fa9d-4f8a-89d5-eb0c88399abb', $$Microfone e interface de áudio (demonstração)$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1243e88a-277c-4155-a766-6b1309f523b6', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$PDF: Ritmos Africanos e Afro-Brasileiros – Guia rítmico$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5110dc84-6d9c-480b-afcf-0b0955fbedb2', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Vídeo: Documentário curto sobre música africana no Brasil$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6e4b002f-06e0-4786-b316-2a46dca1e476', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Áudio: Exemplos de maracatu, ijexá, samba de roda$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5595b445-6b41-4a1f-bd9a-17660511783c', 'fe4e11da-56fd-4b2d-99b9-c7743a1fdd6b', $$Instrumentos de percussão afro-brasileiros$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '952a8942-89d6-43bd-8531-9b97cfb41866', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$PDF: Mapa musical da América Latina – Gêneros e ritmos$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '11d843cf-ebfd-4ae1-bbc6-025b9fa56cad', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Partitura: Peça latino-americana para conjunto$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e367cad6-e2df-41db-9f7c-6ebe893e1fa0', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Áudio: Exemplos de salsa, cumbia, bossa nova, tango$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'def21215-3992-4096-ab61-3e17bc82a2e4', 'de0cc31a-120f-43ce-b6d1-8f49a1f9a1e6', $$Vídeo: Performance de conjunto latino para referência$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6798ee8b-c5cb-4b61-923b-556396445ed0', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$PDF: Escalas pentatônicas japonesas – In, Yo, Miyako-bushi$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c2c87579-10ba-44b0-9db1-9ad4885aaa1f', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Partitura: Peça tradicional japonesa adaptada$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca86b1b7-6c6a-4ff7-aac7-e2fac0c24da8', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Vídeo: Instrumentos tradicionais japoneses (koto, shamisen, taiko)$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '58455c3c-9640-45f9-8121-92144e02f23b', '3e1cd994-7abd-4412-97ea-2266228fb5ed', $$Áudio: J-Pop e J-Rock – Seleção para adaptação$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0c63db32-6173-465b-946f-4023550e6175', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$PDF: Guia de Blues e Jazz – História e fundamentos$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c589cf41-42e7-4da2-98f5-da7ba3de1bed', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Partitura: 12-Bar Blues em Dó – Partes para conjunto$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '775c950c-ae08-456d-8d2b-f9d9d2fad8c1', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Áudio: Playback de 12-bar blues para improvisação$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '34e3a7ed-3aee-473b-ac12-f960262e4158', '3c4b9615-6c99-41d7-a81f-f5a4d6f09ec6', $$Vídeo: Documentário curto sobre história do blues/jazz$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'cdbbab22-ff00-49ba-a9d5-b1b049bb9258', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$PDF: Grooves essenciais – Rock, Pop e Música Urbana$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2fe1065c-404b-4ab7-8db2-5f504db039af', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Áudio: Exemplos de grooves por gênero$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ed1517a5-5f31-4b75-a391-34abb6148470', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Link: Plataforma de beats para referência (YouTube/Spotify)$$, 'link', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '8cda0434-316b-46f2-9514-918fd1b1809e', 'fc68fe24-0536-4ab1-83c0-37572dd93216', $$Cifra/partitura: Opções de músicas atuais para arranjo$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '35ce1586-4860-41c2-aa62-294e1634c866', '960d9918-af86-44c3-9be9-15bfcba122c8', $$PDF: Ficha de avaliação do mini-recital II$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6b425369-3f4f-40bf-8f98-6da641ec2b7e', '960d9918-af86-44c3-9be9-15bfcba122c8', $$PDF: Resumo dos Blocos 3 e 4$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '38e1bb79-fbd4-4a5e-8139-cf08d1b40ee0', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Certificados de participação do 1º semestre$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '823002f2-9929-4302-8470-778b34b85bad', '960d9918-af86-44c3-9be9-15bfcba122c8', $$Partituras das peças dos grupos$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd8a8f5cd-a26a-4e84-9e42-5efe394171b9', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$PDF: Manual de performance ao vivo – 10 dicas essenciais$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c731cbe6-91b4-4fbb-bda2-fd1fa9a3a39d', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Vídeo: Análise de performances icônicas (pontos fortes e erros)$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3298b199-ff22-43da-a374-e51bb2179032', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$PDF: Exercícios de controle de ansiedade para músicos$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c5bcf403-5e17-40b4-a6ab-18ba463e9cb4', '7e9cb1e6-3c6a-48a8-af76-096cbe909534', $$Microfone e sistema de som para simulação$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '6077a945-330c-48b6-8f07-e28f85454d20', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$PDF: Guia de sonorização ao vivo – Do zero ao palco$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef94f453-908b-4da9-8c71-20a03baf9f23', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$PDF: Diagrama de conexões – Mesa de som, microfones e caixas$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '98de3a28-3155-493c-a21e-808802e43251', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Vídeo: Tutorial de passagem de som$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '03e9ef66-5042-4215-a7af-1884044a019f', 'fe340392-c21d-4403-8a53-dd0fa34a74f8', $$Equipamento de som para demonstração$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e873f789-73e9-4447-9716-81be6b103585', 'd96ab776-8882-4026-a977-68e334f6a73a', $$PDF: Guia de improvisação avançada – Escalas sobre progressões$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e18d3eb8-75ca-490e-a78a-429499afdfad', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Áudio: Playbacks de jam session em diferentes tonalidades$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c1ce53b9-bb6a-431e-8712-ab344b005538', 'd96ab776-8882-4026-a977-68e334f6a73a', $$PDF: Mapa de escalas para cada acorde$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a355c803-43ba-4933-b4c8-bab2bb8de781', 'd96ab776-8882-4026-a977-68e334f6a73a', $$Vídeo: Jam session de referência$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca051ec3-f435-4a04-96c8-db897e8aa020', 'd98bb535-a591-4262-97be-a8e909038c93', $$PDF: Repertório para formações de câmara – Arranjos para duo/trio/quarteto$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '258b7a31-d2f3-4dae-97e1-e977910ae7f3', 'd98bb535-a591-4262-97be-a8e909038c93', $$Partitura: Peças para duos e trios$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd648f27d-ba60-44f6-8ba0-6d688653ea23', 'd98bb535-a591-4262-97be-a8e909038c93', $$Áudio: Exemplos de música de câmara$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '2f115000-1b6a-4225-902b-d726a9b1696f', 'd98bb535-a591-4262-97be-a8e909038c93', $$Vídeo: Quarteto de cordas em performance$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9ef5a523-94ce-4e9e-a560-00b18831d18b', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$PDF: Ficha de Projeto Musical – Template completo$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '91ba9961-fb2b-45e4-95e4-7666746a4636', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$PDF: Lista de repertório sugerido por nível$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1d7d3840-a963-4f50-aea7-ff96b3c3626c', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$PDF: Cronograma modelo para preparação de show$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f9b73df4-99f7-4b77-991c-21629410f95c', '9a8b5967-ae1a-4b56-b33f-58ee09e2f3f5', $$Folhas grandes para brainstorm visual$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd0aed0e5-9081-495b-a221-b0506668bdd1', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Partituras/cifras do repertório de cada grupo$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '0fdf02f5-2eb2-4ba3-8b40-c77ecdc8ac8b', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$PDF: Checklist de ensaio – O que verificar em cada sessão$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1b1a39c5-abc6-48c4-9208-aaccde614ecc', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Áudio: Gravações de referência das músicas escolhidas$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '11b93326-74c1-4997-9484-675463a0d2eb', '28386323-8efa-42cc-a5b2-8eed2c45fc20', $$Metrônomo e afinador$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b5d132c1-bf74-42b5-9cf6-99c01bc6c8a8', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$PDF: Guia de produção de videoclipe com celular$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '78a71866-ace7-4abb-a4d5-5efb241071da', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$PDF: Template de storyboard para videoclipe$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '67904101-3199-43a7-b33e-9e22d1359a0c', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Link: Tutorial CapCut/iMovie para edição de vídeo$$, 'link', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c17ecc40-78bb-49e1-838b-60e1f035a66f', '2ecdfe16-da90-4f41-9e0a-24954ca684f5', $$Vídeo: Exemplos de videoclipes feitos com celular$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '96750c4b-1642-4cc4-a3aa-fef83f042940', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$PDF: Música e Transformação Social – Projetos de referência$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '4d39ea58-cbd2-4a98-b0e3-9c9e279b90ca', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$PDF: Repertório acessível para apresentações comunitárias$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd694136b-69f2-410f-b995-73bde74003db', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Vídeo: Documentário sobre projetos sociais musicais$$, 'video', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '27664d6e-d286-4160-ad30-c641a395e669', '9cff1bc8-5a02-4fb5-82fa-1521c95b32e5', $$Cifra: Peças para apresentação com participação da plateia$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '365e9846-7377-49f3-805d-2391ae7a3c2f', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Partitura: Repertório completo do Show Final – Partes por naipe$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '40be2c3d-f29c-4ec2-8cf7-4a500fcf3f81', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$PDF: Setlist oficial do Show Final 2026$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'f8972dd4-852c-4409-8214-d4df4eef57f8', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$Áudio: Gravações de referência de cada peça do show$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7bb200b0-772b-483b-9ce9-3be647dec3a2', '5b254638-a3d5-4fc3-9f57-821d21790bed', $$PDF: Mapa de palco com posições dos músicos$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff522294-675a-44ee-bbc3-27884d796f3c', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Partitura: Repertório do Show Final com marcações de dinâmica$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '1d4a1291-09e0-4313-9231-c9f826122fbb', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$PDF: Roteiro do Show Final – Ordem, transições e momentos especiais$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '00f32387-1d9c-4a7f-ab4d-c731101c0a2b', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$Áudio: Gravações de referência com dinâmicas marcadas$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '517ed9c4-325f-4bfa-80df-f0878365db46', '9193f4de-d199-47b3-9a87-261fb4ed9267', $$PDF: Lista de correções do ensaio anterior$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '9929e29c-c5a8-4d38-8d5f-09d3627e13e8', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Partitura: Repertório completo do Show Final$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'cd34dc54-9d96-4047-9d04-64a55959e8fa', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$PDF: Roteiro de palco – Entradas, saídas e falas$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '37026a0b-543b-49dd-a5fb-87270311c484', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$Cronômetro para controle de tempo do show$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'fb0ea072-7f7f-45e7-9b38-daaa97e00c11', '57c81c5f-20a5-41d7-9029-6b2653da4f50', $$PDF: Ficha de feedback por peça$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '863b94e0-020e-47ca-b0aa-9b423d20fb0e', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$PDF: Lista de correções do Ensaio Dirigido I$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'ce46e27c-c73b-400a-b537-8c849193d5fa', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Partitura: Repertório com marcações atualizadas$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'e0239bfd-6adb-430a-83d8-1535281af4b0', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$PDF: Protocolo de emergência – O que fazer se algo der errado$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '595efe8d-b200-41e7-9f45-6eddd9a751de', '2018291f-6df3-4a52-a44f-8e5a4f19eb9f', $$Áudio: Click track para controle de tempo$$, 'audio', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c4177265-61a8-4c7d-8a4e-bad2686df786', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Partitura: Repertório final completo$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '33a51942-d36a-4180-bf80-1a8aa888d641', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$PDF: Roteiro de palco definitivo$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '960a212d-abbf-4ff7-b915-d66f576a5502', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$PDF: Checklist de produção do show$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'b665d8db-89e0-4336-8627-363a4337f5b0', 'f5446e9d-9313-499c-be73-3f7371624fbd', $$Figurino e acessórios de palco$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '08245092-e2d2-48b7-8654-73caf8dd4322', 'b3733049-d482-4882-a484-e092fe79324d', $$Partitura: Repertório final com últimas correções$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'd7f4a18e-88e3-42c4-bda1-0542ab05e6c3', 'b3733049-d482-4882-a484-e092fe79324d', $$PDF: Roteiro da cerimônia de formatura$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'c728e161-fdd2-4add-8e35-cf3ac7d9dd55', 'b3733049-d482-4882-a484-e092fe79324d', $$Certificados de conclusão do Ano 2$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '7b35bf4e-b96a-4ab9-9580-1a0461a30b83', 'b3733049-d482-4882-a484-e092fe79324d', $$PDF: Checklist final do show$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a25f2d52-112c-45b2-b448-30601343c459', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$PDF: Rider técnico do show – Necessidades de som e palco$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '3e64697a-7493-4e98-a724-3aeca3820a36', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Partitura: Repertório final para consulta rápida$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5555a4c6-32bb-442b-ac61-5ccc183d432f', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$PDF: Cronograma do dia do Show Final$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '26de274c-2241-4197-b3a2-51e6d17ff94d', '5a550f03-cb0b-41ed-b7ed-4b8c9cf714ba', $$Kit de emergência: cordas, palhetas, pilhas, fita$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '5b4741ba-b1c0-4db6-b90c-8a16ef2eebb1', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$PDF: Programa oficial do Show Final 2026$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', 'a45184d8-07b2-49a7-b7d5-1e1cc5cd158c', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Certificados de conclusão individuais$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '535c95bf-4a74-43e6-852a-7016645cee10', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Premiações especiais (destaque do ano, maior evolução, etc.)$$, 'document', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)
VALUES ('00000000-0000-0000-0000-000000000001', '560823f0-db64-457d-a000-b01b084e9bb7', '60cdb1a9-8939-4aaf-9dac-9dd19387d83f', $$Partitura: Repertório completo (backup)$$, 'sheet_music', $$#$$, '2026-03-01 00:00:00.000000+00'::timestamptz, 3)
ON CONFLICT (id) DO NOTHING;

-- Total: 160 materials
COMMIT;