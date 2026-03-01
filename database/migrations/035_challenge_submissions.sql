-- =============================================
-- Migration: 035_challenge_submissions.sql
-- Table: core.challenge_submissions
-- Source CSV: alpha_submissoes_rows.csv
-- Generated: 2026-02-28T16:15:03.876Z
-- Rows: 4
-- =============================================

BEGIN;

INSERT INTO core.challenge_submissions (tenant_id, id, challenge_id, student_id, response, file_url, status, grade, feedback, evaluated_at, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1e666dbe-8b90-4abc-80b1-a2eac86f8e47', '2f3d37b2-8a8f-468a-8ba2-cfb20acdeff6', '840f99c4-7479-4098-9c2e-474a695178f0', $$Pratiquei durante uma semana e consegui tocar sem erros!$$, $$https://soundcloud.com/exemplo/escala-do-maior-trompete$$, 'submitted', 0, NULL, NULL, '2025-12-08 15:15:17.045176+00'::timestamptz, '2025-12-08 15:15:17.045176+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.challenge_submissions (tenant_id, id, challenge_id, student_id, response, file_url, status, grade, feedback, evaluated_at, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c3559980-911b-4614-9fe3-be94b69ce0c5', '4a7efa31-c005-4d9c-9298-613a46b1634a', 'a57eeb22-a246-4243-8e32-98297c6f3bad', $$Gravei tocando a música completa com mão direita e esquerda$$, $$https://youtube.com/exemplo/parabens-teclado$$, 'evaluated', 80, NULL, NULL, '2025-12-08 15:15:17.045176+00'::timestamptz, '2025-12-08 15:15:17.045176+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.challenge_submissions (tenant_id, id, challenge_id, student_id, response, file_url, status, grade, feedback, evaluated_at, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd5c6f8ce-8b2a-4063-a2b0-6641185e05ce', '7bb4c394-cca2-480b-854c-14de626ad8a6', '9064ab32-12ce-415a-8c19-51b566608ee5', $$Para mim, música é uma forma de expressar sentimentos que palavras não conseguem. Quando toco violoncelo, sinto que posso compartilhar minha alegria, tristeza ou emoções complexas através das notas. A música me conecta com outras pessoas e com culturas diferentes. O som grave e profundo do violoncelo me permite expressar emoções que vão do mais profundo lamento à alegria mais intensa.$$, NULL, 'evaluated', 100, NULL, NULL, '2025-12-08 15:15:17.045176+00'::timestamptz, '2025-12-08 15:15:17.045176+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.challenge_submissions (tenant_id, id, challenge_id, student_id, response, file_url, status, grade, feedback, evaluated_at, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fe044bb3-48cf-418f-88a8-9078e87618bf', 'a47810f3-f995-44df-b6ce-e88afc9d1257', '54e79a05-59f7-4cc8-b67f-f522a1b452e4', $$Gravei batendo palmas no ritmo de semínimas$$, $$https://soundcloud.com/exemplo/ritmo-seminimas$$, 'evaluated', 90, $$Muito bom! Seu ritmo está consistente. Para melhorar, tente adicionar variações dinâmicas (forte/piano) mantendo o mesmo pulso.$$, '2025-12-08 15:15:17.045176+00'::timestamptz, '2025-12-08 15:15:17.045176+00'::timestamptz, '2025-12-08 15:15:17.045176+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;