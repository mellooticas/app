-- =============================================
-- Migration: 026_history_timeline_events.sql
-- Table: core.history_timeline_events
-- Source CSV: historia_eventos_timeline_rows.csv
-- Generated: 2026-02-28T16:15:03.758Z
-- Rows: 4
-- =============================================

BEGIN;

INSERT INTO core.history_timeline_events (tenant_id, id, year, month, day, title, event_type, category, description, composer_id, work_id, period_id, image_url, importance, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '29a562b4-5c6e-4102-8535-d505869d6c52', 1770, 12, 17, $$Nascimento de Beethoven$$, $$nascimento$$, $$compositor$$, $$Nasce em Bonn, Alemanha, Ludwig van Beethoven.$$, '37681c66-7ef1-4634-b268-fbc1be69e4c5', NULL, 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', NULL, 5, true, '2025-10-26 03:54:07.846053+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_timeline_events (tenant_id, id, year, month, day, title, event_type, category, description, composer_id, work_id, period_id, image_url, importance, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '31d6b33e-69f4-42f2-81db-718fa113b43e', 1824, 5, 7, $$Estreia da 9ª Sinfonia de Beethoven$$, $$estreia$$, $$obra$$, $$Primeira apresentação da Nona Sinfonia no Theater am Kärntnertor, Viena.$$, '37681c66-7ef1-4634-b268-fbc1be69e4c5', NULL, 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', NULL, 5, true, '2025-10-26 03:54:07.846053+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_timeline_events (tenant_id, id, year, month, day, title, event_type, category, description, composer_id, work_id, period_id, image_url, importance, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '705d6b18-bf47-4e79-a33b-df1b3ce4b22f', 1756, 1, 27, $$Nascimento de Mozart$$, $$nascimento$$, $$compositor$$, $$Nasce em Salzburgo, Áustria, Wolfgang Amadeus Mozart, prodígio musical.$$, '9148c439-1fbe-45d0-beed-56e97f6cf026', NULL, 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', NULL, 5, true, '2025-10-26 03:54:07.846053+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_timeline_events (tenant_id, id, year, month, day, title, event_type, category, description, composer_id, work_id, period_id, image_url, importance, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7c2a3480-b233-44a9-90bc-a992d03cd170', 1685, 3, 21, $$Nascimento de J.S. Bach$$, $$nascimento$$, $$compositor$$, $$Nasce em Eisenach, Alemanha, um dos maiores compositores da história.$$, '8d121f8d-363a-4825-9eca-d62553d1ea53', NULL, 'd8c30e03-788e-4a90-970c-7585963b3949', NULL, 5, true, '2025-10-26 03:54:07.846053+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;