-- =============================================
-- Migration 058: Data Completeness Report RPC
-- =============================================
-- Creates an RPC that returns data quality metrics
-- per tenant, reporting missing required fields across
-- critical tables.

BEGIN;

CREATE OR REPLACE FUNCTION public.rpc_data_completeness_report(p_tenant_id uuid)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, core, iam
AS $$
DECLARE
  result jsonb;
  v_profiles_total integer;
  v_profiles_missing_name integer;
  v_profiles_missing_avatar integer;
  v_lessons_total integer;
  v_lessons_missing_objective integer;
  v_lessons_missing_description integer;
  v_submissions_total integer;
  v_submissions_missing_grade integer;
  v_portfolios_total integer;
  v_portfolios_missing_feedback integer;
  v_ai_content_total integer;
  v_ai_content_errors integer;
  v_user_roles_total integer;
  v_user_roles_inactive integer;
BEGIN
  -- Check permission
  IF NOT internal.fn_has_permission('settings.manage') THEN
    RETURN jsonb_build_object('error', 'FORBIDDEN');
  END IF;

  -- Profiles
  SELECT COUNT(*) INTO v_profiles_total
    FROM iam.profiles WHERE tenant_id = p_tenant_id;
  SELECT COUNT(*) INTO v_profiles_missing_name
    FROM iam.profiles WHERE tenant_id = p_tenant_id
    AND (full_name IS NULL OR full_name = '');
  SELECT COUNT(*) INTO v_profiles_missing_avatar
    FROM iam.profiles WHERE tenant_id = p_tenant_id
    AND avatar_url IS NULL;

  -- Lessons
  SELECT COUNT(*) INTO v_lessons_total
    FROM core.lessons WHERE tenant_id = p_tenant_id AND deleted_at IS NULL;
  SELECT COUNT(*) INTO v_lessons_missing_objective
    FROM core.lessons WHERE tenant_id = p_tenant_id AND deleted_at IS NULL
    AND (learning_objective IS NULL OR learning_objective = '');
  SELECT COUNT(*) INTO v_lessons_missing_description
    FROM core.lessons WHERE tenant_id = p_tenant_id AND deleted_at IS NULL
    AND (description IS NULL OR description = '');

  -- Challenge submissions
  SELECT COUNT(*) INTO v_submissions_total
    FROM core.challenge_submissions WHERE tenant_id = p_tenant_id AND deleted_at IS NULL;
  SELECT COUNT(*) INTO v_submissions_missing_grade
    FROM core.challenge_submissions WHERE tenant_id = p_tenant_id AND deleted_at IS NULL
    AND status = 'submitted' AND grade IS NULL;

  -- Portfolios
  SELECT COUNT(*) INTO v_portfolios_total
    FROM core.portfolios WHERE tenant_id = p_tenant_id AND deleted_at IS NULL;
  SELECT COUNT(*) INTO v_portfolios_missing_feedback
    FROM core.portfolios WHERE tenant_id = p_tenant_id AND deleted_at IS NULL
    AND status = 'evaluated' AND (feedback IS NULL OR feedback = '');

  -- AI content
  SELECT COUNT(*) INTO v_ai_content_total
    FROM core.ai_generated_content WHERE tenant_id = p_tenant_id;
  SELECT COUNT(*) INTO v_ai_content_errors
    FROM core.ai_generated_content WHERE tenant_id = p_tenant_id
    AND status = 'error';

  -- User roles
  SELECT COUNT(*) INTO v_user_roles_total
    FROM iam.user_roles ur
    JOIN iam.profiles p ON ur.user_id = p.user_id AND ur.tenant_id = p.tenant_id
    WHERE ur.tenant_id = p_tenant_id;
  SELECT COUNT(*) INTO v_user_roles_inactive
    FROM iam.user_roles
    WHERE tenant_id = p_tenant_id AND is_active = false;

  result := jsonb_build_object(
    'profiles', jsonb_build_object(
      'total', v_profiles_total,
      'missing_name', v_profiles_missing_name,
      'missing_avatar', v_profiles_missing_avatar,
      'completeness_pct', CASE WHEN v_profiles_total > 0
        THEN ROUND(((v_profiles_total - v_profiles_missing_name)::numeric / v_profiles_total) * 100, 1)
        ELSE 100 END
    ),
    'lessons', jsonb_build_object(
      'total', v_lessons_total,
      'missing_objective', v_lessons_missing_objective,
      'missing_description', v_lessons_missing_description,
      'completeness_pct', CASE WHEN v_lessons_total > 0
        THEN ROUND(((v_lessons_total - v_lessons_missing_objective)::numeric / v_lessons_total) * 100, 1)
        ELSE 100 END
    ),
    'challenge_submissions', jsonb_build_object(
      'total', v_submissions_total,
      'pending_grade', v_submissions_missing_grade,
      'completeness_pct', CASE WHEN v_submissions_total > 0
        THEN ROUND(((v_submissions_total - v_submissions_missing_grade)::numeric / v_submissions_total) * 100, 1)
        ELSE 100 END
    ),
    'portfolios', jsonb_build_object(
      'total', v_portfolios_total,
      'missing_feedback', v_portfolios_missing_feedback,
      'completeness_pct', CASE WHEN v_portfolios_total > 0
        THEN ROUND(((v_portfolios_total - v_portfolios_missing_feedback)::numeric / v_portfolios_total) * 100, 1)
        ELSE 100 END
    ),
    'ai_content', jsonb_build_object(
      'total', v_ai_content_total,
      'errors', v_ai_content_errors,
      'health_pct', CASE WHEN v_ai_content_total > 0
        THEN ROUND(((v_ai_content_total - v_ai_content_errors)::numeric / v_ai_content_total) * 100, 1)
        ELSE 100 END
    ),
    'user_roles', jsonb_build_object(
      'total', v_user_roles_total,
      'inactive', v_user_roles_inactive
    )
  );

  RETURN result;
END;
$$;

NOTIFY pgrst, 'reload schema';

COMMIT;
