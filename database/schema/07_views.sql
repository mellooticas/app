-- =============================================
-- Nipo School - New Database Schema
-- File: 07_views.sql
-- Description: Public views (API surface for reads)
-- ALL views use security_invoker = true so RLS applies
-- =============================================

-- =============================================
-- IAM Views
-- =============================================

CREATE OR REPLACE VIEW public.v_profiles
WITH (security_invoker = true)
AS
SELECT
    p.id,
    p.user_id,
    p.tenant_id,
    p.unit_id,
    p.full_name,
    p.display_name,
    p.avatar_url,
    p.phone,
    p.birth_date,
    p.locale,
    p.is_active,
    p.created_at,
    p.updated_at,
    u.name AS unit_name,
    COALESCE(
        (SELECT jsonb_agg(jsonb_build_object('slug', r.slug, 'display_name', r.display_name))
         FROM iam.user_roles ur
         JOIN iam.roles r ON r.id = ur.role_id
         WHERE ur.user_id = p.user_id AND ur.tenant_id = p.tenant_id AND ur.is_active = true),
        '[]'::jsonb
    ) AS roles
FROM iam.profiles p
LEFT JOIN iam.units u ON u.id = p.unit_id;

-- =============================================
-- Education Views
-- =============================================

CREATE OR REPLACE VIEW public.v_courses
WITH (security_invoker = true)
AS
SELECT
    c.id,
    c.tenant_id,
    c.unit_id,
    c.name,
    c.description,
    c.instrument_id,
    c.teacher_id,
    c.level,
    c.max_students,
    c.schedule,
    c.start_date,
    c.end_date,
    c.is_active,
    c.created_at,
    c.updated_at,
    i.name AS instrument_name,
    tp.full_name AS teacher_name,
    tp.avatar_url AS teacher_avatar,
    (SELECT count(*) FROM core.enrollments e WHERE e.course_id = c.id AND e.status = 'active') AS active_students
FROM core.courses c
LEFT JOIN core.instruments i ON i.id = c.instrument_id
LEFT JOIN iam.profiles tp ON tp.user_id = c.teacher_id AND tp.tenant_id = c.tenant_id
WHERE c.deleted_at IS NULL;

CREATE OR REPLACE VIEW public.v_enrollments
WITH (security_invoker = true)
AS
SELECT
    e.id,
    e.tenant_id,
    e.course_id,
    e.student_id,
    e.status,
    e.enrolled_at,
    e.completed_at,
    e.created_at,
    c.name AS course_name,
    sp.full_name AS student_name,
    sp.avatar_url AS student_avatar
FROM core.enrollments e
JOIN core.courses c ON c.id = e.course_id
LEFT JOIN iam.profiles sp ON sp.user_id = e.student_id AND sp.tenant_id = e.tenant_id;

CREATE OR REPLACE VIEW public.v_lessons
WITH (security_invoker = true)
AS
SELECT
    l.id,
    l.tenant_id,
    l.module_id,
    l.number,
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

CREATE OR REPLACE VIEW public.v_lesson_progress
WITH (security_invoker = true)
AS
SELECT
    lp.id,
    lp.tenant_id,
    lp.lesson_id,
    lp.student_id,
    lp.is_completed,
    lp.progress_percent,
    lp.notes,
    lp.completed_at,
    lp.created_at,
    l.title AS lesson_title,
    l.number AS lesson_number
FROM core.lesson_progress lp
JOIN core.lessons l ON l.id = lp.lesson_id;

CREATE OR REPLACE VIEW public.v_attendance
WITH (security_invoker = true)
AS
SELECT
    a.id,
    a.tenant_id,
    a.course_id,
    a.lesson_id,
    a.student_id,
    a.date,
    a.is_present,
    a.justification,
    a.notes,
    a.created_at,
    c.name AS course_name,
    sp.full_name AS student_name
FROM core.attendance a
JOIN core.courses c ON c.id = a.course_id
LEFT JOIN iam.profiles sp ON sp.user_id = a.student_id AND sp.tenant_id = a.tenant_id;

-- =============================================
-- Instrument Views
-- =============================================

CREATE OR REPLACE VIEW public.v_instruments
WITH (security_invoker = true)
AS
SELECT
    i.*,
    (SELECT count(*) FROM core.instrument_media im WHERE im.instrument_id = i.id) AS media_count,
    (SELECT count(*) FROM core.instrument_sounds s WHERE s.instrument_id = i.id) AS sounds_count
FROM core.instruments i
WHERE i.is_active = true;

-- =============================================
-- Content Views
-- =============================================

CREATE OR REPLACE VIEW public.v_repertoire
WITH (security_invoker = true)
AS
SELECT
    r.*,
    rc.name AS category_name
FROM core.repertoire r
LEFT JOIN core.repertoire_categories rc ON rc.id = r.category_id
WHERE r.is_active = true;

CREATE OR REPLACE VIEW public.v_history_periods
WITH (security_invoker = true)
AS
SELECT
    hp.*,
    (SELECT count(*) FROM core.history_composers hc WHERE hc.period_id = hp.id) AS composer_count,
    (SELECT count(*) FROM core.history_works hw WHERE hw.period_id = hp.id) AS work_count
FROM core.history_periods hp
WHERE hp.is_active = true
ORDER BY hp.chronological_order;

CREATE OR REPLACE VIEW public.v_history_composers
WITH (security_invoker = true)
AS
SELECT
    hc.*,
    hp.name AS period_name,
    (SELECT count(*) FROM core.history_works hw WHERE hw.composer_id = hc.id) AS work_count
FROM core.history_composers hc
LEFT JOIN core.history_periods hp ON hp.id = hc.period_id
WHERE hc.is_active = true;

CREATE OR REPLACE VIEW public.v_history_works
WITH (security_invoker = true)
AS
SELECT
    hw.*,
    hc.full_name AS composer_name,
    hc.artistic_name AS composer_artistic_name,
    hp.name AS period_name
FROM core.history_works hw
LEFT JOIN core.history_composers hc ON hc.id = hw.composer_id
LEFT JOIN core.history_periods hp ON hp.id = hw.period_id
WHERE hw.is_active = true;

-- =============================================
-- Gamification Views
-- =============================================

CREATE OR REPLACE VIEW public.v_achievements
WITH (security_invoker = true)
AS
SELECT * FROM core.achievements WHERE is_active = true;

CREATE OR REPLACE VIEW public.v_user_achievements
WITH (security_invoker = true)
AS
SELECT
    ua.*,
    a.name AS achievement_name,
    a.description AS achievement_description,
    a.badge_icon,
    a.badge_color,
    a.category AS achievement_category,
    a.points_reward
FROM core.user_achievements ua
JOIN core.achievements a ON a.id = ua.achievement_id;

CREATE OR REPLACE VIEW public.v_user_progress
WITH (security_invoker = true)
AS
SELECT
    up.*,
    p.full_name,
    p.avatar_url
FROM core.user_progress up
LEFT JOIN iam.profiles p ON p.user_id = up.user_id AND p.tenant_id = up.tenant_id;

CREATE OR REPLACE VIEW public.v_points_log
WITH (security_invoker = true)
AS
SELECT * FROM core.points_log ORDER BY created_at DESC;

-- =============================================
-- Portfolio Views
-- =============================================

CREATE OR REPLACE VIEW public.v_portfolios
WITH (security_invoker = true)
AS
SELECT
    po.*,
    sp.full_name AS student_name,
    sp.avatar_url AS student_avatar,
    i.name AS instrument_name,
    ep.full_name AS evaluator_name,
    (SELECT count(*) FROM core.portfolio_evidence pe WHERE pe.portfolio_id = po.id) AS evidence_count
FROM core.portfolios po
LEFT JOIN iam.profiles sp ON sp.user_id = po.student_id AND sp.tenant_id = po.tenant_id
LEFT JOIN core.instruments i ON i.id = po.instrument_id
LEFT JOIN iam.profiles ep ON ep.user_id = po.evaluated_by AND ep.tenant_id = po.tenant_id
WHERE po.deleted_at IS NULL;

-- =============================================
-- Challenge Views
-- =============================================

CREATE OR REPLACE VIEW public.v_challenges
WITH (security_invoker = true)
AS
SELECT
    ch.*,
    m.name AS methodology_name,
    m.code AS methodology_code,
    comp.name AS competency_name,
    (SELECT count(*) FROM core.challenge_submissions cs WHERE cs.challenge_id = ch.id AND cs.deleted_at IS NULL) AS submission_count
FROM core.challenges ch
LEFT JOIN core.methodologies m ON m.id = ch.methodology_id
LEFT JOIN core.competencies comp ON comp.id = ch.competency_id
WHERE ch.is_active = true;

CREATE OR REPLACE VIEW public.v_challenge_submissions
WITH (security_invoker = true)
AS
SELECT
    cs.*,
    ch.title AS challenge_title,
    ch.code AS challenge_code,
    ch.difficulty AS challenge_difficulty,
    sp.full_name AS student_name,
    ep.full_name AS evaluator_name
FROM core.challenge_submissions cs
JOIN core.challenges ch ON ch.id = cs.challenge_id
LEFT JOIN iam.profiles sp ON sp.user_id = cs.student_id AND sp.tenant_id = cs.tenant_id
LEFT JOIN iam.profiles ep ON ep.user_id = cs.evaluated_by AND ep.tenant_id = cs.tenant_id
WHERE cs.deleted_at IS NULL;

-- =============================================
-- Community Views
-- =============================================

CREATE OR REPLACE VIEW public.v_forum_topics
WITH (security_invoker = true)
AS
SELECT
    ft.*,
    ap.full_name AS author_name,
    ap.avatar_url AS author_avatar,
    (SELECT count(*) FROM core.forum_replies fr WHERE fr.topic_id = ft.id AND fr.deleted_at IS NULL) AS reply_count,
    (SELECT count(*) FROM core.forum_likes fl WHERE fl.topic_id = ft.id) AS like_count
FROM core.forum_topics ft
LEFT JOIN iam.profiles ap ON ap.user_id = ft.author_id AND ap.tenant_id = ft.tenant_id
WHERE ft.deleted_at IS NULL;

-- =============================================
-- Notification View
-- =============================================

CREATE OR REPLACE VIEW public.v_notifications
WITH (security_invoker = true)
AS
SELECT * FROM core.notifications ORDER BY created_at DESC;

-- =============================================
-- Dashboard Views (aggregations)
-- =============================================

CREATE OR REPLACE VIEW public.v_dashboard_student
WITH (security_invoker = true)
AS
SELECT
    up.user_id,
    up.tenant_id,
    up.total_points,
    up.level,
    up.level_name,
    up.current_xp,
    up.xp_to_next_level,
    up.current_streak,
    up.longest_streak,
    up.lessons_completed,
    up.achievements_unlocked,
    (SELECT count(*) FROM core.enrollments e WHERE e.student_id = up.user_id AND e.tenant_id = up.tenant_id AND e.status = 'active') AS active_courses,
    (SELECT count(*) FROM core.portfolios p WHERE p.student_id = up.user_id AND p.tenant_id = up.tenant_id AND p.deleted_at IS NULL) AS portfolio_count,
    (SELECT count(*) FROM core.challenge_submissions cs WHERE cs.student_id = up.user_id AND cs.tenant_id = up.tenant_id AND cs.deleted_at IS NULL) AS submissions_count,
    (SELECT count(*) FROM core.notifications n WHERE n.user_id = up.user_id AND n.tenant_id = up.tenant_id AND n.is_read = false) AS unread_notifications
FROM core.user_progress up;

CREATE OR REPLACE VIEW public.v_dashboard_teacher
WITH (security_invoker = true)
AS
SELECT
    p.user_id,
    p.tenant_id,
    (SELECT count(*) FROM core.courses c WHERE c.teacher_id = p.user_id AND c.tenant_id = p.tenant_id AND c.deleted_at IS NULL AND c.is_active = true) AS active_courses,
    (SELECT count(DISTINCT e.student_id) FROM core.enrollments e JOIN core.courses c ON c.id = e.course_id WHERE c.teacher_id = p.user_id AND c.tenant_id = p.tenant_id AND e.status = 'active') AS total_students,
    (SELECT count(*) FROM core.challenge_submissions cs JOIN core.challenges ch ON ch.id = cs.challenge_id WHERE cs.tenant_id = p.tenant_id AND cs.status = 'submitted') AS pending_submissions,
    (SELECT count(*) FROM core.portfolios po WHERE po.tenant_id = p.tenant_id AND po.status = 'submitted') AS pending_portfolios
FROM iam.profiles p;

CREATE OR REPLACE VIEW public.v_dashboard_admin
WITH (security_invoker = true)
AS
SELECT
    t.id AS tenant_id,
    (SELECT count(*) FROM iam.profiles p WHERE p.tenant_id = t.id AND p.is_active = true) AS total_users,
    (SELECT count(*) FROM iam.user_roles ur JOIN iam.roles r ON r.id = ur.role_id WHERE ur.tenant_id = t.id AND r.slug = 'student' AND ur.is_active = true) AS total_students,
    (SELECT count(*) FROM iam.user_roles ur JOIN iam.roles r ON r.id = ur.role_id WHERE ur.tenant_id = t.id AND r.slug = 'teacher' AND ur.is_active = true) AS total_teachers,
    (SELECT count(*) FROM core.courses c WHERE c.tenant_id = t.id AND c.is_active = true AND c.deleted_at IS NULL) AS active_courses,
    (SELECT count(*) FROM core.lessons l WHERE l.tenant_id = t.id AND l.deleted_at IS NULL) AS total_lessons,
    (SELECT count(*) FROM core.instruments i WHERE i.tenant_id = t.id AND i.is_active = true) AS total_instruments
FROM iam.tenants t;

-- =============================================
-- PASSTHROUGH VIEWS (auto-updatable, writable)
-- Thin proxies to iam.* and core.* tables for PostgREST access.
-- RLS on base tables is enforced via security_invoker = true.
-- =============================================

-- IAM passthrough views
CREATE OR REPLACE VIEW public.profiles WITH (security_invoker = true) AS SELECT * FROM iam.profiles;
CREATE OR REPLACE VIEW public.roles WITH (security_invoker = true) AS SELECT * FROM iam.roles;
CREATE OR REPLACE VIEW public.user_roles WITH (security_invoker = true) AS SELECT * FROM iam.user_roles;
CREATE OR REPLACE VIEW public.permissions WITH (security_invoker = true) AS SELECT * FROM iam.permissions;
CREATE OR REPLACE VIEW public.role_permissions WITH (security_invoker = true) AS SELECT * FROM iam.role_permissions;
CREATE OR REPLACE VIEW public.navigation_items WITH (security_invoker = true) AS SELECT * FROM iam.navigation_items;
CREATE OR REPLACE VIEW public.role_navigation WITH (security_invoker = true) AS SELECT * FROM iam.role_navigation;
CREATE OR REPLACE VIEW public.invitations WITH (security_invoker = true) AS SELECT * FROM iam.invitations;

-- Core passthrough views
CREATE OR REPLACE VIEW public.courses WITH (security_invoker = true) AS SELECT * FROM core.courses;
CREATE OR REPLACE VIEW public.enrollments WITH (security_invoker = true) AS SELECT * FROM core.enrollments;
CREATE OR REPLACE VIEW public.attendance WITH (security_invoker = true) AS SELECT * FROM core.attendance;
CREATE OR REPLACE VIEW public.lessons WITH (security_invoker = true) AS SELECT * FROM core.lessons;
CREATE OR REPLACE VIEW public.lesson_progress WITH (security_invoker = true) AS SELECT * FROM core.lesson_progress;
CREATE OR REPLACE VIEW public.achievements WITH (security_invoker = true) AS SELECT * FROM core.achievements;
CREATE OR REPLACE VIEW public.user_achievements WITH (security_invoker = true) AS SELECT * FROM core.user_achievements;
CREATE OR REPLACE VIEW public.portfolios WITH (security_invoker = true) AS SELECT * FROM core.portfolios;
CREATE OR REPLACE VIEW public.challenge_submissions WITH (security_invoker = true) AS SELECT * FROM core.challenge_submissions;
CREATE OR REPLACE VIEW public.forum_topics WITH (security_invoker = true) AS SELECT * FROM core.forum_topics;
CREATE OR REPLACE VIEW public.forum_replies WITH (security_invoker = true) AS SELECT * FROM core.forum_replies;
CREATE OR REPLACE VIEW public.forum_likes WITH (security_invoker = true) AS SELECT * FROM core.forum_likes;
CREATE OR REPLACE VIEW public.feed_posts WITH (security_invoker = true) AS SELECT * FROM core.feed_posts;
CREATE OR REPLACE VIEW public.feed_likes WITH (security_invoker = true) AS SELECT * FROM core.feed_likes;
CREATE OR REPLACE VIEW public.feed_comments WITH (security_invoker = true) AS SELECT * FROM core.feed_comments;
CREATE OR REPLACE VIEW public.practice_sessions WITH (security_invoker = true) AS SELECT * FROM core.practice_sessions;

-- =============================================
-- Grant access on read-only views (v_*)
-- =============================================
GRANT SELECT ON ALL TABLES IN SCHEMA public TO authenticated;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO anon;

-- =============================================
-- Grant CRUD on passthrough views (least privilege)
-- =============================================
GRANT SELECT, UPDATE ON public.profiles TO authenticated;
GRANT SELECT, UPDATE ON public.roles TO authenticated;
GRANT SELECT, INSERT, DELETE ON public.user_roles TO authenticated;
GRANT SELECT ON public.permissions TO authenticated;
GRANT SELECT, INSERT, DELETE ON public.role_permissions TO authenticated;
GRANT SELECT ON public.navigation_items TO authenticated;
GRANT SELECT, INSERT, DELETE ON public.role_navigation TO authenticated;
GRANT SELECT, INSERT ON public.invitations TO authenticated;

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
