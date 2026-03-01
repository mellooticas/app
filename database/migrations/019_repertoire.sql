-- =============================================
-- Migration: 019_repertoire.sql
-- Table: core.repertoire
-- Source CSV: repertorio_musical_rows.csv
-- Generated: 2026-02-28T16:15:03.619Z
-- Rows: 19
-- =============================================

BEGIN;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b9b444a-d6c1-47d8-8de0-3962e6278f4a', $$Base Blues em E$$, $$Tradicional$$, $$E$$, $$80$$, 'intermediate', NULL, NULL, NULL, '["blues","improvisacao","jam","criativo"]'::jsonb, $$Base perfeita para exercícios de improvisação em grupo$$, false, true, '2025-09-22 13:35:34.411091'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0de0385d-1721-42c4-b1c2-8fc72b5a2fc3', $$Wonderwall (Versão Acústica)$$, $$Oasis$$, $$Em$$, $$87$$, 'beginner', NULL, NULL, NULL, '["rock","acustico","banda","covers"]'::jsonb, $$Clássico para formação de bandas, acordes simples mas efetivos$$, false, true, '2025-09-22 13:35:34.411091'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '10295820-ed21-4d14-b4b9-471e852a802c', $$Girl from Ipanema (Looped Version)$$, $$Tom Jobim$$, $$F$$, $$120$$, 'intermediate', NULL, NULL, NULL, '["bossa nova","loop","tecnologia","gravacao"]'::jsonb, $$Ideal para ensinar técnicas de looping e gravação caseira com celular/tablet$$, false, true, '2025-09-22 13:43:21.840062'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '145da4ba-42d3-4b3c-aa8d-52204d91be2f', $$Peixe Vivo$$, $$Tradicional$$, $$C$$, $$100$$, 'beginner', NULL, NULL, NULL, '["tradicional","roda","infantil"]'::jsonb, $$Perfeita para iniciação e rodas musicais$$, false, true, '2025-09-22 13:27:16.165324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1beb5d4e-ee51-4816-b22b-62d68ee70202', $$Rude Cruz$$, $$Tradicional$$, $$C$$, $$80$$, 'intermediate', NULL, NULL, NULL, '["hino","tradicional","cruz"]'::jsonb, $$Clássico para trabalhar harmonia simples$$, false, true, '2025-09-22 13:28:39.735876'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1cf81fb4-e0b8-418a-b98b-eed2538720f7', $$Despacito (Versão Acústica)$$, $$Luis Fonsi$$, $$Bm$$, $$95$$, 'beginner', NULL, NULL, NULL, '["pop","tiktok","viral","arranjo"]'::jsonb, $$Música atual para trabalhar arranjos colaborativos e engajamento jovem$$, false, true, '2025-09-22 13:35:34.411091'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2cc93437-763a-4db0-9e0f-cacc6d1703e9', $$Despacito (Versão Acústica)$$, $$Luis Fonsi$$, $$Bm$$, $$95$$, 'beginner', NULL, NULL, NULL, '["pop","tiktok","viral","arranjo"]'::jsonb, $$Música atual para trabalhar arranjos colaborativos e engajamento jovem$$, false, true, '2025-09-22 13:43:21.840062'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5862bb74-1b2c-46eb-a398-d5fa1af8f13c', $$Aquarela$$, $$Toquinho$$, $$C$$, $$90$$, 'intermediate', NULL, NULL, NULL, '["infantil","mpb","criatividade"]'::jsonb, $$Excelente para trabalhar criatividade e expressão$$, false, true, '2025-09-22 13:27:16.165324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '61f01ab0-0511-44e1-a880-ac4b6173a82d', $$Stand by Me$$, $$Ben E. King$$, $$G$$, $$121$$, 'beginner', NULL, NULL, NULL, '["soul","rb","banda","harmonia"]'::jsonb, $$Excelente para trabalhar harmonia em grupos pequenos$$, false, true, '2025-09-22 13:35:34.411091'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '767afb97-b6da-4b66-9026-2bfcac80bffc', $$Heat Waves$$, $$Glass Animals$$, $$C$$, $$80$$, 'intermediate', NULL, NULL, NULL, '["indie","tiktok","viral","eletronica"]'::jsonb, $$Hit do TikTok ideal para arranjos com elementos eletrônicos$$, false, true, '2025-09-22 13:35:34.411091'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '80ce8857-3c16-4d84-be0d-dfe571116374', $$Sakura (Cherry Blossoms)$$, $$Tradicional Japonesa$$, NULL, NULL, 'beginner', NULL, NULL, NULL, '["japao","pentatonica","cultural"]'::jsonb, $$Melodia pentatônica, ideal para xilofones e flautas$$, false, true, '2025-09-22 13:28:53.644206'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8619d1f9-906f-4975-87f8-c685acee7946', $$Quão Grande é o Meu Deus$$, $$Chris Tomlin$$, $$G$$, $$76$$, 'beginner', NULL, NULL, NULL, '["louvor","adoracao","internacional"]'::jsonb, $$Ideal para grupos de louvor iniciantes$$, false, true, '2025-09-22 13:28:39.735876'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8d858d7a-6757-4f5d-b3d9-3e04f4019c25', $$Heat Waves$$, $$Glass Animals$$, $$C$$, $$80$$, 'intermediate', NULL, NULL, NULL, '["indie","tiktok","viral","eletronica"]'::jsonb, $$Hit do TikTok ideal para arranjos com elementos eletrônicos$$, false, true, '2025-09-22 13:43:21.840062'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '91829d11-10ee-4649-87b2-2e854c2bc71e', $$Base Blues em E$$, $$Tradicional$$, $$E$$, $$80$$, 'intermediate', NULL, NULL, NULL, '["blues","improvisacao","jam","criativo"]'::jsonb, $$Base perfeita para exercícios de improvisação em grupo$$, false, true, '2025-09-22 13:43:21.840062'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9431d964-eda5-4af5-ad0b-9e9b51c16c25', $$Girl from Ipanema (Looped Version)$$, $$Tom Jobim$$, $$F$$, $$120$$, 'intermediate', NULL, NULL, NULL, '["bossa nova","loop","tecnologia","gravacao"]'::jsonb, $$Ideal para ensinar técnicas de looping e gravação caseira com celular/tablet$$, false, true, '2025-09-22 13:35:34.411091'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9f10d7f3-b9e8-4b16-8c27-3bdc1ef55add', $$Wonderwall (Versão Acústica)$$, $$Oasis$$, $$Em$$, $$87$$, 'beginner', NULL, NULL, NULL, '["rock","acustico","banda","covers"]'::jsonb, $$Clássico para formação de bandas, acordes simples mas efetivos$$, false, true, '2025-09-22 13:43:21.840062'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a46dfb04-5bc5-4f8f-9175-f7909f026096', $$Asa Branca$$, $$Luiz Gonzaga$$, $$G$$, $$120$$, 'beginner', NULL, NULL, NULL, '["nordeste","folclore","sanfona"]'::jsonb, $$Ideal para trabalhar ritmo sincopado e cultura nordestina$$, false, true, '2025-09-22 13:27:16.165324'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'acc0b20e-2028-4226-b35d-52b773d50ce1', $$Kojo no Tsuki$$, $$Rentaro Taki$$, NULL, NULL, 'intermediate', NULL, NULL, NULL, '["japao","lua","romantica"]'::jsonb, $$Bela melodia para trabalhar expressividade$$, false, true, '2025-09-22 13:28:53.644206'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.repertoire (tenant_id, id, title, composer, key_signature, tempo, difficulty_level, sheet_music_url, playback_url, tutorial_video_url, tags, notes, is_public, is_active, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f18be393-02b8-4dbd-bd2e-b0266f3a88ec', $$Stand by Me$$, $$Ben E. King$$, $$G$$, $$121$$, 'beginner', NULL, NULL, NULL, '["soul","rb","banda","harmonia"]'::jsonb, $$Excelente para trabalhar harmonia em grupos pequenos$$, false, true, '2025-09-22 13:43:21.840062'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;