-- =============================================
-- Migration: 036_rbac_permissions_patch.sql
-- Adds missing permissions referenced by navigation_items
-- and the new rbac.manage permission for the admin RBAC panel.
-- =============================================

-- Missing permissions referenced by navigation_items
INSERT INTO iam.permissions (slug, display_name, resource, action) VALUES
    ('feed.view',              'View feed',               'feed',        'view'),
    ('practice.view',          'View practice diary',     'practice',    'view'),
    ('challenges.evaluate',    'Evaluate challenges',     'challenges',  'evaluate'),
    ('students.view',          'View students list',      'students',    'view'),
    ('rbac.manage',            'Manage RBAC settings',    'rbac',        'manage')
ON CONFLICT (slug) DO NOTHING;

-- Assign new permissions to admin role (gets all)
INSERT INTO iam.role_permissions (role_id, permission_id)
SELECT '00000000-0000-0000-0000-000000000012', p.id
FROM iam.permissions p
WHERE p.slug IN ('feed.view', 'practice.view', 'challenges.evaluate', 'students.view', 'rbac.manage')
ON CONFLICT (role_id, permission_id) DO NOTHING;

-- Assign feed.view and practice.view to student role
INSERT INTO iam.role_permissions (role_id, permission_id)
SELECT '00000000-0000-0000-0000-000000000010', p.id
FROM iam.permissions p
WHERE p.slug IN ('feed.view', 'practice.view')
ON CONFLICT (role_id, permission_id) DO NOTHING;

-- Assign feed.view and challenges.evaluate to teacher role
INSERT INTO iam.role_permissions (role_id, permission_id)
SELECT '00000000-0000-0000-0000-000000000011', p.id
FROM iam.permissions p
WHERE p.slug IN ('feed.view', 'challenges.evaluate')
ON CONFLICT (role_id, permission_id) DO NOTHING;
