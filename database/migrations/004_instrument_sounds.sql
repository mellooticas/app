-- =============================================
-- Migration: 004_instrument_sounds.sql
-- Table: core.instrument_sounds
-- Source CSV: instrumento_sons_rows.csv
-- Generated: 2026-02-28T16:15:03.162Z
-- Rows: 1035
-- =============================================

BEGIN;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0042c39b-2853-4bca-8a68-cb4e7880095e', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Mi - power chord$$, $$power chord$$, $$audio/guitarra/power_chord_mi.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0086e5a4-1c46-4cdc-93d2-5e4ee304f68c', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '00bb54e5-0fc9-412d-8295-d2fdc2b4aa20', '6925f61b-ba48-473a-b69a-e3548036c1df', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '00c8a81d-764a-4ae8-88d4-c685b72de7b9', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '00dbd749-2de4-4f09-ac6f-4e0829df3594', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0167a5c3-404d-4645-9f1c-470330121577', '36040329-1aa6-428a-ad39-cd85de03493e', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '01764400-7a66-4f8a-970a-da8ed289c5d6', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '018c9cf4-5846-4e7b-ac29-7a960458d0c8', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '019c4737-557c-4224-b1c8-03f0bd925dfe', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '01aa4464-d962-4f78-91e3-408043375f8f', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Mi agudo - respiracao$$, $$respiracao$$, $$/audio/saxofone/mi_agudo.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '01c8e6a1-1d5c-4a3a-9a16-f019fafa6f5f', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '02432750-153c-445e-9411-6e30a3725cd2', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '02b64cff-b952-4a25-92f9-aaf12a80c07e', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '03495e6a-9393-48a4-a558-0edde3e67fd0', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '03bb5ad1-3115-47ed-9377-0306ee57fdb9', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '03e74407-8a12-4b41-956b-4a73f7b72ead', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0433f82f-245c-43ec-8b35-d4edbd25778e', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Mi - respiracao$$, $$respiracao$$, $$/audio/saxofone/mi_basico.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '04f8fac6-3c0b-4a54-9b40-942f1214917c', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '04fc8b5e-296c-4308-8771-2b51bc597cf8', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05206c79-1f21-4c52-ab7b-2e48ef73396c', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05314ab6-eac5-41fe-a066-fb8221be7fb2', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05472947-9099-4d71-b262-ff15824004cd', '509d6a26-159a-4976-aa46-83f914f930aa', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05e63305-f532-492b-a373-49c393f8384d', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05e7db43-bfd2-4b87-9d37-de4feee8c251', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05f5c4cd-9548-437a-803f-9be2e09564bd', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '05fa4c69-491d-4de9-b446-edef4a80c488', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0689128c-b772-47a9-86b1-691473293205', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '06979be5-5d36-46e4-843c-d92e62cce87d', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '06cdb2c1-4c4b-4cc7-a5d2-01e0f91040c5', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '06d4e9da-fee1-43ba-a611-c97a3b9e0138', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '07621e8a-a706-4edc-ba04-27bf6ef4beb7', '1b699036-0f72-4c48-9801-e01f6f25e165', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '078292e3-f8e1-415d-9226-5d8b196f3aa0', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '07f20d63-9e8e-4969-8c0c-9f99c0e79b28', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '08c2258a-57d5-46b4-8f58-05189b3539df', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '08cf86db-5ac7-4bfb-9f0f-ad147615b3a3', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Mi - chalumeau$$, $$chalumeau$$, $$/audio/clarinete/mi_chalumeau.mp3$$, '2025-06-15 19:12:53.477248'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '08fb70fa-f510-4bf9-afeb-d7aa43bde441', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '090ff237-346c-4d9e-b1ee-0a032bf7f885', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0954d5cb-15e6-48c6-aed9-f0066388a7c4', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '09ca0ec2-b997-4a1c-82f6-8b4a9cd8742d', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '09d640a8-9764-4119-983b-41d9b775d8cb', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Ré agudo - respiracao$$, $$respiracao$$, $$/audio/saxofone/re_agudo.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '09e05368-ecd5-4afb-bac9-b2c71db0b64f', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '09f659f3-9924-458f-aa42-013fb4abace3', '36040329-1aa6-428a-ad39-cd85de03493e', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0a3d5bf2-ed80-4e56-909b-15cb8c633ee4', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0a7009b3-674a-4646-9554-0f7521c75f51', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0aa9892c-6eea-4bf9-bfb9-ab7bbbc3a7d0', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0ac8f3f5-e09b-4bb6-8c0a-fb2afda6ddbb', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b39b708-f6f7-46ff-a006-6631538cd229', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b5e85ca-a91c-4b5e-a19d-aa5afc25230a', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b797070-e407-4650-8447-642ce1e553d2', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b958b15-f211-4f20-a814-7ca069e4b017', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0bcffbfa-2cc2-4a0b-9edb-bf9e15fb82ed', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0bd25584-69b3-4376-a198-d3c15461dcc0', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0c34c72e-13e9-4aff-a4f7-fcd882ab5a58', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0c535c87-a466-4d98-a8a6-b08c6539f622', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0c6ca04c-be68-4641-ac39-90eaa4d3d91e', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0c8f4800-7f96-4eb0-bf6b-0fb8e7558989', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0cfa957b-fe83-412e-94d8-8c9efd2c5aaa', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0dd0cf0d-82fe-4e78-8f99-15599c654aa1', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0deddae9-4122-48ee-87d1-fddcfc18bbf3', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0df1e086-d44c-4cfc-acae-eb5817cf94f2', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e0261e3-f85a-4521-be28-4f30a57a8ca0', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e71a86f-5957-4b2b-82f5-744ca94b6c55', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e772f5a-fc3c-4628-accf-8ded26b812e7', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Mi agudo - digitacao$$, $$digitacao$$, $$/audio/teclado/mi_agudo.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0ef48e11-1e29-4517-8e20-55aa09a9552f', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0f09a84c-56fb-4b26-8cbc-c13fff786167', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0f0c1645-a10d-4ecb-845f-d7cd74ffc5d6', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0f481916-ae43-436a-a566-4a1ce0ab1b16', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Si bemol grave - digitacao$$, $$digitacao$$, $$/audio/fagote/si_bemol_grave.mp3$$, '2025-06-20 02:38:53.825384'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0f531dac-faf8-490d-9518-13bbf15e2f5d', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0f7cb8be-3476-433d-8d6c-84588195ef10', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0f837c7a-ba86-4930-a9e9-314eef4c8cf9', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0fa79cfb-f048-4cfc-888a-b051ee3f919b', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0fbf99ac-41d4-4ef0-98e8-2172bbccbd15', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0fce420c-6561-4905-8c2d-6707344416a4', '492f792b-8d0c-46b7-a195-c8c32114696d', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0fde12cc-5aa9-45a7-b3d4-7e874a514668', '82052c70-0a9d-4d94-873e-3b402e032f55', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '10202ef1-c17e-478f-887b-daffb6b18e87', '6925f61b-ba48-473a-b69a-e3548036c1df', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '10b86467-07b0-4575-8d76-9b657f3cbd36', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '10cf81d8-85d1-4c7b-a2f1-e42a5a4d6359', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '112ab218-5e86-4f33-b474-7b9776fbdf15', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '115c40e9-e8d2-4560-89e9-eca65c237bd6', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1187974c-4cb5-42ef-9d44-ac4590968f13', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Sol - slide$$, $$slide$$, $$audio/guitarra/slide_sol.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '11aeeb80-40bf-4cfe-9b9f-467dace08a66', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '11ba204d-26ba-41d9-a5f2-fd6dcfdbf692', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '12937cad-c3c6-480b-9046-35c36a03bb57', '9a5e0eac-114e-4173-90af-32b55c870675', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1335feaa-f929-4a24-8aff-3a71cf22ef44', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '13aff70b-0591-4319-9478-3f87e3933e2a', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '13f35705-0012-4a96-bcb4-e4d324f9c8c1', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1474882c-57a3-47dc-b7e6-ffa18bd89758', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Lá - glissando$$, $$glissando$$, $$/audio/piano/la_glissando.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '148d0a70-3ee2-45f6-a002-aad5cb4860c7', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '15380a33-32fe-4238-81f0-767450bbe652', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '159f26a8-0451-445d-9dad-3c5f86f3a5c0', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Sol - tremolo$$, $$tremolo$$, $$/audio/violao/sol_tremolo.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '15adc333-4fef-44be-b998-64bcd6af8e09', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '15ea236b-5441-4a44-b3c3-853c0c952bca', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '15ece28c-bd9b-481a-9c34-3d8712ea11b4', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1610553e-7fed-4bdf-95cf-8b7d25b6c099', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '16497ad9-87d0-45e8-9623-144038bd7c0e', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Ré - vibrato$$, $$vibrato$$, $$/audio/violoncelo/re_vibrato.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '164bab81-c54c-4507-91fa-36180499781f', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '16556301-4537-431b-b232-185dbf22d3a5', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '16d5640f-17d7-416f-8ed5-0be25debcdff', '1b699036-0f72-4c48-9801-e01f6f25e165', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '176653aa-c0b9-4c51-ba87-d765dc196fec', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Ré - digitacao$$, $$digitacao$$, $$/audio/contrabaixo/re_basico.mp3$$, '2025-06-16 05:24:08.423464'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1790249b-a7e5-4ee7-9a8d-5f9ae6783683', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '18175792-1ddb-43c3-81df-e6e6b1091664', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Mi - corda solta$$, $$corda solta$$, $$/audio/violao/mi_corda_solta.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '181b4910-d646-4136-aa86-096f183d628d', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Ré agudo - registro agudo$$, $$registro agudo$$, $$/audio/clarinete/re_agudo.mp3$$, '2025-06-15 19:12:53.477248'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '18acf828-8749-47d8-949d-d43c62c94a7c', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '18b30b1b-b63c-465a-9514-c3a0bf9e9153', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '18fcf65e-93a2-4562-b70d-ffcfdac4d469', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '197b05bb-770f-4158-b220-7d6368e5fce7', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '19868db8-53d9-4510-9330-6c6d0aa0f1a6', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '19cd641e-4b8a-4416-a905-f599d16d57f5', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Sol - digitacao$$, $$digitacao$$, $$/audio/contrabaixo/sol_basico.mp3$$, '2025-06-16 05:24:08.423464'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '19ea5001-b796-4e33-a720-295de96e591e', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1a4ef205-8947-449d-bfea-6f593bf56568', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Mi agudo - registro agudo$$, $$registro agudo$$, $$/audio/flauta/mi_agudo.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1a53a904-fd60-4230-a855-bfd8fac414f0', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Sib - slide$$, $$slide$$, $$/audio/violao/sib_slide.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1a68d1b7-1407-46de-8682-e2ddc0f6dab9', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1a7fb85b-4603-44b9-857d-5c396dd316a3', '36040329-1aa6-428a-ad39-cd85de03493e', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1aa022cc-5a2e-4132-9f03-91797b0be92b', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1acc5cc0-9699-413a-a74b-7ddb36ae3e68', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1af461d9-73f4-466a-bd82-2b344eb5921d', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Sol - corda solta$$, $$corda solta$$, $$audio/violino/corda_sol.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b0e80a8-9462-4d31-9284-0a85ed6ac339', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Acorde G - harmonia$$, $$harmonia$$, $$/audio/teclado/acorde_g.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b0f90cf-3a01-40c5-8b29-5cf0b44c95cc', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b940805-60ef-4542-9f08-0be7834af7da', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1bf0b3a1-a9da-4189-8a47-2d9e34c4a956', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1c78dada-ff31-42c1-b673-c400923d47eb', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1c82ec25-8d70-4285-ba39-e2142f7b0242', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1cc47d1f-e620-4656-8885-80b77c2a8c0f', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1da5dfde-9bc5-4b42-b063-17dccd16fb64', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1daf9317-49f8-48d5-8227-96fbb93a9798', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1e08b8e3-d014-4dd0-aa0c-6af0e21bf9ae', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1ea081d9-5b0b-40be-bdb6-6a36fd591133', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1ea8bf48-0c20-47a9-a4be-f332fefa7dd0', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1efd11a7-8acd-4fd9-89ab-737b23bd58de', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1f8c7126-9f84-47f5-b5c5-052caabca3c0', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1f8f5815-ab2a-4e5e-bd20-178129ad4684', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Sol - portato$$, $$portato$$, $$/audio/piano/sol_portato.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1f928f9a-52c0-4694-8dc1-372e79d75492', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1fc5dc83-54dd-417d-be5f-9062237f155b', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1fdd02a7-eb4f-4293-8dd5-559a9cfa095e', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '200e6df2-c981-4388-b840-ea71891107e6', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '203f210c-1eba-442e-b74e-f536fcd46167', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2059b25e-f1ce-4a5d-a533-067961ac27f7', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '206de940-6882-426d-8706-323e84c11368', '492f792b-8d0c-46b7-a195-c8c32114696d', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '20876205-334a-4bdb-a652-ce834c9d98be', '9a5e0eac-114e-4173-90af-32b55c870675', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '20edfbf9-6786-4945-90a4-1e5270d44ca6', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '21eda011-4437-47fb-bb75-cc6501954d62', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '227af31c-cc04-4eb3-8982-1dfebf1ff8bb', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '22fabd12-6eda-46b3-91d2-adb0faf1b761', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Articulação rápida - articulacao$$, $$articulacao$$, $$/audio/trombone/articulacao_rapida.mp3$$, '2025-06-20 13:42:25.385612'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '239a7b11-9420-498b-a32b-bffb90e7b45f', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Mi - digitacao$$, $$digitacao$$, $$/audio/teclado/mi_basico.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '23ae95dd-a622-4ad5-a594-12f9a897a803', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '23f0907c-76e2-44ca-8b73-258df55ca3db', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '242e1639-67a2-4ebe-8e96-efdea19ee9a9', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '244969a1-6f15-4fe9-9a3f-ea8a913f5032', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '24907ed0-dc16-4b85-a710-ca1d1bff91f3', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '24943c7b-c1b3-4639-b4ee-c69477d40d63', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '251939ad-7a54-4870-88ee-b3acd5de35eb', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '251a840d-1613-4ddb-89f0-99a9934df48e', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '262254ba-c644-4bab-9f6d-012af130edb1', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '265febe0-ebc9-4b2e-b5dd-8f4202993a81', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '26887c0c-442c-446e-a824-91a98a1f35b8', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Articulação rápida - articulacao$$, $$articulacao$$, $$/audio/oboe/articulacao_rapida.mp3$$, '2025-06-20 05:13:31.357328'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2698cabe-48d7-4acf-90d0-8b0ed351542b', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Staccato - staccato$$, $$staccato$$, $$/audio/clarinete/staccato.mp3$$, '2025-06-15 19:12:53.477248'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '26a17e6c-a28b-4498-9eb8-0ef500cf8224', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '27153588-c003-4ccb-8278-a6123f404445', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '27591ad1-42cf-4e47-a26d-661ecc3c5eb5', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '27779878-b92b-485b-a1d4-bbffdbdfcf32', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '279ee306-9fc6-41c1-b9a7-0a7943c34f13', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Acorde F - harmonia$$, $$harmonia$$, $$/audio/teclado/acorde_f.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '27ab59c5-0447-4da4-b798-bae9b34ae5bb', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '282564f7-4761-495b-ae09-3130c28326ed', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Dó médio - digitacao$$, $$digitacao$$, $$/audio/oboe/do_medio.mp3$$, '2025-06-20 05:13:31.357328'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2827b548-9b65-4692-814b-f219abafc9a0', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '285a5871-f43b-4c5c-946b-0bbb914c653b', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '28923057-9520-462c-9921-176292a9171e', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '28cd4fda-4555-4957-9f00-8eafef4bbe1a', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '28da580d-08f0-4b69-9442-35883fc49d46', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Ré - corda solta$$, $$corda solta$$, $$/audio/violoncelo/re_corda_sol.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '295fb1e5-8e90-4717-b616-5b3417a47896', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2a459e90-c334-445b-8475-a6d0d11b732b', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2a5cd10a-e0b7-4832-8490-4521046cbba8', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2ac1a4e7-1d78-4c9b-af53-ecec3e177f97', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2b2ce8e1-7870-42c3-b75b-bb26805370c4', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2b7a0da5-2120-4a19-a5ff-d0ac259202b2', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2b8b8c0d-2b0c-47c6-9f7a-b8562bcad154', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2b910097-01a3-4ea9-9556-f1832f2db7b2', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2bea85e9-a5a0-4d3c-ace3-69584e4fea92', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Slap grave - slap$$, $$slap$$, $$/audio/baixo/slap_grave.mp3$$, '2025-06-16 04:35:35.662045'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2cd6768f-b075-4897-8f13-4481a6ba7770', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Dó - digitacao$$, $$digitacao$$, $$/audio/teclado/do_basico.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d7d111c-6d38-487f-8b35-6c63b2a5d872', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d7f3424-885c-4706-bbd4-18696e591dc5', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d836ffb-8449-4f08-a667-13782d6117fd', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Mi - harmônico$$, $$harmônico$$, $$/audio/violao/mi_harmonico.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d8c916f-f89e-4c23-8d8f-23e5c4a20cb8', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Dó - escala maior$$, $$escala maior$$, $$audio/violino/escala_do.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d90cc0a-05ae-4851-8796-190c4eaf17fb', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2d9d3f64-2018-4f14-995e-979c7075ddfa', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2da39c0c-9eb6-4799-b7df-8b8dc18bf639', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2e25b7fd-492b-4335-a875-9bc95c5647c5', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2ee5dc36-cfcf-4136-95cc-d7dde70c02b1', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2eed846e-25d2-41e6-b9bd-83c3915cb622', '36040329-1aa6-428a-ad39-cd85de03493e', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2f13e805-b53b-49f5-9c68-447feedd2bfe', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2f2acd93-9bc1-43de-ad04-cbbfb7552e68', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2f2f4374-4544-4af9-9ecf-8b9922561d9f', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2f354c6d-c88e-4dd2-bbe7-98baf1315360', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3020517d-fb83-495f-adf2-c0cea009c1ba', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '30c9d472-4d51-472e-88d5-ce96011a62a8', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Mi - tapping$$, $$tapping$$, $$audio/guitarra/tapping_mi.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '31294dfb-0b71-41ca-b00c-58b0a435660c', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '319183b1-6012-472f-96f5-f557b855a2b0', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Staccato rápido - staccato$$, $$staccato$$, $$/audio/flauta/staccato_rapido.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '31964f59-9e77-4f33-853c-ef78aba9da45', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '31ba32f3-ac74-4181-8e1b-a9877fddd926', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '31dacb0b-b255-4ff7-a762-e5b671a1a5c1', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '31e3c3ec-4fb4-4393-899c-51102a180c6f', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '32afd36b-3e6a-43ff-83b8-5127da3d8e1f', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '32bfe52a-84d0-4d35-8eed-f98230369d5c', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '32d71af4-977d-4b98-8aca-31149dc69005', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '32fc1103-f087-4f3d-9e33-15f53f24541e', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '33125cf1-ee3b-4064-a0b0-cd1c74621209', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '33e2fbe5-2fff-4050-aa76-95450ee056c2', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '34627740-674e-41c2-aef3-0a1e85d20af4', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '347af5b2-2488-417e-9d7b-8879e8491c20', '36040329-1aa6-428a-ad39-cd85de03493e', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3492d606-0f30-4891-940f-4bd460960c66', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '34bda868-fd72-45e3-8f59-a1841dfb6386', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '356f2de5-2f62-4fa9-a5b5-219ef48f8be6', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '358f4036-d988-4ddb-9447-469e984d63bf', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3614cb11-f416-4e15-9422-8208684bdda1', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '36913d07-1fb8-421f-8591-ada2f7505481', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '373775c8-604e-4fa8-b907-fdbfb99f9ece', '1b699036-0f72-4c48-9801-e01f6f25e165', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '374e8f72-e124-4a29-8b5c-d77a64b709f6', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3783752c-8817-42fc-8308-689ba998743f', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '37d11867-5262-4c0c-9f95-bada83daaacf', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3812c391-064b-4f16-ac91-d344b1a68845', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '38358152-766c-4b49-8948-160463cfeb77', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Lá - distortion$$, $$distortion$$, $$audio/guitarra/distortion.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3888c6cb-5c11-4802-860b-bb89793046dc', '56f643e0-a3e2-4067-84ac-334c454426f8', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '38ac0c1a-2a2d-4d8f-b57a-5f109332ff85', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '38c6f3d2-e210-4279-81bd-a3086f68e43e', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '38d106b2-eb4e-44b6-9ac1-867271d40e3f', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Dó agudo - registro agudo$$, $$registro agudo$$, $$/audio/clarinete/do_agudo.mp3$$, '2025-06-15 19:12:53.477248'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '39f539b1-680c-4b3b-8c16-c2f6834b2f59', '9a5e0eac-114e-4173-90af-32b55c870675', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a08d1e9-8b69-4f1d-bc5e-412e7097ed8c', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Escala Cromática - escala$$, $$escala$$, $$/audio/piano/escala_cromatica.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a1c8222-73c6-4404-b247-93f508dbaa4f', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3a295dcf-5a86-4c57-945d-2f049a3c3814', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3acaa337-0883-455d-bb5b-d6676ffa05a1', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3ace0991-cd26-4559-828e-d1f4b0423e78', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b0af408-5b79-471a-b07c-0fb51f2b0283', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Ré - chalumeau$$, $$chalumeau$$, $$/audio/clarinete/re_chalumeau.mp3$$, '2025-06-15 19:12:53.477248'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b2dd350-9e73-4d45-a778-f3f4fae1f932', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b86d576-3616-4247-a4bd-ae93b41fd45d', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Oitavas - forte$$, $$forte$$, $$/audio/piano/oitavas.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b8d31bd-c13a-4e31-8919-aa0c98c20ea2', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3b8e706a-d17c-4122-a6e2-a620943610da', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3bd19b89-7bad-4602-8629-9c55afe108a8', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3bf750c3-d656-4099-92e1-f96b177d59e5', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3c50500e-9ba5-462f-bebd-580cf52b799d', '509d6a26-159a-4976-aa46-83f914f930aa', $$Trinado - digitacao$$, $$digitacao$$, $$/audio/trompete/trinado.mp3$$, '2025-06-16 04:03:20.887442'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d0bc27b-7c10-468c-b68d-a7c6e15711f6', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d1d653a-f6e2-4182-96ce-be014c523b5a', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d1e2ce8-e271-4048-9dfd-3fb3a82b6339', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d33add8-5280-460e-864a-37ebd2358f18', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d54a4e3-f8af-410f-bc1b-2b203a595fff', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d7185fd-54e0-4555-8cc2-a5fe7f268891', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d7aae0a-01cc-4d0f-963f-0150d0c63c93', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3d8de99b-5c3f-47ce-9475-4aa4628a7d7c', '509d6a26-159a-4976-aa46-83f914f930aa', $$Dó agudo - respiracao$$, $$respiracao$$, $$/audio/trompete/do_agudo.mp3$$, '2025-06-16 04:03:20.887442'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3db3576e-45f6-499a-ac58-51856336cf8a', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Staccato pizzicato - digitacao$$, $$digitacao$$, $$/audio/contrabaixo/staccato.mp3$$, '2025-06-16 05:24:08.423464'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3e7182de-845e-432e-aea5-ac41b1e98688', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3e76a442-3bc5-492a-a1c0-79155b7bae99', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3ec07410-bebe-4657-8247-0cd1fee4a4a2', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3f8a0e35-6418-4a14-bdc0-9f7e5d4458de', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3fe3449f-a3ad-405c-9924-7e23343cc78a', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Mi - tenuto$$, $$tenuto$$, $$/audio/piano/mi_tenuto.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3ffb301d-90e8-45dc-9c59-15dbe1881389', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '401d0fca-2fed-4690-8c0d-1c3b397ccd07', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '40c12616-8ddd-485f-a128-1b7f545c1667', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '41059f9a-f03d-4d8d-99d6-9619a4b4f071', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4116430e-cda3-421e-852d-54d2017b563e', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '416bf369-7184-4a25-9d41-862fa6e2be19', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '416cdb4f-6fc0-4cc4-980c-3dac308a9c6c', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '424f1141-aed3-4386-bb22-766c0db5c9db', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '42b14e14-8317-43f4-a2ac-8682b5fca4ed', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Mi - clean_tone$$, $$clean_tone$$, $$audio/guitarra/clean_tone.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '42b4a34d-a7f1-490e-a239-2c50035102fb', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '42d88169-6e49-4bb2-b7f1-8f8edf4998b1', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '434b31dc-245a-4a52-bfaf-2becd2b0342b', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4376b928-33c5-47fc-88da-f53b7a9a6f3b', '9a5e0eac-114e-4173-90af-32b55c870675', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '448f3876-e95f-4eac-88d6-2c4337db31db', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4497e437-1ffc-448b-8c88-bc9f336534d2', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '44a6e0eb-d709-45ee-bde1-b03f3ed0f419', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Ré - crescendo$$, $$crescendo$$, $$audio/violino/crescendo.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '44a705ea-c486-4701-ad40-f04892d57bba', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '44c91e37-2e1e-4ebe-a6ec-5befbc1e9d39', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4563abf2-5229-494e-8c22-60c6913bcf07', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '456cbe63-5410-47a9-83a4-c8796caf0789', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '45b798ed-af1e-4d81-ae5a-0b65c8aef509', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '45bb3340-b262-4750-b434-dd6dc7eb4e82', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '45f6d76f-e5a8-4a79-90f8-2f795962b484', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '45f87a3e-4c16-4258-9ff1-6cf798922c39', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Si - staccato$$, $$staccato$$, $$/audio/saxofone/si_staccato.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '463f478d-ed2c-47e9-b018-7d642a2aa952', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '466a4d84-a6f8-4283-bb8f-2ed98fb04f72', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '46966df0-47f7-4d83-97a8-dfa4f4f29c43', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '46e26b39-82bf-43d2-a471-7ea34bac22d8', '36040329-1aa6-428a-ad39-cd85de03493e', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '46ff7b21-fe31-4b5b-a3f6-23d7427c8a0c', '6925f61b-ba48-473a-b69a-e3548036c1df', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4752cf39-65ff-455c-910c-7d8648255c52', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '475bf550-f7c4-4a4a-af5a-9d1e889333b0', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '47af3b1f-9264-445a-ab84-25138cf165c7', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4892afd6-13b6-4907-929e-368a63d96263', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '48e26840-b7d6-4552-99e3-d6f8a2424f7a', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '48e3b9eb-2fa3-49eb-81f6-1463b49182cc', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '48ff4ff1-1b29-46dd-a240-6310dc242ef5', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Lá - digitacao$$, $$digitacao$$, $$/audio/contrabaixo/la_basico.mp3$$, '2025-06-16 05:24:08.423464'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '492078d6-d728-41cc-acf7-2a49b8b3c84e', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '498c0d4c-5bfc-4033-9c83-9510de3f8373', '56f643e0-a3e2-4067-84ac-334c454426f8', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4a19802a-c5c9-45ad-8722-52e463051fa0', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4a81e076-afcd-4884-bf06-efb506bd2053', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4a8a00b0-daaf-44b9-a012-b533e7da5012', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4b005375-2101-48fd-ad1c-35c8ab1fa25d', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Lá - corda solta$$, $$corda solta$$, $$audio/violino/corda_la.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4bb54624-6c09-47bc-9ff4-fe0661fb3f16', '9a5e0eac-114e-4173-90af-32b55c870675', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4bc64199-834c-49b2-aa20-ec82d5324967', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4bd4483f-a36a-4750-b984-2e92afce389f', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4bd700cd-9ea0-4dd9-bfc2-bc4a586240d6', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4c11ef48-7f00-41be-a764-96307befd7dd', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4c221e9f-24fd-457f-919d-5769b2974f48', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Ré - digitacao$$, $$digitacao$$, $$/audio/baixo/re_basico.mp3$$, '2025-06-16 04:35:35.662045'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4c976c82-ad58-47ee-a692-626142e40022', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Lá - pizzicato$$, $$pizzicato$$, $$/audio/violao/la_pizzicato.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4cb0d28e-791d-4b1d-8d77-b2326b0017a7', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4d01da26-e205-4a8e-af5b-17a81fdbe4ea', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4d6513aa-f444-4f32-8142-1d4623f62253', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Lá - corda solta$$, $$corda solta$$, $$audio/guitarra/corda_la.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4d7c4dd5-265a-4357-b242-02ad6b0a34da', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4dd48135-ac02-4a0f-997e-07679b4ce848', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4e1b9713-17e2-4c06-b821-77a73b2c22e7', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Si - staccato$$, $$staccato$$, $$/audio/teclado/si_staccato.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4e43b157-18f9-4279-aca2-15fde3ed5709', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4e44ea32-51c3-4a9f-b519-f3b374cbfe54', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4e53d9f8-816a-401a-9ec7-d88dc2cd7807', '32705505-7727-4d27-b7bd-b08e7c90c233', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4e5f99cf-0863-474e-a567-5cc4ec1535b0', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4e6dbb00-aba1-4375-ba0e-baee9511ded2', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Ré - corda solta$$, $$corda solta$$, $$audio/violino/corda_re.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ea85a1f-601b-420d-9e1c-53961f6b6e68', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4eb57f21-94a9-4e60-8619-ce9090a6688b', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Harmônico - harmonico$$, $$harmonico$$, $$/audio/clarinete/harmonico.mp3$$, '2025-06-15 19:12:53.477248'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ec4ea52-6dd3-4b6c-9262-f72b453cc424', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$F3 - Arco$$, $$Arco$$, $$media/viola/sons/viola-04.mp3$$, '2025-09-22 12:05:51.549452'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4ee8bdfa-1cea-4d2e-9b52-bd520437f104', '9a5e0eac-114e-4173-90af-32b55c870675', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4f624fa3-a4a0-41a2-8b9d-c65895ca7023', '509d6a26-159a-4976-aa46-83f914f930aa', $$Mi - respiracao$$, $$respiracao$$, $$/audio/trompete/mi_basico.mp3$$, '2025-06-16 04:03:20.887442'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4fd78627-0350-4c20-a3f8-8e7390d48c78', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4feee147-babd-4922-afd5-b27279f6b3e8', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Lá - acorde duplo$$, $$acorde duplo$$, $$audio/violino/acorde_la.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '500ccab2-aae4-47a6-896c-b46141caf109', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '501675a8-26fe-4c7a-baf0-ee5fca3e3662', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '50214a67-a0c7-4a3e-b93c-44f643e9c5da', '761a3318-9a5e-46f3-88f2-62159b96100c', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '50c4d08e-3a58-4d16-941f-1ff9a4c780e1', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '51907116-e2f0-4e7c-86a2-bc6e8ba44158', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '51ca67d2-b5b9-49a1-8688-604c9f00a281', '82052c70-0a9d-4d94-873e-3b402e032f55', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '51d7e175-d6c7-4712-a260-f721308018c8', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '52149c2c-eb93-484c-9653-cdf0aac04f3c', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '526e18d7-d96d-4c1a-a80c-5b787d712703', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Trinado - trinado$$, $$trinado$$, $$/audio/clarinete/trinado.mp3$$, '2025-06-15 19:12:53.477248'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '52849029-9322-410c-9c60-675c03578082', '9a5e0eac-114e-4173-90af-32b55c870675', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '52a25b2b-0537-4277-b3bf-3ce85c85c979', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '52fb7221-2d5b-4dc7-bda2-8d3385d16db6', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '53441c75-27e9-4bb2-bc8c-a0798bdccfa6', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '534bbdee-a909-408e-b56b-f498841f4edf', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Mi - corda solta$$, $$corda solta$$, $$audio/guitarra/corda_mi_grave.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '53dd2bea-e4b4-42c1-abad-04625b7ddd22', '36040329-1aa6-428a-ad39-cd85de03493e', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '541c2791-13b1-4e07-af07-24cf4849fecf', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '544e4a61-31c6-490e-a4a4-131c9025397f', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '547e5d8f-c568-482f-9ce1-2da30e193c81', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550001', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Dó - bumbo basico$$, $$bumbo basico$$, $$audio/bateria/bumbo_basico.mp3$$, '2025-06-09 02:51:42.663465'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550002', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Ré - caixa basica$$, $$caixa basica$$, $$audio/bateria/caixa_basica.mp3$$, '2025-06-09 02:51:42.663465'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550003', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Fá# - chimbal fechado$$, $$chimbal fechado$$, $$audio/bateria/hihat_fechado.mp3$$, '2025-06-09 02:51:42.663465'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550004', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Lá - ride basico$$, $$ride basico$$, $$audio/bateria/ride_basico.mp3$$, '2025-06-09 02:51:42.663465'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550005', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Sol - tom agudo$$, $$tom agudo$$, $$audio/bateria/tom_agudo.mp3$$, '2025-06-09 02:51:42.663465'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550006', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Si - crash cymbal$$, $$crash cymbal$$, $$audio/bateria/crash_cymbal.mp3$$, '2025-06-09 02:51:42.663465'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550007', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Ré - tremolo$$, $$tremolo$$, $$audio/bateria/rulo_caixa.mp3$$, '2025-06-09 02:51:54.083899'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550008', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Fá# - chimbal splash$$, $$chimbal splash$$, $$audio/bateria/hihat_splash.mp3$$, '2025-06-09 02:51:54.083899'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550009', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Dó - bumbo duplo$$, $$bumbo duplo$$, $$audio/bateria/bumbo_duplo.mp3$$, '2025-06-09 02:51:54.083899'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550010', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Sol - arpejo$$, $$arpejo$$, $$audio/bateria/tom_fill.mp3$$, '2025-06-09 02:51:54.083899'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550011', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Lá - sustain$$, $$sustain$$, $$audio/bateria/ride_bell.mp3$$, '2025-06-09 02:51:54.083899'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550012', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Ré - pizzicato$$, $$pizzicato$$, $$audio/bateria/ghost_notes.mp3$$, '2025-06-09 02:52:04.071044'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550013', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Si - legato$$, $$legato$$, $$audio/bateria/crash_forte.mp3$$, '2025-06-09 02:52:04.071044'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550014', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Fá# - contemporaneo$$, $$contemporaneo$$, $$audio/bateria/vassourinha_jazz.mp3$$, '2025-06-09 02:52:04.071044'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '550e8400-e29b-41d4-a716-446655550015', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Ré - rasgueado$$, $$rasgueado$$, $$audio/bateria/paradiddle_groove.mp3$$, '2025-06-09 02:52:04.071044'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5556614e-ba98-4c4d-bbf0-c54bd211a271', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '555f58bd-03ab-4ddf-963b-3809c82a289a', '36040329-1aa6-428a-ad39-cd85de03493e', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5562943d-3cbf-41a9-a53d-0263acf003ab', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '55d966a3-aedb-4cf3-9e02-bb03b54f2e71', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '56c205d3-bb5a-4c8c-9634-3d16ed1aba1a', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '56dd1443-c37a-4d38-a47e-1ed97139b344', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Lá - corda solta$$, $$corda solta$$, $$/audio/violoncelo/la_corda_sol.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '56fc2c7d-81dd-4d47-b224-5899d7e3b4df', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Dó - acorde maior$$, $$acorde maior$$, $$audio/guitarra/acorde_do.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '574280bb-2d03-455c-81d9-f78c06c01da8', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '576287db-253c-4151-9db8-d3a67e73365f', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '57e17ecb-c20c-404d-ad42-1cc13e414483', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '58310312-1452-47b5-92c4-473b4a17d1a5', '9a5e0eac-114e-4173-90af-32b55c870675', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '588e9560-06fc-4485-b8c9-97a63927224c', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '58d7b263-0032-4660-a5ad-90d6dbd1431f', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '58da4e4a-d6b9-43a9-acdd-19879c64e4c7', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '58e0515e-586c-4e0d-92f6-c077825bed01', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '59422cb2-e799-4a58-b987-e97c109820a1', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '598b19fb-52d0-4388-bf39-a72742f84fef', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '599424d7-5a99-409d-8382-128f304d017d', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '59df1ee1-a103-4c51-9221-090d7a5bfe2a', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a1a115d-2bcf-426e-8a81-868067353958', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a2911cd-b370-4d22-b1a4-ba52568ebec2', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Mi - corda solta$$, $$corda solta$$, $$audio/violino/corda_mi.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a3e3c26-a1e6-4372-862d-ff44a22073a5', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5a713408-e042-49e2-be30-d40ba1d53cdd', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Fá - legato$$, $$legato$$, $$/audio/saxofone/fa_legato.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ab93d38-a89d-4ad5-97a1-37e245b07f2a', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$E3 - Pizzicato$$, $$Pizzicato$$, $$media/viola/sons/viola-03.mp3$$, '2025-09-22 12:05:51.549452'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ac30788-cab2-45a3-9e4c-b54304d99780', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ad9a9b1-2015-4b19-8a11-3727dca73170', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5addbf16-d6a7-49e3-bd69-cd1b544a6f57', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5b1ebb15-83dd-4eeb-8e15-55a491c64a9c', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Sol - spiccato$$, $$spiccato$$, $$/audio/violoncelo/sol_spiccato.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5b3544e1-b4b5-4cbe-b1c2-f2e9de7ec569', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5bb2948e-4cd4-4c61-ad3b-049614cfb2d1', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Harmônico natural - harmonicos$$, $$harmonicos$$, $$/audio/oboe/harmonico.mp3$$, '2025-06-20 05:13:31.357328'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5bfee545-02b2-45a1-a44a-9dbbfbaf2dc1', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c6845cb-f8ac-4c0b-946f-906f1ef50ecc', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c6aa98f-8823-4e4c-a835-29c3d212e941', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Dó - respiracao$$, $$respiracao$$, $$/audio/saxofone/do_basico.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c6b6fd0-4a47-464c-bec5-43ba7a306232', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ca123df-f8cd-48ac-a1ff-e84a2a3eade1', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ca2059c-8fb7-48d5-a5e0-bc49f443f9bc', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5cb2d1f9-cbd6-4884-8508-a9292a82b927', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5cb67b80-6b1d-43a1-98fe-c2066f3ae7a6', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5cced1d7-aaeb-42ab-a8d7-22f41d1d1e0a', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5d06985f-93d9-497a-ba3d-4eae1eaa5223', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5dc3c7cd-521c-45cc-9eb5-65a74b63489d', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5e0df5ca-a147-4d97-94a3-ea7af4267595', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Dó agudo - respiracao$$, $$respiracao$$, $$/audio/saxofone/do_agudo.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5e70889c-f035-444b-a86f-678ab99a1c77', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5edd6528-9862-4bf9-856f-ed78defd2d36', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5edf2b89-2b02-4bf1-8552-1f77e8968695', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Escala de Dó - digitacao$$, $$digitacao$$, $$/audio/trombone/escala_do.mp3$$, '2025-06-20 13:42:25.385612'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5f1f4aa4-884b-4a54-bfaa-6624df650b47', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5f209fef-2620-4cff-9262-1b4f399d955f', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5f324706-b697-43cf-97f0-ba0daf725275', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5f6be1d6-07c1-4d85-9378-7c97bdb460d4', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5fd22cb7-f379-4c8a-ae9b-9f189ba1e779', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5fd5b0a9-687f-4fe0-a782-ceb8456001d9', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '603de8ec-aba8-43f8-afdf-27c54df7609b', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6050a4d7-68a8-41fb-99be-f8ad2d5c7152', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6082a284-0f47-437c-886e-ea7c733e58cb', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '612b9fdb-f17c-410c-a650-03f471a79fe7', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6157278f-8069-4394-bd90-67e1a994d88d', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6197d491-06ff-47bf-a0b3-b67c36309a57', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61b9c27b-f769-44a4-86a5-87426a696376', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61c15841-d960-4264-b7ad-a8e786220376', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61d0ab77-498b-4f9d-b5e9-35564a18d0f0', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61dda861-ea24-4295-8b24-76d7b494b1f2', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Acorde Dó Maior - arpejo$$, $$arpejo$$, $$/audio/piano/acorde_do_maior.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '62132966-2143-48f2-9ddf-dbaf92fbe493', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6252316d-a2be-4ad6-95f5-8b7bd9a711af', '9a5e0eac-114e-4173-90af-32b55c870675', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6298eca4-617f-4497-ad27-31982f84fdbb', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Lá - vibrato$$, $$vibrato$$, $$audio/violino/vibrato.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '632e2909-1ac7-45be-857a-e80f39222733', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '63640baf-1c7b-44ea-98a8-e83fc35c4be5', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Harmônico - harmonicos$$, $$harmonicos$$, $$/audio/saxofone/harmonico.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '64a80493-b6b8-4126-b498-37b4425dd3b4', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '64bb24d7-9889-42df-ba75-bdafca081d07', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$D3 - Arco$$, $$Arco$$, $$media/viola/sons/viola-02.mp3$$, '2025-09-22 12:05:51.549452'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '651ba8bd-ea5b-45ae-a0d9-8dd02e509725', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '652f39db-532d-40e3-91f4-61753a4eb277', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6563c121-746d-4e1a-bd75-dde2df0e9a77', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '658ff7fd-ace0-4af5-a2ac-e682f263c49b', '509d6a26-159a-4976-aa46-83f914f930aa', $$Fá - legato$$, $$legato$$, $$/audio/trompete/fa_legato.mp3$$, '2025-06-16 04:03:20.887442'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '659a2089-d5c3-4a8b-ab1e-332e78615785', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '65a343fb-56b1-4f1e-a614-5caf4027b359', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '65cfbb85-728d-4a36-bbf4-ff3799223e1e', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6655fcf8-af92-4531-a295-20eb99d888e2', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '66c16a03-0e24-459a-a9c1-6924ce71b711', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '66ed9abe-7ea5-4220-8dea-917f0bcb1b7f', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '677e6174-b9aa-4e7d-8bc5-69bf9d5eae0f', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '67c972b9-1539-43c1-8060-41a5a5028b1a', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6804625c-2c51-4506-ae20-d58d09090d27', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6808903f-9000-420c-bf42-c316862b03e7', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '683a1df9-4ea3-4df3-963f-c886015729c2', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '68a1c2ef-c1ea-4bfc-ac78-a552879bcfd5', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '68e09700-3b1f-4562-abb8-2978a24030d7', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '68e670d3-fd57-4983-85a7-1c3a1f3458cb', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6976aef5-c7e2-46fa-bb09-491b1938424e', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Dó - chalumeau$$, $$chalumeau$$, $$/audio/clarinete/do_chalumeau.mp3$$, '2025-06-15 19:09:37.626968'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '69b67006-37f0-4996-a270-57abc50411c4', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6a12684a-129d-4bc7-a2fa-2e2dffd96b15', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6a378b15-b8e4-4062-89b9-e0092e1ba602', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6a7adfa7-65fe-49cb-a572-f135f3ab2592', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6b3d3ceb-a489-43f2-9b59-25128c6cfa04', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6b72d029-4e8e-452e-881a-f9f326852eb3', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Ré - staccato$$, $$staccato$$, $$/audio/piano/re_staccato.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6ba82f29-e113-497d-a308-af5f1032de30', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6bb8b7c5-8594-4e9e-8ae7-76be81939d43', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6bf54780-75f4-47e7-8b8c-d27a79bd0486', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6c88fe32-23f6-41ea-bb21-ef2c3d20d0cf', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Acorde Diminuto - acorde$$, $$acorde$$, $$/audio/piano/acorde_diminuto.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6cab7094-0a88-451e-b85e-98720967bd6c', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6ccad375-5717-48cb-94d7-88decfa2bcfd', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6ce0acf3-19e2-4829-8775-a92c8b537e20', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6d718d2c-483a-4476-ab82-a128114aca28', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Lá - staccato$$, $$staccato$$, $$/audio/saxofone/la_staccato.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6de82a88-ee00-41e0-b784-ea6219b244a7', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6e33b558-fc50-44e3-81ac-4a5c46771859', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6e56a905-295c-4a3f-b789-80cdb9aa21d3', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6e8d0f2a-d9cf-466c-a4bf-68542ff07ca9', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6eb0c051-b5fb-44f7-bd41-0cb60394d83a', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6eb60c59-3866-428a-8477-b7b43494ea8b', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Dinâmica expressiva - dinamica$$, $$dinamica$$, $$/audio/oboe/dinamica_expressiva.mp3$$, '2025-06-20 05:13:31.357328'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6eec1ecf-c63a-44a0-8fd3-370c6f1c36e3', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Ré agudo - registro agudo$$, $$registro agudo$$, $$/audio/flauta/re_agudo.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6f59ff59-674f-4a56-9a07-ca50992ff3cd', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6ffd21a8-f9e8-45a8-abf8-fc995cfdb17d', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7043d690-a33b-47b7-ab56-ed6357dd6f90', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '708f6b8c-8a55-41f0-87a4-e9c753ef7d87', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '70977635-0cec-41aa-a3ed-fa684ae0fc60', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '70e2736b-26b4-44d2-953d-9c2da5981abe', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '70eecb9f-f52f-4399-8a6e-2c0f0620eb50', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7119ee18-43fe-4651-9064-fcadaff08453', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '714c9dbb-26ae-4450-9e5c-6b02aca4758a', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71643349-1a4b-4fd3-8ea1-8d6485026eb5', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71701080-28aa-4174-b567-e0c81e0de5de', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71928288-800d-47cf-b269-7e92a6961eff', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Fá - acento$$, $$acento$$, $$/audio/piano/fa_acento.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71a55ffc-4788-4bb6-aed8-e7e72a98a87c', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Lá para afinação - digitacao$$, $$digitacao$$, $$/audio/oboe/la_afinacao.mp3$$, '2025-06-20 05:13:31.357328'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71b29de7-befa-4a9b-b1f2-c154af51eee2', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71bc3958-82e9-4a80-897e-6e05c98809cd', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '71f7b8e3-e21c-41f3-9e5c-3d615457281d', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7221b90d-b3bd-46ef-b576-637c94126159', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7222d8a7-1c02-48e0-b9c4-baa423293e18', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '722d8107-0561-47e1-a82a-53a428f83b00', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Escala Dó maior - digitacao$$, $$digitacao$$, $$/audio/teclado/escala_do.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '725df1d3-8d5c-4214-90bb-4ba68b6838f4', '36040329-1aa6-428a-ad39-cd85de03493e', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7289ca1d-2d46-41f6-afad-07737284e11f', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '72bca2a5-bc66-45a3-9ea8-93fcb4da0248', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$B3 - Arco$$, $$Arco$$, $$media/viola/sons/viola-07.mp3$$, '2025-09-22 12:05:51.549452'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '73355d3e-da01-4a1f-a3cd-b1a2c9f380e0', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7376f9ef-92ce-4b00-9819-b7da63096ef0', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '73dfb0d9-e745-451d-a446-2b5353161bae', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Glissando - glissando$$, $$glissando$$, $$/audio/clarinete/glissando.mp3$$, '2025-06-15 19:12:53.477248'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '740862b4-9361-479e-9566-37663b8c9898', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7433bca2-edcc-44b8-a143-fae3a7b5bd1c', '509d6a26-159a-4976-aa46-83f914f930aa', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '74676559-19e5-4eca-9c89-b40c154fe89e', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Mi - trinado$$, $$trinado$$, $$/audio/violoncelo/mi_trinado.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '747ff2d1-2d6f-40bd-9541-52d7f8b971be', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '74c236c8-ff3d-444c-b395-068d0e651920', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '74c300b3-35f7-43c3-a6f8-1bad319c8b98', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75983321-2341-4cbe-8470-54b1016f6c4c', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75a13f80-5ca4-468c-80d8-4c0dbdf8f708', '509d6a26-159a-4976-aa46-83f914f930aa', $$Lá - staccato$$, $$staccato$$, $$/audio/trompete/la_staccato.mp3$$, '2025-06-16 04:03:20.887442'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75c5e614-66b4-4a0b-9aba-166d1799b2de', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75cc725b-b897-4f0e-96ad-ee1603e28917', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Cluster - contemporaneo$$, $$contemporaneo$$, $$/audio/piano/cluster.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75d8dcc7-a621-464c-9afc-22c57dcb3f83', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75e5d455-ac72-4d6b-af82-3bcd0dc75cc9', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75ec1879-1962-4be2-817c-ebc6d397892d', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '75ee0025-8173-4b6d-9e72-e27f5aadae6e', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Acorde Em - acorde aberto$$, $$acorde aberto$$, $$/audio/violao/acorde_em.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '76c9d87e-3597-418f-b82d-432ddf81a028', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Escala de Dó - digitacao$$, $$digitacao$$, $$/audio/oboe/escala_do.mp3$$, '2025-06-20 05:13:31.357328'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '76dc2f97-45a4-41a1-9e5c-fd8205264b0b', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '76ef2d8a-928f-4fde-892c-8ac22beba45c', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '76f444a7-ad7c-431d-b685-8cc0b289cdf3', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Ornamentação barroca - ornamentacao$$, $$ornamentacao$$, $$/audio/oboe/ornamentacao_barroca.mp3$$, '2025-06-20 05:13:31.357328'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '76f5672d-10de-4e40-81ee-b4d10449c71e', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '772af735-9846-4d27-92ed-84d7b9d99710', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '774f8b97-f8bd-4a00-abe4-5439686bffc7', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '779d6689-1af2-474d-a88a-419a1ac7e478', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '77d7778c-714a-4e3f-a5ba-061ce1b659b8', '492f792b-8d0c-46b7-a195-c8c32114696d', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '77fc1295-5256-4199-baa3-7edbfa9a9362', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Pizzicato walking - digitacao$$, $$digitacao$$, $$/audio/contrabaixo/walking.mp3$$, '2025-06-16 05:24:08.423464'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7813a422-6a98-4e37-b918-a45421a9d58a', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '781f7c09-9015-4328-9eb5-432e76128f27', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '782fff45-42e8-49a6-b567-fbfd85e311e0', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '784844c1-948c-4e15-91e7-7a9bad28c10e', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '78f55759-357a-4041-ba16-6d9d227a6bb2', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '795860ba-866a-4de6-9387-6366af441ca1', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '796b6b60-fd57-4cfd-9063-6bfa0b302215', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Pedal Sustain - sustain$$, $$sustain$$, $$/audio/piano/pedal_sustain.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '79bdb07a-cf2e-41b0-b272-73ae0fd8f99f', '509d6a26-159a-4976-aa46-83f914f930aa', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '79e5f190-bfe6-4eed-a762-5df166c5958d', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7a203177-c875-4c43-996d-f280d5dd5a6b', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7a7683d6-10c9-41b3-b3f7-34c23657d0d2', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7a8275a5-3d6e-4ca6-846c-58daf41fcc6a', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Dó agudo - digitacao$$, $$digitacao$$, $$/audio/trombone/do_agudo.mp3$$, '2025-06-20 13:42:25.385612'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7a8d5869-a6eb-4c81-8b01-34d8c227706d', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7a9a4038-78d1-443e-bb3b-d9a9b7b955c7', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7aa6f3e5-37e4-4aca-a973-90d173e75ed9', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Dó agudo - registro agudo$$, $$registro agudo$$, $$/audio/flauta/do_agudo.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7af08f6a-ed82-4d06-9118-4fbaf6ce4ecb', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Sol - pizzicato$$, $$pizzicato$$, $$audio/violino/pizzicato.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7b13fc76-d75a-490d-addc-085f29169022', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$C4 - Pizzicato$$, $$Pizzicato$$, $$media/viola/sons/viola-08.mp3$$, '2025-09-22 12:05:51.549452'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7b7675cd-3453-4f36-b99e-84dada415f56', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Si - harmonico$$, $$harmonico$$, $$/audio/violoncelo/si_harmonico.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7b96c83e-fca6-4a13-8357-16a611eb811e', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Lá - corda solta$$, $$corda solta$$, $$/audio/violao/la_corda_solta.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7c241615-2534-40dc-ac33-49782a59a6df', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7c285235-b81a-4b44-bf3c-3ceb596f8f67', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Legato suave - legato$$, $$legato$$, $$/audio/flauta/legato_suave.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7c97e9e7-24b1-4753-937b-10916cec99b8', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Fá médio - digitacao$$, $$digitacao$$, $$/audio/fagote/fa_medio.mp3$$, '2025-06-20 02:38:53.825384'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7df8a2dc-d404-4651-a220-cf5142df9e02', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7e4c62f8-6b75-4f49-bf06-88d2b887bc5c', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7e5db4e4-5583-4d26-8cee-ed0f52f5d688', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7ea19d88-0df6-4fe0-a832-d64927d7b804', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7ed8251a-e422-4b60-803e-494f4dae89f9', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Si - tremolo$$, $$tremolo$$, $$/audio/piano/si_tremolo.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7eda8a46-a775-4525-9c38-7cede4d05358', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Arco grave - arco$$, $$arco$$, $$/audio/contrabaixo/arco_grave.mp3$$, '2025-06-16 05:24:08.423464'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7f1fedda-8dca-427a-8b02-c8fe455de2d6', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7f4b7e44-f178-41dd-aeac-afe556d860a8', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Ré - staccato$$, $$staccato$$, $$/audio/violoncelo/re_staccato.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7f4e9608-0a8f-4fbb-be6e-91fe6eac5132', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Glissando - glissando$$, $$glissando$$, $$/audio/flauta/glissando.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7f598aff-6da5-4384-8409-b5a73b74c234', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7f9f5f74-8836-470a-9ef9-ac4c8ee13f8e', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7fcce4d3-3745-46c1-b60d-bc38d152695e', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7ff0eef9-132c-41e8-90c5-cf5197dc44bd', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '80f2e219-5530-421a-b51e-af9418f58ad6', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '81392cfc-9dae-4c50-a1b6-1e1e50011993', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '820719f7-7f80-45c0-86df-838f97d7fc5a', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '822287b2-642a-4d90-a916-7dc5534b8f2f', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '82674e9c-e29f-4f7f-aa48-d60ae8f57c69', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '826e1e9f-70d7-48f2-a3f4-a19e799c37f2', '82052c70-0a9d-4d94-873e-3b402e032f55', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '82865c14-c96c-4a23-986b-fe75c2042b0e', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '82e6c359-96f4-4f3a-9c1c-3cfd715e992a', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '82f4ac44-ea4a-4337-939e-4b3cd495d289', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Staccato curto - articulacao$$, $$articulacao$$, $$/audio/trombone/staccato_curto.mp3$$, '2025-06-20 13:42:25.385612'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '82fe809e-3d4f-43d3-9a79-3ce2188b79e6', '761a3318-9a5e-46f3-88f2-62159b96100c', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '83e1b1d0-8bbe-4cc6-adfa-57d158cff850', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Mi - arco longo$$, $$arco longo$$, $$audio/violino/pianissimo.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '83e2b5eb-b277-4f78-bec6-61bc46e2703a', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '83e91f27-fdad-4eb5-80df-74ce49b0981d', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '83efd542-5f84-4de4-9809-5c9d902a2f83', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Dó agudo - digitacao$$, $$digitacao$$, $$/audio/teclado/do_agudo.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8442858c-e690-4884-9043-041adf682ede', '509d6a26-159a-4976-aa46-83f914f930aa', $$Dó - respiracao$$, $$respiracao$$, $$/audio/trompete/do_basico.mp3$$, '2025-06-16 04:03:20.887442'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '84537415-4bc9-4e2c-b209-be5b41423423', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '84acf597-b2c3-42eb-ae38-18a8f136c0b4', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '84ee5917-46ce-47a0-ae3d-7120ab774277', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '84ff4f27-c334-4773-9fd9-49fcb81d20a3', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '850ff953-6baa-4969-8aa9-fc9184809949', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '855d10e2-a5c4-4925-9c01-fbc793664ee1', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Sol - registro médio$$, $$registro médio$$, $$/audio/clarinete/sol_registro_medio.mp3$$, '2025-06-15 18:40:26.900899'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '857844b2-a99a-4f6b-ac25-398bf4538a7f', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '85cec875-ff9f-49b8-af5e-cd04fc8f6e4a', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '85e90a6c-9ca1-4ece-b042-5add92fc8f71', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86149584-3586-4385-94bb-78c3e77b275d', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86398c3f-b03c-4a4b-82b2-90b054f20687', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8674aa61-b02b-4dd0-bf3a-4f88b47b5b1d', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86792bf5-fc64-4d30-8062-5f3b7023be3a', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Lá - staccato$$, $$staccato$$, $$/audio/flauta/la_staccato.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86cc0268-5e6f-47a8-b4c3-d7f04622f77e', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Sol agudo - digitacao$$, $$digitacao$$, $$/audio/oboe/sol_agudo.mp3$$, '2025-06-20 05:13:31.357328'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86f1bfb7-072b-47a6-b633-3b2aa805fc72', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '87f2134a-8192-4c04-aa87-d36bb2feff04', '509d6a26-159a-4976-aa46-83f914f930aa', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8828f1cd-7a31-4fdd-b227-dbc27bb38dde', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Sol - overdrive$$, $$overdrive$$, $$audio/guitarra/overdrive.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '88418d0b-b775-4975-be9c-bd6112755b01', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '88503882-0504-4992-9e16-fc5326c13c6d', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '885a6f09-6591-4a82-8872-ad99aeb1ab96', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '88667018-98c9-453e-8261-5eeeab763657', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '88b7230b-5eb2-485b-94bb-1892c56397cf', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '891c782e-06be-49b5-a1a6-6a459005e695', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8959aff7-41da-49a7-bd9e-cf1e4ad2ab25', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '895d48e9-4bb8-4e4e-973b-36097e3f6055', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '897f7a1a-f60e-45b2-ad88-bfc3198b4d46', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Dó - glissando$$, $$glissando$$, $$/audio/violoncelo/do_glissando.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '898d427d-0d2b-4ef8-a78d-027312494ed1', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '89abdef4-6ada-4933-9594-761700895d6c', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8a5eef12-9ea4-4906-97c7-c548ffc5da0b', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8a7c4218-d1a8-4345-8e8f-8f8387a00bdb', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8b19883e-bcd6-4a3c-8113-7ecba85df416', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8b66be73-42e4-4620-9599-191863929cd1', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8bc0a0ca-9a60-40ea-93b3-734caed3048c', '761a3318-9a5e-46f3-88f2-62159b96100c', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8c198910-ac4a-45b3-bfe6-ff833c5b6d37', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8c2535bf-76c9-4308-bc46-935328e21a52', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Articulação rápida - articulacao$$, $$articulacao$$, $$/audio/fagote/articulacao_rapida.mp3$$, '2025-06-20 02:38:53.825384'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8c71d2a2-7667-4186-96b1-3524a8722a29', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8d3026b2-55ed-45ca-b249-82bb194e6a5d', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8d3cc35a-194e-45a0-a2d6-97036ea20636', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8e06ad9d-c139-4928-929c-2e3631695a06', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Sol - agudo$$, $$agudo$$, $$/audio/clarinete/sol_agudo.mp3$$, '2025-06-15 19:09:37.626968'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8e187a13-fb9d-4637-b260-98926fb2ba1a', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8ea06442-70b5-478c-bb82-8acde440fab9', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8f49c187-c435-40f3-82aa-a98eb85e6242', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8f4c52cb-9d04-400b-8610-2c89f468c10c', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8f51e44d-c021-4324-8e28-cff32f153d0a', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8f617dca-330e-48c3-bb22-b0a00ea466b9', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Fá - pizzicato$$, $$pizzicato$$, $$/audio/violoncelo/fa_pizzicato.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8f7f254f-335e-4b39-ac66-f0cfb633176a', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Dó - corda solta$$, $$corda solta$$, $$/audio/flauta/do_basico.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8f811c16-5f16-4565-9775-75ee59cd949a', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8fa0ad65-4f1c-40be-b7a4-958b9d3e2d63', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Mi - corda solta agudo$$, $$corda solta agudo$$, $$/audio/violao/mi_agudo_corda_solta.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8fb257bd-741d-4bbf-ab90-5b3dfb4fefbd', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9005b91c-1b07-4be7-8500-e02681a58e6e', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '900cc506-5a6b-42f3-8d00-0192d129db7b', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9034b235-5311-410e-b118-7f8b580049b8', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Harmônico natural - harmonicos$$, $$harmonicos$$, $$/audio/baixo/harmonico.mp3$$, '2025-06-16 04:35:35.662045'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '906b9a44-4fa8-4f6f-b316-aa50fa5ec3dc', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '90b1dfc1-f92d-445e-a0bb-47d26e8ee8c9', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '90fc39a5-e1fe-4cf2-9025-00b1c604b75c', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91220a75-e5b2-4e75-9231-2825aa85b90e', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Glissando curto - glissando$$, $$glissando$$, $$/audio/trombone/glissando_curto.mp3$$, '2025-06-20 13:42:25.385612'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '915ddb16-38e2-41be-a8e9-9a6b1a2ebdcf', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91a195ee-4ce8-4d85-9f41-b6976b5a56d7', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91f47fa9-48ff-45e6-842c-ef975dd4891f', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91feaf27-0e48-4c70-b83c-0963d3f15802', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Legato médio - legato$$, $$legato$$, $$/audio/fagote/legato_medio.mp3$$, '2025-06-20 02:38:53.825384'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '92a6ce34-d546-46b7-90fb-f58820368d2b', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '92ccd49d-c9b5-4d30-8f02-5dd748d80c81', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '93b247de-0aaa-4f69-89b6-3c2a98b3b886', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '93e1f32c-c942-4e24-847a-5c9ffd2d5e82', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '94210626-9d55-403d-a8f9-f158a6778c9b', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9477857e-a020-4535-a6f1-e2bf8c04b9f4', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '94c498d3-7e17-443f-87f8-43b22dad8f55', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Dó - dedilhado$$, $$dedilhado$$, $$/audio/violao/do_dedilhado.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9575f78e-1063-4cb1-bd7e-b1cccdf63459', '509d6a26-159a-4976-aa46-83f914f930aa', $$Si - staccato$$, $$staccato$$, $$/audio/trompete/si_staccato.mp3$$, '2025-06-16 04:03:20.887442'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '95a2bc51-e9cf-44e5-b45f-5ff07050f6a4', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '969ce06b-a2ec-45f2-af70-55976ea2acdf', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '96b15ab0-91d3-4c7e-843b-b1e3edd2094f', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Mi - staccato$$, $$staccato$$, $$audio/violino/staccato.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '96d60a7c-764d-4a68-bf88-ff538ea50618', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '974f3f83-9d3d-4972-b370-5693571957fe', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '97713d21-414a-46f4-b0a6-d66160de5767', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '97c4880e-8235-4206-9e95-2032244b4651', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Legato suave - legato$$, $$legato$$, $$/audio/oboe/legato_suave.mp3$$, '2025-06-20 05:13:31.357328'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '97c69c5d-e57d-44d6-9624-89823a2f2b5b', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '97cce701-e027-4873-990f-6b17fd852477', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '97f71817-205e-4b64-9af9-6d4ea214b870', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '983a2a13-d011-4dbc-9b20-27f1ef6cc7b0', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Si bemol grave - digitacao$$, $$digitacao$$, $$/audio/trombone/si_bemol_grave.mp3$$, '2025-06-20 13:42:25.385612'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '986540fb-07f1-49b7-81d7-66e0c299215e', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Harmônico - harmonico$$, $$harmonico$$, $$/audio/flauta/harmonico.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '992a346e-cb64-45d9-bcc1-0ec6ecc9cb60', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Legato suave - legato$$, $$legato$$, $$/audio/trombone/legato_suave.mp3$$, '2025-06-20 13:42:25.385612'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9961c3c6-5dec-4168-afce-066b9d2aec17', '6925f61b-ba48-473a-b69a-e3548036c1df', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '99a0b835-af50-4f30-bb3f-31bbc2f36214', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Groove funk - slap$$, $$slap$$, $$/audio/baixo/groove_funk.mp3$$, '2025-06-16 04:35:35.662045'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9a0d0b9d-056d-4bf7-998d-4521cb5db1e8', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9a4cc844-e384-48da-aa70-07fe4ae0407a', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Ré - legato$$, $$legato$$, $$audio/violino/legato.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9a6e5da0-114e-42e4-b4b5-f3cb61328ec9', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9a6f0cd0-06c7-4caf-8ff6-df88f20bd44a', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9ab871cd-9dad-4299-a186-2900ba8be957', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9ae6f21b-3bcc-4c0a-816a-baefe3e3e6eb', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9af6c7e2-9825-43ba-afc3-5047d106519b', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9b77169f-1494-4a01-b971-bb8760b2f262', '32705505-7727-4d27-b7bd-b08e7c90c233', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9bde764b-9b74-4080-8388-5be81b7957f2', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Lá - digitacao$$, $$digitacao$$, $$/audio/baixo/la_basico.mp3$$, '2025-06-16 04:35:35.662045'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9c1ff51d-824a-4bbc-ade0-098e170605b0', '32705505-7727-4d27-b7bd-b08e7c90c233', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9c462fe6-9f96-495d-ab3a-bbdf013772e8', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9c93e5c8-c98f-4931-97db-702bfe043ab0', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9cb64eef-5503-4b75-be4a-2a6417fcf0ce', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9cca92af-79da-45ea-a39b-3f013a757858', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9cf2387a-a705-4aab-afb3-575ac1cdf93c', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Ré - palm_mute$$, $$palm_mute$$, $$audio/guitarra/palm_mute.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9d36f045-c8c8-45d6-b1e6-27c096770c1c', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9d65e586-725e-4688-918e-2df4294bd655', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Sol - digitacao$$, $$digitacao$$, $$/audio/baixo/sol_basico.mp3$$, '2025-06-16 04:35:35.662045'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9d74980a-9748-42fe-8826-a6a3a1723d15', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9d80fbb0-f3c2-460b-94af-46df5d188130', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9dd087d6-76fc-41c1-8ffc-fcc3f6f82ea8', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9e812225-f274-4fa2-8062-6a05dc36021b', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9f1d0464-e25c-41c7-90db-b977e1fb30d8', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Sol - sforzando$$, $$sforzando$$, $$audio/violino/sforzando.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9f21e323-abbf-497b-bf9a-f475cf82a667', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9f71dd4e-b94c-46c4-9037-d0dd9544bd70', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9f8fb84b-0140-4279-a240-d3be387ae29a', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9fc2ffab-8dba-4394-b77d-d218ae637651', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Pop médio - slap$$, $$slap$$, $$/audio/baixo/pop_medio.mp3$$, '2025-06-16 04:35:35.662045'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9fdf5e4f-218c-40af-9880-4798dc414adc', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Láb - palm mute$$, $$palm mute$$, $$/audio/violao/lab_palm_mute.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a02fe9fb-7b92-49c9-8eed-5d1e079656dc', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0861bc8-2566-486b-9562-5e9c1ccad061', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Dó agudo - digitacao$$, $$digitacao$$, $$/audio/fagote/do_agudo.mp3$$, '2025-06-20 02:38:53.825384'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a098a6f4-dbeb-4dd7-a339-f13bbf063b67', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a09c4880-53d6-410e-a43d-66b69e569782', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0b0804f-5a7a-4133-a1a3-55133741f29b', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a1290c17-4ad4-48e9-ba7e-0b184722db90', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a1484428-d726-437a-accd-eeaffeb00f48', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a198539c-4315-496d-b16c-01f068ffc3fc', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a20fef7b-a4e7-4819-8b54-a3a2014a2465', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a2497791-0d25-4421-9c6a-6af46c436821', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a25fff5d-206a-4bca-bd11-650a2c283b26', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a281aa63-123c-46d6-849a-7b8c3187c7fd', '509d6a26-159a-4976-aa46-83f914f930aa', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a33089a5-b6c2-40e6-9427-7a26274742d1', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a3824b3a-190c-4e6b-b3bd-163fd00664c8', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a39bf957-c7e9-4fe6-89fa-09251b002a87', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a416d76b-e940-4812-91f7-9c52a6bdb7f2', '6925f61b-ba48-473a-b69a-e3548036c1df', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a46b53e2-59cd-4db9-a69d-ac23b024be2a', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a4a2cee0-0f85-4df5-a93f-77734603acd2', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a4ddff31-0fc5-4fb3-983a-09b180d5b9b4', '56f643e0-a3e2-4067-84ac-334c454426f8', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a50a1369-6610-4ed4-b7b7-64507e53a7e6', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a54f1e87-9b57-44fd-b0e1-31daea6d88b6', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Si - harmonicos$$, $$harmonicos$$, $$audio/guitarra/harmonicos.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a551ee48-4a54-4ce7-b57b-ac150df2a16f', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a58b9bae-ac06-4de0-922e-94d15c4b3e0f', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Ré - hammer_on$$, $$hammer_on$$, $$audio/guitarra/hammer_on.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a5950d08-5a8f-466f-b440-35c8758ce062', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a5d852b9-501f-43ac-bf9b-fc9d29e70168', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a5face86-8c52-40f6-bef6-2b31fb218ad7', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Dó - legato$$, $$legato$$, $$/audio/violoncelo/do_legato.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a60dc2fa-bdb4-45ff-9560-e9d5ea0d1f67', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a66be6f4-528b-4531-b433-c57e26da132a', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a6adc320-519c-4785-86d6-84e53a5dc901', '9a5e0eac-114e-4173-90af-32b55c870675', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a6f785e0-9bbe-4dd1-a9e4-3608d5071794', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a77fbbae-963e-45ab-927b-ceb1ecbc731b', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a78d85e8-0d47-48f5-8271-3454e537cf6f', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a79f15e2-6537-4cc7-9a84-022895b4e16c', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a7b255a7-b7a2-4eb7-a08a-d6a9381d0ceb', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a7f630f6-eb53-4132-9192-527abe5ff611', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a86a9525-3f14-4817-b9ef-93677c23471c', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a893593e-e4ed-4d58-b4d3-d927d7fd27f8', '36040329-1aa6-428a-ad39-cd85de03493e', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a8c9b99b-ff68-4070-bc7f-45d9aa90e0d7', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a8ce4b02-9d84-4481-af0a-6e8085dfd452', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Staccato rápido - staccato$$, $$staccato$$, $$/audio/saxofone/staccato_rapido.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a904ba68-3472-4d34-a4a1-5eaf0f3c1e6a', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a968eaea-c536-49c6-a4c3-c843fe0bbe2f', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Harmônico natural - harmonicos$$, $$harmonicos$$, $$/audio/contrabaixo/harmonico.mp3$$, '2025-06-16 05:24:08.423464'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa4edc9e-aa16-4e89-a825-d1364c67aeeb', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aa6dcffb-9f2c-4363-b394-33b4b949ae4b', '1b699036-0f72-4c48-9801-e01f6f25e165', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab043f66-a90b-48c2-a9a6-291d359d1ff4', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab273ffa-64ad-4917-b4b7-13c92292a788', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab70909d-0d8d-4782-b09c-8605fd6722e4', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac02e827-a8cc-4f1b-b862-eff873d8e3e5', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac578d86-df1d-4d02-8924-23ddfa917759', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac6ca73f-1a12-4661-951c-da664073be02', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Sol - legato$$, $$legato$$, $$/audio/teclado/sol_legato.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac7c4e00-c5c4-41cb-87a5-e0e06cd18261', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'acaee31f-46b2-4b8e-b47b-e5ac93b3a5e8', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'acc25b76-fe9f-4f81-9f80-ed7e5212b7e2', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Fá# - bend$$, $$bend$$, $$/audio/violao/fa_sustenido_bend.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ade3ff50-64cf-4c2e-8663-8eb7ee8e1e17', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ae12f024-8558-4911-a8c8-2e4c2a63310e', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ae27dfa3-61b1-4d3c-bf74-9edfd9b23705', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ae3af43d-2b18-4ddd-8ebb-293042cd5546', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'aeea4fd6-b50a-4a4c-99ba-2761d05133e8', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'af020779-8865-4875-941b-25e831663e7c', '492f792b-8d0c-46b7-a195-c8c32114696d', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'af2c85ee-4f00-454f-a5fc-890f5083f221', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b003bb56-79c9-4a3a-a6df-d735b0257b21', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Ré - chalumeau$$, $$chalumeau$$, $$/audio/clarinete/re_chalumeau.mp3$$, '2025-06-15 19:09:37.626968'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b02d1fac-f30f-4ac3-9db3-ef711024c5de', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b03028df-fc41-4d27-bb53-ca7beff3a0b3', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b03f1e66-6a57-43d1-ac7f-c8546d7003ef', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b08b6d5b-3648-4fef-869e-b5ed2752cabc', '36040329-1aa6-428a-ad39-cd85de03493e', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b0f0d885-58a3-46dd-b0f3-88acb0ff9743', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Harmônico natural - harmonicos$$, $$harmonicos$$, $$/audio/fagote/harmonico.mp3$$, '2025-06-20 02:38:53.825384'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b13f055e-67dc-481b-bcfb-5f66a56aacef', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b1aef5f6-0f33-43f9-8b5a-9de216f6ed2b', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b2872dd3-0091-4902-8704-718f7b76caf3', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b2982f71-2016-472c-9a63-5fb3d4c26065', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b2e723c3-f81c-43a1-93db-46dd1b9b4a58', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b307c442-a4c8-4865-80f8-3f647034f82a', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b38132a4-eb57-427e-8c4c-9f2f0386d10d', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b3dd3610-7044-4556-8b66-e942f1433568', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b40f5125-128d-4d56-88e7-ee06f7834bf6', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b48c3976-8e89-4419-a5c8-5f5d4f34d1eb', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Sol - corda solta$$, $$corda solta$$, $$/audio/violoncelo/sol_corda_sol.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b4b0f3aa-2393-41ec-9db4-70fcf23ae9c1', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b51ff1e3-156b-4776-a6a1-2fd7e3b9b7b7', '761a3318-9a5e-46f3-88f2-62159b96100c', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b582c51f-9a34-4336-b0c4-4b0382d912f4', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b59228a1-1802-4c4f-a81f-2a850f2dac14', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b5a351f8-3205-4843-806a-e1bbdeb74408', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Legato suave - legato$$, $$legato$$, $$/audio/saxofone/legato_suave.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b62f5be0-9271-40ae-bef0-7ea55ee7eb02', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b6887cc5-3700-4b69-ac3a-708dcecd7349', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b6abd496-77e5-49b5-b657-6851875bca18', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Si - staccato$$, $$staccato$$, $$/audio/flauta/si_staccato.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b6c0f00a-bad6-4e8b-bfb7-42b86ab18081', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b727c84a-a614-4908-9fe5-222c1543c4bd', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b73a6b65-96ee-421c-a3b3-9d7ab3d58109', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b77a4de4-d8f7-4679-b022-bc89ac6e910c', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b7e68a9b-f01d-4589-b2ea-1c7f35483655', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b81f675f-b762-41dc-a643-a6840127fbb2', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8580f2b-bd9d-4183-8856-a2e406fd2c98', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b923c2b1-7ff4-4c17-88f4-5f74d5c80c2a', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b951e855-c744-42bd-a836-60835a193cd2', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Dó - legato$$, $$legato$$, $$/audio/piano/do_legato.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b97f8bfa-cc30-4470-a46c-e3e579e38618', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b98241f2-4936-4c98-88c5-0c7b1e15b0ed', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b99af6ef-bec2-4e9e-989d-46ae12e61b9f', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b9b2c120-9e5e-479c-8a80-8b04927231ff', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b9f8e6e5-daab-4ff4-a6de-39e63dfcab75', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Ré - corda solta$$, $$corda solta$$, $$/audio/violao/re_corda_solta.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ba5053b1-19ab-45aa-86ec-da7ce0a57145', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ba589a0f-c60f-4345-8360-989e1ca3613b', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'baacb39d-7acc-4260-b181-4f5d4e44b5eb', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'babbc38b-6ae9-4b4d-aff2-a3fa20985e14', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bae7612e-fea9-4f97-8283-ee99d05868f4', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bba76ea8-656c-46a5-9f1f-b535c7a33a66', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bbbb4a06-58c5-497a-8235-b7806d5b7942', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bbc51d19-034c-43e7-aee1-f594196e0ecc', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bbca9a51-65f8-46c5-bcc6-01af9cff2648', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bbd6e157-2582-46cf-8e76-66a843e564ce', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc3e1deb-15f9-4d1d-9edf-e53cecc48e73', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bca0819c-7149-491b-b0a8-7c66467dd72d', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bd1a4f15-ded4-40f9-a74f-41b8d6663ed7', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bd3c450f-51c0-478b-b395-af60a86ebea3', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bd48152a-f887-41a8-8de8-cb5efb1b3f42', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Sol - legato$$, $$legato$$, $$/audio/flauta/sol_legato.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'be7f18f0-c5e0-4bcb-8f08-ba90974722d8', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'be8cf797-f14e-4f21-8e49-41bfd0cd4954', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'becddff5-60fb-44a9-ab07-04dc53a69b25', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Ré - respiracao$$, $$respiracao$$, $$/audio/saxofone/re_basico.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bfd0feb9-1468-4529-83b9-9a0f65cb7818', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c075793a-395d-4e66-a858-5adba491a27f', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c09d2d1a-ee2d-4a24-9a5d-3486e6f0736c', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c0c5e749-8352-4f47-b953-aca36ecfdb99', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Sol - harmonicos$$, $$harmonicos$$, $$audio/violino/harmonicos.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c0f0871c-e199-48d2-8e5e-3a132fac8da9', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c152b0f8-69c8-42ef-bfe8-69ea19fcba3b', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c188d3fb-7f06-49a3-a174-ab3330f925da', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c1b7c770-aa97-4ca1-8cc4-09e6fc2becdd', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c1c88048-7e5d-498d-92ad-f231e5f21148', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Arco agudo - arco$$, $$arco$$, $$/audio/contrabaixo/arco_agudo.mp3$$, '2025-06-16 05:24:08.423464'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c210bf29-895c-435d-b509-dae4f4619971', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c2708c08-184a-4f98-b97c-6925b3793f9e', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c289da7c-6d94-4082-a171-c832789b03d3', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c29d0199-a6a2-4ac1-865d-e7ee8042a4f7', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c30e8a5b-923d-46d7-8ac7-0190cc67ddd3', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c3dc7fec-00b3-4c84-9db1-5d61299ae09b', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Ré - digitacao$$, $$digitacao$$, $$/audio/teclado/re_basico.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c4113ded-20f5-48b0-8da5-169e6542b8ca', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c48b6bda-d7aa-4877-92d2-d1555e575dc8', '9a5e0eac-114e-4173-90af-32b55c870675', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c49d67d4-bddb-445b-b560-bc590ce9b4c2', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c4baf596-df60-4a5a-8886-0995ce484de5', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c4ce6e99-9cae-4fb6-a0e2-05f9b7ab9bea', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c4ed2dad-b3ca-4a90-b874-bc0bb4b94757', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c542db6d-3f7d-41fd-bc5f-a7b7f0e1b55a', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c571881e-2764-4c4b-a058-07a0233ee903', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c5b83888-bda9-464f-bada-5c65ae277e6e', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Lá - staccato$$, $$staccato$$, $$/audio/teclado/la_staccato.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c638fe03-8619-4eb8-8454-e0ed805b8743', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c66d2a0c-b60d-430d-8845-cbd2a310bb7a', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c674bc31-2831-47d4-bd67-9370190b0083', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c6a85603-7c99-4128-87ef-11955428904f', '9a5e0eac-114e-4173-90af-32b55c870675', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c6b3f57b-fd3e-44a3-9a8d-834043368be5', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c6edad48-1b47-4021-886c-f49d4a08c2b5', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c6f84880-62eb-4f8c-acd5-639ccca612ba', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c7178257-0a47-4252-a040-fb5da32c039c', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c748bbb2-4bbb-41d4-9bd7-5d0d9192570b', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c793c4bc-ee62-4818-ac47-c061c6950c6c', '36040329-1aa6-428a-ad39-cd85de03493e', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c794d94c-8043-424e-ae59-dd3978b977b4', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c7caaee4-bd5b-42e1-91eb-32959925328d', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c7d08a87-1fa0-456c-a8fc-fd64cabd9adc', '36040329-1aa6-428a-ad39-cd85de03493e', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c7fe94df-8e23-4c60-812b-5bc6c674ab32', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c80b0615-7f94-44f4-b57c-ef6156d577ce', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c84abb51-b044-46ce-8838-d32890a50ba2', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c86503a6-11e0-4b61-9b0b-ebdf2a5f33c6', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c896c2f0-f2dd-443a-9fdd-03584adea358', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c9733e25-be92-4948-bd0c-140cc0b5ff26', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c98628d3-d4e7-4207-80a8-b13f6600ee78', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c98c2493-13a6-42c1-911e-f9e541b51c07', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c9e1a8d0-0e1f-40b4-b16e-0166a1007098', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca0395b8-0d51-460a-9b12-3be5c0784337', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca1b33ef-c1f8-4211-8c6a-a91d7702eefc', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca53fcbc-d9b4-4d66-92cd-faa61b11ffde', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$C3 - Arco$$, $$Arco$$, $$media/viola/sons/viola-01.mp3$$, '2025-09-22 12:05:51.549452'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca6f2e28-f5a9-4b89-9565-3ae138f20383', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca71efc4-7e3f-4a2a-9215-9c09c9442638', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca78bb46-bd1c-4a70-bc6c-d2de1473ff53', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Fá - col legno$$, $$col legno$$, $$/audio/violoncelo/fa_col_legno.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ca7c5479-3a6b-4854-912c-6768f886e6a6', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'caaa4da8-251d-46c9-9aa9-c82e8d7dab4f', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'caeee6b2-aa13-4a72-a431-f6243c7835d4', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'caf93fa0-bd6f-45fa-aa48-0760d18e1ebf', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cbee256a-be0c-49d1-9761-78cdcf6d495f', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cc0f28bf-b8e2-461b-bbb0-5035b1bbeced', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cc0f41d1-5e1d-4b38-9d0e-941452cef176', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Glissando - glissando$$, $$glissando$$, $$/audio/saxofone/glissando.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cc1f51cf-da46-4004-92dc-153107f71e83', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cc67bd0c-dc35-4be3-9bc3-ee4ab47d574a', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ccc5f6a1-5dbf-4ddd-ae58-752cd1b8a12f', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Mi - chalumeau$$, $$chalumeau$$, $$/audio/clarinete/mi_chalumeau.mp3$$, '2025-06-15 18:40:26.900899'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ccea9060-7192-4a34-815b-f6e22fa7904e', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cd700af9-d43d-471c-b6df-0819e0c503e4', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Lá - bend$$, $$bend$$, $$audio/guitarra/bend_la.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cd74123e-e52c-4899-9c99-eeee92671a80', '32705505-7727-4d27-b7bd-b08e7c90c233', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ce1b4d94-b47a-48f9-bd84-b15d7c30ca58', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Lá - arco inteiro$$, $$arco inteiro$$, $$/audio/violoncelo/la_arco_inteiro.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ce7b5822-0cb6-4d36-b180-90cf5417e038', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ceb1b687-155c-4bc4-8104-e3eb9f7a3412', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cf9ab973-9b62-4011-af1c-4b15f5160ff9', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cffe7539-37d9-4673-a8f5-d00c82edd66d', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd00ac6e5-30c0-43ce-8c3c-42ecbabaac6a', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd0a3e818-b27a-4883-bfee-fe7bebc92ca3', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd180f369-01bc-4d07-b217-957671416fae', '56f643e0-a3e2-4067-84ac-334c454426f8', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1994a4a-6fca-4a6a-b188-ef4727b7cd1a', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1ccfd46-0a50-438b-83fb-e1349a7441a6', '509d6a26-159a-4976-aa46-83f914f930aa', $$Glissando - glissando$$, $$glissando$$, $$/audio/trompete/glissando.mp3$$, '2025-06-16 04:03:20.887442'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd1fb7bf0-f47c-4727-bd22-33f45812b480', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd21946c8-47a6-493f-9c28-e947d2ffdb6b', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd243f96c-5a74-4d2e-b828-d13ee8c75c37', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd247c449-548d-4121-95be-e9496f99eb34', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd2830d6e-a533-4246-baf8-2380e8ee1503', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd28be780-4784-49ae-a1eb-253a283bab78', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Dó - palheta simples$$, $$palheta simples$$, $$/audio/clarinete/do_palheta_simples.mp3$$, '2025-06-15 18:40:26.900899'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd2ebd528-0c29-4a17-bb86-8613870e7a9e', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd319630b-666e-43c3-909c-14d91ce756b8', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd3f88a28-636b-44ef-83d4-32d4f6ceca67', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd41be456-4730-4fbf-b0bf-49543b361255', '492f792b-8d0c-46b7-a195-c8c32114696d', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd47ca07c-4eee-4968-a8b0-d55a9507a3ba', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd47e7665-d373-487e-b397-33b046f77ef8', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd4d2ae72-0720-4be3-885e-1cbc269c4126', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd544446c-2ded-485d-acb7-35becf819fe4', '9a5e0eac-114e-4173-90af-32b55c870675', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd548b9c7-0cb1-4bf3-a91b-204c26a1d6bd', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$G3 - Pizzicato$$, $$Pizzicato$$, $$media/viola/sons/viola-05.mp3$$, '2025-09-22 12:05:51.549452'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd5d6c9fe-c657-4432-811d-c5f155b89302', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd6032a53-8693-43d6-ac4f-e1dccdee12e8', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd65324c3-deae-45fc-af2e-63f0494694f1', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd671aa7a-dd06-4ba4-9de6-aa38732de900', '36040329-1aa6-428a-ad39-cd85de03493e', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd6ac028f-25ca-4e98-8042-e40678a36022', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd73f269b-a2a9-4fed-86a7-2aa1892fd075', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd75c967a-1182-4c4e-b355-7929b021567d', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd78234aa-2d3b-4ce1-a52d-3fc8c0c4599a', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd7a6dd91-3ba0-4546-a684-331288046a0f', '32705505-7727-4d27-b7bd-b08e7c90c233', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd889f850-463a-46a6-a90e-c2c673a88b3d', '509d6a26-159a-4976-aa46-83f914f930aa', $$Sol - legato$$, $$legato$$, $$/audio/trompete/sol_legato.mp3$$, '2025-06-16 04:03:20.887442'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd934972f-f207-4f3b-8d15-e22bbaaa2151', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd977783c-6e04-43ec-8dad-674eec9fcad6', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd998b286-1105-4ee4-949b-946e6849f458', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Si - corda solta$$, $$corda solta$$, $$/audio/violao/si_corda_solta.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd9d5f6c5-9863-4840-9758-f47496efe82b', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd9fb1abe-b4b5-4ef6-9cac-2d9334ea0b2c', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd9ff37fa-7cb5-4f85-abb4-066cfe7e2ce3', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'da81a486-9109-42ec-8913-f72c4a00a4e0', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dad8b3cb-c818-486f-b947-8b7a0d7d803c', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db0fa756-7385-480b-a9f3-5cffdb2752e0', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db234f53-8387-4d4e-a9d3-14e7057bbf93', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db285c73-f9ed-48c0-9602-4b88cf1d32d8', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Ornamentação barroca - ornamentacao$$, $$ornamentacao$$, $$/audio/fagote/ornamentacao_barroca.mp3$$, '2025-06-20 02:38:53.825384'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db43ade4-2d9c-4c28-afa2-e7ae8d0696fd', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Dinâmica expressiva - dinamica$$, $$dinamica$$, $$/audio/trombone/dinamica_expressiva.mp3$$, '2025-06-20 13:42:25.385612'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'db442956-3b69-4ac6-957f-8f81563ebb99', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dbaf4fa5-af83-4272-8484-b8957b304000', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Sol - corda solta$$, $$corda solta$$, $$/audio/violao/sol_corda_solta.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dc4f66b2-2e35-432b-a29d-ffb4f6567fe3', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dcb3b6cb-2863-42ec-bad5-42f0baec7591', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Ré - rasgueado$$, $$rasgueado$$, $$/audio/violao/re_rasgueado.mp3$$, '2025-06-08 01:05:32.806885'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dcb7757a-1a3e-4101-8fb6-b25b433ffe6a', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dcff6f91-36ff-4c98-ab71-9687606440cc', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Mi grave - digitacao$$, $$digitacao$$, $$/audio/baixo/mi_grave.mp3$$, '2025-06-16 04:35:35.662045'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dd8907f2-c8d3-4cba-885b-a09dc3e0877c', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dd942a5f-7528-4204-b5fc-4e83b3818036', '1b699036-0f72-4c48-9801-e01f6f25e165', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'de5775ac-a4f0-4e40-a560-f51266dd27a8', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Harmônico natural - harmonicos$$, $$harmonicos$$, $$/audio/trombone/harmonico.mp3$$, '2025-06-20 13:42:25.385612'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'deaa9e88-de6d-40c4-8d51-9e850a588fec', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Trinado - ornamento$$, $$ornamento$$, $$/audio/piano/trinado.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'deabe2b1-21dd-4a92-9c7b-42adae1ccb80', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dee87621-3622-4ddc-b292-c4b50bd38df5', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'df595e28-b7d0-425b-a810-7d448260ee1e', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Ré - corda solta$$, $$corda solta$$, $$/audio/flauta/re_basico.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dfacbc6c-a2db-419c-bff7-9eadbace03c9', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dfce1b0b-d26c-48d2-a005-7b28438dea02', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dfce5e87-ca83-4ba6-a4e1-f3877ce9b04d', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Baixo Alberti - acompanhamento$$, $$acompanhamento$$, $$/audio/piano/baixo_alberti.mp3$$, '2025-06-08 18:57:45.157324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dffa7b85-a560-491a-9b12-32d7141fdf5e', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e0dfb14f-4095-4d36-8fe6-8075b4eea791', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Staccato curto - articulacao$$, $$articulacao$$, $$/audio/oboe/staccato_curto.mp3$$, '2025-06-20 05:13:31.357328'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e119c71f-7799-4090-b4d5-c1691d98238c', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1529817-bb7b-4f59-8114-d2f997eb4eb7', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$A3 - Arco$$, $$Arco$$, $$media/viola/sons/viola-06.mp3$$, '2025-09-22 12:05:51.549452'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e182e96e-7a72-4296-ba36-156bdf42111b', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1942ff8-3098-48b6-baae-77252f57e82d', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1a89e44-54f6-47f3-acce-14bba65cbdb6', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1bce107-ee10-49dc-b162-fd7930aa0522', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e1e7035f-c376-4a03-8462-92415aed28db', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2083f32-f1bd-4aac-9ee7-4e4bcdbf9be7', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e22f9de7-c14f-4694-96fc-4cd92216aaf8', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e23ea4ca-193a-4cec-af33-07c96f15a199', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2b20fbd-3b6c-49ec-a45a-62537aad1e90', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2b49d41-7c2f-49b1-825e-33a01b404973', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2d0f65a-b41f-4a86-b7ea-5810c68eabdd', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e2e27319-35ef-4ea0-88cb-4bd656133f44', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e3079b6b-1177-4ed3-8e8c-dd1f2e113156', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e3096946-c03c-43a9-a1fa-075e6638f9df', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Mi - pizzicato$$, $$pizzicato$$, $$/audio/violoncelo/mi_pizzicato.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e30b5464-ac0a-4c31-a41e-7b5499d65b4a', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e3889df5-6e29-4130-8357-9cc13a1a8731', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e3f19f5c-15db-4a77-a13b-e9164f126da5', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Fá - legato$$, $$legato$$, $$/audio/teclado/fa_legato.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e3f62d4f-0325-4ab7-bce7-4da79c06f27b', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4031883-13bd-4264-94e7-f4409dcbfe6a', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4971dfd-6c20-4081-bbb5-3c1e8bbffcc5', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4a68413-bb69-4432-ba2b-09eaf6da9ebc', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4b3fbd7-f9d2-4b8e-89ed-79fb03734e42', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4cdf051-18a7-4078-bb17-e89c2f845b87', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4dc7067-9308-43ca-8a0e-e48ff809a06d', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e5fa37aa-b2ca-42b7-b414-12a327a81d7b', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e6bf65b8-9ce5-4ffa-9dd5-c74905160a73', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Trinado - digitacao$$, $$digitacao$$, $$/audio/saxofone/trinado.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e6cf0c21-fb96-40a4-bc81-d57df9c9bb63', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e6de5dd8-fbdf-4044-853f-664d1ba252ee', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Mi - registro médio$$, $$registro médio$$, $$/audio/clarinete/mi_medio.mp3$$, '2025-06-15 19:09:37.626968'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e74f0fc1-8872-4e6d-ba0e-d6ea9f3b3bb9', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Fá - legato$$, $$legato$$, $$/audio/flauta/fa_legato.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e760830a-ed77-4c2e-95f8-9968f1ea56d4', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Arpejo Dó maior - digitacao$$, $$digitacao$$, $$/audio/teclado/arpejo_do.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e778537e-9522-4225-8b7f-d4f9d419c268', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Sol - legato$$, $$legato$$, $$/audio/saxofone/sol_legato.mp3$$, '2025-06-16 02:42:05.734735'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e7f199b6-a491-4e8d-9b2c-0f90dd66182d', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Lá - detache forte$$, $$detache forte$$, $$audio/violino/forte.mp3$$, '2025-06-09 03:35:16.683473'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e807d5c5-37e5-4621-a8b8-d82d1116ad23', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e81f11f8-99b2-4dfe-a812-2bad1e1dc767', '82052c70-0a9d-4d94-873e-3b402e032f55', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e82fa2fc-d291-40cc-8cf5-a18e07d540fd', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Glissando - digitacao$$, $$digitacao$$, $$/audio/contrabaixo/glissando.mp3$$, '2025-06-16 05:24:08.423464'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e842671e-bfb6-4c82-9587-391e48479cc4', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Mi - corda solta$$, $$corda solta$$, $$/audio/flauta/mi_basico.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e8c5ee3a-d15f-4c7f-88bc-59363ea5edc7', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e8e1bdad-b36c-4abd-a68c-b727d693191a', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e8f5951c-f556-463f-b066-5fd6720bcc03', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e92dc7d8-051c-4eb5-a0fb-1950dafce27f', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e95ffdf5-1964-44c9-a35c-20d15c2a600d', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9883a0c-8db0-4f79-881d-386e75d824cb', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e99f1d69-eb86-47ce-8773-b98bafec8057', '56f643e0-a3e2-4067-84ac-334c454426f8', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e9b29275-8e58-4c47-be6c-1e7798f6e77c', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ea57dd5b-2693-4697-89ac-246936479e46', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ea718018-45d3-454a-a2a0-1b3e86cdd324', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ea86f657-eb62-484b-bb9c-20154bca1302', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eafcfdfa-950e-4592-8053-e734790dd06a', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Dó - corda solta$$, $$corda solta$$, $$/audio/violoncelo/do_corda_sol.mp3$$, '2025-06-15 19:34:03.190043'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eb51447e-4fb9-4c8d-ab74-8e0eb6f2e90b', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Walking bass - digitacao$$, $$digitacao$$, $$/audio/baixo/walking.mp3$$, '2025-06-16 04:35:35.662045'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eb88601c-eeaf-4624-9d34-3d40e0eb41c0', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ebce7ff1-5166-4b2d-b83c-21d6dfc412e6', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec404f50-cc45-4815-a031-5f631e8d79b5', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec5bacdf-76ec-4d9a-87d5-115b5ed96164', '82052c70-0a9d-4d94-873e-3b402e032f55', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ec69ab37-aa1c-402a-959d-4833d0da07fa', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ecbc986e-33c6-4fa6-be10-bb9f89dfa15e', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ecd5cdea-4fdc-41a0-9cf5-41d381024c72', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Acorde C - harmonia$$, $$harmonia$$, $$/audio/teclado/acorde_c.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ed8ebbca-afb4-4300-88d3-d965ea2613bd', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ede11abb-7208-49db-ab99-486ebfe9f82a', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Mi médio - digitacao$$, $$digitacao$$, $$/audio/baixo/mi_medio.mp3$$, '2025-06-16 04:35:35.662045'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'edef3b0a-db31-4f98-af2d-7091c23803f6', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'edef3ed6-8a00-45e3-9497-162c6ca59144', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Sol - corda solta$$, $$corda solta$$, $$audio/guitarra/corda_sol.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ee630e87-b4c5-4552-9240-38fd22134fa6', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Trinado - trinado$$, $$trinado$$, $$/audio/flauta/trinado.mp3$$, '2025-06-15 19:39:50.520921'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ee80e423-0771-457a-aa74-b8a7dda5147a', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eec9c9ba-3a01-4871-af43-3a54ea1d66d2', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'eeead3e9-abf4-4d75-862f-5e03f5533f10', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef6c9145-cfa5-4bf2-b820-ef20c1b1dbb1', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef6e0340-7f41-4213-b94e-5a6acfd145f6', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Ré agudo - digitacao$$, $$digitacao$$, $$/audio/teclado/re_agudo.mp3$$, '2025-06-15 20:35:18.145019'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ef8a8bbc-becf-4511-bd10-cc4f4a3af782', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f01060e0-0d80-4ec1-84c6-923b4c7b02fe', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f08ff31a-8fe8-4d6f-a93e-2d236b66e007', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f09bc2f7-37bc-4490-aa85-c51f27e62166', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0a7e130-739d-43b8-8983-353b9746fe43', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0b55de7-44ff-451d-987e-6c63fbcebf31', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0d24b26-504b-4f84-9c1c-48351c374faa', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Ré - corda solta$$, $$corda solta$$, $$audio/guitarra/corda_re.mp3$$, '2025-06-09 04:29:15.700101'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0fdc400-d098-462f-adf2-7792cbd650ec', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f1161d53-e446-402e-a052-0ea45dac8aac', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f19f12e9-2708-4791-9b10-61335add9dfa', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f23104ef-55e9-44d3-baf9-d50856d2cfe5', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2405d5d-650c-4b6b-b2ac-9c1d3ff7fd55', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f28c8ab0-4318-42ea-bf87-6bf6a04c8f02', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f2b033cc-5791-4fc6-bfda-c8ff5682b76c', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f33a0a6c-8c20-445b-8002-6c15b1c09c12', '9a5e0eac-114e-4173-90af-32b55c870675', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f3735a59-b839-4800-afd0-88e321079dc9', '36040329-1aa6-428a-ad39-cd85de03493e', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f38a1797-e503-4ada-b32e-e07fb9fc3119', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f3b067a0-3a09-485f-937e-f04ea60a7693', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f3bccb52-74fa-4fc3-adc9-54c1312d9812', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f41f6037-e512-4a29-9129-2780723137e6', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Crescendo$$, $$Crescendo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f444f7e5-3a23-41d4-812f-d95667a203cf', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f46a13ca-fc8d-403f-bd57-fb8e99057102', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Legato$$, $$Legato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f46bfb20-cf43-47f8-822a-45ecf870f295', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f4b1ac37-a2c2-4d83-bc9e-8f9bf9cd951a', '9a5e0eac-114e-4173-90af-32b55c870675', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f4ff4557-ecd1-4466-9dd1-2fb4fe2c1ed2', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f55c3df8-ea24-42c6-91c6-9bcc5e745899', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f56bcef7-5cea-4195-8c9c-b36a54a96483', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f57241f9-2c2c-4924-99ee-4293a2354712', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Staccato$$, $$Staccato$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f60362dd-b99a-4d92-bdba-f4defb2b2a1e', '509d6a26-159a-4976-aa46-83f914f930aa', $$Ré - respiracao$$, $$respiracao$$, $$/audio/trompete/re_basico.mp3$$, '2025-06-16 04:03:20.887442'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f6127a28-398f-4d35-9996-50b900358da1', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Linha grave - digitacao$$, $$digitacao$$, $$/audio/fagote/linha_grave.mp3$$, '2025-06-20 02:38:53.825384'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f72bae37-6803-4481-83fe-c0eeb7d7ee3d', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f7389369-a89d-4fcf-bfee-5b8af1893428', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f866d257-b1a4-4425-8b8d-3e1df5bd7714', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$G4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f8d3d745-de66-4c65-8d7c-d6f8253793bd', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f94018ce-2042-4e52-8387-d9e82ba84d6c', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$F4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f9b46bb9-4b0d-4575-a0e8-5d8ee2474371', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa1ebc3a-5ebb-4fe1-8138-edc1abf4d949', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fa4d9744-92f2-4e74-a0db-a49277e5fcbe', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Ritmo Simples$$, $$Ritmo Simples$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'faeccc94-909e-42bb-a3e9-d0a919ad6c1b', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Acentos$$, $$Acentos$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'faf6ef33-27aa-4c61-9623-6e13a2a5fae6', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fb4651e3-7762-4530-886b-d89f6eeea86a', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Fá médio - digitacao$$, $$digitacao$$, $$/audio/trombone/fa_medio.mp3$$, '2025-06-20 13:42:25.385612'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fb495711-7510-4328-8283-39d7e21f6ab3', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Ritmo Sincopado$$, $$Ritmo Sincopado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fd5656d2-1706-4d60-8223-a77304f5b156', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Ataque Curto$$, $$Ataque Curto$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fdb2f8db-03fe-4e0c-b38d-03e7d076987a', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Staccato curto - articulacao$$, $$articulacao$$, $$/audio/fagote/staccato_curto.mp3$$, '2025-06-20 02:38:53.825384'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fdbe29c0-273d-4a18-ad1f-0ddaf23c7ee1', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Timbre Escuro$$, $$Timbre Escuro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe6d7934-6962-4e57-8ae1-fbcbadeea8a2', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Ataque Longo$$, $$Ataque Longo$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe737718-8268-4b63-a6cf-3b251db98a02', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Mi grave - digitacao$$, $$digitacao$$, $$/audio/contrabaixo/mi_grave.mp3$$, '2025-06-16 05:24:08.423464'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fee96aad-b9e0-430b-9640-13723372787b', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Escala de Dó - digitacao$$, $$digitacao$$, $$/audio/fagote/escala_do.mp3$$, '2025-06-20 02:38:53.825384'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'feece203-8853-4af9-9f9e-c31552e08395', '761a3318-9a5e-46f3-88f2-62159b96100c', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff0e4d22-9f62-4c8e-926e-84f9cf0e5fd5', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$C4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff604dad-65a1-4b51-bfc6-1f402ee23748', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$E4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff73ac9e-ac5c-43bb-9e43-2ffeec7ad359', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Timbre Claro$$, $$Timbre Claro$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instrument_sounds (tenant_id, id, instrument_id, title, sound_type, audio_url, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ff80ab4c-d3d4-45ee-987e-ae797e942592', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$D4 - Som Sustentado$$, $$Som Sustentado$$, $$storage://sons/padrao/silencio_1s.mp3$$, '2026-02-13 17:31:37.70429'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;