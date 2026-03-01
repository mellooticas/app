-- =============================================
-- Cleanup: Remove Year 2 data before re-inserting
-- Run this BEFORE re-applying 041–045
-- =============================================

BEGIN;

-- Delete sub-tables first (foreign key order)
DELETE FROM core.lesson_checklists WHERE lesson_id IN (SELECT id FROM core.lessons WHERE number >= 30);
DELETE FROM core.evaluation_criteria WHERE lesson_id IN (SELECT id FROM core.lessons WHERE number >= 30);
DELETE FROM core.lesson_materials WHERE lesson_id IN (SELECT id FROM core.lessons WHERE number >= 30);
DELETE FROM core.lesson_activities WHERE lesson_id IN (SELECT id FROM core.lessons WHERE number >= 30);

-- Delete lessons
DELETE FROM core.lessons WHERE number >= 30;

COMMIT;
