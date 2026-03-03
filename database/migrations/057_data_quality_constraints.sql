-- =============================================
-- Migration 057: Data Quality Constraints
-- =============================================
-- Adds CHECK constraints to enforce data integrity
-- on critical tables. All constraints are additive
-- and safe to run on existing data (using IS NULL guards).

BEGIN;

-- =============================================
-- Grade range constraints (0-10 scale)
-- =============================================

ALTER TABLE core.portfolios
  ADD CONSTRAINT chk_portfolios_grade
  CHECK (grade IS NULL OR (grade >= 0 AND grade <= 10));

ALTER TABLE core.challenge_submissions
  ADD CONSTRAINT chk_submissions_grade
  CHECK (grade IS NULL OR (grade >= 0 AND grade <= 10));

ALTER TABLE core.challenge_submissions
  ADD CONSTRAINT chk_submissions_ai_grade
  CHECK (ai_suggested_grade IS NULL OR (ai_suggested_grade >= 0 AND ai_suggested_grade <= 10));

-- =============================================
-- Evaluation integrity
-- =============================================

ALTER TABLE core.evaluation_rubrics
  ADD CONSTRAINT chk_rubrics_score_lte_max
  CHECK (score IS NULL OR score <= max_score);

-- =============================================
-- Non-negative counters and points
-- =============================================

ALTER TABLE core.feed_posts
  ADD CONSTRAINT chk_posts_view_count_gte0
  CHECK (view_count >= 0);

ALTER TABLE core.challenges
  ADD CONSTRAINT chk_challenges_base_points_gt0
  CHECK (base_points > 0);

ALTER TABLE core.alpha_queue
  ADD CONSTRAINT chk_alpha_points_reward_gte0
  CHECK (points_reward IS NULL OR points_reward >= 0);

-- =============================================
-- Activity duration
-- =============================================

ALTER TABLE core.lesson_activities
  ADD CONSTRAINT chk_activities_duration_gt0
  CHECK (duration_minutes IS NULL OR duration_minutes > 0);

-- =============================================
-- Library tags default
-- =============================================

ALTER TABLE core.library_items
  ALTER COLUMN tags SET DEFAULT '{}';

NOTIFY pgrst, 'reload schema';

COMMIT;
