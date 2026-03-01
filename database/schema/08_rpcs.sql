-- =============================================
-- Nipo School - New Database Schema
-- File: 08_rpcs.sql
-- Description: Public RPCs (API surface for writes and complex reads)
-- All RPCs: validate permission → set tenant_id → execute → return
-- =============================================

-- =============================================
-- 1. rpc_get_user_rbac() - Load role + permissions + navigation
-- =============================================
CREATE OR REPLACE FUNCTION public.rpc_get_user_rbac()
RETURNS jsonb
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = iam, core, internal
AS $$
DECLARE
    v_tenant_id uuid;
    v_user_id uuid;
    v_role jsonb;
    v_permissions jsonb;
    v_navigation jsonb;
    v_role_ids uuid[];
BEGIN
    v_user_id := auth.uid();
    v_tenant_id := (auth.jwt() ->> 'tenant_id')::uuid;

    IF v_tenant_id IS NULL OR v_user_id IS NULL THEN
        RETURN jsonb_build_object('role', NULL, 'permissions', '[]'::jsonb, 'navigation', '[]'::jsonb);
    END IF;

    -- Get role IDs for this user in this tenant
    SELECT array_agg(ur.role_id) INTO v_role_ids
    FROM iam.user_roles ur
    WHERE ur.user_id = v_user_id AND ur.tenant_id = v_tenant_id AND ur.is_active = true;

    -- Get primary role config (highest hierarchy)
    SELECT row_to_json(r)::jsonb INTO v_role
    FROM (
        SELECT r.id, r.slug, r.display_name, r.kanji, r.kanji_meaning,
               r.primary_color, r.secondary_color, r.gradient, r.pattern,
               r.icon_name, r.hierarchy_level, r.is_active
        FROM iam.roles r
        WHERE r.id = ANY(v_role_ids) AND r.is_active = true
        ORDER BY r.hierarchy_level DESC
        LIMIT 1
    ) r;

    -- Get all permissions (union across all roles)
    SELECT COALESCE(jsonb_agg(DISTINCT p.slug), '[]'::jsonb) INTO v_permissions
    FROM iam.role_permissions rp
    JOIN iam.permissions p ON p.id = rp.permission_id
    WHERE rp.role_id = ANY(v_role_ids);

    -- Get navigation for primary role
    SELECT COALESCE(jsonb_agg(nav ORDER BY nav.group_order, nav.item_order), '[]'::jsonb) INTO v_navigation
    FROM (
        SELECT
            ni.slug,
            COALESCE(rn.label_override, ni.label) AS label,
            ni.href,
            ni.icon_name,
            rn.group_name,
            rn.group_order,
            rn.item_order,
            ni.required_permission
        FROM iam.role_navigation rn
        JOIN iam.navigation_items ni ON ni.id = rn.navigation_item_id
        WHERE rn.role_id = (v_role ->> 'id')::uuid
          AND rn.is_active = true
          AND ni.is_active = true
    ) nav;

    RETURN jsonb_build_object(
        'role', v_role,
        'permissions', v_permissions,
        'navigation', v_navigation
    );
END;
$$;

-- =============================================
-- 2. rpc_award_points() - Award points with gamification trigger
-- =============================================
CREATE OR REPLACE FUNCTION public.rpc_award_points(
    p_user_id uuid,
    p_points integer,
    p_source text,
    p_action text DEFAULT NULL,
    p_description text DEFAULT NULL,
    p_reference_type text DEFAULT NULL,
    p_reference_id uuid DEFAULT NULL
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core, iam, internal
AS $$
DECLARE
    v_tenant_id uuid;
    v_log_id uuid;
BEGIN
    v_tenant_id := (auth.jwt() ->> 'tenant_id')::uuid;

    IF NOT internal.fn_has_permission('gamification.manage') THEN
        RAISE EXCEPTION 'Permission denied: gamification.manage required';
    END IF;

    INSERT INTO core.points_log (tenant_id, user_id, points, source, action, description, reference_type, reference_id)
    VALUES (v_tenant_id, p_user_id, p_points, p_source, p_action, p_description, p_reference_type, p_reference_id)
    RETURNING id INTO v_log_id;

    RETURN jsonb_build_object('success', true, 'log_id', v_log_id);
END;
$$;

-- =============================================
-- 3. rpc_complete_lesson() - Student completes a lesson
-- =============================================
CREATE OR REPLACE FUNCTION public.rpc_complete_lesson(
    p_lesson_id uuid,
    p_notes text DEFAULT NULL
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core, internal
AS $$
DECLARE
    v_tenant_id uuid;
    v_user_id uuid;
    v_progress_id uuid;
BEGIN
    v_tenant_id := (auth.jwt() ->> 'tenant_id')::uuid;
    v_user_id := auth.uid();

    -- Upsert lesson progress
    INSERT INTO core.lesson_progress (tenant_id, lesson_id, student_id, is_completed, progress_percent, notes, completed_at)
    VALUES (v_tenant_id, p_lesson_id, v_user_id, true, 100, p_notes, now())
    ON CONFLICT (lesson_id, student_id) DO UPDATE
    SET is_completed = true, progress_percent = 100, notes = COALESCE(p_notes, core.lesson_progress.notes), completed_at = now()
    RETURNING id INTO v_progress_id;

    -- Points awarded via trigger on lesson_progress

    RETURN jsonb_build_object('success', true, 'progress_id', v_progress_id);
END;
$$;

-- =============================================
-- 4. rpc_submit_portfolio() - Student submits portfolio
-- =============================================
CREATE OR REPLACE FUNCTION public.rpc_submit_portfolio(
    p_title text,
    p_description text DEFAULT NULL,
    p_work_type portfolio_type DEFAULT 'project',
    p_instrument_id uuid DEFAULT NULL,
    p_difficulty difficulty_level DEFAULT NULL,
    p_file_url text DEFAULT NULL,
    p_video_url text DEFAULT NULL,
    p_audio_url text DEFAULT NULL,
    p_tags jsonb DEFAULT '[]',
    p_learning_objectives text DEFAULT NULL,
    p_initial_reflection text DEFAULT NULL
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core, internal
AS $$
DECLARE
    v_tenant_id uuid;
    v_user_id uuid;
    v_portfolio_id uuid;
BEGIN
    v_tenant_id := (auth.jwt() ->> 'tenant_id')::uuid;
    v_user_id := auth.uid();

    IF NOT internal.fn_has_permission('portfolios.submit') THEN
        RAISE EXCEPTION 'Permission denied: portfolios.submit required';
    END IF;

    INSERT INTO core.portfolios (
        tenant_id, student_id, title, description, work_type, status,
        instrument_id, difficulty_level, file_url, video_url, audio_url,
        tags, learning_objectives, initial_reflection
    ) VALUES (
        v_tenant_id, v_user_id, p_title, p_description, p_work_type, 'submitted',
        p_instrument_id, p_difficulty, p_file_url, p_video_url, p_audio_url,
        p_tags, p_learning_objectives, p_initial_reflection
    )
    RETURNING id INTO v_portfolio_id;

    -- Points awarded via trigger on portfolios

    RETURN jsonb_build_object('success', true, 'portfolio_id', v_portfolio_id);
END;
$$;

-- =============================================
-- 5. rpc_evaluate_portfolio() - Teacher evaluates portfolio
-- =============================================
CREATE OR REPLACE FUNCTION public.rpc_evaluate_portfolio(
    p_portfolio_id uuid,
    p_grade decimal,
    p_feedback text DEFAULT NULL
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core, internal
AS $$
DECLARE
    v_tenant_id uuid;
    v_user_id uuid;
BEGIN
    v_tenant_id := (auth.jwt() ->> 'tenant_id')::uuid;
    v_user_id := auth.uid();

    IF NOT internal.fn_has_permission('portfolios.grade') THEN
        RAISE EXCEPTION 'Permission denied: portfolios.grade required';
    END IF;

    UPDATE core.portfolios
    SET status = 'evaluated',
        grade = p_grade,
        feedback = p_feedback,
        evaluated_by = v_user_id,
        evaluated_at = now()
    WHERE id = p_portfolio_id AND tenant_id = v_tenant_id;

    RETURN jsonb_build_object('success', true);
END;
$$;

-- =============================================
-- 6. rpc_submit_challenge() - Student submits challenge
-- =============================================
CREATE OR REPLACE FUNCTION public.rpc_submit_challenge(
    p_challenge_id uuid,
    p_response text DEFAULT NULL,
    p_file_url text DEFAULT NULL,
    p_evidence_urls jsonb DEFAULT '[]'
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core, internal
AS $$
DECLARE
    v_tenant_id uuid;
    v_user_id uuid;
    v_submission_id uuid;
BEGIN
    v_tenant_id := (auth.jwt() ->> 'tenant_id')::uuid;
    v_user_id := auth.uid();

    IF NOT internal.fn_has_permission('challenges.participate') THEN
        RAISE EXCEPTION 'Permission denied: challenges.participate required';
    END IF;

    INSERT INTO core.challenge_submissions (
        tenant_id, challenge_id, student_id, response, file_url, evidence_urls, status
    ) VALUES (
        v_tenant_id, p_challenge_id, v_user_id, p_response, p_file_url, p_evidence_urls, 'submitted'
    )
    RETURNING id INTO v_submission_id;

    RETURN jsonb_build_object('success', true, 'submission_id', v_submission_id);
END;
$$;

-- =============================================
-- 7. rpc_evaluate_challenge() - Teacher evaluates challenge submission
-- =============================================
CREATE OR REPLACE FUNCTION public.rpc_evaluate_challenge(
    p_submission_id uuid,
    p_grade decimal,
    p_feedback text DEFAULT NULL
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core, internal
AS $$
DECLARE
    v_tenant_id uuid;
    v_user_id uuid;
    v_challenge_id uuid;
    v_student_id uuid;
    v_base_points integer;
    v_methodology_id uuid;
BEGIN
    v_tenant_id := (auth.jwt() ->> 'tenant_id')::uuid;
    v_user_id := auth.uid();

    IF NOT internal.fn_has_permission('challenges.grade') THEN
        RAISE EXCEPTION 'Permission denied: challenges.grade required';
    END IF;

    -- Update submission
    UPDATE core.challenge_submissions
    SET status = 'evaluated',
        grade = p_grade,
        feedback = p_feedback,
        evaluated_by = v_user_id,
        evaluated_at = now()
    WHERE id = p_submission_id AND tenant_id = v_tenant_id
    RETURNING challenge_id, student_id INTO v_challenge_id, v_student_id;

    -- Get challenge info for points
    SELECT base_points, methodology_id INTO v_base_points, v_methodology_id
    FROM core.challenges WHERE id = v_challenge_id;

    -- Award points based on grade (percentage of base_points)
    IF p_grade IS NOT NULL AND v_base_points > 0 THEN
        INSERT INTO core.points_log (tenant_id, user_id, points, source, action, reference_type, reference_id)
        VALUES (v_tenant_id, v_student_id, GREATEST(1, (p_grade / 10.0 * v_base_points)::integer), 'challenge', 'evaluated', 'challenge_submission', p_submission_id);
    END IF;

    -- Update methodology progress if applicable
    IF v_methodology_id IS NOT NULL THEN
        INSERT INTO core.methodology_progress (tenant_id, user_id, methodology_id, xp)
        VALUES (v_tenant_id, v_student_id, v_methodology_id, COALESCE(v_base_points, 0))
        ON CONFLICT (user_id, methodology_id) DO UPDATE
        SET xp = core.methodology_progress.xp + EXCLUDED.xp;
    END IF;

    RETURN jsonb_build_object('success', true);
END;
$$;

-- =============================================
-- 8. rpc_check_achievements() - Check and unlock achievements
-- =============================================
CREATE OR REPLACE FUNCTION public.rpc_check_achievements(p_user_id uuid DEFAULT NULL)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core, internal
AS $$
DECLARE
    v_tenant_id uuid;
    v_target_user uuid;
    v_progress record;
    v_achievement record;
    v_unlocked integer := 0;
BEGIN
    v_tenant_id := (auth.jwt() ->> 'tenant_id')::uuid;
    v_target_user := COALESCE(p_user_id, auth.uid());

    -- Get current user progress
    SELECT * INTO v_progress
    FROM core.user_progress
    WHERE tenant_id = v_tenant_id AND user_id = v_target_user;

    IF v_progress IS NULL THEN
        RETURN jsonb_build_object('success', true, 'unlocked', 0);
    END IF;

    -- Check each active achievement not yet completed
    FOR v_achievement IN
        SELECT a.*
        FROM core.achievements a
        LEFT JOIN core.user_achievements ua ON ua.achievement_id = a.id AND ua.user_id = v_target_user
        WHERE a.tenant_id = v_tenant_id
          AND a.is_active = true
          AND (ua.is_completed IS NULL OR ua.is_completed = false)
    LOOP
        -- Check if requirement is met
        IF (v_achievement.requirement_type = 'lessons_completed' AND v_progress.lessons_completed >= v_achievement.requirement_value)
        OR (v_achievement.requirement_type = 'total_points' AND v_progress.total_points >= v_achievement.requirement_value)
        OR (v_achievement.requirement_type = 'streak' AND v_progress.current_streak >= v_achievement.requirement_value)
        OR (v_achievement.requirement_type = 'achievements_unlocked' AND v_progress.achievements_unlocked >= v_achievement.requirement_value)
        OR (v_achievement.requirement_type = 'level' AND v_progress.level >= v_achievement.requirement_value)
        THEN
            -- Unlock achievement
            INSERT INTO core.user_achievements (tenant_id, user_id, achievement_id, current_progress, target_progress, is_completed, completed_at)
            VALUES (v_tenant_id, v_target_user, v_achievement.id, v_achievement.requirement_value, v_achievement.requirement_value, true, now())
            ON CONFLICT (user_id, achievement_id) DO UPDATE
            SET is_completed = true, completed_at = now(), current_progress = v_achievement.requirement_value;

            v_unlocked := v_unlocked + 1;
        END IF;
    END LOOP;

    RETURN jsonb_build_object('success', true, 'unlocked', v_unlocked);
END;
$$;

-- =============================================
-- Grant execute on RPCs to authenticated
-- =============================================
GRANT EXECUTE ON FUNCTION public.rpc_get_user_rbac() TO authenticated;
GRANT EXECUTE ON FUNCTION public.rpc_award_points(uuid, integer, text, text, text, text, uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION public.rpc_complete_lesson(uuid, text) TO authenticated;
GRANT EXECUTE ON FUNCTION public.rpc_submit_portfolio(text, text, portfolio_type, uuid, difficulty_level, text, text, text, jsonb, text, text) TO authenticated;
GRANT EXECUTE ON FUNCTION public.rpc_evaluate_portfolio(uuid, decimal, text) TO authenticated;
GRANT EXECUTE ON FUNCTION public.rpc_submit_challenge(uuid, text, text, jsonb) TO authenticated;
GRANT EXECUTE ON FUNCTION public.rpc_evaluate_challenge(uuid, decimal, text) TO authenticated;
GRANT EXECUTE ON FUNCTION public.rpc_check_achievements(uuid) TO authenticated;
