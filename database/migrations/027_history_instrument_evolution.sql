-- =============================================
-- Migration: 027_history_instrument_evolution.sql
-- Table: core.history_instrument_evolution
-- Source CSV: historia_instrumentos_evolucao_rows.csv
-- Generated: 2026-02-28T16:15:03.769Z
-- Rows: 8
-- =============================================

BEGIN;

INSERT INTO core.history_instrument_evolution (tenant_id, id, instrument_id, period_id, historical_version, approximate_year, inventor, technical_description, differences_from_modern, image_url, audio_url, curiosities, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '03261bb5-1c8b-45c6-b58a-7bfdf18624c4', NULL, 'd8c30e03-788e-4a90-970c-7585963b3949', $$Violino Moderno (Stradivarius)$$, 1680, $$Antonio Stradivari$$, $$Aperfeiçoamento pelos luthiers Stradivari, Guarneri e Amati em Cremona.$$, $$Formato moderno estabelecido. Arco redesenhado por Tourte (1785) aumentou controle e potência sonora.$$, NULL, NULL, $$Tornou-se rei da orquestra com repertório virtuosístico extenso. Base dos quartetos de cordas. Instrumentos de Stradivari valem milhões.$$, true, '2025-10-26 04:40:58.558919+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_instrument_evolution (tenant_id, id, instrument_id, period_id, historical_version, approximate_year, inventor, technical_description, differences_from_modern, image_url, audio_url, curiosities, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '191c486b-e0b9-460a-9dda-5dbb68ac25ce', NULL, NULL, $$Onda Martenot$$, 1928, $$Maurice Martenot$$, $$Instrumento eletrônico inventado por Maurice Martenot, predecessor dos sintetizadores.$$, $$Geração eletrônica de som com controle de pitch via teclado ou fita. Timbre etéreo único.$$, NULL, NULL, $$Timbres sobrenaturais usados por Messiaen, Honegger e Varèse. Influenciou desenvolvimento de instrumentos eletrônicos.$$, true, '2025-10-26 04:40:58.558919+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_instrument_evolution (tenant_id, id, instrument_id, period_id, historical_version, approximate_year, inventor, technical_description, differences_from_modern, image_url, audio_url, curiosities, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '25ee1867-ded0-486e-aaad-98c39598bff5', NULL, 'd8c30e03-788e-4a90-970c-7585963b3949', $$Trombone de Vara$$, 1600, $$Luthiers renascentistas$$, $$Desenvolvido a partir do saqueboute renascentista. Adicionado à orquestra no período clássico.$$, $$Vara deslizante permite glissandi e afinação precisa. Bocal e campana expandidas aumentaram volume.$$, NULL, NULL, $$Adicionou poder e solenidade à seção de metais. Usado por Mozart, Beethoven, Wagner e Mahler.$$, true, '2025-10-26 04:40:58.558919+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_instrument_evolution (tenant_id, id, instrument_id, period_id, historical_version, approximate_year, inventor, technical_description, differences_from_modern, image_url, audio_url, curiosities, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '43db7852-92f8-4d69-bd25-ac109bf15bce', NULL, 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', $$Clarinete com Sistema Boehm$$, 1750, $$Johann Denner, Theobald Boehm$$, $$Desenvolvido por Johann Denner a partir do chalumeau. Sistema de chaves expandido por Ivan Müller.$$, $$Adicão de chaves aumentou tessitura e agilidade. Sistema Boehm (1839) padronizou digitação.$$, NULL, NULL, $$Ampliou paleta tímbrica da orquestra. Repertório solo extenso com Mozart, Weber, Brahms e Debussy.$$, true, '2025-10-26 04:40:58.558919+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_instrument_evolution (tenant_id, id, instrument_id, period_id, historical_version, approximate_year, inventor, technical_description, differences_from_modern, image_url, audio_url, curiosities, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '80e6a97c-b876-4572-9b9b-6b9594c2b28c', NULL, NULL, $$Sintetizador Moog$$, 1964, $$Robert Moog$$, $$Moog sintetizador modular permite geração eletrônica de som com controle de parâmetros.$$, $$Osciladores, filtros e envelopes controláveis. Interface de teclado familiar para músicos.$$, NULL, NULL, $$Novos timbres impossíveis com instrumentos acústicos. Fundou música eletrônica moderna com Stockhausen e Wendy Carlos.$$, true, '2025-10-26 04:40:58.558919+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_instrument_evolution (tenant_id, id, instrument_id, period_id, historical_version, approximate_year, inventor, technical_description, differences_from_modern, image_url, audio_url, curiosities, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e736841e-4c07-44e7-baa5-1d8c1804e1b8', NULL, 'f8ed8ab3-ef44-47e5-8a3f-80b4dd60f89a', $$Piano (Pianoforte)$$, 1700, $$Bartolomeo Cristofori$$, $$Evolução do cravo para o pianoforte por Bartolomeo Cristofori. Permitia controle dinâmico através do toque.$$, $$Mecanismo de martelos permitindo piano e forte. Escapamento duplo (Érard, 1821) aumentou velocidade de repetição.$$, NULL, NULL, $$Revolucionou a música de teclado. Tornou-se instrumento central do Romantismo com compositores como Mozart, Beethoven, Chopin e Liszt.$$, true, '2025-10-26 04:40:58.558919+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_instrument_evolution (tenant_id, id, instrument_id, period_id, historical_version, approximate_year, inventor, technical_description, differences_from_modern, image_url, audio_url, curiosities, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f0e25783-0d2c-4d56-ab27-2048bea1830f', NULL, NULL, $$Bateria (Kit moderno)$$, 1910, $$William Ludwig (pedal de bumbo)$$, $$Conjunto de percussão desenvolvido em Nova Orleans, combinando vários instrumentos em um setup.$$, $$Pedal de bumbo (1909) permitiu um músico tocar múltiplos tambores. Padronização gradual do kit.$$, NULL, NULL, $$Trouxe ritmos do jazz para música erudita. Expandiu possibilidades rítmicas em obras de Stravinsky, Varèse e Copland.$$, true, '2025-10-26 04:40:58.558919+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.history_instrument_evolution (tenant_id, id, instrument_id, period_id, historical_version, approximate_year, inventor, technical_description, differences_from_modern, image_url, audio_url, curiosities, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f843a092-3711-47ec-aaf5-053696b23f78', NULL, 'e8ce8fcc-5d20-4557-be06-c908b975e141', $$Saxofone$$, 1840, $$Adolphe Sax$$, $$Inventado por Adolphe Sax na Bélgica, combinando qualidades de madeiras e metais.$$, $$Corpo cônico de metal com palheta de madeira. Sistema de chaves complexo para agilidade.$$, NULL, NULL, $$Ponte entre música erudita e popular. Essencial no jazz. Timbre único usado por Berlioz, Bizet, Debussy e Ravel.$$, true, '2025-10-26 04:40:58.558919+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;