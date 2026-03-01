-- =============================================
-- Migration: 017_competencies.sql
-- Table: core.competencies
-- Source CSV: alpha_competencias_rows.csv
-- Generated: 2026-02-28T16:15:03.588Z
-- Rows: 9
-- =============================================

BEGIN;

INSERT INTO core.competencies (tenant_id, id, methodology_id, name, description, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0367cd09-a26e-491f-b15b-11f8124615ef', 'a8a09c03-0771-4b2a-911b-8a357f312b63', $$Competência Básica em Pedagogia Waldorf Musical$$, $$Fundamentos essenciais da metodologia Pedagogia Waldorf Musical$$, 1, '2025-10-04 03:22:59.975865+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.competencies (tenant_id, id, methodology_id, name, description, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '31240b4a-9ea2-429b-bfdf-64600157ea7a', 'd64dac55-ed34-4f4d-93c7-d6fca955eff5', $$Competência Básica em Orff Schulwerk$$, $$Fundamentos essenciais da metodologia Orff Schulwerk$$, 1, '2025-10-04 03:22:59.975865+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.competencies (tenant_id, id, methodology_id, name, description, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '58514639-3a4e-433b-b61a-ee5a7221df1e', 'eaf8c6d8-d709-4b2a-8b6e-8ecdbbc772b0', $$Competência Básica em Music Learning Theory (Gordon)$$, $$Fundamentos essenciais da metodologia Music Learning Theory (Gordon)$$, 1, '2025-10-04 03:22:59.975865+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.competencies (tenant_id, id, methodology_id, name, description, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a44106d-a1ff-4496-b2ff-c38816706e19', 'a5a5b85d-bace-4415-90bb-01c80cb1564c', $$Competência Básica em Método Kodály$$, $$Fundamentos essenciais da metodologia Método Kodály$$, 1, '2025-10-04 03:22:59.975865+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.competencies (tenant_id, id, methodology_id, name, description, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6eba2f65-1bc2-445d-8af3-4e5e3ed0885a', '5122d3b5-3f1e-4cb0-bc9b-ff6e140a51a2', $$Competência Básica em Berklee Method$$, $$Fundamentos essenciais da metodologia Berklee Method$$, 1, '2025-10-04 03:22:59.975865+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.competencies (tenant_id, id, methodology_id, name, description, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '74c6e7b1-5a72-49d6-bf2d-5d8cda400c12', '68632b58-86b0-44e7-becc-69099e78764d', $$Competência Básica em Musical Futures$$, $$Fundamentos essenciais da metodologia Musical Futures$$, 1, '2025-10-04 03:22:59.975865+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.competencies (tenant_id, id, methodology_id, name, description, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7d18b9b1-1625-40ad-8a35-59aff2678f36', '8622a0d3-c389-47bf-a3a9-843bfcc293a2', $$Competência Básica em Método Suzuki$$, $$Fundamentos essenciais da metodologia Método Suzuki$$, 1, '2025-10-04 03:22:59.975865+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.competencies (tenant_id, id, methodology_id, name, description, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c782f40b-2fe8-4752-89cb-8d57c987dd4f', '28ff3697-1df2-48a6-a961-2f10054a3720', $$Expressão Artística Integrada$$, $$Capacidade de integrar múltiplas linguagens artísticas (música, teatro, artes visuais, literatura) em projetos criativos colaborativos, valorizando a diversidade cultural e promovendo inclusão social.$$, 1, '2025-10-04 04:50:35.314966+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.competencies (tenant_id, id, methodology_id, name, description, order_index, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd3de8cb5-cea0-434a-bb9c-2b4d76d4a407', '99551ce6-bdc4-4cd2-b72f-728cc09f36ae', $$Competência Básica em Dalcroze Eurythmics$$, $$Fundamentos essenciais da metodologia Dalcroze Eurythmics$$, 1, '2025-10-04 03:22:59.975865+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;