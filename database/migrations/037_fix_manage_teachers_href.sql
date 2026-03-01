-- =============================================
-- Migration: 037_fix_manage_teachers_href.sql
-- Fixes manage-teachers navigation item: href was /students, should be /teachers
-- =============================================

UPDATE iam.navigation_items
SET href = '/teachers'
WHERE slug = 'manage-teachers';
