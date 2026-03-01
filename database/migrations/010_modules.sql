-- =============================================
-- Migration: 010_modules.sql
-- Table: core.modules
-- Source CSV: modulos_rows.csv
-- Generated: 2026-02-28T16:15:03.481Z
-- Rows: 11
-- =============================================

BEGIN;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1951045f-9ad4-4335-831c-5b519a8a5d16', $$Ciclo Inicial$$, $$Iniciação Musical (6-7 anos): Exploração sonora e sensorial através de sons do corpo, jogos rítmicos, contação de histórias musicadas, movimento criativo. Metodologias: Orff, Dalcroze, Waldorf. Instrumentos: xilofones Orff, chocalhos, pandeiros, flautas pentatônicas. Objetivos: despertar sensibilidade musical, desenvolver ritmo básico, explorar paisagem sonora, iniciar leitura não convencional, desenvolver escuta ativa.$$, 1, true, '2025-10-26 13:34:05.794562'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1a40fb7e-820f-4731-a69e-1c8d24093914', $$Módulo 3 – Repertório e Cultura Musical$$, $$Músicas populares, brasileiras e japonesas$$, 3, true, '2025-05-30 21:41:54.314514'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2fc69400-4433-4798-a36a-cef74e041021', $$Módulo 0 – Iniciação Sonora$$, $$Exploração do som com o corpo e objetos$$, 0, true, '2025-05-30 21:41:54.314514'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4fa73875-e6a3-45c1-82e2-1b40f98cce45', $$Ciclo Avançado$$, $$Especialização e Profissionalização (15+ anos): Produção musical avançada, tecnologia (DAW, MIDI, síntese), indústria musical, empreendedorismo, projetos de portfólio profissional. Metodologias: Berklee, Gordon MLT, Musical Futures. Instrumentos/Tecnologia: DAWs (Ableton, Logic, Pro Tools), controladores MIDI, sintetizadores, equipamento de estúdio, todos os instrumentos. Objetivos: dominar produção digital, criar portfolio profissional, conhecer indústria musical, empreender na área, preparar carreira.$$, 4, true, '2025-10-26 13:34:05.794562'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c179405-78ba-4755-8586-17afe4610e82', $$Módulo 5 – Apresentação e Performance$$, $$Ensaios, gravações e apresentação final$$, 5, true, '2025-05-30 21:41:54.314514'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71142cb3-44ab-4391-af97-fa7ba42041eb', $$Ciclo Intermediário$$, $$Performance e Autoria (12-14 anos): Bandas estudantis, projetos colaborativos, composição e arranjo, performance pública, introdução à produção. Metodologias: Musical Futures, Orff, Gordon MLT. Instrumentos: instrumentos de banda (guitarra, baixo, bateria, teclado), instrumentos diversos, equipamentos de áudio. Objetivos: tocar em banda, compor músicas originais, gravar projetos, fazer shows, desenvolver estilo próprio.$$, 3, true, '2025-10-26 13:34:05.794562'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8012d75e-1e57-4282-a995-62f4ba567bf7', $$Módulo 4 – Criação Musical e Tecnologia$$, $$Improvisação, looping e composição$$, 4, true, '2025-05-30 21:41:54.314514'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8badf93b-71b9-4cae-a5ee-46a6d08fad50', $$Módulo Básico de Música$$, $$Módulo padrão para aulas básicas de música$$, 1, true, '2025-09-08 16:31:58.426712'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '934cfe86-d0cc-4252-87ff-730bd7d0d9b2', $$Módulo 1 – Primeiro Contato com o Instrumento$$, $$Postura, som inicial e primeiros exercícios$$, 1, true, '2025-05-30 21:41:54.314514'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'be29a30f-6321-42c8-b0ca-9c85c2242886', $$Módulo 2 – Desenvolvimento Técnico$$, $$Escalas, ritmo e coordenação$$, 2, true, '2025-05-30 21:41:54.314514'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.modules (tenant_id, id, name, description, order_index, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cea48482-9654-4ab1-84ff-26ec584371d1', $$Ciclo Fundamental$$, $$Desenvolvimento Técnico (8-11 anos): Escolha e início de instrumento, leitura musical, teoria básica, música em conjunto, projetos criativos simples. Metodologias: Suzuki, Kodály, Orff. Instrumentos: violão, flauta doce, teclado, percussão variada, instrumentos Orff. Objetivos: dominar técnica básica instrumental, ler partituras simples, tocar em grupo, criar arranjos simples, participar de apresentações.$$, 2, true, '2025-10-26 13:34:05.794562'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;