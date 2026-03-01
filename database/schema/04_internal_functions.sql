-- =============================================
-- Nipo School - New Database Schema
-- File: 04_internal_functions.sql
-- Description: SECURITY DEFINER helper functions for RLS policies
-- IMPORTANT: internal schema must NOT be in Supabase "Exposed schemas"
-- =============================================

-- =============================================
-- 1. fn_tenant_id() - Extract tenant_id from JWT
-- =============================================
CREATE OR REPLACE FUNCTION internal.fn_tenant_id()
RETURNS uuid
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = internal
AS $$
    SELECT COALESCE(
        (auth.jwt() ->> 'tenant_id')::uuid,
        NULL
    );
$$;

COMMENT ON FUNCTION internal.fn_tenant_id() IS 'Extracts tenant_id from JWT custom claims. Use with (SELECT internal.fn_tenant_id()) in RLS for initPlan caching.';

-- =============================================
-- 2. fn_user_id() - Extract user_id from JWT
-- =============================================
CREATE OR REPLACE FUNCTION internal.fn_user_id()
RETURNS uuid
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = internal
AS $$
    SELECT auth.uid();
$$;

COMMENT ON FUNCTION internal.fn_user_id() IS 'Wrapper around auth.uid() for consistent usage in RLS policies.';

-- =============================================
-- 3. fn_has_role() - Check if user has a specific role
-- =============================================
CREATE OR REPLACE FUNCTION internal.fn_has_role(p_role_slug text)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = iam, internal
AS $$
    SELECT EXISTS (
        SELECT 1
        FROM iam.user_roles ur
        JOIN iam.roles r ON r.id = ur.role_id
        WHERE ur.user_id = auth.uid()
          AND ur.tenant_id = (auth.jwt() ->> 'tenant_id')::uuid
          AND r.slug = p_role_slug
          AND ur.is_active = true
          AND r.is_active = true
    );
$$;

COMMENT ON FUNCTION internal.fn_has_role(text) IS 'Checks if current user has the specified role in the current tenant.';

-- =============================================
-- 4. fn_has_permission() - Check if user has a specific permission
-- =============================================
CREATE OR REPLACE FUNCTION internal.fn_has_permission(p_permission_slug text)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = iam, internal
AS $$
    SELECT EXISTS (
        SELECT 1
        FROM iam.user_roles ur
        JOIN iam.role_permissions rp ON rp.role_id = ur.role_id
        JOIN iam.permissions p ON p.id = rp.permission_id
        WHERE ur.user_id = auth.uid()
          AND ur.tenant_id = (auth.jwt() ->> 'tenant_id')::uuid
          AND p.slug = p_permission_slug
          AND ur.is_active = true
    );
$$;

COMMENT ON FUNCTION internal.fn_has_permission(text) IS 'Checks if current user has the specified permission via any of their roles.';

-- =============================================
-- 5. fn_is_teacher_of() - Check teacher-student relationship
-- =============================================
CREATE OR REPLACE FUNCTION internal.fn_is_teacher_of(p_student_id uuid)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = core, internal
AS $$
    SELECT EXISTS (
        SELECT 1
        FROM core.courses c
        JOIN core.enrollments e ON e.course_id = c.id
        WHERE c.teacher_id = auth.uid()
          AND e.student_id = p_student_id
          AND c.tenant_id = (auth.jwt() ->> 'tenant_id')::uuid
          AND e.status = 'active'
          AND c.deleted_at IS NULL
    );
$$;

COMMENT ON FUNCTION internal.fn_is_teacher_of(uuid) IS 'Checks if current user is a teacher of the specified student (via active course enrollment).';

-- =============================================
-- 6. fn_is_member_of_unit() - Check unit membership
-- =============================================
CREATE OR REPLACE FUNCTION internal.fn_is_member_of_unit(p_unit_id uuid)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = iam, internal
AS $$
    SELECT EXISTS (
        SELECT 1
        FROM iam.profiles p
        WHERE p.user_id = auth.uid()
          AND p.tenant_id = (auth.jwt() ->> 'tenant_id')::uuid
          AND p.unit_id = p_unit_id
          AND p.is_active = true
    );
$$;

COMMENT ON FUNCTION internal.fn_is_member_of_unit(uuid) IS 'Checks if current user belongs to the specified unit.';

-- =============================================
-- Grant execute to authenticated (needed for RLS evaluation)
-- =============================================
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA internal TO authenticated;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA internal TO service_role;
