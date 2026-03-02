-- =============================================
-- Migration 055d: Academic Navigation
-- =============================================
-- Adds Academic section to sidebar for all roles.
-- Run AFTER 055a. Safe to re-run (ON CONFLICT DO NOTHING).

BEGIN;

-- Academic hub
INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission)
VALUES ('academic', 'Acadêmico', '/academic', 'book-open', 'lessons.view')
ON CONFLICT (slug) DO NOTHING;

-- Curriculum sub-item
INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission)
VALUES ('academic-curriculum', 'Currículo', '/academic/curriculum', 'graduation-cap', 'lessons.view')
ON CONFLICT (slug) DO NOTHING;

-- Library sub-item
INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission)
VALUES ('academic-library', 'Biblioteca', '/academic/library', 'library', 'lessons.view')
ON CONFLICT (slug) DO NOTHING;

-- Role assignments: Student
INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000010', ni.id, NULL, 'Aprendizado', 1, 5
FROM iam.navigation_items ni WHERE ni.slug = 'academic'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000010', ni.id, NULL, 'Aprendizado', 1, 6
FROM iam.navigation_items ni WHERE ni.slug = 'academic-curriculum'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000010', ni.id, NULL, 'Aprendizado', 1, 7
FROM iam.navigation_items ni WHERE ni.slug = 'academic-library'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

-- Role assignments: Teacher
INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000011', ni.id, NULL, 'Formação', 2, 5
FROM iam.navigation_items ni WHERE ni.slug = 'academic'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000011', ni.id, NULL, 'Formação', 2, 6
FROM iam.navigation_items ni WHERE ni.slug = 'academic-curriculum'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000011', ni.id, NULL, 'Formação', 2, 7
FROM iam.navigation_items ni WHERE ni.slug = 'academic-library'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

-- Role assignments: Admin
INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000012', ni.id, NULL, 'Gestão Escolar', 0, 8
FROM iam.navigation_items ni WHERE ni.slug = 'academic'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000012', ni.id, NULL, 'Gestão Escolar', 0, 9
FROM iam.navigation_items ni WHERE ni.slug = 'academic-curriculum'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000012', ni.id, NULL, 'Gestão Escolar', 0, 10
FROM iam.navigation_items ni WHERE ni.slug = 'academic-library'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';

COMMIT;
