-- =============================================
-- Migration 040: Lesson Sub-table Views
-- =============================================
-- Enriched read views + passthrough write views for lesson
-- sub-tables: materials, activities, criteria, comments, etc.
--
-- These enable the full lesson detail page (3 tabs)
-- and teacher/admin management features.
-- =============================================

BEGIN;

-- =============================================
-- ENRICHED READ VIEWS
-- =============================================

-- 1. v_lesson_materials — materials + lesson context
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

-- 2. v_lesson_activities — activities + lesson context
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

-- 3. v_evaluation_criteria — criteria + lesson context
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

-- 4. v_lesson_comments — comments + author info + lesson context
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

-- 5. v_lesson_checklists — drop + recreate (adding lesson_number column)
DROP VIEW IF EXISTS public.v_lesson_checklists;
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
-- PASSTHROUGH WRITE VIEWS
-- =============================================

-- 6. lesson_materials
CREATE OR REPLACE VIEW public.lesson_materials
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_materials;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.lesson_materials TO authenticated;

-- 7. lesson_activities
CREATE OR REPLACE VIEW public.lesson_activities
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_activities;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.lesson_activities TO authenticated;

-- 8. evaluation_criteria
CREATE OR REPLACE VIEW public.evaluation_criteria
WITH (security_invoker = true)
AS SELECT * FROM core.evaluation_criteria;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.evaluation_criteria TO authenticated;

-- 9. lesson_checklists
CREATE OR REPLACE VIEW public.lesson_checklists
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_checklists;

GRANT SELECT, INSERT, UPDATE ON public.lesson_checklists TO authenticated;

-- 10. lesson_favorites
CREATE OR REPLACE VIEW public.lesson_favorites
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_favorites;

GRANT SELECT, INSERT, DELETE ON public.lesson_favorites TO authenticated;

-- 11. lesson_comments
CREATE OR REPLACE VIEW public.lesson_comments
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_comments;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.lesson_comments TO authenticated;

-- 12. lesson_tags
CREATE OR REPLACE VIEW public.lesson_tags
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_tags;

GRANT SELECT, INSERT, DELETE ON public.lesson_tags TO authenticated;

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';

COMMIT;
