-- =============================================
-- Migration: 034_enrollments.sql
-- Table: core.enrollments
-- Source CSV: matriculas_rows.csv
-- Generated: 2026-02-28T16:15:03.873Z
-- Rows: 6
-- =============================================

BEGIN;

INSERT INTO core.enrollments (tenant_id, id, course_id, student_id, status, enrolled_at, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '468451ab-8e2d-4fa7-a7bb-aad479662d2d', '6b144088-27f3-421a-92be-24a1e4a05661', 'c91f1974-e102-46dd-b1c3-ba3f06c039af', 'active', '2025-05-30'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (course_id, student_id) DO NOTHING;

INSERT INTO core.enrollments (tenant_id, id, course_id, student_id, status, enrolled_at, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '5ad70103-4f36-44e5-bd55-4c5f07b875cf', '6b144088-27f3-421a-92be-24a1e4a05661', '54e79a05-59f7-4cc8-b67f-f522a1b452e4', 'active', '2025-05-30'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (course_id, student_id) DO NOTHING;

INSERT INTO core.enrollments (tenant_id, id, course_id, student_id, status, enrolled_at, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', '83d410a4-4f56-44a7-a9d9-a91d0fc3e098', '6b144088-27f3-421a-92be-24a1e4a05661', 'b37a40d9-ba6c-465f-abfc-c441b47edb4d', 'active', '2025-05-30'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (course_id, student_id) DO NOTHING;

INSERT INTO core.enrollments (tenant_id, id, course_id, student_id, status, enrolled_at, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b8611baf-a6f1-4069-ad16-2b43da335235', 'fc0750bd-9ce4-4f1d-8003-3daed93e872a', '5697f078-c2f5-4da6-bb6c-db9ec9764d41', 'active', '2025-05-30'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (course_id, student_id) DO NOTHING;

INSERT INTO core.enrollments (tenant_id, id, course_id, student_id, status, enrolled_at, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'be7b6c5f-e0f3-4c44-9e89-ed3da0962749', 'c4a209bd-1e64-4e4c-b16c-d0883eb3d4b1', '2577157b-8ad4-4c64-870d-189dcf962c33', 'active', '2025-10-05'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (course_id, student_id) DO NOTHING;

INSERT INTO core.enrollments (tenant_id, id, course_id, student_id, status, enrolled_at, created_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e4f76855-e43c-431f-8e44-249f1ac02a47', '6b144088-27f3-421a-92be-24a1e4a05661', '1f63bfc3-62d7-48cb-b497-6699cb7d2037', 'active', '2025-05-30'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (course_id, student_id) DO NOTHING;

COMMIT;