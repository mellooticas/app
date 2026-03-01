-- =============================================
-- Migration: 025_history_cultural_contexts.sql
-- Table: core.history_cultural_contexts
-- Source CSV: historia_contexto_cultural_rows.csv
-- Generated: 2026-02-28T16:15:03.740Z
-- Rows: 16
-- =============================================

BEGIN;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '128687e2-4ff3-41e2-887c-e9174d880026', NULL, $$Primeira Guerra Mundial$$, $$politico$$, $$Conflito devastador que transformou a Europa.$$, $$Ruptura com tradições. Expressionismo refletindo trauma. Busca por novas linguagens musicais.$$, 1914, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '250eb0f2-430b-452e-91e9-a9e69c2bedf8', NULL, $$Música Eletrônica$$, $$tecnologico$$, $$Desenvolvimento de sintetizadores e música concreta.$$, $$Novos timbres e possibilidades sonoras. Música eletroacústica. Estúdios de música eletrônica.$$, 1948, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2b86fa54-88f0-4426-83f6-69c07eb87140', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', $$Ascensão da Burguesia$$, $$social$$, $$Crescimento da classe média urbana com poder econômico.$$, $$Novo público para concertos. Desenvolvimento do piano doméstico. Música de câmara para salões burgueses.$$, 1780, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '309fe859-fe7b-4d8e-bacc-091d9dec31c7', 'e8ce8fcc-5d20-4557-be06-c908b975e141', $$Romantismo Literário$$, $$literario$$, $$Movimento literário enfatizando emoção, natureza e individualismo.$$, $$Música programática inspirada em literatura. Lieder (canções artísticas). Óperas baseadas em dramas românticos.$$, 1800, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a349a0d-c5fb-4860-bd2b-bba5c298c593', 'e8ce8fcc-5d20-4557-be06-c908b975e141', $$Nacionalismo Europeu$$, $$politico$$, $$Movimentos de independência e unificação nacional na Europa.$$, $$Valorização das identidades nacionais através da música folclórica. Escolas nacionais de composição.$$, 1848, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '40e18e86-8b0d-4d18-8ac3-dc7b92b79dee', 'd8c30e03-788e-4a90-970c-7585963b3949', $$Absolutismo Monárquico$$, $$politico$$, $$Apogeu do absolutismo com Luís XIV, o "Rei Sol" da França.$$, $$Patrocínio real criou grandes centros musicais nas cortes. Música como símbolo de poder e prestígio.$$, 1643, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4f4525ce-d2ec-48f8-a0c7-026aad8b1fdc', NULL, $$Existencialismo$$, $$filosofico$$, $$Filosofia enfatizando liberdade individual e absurdo da existência.$$, $$Música refletindo questões existenciais. Aleatoriedade e indeterminação (John Cage).$$, 1945, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6ecf0f15-1413-4f64-92ff-5797b3cf3323', 'e8ce8fcc-5d20-4557-be06-c908b975e141', $$Pintura Romântica$$, $$artistico$$, $$Arte visual enfatizando dramatismo e natureza.$$, $$Busca por equivalentes musicais de efeitos visuais. Poemas sinfônicos pintando paisagens sonoras.$$, 1820, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b2a5481d-de6f-433c-b275-22084d25d5c1', NULL, $$Contracultura$$, $$social$$, $$Movimento juvenil questionando valores tradicionais.$$, $$Minimalismo como reação à complexidade. Fusão de música erudita com popular. Novos públicos.$$, 1960, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b7286b18-3db3-4926-a4fe-4cb0c356cfd9', 'd8c30e03-788e-4a90-970c-7585963b3949', $$Contrarreforma Católica$$, $$religioso$$, $$Movimento de renovação da Igreja Católica em resposta à Reforma Protestante.$$, $$Estimulou a música sacra dramática e emocional. Desenvolvimento da ópera e oratório como ferramentas de evangelização.$$, 1545, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc187484-52be-40e5-8d26-755a9bdd0581', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', $$Iluminismo$$, $$filosofico$$, $$Movimento intelectual enfatizando razão, ciência e humanismo.$$, $$Busca por clareza, equilíbrio e forma racional na música. Valorização da música instrumental pura.$$, 1750, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c4bcb8aa-eff5-4742-afa8-bf35f2eb169c', 'e8ce8fcc-5d20-4557-be06-c908b975e141', $$Revolução Industrial$$, $$tecnologico$$, $$Mecanização da produção e transformação social.$$, $$Aperfeiçoamento de instrumentos (piano forte, válvulas em metais). Produção em massa de instrumentos.$$, 1820, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ccdda744-216a-49ae-84f5-d93091ace4bd', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', $$Revolução Francesa$$, $$politico$$, $$Queda da monarquia francesa e ascensão dos ideais de liberdade, igualdade e fraternidade.$$, $$Democratização da música. Surgimento de concertos públicos. Músico como artista independente.$$, 1789, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2f144be-8adf-4a5b-b725-19608f9d25cb', NULL, $$Segunda Guerra Mundial$$, $$politico$$, $$Conflito global com holocausto e bombas atômicas.$$, $$Música refletindo angústia existencial. Vanguardas do pós-guerra. Serialismo integral.$$, 1939, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e3159d32-4863-477d-93b1-22f7ccda4f90', 'd8c30e03-788e-4a90-970c-7585963b3949', $$Revolução Científica$$, $$cientifico$$, $$Newton publica Principia Mathematica, estabelecendo leis da física.$$, $$Influenciou a busca por sistemas racionais na música. Desenvolvimento da harmonia tonal sistemática.$$, 1687, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_cultural_contexts (tenant_id, id, period_id, title, context_type, description, impact_on_music, start_year, end_year, images_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e319dd33-0d8c-43af-993a-ddb907d09d99', NULL, $$Invenção do Rádio$$, $$tecnologico$$, $$Transmissão de som à distância revoluciona comunicação.$$, $$Democratização do acesso à música erudita. Orquestras de rádio. Novos públicos.$$, 1920, NULL, '[]', true, '2025-10-26 04:40:51.40056+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;