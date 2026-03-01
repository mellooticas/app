-- =============================================
-- Nipo School - Seed Data Expansion
-- File: 14_seed_expansion.sql
-- Seeds new tables from 12_schema_expansion.sql
-- Source: csv_originais/*.csv
-- Tenant: 00000000-0000-0000-0000-000000000001
-- =============================================
-- Tables seeded:
--  0A. core.history_periods (23 rows) — prerequisite
--  0B. core.history_composers (40 rows) — prerequisite
--  0C. core.instruments (8 rows) — prerequisite
--   1. core.history_genres (32 rows)
--   2. core.history_movements (6 rows)
--   3. core.history_cultural_contexts (10 rows)
--   4. core.history_timeline_events (4 rows)
--   5. core.history_theory_concepts (10 rows)
--   6. core.history_instrument_evolution (5 rows)
--   7. core.history_quizzes (18 rows)
--   8. core.teaching_sequences (3 rows)
--   9. core.support_materials (12 rows)
--  10. core.instrument_inventory (17 rows)
--
-- Tables NOT seeded (user-generated content):
--   - core.feed_posts, feed_comments, feed_likes
--   - core.practice_sessions
--   - core.student_learning_profiles
--   - core.learning_recommendations
--   - core.lesson_checklists (references specific lessons)
-- =============================================

BEGIN;

-- =============================================
-- 0A. HISTORY PERIODS (prerequisite - 23 rows)
-- =============================================

INSERT INTO core.history_periods (id, tenant_id, name, description, start_year, end_year, theme_color, chronological_order, is_active)
VALUES
('058f61ff-806e-4179-8c5b-2cd597b36d76', '00000000-0000-0000-0000-000000000001', 'Era do Rádio (Brasil)', 'Samba, marchinha de carnaval e ouro da música popular', 1930, 1950, '#f1c40f', 21, true),
('17bf83a0-e91e-4983-915f-51ace4da29ea', '00000000-0000-0000-0000-000000000001', 'Era Meiji (Japão)', 'Modernização e fusão com música ocidental', 1868, 1912, '#f39c12', 16, true),
('36750dc3-177d-4b56-b230-66df92911877', '00000000-0000-0000-0000-000000000001', 'Brasil Colonial', 'Encontro de culturas: indígena, africana e portuguesa', 1500, 1822, '#8b4513', 19, true),
('36ea1a6e-5615-48dc-9c2f-c8cc87d2dfd4', '00000000-0000-0000-0000-000000000001', 'Período Heian (Japão)', 'Era dourada da cultura japonesa, origem do gagaku e música de corte', 794, 1185, '#9b59b6', 13, true),
('3ff47d85-e4f2-4f79-9a04-1dcf021abfad', '00000000-0000-0000-0000-000000000001', 'Período Kamakura (Japão)', 'Surgimento do teatro Noh e música dos samurais', 1185, 1333, '#3498db', 14, true),
('40424e40-4c08-4885-a55f-a560c8dd90d7', '00000000-0000-0000-0000-000000000001', 'Renascimento', 'Florescimento da polifonia vocal, humanismo musical e surgimento da música instrumental autônoma', 1400, 1600, '#DAA520', 2, true),
('480e5257-9aca-48e8-971f-f19794fc0dcf', '00000000-0000-0000-0000-000000000001', 'MPB e Tropicália', 'Experimentação, protesto e fusão de estilos', 1965, 1980, '#9b59b6', 22, true),
('68690a8a-47f6-40a7-ad15-c1951e377172', '00000000-0000-0000-0000-000000000001', 'Contemporâneo', 'Serialismo integral, música eletrônica, aleatória, minimalista, espectral e pós-moderna. Pluralismo estilístico total', 1950, 2024, '#00CED1', 8, true),
('798ce272-a0af-40a3-97c5-11b83fe0addb', '00000000-0000-0000-0000-000000000001', 'Bossa Nova', 'Revolução suave: samba jazz sofisticado com harmonias impressionistas e batida sincopada no violão', 1958, 1970, '#87CEEB', 11, true),
('8c167784-6592-4f6f-bb74-422c863439ec', '00000000-0000-0000-0000-000000000001', 'Período Edo (Japão)', 'Florescimento do kabuki, shamisen e música popular urbana', 1603, 1868, '#e74c3c', 15, true),
('a202d11a-4152-4640-acc4-b538109b0a44', '00000000-0000-0000-0000-000000000001', 'Rock e Música Popular', E'Revolução cultural juvenil: do rock''n''roll ao hip-hop, música eletrônica e fusões globais', 1950, 2024, '#FF1493', 12, true),
('a456e639-d38c-4098-8915-427e2fe80de8', '00000000-0000-0000-0000-000000000001', 'Jazz', 'Improvisação, swing, blue notes e síncope. Fusão de tradições africanas, europeias e afro-americanas nascida nos EUA', 1895, 2024, '#FFD700', 9, true),
('a8106bcd-4791-46f4-b502-bda5fe19c041', '00000000-0000-0000-0000-000000000001', 'Modernismo', 'Atonalidade, dodecafonismo, politonalidade e experimentação radical. Ruptura definitiva com a tonalidade tradicional', 1900, 1950, '#FF6347', 7, true),
('b0bef9be-0afc-4319-a8fe-a117f44e2dc9', '00000000-0000-0000-0000-000000000001', 'Brasil Imperial', 'Consolidação do choro, modinha e música de salão', 1822, 1889, '#1abc9c', 20, true),
('bf731274-4647-4e61-aa72-2ac8a0b3944c', '00000000-0000-0000-0000-000000000001', 'J-Pop Contemporâneo', 'J-Pop, J-Rock, música anime e influência global', 1990, 2025, '#e91e63', 18, true),
('cb79f2bb-813a-485c-a6c8-2000fced9334', '00000000-0000-0000-0000-000000000001', E'Shōwa Pós-Guerra (Japão)', 'Reconstrução, enka e primeiros passos do J-Pop', 1945, 1989, '#16a085', 17, true),
('d8c30e03-788e-4a90-970c-7585963b3949', '00000000-0000-0000-0000-000000000001', 'Barroco', 'Época do baixo contínuo, nascimento da ópera e desenvolvimento do concerto. Ornamentação, drama e retórica musical', 1600, 1750, '#4B0082', 3, true),
('db0214a5-ccf3-4068-ac3a-681450eaf06c', '00000000-0000-0000-0000-000000000001', 'Medieval', 'Música da Idade Média, dominada pelo Cantochão e polifonia sacra da Igreja Católica', 500, 1400, '#8B4513', 1, true),
('e5fdb4e4-69c0-44fa-82f7-3fa21888bfd9', '00000000-0000-0000-0000-000000000001', 'MPB - Música Popular Brasileira', 'Fusão sofisticada de samba, bossa nova, jazz, rock e tradições regionais brasileiras. Poesia e engajamento político', 1960, 2024, '#228B22', 10, true),
('e8ce8fcc-5d20-4557-be06-c908b975e141', '00000000-0000-0000-0000-000000000001', 'Romântico', 'Expressão individual, emoção intensa, nacionalismo musical e cromatismo expandido. Apogeu do Lied, poema sinfônico e grande ópera', 1820, 1900, '#DC143C', 5, true),
('f2f37801-7669-4d4b-9bb9-2e79589d410e', '00000000-0000-0000-0000-000000000001', 'Música Brasileira Contemporânea', 'Sertanejo, funk, rap, samba e diversidade sem limites', 1980, 2025, '#e74c3c', 23, true),
('f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', '00000000-0000-0000-0000-000000000001', 'Clássico', 'Clareza, equilíbrio formal e desenvolvimento da forma sonata. Apogeu da sinfonia, quarteto de cordas e concerto para solista', 1750, 1820, '#4169E1', 4, true),
('fec1fe65-dfd0-4797-bd51-693f3a612214', '00000000-0000-0000-0000-000000000001', 'Impressionismo', 'Cores sonoras, ambiguidade tonal e atmosfera evocativa. Escalas exóticas, acordes não-funcionais e sonoridades fluidas', 1890, 1920, '#9370DB', 6, true)
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- 0B. HISTORY COMPOSERS (prerequisite - 40 rows)
-- =============================================

INSERT INTO core.history_composers (id, tenant_id, full_name, artistic_name, period_id, birth_country, birth_date, death_date, importance_level, is_active)
VALUES
('01826610-9488-44c5-92c3-4edfd0470bee', '00000000-0000-0000-0000-000000000001', E'Georg Friedrich Händel', 'Handel', 'd8c30e03-788e-4a90-970c-7585963b3949', 'Alemanha', '1685-02-23', '1759-04-14', 5, true),
('102ed8a3-0f8b-4bd4-9bcc-ea6ccbf49c16', '00000000-0000-0000-0000-000000000001', 'Jakob Ludwig Felix Mendelssohn Bartholdy', 'Mendelssohn', 'e8ce8fcc-5d20-4557-be06-c908b975e141', 'Alemanha', '1809-02-03', '1847-11-04', 4, true),
('242645c7-e035-4868-8fbb-bd67916f7ebe', '00000000-0000-0000-0000-000000000001', E'Béla Viktor János Bartók', E'Bartók', 'a8106bcd-4791-46f4-b502-bda5fe19c041', 'Hungria', '1881-03-25', '1945-09-26', 4, true),
('26f0c4d7-e0f6-4ba3-a360-574ddf65d2e6', '00000000-0000-0000-0000-000000000001', 'Johann Pachelbel', 'Pachelbel', 'd8c30e03-788e-4a90-970c-7585963b3949', 'Alemanha', '1653-09-01', '1706-03-09', 4, true),
('280b11e5-12eb-4b8e-9099-d4dff10fcc18', '00000000-0000-0000-0000-000000000001', 'Milton Silva Campos do Nascimento', 'Milton Nascimento', 'f2f37801-7669-4d4b-9bb9-2e79589d410e', 'Brasil', '1942-10-26', NULL, 5, true),
('2c66f118-3e49-479f-99b8-e7fde3340932', '00000000-0000-0000-0000-000000000001', E'Frédéric François Chopin', 'Chopin', 'e8ce8fcc-5d20-4557-be06-c908b975e141', E'Polônia', '1810-03-01', '1849-10-17', 5, true),
('2d6c26aa-002e-4fe4-a5be-5f1da2ceaad8', '00000000-0000-0000-0000-000000000001', 'Marcus Vinicius da Cruz e Mello Moraes', 'Vinicius de Moraes', '798ce272-a0af-40a3-97c5-11b83fe0addb', 'Brasil', '1913-10-19', '1980-07-09', 5, true),
('2d850638-b14d-4fb8-b987-d85c7892ea62', '00000000-0000-0000-0000-000000000001', 'Francisco Buarque de Hollanda', 'Chico Buarque', '480e5257-9aca-48e8-971f-f19794fc0dcf', 'Brasil', '1944-06-19', NULL, 5, true),
('2ef6c728-858b-41cf-bb9d-e844783a0969', '00000000-0000-0000-0000-000000000001', 'Achille-Claude Debussy', 'Debussy', 'fec1fe65-dfd0-4797-bd51-693f3a612214', E'França', '1862-08-22', '1918-03-25', 5, true),
('37681c66-7ef1-4634-b268-fbc1be69e4c5', '00000000-0000-0000-0000-000000000001', 'Ludwig van Beethoven', 'Beethoven', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 'Alemanha', '1770-12-17', '1827-03-26', 5, true),
('3788e175-a745-4d5e-bf98-bd011644db39', '00000000-0000-0000-0000-000000000001', E'Kōsaku Yamada', 'Yamada', '17bf83a0-e91e-4983-915f-51ace4da29ea', E'Japão', '1886-06-09', '1965-12-29', 5, true),
('397a64ad-cf05-411e-b00b-6ba14db292a4', '00000000-0000-0000-0000-000000000001', 'Giacomo Antonio Domenico Michele Secondo Maria Puccini', 'Puccini', 'e8ce8fcc-5d20-4557-be06-c908b975e141', E'Itália', '1858-12-29', '1924-11-29', 4, true),
('3c106370-db4c-4b34-bfdf-2b995c954036', '00000000-0000-0000-0000-000000000001', 'Gilberto Passos Gil Moreira', 'Gilberto Gil', '480e5257-9aca-48e8-971f-f19794fc0dcf', 'Brasil', '1942-06-26', NULL, 5, true),
('3c501d98-c0ca-4032-8d4c-4528c1c6a930', '00000000-0000-0000-0000-000000000001', E'Antônio Carlos Gomes', 'Carlos Gomes', 'b0bef9be-0afc-4319-a8fe-a117f44e2dc9', 'Brasil', '1836-07-11', '1896-09-16', 5, true),
('4c5a9cfe-a040-4ee5-9dc9-a479a0bf8876', '00000000-0000-0000-0000-000000000001', 'Giuseppe Fortunino Francesco Verdi', 'Verdi', 'e8ce8fcc-5d20-4557-be06-c908b975e141', E'Itália', '1813-10-10', '1901-01-27', 5, true),
('60e9514d-57d1-4d87-860f-d1314507b8d0', '00000000-0000-0000-0000-000000000001', 'Johann Strauss II', 'Rei da Valsa', 'e8ce8fcc-5d20-4557-be06-c908b975e141', E'Áustria', '1825-10-25', '1899-06-03', 5, true),
('66697bd8-3ad7-4e00-82ef-4b35686d41b5', '00000000-0000-0000-0000-000000000001', 'Alfredo da Rocha Viana Filho', 'Pixinguinha', '058f61ff-806e-4179-8c5b-2cd597b36d76', 'Brasil', '1897-04-23', '1973-02-17', 5, true),
('6aae14ae-1c25-47ed-80d5-8112a9674d2f', '00000000-0000-0000-0000-000000000001', 'Aaron Copland', NULL, 'a8106bcd-4791-46f4-b502-bda5fe19c041', 'Estados Unidos', '1900-11-14', '1990-12-02', 4, true),
('6ab9f4fb-93a2-441a-a97f-ee974eef8838', '00000000-0000-0000-0000-000000000001', 'Franz Joseph Haydn', 'Papa Haydn', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', E'Áustria', '1732-03-31', '1809-05-31', 4, true),
('6bdf2c72-6099-4fc5-9294-a887f79ac000', '00000000-0000-0000-0000-000000000001', 'Ryuichi Sakamoto', 'Sakamoto', 'bf731274-4647-4e61-aa72-2ac8a0b3944c', E'Japão', '1952-01-17', '2023-03-28', 5, true),
('83c61d11-1558-4af3-b50d-4bc83f83a934', '00000000-0000-0000-0000-000000000001', E'Yatsuhashi Kengyō', 'Yatsuhashi', '8c167784-6592-4f6f-bb74-422c863439ec', E'Japão', '1614-01-01', '1685-01-01', 5, true),
('83e3fcb3-ef41-434e-96f3-179028ff2957', '00000000-0000-0000-0000-000000000001', 'Mamoru Fujisawa', 'Joe Hisaishi', 'bf731274-4647-4e61-aa72-2ac8a0b3944c', E'Japão', '1950-12-06', NULL, 5, true),
('85e30fba-02f7-4cf9-af4b-d2cf3389a1b9', '00000000-0000-0000-0000-000000000001', 'Robert Alexander Schumann', NULL, 'e8ce8fcc-5d20-4557-be06-c908b975e141', 'Alemanha', '1810-06-08', '1856-07-29', 5, true),
('86b7ff25-1dbb-4827-b29c-3b7d3a4b8709', '00000000-0000-0000-0000-000000000001', E'Antônio Carlos Brasileiro de Almeida Jobim', 'Tom Jobim', '798ce272-a0af-40a3-97c5-11b83fe0addb', 'Brasil', '1927-01-25', '1994-12-08', 5, true),
('8ac10d5e-503e-4a46-a976-f79e987686f3', '00000000-0000-0000-0000-000000000001', 'Francisca Edwiges Neves Gonzaga', 'Chiquinha Gonzaga', 'b0bef9be-0afc-4319-a8fe-a117f44e2dc9', 'Brasil', '1847-10-17', '1935-02-28', 5, true),
('8d121f8d-363a-4825-9eca-d62553d1ea53', '00000000-0000-0000-0000-000000000001', 'Johann Sebastian Bach', 'J.S. Bach', 'd8c30e03-788e-4a90-970c-7585963b3949', 'Alemanha', '1685-03-21', '1750-07-28', 5, true),
('9148c439-1fbe-45d0-beed-56e97f6cf026', '00000000-0000-0000-0000-000000000001', 'Wolfgang Amadeus Mozart', 'W.A. Mozart', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', E'Áustria', '1756-01-27', '1791-12-05', 5, true),
('9beb6a1a-96e6-4434-9e29-dad1417dade2', '00000000-0000-0000-0000-000000000001', E'Rentarō Taki', 'Taki', '17bf83a0-e91e-4983-915f-51ace4da29ea', E'Japão', '1879-11-24', '1903-06-29', 4, true),
('a3707aa4-7707-43de-bcd1-493e38f77dc6', '00000000-0000-0000-0000-000000000001', E'Tōru Takemitsu', 'Takemitsu', 'cb79f2bb-813a-485c-a6c8-2000fced9334', E'Japão', '1930-10-08', '1996-02-20', 5, true),
('aa7603a5-6982-4a13-b7ae-002e2f0ce8e3', '00000000-0000-0000-0000-000000000001', 'Caetano Emanuel Viana Teles Veloso', 'Caetano Veloso', '480e5257-9aca-48e8-971f-f19794fc0dcf', 'Brasil', '1942-08-07', NULL, 5, true),
('b42d30f0-d927-4ead-aee2-38b4800e79fc', '00000000-0000-0000-0000-000000000001', E'Marcus Vinícius da Cruz e Mello Moraes', 'Vinicius de Moraes', '798ce272-a0af-40a3-97c5-11b83fe0addb', 'Brasil', '1913-10-19', '1980-07-09', 4, true),
('b75a281f-371d-418b-9b84-4095631e2524', '00000000-0000-0000-0000-000000000001', 'Sergei Vasilyevich Rachmaninoff', 'Rachmaninoff', 'e8ce8fcc-5d20-4557-be06-c908b975e141', E'Rússia', '1873-04-01', '1943-03-28', 4, true),
('bb281b5c-b3c7-4494-aecb-c328ab88defe', '00000000-0000-0000-0000-000000000001', 'Johannes Brahms', NULL, 'e8ce8fcc-5d20-4557-be06-c908b975e141', 'Alemanha', '1833-05-07', '1897-04-03', 5, true),
('bb314e0e-90fb-409e-a57a-b190e71fce7c', '00000000-0000-0000-0000-000000000001', 'Antonio Lucio Vivaldi', 'Vivaldi', 'd8c30e03-788e-4a90-970c-7585963b3949', E'Itália', '1678-03-04', '1741-07-28', 5, true),
('c8821384-584a-4915-9655-1c710406201c', '00000000-0000-0000-0000-000000000001', 'Gustav Mahler', NULL, 'e8ce8fcc-5d20-4557-be06-c908b975e141', E'Império Austro-Húngaro (atual Tchéquia)', '1860-07-07', '1911-05-18', 5, true),
('d2489059-8725-4e79-a729-8b14002578c0', '00000000-0000-0000-0000-000000000001', 'Dmitri Dmitriyevich Shostakovich', 'Shostakovich', 'a8106bcd-4791-46f4-b502-bda5fe19c041', E'Rússia/URSS', '1906-09-25', '1975-08-09', 4, true),
('d5bdcd5d-27f2-4133-a511-097e3e0ea709', '00000000-0000-0000-0000-000000000001', 'Franz Liszt', NULL, 'e8ce8fcc-5d20-4557-be06-c908b975e141', 'Hungria', '1811-10-22', '1886-07-31', 5, true),
('e23ae30f-1410-4610-b30f-8f12fc8e8bdd', '00000000-0000-0000-0000-000000000001', 'Yoko Kanno', 'Kanno', 'bf731274-4647-4e61-aa72-2ac8a0b3944c', E'Japão', '1963-03-18', NULL, 5, true),
('efa0d7ad-57ee-4d53-b74f-4aae46be0634', '00000000-0000-0000-0000-000000000001', 'Pyotr Ilyich Tchaikovsky', 'Tchaikovsky', 'e8ce8fcc-5d20-4557-be06-c908b975e141', E'Rússia', '1840-05-07', '1893-11-06', 5, true),
('faa61f81-2bdb-4a04-96fb-2fbbb259babf', '00000000-0000-0000-0000-000000000001', 'Wilhelm Richard Wagner', 'Wagner', 'e8ce8fcc-5d20-4557-be06-c908b975e141', 'Alemanha', '1813-05-22', '1883-02-13', 5, true)
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- 0C. INSTRUMENTS (prerequisite - 8 rows referenced by inventory/evolution)
-- =============================================

INSERT INTO core.instruments (id, tenant_id, name, family, category, description, display_order, is_active)
VALUES
('26cadf44-6d7b-4f9b-85d6-6b2c40715f45', '00000000-0000-0000-0000-000000000001', 'Saxofone', 'Madeiras', 'sopro', 'Instrumento de sopro da família das madeiras, famoso em jazz e música popular.', 9, true),
('509d6a26-159a-4976-aa46-83f914f930aa', '00000000-0000-0000-0000-000000000001', 'Trompete', 'Metais', 'sopro', 'Instrumento de sopro da família dos metais, presente em diversos estilos musicais.', 14, true),
('750450cf-e14e-4f02-944e-b3c1bb0f87a4', '00000000-0000-0000-0000-000000000001', E'Violão', 'Cordofones', 'corda', 'Instrumento de corda dedilhada', 5, true),
('794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', '00000000-0000-0000-0000-000000000001', 'Flauta', 'Madeiras', 'sopro', E'Instrumento de sopro da família das madeiras', 13, true),
('80436b4f-15c1-452f-9442-34e42b5117e4', '00000000-0000-0000-0000-000000000001', 'Violino', 'Cordas friccionadas', 'corda', 'Instrumento de corda tocado com arco', 18, true),
('8bd473f1-7b35-4b9e-869a-17fb73c6e047', '00000000-0000-0000-0000-000000000001', 'Teclado', 'Teclas', 'teclado', E'Instrumento eletrônico de teclado', 1, true),
('ab9720a5-1973-484e-9a44-d4aa62594336', '00000000-0000-0000-0000-000000000001', 'Piano', 'Cordofones percutidos', 'teclado', 'Instrumento de teclado e cordas', 2, true),
('df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', '00000000-0000-0000-0000-000000000001', 'Guitarra', 'Cordas dedilhadas amplificadas', 'corda', E'Instrumento de corda elétrica', 6, true)
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- 1. HISTORY GENRES (32 rows)
-- =============================================

INSERT INTO core.history_genres (id, tenant_id, name, slug, origin_period_id, origin_decade, origin_country, description, musical_characteristics, related_genres, main_composers, representative_works, cultural_influences, image_url, theme_color, is_active)
VALUES
-- Classical genres
('ed28810b-fc8d-40c3-8530-bf6622a2c138', '00000000-0000-0000-0000-000000000001', 'Fuga', 'fuga', 'd8c30e03-788e-4a90-970c-7585963b3949', NULL, NULL,
 'Técnica composicional contrapontística rigorosa onde um tema (sujeito) é desenvolvido por imitação em diferentes vozes.',
 'Contraponto imitativo. Estrutura: Exposição + Desenvolvimento. Complexidade alta. Mestre: J.S. Bach.',
 '[]', '[]', '[]', NULL, NULL, '#6366f1', true),

('4cc882da-037f-4306-8b42-971bf32c6c2f', '00000000-0000-0000-0000-000000000001', 'Prelúdio', 'preludio', 'd8c30e03-788e-4a90-970c-7585963b3949', NULL, NULL,
 'Peça instrumental breve que originalmente servia como introdução a outra obra, mas que se desenvolveu como forma independente.',
 'Forma livre, caráter improvisatório. Duração: 2-5 minutos. Originalmente introdutória, depois independente.',
 '[]', '[]', '[]', NULL, NULL, '#10b981', true),

('809b5443-38a0-4afa-8a84-2c12721f4976', '00000000-0000-0000-0000-000000000001', 'Suíte', 'suite', 'd8c30e03-788e-4a90-970c-7585963b3949', NULL, NULL,
 'Coleção de movimentos de dança estilizados, organizados em uma sequência contrastante que forma uma obra completa.',
 'Sequência de danças: Allemande, Courante, Sarabande, Gigue. Período Barroco principalmente.',
 '[]', '[]', '[]', NULL, NULL, '#14b8a6', true),

('bb2b39dd-8833-44b2-9483-39820c16be28', '00000000-0000-0000-0000-000000000001', 'Concerto', 'concerto', 'd8c30e03-788e-4a90-970c-7585963b3949', NULL, NULL,
 'Obra musical para um ou mais instrumentos solistas acompanhados por orquestra, destacando o virtuosismo do solista em diálogo com a orquestra.',
 'Diálogo solista-orquestra. 3 movimentos (rápido-lento-rápido). Cadenza improvisatória do solista.',
 '[]', '[]', '[]', NULL, NULL, '#8b5cf6', true),

('be3bbc53-97b4-4e8c-86d1-2848cb5ea697', '00000000-0000-0000-0000-000000000001', 'Ópera', 'opera', 'd8c30e03-788e-4a90-970c-7585963b3949', NULL, NULL,
 'Forma dramática de teatro musical onde o texto (libreto) é cantado com acompanhamento orquestral, combinando música, drama, poesia e artes visuais.',
 'Origem: Florença, 1600. Árias, recitativos, coros. Duração: 2-5 horas. Canto + orquestra + teatro + cenografia.',
 '[]', '[]', '[]', NULL, NULL, '#ef4444', true),

('c38a0d21-401d-4837-9db4-2f24860bf147', '00000000-0000-0000-0000-000000000001', 'Sonata', 'sonata', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', NULL, NULL,
 'Composição instrumental, geralmente em 3 ou 4 movimentos, escrita para piano solo ou um instrumento melódico com acompanhamento de piano.',
 '3-4 movimentos. Performance de câmara. Primeiro movimento em forma sonata. 1-2 instrumentos.',
 '[]', '[]', '[]', NULL, NULL, '#ec4899', true),

('b6f9157c-c5e8-4bba-be8d-d6030197b1dc', '00000000-0000-0000-0000-000000000001', 'Sinfonia', 'sinfonia', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', NULL, NULL,
 'Composição orquestral em múltiplos movimentos, geralmente quatro, que representa uma das formas mais complexas e prestigiadas da música clássica.',
 '4 movimentos típicos. Orquestra completa. Duração: 30-60 minutos. Forma sonata no 1º movimento.',
 '[]', '[]', '[]', NULL, NULL, '#3b82f6', true),

('e1db826e-01a8-4150-9fb6-54054e7ff2e5', '00000000-0000-0000-0000-000000000001', 'Noturno', 'noturno', 'e8ce8fcc-5d20-4557-be06-c908b975e141', NULL, NULL,
 'Peça instrumental, geralmente para piano, de caráter lírico e contemplativo, evocando a atmosfera noturna.',
 'Lírico, contemplativo, noturno. Forma livre. Principalmente piano. Popularizado por Chopin.',
 '[]', '[]', '[]', NULL, NULL, '#8b5cf6', true),

('f1c3abb7-95b4-4400-a9bb-4797888b11a6', '00000000-0000-0000-0000-000000000001', 'Quarteto de Cordas', 'quarteto-cordas', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', NULL, NULL,
 'Formação de música de câmara com quatro instrumentos de cordas (2 violinos, viola e violoncelo) e também o gênero de obras escritas para essa formação.',
 '2 violinos + viola + violoncelo. 4 vozes independentes. Música de câmara sem regente.',
 '[]', '[]', '[]', NULL, NULL, '#f59e0b', true),

('3a16c10a-e2e3-4b98-89f3-37b7930928ce', '00000000-0000-0000-0000-000000000001', 'Balada', 'balada', 'e8ce8fcc-5d20-4557-be06-c908b975e141', NULL, NULL,
 'Forma musical instrumental de caráter narrativo e dramático, muitas vezes inspirada em poesia ou lendas.',
 'Forma livre. Caráter narrativo e dramático. Inspiração: poesia, lendas. Mestre: Chopin (para piano).',
 '[]', '[]', '[]', NULL, NULL, '#a855f7', true),

('49daf28e-7b8f-49bb-a5f5-fd2a107e5b5e', '00000000-0000-0000-0000-000000000001', 'Poema Sinfônico', 'poema-sinfonico', 'e8ce8fcc-5d20-4557-be06-c908b975e141', NULL, NULL,
 'Obra orquestral de um único movimento que ilustra ou evoca conteúdo extramusical como narrativa, paisagem ou ideia.',
 'Música programática. Um único movimento. Inspiração: literatura, poesia, natureza. Inovador: Franz Liszt.',
 '[]', '[]', '[]', NULL, NULL, '#f97316', true),

('99cd3802-d802-46c5-85c5-457941734e64', '00000000-0000-0000-0000-000000000001', 'Sinfonia Coral', 'sinfonia-coral', 'e8ce8fcc-5d20-4557-be06-c908b975e141', NULL, NULL,
 'Sinfonia que inclui coro e às vezes solistas vocais, expandindo a forma sinfônica tradicional com elementos vocais.',
 'Orquestra + coro + solistas. Grande porte. Texto poético/literário. Exemplo icônico: Nona Sinfonia de Beethoven.',
 '[]', '[]', '[]', NULL, NULL, '#dc2626', true),

-- Structured genres with composer/work arrays
('6b8ae50f-c464-4f1f-93a7-5604ad77382d', '00000000-0000-0000-0000-000000000001', 'Cantata', 'cantata', NULL, '1650', 'Alemanha/Itália',
 'Obra vocal média para solistas, coro e instrumentos. Sacra ou profana.',
 'Vocal + instrumental. Recitativos, árias, coros. Mais curta que ópera. Sacra ou profana. Tradição luterana.',
 '[]',
 '["Bach", "Telemann", "Scarlatti", "Buxtehude"]',
 '["Cantata BWV 147 - Bach", "Cantata do Café - Bach", "Cantatas Sacras - Bach"]',
 'Início Barroco. Bach: 200+ cantatas sacras para liturgia luterana.', NULL, '#a855f7', true),

('ad3586ef-e52b-4e24-b07b-2516ae6a51d1', '00000000-0000-0000-0000-000000000001', 'Oratório', 'oratorio', NULL, '1650', 'Itália',
 'Drama sacro para solistas, coro e orquestra, sem encenação.',
 'Temática religiosa. Solistas + coro + orquestra. Sem encenação. Narrador. Recitativos, árias, coros.',
 '[]',
 '["Handel", "Bach", "Haydn", "Mendelssohn"]',
 '["Messias - Handel", "Paixão S. Mateus - Bach", "A Criação - Haydn"]',
 'Séc. XVII Itália, paralelo à ópera. Importante em países protestantes. Handel = ápice.', NULL, '#6366f1', true),

('ee294591-d3bd-4408-98d1-68eeb60b529d', '00000000-0000-0000-0000-000000000001', 'Música de Câmara', 'musica-camara', NULL, '1750', 'Áustria',
 'Música para pequenos grupos instrumentais, com diálogo equilibrado entre instrumentos.',
 '2 a 9 músicos. Um músico por parte. Conversação musical. Quarteto/trio/quinteto.',
 '[]',
 '["Haydn", "Mozart", "Beethoven", "Schubert", "Brahms"]',
 '["Quarteto Op. 76 - Haydn", "Quinteto Clarineta - Mozart", "Trio Piano Op. 97 - Beethoven"]',
 'Executada em salões de palácios. Quarteto de cordas = forma suprema.', NULL, '#10b981', true),

-- Japanese genres
('00931bfa-fe78-45f6-985d-85dd690f7e5c', '00000000-0000-0000-0000-000000000001', 'Enka', 'enka', 'cb79f2bb-813a-485c-a6c8-2000fced9334', NULL, NULL,
 'Estilo de balada melancólica japonesa. Letras sobre amor perdido, saudade e nostalgia. Popular entre gerações mais velhas.',
 'Vibratos e inflexões tradicionais. Temas: saudade, amor, perda. Balada. Instrumentos: shamisen, piano, orquestra.',
 '[]', '[]', '[]', NULL, NULL, NULL, true),

('11f5c353-c327-4dd0-b90b-f753d56eb600', '00000000-0000-0000-0000-000000000001', 'Gagaku', 'gagaku', '36ea1a6e-5615-48dc-9c2f-c8cc87d2dfd4', NULL, NULL,
 'Música clássica da corte imperial japonesa. Uma das formas de música orquestral mais antigas do mundo ainda praticadas. Solene e ritualística.',
 'Ritmo lento e majestoso. Modi japoneses. Ensemble orquestral. Instrumentos: hichiriki, ryuteki, biwa, koto.',
 '[]', '[]', '[]', NULL, NULL, NULL, true),

('5c4d2954-3812-448a-8ca4-169f292cd37b', '00000000-0000-0000-0000-000000000001', 'J-Pop', 'j-pop', 'bf731274-4647-4e61-aa72-2ac8a0b3944c', NULL, NULL,
 'Pop japonês mainstream. Produção sofisticada, melodias cativantes, influências de rock, eletrônica e R&B. Fenômeno cultural global.',
 'Produção de alta qualidade. Pop comercial. Melodias complexas, mudanças de tonalidade. Sintetizadores, guitarra, bateria.',
 '[]', '[]', '[]', NULL, NULL, NULL, true),

('395cfb8c-2660-4827-8467-e4e8acdd625e', '00000000-0000-0000-0000-000000000001', 'Tropicália', 'tropicalia', '480e5257-9aca-48e8-971f-f19794fc0dcf', NULL, NULL,
 'Movimento de vanguarda que revolucionou a MPB. Mistura antropofágica de rock, samba, baião, música regional e experimentação. Letras poéticas e crítica social.',
 'Experimental. Antropofagia cultural, fusão radical, engajamento político. Guitarra elétrica + berimbau + instrumentos regionais + eletrônica.',
 '[]', '[]', '[]', NULL, NULL, NULL, true),

-- Brazilian genre
('7efd056c-ba65-4181-bea3-4fd0abe97c41', '00000000-0000-0000-0000-000000000001', 'Choro', 'choro', 'b0bef9be-0afc-4319-a8fe-a117f44e2dc9', NULL, NULL,
 'Primeiro gênero de música popular urbana do Brasil. Instrumental virtuoso com flauta, violão e cavaquinho. Contraponto melódico sofisticado.',
 'Ritmo sincopado. Forma rondó (ABACA). Instrumentos: flauta, cavaquinho, violão 7 cordas, pandeiro. Improvisação e virtuosismo.',
 '[]', '[]', '[]', NULL, NULL, NULL, true),

-- Popular/World genres (with full arrays)
('c3e71e46-22f6-4ece-904e-61fca9db5521', '00000000-0000-0000-0000-000000000001', 'Rock', 'rock', NULL, '1950', 'Estados Unidos/Reino Unido',
 'Revolução cultural dos anos 50. Fusão de blues, country e R&B. Símbolo de rebeldia juvenil, liberdade e transformação social.',
 'Backbeat forte (2 e 4). Guitarra elétrica como protagonista. Forma verso-refrão. Energia e volume altos. Distorção e efeitos.',
 '["Rock and Roll", "Hard Rock", "Progressive Rock", "Punk Rock", "Heavy Metal", "Alternative Rock", "Indie Rock", "Grunge"]',
 '["Elvis Presley", "The Beatles", "Led Zeppelin", "Pink Floyd", "Queen", "Jimi Hendrix", "Nirvana", "Radiohead"]',
 '["Stairway to Heaven - Led Zeppelin", "Bohemian Rhapsody - Queen", "Smells Like Teen Spirit - Nirvana"]',
 'Anos 50 EUA/Reino Unido. Fusão de blues, country, R&B. Contracultura, rebeldia juvenil. Transformou indústria musical e cultura global.',
 NULL, '#dc2626', true),

('de264c2b-399a-4901-a7bb-b62408b7a512', '00000000-0000-0000-0000-000000000001', 'Jazz', 'jazz', NULL, '1890', 'Estados Unidos',
 'Gênero nascido da fusão de tradições africanas, blues e música europeia. Caracterizado por improvisação, síncope e expressão individual dentro de estruturas coletivas.',
 'Improvisação como elemento central. Síncope e swing. Call and response. Harmonia sofisticada (7as, 9as, alterações). Seções: tema-improvisação-tema.',
 '["Dixieland", "Swing", "Bebop", "Cool Jazz", "Hard Bop", "Free Jazz", "Fusion", "Contemporary Jazz"]',
 '["Louis Armstrong", "Duke Ellington", "Charlie Parker", "Miles Davis", "John Coltrane", "Ella Fitzgerald", "Billie Holiday", "Herbie Hancock"]',
 '["Take Five - Dave Brubeck", "So What - Miles Davis", "A Love Supreme - Coltrane"]',
 'Nova Orleans, início séc. XX. Fusão de tradições africanas, blues rural e harmonia europeia. Expressão da experiência afro-americana.',
 NULL, '#d97706', true),

('d02dafe6-4b7e-46f5-b07b-dc753433fba9', '00000000-0000-0000-0000-000000000001', 'Blues', 'blues', NULL, '1890', 'Estados Unidos',
 'Raiz da música popular moderna. Nasceu das work songs e spirituals afro-americanos. Expressão profunda de luta, dor, alegria e resistência.',
 'Forma de 12 compassos (I-IV-V). Blue notes (3a e 7a bemol). Call and response entre voz e instrumento. Expressão emocional intensa.',
 '["Delta Blues", "Chicago Blues", "Texas Blues", "Blues Rock", "Jump Blues", "British Blues"]',
 '["Robert Johnson", "Muddy Waters", "B.B. King", "Howlin Wolf", "John Lee Hooker", "Bessie Smith", "Etta James", "Buddy Guy"]',
 '["Cross Road Blues - Robert Johnson", "The Thrill Is Gone - B.B. King", "Hoochie Coochie Man - Muddy Waters"]',
 'Sul dos EUA (Delta do Mississippi), final séc. XIX. Raiz africana + experiência da escravidão/segregação.',
 NULL, '#1e40af', true),

('7b099be1-9e04-4f36-8295-777fd9951d0d', '00000000-0000-0000-0000-000000000001', 'Pop', 'pop', NULL, '1950', 'Estados Unidos/Reino Unido',
 'Música popular acessível e cativante. Melodias memoráveis, produção polida, apelo de massa. Reflete e molda cultura contemporânea.',
 'Verso-refrão-verso-refrão-ponte-refrão. Melodia cativante (hook). Duração 3-4 minutos. Produção refinada. Foco no refrão.',
 '["Pop dos anos 50-60", "Disco (70s)", "Synth-pop (80s)", "Teen pop (90s-2000s)", "Pop contemporâneo"]',
 '["Michael Jackson", "Madonna", "Prince", "Whitney Houston", "Beyoncé", "Taylor Swift", "Ariana Grande", "The Weeknd"]',
 '["Thriller - Michael Jackson", "Like a Prayer - Madonna", "I Wanna Dance with Somebody - Whitney"]',
 'Anos 50-60 com rock and roll. MTV (1981) revolucionou. Globalização via streaming. Maior alcance comercial.',
 NULL, '#f472b6', true),

('3f255cc4-dc35-4d6b-8507-07fb5d8c2da7', '00000000-0000-0000-0000-000000000001', 'Hip-Hop', 'hip-hop', NULL, '1973', 'Estados Unidos',
 'Cultura urbana completa: rap, DJing, breakdance, graffiti. Voz das periferias, poesia urbana, denúncia social e celebração de identidade.',
 'Rap (ritmo e poesia). Beat (base instrumental). Sampling. Scratch (DJ). Flow (cadência do rap). Elementos: MCing, DJing, Breakdance, Graffiti.',
 '["Old School", "Golden Age", "Gangsta Rap", "Conscious Rap", "Trap", "Boom Bap", "Alternative Hip-Hop"]',
 '["Grandmaster Flash", "Run-DMC", "Public Enemy", "Tupac", "Notorious B.I.G.", "Nas", "Kendrick Lamar", "J. Cole"]',
 '["The Message - Grandmaster Flash", "Fight the Power - Public Enemy", "Alright - Kendrick Lamar"]',
 'Bronx, Nova York, anos 70. DJ Kool Herc, Afrika Bambaataa. Cultura de resistência afro-latina. Globalizou-se.',
 NULL, '#7c3aed', true),

('21d4204e-4785-435a-8b06-19cb7761373b', '00000000-0000-0000-0000-000000000001', 'Reggae', 'reggae', NULL, '1968', 'Jamaica',
 'Voz da Jamaica para o mundo. Ritmo sincopado, mensagem de paz, amor e resistência. Movimento Rastafári e consciência social.',
 'Ênfase no contratempo (offbeat). Baixo proeminente e melódico. Skank característico (guitarra). Tempo médio/lento. One drop (bateria).',
 '["Roots Reggae", "Dub", "Dancehall", "Lovers Rock", "Reggae Fusion"]',
 '["Bob Marley", "Peter Tosh", "Burning Spear", "Jimmy Cliff", "Toots and the Maytals"]',
 '["No Woman No Cry - Bob Marley", "Redemption Song - Marley", "The Harder They Come - Jimmy Cliff"]',
 'Jamaica, final anos 60. Evolução do ska/rocksteady. Movimento Rastafári. Bob Marley levou ao mundo. UNESCO: Patrimônio Imaterial.',
 NULL, '#16a34a', true),

('23588b5b-865c-4f2a-9bdc-31aaed701a57', '00000000-0000-0000-0000-000000000001', 'Bossa Nova', 'bossa-nova', NULL, '1958', 'Brasil',
 'Sofisticação brasileira que conquistou o mundo. Fusão de samba com jazz cool. Batida diferente que revolucionou a MPB.',
 'Batida sincopada no violão. Harmonia sofisticada (jazz). Melodia suave e intimista. Ritmo de samba quebrado. Influência do cool jazz.',
 '["Bossa Nova Clássica", "Samba-jazz", "MPB (evolução)"]',
 '["Tom Jobim", "João Gilberto", "Vinicius de Moraes", "Stan Getz", "Elis Regina", "Nara Leão", "Baden Powell"]',
 '["Garota de Ipanema", "Chega de Saudade", "Desafinado", "Corcovado", "Águas de Março", "Wave"]',
 'Rio de Janeiro, final anos 50. Zona Sul carioca, intelectuais, classe média. Sucesso internacional (Getz/Gilberto 1964).',
 NULL, '#06b6d4', true),

('33fdd046-f688-4b0d-9a8c-9485e86b3348', '00000000-0000-0000-0000-000000000001', 'MPB', 'mpb', NULL, '1965', 'Brasil',
 'Termo guarda-chuva para música brasileira de qualidade pós-Bossa Nova. Fusão de tradições brasileiras com influências internacionais.',
 'Diversidade estilística. Letra poética/literária. Harmonia sofisticada. Fusão de gêneros. Experimentação.',
 '["Tropicália (1968)", "Clube da Esquina", "Vanguarda Paulista", "Música de Resistência"]',
 '["Chico Buarque", "Caetano Veloso", "Gilberto Gil", "Elis Regina", "Milton Nascimento", "Gal Costa", "Maria Bethânia", "Djavan"]',
 '["Construção - Chico", "Águas de Março - Tom", "Alegria Alegria - Caetano", "Cálice - Chico/Gil"]',
 'Anos 60-70. Resposta à ditadura militar, Festivais da Canção TV Record. Sofisticação + engajamento político.',
 NULL, '#8b5cf6', true),

('f37e768f-1d17-4fe8-b7e1-217a2c073607', '00000000-0000-0000-0000-000000000001', 'Samba', 'samba', NULL, '1910', 'Brasil',
 'Gênero símbolo do Brasil. Nasceu nos terreiros e rodas de samba do Rio de Janeiro. Patrimônio cultural imaterial da humanidade (UNESCO).',
 'Compasso 2/4 sincopado. Batucada característica. Harmonia em tonalidade maior. Partido-alto (improviso). Roda de samba (coletivo).',
 '["Samba de Roda", "Samba-enredo", "Samba-canção", "Samba de Breque", "Pagode", "Samba-rock", "Samba-jazz"]',
 '["Cartola", "Paulinho da Viola", "Clara Nunes", "Beth Carvalho", "Zeca Pagodinho", "Martinho da Vila", "Dona Ivone Lara", "Noel Rosa"]',
 '["Pelo Telefone", "Aquarela do Brasil", "Mas Que Nada", "O Mundo é um Moinho - Cartola"]',
 'Rio de Janeiro, início séc. XX. Raízes africanas (batuque, lundu). Carnaval, resistência cultural, identidade nacional.',
 NULL, '#10b981', true),

('da1b0aa5-08c7-4503-bfe1-7c2dd0de0582', '00000000-0000-0000-0000-000000000001', 'Forró', 'forro', NULL, '1940', 'Brasil',
 'Gênero nordestino que celebra a cultura sertaneja. Bailes populares, sanfona vibrante, ritmo contagiante e alegria coletiva.',
 'Compasso 2/4. Triângulo marcando tempo. Sanfona como melodia principal. Zabumba na base rítmica. Dança a dois característica.',
 '["Forró Pé-de-Serra", "Forró Universitário", "Forró Eletrônico", "Xote", "Baião", "Arrasta-pé"]',
 '["Luiz Gonzaga", "Jackson do Pandeiro", "Dominguinhos", "Elba Ramalho", "Alceu Valença", "Sivuca"]',
 '["Asa Branca - Luiz Gonzaga", "Xote das Meninas - Gonzaga", "Pagode Russo - Gonzaga"]',
 'Nordeste brasileiro, anos 40-50. Cultura sertaneja, festas juninas. Luiz Gonzaga popularizou nacionalmente.',
 NULL, '#f59e0b', true),

('45c82306-d206-465c-9ed1-bf3a4ea8a5be', '00000000-0000-0000-0000-000000000001', 'Afrobeat', 'afrobeat', NULL, '1970', 'Nigéria',
 'Fusão explosiva de funk, jazz, highlife e ritmos yorubá. Criado por Fela Kuti na Nigéria. Música como arma política e celebração africana.',
 'Groove hipnótico e repetitivo. Seção de metais poderosa (jazz). Polirritmia complexa. Músicas longas (10-20 min). Call-response.',
 '[]',
 '["Fela Kuti", "Tony Allen", "Antibalas", "Seun Kuti", "Femi Kuti", "Ebo Taylor"]',
 '["Zombie - Fela Kuti", "Water No Get Enemy - Fela", "Expensive Shit - Fela"]',
 'Lagos, Nigéria, anos 70. Fela Kuti cria fusão única. Ativismo político contra ditadura militar.',
 NULL, '#ea580c', true),

('47442ac7-2734-436d-a5a8-9d386928c18e', '00000000-0000-0000-0000-000000000001', 'Música Eletrônica', 'eletronica', NULL, '1970', 'Alemanha/EUA',
 'Revolução tecnológica na música. De experimentos acadêmicos a cultura de club global. Sintetizadores, samplers e computadores como instrumentos.',
 'Produção totalmente eletrônica. Batida repetitiva (4/4). Build-up e drop. Síntese sonora. Loops e camadas.',
 '["House", "Techno", "Trance", "Drum and Bass", "Dubstep", "EDM", "Ambient", "IDM", "Breakbeat"]',
 '["Kraftwerk", "Jean-Michel Jarre", "Giorgio Moroder", "Daft Punk", "Aphex Twin"]',
 '["Blue Monday - New Order", "Around the World - Daft Punk", "Windowlicker - Aphex Twin"]',
 'Anos 70-80. Kraftwerk (Alemanha), Chicago House, Detroit Techno. Cultura club/rave. Democratizou produção musical.',
 NULL, '#ec4899', true)

ON CONFLICT (id) DO NOTHING;


-- =============================================
-- 2. HISTORY MOVEMENTS (6 rows)
-- =============================================

INSERT INTO core.history_movements (id, tenant_id, name, description, start_year, end_year, characteristics, composers, iconic_works, is_active)
VALUES
('135fd887-9e79-4adf-a71e-36a486ece177', '00000000-0000-0000-0000-000000000001',
 'Renascimento Musical',
 'Período de renovação cultural que valorizou a polifonia, a música vocal sacra e profana. Surgimento da ópera.',
 1400, 1600,
 'Polifonia complexa. Música vocal predominante. Surgimento da ópera. Valorização do humanismo.',
 '["Palestrina", "Josquin des Prez", "Giovanni Gabrieli"]', '[]', true),

('3e6b7fdc-6420-4d82-929d-265b12cb1102', '00000000-0000-0000-0000-000000000001',
 'Barroco',
 'Caracterizado por ornamentação, contrastes dramáticos, baixo contínuo e desenvolvimento da música instrumental.',
 1600, 1750,
 'Ornamentação elaborada. Contraste dramático. Baixo contínuo. Fuga e concerto grosso.',
 '["Bach", "Handel", "Vivaldi", "Monteverdi"]', '[]', true),

('e1b3121b-4302-4782-8604-97975483d689', '00000000-0000-0000-0000-000000000001',
 'Classicismo',
 'Busca por equilíbrio, clareza formal e melodias elegantes. Desenvolvimento da sonata e da sinfonia.',
 1750, 1820,
 'Forma sonata. Sinfonia clássica. Clareza e equilíbrio. Melodias elegantes.',
 '["Mozart", "Haydn", "Beethoven (inicial)"]', '[]', true),

('ee172603-b517-4262-ac69-f096e90c8023', '00000000-0000-0000-0000-000000000001',
 'Romantismo',
 'Expressão emocional intensa, nacionalismo musical, expansão da orquestra e do piano. Lied e poema sinfônico.',
 1820, 1900,
 'Expressão emocional. Nacionalismo. Orquestra expandida. Programatismo.',
 '["Chopin", "Schumann", "Wagner", "Brahms", "Tchaikovsky"]', '[]', true),

('90eb26ac-1dfb-4b30-a5e1-b0220903fabe', '00000000-0000-0000-0000-000000000001',
 'Impressionismo',
 'Uso de timbres sutis, harmonias não convencionais, atmosferas evocativas. Inspiração na natureza e na poesia.',
 1890, 1920,
 'Timbres sutis. Harmonias não funcionais. Atmosferas evocativas. Escalas exóticas.',
 '["Debussy", "Ravel"]', '[]', true),

('5181ad3b-648a-4c06-a93d-8054f2bcf622', '00000000-0000-0000-0000-000000000001',
 'Modernismo',
 'Ruptura com tradições tonais, experimentação com atonalidade, serialismo, novas técnicas de composição.',
 1900, 1950,
 'Atonalidade. Serialismo. Experimentação rítmica. Novas texturas.',
 '["Schoenberg", "Stravinsky", "Bartók", "Berg"]', '[]', true)

ON CONFLICT (id) DO NOTHING;


-- =============================================
-- 3. HISTORY CULTURAL CONTEXTS (10 rows)
-- Only rows with valid period_id (NOT NULL constraint)
-- =============================================

INSERT INTO core.history_cultural_contexts (id, tenant_id, period_id, title, context_type, description, impact_on_music, start_year, end_year, is_active)
VALUES
('40e18e86-8b0d-4d18-8ac3-dc7b92b79dee', '00000000-0000-0000-0000-000000000001',
 'd8c30e03-788e-4a90-970c-7585963b3949', 'Absolutismo Monárquico', 'politico',
 'Apogeu do absolutismo com Luís XIV, o Rei Sol da França.',
 'Patrocínio real criou grandes centros musicais nas cortes. Música como símbolo de poder e prestígio.',
 1643, NULL, true),

('b7286b18-3db3-4926-a4fe-4cb0c356cfd9', '00000000-0000-0000-0000-000000000001',
 'd8c30e03-788e-4a90-970c-7585963b3949', 'Contrarreforma Católica', 'religioso',
 'Movimento de renovação da Igreja Católica em resposta à Reforma Protestante.',
 'Estimulou a música sacra dramática e emocional. Desenvolvimento da ópera e oratório como ferramentas de evangelização.',
 1545, NULL, true),

('e3159d32-4863-477d-93b1-22f7ccda4f90', '00000000-0000-0000-0000-000000000001',
 'd8c30e03-788e-4a90-970c-7585963b3949', 'Revolução Científica', 'cientifico',
 'Newton publica Principia Mathematica, estabelecendo leis da física.',
 'Influenciou a busca por sistemas racionais na música. Desenvolvimento da harmonia tonal sistemática.',
 1687, NULL, true),

('bc187484-52be-40e5-8d26-755a9bdd0581', '00000000-0000-0000-0000-000000000001',
 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 'Iluminismo', 'filosofico',
 'Movimento intelectual enfatizando razão, ciência e humanismo.',
 'Busca por clareza, equilíbrio e forma racional na música. Valorização da música instrumental pura.',
 1750, NULL, true),

('2b86fa54-88f0-4426-83f6-69c07eb87140', '00000000-0000-0000-0000-000000000001',
 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 'Ascensão da Burguesia', 'social',
 'Crescimento da classe média urbana com poder econômico.',
 'Novo público para concertos. Desenvolvimento do piano doméstico. Música de câmara para salões burgueses.',
 1780, NULL, true),

('ccdda744-216a-49ae-84f5-d93091ace4bd', '00000000-0000-0000-0000-000000000001',
 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 'Revolução Francesa', 'politico',
 'Queda da monarquia francesa e ascensão dos ideais de liberdade, igualdade e fraternidade.',
 'Democratização da música. Surgimento de concertos públicos. Músico como artista independente.',
 1789, NULL, true),

('309fe859-fe7b-4d8e-bacc-091d9dec31c7', '00000000-0000-0000-0000-000000000001',
 'e8ce8fcc-5d20-4557-be06-c908b975e141', 'Romantismo Literário', 'literario',
 'Movimento literário enfatizando emoção, natureza e individualismo.',
 'Música programática inspirada em literatura. Lieder (canções artísticas). Óperas baseadas em dramas românticos.',
 1800, NULL, true),

('6ecf0f15-1413-4f64-92ff-5797b3cf3323', '00000000-0000-0000-0000-000000000001',
 'e8ce8fcc-5d20-4557-be06-c908b975e141', 'Pintura Romântica', 'artistico',
 'Arte visual enfatizando dramatismo e natureza.',
 'Busca por equivalentes musicais de efeitos visuais. Poemas sinfônicos pintando paisagens sonoras.',
 1820, NULL, true),

('c4bcb8aa-eff5-4742-afa8-bf35f2eb169c', '00000000-0000-0000-0000-000000000001',
 'e8ce8fcc-5d20-4557-be06-c908b975e141', 'Revolução Industrial', 'tecnologico',
 'Mecanização da produção e transformação social.',
 'Aperfeiçoamento de instrumentos (piano forte, válvulas em metais). Produção em massa de instrumentos.',
 1820, NULL, true),

('3a349a0d-c5fb-4860-bd2b-bba5c298c593', '00000000-0000-0000-0000-000000000001',
 'e8ce8fcc-5d20-4557-be06-c908b975e141', 'Nacionalismo Europeu', 'politico',
 'Movimentos de independência e unificação nacional na Europa.',
 'Valorização das identidades nacionais através da música folclórica. Escolas nacionais de composição.',
 1848, NULL, true)

ON CONFLICT (id) DO NOTHING;


-- =============================================
-- 4. HISTORY TIMELINE EVENTS (4 rows)
-- =============================================

INSERT INTO core.history_timeline_events (id, tenant_id, year, month, day, title, event_type, category, description, composer_id, period_id, importance, is_active)
VALUES
('7c2a3480-b233-44a9-90bc-a992d03cd170', '00000000-0000-0000-0000-000000000001',
 1685, 3, 21, 'Nascimento de J.S. Bach', 'nascimento', 'compositor',
 'Nasce em Eisenach, Alemanha, um dos maiores compositores da história.',
 '8d121f8d-363a-4825-9eca-d62553d1ea53', 'd8c30e03-788e-4a90-970c-7585963b3949', 5, true),

('705d6b18-bf47-4e79-a33b-df1b3ce4b22f', '00000000-0000-0000-0000-000000000001',
 1756, 1, 27, 'Nascimento de Mozart', 'nascimento', 'compositor',
 'Nasce em Salzburgo, Áustria, Wolfgang Amadeus Mozart, prodígio musical.',
 '9148c439-1fbe-45d0-beed-56e97f6cf026', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 5, true),

('29a562b4-5c6e-4102-8535-d505869d6c52', '00000000-0000-0000-0000-000000000001',
 1770, 12, 17, 'Nascimento de Beethoven', 'nascimento', 'compositor',
 'Nasce em Bonn, Alemanha, Ludwig van Beethoven.',
 '37681c66-7ef1-4634-b268-fbc1be69e4c5', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 5, true),

('31d6b33e-69f4-42f2-81db-718fa113b43e', '00000000-0000-0000-0000-000000000001',
 1824, 5, 7, 'Estreia da 9ª Sinfonia de Beethoven', 'estreia', 'obra',
 'Primeira apresentação da Nona Sinfonia no Theater am Kärntnertor, Viena.',
 '37681c66-7ef1-4634-b268-fbc1be69e4c5', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 5, true)

ON CONFLICT (id) DO NOTHING;


-- =============================================
-- 5. HISTORY THEORY CONCEPTS (10 rows)
-- =============================================

INSERT INTO core.history_theory_concepts (id, tenant_id, name, category, simple_definition, technical_definition, origin_period_id, difficulty_level, tags, is_active)
VALUES
('1309f8b0-3508-4571-b1af-04b7058c3302', '00000000-0000-0000-0000-000000000001',
 'Baixo Contínuo', 'Harmonia',
 'Prática de acompanhamento harmônico onde uma linha de baixo é realizada com acordes improvisados.',
 'O baixo contínuo (basso continuo) é a espinha dorsal da música barroca. Um instrumento grave (violoncelo, fagote, contrabaixo) toca a linha de baixo enquanto um instrumento harmônico (cravo, órgão, alaúde) improvisa os acordes baseando-se em cifras numéricas escritas abaixo da linha de baixo. Exemplos: Sonatas barrocas, Concertos de Vivaldi, Cantatas de Bach.',
 'd8c30e03-788e-4a90-970c-7585963b3949', 2, '["barroco","harmonia","teoria"]', true),

('13e95794-8bc6-4ad7-99aa-1a94c5535292', '00000000-0000-0000-0000-000000000001',
 'Forma Sonata', 'Forma',
 'Estrutura formal tripartite: Exposição, Desenvolvimento e Recapitulação, tipicamente usada no primeiro movimento.',
 'A forma sonata é a estrutura mais importante do período clássico. Na Exposição, apresentam-se dois temas contrastantes em tonalidades diferentes. No Desenvolvimento, esses temas são transformados e modulam por várias tonalidades. Na Recapitulação, ambos os temas retornam na tonalidade principal, resolvendo a tensão tonal. Exemplos: Sinfonia No. 40 de Mozart (1º mov), Sonata Patética de Beethoven (1º mov).',
 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 3, '["classico","forma","teoria"]', true),

('759d33a1-6765-479e-9d09-cc7d014f735b', '00000000-0000-0000-0000-000000000001',
 'Contraponto', 'Textura',
 'Técnica de combinar duas ou mais linhas melódicas independentes que soam simultaneamente.',
 'Do latim punctus contra punctum (nota contra nota). O contraponto envolve regras estritas sobre como melodias simultâneas devem se relacionar, incluindo tipos de movimento (paralelo, contrário, oblíquo), tratamento de dissonâncias e independência rítmica. A fuga é a forma contrapontística mais complexa. Exemplos: A Arte da Fuga de Bach, Missa em Si menor.',
 'd8c30e03-788e-4a90-970c-7585963b3949', 4, '["barroco","textura","contraponto"]', true),

('90e4657d-cc37-44cf-aecd-a453da795970', '00000000-0000-0000-0000-000000000001',
 'Ostinato', 'Ritmo',
 'Padrão musical (melódico, rítmico ou harmônico) que se repete persistentemente.',
 'Do italiano obstinado. Técnica composicional onde um padrão curto é repetido muitas vezes, geralmente no baixo (basso ostinato ou ground bass). Cria sensação hipnótica ou de inevitabilidade. Usado do Barroco ao Minimalismo. Exemplos: Passacaglia em Dó menor de Bach, Boléro de Ravel, Music for 18 Musicians de Reich.',
 'd8c30e03-788e-4a90-970c-7585963b3949', 2, '["tecnica","repeticao","ostinato"]', true),

('893a2078-e03a-4088-a7b7-d4ed7bd5d25b', '00000000-0000-0000-0000-000000000001',
 'Rubato', 'Ritmo',
 'Liberdade expressiva no tempo, onde o intérprete acelera ou desacelera para efeito emocional.',
 'Do italiano tempo rubato (tempo roubado). Prática interpretativa onde o performer toma liberdades com o tempo métrico para aumentar a expressividade. Particularmente característico da música pianística romântica. Chopin era mestre desta técnica. Exemplos: Noturnos de Chopin, Rapsódias Húngaras de Liszt.',
 'e8ce8fcc-5d20-4557-be06-c908b975e141', 2, '["romantico","interpretacao","piano"]', true),

('ac9e31d2-f0c3-4ede-b258-ea48b050c44c', '00000000-0000-0000-0000-000000000001',
 'Cromatismo', 'Harmonia',
 'Uso extensivo de notas cromáticas (fora da escala diatônica) para colorir harmonias e melodias.',
 'O cromatismo intensificou-se no Romantismo, especialmente com Wagner, levando à dissolução da tonalidade funcional. As doze notas cromáticas são usadas livremente, obscurecendo a tonalidade através de modulações constantes e harmonias ambíguas. Exemplos: Tristão e Isolda de Wagner, Sonata em Si menor de Liszt.',
 'e8ce8fcc-5d20-4557-be06-c908b975e141', 3, '["romantico","harmonia","cromatismo"]', true),

('c031a5bb-0d2f-433f-b426-a3f64caae96d', '00000000-0000-0000-0000-000000000001',
 'Leitmotiv', 'Melodia',
 'Tema musical recorrente associado a um personagem, ideia ou situação em uma ópera ou obra programática.',
 'Termo alemão tema condutor. Wagner desenvolveu extensivamente esta técnica em suas óperas, onde dezenas de leitmotive se entrelaçam, transformam e comentam a ação dramática. O leitmotiv pode representar personagens, objetos, emoções ou conceitos abstratos. Exemplos: O Anel do Nibelungo de Wagner, Pedro e o Lobo de Prokofiev.',
 'e8ce8fcc-5d20-4557-be06-c908b975e141', 3, '["romantico","opera","melodia"]', true),

('53fc0da8-8295-48dc-8c94-5de5cc81f903', '00000000-0000-0000-0000-000000000001',
 'Politonalidade', 'Harmonia',
 'Uso simultâneo de duas ou mais tonalidades diferentes.',
 'Técnica do início do século XX onde linhas melódicas em tonalidades diferentes soam simultaneamente, criando choques harmônicos intencionais. Milhaud e Stravinsky exploraram extensivamente esta técnica. Exemplos: A Sagração da Primavera de Stravinsky, Concerto para Orquestra de Bartók.',
 NULL, 4, '["moderno","harmonia","vanguarda"]', true),

('6e86789d-e1de-48a0-b06f-a5c14164732b', '00000000-0000-0000-0000-000000000001',
 'Dodecafonismo', 'Harmonia',
 'Sistema composicional que usa as doze notas cromáticas em ordem pré-determinada (série), evitando hierarquia tonal.',
 'Desenvolvido por Schoenberg, o método de composição com doze tons trata todas as notas igualmente, sem tônica. A série básica pode ser usada em quatro formas: original, retrógrada, inversão e inversão retrógrada. Exemplos: Suíte para Piano Op. 25 de Schoenberg, Concerto para Violino de Berg.',
 NULL, 5, '["moderno","serialismo","schoenberg"]', true),

('ba5b40e1-59c2-4f88-bb8d-e03be37b17df', '00000000-0000-0000-0000-000000000001',
 'Modalismo', 'Harmonia',
 'Uso de modos (escalas) diferentes das escalas maior e menor tradicionais.',
 'Os modos (dórico, frígio, lídio, mixolídio, etc.) eram base da música medieval e renascentista. Compositores modernos como Debussy, Ravel e Vaughan Williams resgataram os modos para escapar do sistema tonal maior-menor, criando cores harmônicas distintas. Exemplos: Quarteto de Cordas de Debussy, Daphnis et Chloé de Ravel.',
 NULL, 3, '["moderno","harmonia","modos"]', true)

ON CONFLICT (id) DO NOTHING;


-- =============================================
-- 6. HISTORY INSTRUMENT EVOLUTION (5 rows)
-- Only rows matchable to existing instrument_ids
-- =============================================

INSERT INTO core.history_instrument_evolution (id, tenant_id, instrument_id, period_id, historical_version, approximate_year, inventor, technical_description, differences_from_modern, curiosities, is_active)
VALUES
('03261bb5-1c8b-45c6-b58a-7bfdf18624c4', '00000000-0000-0000-0000-000000000001',
 '80436b4f-15c1-452f-9442-34e42b5117e4', 'd8c30e03-788e-4a90-970c-7585963b3949',
 'Violino Moderno (Stradivarius)', 1680, 'Antonio Stradivari',
 'Aperfeiçoamento pelos luthiers Stradivari, Guarneri e Amati em Cremona.',
 'Formato moderno estabelecido. Arco redesenhado por Tourte (1785) aumentou controle e potência sonora.',
 'Tornou-se rei da orquestra com repertório virtuosístico extenso. Instrumentos de Stradivari valem milhões.', true),

('25ee1867-ded0-486e-aaad-98c39598bff5', '00000000-0000-0000-0000-000000000001',
 '509d6a26-159a-4976-aa46-83f914f930aa', 'd8c30e03-788e-4a90-970c-7585963b3949',
 'Trombone de Vara', 1600, 'Luthiers renascentistas',
 'Desenvolvido a partir do saqueboute renascentista. Adicionado à orquestra no período clássico.',
 'Vara deslizante permite glissandi e afinação precisa. Bocal e campana expandidas aumentaram volume.',
 'Adicionou poder e solenidade à seção de metais. Usado por Mozart, Beethoven, Wagner e Mahler.', true),

('e736841e-4c07-44e7-baa5-1d8c1804e1b8', '00000000-0000-0000-0000-000000000001',
 'ab9720a5-1973-484e-9a44-d4aa62594336', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a',
 'Piano (Pianoforte)', 1700, 'Bartolomeo Cristofori',
 'Evolução do cravo para o pianoforte por Bartolomeo Cristofori. Permitia controle dinâmico através do toque.',
 'Mecanismo de martelos permitindo piano e forte. Escapamento duplo (Érard, 1821) aumentou velocidade de repetição.',
 'Revolucionou a música de teclado. Tornou-se instrumento central do Romantismo com Mozart, Beethoven, Chopin e Liszt.', true),

('f843a092-3711-47ec-aaf5-053696b23f78', '00000000-0000-0000-0000-000000000001',
 '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', 'e8ce8fcc-5d20-4557-be06-c908b975e141',
 'Saxofone', 1840, 'Adolphe Sax',
 'Inventado por Adolphe Sax na Bélgica, combinando qualidades de madeiras e metais.',
 'Corpo cônico de metal com palheta de madeira. Sistema de chaves complexo para agilidade.',
 'Ponte entre música erudita e popular. Essencial no jazz. Timbre único usado por Berlioz, Bizet, Debussy e Ravel.', true),

('80e6a97c-b876-4572-9b9b-6b9594c2b28c', '00000000-0000-0000-0000-000000000001',
 '8bd473f1-7b35-4b9e-869a-17fb73c6e047', NULL,
 'Sintetizador Moog', 1964, 'Robert Moog',
 'Moog sintetizador modular permite geração eletrônica de som com controle de parâmetros.',
 'Osciladores, filtros e envelopes controláveis. Interface de teclado familiar para músicos.',
 'Novos timbres impossíveis com instrumentos acústicos. Fundou música eletrônica moderna com Stockhausen e Wendy Carlos.', true)

ON CONFLICT (id) DO NOTHING;


-- =============================================
-- 7. HISTORY QUIZZES (18 rows)
-- =============================================

INSERT INTO core.history_quizzes (id, tenant_id, title, period_id, difficulty_level, question_type, question, options, correct_answer, explanation, tags, is_active)
VALUES
('a44e8da1-902b-4ce3-9676-ab30e789f8be', '00000000-0000-0000-0000-000000000001',
 'Característica do Barroco', 'd8c30e03-788e-4a90-970c-7585963b3949', 1, 'multiple_choice',
 'Qual dessas características é típica da música Barroca?',
 '[{"id":"a","text":"Forma sonata","correct":false},{"id":"b","text":"Baixo contínuo","correct":true},{"id":"c","text":"Atonalismo","correct":false},{"id":"d","text":"Minimalismo","correct":false}]',
 'Baixo contínuo',
 'O baixo contínuo é uma das características mais marcantes da música Barroca, fornecendo a base harmônica.',
 '["barroco","teoria","caracteristicas"]', true),

('d29198ce-4d35-4d47-9948-088ce1b8e11d', '00000000-0000-0000-0000-000000000001',
 'Compositor Barroco Alemão', 'd8c30e03-788e-4a90-970c-7585963b3949', 1, 'multiple_choice',
 'Qual compositor barroco alemão é conhecido como o mestre da fuga?',
 '[{"id":"a","text":"Handel","correct":false},{"id":"b","text":"Bach","correct":true},{"id":"c","text":"Vivaldi","correct":false},{"id":"d","text":"Telemann","correct":false}]',
 'Bach',
 'J.S. Bach é considerado o mestre supremo do contraponto e da fuga, com obras como A Arte da Fuga e O Cravo Bem Temperado.',
 '["barroco","compositores","bach"]', true),

('68e9ceb9-a66e-4006-92be-77c7ee33dc81', '00000000-0000-0000-0000-000000000001',
 'Andamento', 'd8c30e03-788e-4a90-970c-7585963b3949', 1, 'multiple_choice',
 'Qual termo indica tempo muito lento?',
 '[{"id":"a","text":"Presto","correct":false},{"id":"b","text":"Adagio","correct":true},{"id":"c","text":"Allegro","correct":false},{"id":"d","text":"Vivace","correct":false}]',
 'Adagio',
 'Adagio indica tempo lento e tranquilo. Presto é muito rápido, Allegro é rápido e alegre, Vivace é vivo e animado.',
 '["teoria","andamento","basico"]', true),

('d511b968-f281-4eb0-b73b-7c5909f5d007', '00000000-0000-0000-0000-000000000001',
 'Instrumento Barroco', 'd8c30e03-788e-4a90-970c-7585963b3949', 2, 'multiple_choice',
 'Qual instrumento era o principal responsável pelo baixo contínuo na música barroca?',
 '[{"id":"a","text":"Violino","correct":false},{"id":"b","text":"Flauta","correct":false},{"id":"c","text":"Cravo","correct":true},{"id":"d","text":"Oboé","correct":false}]',
 'Cravo',
 'O cravo era o instrumento principal para realizar o baixo contínuo, improvisando harmonias sobre a linha de baixo cifrada.',
 '["barroco","instrumentos","teoria"]', true),

('31845a7f-1fd0-45ca-a530-a7969a39449a', '00000000-0000-0000-0000-000000000001',
 'Forma Musical Clássica', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 2, 'multiple_choice',
 'Qual é a estrutura típica do primeiro movimento de uma sinfonia clássica?',
 '[{"id":"a","text":"Tema e variações","correct":false},{"id":"b","text":"Forma sonata","correct":true},{"id":"c","text":"Rondó","correct":false},{"id":"d","text":"Fuga","correct":false}]',
 'Forma sonata',
 'A forma sonata (Exposição-Desenvolvimento-Recapitulação) é a estrutura padrão do primeiro movimento de sinfonias clássicas.',
 '["classico","forma","teoria"]', true),

('5eec0365-dac8-4131-89af-26c007b17e6c', '00000000-0000-0000-0000-000000000001',
 'Tonalidade', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 2, 'multiple_choice',
 'Qual é a tonalidade relativa menor de Dó maior?',
 '[{"id":"a","text":"Ré menor","correct":false},{"id":"b","text":"Lá menor","correct":true},{"id":"c","text":"Mi menor","correct":false},{"id":"d","text":"Sol menor","correct":false}]',
 'Lá menor',
 'Lá menor é a relativa menor de Dó maior (compartilham a mesma armadura de clave, sem acidentes).',
 '["teoria","tonalidade","harmonia"]', true),

('98adc19f-1ac0-4040-8d93-963b9a61a3cc', '00000000-0000-0000-0000-000000000001',
 'Tríade Clássica', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 1, 'multiple_choice',
 'Quem são os três grandes compositores do período Clássico?',
 '[{"id":"a","text":"Bach, Handel, Vivaldi","correct":false},{"id":"b","text":"Haydn, Mozart, Beethoven","correct":true},{"id":"c","text":"Chopin, Liszt, Schumann","correct":false},{"id":"d","text":"Brahms, Wagner, Verdi","correct":false}]',
 'Haydn, Mozart, Beethoven',
 'Haydn, Mozart e Beethoven são conhecidos como a Tríade Clássica de Viena, definindo o estilo do período.',
 '["classico","compositores","historia"]', true),

('cbb78a63-4382-49a2-ac04-43103a4a4001', '00000000-0000-0000-0000-000000000001',
 'Período de Mozart', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 1, 'multiple_choice',
 'Em qual período musical viveu Mozart?',
 '[{"id":"a","text":"Barroco","correct":false},{"id":"b","text":"Clássico","correct":true},{"id":"c","text":"Romântico","correct":false},{"id":"d","text":"Moderno","correct":false}]',
 'Clássico',
 'Mozart (1756-1791) é um dos maiores representantes do período Clássico.',
 '["classico","compositores","mozart"]', true),

('d0b35742-2ede-4aa5-8300-351b41f9545e', '00000000-0000-0000-0000-000000000001',
 'Patronato Musical', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 2, 'multiple_choice',
 'Para qual família nobre Haydn trabalhou por quase 30 anos?',
 '[{"id":"a","text":"Habsburgos","correct":false},{"id":"b","text":"Esterházy","correct":true},{"id":"c","text":"Hohenzollern","correct":false},{"id":"d","text":"Romanov","correct":false}]',
 'Esterházy',
 'Haydn serviu à família Esterházy de 1761 a 1790, compondo extensivamente para as atividades musicais da corte.',
 '["classico","historia","haydn"]', true),

('bf3ea990-5492-45bc-a295-b4e669bed784', '00000000-0000-0000-0000-000000000001',
 'Textura Musical', 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', 3, 'multiple_choice',
 'Como se chama a textura onde várias linhas melódicas independentes soam simultaneamente?',
 '[{"id":"a","text":"Homofonia","correct":false},{"id":"b","text":"Monofonia","correct":false},{"id":"c","text":"Polifonia","correct":true},{"id":"d","text":"Heterofonia","correct":false}]',
 'Polifonia',
 'Polifonia (ou contraponto) é a textura com múltiplas linhas melódicas independentes, característica de Bach e da música renascentista.',
 '["teoria","textura","contraponto"]', true),

('01b03b2a-c6c8-46c6-8702-6bd282a76c56', '00000000-0000-0000-0000-000000000001',
 'Gênero Romântico', 'e8ce8fcc-5d20-4557-be06-c908b975e141', 2, 'multiple_choice',
 'Qual gênero musical combina orquestra com narrativa ou ideia extramusical?',
 '[{"id":"a","text":"Sinfonia","correct":false},{"id":"b","text":"Concerto","correct":false},{"id":"c","text":"Poema sinfônico","correct":true},{"id":"d","text":"Sonata","correct":false}]',
 'Poema sinfônico',
 'O poema sinfônico é música programática orquestral que ilustra uma história, paisagem ou ideia, desenvolvido por Liszt.',
 '["romantico","generos","programatica"]', true),

('acd3b0ea-1ab8-42e1-82a7-506261290059', '00000000-0000-0000-0000-000000000001',
 'Dinâmica', 'e8ce8fcc-5d20-4557-be06-c908b975e141', 1, 'multiple_choice',
 'O que significa crescendo na música?',
 '[{"id":"a","text":"Tocar mais rápido","correct":false},{"id":"b","text":"Aumentar gradualmente o volume","correct":true},{"id":"c","text":"Tocar mais lento","correct":false},{"id":"d","text":"Diminuir o volume","correct":false}]',
 'Aumentar gradualmente o volume',
 'Crescendo (cresc.) indica aumento gradual de volume, recurso expressivo importante especialmente no Romantismo.',
 '["teoria","dinamica","basico"]', true),

('c568e508-f1b7-474a-ab6d-d9af09eacb0f', '00000000-0000-0000-0000-000000000001',
 'Virtuosismo Romântico', 'e8ce8fcc-5d20-4557-be06-c908b975e141', 1, 'multiple_choice',
 'Qual compositor romântico era conhecido como o maior virtuose do piano de sua época?',
 '[{"id":"a","text":"Franz Liszt","correct":true},{"id":"b","text":"Robert Schumann","correct":false},{"id":"c","text":"Felix Mendelssohn","correct":false},{"id":"d","text":"Anton Bruckner","correct":false}]',
 'Franz Liszt',
 'Franz Liszt foi o maior virtuose do piano do século XIX, revolucionando a técnica pianística e criando o recital solo.',
 '["romantico","piano","virtuosismo"]', true),

('13a9a90f-78da-4f85-a901-dcb105a95dcd', '00000000-0000-0000-0000-000000000001',
 'Minimalismo', NULL, 2, 'multiple_choice',
 'Qual técnica é característica da música minimalista?',
 '[{"id":"a","text":"Dodecafonismo","correct":false},{"id":"b","text":"Cromatismo extremo","correct":false},{"id":"c","text":"Repetição de padrões","correct":true},{"id":"d","text":"Rubato livre","correct":false}]',
 'Repetição de padrões',
 'O minimalismo usa repetição de padrões simples com mudanças graduais, como em Music for 18 Musicians de Steve Reich.',
 '["moderno","minimalismo","tecnica"]', true),

('e01f3ced-71a9-4d8c-8cdc-f5d8a47cf02c', '00000000-0000-0000-0000-000000000001',
 'Impressionismo', NULL, 2, 'multiple_choice',
 'Qual compositor francês é considerado o pai do impressionismo musical?',
 '[{"id":"a","text":"Maurice Ravel","correct":false},{"id":"b","text":"Claude Debussy","correct":true},{"id":"c","text":"Erik Satie","correct":false},{"id":"d","text":"Gabriel Fauré","correct":false}]',
 'Claude Debussy',
 E'Debussy revolucionou a música com obras como Prélude à l\'après-midi d\'un faune, usando escalas modais e harmonias inovadoras.',
 '["moderno","impressionismo","debussy"]', true),

('faa0c25b-0ab9-4d10-85da-36f89e237f7b', '00000000-0000-0000-0000-000000000001',
 'Nacionalismo Musical', 'e8ce8fcc-5d20-4557-be06-c908b975e141', 2, 'multiple_choice',
 'Qual compositor russo é famoso pela obra Quadros de uma Exposição?',
 '[{"id":"a","text":"Tchaikovsky","correct":false},{"id":"b","text":"Rimsky-Korsakov","correct":false},{"id":"c","text":"Mussorgsky","correct":true},{"id":"d","text":"Borodin","correct":false}]',
 'Mussorgsky',
 'Modest Mussorgsky compôs Quadros de uma Exposição originalmente para piano, depois orquestrada famosamente por Ravel.',
 '["romantico","nacionalismo","russia"]', true),

('fc71c0e3-688a-4871-8211-924f3d0bf685', '00000000-0000-0000-0000-000000000001',
 'Balé Revolucionário', NULL, 2, 'multiple_choice',
 'Qual balé de Stravinsky causou escândalo em sua estreia em 1913?',
 '[{"id":"a","text":"O Pássaro de Fogo","correct":false},{"id":"b","text":"Petrushka","correct":false},{"id":"c","text":"A Sagração da Primavera","correct":true},{"id":"d","text":"Pulcinella","correct":false}]',
 'A Sagração da Primavera',
 'A Sagração da Primavera causou tumulto em Paris por suas dissonâncias ousadas e ritmos primitivos violentos.',
 '["moderno","stravinsky","bale"]', true),

('fd11c498-3d02-46de-8dd7-f176c0f02cad', '00000000-0000-0000-0000-000000000001',
 'Atonalidade', NULL, 3, 'multiple_choice',
 'Quem desenvolveu o método de composição dodecafônico?',
 '[{"id":"a","text":"Igor Stravinsky","correct":false},{"id":"b","text":"Arnold Schoenberg","correct":true},{"id":"c","text":"Béla Bartók","correct":false},{"id":"d","text":"Anton Webern","correct":false}]',
 'Arnold Schoenberg',
 'Schoenberg criou o serialismo dodecafônico na década de 1920, um método sistemático de organizar as 12 notas cromáticas.',
 '["moderno","serialismo","schoenberg"]', true)

ON CONFLICT (id) DO NOTHING;


-- =============================================
-- 8. TEACHING SEQUENCES (3 rows)
-- =============================================

INSERT INTO core.teaching_sequences (id, tenant_id, title, methodology_id, age_range, duration_weeks, objectives, week_number, main_activity, circle_activity, game_dynamic, required_materials, notes, created_by)
VALUES
('05296eba-16a5-47d5-86be-51a9d8e9e2b3', '00000000-0000-0000-0000-000000000001',
 'Sons do Corpo e Exploração Rítmica', NULL, '6-7 anos', 3,
 'Desenvolver percepção rítmica e musicalidade através do corpo. Estimular criatividade, coordenação motora e socialização.',
 1, 'Descobrindo os Sons do Corpo (palmas, estalos, batidas no peito, pés)',
 'Cada criança faz um som; grupo imita',
 'Jogo de sequência de sons (Simon musical)',
 'Apenas o corpo. Espaço para movimento.', NULL, NULL),

('c01c6229-2e72-4799-b8fd-2fec9feaee81', '00000000-0000-0000-0000-000000000001',
 'Sons do Corpo e Exploração Rítmica', NULL, '6-7 anos', 3,
 'Desenvolver percepção rítmica e musicalidade através do corpo. Estimular criatividade, coordenação motora e socialização.',
 2, 'Ritmos do Cotidiano (usar objetos como lápis, cadeiras, garrafas)',
 'Criação de batidas em grupo, passando o ritmo de um para o outro',
 'Ritmo viajante (cada um acrescenta um som à sequência)',
 'Lápis, cadeiras, garrafas, objetos diversos.', NULL, NULL),

('e421c1b1-80dc-4d0b-8ed5-9e13b7590578', '00000000-0000-0000-0000-000000000001',
 'Sons do Corpo e Exploração Rítmica', NULL, '6-7 anos', 3,
 'Desenvolver percepção rítmica e musicalidade através do corpo. Estimular criatividade, coordenação motora e socialização.',
 3, 'Canções de roda e movimento (integração com dança/euritmia)',
 'Cantar e movimentar conforme a música (usar músicas folclóricas, sazonais)',
 'Roda de conversa, cada criança fala de um som/música que gostou',
 'Música folclórica. Espaço para dança.', NULL, NULL)

ON CONFLICT (id) DO NOTHING;


-- =============================================
-- 9. SUPPORT MATERIALS (12 unique rows)
-- =============================================

INSERT INTO core.support_materials (id, tenant_id, title, material_type, category, description, difficulty_level, tags, author, license, is_active)
VALUES
('0b21469f-92b9-49d5-af7b-e7ac9ef7b4f2', '00000000-0000-0000-0000-000000000001',
 'Como Afinar seu Instrumento - Vídeo Tutorial', 'video', 'tutorial',
 'Tutorial passo a passo mostrando técnicas de afinação para diferentes instrumentos.',
 NULL, '["afinacao","manutencao","cuidados"]', 'Prof. Priscila Souza', 'uso_educacional', true),

('34473aaf-e517-46cf-8bd2-251e2da43cea', '00000000-0000-0000-0000-000000000001',
 'Guia de Percussão Corporal - Nível Iniciante', 'pdf', 'exercicio',
 'Manual completo com 15 exercícios progressivos de percussão corporal para desenvolver consciência rítmica.',
 1, '["percussao","corpo","ritmo","orff"]', 'Equipe Nipo School', 'uso_educacional', true),

('478d0b9a-28a2-43e3-a6d7-1f1da15f4879', '00000000-0000-0000-0000-000000000001',
 'Jogos de Notação Musical Interativos', 'jogo', 'jogo',
 'Conjunto de 10 jogos lúdicos para aprender figuras rítmicas, notas e leitura musical de forma divertida.',
 1, '["notacao","leitura","jogos","ludico"]', 'Equipe Nipo School', 'uso_educacional', true),

('4a97ecdf-e2bc-4ea5-9884-daa25789ecd0', '00000000-0000-0000-0000-000000000001',
 'Banco de Sons Cotidianos', 'audio', 'backing_track',
 'Coletânea com 25 sons do cotidiano para exploração sonora: chuva, carros, pássaros, objetos domésticos.',
 NULL, '["sons","cotidiano","orff","exploracao"]', 'Equipe Nipo School', 'uso_educacional', true),

('5033faa5-2907-40d4-b8cd-f765574297e8', '00000000-0000-0000-0000-000000000001',
 'Tutorial de Afinação por Instrumento', 'video', 'tutorial',
 'Série de vídeos curtos mostrando técnicas específicas de afinação para cada instrumento do projeto.',
 NULL, '["afinacao","manutencao","cuidados","instrumento"]', 'Prof. Priscila Souza', 'uso_educacional', true),

('60388417-1851-4f20-a835-d2e1067076c3', '00000000-0000-0000-0000-000000000001',
 'Roteiro para Making-Of Musical', 'pdf', 'tutorial',
 'Template de roteiro e checklist para produzir making-of e vídeos musicais com equipamento simples.',
 NULL, '["video","producao","making-of","roteiro"]', 'Equipe Nipo School', 'uso_educacional', true),

('65929bea-4bf1-4aa9-b4d3-ecc616426900', '00000000-0000-0000-0000-000000000001',
 'Apps Gratuitos para Gravação Musical', 'link', 'tutorial',
 'Lista curada de aplicativos gratuitos para gravação, edição e criação musical usando celular e tablet.',
 NULL, '["tecnologia","apps","gravacao","mobile"]', 'Equipe Nipo School', 'uso_educacional', true),

('6da67eeb-bd2c-41db-8dc7-92452c42ea1f', '00000000-0000-0000-0000-000000000001',
 'Partituras Japonesas Tradicionais', 'pdf', 'partitura',
 'Coletânea de 8 músicas japonesas tradicionais com partituras simplificadas e contexto cultural.',
 3, '["japao","tradicional","cultural","partitura"]', 'Equipe Nipo School', 'uso_educacional', true),

('90295adc-870a-4075-855f-ed638d852e60', '00000000-0000-0000-0000-000000000001',
 'Partituras Simplificadas - Repertório Brasileiro', 'pdf', 'partitura',
 'Coletânea de partituras simplificadas de clássicos da música brasileira.',
 3, '["partitura","brasileiro","mpb"]', 'Equipe Nipo School', 'uso_educacional', true),

('b1bc982d-c875-4407-9045-7925b8b89f3e', '00000000-0000-0000-0000-000000000001',
 'Exercícios de Respiração para Instrumentos de Sopro', 'pdf', 'exercicio',
 'Série de exercícios progressivos para desenvolver capacidade respiratória e controle de ar.',
 1, '["respiracao","sopro","tecnica"]', 'Equipe Nipo School', 'uso_educacional', true),

('c194c3fa-9e5a-4a89-97b1-8087d62e5cda', '00000000-0000-0000-0000-000000000001',
 'Backing Track - Asa Branca (Baião)', 'audio', 'backing_track',
 'Base musical para praticar a música Asa Branca em diferentes velocidades.',
 1, '["baiao","nordeste","pratica"]', 'Equipe Nipo School', 'uso_educacional', true),

('e07c16f0-66e9-484d-8337-cbb39ccb4d29', '00000000-0000-0000-0000-000000000001',
 'Jogos Rítmicos para Grupos', 'pdf', 'jogo',
 'Manual com 20 jogos rítmicos para desenvolver coordenação motora e trabalho em equipe.',
 NULL, '["ritmo","grupo","dinamica","orff"]', 'Equipe Nipo School', 'uso_educacional', true)

ON CONFLICT (id) DO NOTHING;


-- =============================================
-- 10. INSTRUMENT INVENTORY (17 rows)
-- =============================================

INSERT INTO core.instrument_inventory (id, tenant_id, instrument_id, asset_code, serial_number, brand, model, acquisition_value, acquisition_date, owner, condition, location, is_available, notes)
VALUES
('0b3c2f5e-2c09-42c8-a5a2-24cc9269f2c6', '00000000-0000-0000-0000-000000000001',
 '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', NULL, 'NS-SAX-001', NULL, NULL, 600.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('5ec3afce-e8ea-4580-bdb2-a2a30af32fb9', '00000000-0000-0000-0000-000000000001',
 '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', NULL, 'NS-SAX-001', NULL, NULL, 600.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('1bd60bf7-9af8-4820-ba22-e5cfc6831589', '00000000-0000-0000-0000-000000000001',
 '80436b4f-15c1-452f-9442-34e42b5117e4', NULL, 'NS-VIO-001', NULL, NULL, 800.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('db3d4b86-24f3-4a56-b2a1-0d040cd75dfb', '00000000-0000-0000-0000-000000000001',
 '80436b4f-15c1-452f-9442-34e42b5117e4', NULL, 'NS-VIO-001', NULL, NULL, 800.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('37c4d836-3d48-477f-b928-861d0a975f4e', '00000000-0000-0000-0000-000000000001',
 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', NULL, 'NS-GUI-001', NULL, NULL, 800.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('4cd8f9ff-b4c7-4fa3-906d-5c07d012125b', '00000000-0000-0000-0000-000000000001',
 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', NULL, 'NS-GUI-001', NULL, NULL, 800.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('4e001976-b32a-4080-9848-b99e6bc0b2f3', '00000000-0000-0000-0000-000000000001',
 '8bd473f1-7b35-4b9e-869a-17fb73c6e047', NULL, 'NS-TEC-001', NULL, NULL, 1200.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('b8c73f86-b3e3-4d6b-9586-1e2e41cebff3', '00000000-0000-0000-0000-000000000001',
 '8bd473f1-7b35-4b9e-869a-17fb73c6e047', NULL, 'NS-TEC-001', NULL, NULL, 1200.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('67183e71-bd7a-486a-b567-1a450baa69d7', '00000000-0000-0000-0000-000000000001',
 '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', NULL, 'NS-FLA-001', NULL, NULL, 600.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('51e9a1eb-5b34-43a3-ac52-ae1b88a02eed', '00000000-0000-0000-0000-000000000001',
 '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', NULL, 'NS-FLA-001', NULL, NULL, 600.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('9c35d7db-c590-4b04-9dd9-4fd69c8e49ad', '00000000-0000-0000-0000-000000000001',
 '509d6a26-159a-4976-aa46-83f914f930aa', NULL, 'NS-TRO-001', NULL, NULL, 600.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('8656f9db-41ca-4604-bfc2-84188c42273d', '00000000-0000-0000-0000-000000000001',
 '509d6a26-159a-4976-aa46-83f914f930aa', NULL, 'NS-TRO-001', NULL, NULL, 600.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('fe1d8d5e-9fc2-4745-afcd-796c72285ca1', '00000000-0000-0000-0000-000000000001',
 'ab9720a5-1973-484e-9a44-d4aa62594336', NULL, 'NS-PIA-001', NULL, NULL, 1200.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('90146aba-d67e-43c0-aef2-9f58104fdf5a', '00000000-0000-0000-0000-000000000001',
 'ab9720a5-1973-484e-9a44-d4aa62594336', NULL, 'NS-PIA-001', NULL, NULL, 1200.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('c257475f-abf7-4c03-99b1-eb6dab5cb06d', '00000000-0000-0000-0000-000000000001',
 '750450cf-e14e-4f02-944e-b3c1bb0f87a4', NULL, 'NS-VIO-001', NULL, NULL, 800.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('665b21ad-2ec8-4e4b-8808-1fc671f2b77f', '00000000-0000-0000-0000-000000000001',
 '750450cf-e14e-4f02-944e-b3c1bb0f87a4', NULL, 'NS-VIO-001', NULL, NULL, 800.00, '2024-09-08', 'igreja', 'good', 'Sala de Música - Armário A', true, NULL),

('e399c07c-d862-43ca-ac4f-4b65595d6efa', '00000000-0000-0000-0000-000000000001',
 '8bd473f1-7b35-4b9e-869a-17fb73c6e047', 'TESTE-001', 'SN-001', 'Yamaha', 'F310', 1500.00, '2025-06-07', 'Escola', 'good', 'Sala A', true, 'Registro de teste para validação de estatísticas.')

ON CONFLICT (id) DO NOTHING;


COMMIT;

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';
