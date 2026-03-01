-- =============================================
-- Migration: 038_public_passthrough_views.sql
-- Description: Create thin, auto-updatable passthrough views in public schema
--   for iam.* and core.* tables accessed by server actions.
--   Only the public schema is exposed via PostgREST.
--   RLS on the base tables is enforced via security_invoker = true.
-- =============================================

-- =============================================
-- IAM PASSTHROUGH VIEWS (8 views)
-- =============================================

CREATE OR REPLACE VIEW public.profiles
WITH (security_invoker = true)
AS SELECT * FROM iam.profiles;

CREATE OR REPLACE VIEW public.roles
WITH (security_invoker = true)
AS SELECT * FROM iam.roles;

CREATE OR REPLACE VIEW public.user_roles
WITH (security_invoker = true)
AS SELECT * FROM iam.user_roles;

CREATE OR REPLACE VIEW public.permissions
WITH (security_invoker = true)
AS SELECT * FROM iam.permissions;

CREATE OR REPLACE VIEW public.role_permissions
WITH (security_invoker = true)
AS SELECT * FROM iam.role_permissions;

CREATE OR REPLACE VIEW public.navigation_items
WITH (security_invoker = true)
AS SELECT * FROM iam.navigation_items;

CREATE OR REPLACE VIEW public.role_navigation
WITH (security_invoker = true)
AS SELECT * FROM iam.role_navigation;

CREATE OR REPLACE VIEW public.invitations
WITH (security_invoker = true)
AS SELECT * FROM iam.invitations;

-- =============================================
-- CORE PASSTHROUGH VIEWS (16 views)
-- =============================================

CREATE OR REPLACE VIEW public.courses
WITH (security_invoker = true)
AS SELECT * FROM core.courses;

CREATE OR REPLACE VIEW public.enrollments
WITH (security_invoker = true)
AS SELECT * FROM core.enrollments;

CREATE OR REPLACE VIEW public.attendance
WITH (security_invoker = true)
AS SELECT * FROM core.attendance;

CREATE OR REPLACE VIEW public.lessons
WITH (security_invoker = true)
AS SELECT * FROM core.lessons;

CREATE OR REPLACE VIEW public.lesson_progress
WITH (security_invoker = true)
AS SELECT * FROM core.lesson_progress;

CREATE OR REPLACE VIEW public.achievements
WITH (security_invoker = true)
AS SELECT * FROM core.achievements;

CREATE OR REPLACE VIEW public.user_achievements
WITH (security_invoker = true)
AS SELECT * FROM core.user_achievements;

CREATE OR REPLACE VIEW public.portfolios
WITH (security_invoker = true)
AS SELECT * FROM core.portfolios;

CREATE OR REPLACE VIEW public.challenge_submissions
WITH (security_invoker = true)
AS SELECT * FROM core.challenge_submissions;

CREATE OR REPLACE VIEW public.forum_topics
WITH (security_invoker = true)
AS SELECT * FROM core.forum_topics;

CREATE OR REPLACE VIEW public.forum_replies
WITH (security_invoker = true)
AS SELECT * FROM core.forum_replies;

CREATE OR REPLACE VIEW public.forum_likes
WITH (security_invoker = true)
AS SELECT * FROM core.forum_likes;

CREATE OR REPLACE VIEW public.feed_posts
WITH (security_invoker = true)
AS SELECT * FROM core.feed_posts;

CREATE OR REPLACE VIEW public.feed_likes
WITH (security_invoker = true)
AS SELECT * FROM core.feed_likes;

CREATE OR REPLACE VIEW public.feed_comments
WITH (security_invoker = true)
AS SELECT * FROM core.feed_comments;

CREATE OR REPLACE VIEW public.practice_sessions
WITH (security_invoker = true)
AS SELECT * FROM core.practice_sessions;

-- =============================================
-- GRANTS — Principle of Least Privilege
-- RLS on base tables is the real access control.
-- These grants determine which SQL operations can be attempted.
-- =============================================

-- IAM views: admin-managed tables
GRANT SELECT, UPDATE ON public.profiles TO authenticated;
GRANT SELECT, UPDATE ON public.roles TO authenticated;
GRANT SELECT, INSERT, DELETE ON public.user_roles TO authenticated;
GRANT SELECT ON public.permissions TO authenticated;
GRANT SELECT, INSERT, DELETE ON public.role_permissions TO authenticated;
GRANT SELECT ON public.navigation_items TO authenticated;
GRANT SELECT, INSERT, DELETE ON public.role_navigation TO authenticated;
GRANT SELECT, INSERT ON public.invitations TO authenticated;

-- Core views: education & content
GRANT SELECT, INSERT, UPDATE ON public.courses TO authenticated;
GRANT SELECT, INSERT, DELETE ON public.enrollments TO authenticated;
GRANT SELECT, INSERT, UPDATE ON public.attendance TO authenticated;
GRANT SELECT, INSERT, UPDATE ON public.lessons TO authenticated;
GRANT SELECT, INSERT, UPDATE ON public.lesson_progress TO authenticated;
GRANT SELECT, INSERT ON public.achievements TO authenticated;
GRANT SELECT, INSERT, UPDATE ON public.user_achievements TO authenticated;
GRANT SELECT, INSERT, UPDATE ON public.portfolios TO authenticated;
GRANT SELECT, INSERT, UPDATE ON public.challenge_submissions TO authenticated;
GRANT SELECT, INSERT ON public.forum_topics TO authenticated;
GRANT SELECT, INSERT ON public.forum_replies TO authenticated;
GRANT SELECT, INSERT, DELETE ON public.forum_likes TO authenticated;
GRANT SELECT, INSERT, UPDATE ON public.feed_posts TO authenticated;
GRANT SELECT, INSERT, DELETE ON public.feed_likes TO authenticated;
GRANT SELECT, INSERT ON public.feed_comments TO authenticated;
GRANT SELECT, INSERT, DELETE ON public.practice_sessions TO authenticated;

-- Anon: minimal read access
GRANT SELECT ON public.profiles TO anon;
GRANT SELECT ON public.achievements TO anon;

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';
