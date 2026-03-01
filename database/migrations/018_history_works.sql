-- =============================================
-- Migration: 018_history_works.sql
-- Table: core.history_works
-- Source CSV: historia_obras_rows.csv
-- Generated: 2026-02-28T16:15:03.603Z
-- Rows: 26
-- =============================================

BEGIN;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '040b0db1-2338-44e7-984c-bfa04e7f9ac8', $$Canon em Ré maior$$, NULL, '26f0c4d7-e0f6-4ba3-a360-574ddf65d2e6', 'd8c30e03-788e-4a90-970c-7585963b3949', 1680, $$Câmara$$, $$Instrumental$$, 'intermediate', 5, $$https://www.youtube.com/watch?v=NlprozGcs80$$, $$https://www.youtube.com/watch?v=hOA-2hl1Vbc$$, NULL, true, '2025-10-27 17:11:20.1946+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '10d0a4f6-0094-48b2-9a10-8e4eac935a1c', $$Tropicália$$, NULL, 'aa7603a5-6982-4a13-b7ae-002e2f0ce8e3', '480e5257-9aca-48e8-971f-f19794fc0dcf', 1968, $$Tropicália$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2c68e3bb-4ab8-41c9-96e8-d1b2ff5c9ad7', $$A Criação$$, $$Die Schöpfung$$, '6ab9f4fb-93a2-441a-a97f-ee974eef8838', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 1798, $$Oratório$$, $$Sacro$$, 'expert', 4, $$https://www.youtube.com/watch?v=OMhY2866RWU$$, $$https://www.youtube.com/watch?v=FqgCXxBT8T4$$, NULL, true, '2025-10-27 17:11:20.1946+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3816a190-1f73-412a-8597-2ad59fe1a089', $$Sinfonia nº 40 em Sol menor$$, NULL, '9148c439-1fbe-45d0-beed-56e97f6cf026', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 1788, $$Sinfonia$$, $$Orquestral$$, 'expert', 5, $$https://www.youtube.com/watch?v=JTc1mDieQI8$$, $$https://www.youtube.com/watch?v=aEkXet4WiLQ$$, NULL, true, '2025-10-27 17:11:20.1946+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '44b449ff-b0c4-4bb3-8c5b-c474176711e4', $$Tank!$$, NULL, 'e23ae30f-1410-4610-b30f-8f12fc8e8bdd', 'bf731274-4647-4e61-aa72-2ac8a0b3944c', 1998, $$Trilha Sonora$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '46b2ad7b-94b8-4b83-9ae9-d8b9f8b733f3', $$Messias$$, $$Messiah$$, '01826610-9488-44c5-92c3-4edfd0470bee', 'd8c30e03-788e-4a90-970c-7585963b3949', 1741, $$Oratório$$, $$Sacro$$, 'expert', 5, $$https://www.youtube.com/watch?v=IUZEtVbJT5c$$, $$https://www.youtube.com/watch?v=VI6dsMeABpU$$, NULL, true, '2025-10-27 17:11:20.1946+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4d618b49-aebe-4967-8b4b-683079e8fe58', $$Rokudan no Shirabe$$, NULL, '83c61d11-1558-4af3-b50d-4bc83f83a934', NULL, 1614, $$Instrumental$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5025c322-b9ca-4172-a746-d1e36a99bdcb', $$November Steps$$, NULL, 'a3707aa4-7707-43de-bcd1-493e38f77dc6', NULL, 1967, $$Orquestral$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '590c431d-7997-4118-9b1e-e35608d0a595', $$Carinhoso$$, NULL, '66697bd8-3ad7-4e00-82ef-4b35686d41b5', NULL, 1917, $$Choro$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5c8bce2a-25fc-4e39-85d5-43ecad78ef74', $$Pequena Serenata Noturna$$, $$Eine kleine Nachtmusik$$, '9148c439-1fbe-45d0-beed-56e97f6cf026', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 1787, $$Serenata$$, $$Câmara$$, 'intermediate', 5, $$https://www.youtube.com/watch?v=oy2zDJPIgwc$$, $$https://www.youtube.com/watch?v=o1FSN8_pp_o$$, NULL, true, '2025-10-27 17:11:20.1946+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6bc34ed0-b84b-42a8-b82f-9989dc9679a4', $$Concertos de Brandemburgo$$, $$Brandenburgische Konzerte$$, '8d121f8d-363a-4825-9eca-d62553d1ea53', 'd8c30e03-788e-4a90-970c-7585963b3949', 1721, $$Concerto Grosso$$, $$Barroca$$, 'expert', 95, $$https://www.youtube.com/watch?v=3HSRIDtwsfM$$, $$https://www.youtube.com/watch?v=3HSRIDtwsfM$$, $$https://imslp.org/wiki/Brandenburg_Concertos,_BWV_1046-1051_(Bach,_Johann_Sebastian)$$, true, '2025-10-09 02:54:37.69367+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '702e8c59-f843-4e8a-b734-fc31c0ee364a', $$Toccata e Fuga em Ré menor$$, NULL, '8d121f8d-363a-4825-9eca-d62553d1ea53', 'd8c30e03-788e-4a90-970c-7585963b3949', 1704, $$Obra para órgão$$, $$Instrumental$$, 'expert', 5, $$https://www.youtube.com/watch?v=ho9rZjlsyYY$$, $$https://www.youtube.com/watch?v=Nnuq9PXbywA$$, NULL, true, '2025-10-27 17:11:20.1946+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '74c71e35-6794-4dcf-aec2-377d5e1fa94d', $$Sinfonia nº 9 em Ré menor (Coral)$$, $$Symphonie Nr. 9 d-Moll (Choral)$$, '37681c66-7ef1-4634-b268-fbc1be69e4c5', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 1824, $$Sinfonia Coral$$, $$Clássica/Romântica$$, 'expert', 100, $$https://www.youtube.com/watch?v=t3217H8JppI$$, $$https://www.youtube.com/watch?v=t3217H8JppI$$, $$https://imslp.org/wiki/Symphony_No.9,_Op.125_(Beethoven,_Ludwig_van)$$, true, '2025-10-09 02:54:37.69367+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7ea81159-e994-4596-8107-2f276bf4c5ce', $$As Quatro Estações$$, $$Le quattro stagioni$$, 'bb314e0e-90fb-409e-a57a-b190e71fce7c', 'd8c30e03-788e-4a90-970c-7585963b3949', 1725, $$Concerto para Violino$$, $$Barroca Programática$$, 'expert', 100, $$https://www.youtube.com/watch?v=GRxofEmo3HA$$, $$https://www.youtube.com/watch?v=GRxofEmo3HA$$, $$https://imslp.org/wiki/The_Four_Seasons,_Op.8_(Vivaldi,_Antonio)$$, true, '2025-10-09 02:54:37.69367+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8823fac9-0805-432b-bc73-6bd80bbe810a', $$Construção$$, NULL, '2d850638-b14d-4fb8-b987-d85c7892ea62', '480e5257-9aca-48e8-971f-f19794fc0dcf', 1971, $$MPB$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '92466874-d67c-4ed8-9823-691eefd58d3a', $$Aquele Abraço$$, NULL, '3c106370-db4c-4b34-bfdf-2b995c954036', '480e5257-9aca-48e8-971f-f19794fc0dcf', 1969, $$MPB$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9751545a-cfbd-4ecb-9d76-825a97f0cf6c', $$Travessia$$, NULL, '280b11e5-12eb-4b8e-9099-d4dff10fcc18', NULL, 1967, $$MPB$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b80d8419-06da-45bd-9d16-715ee364c8cb', $$Tonari no Totoro - Tema Principal$$, NULL, '83e3fcb3-ef41-434e-96f3-179028ff2957', 'bf731274-4647-4e61-aa72-2ac8a0b3944c', 1988, $$Trilha Sonora$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'be32fe7d-66b3-419d-949e-3c99ab466416', $$Garota de Ipanema (The Girl from Ipanema)$$, NULL, '86b7ff25-1dbb-4827-b29c-3b7d3a4b8709', '798ce272-a0af-40a3-97c5-11b83fe0addb', 1962, $$Bossa Nova$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c8bcb1a0-50d6-4518-b1ee-0ed6e56e8a27', $$Il Guarany (Ópera)$$, NULL, '3c501d98-c0ca-4032-8d4c-4528c1c6a930', 'b0bef9be-0afc-4319-a8fe-a117f44e2dc9', 1870, $$Ópera$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd3d07435-c338-48e4-be90-e8f4fd3eed32', $$Kōjō no Tsuki (Lua sobre Castelo em Ruínas)$$, NULL, '9beb6a1a-96e6-4434-9e29-dad1417dade2', NULL, 1901, $$Canção$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd66e4480-8279-4c2c-9f67-624a3500358e', $$Ó Abre Alas$$, NULL, '8ac10d5e-503e-4a46-a976-f79e987686f3', 'b0bef9be-0afc-4319-a8fe-a117f44e2dc9', 1899, $$Marchinha de Carnaval$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd99f7d68-da47-49a4-98ec-85d77e051304', $$Águas de Março$$, NULL, '86b7ff25-1dbb-4827-b29c-3b7d3a4b8709', '798ce272-a0af-40a3-97c5-11b83fe0addb', 1972, $$Canção$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'dcc03754-2d11-4bcf-b8cb-6ec3bcad024c', $$Sinfonia nº 5 em Dó menor$$, $$Symphonie Nr. 5 c-Moll$$, '37681c66-7ef1-4634-b268-fbc1be69e4c5', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 1808, $$Sinfonia$$, $$Clássica$$, 'expert', 100, $$https://www.youtube.com/watch?v=_4IRMYuE1hI$$, $$https://www.youtube.com/watch?v=_4IRMYuE1hI$$, $$https://imslp.org/wiki/Symphony_No.5,_Op.67_(Beethoven,_Ludwig_van)$$, true, '2025-10-09 02:54:37.69367+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f12b0303-c69f-4298-a0f3-005a4b214bdc', $$Merry Christmas Mr. Lawrence$$, NULL, '6bdf2c72-6099-4fc5-9294-a887f79ac000', 'bf731274-4647-4e61-aa72-2ac8a0b3944c', 1983, $$Trilha Sonora$$, NULL, NULL, 0, NULL, NULL, NULL, true, '2025-12-14 20:49:33.510717+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_works (tenant_id, id, title, original_title, composer_id, period_id, composition_year, work_type, genre, difficulty_level, popularity, audio_url, video_url, score_url, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fff35441-1d53-4651-815c-fc92dac59a5b', $$O Cravo Bem Temperado$$, $$Das Wohltemperierte Klavier$$, '8d121f8d-363a-4825-9eca-d62553d1ea53', 'd8c30e03-788e-4a90-970c-7585963b3949', 1722, $$Coleção de Prelúdios e Fugas$$, $$Barroca para Teclado$$, 'expert', 90, $$https://www.youtube.com/watch?v=qBVs8VBwhno$$, $$https://www.youtube.com/watch?v=qBVs8VBwhno$$, $$https://imslp.org/wiki/The_Well-Tempered_Clavier_I,_BWV_846-869_(Bach,_Johann_Sebastian)$$, true, '2025-10-09 02:54:37.69367+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;