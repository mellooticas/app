-- =============================================
-- Migration 056: Fix Academic Navigation Labels
-- =============================================
-- Corrects labels and group_names to use proper
-- Portuguese accents. Safe to re-run (idempotent UPDATEs).

BEGIN;

-- Fix navigation_items labels
UPDATE iam.navigation_items SET label = 'Acadêmico'  WHERE slug = 'academic'            AND label = 'Academico';
UPDATE iam.navigation_items SET label = 'Currículo'  WHERE slug = 'academic-curriculum'  AND label = 'Curriculo';

-- Fix role_navigation group_names (Teacher)
UPDATE iam.role_navigation
SET group_name = 'Formação'
WHERE role_id = '00000000-0000-0000-0000-000000000011'
  AND group_name = 'Formacao';

-- Fix role_navigation group_names (Admin)
UPDATE iam.role_navigation
SET group_name = 'Gestão Escolar'
WHERE role_id = '00000000-0000-0000-0000-000000000012'
  AND group_name = 'Gestao Escolar';

NOTIFY pgrst, 'reload schema';

COMMIT;
