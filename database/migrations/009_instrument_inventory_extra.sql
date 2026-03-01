-- =============================================
-- Migration: 009_instrument_inventory_extra.sql
-- Table: core.instrument_inventory
-- Source CSV: instrumentos_fisicos_rows.csv
-- Generated: 2026-02-28T16:15:03.477Z
-- Rows: 17
-- =============================================

BEGIN;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b3c2f5e-2c09-42c8-a5a2-24cc9269f2c6', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', NULL, $$NS-SAX-001$$, NULL, NULL, 600, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:52.338848'::timestamptz, '2025-09-08 16:51:52.338848'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1bd60bf7-9af8-4820-ba22-e5cfc6831589', '80436b4f-15c1-452f-9442-34e42b5117e4', NULL, $$NS-VIO-001$$, NULL, NULL, 800, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:29.842673'::timestamptz, '2025-09-08 16:51:29.842673'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '37c4d836-3d48-477f-b928-861d0a975f4e', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', NULL, $$NS-GUI-001$$, NULL, NULL, 800, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:29.842673'::timestamptz, '2025-09-08 16:51:29.842673'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4cd8f9ff-b4c7-4fa3-906d-5c07d012125b', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', NULL, $$NS-GUI-001$$, NULL, NULL, 800, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:52.338848'::timestamptz, '2025-09-08 16:51:52.338848'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4e001976-b32a-4080-9848-b99e6bc0b2f3', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', NULL, $$NS-TEC-001$$, NULL, NULL, 1200, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:29.842673'::timestamptz, '2025-09-08 16:51:29.842673'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '51e9a1eb-5b34-43a3-ac52-ae1b88a02eed', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', NULL, $$NS-FLA-001$$, NULL, NULL, 600, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:52.338848'::timestamptz, '2025-09-08 16:51:52.338848'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ec3afce-e8ea-4580-bdb2-a2a30af32fb9', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', NULL, $$NS-SAX-001$$, NULL, NULL, 600, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:29.842673'::timestamptz, '2025-09-08 16:51:29.842673'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '665b21ad-2ec8-4e4b-8808-1fc671f2b77f', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', NULL, $$NS-VIO-001$$, NULL, NULL, 800, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:52.338848'::timestamptz, '2025-09-08 16:51:52.338848'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '67183e71-bd7a-486a-b567-1a450baa69d7', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', NULL, $$NS-FLA-001$$, NULL, NULL, 600, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:29.842673'::timestamptz, '2025-09-08 16:51:29.842673'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8656f9db-41ca-4604-bfc2-84188c42273d', '509d6a26-159a-4976-aa46-83f914f930aa', NULL, $$NS-TRO-001$$, NULL, NULL, 600, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:52.338848'::timestamptz, '2025-09-08 16:51:52.338848'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '90146aba-d67e-43c0-aef2-9f58104fdf5a', 'ab9720a5-1973-484e-9a44-d4aa62594336', NULL, $$NS-PIA-001$$, NULL, NULL, 1200, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:52.338848'::timestamptz, '2025-09-08 16:51:52.338848'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9c35d7db-c590-4b04-9dd9-4fd69c8e49ad', '509d6a26-159a-4976-aa46-83f914f930aa', NULL, $$NS-TRO-001$$, NULL, NULL, 600, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:29.842673'::timestamptz, '2025-09-08 16:51:29.842673'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8c73f86-b3e3-4d6b-9586-1e2e41cebff3', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', NULL, $$NS-TEC-001$$, NULL, NULL, 1200, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:52.338848'::timestamptz, '2025-09-08 16:51:52.338848'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c257475f-abf7-4c03-99b1-eb6dab5cb06d', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', NULL, $$NS-VIO-001$$, NULL, NULL, 800, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:29.842673'::timestamptz, '2025-09-08 16:51:29.842673'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db3d4b86-24f3-4a56-b2a1-0d040cd75dfb', '80436b4f-15c1-452f-9442-34e42b5117e4', NULL, $$NS-VIO-001$$, NULL, NULL, 800, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:52.338848'::timestamptz, '2025-09-08 16:51:52.338848'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e399c07c-d862-43ca-ac4f-4b65595d6efa', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$TESTE-001$$, $$SN-001$$, $$Yamaha$$, $$F310$$, 1500, '2025-06-07'::date, $$Escola$$, $$bom$$, $$Sala A$$, true, $$Registro de teste para validação de estatísticas.$$, '2025-06-07 23:26:43.562962'::timestamptz, '2025-06-07 23:26:43.562962'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_inventory (tenant_id, id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe1d8d5e-9fc2-4745-afcd-796c72285ca1', 'ab9720a5-1973-484e-9a44-d4aa62594336', NULL, $$NS-PIA-001$$, NULL, NULL, 1200, '2024-09-08'::date, $$igreja$$, $$bom$$, $$Sala de Música - Armário A$$, true, NULL, '2025-09-08 16:51:29.842673'::timestamptz, '2025-09-08 16:51:29.842673'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;