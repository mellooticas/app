-- =============================================
-- Migration: 034b_fix_grade_precision.sql
-- Fix: decimal(4,2) only allows up to 99.99; grades can be 100.
-- Changes grade column from decimal(4,2) to decimal(5,2) on two tables.
-- Must drop/recreate dependent views that use SELECT *.
-- =============================================

-- 1. Drop dependent views
DROP VIEW IF EXISTS public.v_portfolios;
DROP VIEW IF EXISTS public.v_challenge_submissions;

-- 2. Alter columns
ALTER TABLE core.portfolios
    ALTER COLUMN grade TYPE decimal(5,2);

ALTER TABLE core.challenge_submissions
    ALTER COLUMN grade TYPE decimal(5,2);

-- 3. Recreate views
CREATE OR REPLACE VIEW public.v_portfolios
WITH (security_invoker = true)
AS
SELECT
    po.*,
    sp.full_name AS student_name,
    sp.avatar_url AS student_avatar,
    i.name AS instrument_name,
    ep.full_name AS evaluator_name,
    (SELECT count(*) FROM core.portfolio_evidence pe WHERE pe.portfolio_id = po.id) AS evidence_count
FROM core.portfolios po
LEFT JOIN iam.profiles sp ON sp.user_id = po.student_id AND sp.tenant_id = po.tenant_id
LEFT JOIN core.instruments i ON i.id = po.instrument_id
LEFT JOIN iam.profiles ep ON ep.user_id = po.evaluated_by AND ep.tenant_id = po.tenant_id
WHERE po.deleted_at IS NULL;

CREATE OR REPLACE VIEW public.v_challenge_submissions
WITH (security_invoker = true)
AS
SELECT
    cs.*,
    ch.title AS challenge_title,
    ch.code AS challenge_code,
    ch.difficulty AS challenge_difficulty,
    sp.full_name AS student_name,
    ep.full_name AS evaluator_name
FROM core.challenge_submissions cs
JOIN core.challenges ch ON ch.id = cs.challenge_id
LEFT JOIN iam.profiles sp ON sp.user_id = cs.student_id AND sp.tenant_id = cs.tenant_id
LEFT JOIN iam.profiles ep ON ep.user_id = cs.evaluated_by AND ep.tenant_id = cs.tenant_id
WHERE cs.deleted_at IS NULL;
