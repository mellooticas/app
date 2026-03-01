-- =============================================
-- Nipo School - New Database Schema
-- File: 10_access_token_hook.sql
-- Description: Custom Access Token Hook
-- Injects tenant_id and user_roles into every JWT
--
-- SETUP: After running this, go to Supabase Dashboard →
-- Authentication → Hooks → Custom Access Token (JWT)
-- and point it to: iam.custom_access_token_hook
-- =============================================

CREATE OR REPLACE FUNCTION iam.custom_access_token_hook(event jsonb)
RETURNS jsonb
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = iam
AS $$
DECLARE
    v_claims jsonb;
    v_user_id uuid;
    v_tenant_id uuid;
    v_roles jsonb;
BEGIN
    v_user_id := (event ->> 'user_id')::uuid;
    v_claims := event -> 'claims';

    -- Get the user's primary tenant
    SELECT p.tenant_id INTO v_tenant_id
    FROM iam.profiles p
    WHERE p.user_id = v_user_id
      AND p.is_active = true
    ORDER BY p.created_at ASC
    LIMIT 1;

    -- If user has no profile yet, return claims unchanged
    IF v_tenant_id IS NULL THEN
        RETURN event;
    END IF;

    -- Get user roles in this tenant
    SELECT COALESCE(jsonb_agg(r.slug), '[]'::jsonb) INTO v_roles
    FROM iam.user_roles ur
    JOIN iam.roles r ON r.id = ur.role_id
    WHERE ur.user_id = v_user_id
      AND ur.tenant_id = v_tenant_id
      AND ur.is_active = true
      AND r.is_active = true;

    -- Inject custom claims into JWT
    v_claims := jsonb_set(v_claims, '{tenant_id}', to_jsonb(v_tenant_id::text));
    v_claims := jsonb_set(v_claims, '{user_roles}', COALESCE(v_roles, '[]'::jsonb));

    -- Return modified event
    event := jsonb_set(event, '{claims}', v_claims);
    RETURN event;
END;
$$;

-- Grant execute to supabase_auth_admin (required for hooks)
GRANT USAGE ON SCHEMA iam TO supabase_auth_admin;
GRANT EXECUTE ON FUNCTION iam.custom_access_token_hook(jsonb) TO supabase_auth_admin;

-- The hook also needs to read from profiles and user_roles
GRANT SELECT ON iam.profiles TO supabase_auth_admin;
GRANT SELECT ON iam.user_roles TO supabase_auth_admin;
GRANT SELECT ON iam.roles TO supabase_auth_admin;

-- Revoke from public to prevent unauthorized access
REVOKE EXECUTE ON FUNCTION iam.custom_access_token_hook(jsonb) FROM PUBLIC;
REVOKE EXECUTE ON FUNCTION iam.custom_access_token_hook(jsonb) FROM authenticated;
REVOKE EXECUTE ON FUNCTION iam.custom_access_token_hook(jsonb) FROM anon;
