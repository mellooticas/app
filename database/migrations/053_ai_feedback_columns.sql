-- =============================================
-- Migration 053: AI Feedback columns + Dashboard navigation
-- =============================================

-- 1. Add AI feedback columns to challenge_submissions
ALTER TABLE core.challenge_submissions
  ADD COLUMN IF NOT EXISTS ai_feedback text,
  ADD COLUMN IF NOT EXISTS ai_suggested_grade decimal(5,2);

-- 2. Recreate enriched view (DROP + CREATE because column list changed)
DROP VIEW IF EXISTS public.v_challenge_submissions;

CREATE VIEW public.v_challenge_submissions
WITH (security_invoker = true)
AS
SELECT
    cs.*,
    p.full_name AS student_name,
    p.display_name AS student_display_name,
    ch.title AS challenge_title,
    ch.difficulty AS challenge_difficulty,
    ch.base_points
FROM core.challenge_submissions cs
LEFT JOIN iam.profiles p ON p.user_id = cs.student_id
LEFT JOIN core.challenges ch ON ch.id = cs.challenge_id;

GRANT SELECT ON public.v_challenge_submissions TO authenticated;

-- 3. Navigation item for AI Dashboard
INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission)
VALUES ('ai-dashboard', 'Dashboard AI', '/settings/ai-dashboard', 'brain', 'settings.view')
ON CONFLICT (slug) DO NOTHING;

-- Add to admin and teacher roles
INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000012', ni.id, NULL, 'Gestão Escolar', 0, 6
FROM iam.navigation_items ni WHERE ni.slug = 'ai-dashboard'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000011', ni.id, NULL, 'Gestão', 0, 5
FROM iam.navigation_items ni WHERE ni.slug = 'ai-dashboard'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';
