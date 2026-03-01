-- =============================================
-- Migration: 040_widen_text_columns.sql
-- Widens varchar(200) columns to text for lessons and activities
-- Required before loading Year 2 curriculum (2026)
--
-- Must DROP dependent views first, ALTER columns, then RECREATE views.
-- =============================================

BEGIN;

-- =============================================
-- 1. DROP all dependent views (order matters: enriched first, then passthrough)
-- =============================================

DROP VIEW IF EXISTS public.v_lesson_activities CASCADE;
DROP VIEW IF EXISTS public.v_lesson_materials CASCADE;
DROP VIEW IF EXISTS public.v_evaluation_criteria CASCADE;
DROP VIEW IF EXISTS public.v_lesson_comments CASCADE;
DROP VIEW IF EXISTS public.v_lesson_checklists CASCADE;
DROP VIEW IF EXISTS public.v_lessons CASCADE;
DROP VIEW IF EXISTS public.v_lesson_progress CASCADE;

DROP VIEW IF EXISTS public.lesson_activities CASCADE;
DROP VIEW IF EXISTS public.lesson_materials CASCADE;
DROP VIEW IF EXISTS public.evaluation_criteria CASCADE;
DROP VIEW IF EXISTS public.lesson_checklists CASCADE;
DROP VIEW IF EXISTS public.lesson_favorites CASCADE;
DROP VIEW IF EXISTS public.lesson_comments CASCADE;
DROP VIEW IF EXISTS public.lesson_tags CASCADE;
DROP VIEW IF EXISTS public.lessons CASCADE;

-- =============================================
-- 2. ALTER columns
-- =============================================

ALTER TABLE core.lesson_activities ALTER COLUMN title TYPE text;
ALTER TABLE core.lessons ALTER COLUMN title TYPE text;
ALTER TABLE core.evaluation_criteria ALTER COLUMN name TYPE text;

-- =============================================
-- 3. RECREATE enriched read views
-- =============================================

-- v_lessons
CREATE OR REPLACE VIEW public.v_lessons
WITH (security_invoker = true)
AS
SELECT
    l.id,
    l.tenant_id,
    l.module_id,
    l.number,
    l.title,
    l.description,
    l.learning_objective,
    l.scheduled_date,
    l.duration_minutes,
    l.status,
    l.teacher_id,
    l.is_active,
    l.created_at,
    l.updated_at,
    m.name AS module_name,
    tp.full_name AS teacher_name
FROM core.lessons l
LEFT JOIN core.modules m ON m.id = l.module_id
LEFT JOIN iam.profiles tp ON tp.user_id = l.teacher_id AND tp.tenant_id = l.tenant_id
WHERE l.deleted_at IS NULL;

GRANT SELECT ON public.v_lessons TO authenticated;

-- v_lesson_progress
CREATE OR REPLACE VIEW public.v_lesson_progress
WITH (security_invoker = true)
AS
SELECT
    lp.id,
    lp.tenant_id,
    lp.lesson_id,
    lp.student_id,
    lp.is_completed,
    lp.progress_percent,
    lp.notes,
    lp.completed_at,
    lp.created_at,
    l.title AS lesson_title,
    l.number AS lesson_number
FROM core.lesson_progress lp
JOIN core.lessons l ON l.id = lp.lesson_id;

GRANT SELECT ON public.v_lesson_progress TO authenticated;

-- v_lesson_materials
CREATE OR REPLACE VIEW public.v_lesson_materials
WITH (security_invoker = true)
AS
SELECT
    lm.id,
    lm.tenant_id,
    lm.lesson_id,
    lm.title,
    lm.description,
    lm.material_type,
    lm.file_url,
    lm.order_index,
    lm.created_at,
    l.title  AS lesson_title,
    l.number AS lesson_number
FROM core.lesson_materials lm
JOIN core.lessons l ON l.id = lm.lesson_id;

GRANT SELECT ON public.v_lesson_materials TO authenticated;

-- v_lesson_activities
CREATE OR REPLACE VIEW public.v_lesson_activities
WITH (security_invoker = true)
AS
SELECT
    la.id,
    la.tenant_id,
    la.lesson_id,
    la.title,
    la.description,
    la.activity_type,
    la.duration_minutes,
    la.order_index,
    la.created_at,
    l.title  AS lesson_title,
    l.number AS lesson_number
FROM core.lesson_activities la
JOIN core.lessons l ON l.id = la.lesson_id;

GRANT SELECT ON public.v_lesson_activities TO authenticated;

-- v_evaluation_criteria
CREATE OR REPLACE VIEW public.v_evaluation_criteria
WITH (security_invoker = true)
AS
SELECT
    ec.id,
    ec.tenant_id,
    ec.lesson_id,
    ec.name,
    ec.description,
    ec.weight,
    ec.order_index,
    ec.created_at,
    l.title  AS lesson_title,
    l.number AS lesson_number
FROM core.evaluation_criteria ec
JOIN core.lessons l ON l.id = ec.lesson_id;

GRANT SELECT ON public.v_evaluation_criteria TO authenticated;

-- v_lesson_comments
CREATE OR REPLACE VIEW public.v_lesson_comments
WITH (security_invoker = true)
AS
SELECT
    lc.id,
    lc.tenant_id,
    lc.lesson_id,
    lc.user_id,
    lc.content,
    lc.parent_id,
    lc.created_at,
    lc.updated_at,
    p.full_name  AS author_name,
    p.avatar_url AS author_avatar,
    l.title      AS lesson_title
FROM core.lesson_comments lc
JOIN core.lessons l ON l.id = lc.lesson_id
LEFT JOIN iam.profiles p ON p.user_id = lc.user_id AND p.tenant_id = lc.tenant_id
WHERE lc.deleted_at IS NULL;

GRANT SELECT ON public.v_lesson_comments TO authenticated;

-- v_lesson_checklists
CREATE VIEW public.v_lesson_checklists
WITH (security_invoker = true)
AS
SELECT
    lc.id,
    lc.tenant_id,
    lc.lesson_id,
    lc.item,
    lc.checklist_type,
    lc.is_done,
    lc.created_at,
    lc.updated_at,
    l.title          AS lesson_title,
    l.number         AS lesson_number,
    l.scheduled_date AS lesson_date
FROM core.lesson_checklists lc
JOIN core.lessons l ON l.id = lc.lesson_id;

GRANT SELECT ON public.v_lesson_checklists TO authenticated;

-- =============================================
-- 4. RECREATE passthrough write views
-- =============================================

CREATE OR REPLACE VIEW public.lessons
WITH (security_invoker = true)
AS SELECT * FROM core.lessons;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.lessons TO authenticated;

CREATE OR REPLACE VIEW public.lesson_materials
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_materials;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.lesson_materials TO authenticated;

CREATE OR REPLACE VIEW public.lesson_activities
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_activities;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.lesson_activities TO authenticated;

CREATE OR REPLACE VIEW public.evaluation_criteria
WITH (security_invoker = true)
AS SELECT * FROM core.evaluation_criteria;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.evaluation_criteria TO authenticated;

CREATE OR REPLACE VIEW public.lesson_checklists
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_checklists;

GRANT SELECT, INSERT, UPDATE ON public.lesson_checklists TO authenticated;

CREATE OR REPLACE VIEW public.lesson_favorites
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_favorites;

GRANT SELECT, INSERT, DELETE ON public.lesson_favorites TO authenticated;

CREATE OR REPLACE VIEW public.lesson_comments
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_comments;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.lesson_comments TO authenticated;

CREATE OR REPLACE VIEW public.lesson_tags
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_tags;

GRANT SELECT, INSERT, DELETE ON public.lesson_tags TO authenticated;

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';

COMMIT;
