-- =============================================
-- Migration 054: Add lesson_number alias to v_lessons
-- =============================================
-- The v_lessons view only exposed `number` while all other views
-- (v_lesson_materials, v_lesson_activities, etc.) use `lesson_number`.
-- This adds `lesson_number` as alias while keeping `number` for
-- backward compatibility with existing pages.

DROP VIEW IF EXISTS public.v_lessons;

CREATE VIEW public.v_lessons
WITH (security_invoker = true)
AS
SELECT
    l.id,
    l.tenant_id,
    l.module_id,
    l.number,
    l.number AS lesson_number,
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

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';
