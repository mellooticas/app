-- =============================================
-- Migration 048: Add primary_instrument_id to profiles
--                Update signup trigger to read role/phone/instrument from metadata
--                Update v_profiles to include instrument_name
-- =============================================

-- 1. Add primary_instrument_id to iam.profiles
ALTER TABLE iam.profiles
ADD COLUMN IF NOT EXISTS primary_instrument_id uuid REFERENCES core.instruments(id) ON DELETE SET NULL;

CREATE INDEX IF NOT EXISTS idx_profiles_instrument
ON iam.profiles(primary_instrument_id) WHERE primary_instrument_id IS NOT NULL;

-- 2. Drop and recreate v_profiles with new columns (column order changed)
DROP VIEW IF EXISTS public.v_profiles;
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
    p.primary_instrument_id,
    p.created_at,
    p.updated_at,
    u.name AS unit_name,
    i.name AS instrument_name,
    COALESCE(
        (SELECT jsonb_agg(jsonb_build_object('slug', r.slug, 'display_name', r.display_name))
         FROM iam.user_roles ur
         JOIN iam.roles r ON r.id = ur.role_id
         WHERE ur.user_id = p.user_id AND ur.tenant_id = p.tenant_id AND ur.is_active = true),
        '[]'::jsonb
    ) AS roles
FROM iam.profiles p
LEFT JOIN iam.units u ON u.id = p.unit_id
LEFT JOIN core.instruments i ON i.id = p.primary_instrument_id;

-- 3. Update signup trigger to handle role, phone, instrument from metadata
CREATE OR REPLACE FUNCTION public.fn_on_auth_user_created()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = iam
AS $$
DECLARE
    v_tenant_id uuid;
    v_role_id uuid;
    v_role_slug text;
    v_instrument_id uuid;
BEGIN
    -- Get first active tenant (for initial setup / single-tenant mode)
    SELECT id INTO v_tenant_id FROM iam.tenants WHERE is_active = true LIMIT 1;

    IF v_tenant_id IS NULL THEN
        RETURN NEW;
    END IF;

    -- Read instrument_id from metadata (validate it exists)
    v_instrument_id := NULL;
    IF NEW.raw_user_meta_data->>'primary_instrument_id' IS NOT NULL THEN
        SELECT id INTO v_instrument_id
        FROM core.instruments
        WHERE id = (NEW.raw_user_meta_data->>'primary_instrument_id')::uuid
          AND is_active = true;
    END IF;

    -- Create profile with phone and instrument
    INSERT INTO iam.profiles (user_id, tenant_id, full_name, display_name, phone, primary_instrument_id)
    VALUES (
        NEW.id,
        v_tenant_id,
        COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.email),
        COALESCE(NEW.raw_user_meta_data->>'display_name', split_part(NEW.email, '@', 1)),
        NEW.raw_user_meta_data->>'phone',
        v_instrument_id
    )
    ON CONFLICT (user_id, tenant_id) DO UPDATE SET
        phone = COALESCE(EXCLUDED.phone, iam.profiles.phone),
        primary_instrument_id = COALESCE(EXCLUDED.primary_instrument_id, iam.profiles.primary_instrument_id);

    -- Determine role: allow 'student' or 'teacher' from metadata, default to 'student'
    v_role_slug := COALESCE(NEW.raw_user_meta_data->>'role', 'student');
    IF v_role_slug NOT IN ('student', 'teacher') THEN
        v_role_slug := 'student';
    END IF;

    SELECT id INTO v_role_id
    FROM iam.roles
    WHERE tenant_id = v_tenant_id AND slug = v_role_slug AND is_active = true;

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

-- 4. Add "Matrículas" navigation item for admin sidebar
INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission)
VALUES ('enrollments', 'Matrículas', '/settings/enrollments', 'graduation-cap', 'settings.view')
ON CONFLICT (slug) DO NOTHING;

-- 5. Add to admin role navigation (group "Gestão Escolar", after courses)
INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000012', ni.id, NULL, 'Gestão Escolar', 0, 5
FROM iam.navigation_items ni
WHERE ni.slug = 'enrollments'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;
