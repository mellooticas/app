-- =============================================
-- Migration 061: Superadmin & Data Quality Navigation
-- =============================================
-- Adds navigation items for superadmin dashboard
-- and data quality page, visible to admin role only.

BEGIN;

-- Insert navigation items
INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission, is_active)
VALUES
  ('superadmin', 'Superadmin', '/settings/superadmin', 'shield-check', 'settings.manage', true),
  ('data-quality', 'Qualidade de Dados', '/settings/data-quality', 'database', 'settings.manage', true)
ON CONFLICT (slug) DO NOTHING;

-- Assign to admin role navigation
INSERT INTO iam.role_navigation (role_id, navigation_item_id, group_name, group_order, item_order, is_active)
SELECT
  '00000000-0000-0000-0000-000000000012',
  ni.id,
  'Gestão Escolar',
  4,
  CASE ni.slug
    WHEN 'superadmin' THEN 60
    WHEN 'data-quality' THEN 61
  END,
  true
FROM iam.navigation_items ni
WHERE ni.slug IN ('superadmin', 'data-quality')
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

NOTIFY pgrst, 'reload schema';

COMMIT;
