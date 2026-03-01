-- =============================================
-- Nipo School - Views Expansion
-- File: 13_views_expansion.sql
-- Description: Public views for the 17 new tables (12_schema_expansion)
-- ALL views use security_invoker = true so RLS applies
-- Execute AFTER 12_schema_expansion.sql
-- =============================================

-- =============================================
-- Feed Social Views
-- =============================================

CREATE OR REPLACE VIEW public.v_feed_posts
WITH (security_invoker = true)
AS
SELECT
    fp.id,
    fp.tenant_id,
    fp.author_id,
    fp.content_type,
    fp.caption,
    fp.media_url,
    fp.thumbnail_url,
    fp.duration_seconds,
    fp.visibility,
    fp.challenge_id,
    fp.is_pinned,
    fp.is_featured,
    fp.view_count,
    fp.created_at,
    fp.updated_at,
    ap.full_name AS author_name,
    ap.display_name AS author_display_name,
    ap.avatar_url AS author_avatar,
    ch.title AS challenge_title,
    (SELECT count(*) FROM core.feed_likes fl WHERE fl.post_id = fp.id) AS like_count,
    (SELECT count(*) FROM core.feed_comments fc WHERE fc.post_id = fp.id AND fc.deleted_at IS NULL) AS comment_count
FROM core.feed_posts fp
LEFT JOIN iam.profiles ap ON ap.user_id = fp.author_id AND ap.tenant_id = fp.tenant_id
LEFT JOIN core.challenges ch ON ch.id = fp.challenge_id
WHERE fp.deleted_at IS NULL;

CREATE OR REPLACE VIEW public.v_feed_comments
WITH (security_invoker = true)
AS
SELECT
    fc.id,
    fc.tenant_id,
    fc.post_id,
    fc.author_id,
    fc.content,
    fc.parent_id,
    fc.created_at,
    ap.full_name AS author_name,
    ap.display_name AS author_display_name,
    ap.avatar_url AS author_avatar,
    (SELECT count(*) FROM core.feed_likes fl WHERE fl.comment_id = fc.id) AS like_count,
    (SELECT count(*) FROM core.feed_comments child WHERE child.parent_id = fc.id AND child.deleted_at IS NULL) AS reply_count
FROM core.feed_comments fc
LEFT JOIN iam.profiles ap ON ap.user_id = fc.author_id AND ap.tenant_id = fc.tenant_id
WHERE fc.deleted_at IS NULL;

CREATE OR REPLACE VIEW public.v_feed_likes
WITH (security_invoker = true)
AS
SELECT
    fl.id,
    fl.tenant_id,
    fl.user_id,
    fl.post_id,
    fl.comment_id,
    fl.created_at,
    ap.full_name AS user_name,
    ap.avatar_url AS user_avatar
FROM core.feed_likes fl
LEFT JOIN iam.profiles ap ON ap.user_id = fl.user_id AND ap.tenant_id = fl.tenant_id;

-- =============================================
-- Practice Diary Views
-- =============================================

CREATE OR REPLACE VIEW public.v_practice_sessions
WITH (security_invoker = true)
AS
SELECT
    ps.id,
    ps.tenant_id,
    ps.student_id,
    ps.instrument_id,
    ps.duration_minutes,
    ps.practice_type,
    ps.mood,
    ps.notes,
    ps.media_url,
    ps.challenge_id,
    ps.session_date,
    ps.created_at,
    sp.full_name AS student_name,
    sp.avatar_url AS student_avatar,
    i.name AS instrument_name,
    ch.title AS challenge_title
FROM core.practice_sessions ps
LEFT JOIN iam.profiles sp ON sp.user_id = ps.student_id AND sp.tenant_id = ps.tenant_id
LEFT JOIN core.instruments i ON i.id = ps.instrument_id
LEFT JOIN core.challenges ch ON ch.id = ps.challenge_id;

-- Aggregated practice stats per student
CREATE OR REPLACE VIEW public.v_practice_stats
WITH (security_invoker = true)
AS
SELECT
    ps.tenant_id,
    ps.student_id,
    sp.full_name AS student_name,
    count(*) AS total_sessions,
    sum(ps.duration_minutes) AS total_minutes,
    round(avg(ps.duration_minutes), 1) AS avg_minutes_per_session,
    count(DISTINCT ps.session_date) AS unique_days,
    count(DISTINCT ps.instrument_id) AS instruments_practiced,
    max(ps.session_date) AS last_practice_date,
    min(ps.session_date) AS first_practice_date,
    -- Current week stats
    count(*) FILTER (WHERE ps.session_date >= date_trunc('week', CURRENT_DATE)) AS sessions_this_week,
    COALESCE(sum(ps.duration_minutes) FILTER (WHERE ps.session_date >= date_trunc('week', CURRENT_DATE)), 0) AS minutes_this_week
FROM core.practice_sessions ps
LEFT JOIN iam.profiles sp ON sp.user_id = ps.student_id AND sp.tenant_id = ps.tenant_id
GROUP BY ps.tenant_id, ps.student_id, sp.full_name;

-- =============================================
-- AI / Adaptive Learning Views
-- =============================================

CREATE OR REPLACE VIEW public.v_student_learning_profiles
WITH (security_invoker = true)
AS
SELECT
    slp.id,
    slp.tenant_id,
    slp.user_id,
    slp.preferred_style,
    slp.current_focus_areas,
    slp.strengths,
    slp.areas_for_growth,
    slp.weekly_goal_minutes,
    slp.preferred_difficulty,
    slp.ai_notes,
    slp.last_recommendation_at,
    slp.created_at,
    slp.updated_at,
    sp.full_name AS student_name,
    sp.avatar_url AS student_avatar,
    -- Practice progress vs goal
    COALESCE(
        (SELECT sum(ps.duration_minutes)
         FROM core.practice_sessions ps
         WHERE ps.student_id = slp.user_id
           AND ps.tenant_id = slp.tenant_id
           AND ps.session_date >= date_trunc('week', CURRENT_DATE)),
        0
    ) AS minutes_practiced_this_week
FROM core.student_learning_profiles slp
LEFT JOIN iam.profiles sp ON sp.user_id = slp.user_id AND sp.tenant_id = slp.tenant_id;

CREATE OR REPLACE VIEW public.v_learning_recommendations
WITH (security_invoker = true)
AS
SELECT
    lr.id,
    lr.tenant_id,
    lr.user_id,
    lr.recommendation_type,
    lr.title,
    lr.description,
    lr.reference_type,
    lr.reference_id,
    lr.reason,
    lr.priority,
    lr.is_dismissed,
    lr.is_completed,
    lr.created_at,
    sp.full_name AS student_name
FROM core.learning_recommendations lr
LEFT JOIN iam.profiles sp ON sp.user_id = lr.user_id AND sp.tenant_id = lr.tenant_id;

-- =============================================
-- History Expansion Views
-- =============================================

CREATE OR REPLACE VIEW public.v_history_genres
WITH (security_invoker = true)
AS
SELECT
    hg.*,
    hp.name AS origin_period_name
FROM core.history_genres hg
LEFT JOIN core.history_periods hp ON hp.id = hg.origin_period_id
WHERE hg.is_active = true;

CREATE OR REPLACE VIEW public.v_history_movements
WITH (security_invoker = true)
AS
SELECT * FROM core.history_movements
WHERE is_active = true
ORDER BY start_year;

CREATE OR REPLACE VIEW public.v_history_cultural_contexts
WITH (security_invoker = true)
AS
SELECT
    hcc.*,
    hp.name AS period_name
FROM core.history_cultural_contexts hcc
JOIN core.history_periods hp ON hp.id = hcc.period_id
WHERE hcc.is_active = true;

CREATE OR REPLACE VIEW public.v_history_timeline_events
WITH (security_invoker = true)
AS
SELECT
    hte.*,
    hc.full_name AS composer_name,
    hc.artistic_name AS composer_artistic_name,
    hw.title AS work_title,
    hp.name AS period_name
FROM core.history_timeline_events hte
LEFT JOIN core.history_composers hc ON hc.id = hte.composer_id
LEFT JOIN core.history_works hw ON hw.id = hte.work_id
LEFT JOIN core.history_periods hp ON hp.id = hte.period_id
WHERE hte.is_active = true
ORDER BY hte.year, hte.month NULLS LAST, hte.day NULLS LAST;

CREATE OR REPLACE VIEW public.v_history_theory_concepts
WITH (security_invoker = true)
AS
SELECT
    htc.*,
    hp.name AS origin_period_name
FROM core.history_theory_concepts htc
LEFT JOIN core.history_periods hp ON hp.id = htc.origin_period_id
WHERE htc.is_active = true;

CREATE OR REPLACE VIEW public.v_history_instrument_evolution
WITH (security_invoker = true)
AS
SELECT
    hie.*,
    i.name AS instrument_name,
    i.family AS instrument_family,
    hp.name AS period_name
FROM core.history_instrument_evolution hie
JOIN core.instruments i ON i.id = hie.instrument_id
LEFT JOIN core.history_periods hp ON hp.id = hie.period_id
WHERE hie.is_active = true
ORDER BY hie.approximate_year;

CREATE OR REPLACE VIEW public.v_history_quizzes
WITH (security_invoker = true)
AS
SELECT
    hq.*,
    hp.name AS period_name
FROM core.history_quizzes hq
LEFT JOIN core.history_periods hp ON hp.id = hq.period_id
WHERE hq.is_active = true;

-- =============================================
-- Education Expansion Views
-- =============================================

CREATE OR REPLACE VIEW public.v_lesson_checklists
WITH (security_invoker = true)
AS
SELECT
    lc.*,
    l.title AS lesson_title,
    l.scheduled_date AS lesson_date
FROM core.lesson_checklists lc
JOIN core.lessons l ON l.id = lc.lesson_id;

CREATE OR REPLACE VIEW public.v_teaching_sequences
WITH (security_invoker = true)
AS
SELECT
    ts.*,
    m.name AS methodology_name,
    m.code AS methodology_code,
    cp.full_name AS creator_name
FROM core.teaching_sequences ts
LEFT JOIN core.methodologies m ON m.id = ts.methodology_id
LEFT JOIN iam.profiles cp ON cp.user_id = ts.created_by AND cp.tenant_id = ts.tenant_id;

CREATE OR REPLACE VIEW public.v_support_materials
WITH (security_invoker = true)
AS
SELECT
    sm.*,
    mod.name AS module_name,
    m.name AS methodology_name,
    i.name AS instrument_name
FROM core.support_materials sm
LEFT JOIN core.modules mod ON mod.id = sm.module_id
LEFT JOIN core.methodologies m ON m.id = sm.methodology_id
LEFT JOIN core.instruments i ON i.id = sm.instrument_id
WHERE sm.is_active = true;

-- =============================================
-- Inventory Views
-- =============================================

CREATE OR REPLACE VIEW public.v_instrument_inventory
WITH (security_invoker = true)
AS
SELECT
    ii.*,
    i.name AS instrument_name,
    i.family AS instrument_family,
    u.name AS unit_name
FROM core.instrument_inventory ii
JOIN core.instruments i ON i.id = ii.instrument_id
LEFT JOIN iam.units u ON u.id = ii.unit_id;

-- Inventory summary per instrument per unit
CREATE OR REPLACE VIEW public.v_inventory_summary
WITH (security_invoker = true)
AS
SELECT
    ii.tenant_id,
    ii.instrument_id,
    i.name AS instrument_name,
    i.family AS instrument_family,
    ii.unit_id,
    u.name AS unit_name,
    count(*) AS total_items,
    count(*) FILTER (WHERE ii.is_available = true) AS available_items,
    count(*) FILTER (WHERE ii.condition = 'damaged' OR ii.condition = 'poor') AS needs_attention,
    COALESCE(sum(ii.acquisition_value), 0) AS total_value
FROM core.instrument_inventory ii
JOIN core.instruments i ON i.id = ii.instrument_id
LEFT JOIN iam.units u ON u.id = ii.unit_id
GROUP BY ii.tenant_id, ii.instrument_id, i.name, i.family, ii.unit_id, u.name;

-- =============================================
-- Updated Dashboard Views (include new tables)
-- =============================================

-- Extend student dashboard with practice and feed data
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
    (SELECT count(*) FROM core.notifications n WHERE n.user_id = up.user_id AND n.tenant_id = up.tenant_id AND n.is_read = false) AS unread_notifications,
    -- New: Practice stats
    (SELECT count(*) FROM core.practice_sessions ps WHERE ps.student_id = up.user_id AND ps.tenant_id = up.tenant_id AND ps.session_date >= date_trunc('week', CURRENT_DATE)) AS practice_sessions_this_week,
    (SELECT COALESCE(sum(ps.duration_minutes), 0) FROM core.practice_sessions ps WHERE ps.student_id = up.user_id AND ps.tenant_id = up.tenant_id AND ps.session_date >= date_trunc('week', CURRENT_DATE)) AS practice_minutes_this_week,
    -- New: Feed stats
    (SELECT count(*) FROM core.feed_posts fp WHERE fp.author_id = up.user_id AND fp.tenant_id = up.tenant_id AND fp.deleted_at IS NULL) AS total_posts,
    -- New: Pending recommendations
    (SELECT count(*) FROM core.learning_recommendations lr WHERE lr.user_id = up.user_id AND lr.tenant_id = up.tenant_id AND lr.is_dismissed = false AND lr.is_completed = false) AS pending_recommendations,
    -- New: Weekly goal progress
    (SELECT slp.weekly_goal_minutes FROM core.student_learning_profiles slp WHERE slp.user_id = up.user_id AND slp.tenant_id = up.tenant_id) AS weekly_goal_minutes
FROM core.user_progress up;

-- Extend admin dashboard with new table counts
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
    (SELECT count(*) FROM core.instruments i WHERE i.tenant_id = t.id AND i.is_active = true) AS total_instruments,
    -- New: Feed activity
    (SELECT count(*) FROM core.feed_posts fp WHERE fp.tenant_id = t.id AND fp.deleted_at IS NULL) AS total_feed_posts,
    (SELECT count(*) FROM core.feed_posts fp WHERE fp.tenant_id = t.id AND fp.deleted_at IS NULL AND fp.created_at >= CURRENT_DATE - interval '7 days') AS feed_posts_last_week,
    -- New: Practice activity
    (SELECT count(DISTINCT ps.student_id) FROM core.practice_sessions ps WHERE ps.tenant_id = t.id AND ps.session_date >= CURRENT_DATE - interval '7 days') AS active_practitioners_last_week,
    (SELECT COALESCE(sum(ps.duration_minutes), 0) FROM core.practice_sessions ps WHERE ps.tenant_id = t.id AND ps.session_date >= CURRENT_DATE - interval '7 days') AS practice_minutes_last_week,
    -- New: Inventory
    (SELECT count(*) FROM core.instrument_inventory ii WHERE ii.tenant_id = t.id) AS inventory_total_items,
    (SELECT count(*) FROM core.instrument_inventory ii WHERE ii.tenant_id = t.id AND ii.is_available = true) AS inventory_available_items,
    -- New: Support materials
    (SELECT count(*) FROM core.support_materials sm WHERE sm.tenant_id = t.id AND sm.is_active = true) AS total_support_materials
FROM iam.tenants t;

-- =============================================
-- Grant access on new views to authenticated
-- =============================================
GRANT SELECT ON ALL TABLES IN SCHEMA public TO authenticated;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO anon;

-- =============================================
-- Summary
-- =============================================
-- New views: 19
--   Feed: v_feed_posts, v_feed_comments, v_feed_likes
--   Practice: v_practice_sessions, v_practice_stats
--   AI: v_student_learning_profiles, v_learning_recommendations
--   History: v_history_genres, v_history_movements, v_history_cultural_contexts,
--            v_history_timeline_events, v_history_theory_concepts,
--            v_history_instrument_evolution, v_history_quizzes
--   Education: v_lesson_checklists, v_teaching_sequences, v_support_materials
--   Inventory: v_instrument_inventory, v_inventory_summary
-- Updated views: 2 (v_dashboard_student, v_dashboard_admin) - extended with new data
-- Total views: 23 + 19 = 42

NOTIFY pgrst, 'reload schema';
