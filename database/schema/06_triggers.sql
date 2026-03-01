-- =============================================
-- Nipo School - New Database Schema
-- File: 06_triggers.sql
-- Description: Automatic triggers for timestamps, gamification, etc.
-- =============================================

-- =============================================
-- 1. Generic updated_at trigger function
-- =============================================
CREATE OR REPLACE FUNCTION public.fn_set_updated_at()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;

-- Apply to all tables with updated_at column
-- IAM
CREATE TRIGGER set_updated_at BEFORE UPDATE ON iam.tenants
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON iam.profiles
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

-- Core - Education
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.courses
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.lessons
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.lesson_progress
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.lesson_comments
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

-- Core - Instruments
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.instruments
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

-- Core - Content
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.repertoire
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

-- Core - Gamification
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.user_achievements
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.user_progress
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

-- Core - Portfolio
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.portfolios
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

-- Core - Challenges
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.challenges
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.challenge_submissions
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.methodology_progress
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

-- Core - Community
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.forum_topics
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.forum_replies
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

-- =============================================
-- 2. Auto-create profile on auth.users insert
-- =============================================
CREATE OR REPLACE FUNCTION public.fn_on_auth_user_created()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = iam
AS $$
DECLARE
    v_tenant_id uuid;
    v_role_id uuid;
BEGIN
    -- Get first active tenant (for initial setup / single-tenant mode)
    SELECT id INTO v_tenant_id FROM iam.tenants WHERE is_active = true LIMIT 1;

    IF v_tenant_id IS NULL THEN
        RETURN NEW;
    END IF;

    -- Create profile
    INSERT INTO iam.profiles (user_id, tenant_id, full_name, display_name)
    VALUES (
        NEW.id,
        v_tenant_id,
        COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.email),
        COALESCE(NEW.raw_user_meta_data->>'display_name', split_part(NEW.email, '@', 1))
    )
    ON CONFLICT (user_id, tenant_id) DO NOTHING;

    -- Assign default 'student' role
    SELECT id INTO v_role_id
    FROM iam.roles
    WHERE tenant_id = v_tenant_id AND slug = 'student' AND is_active = true;

    IF v_role_id IS NOT NULL THEN
        INSERT INTO iam.user_roles (user_id, tenant_id, role_id)
        VALUES (NEW.id, v_tenant_id, v_role_id)
        ON CONFLICT (user_id, tenant_id, role_id) DO NOTHING;
    END IF;

    -- Create initial gamification progress
    INSERT INTO core.user_progress (tenant_id, user_id)
    VALUES (v_tenant_id, NEW.id)
    ON CONFLICT (tenant_id, user_id) DO NOTHING;

    RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.fn_on_auth_user_created();

-- =============================================
-- 3. Auto-update user_progress when points are logged
-- =============================================
CREATE OR REPLACE FUNCTION core.fn_on_points_awarded()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core
AS $$
DECLARE
    v_total integer;
    v_new_level integer;
    v_level_name varchar(50);
    v_xp_to_next integer;
BEGIN
    -- Update total points
    UPDATE core.user_progress
    SET total_points = total_points + NEW.points
    WHERE tenant_id = NEW.tenant_id AND user_id = NEW.user_id;

    -- Get updated total
    SELECT total_points INTO v_total
    FROM core.user_progress
    WHERE tenant_id = NEW.tenant_id AND user_id = NEW.user_id;

    -- Calculate level based on points thresholds
    SELECT
        CASE
            WHEN v_total >= 5000 THEN 7
            WHEN v_total >= 2000 THEN 6
            WHEN v_total >= 1000 THEN 5
            WHEN v_total >= 500  THEN 4
            WHEN v_total >= 250  THEN 3
            WHEN v_total >= 100  THEN 2
            ELSE 1
        END,
        CASE
            WHEN v_total >= 5000 THEN 'Legend'
            WHEN v_total >= 2000 THEN 'Grand Master'
            WHEN v_total >= 1000 THEN 'Master'
            WHEN v_total >= 500  THEN 'Experienced'
            WHEN v_total >= 250  THEN 'Practitioner'
            WHEN v_total >= 100  THEN 'Apprentice'
            ELSE 'Beginner'
        END,
        CASE
            WHEN v_total >= 5000 THEN 99999
            WHEN v_total >= 2000 THEN 5000
            WHEN v_total >= 1000 THEN 2000
            WHEN v_total >= 500  THEN 1000
            WHEN v_total >= 250  THEN 500
            WHEN v_total >= 100  THEN 250
            ELSE 100
        END
    INTO v_new_level, v_level_name, v_xp_to_next;

    -- Update level info
    UPDATE core.user_progress
    SET level = v_new_level,
        level_name = v_level_name,
        current_xp = v_total,
        xp_to_next_level = v_xp_to_next
    WHERE tenant_id = NEW.tenant_id AND user_id = NEW.user_id;

    RETURN NEW;
END;
$$;

CREATE TRIGGER on_points_awarded
    AFTER INSERT ON core.points_log
    FOR EACH ROW EXECUTE FUNCTION core.fn_on_points_awarded();

-- =============================================
-- 4. Auto-award points when lesson is completed
-- =============================================
CREATE OR REPLACE FUNCTION core.fn_on_lesson_completed()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core
AS $$
BEGIN
    -- Only trigger when lesson is newly completed
    IF NEW.is_completed = true AND (OLD IS NULL OR OLD.is_completed = false) THEN
        -- Award 50 points for completing a lesson
        INSERT INTO core.points_log (tenant_id, user_id, points, source, action, reference_type, reference_id)
        VALUES (NEW.tenant_id, NEW.student_id, 50, 'lesson', 'complete', 'lesson', NEW.lesson_id);

        -- Increment lessons_completed counter
        UPDATE core.user_progress
        SET lessons_completed = lessons_completed + 1
        WHERE tenant_id = NEW.tenant_id AND user_id = NEW.student_id;
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER on_lesson_completed
    AFTER INSERT OR UPDATE OF is_completed ON core.lesson_progress
    FOR EACH ROW EXECUTE FUNCTION core.fn_on_lesson_completed();

-- =============================================
-- 5. Auto-award points when portfolio is submitted
-- =============================================
CREATE OR REPLACE FUNCTION core.fn_on_portfolio_submitted()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core
AS $$
DECLARE
    v_points integer;
BEGIN
    -- Only trigger when status changes to 'submitted'
    IF NEW.status = 'submitted' AND (OLD IS NULL OR OLD.status <> 'submitted') THEN
        -- Points based on work type
        v_points := CASE NEW.work_type
            WHEN 'composition' THEN 100
            WHEN 'performance' THEN 80
            WHEN 'project' THEN 70
            WHEN 'research' THEN 60
            ELSE 50
        END;

        INSERT INTO core.points_log (tenant_id, user_id, points, source, action, reference_type, reference_id)
        VALUES (NEW.tenant_id, NEW.student_id, v_points, 'portfolio', 'submit', 'portfolio', NEW.id);
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER on_portfolio_submitted
    AFTER INSERT OR UPDATE OF status ON core.portfolios
    FOR EACH ROW EXECUTE FUNCTION core.fn_on_portfolio_submitted();

-- =============================================
-- 6. Auto-award points when achievement is unlocked
-- =============================================
CREATE OR REPLACE FUNCTION core.fn_on_achievement_unlocked()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core
AS $$
DECLARE
    v_points integer;
BEGIN
    IF NEW.is_completed = true AND (OLD IS NULL OR OLD.is_completed = false) THEN
        -- Get points reward from achievement definition
        SELECT points_reward INTO v_points
        FROM core.achievements WHERE id = NEW.achievement_id;

        IF v_points > 0 THEN
            INSERT INTO core.points_log (tenant_id, user_id, points, source, action, reference_type, reference_id)
            VALUES (NEW.tenant_id, NEW.user_id, v_points, 'achievement', 'unlock', 'achievement', NEW.achievement_id);
        END IF;

        -- Update achievements_unlocked counter
        UPDATE core.user_progress
        SET achievements_unlocked = achievements_unlocked + 1
        WHERE tenant_id = NEW.tenant_id AND user_id = NEW.user_id;

        -- Create notification
        INSERT INTO core.notifications (tenant_id, user_id, title, message, notification_type, reference_type, reference_id)
        SELECT NEW.tenant_id, NEW.user_id,
               'Achievement Unlocked!',
               'You earned: ' || a.name,
               'achievement',
               'achievement', NEW.achievement_id
        FROM core.achievements a WHERE a.id = NEW.achievement_id;
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER on_achievement_unlocked
    AFTER INSERT OR UPDATE OF is_completed ON core.user_achievements
    FOR EACH ROW EXECUTE FUNCTION core.fn_on_achievement_unlocked();
