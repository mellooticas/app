-- =============================================
-- Migration 049: Units passthrough, Multi-instruments, Seed Suzano
-- =============================================

-- 1. Passthrough view + grants for units
CREATE OR REPLACE VIEW public.units
WITH (security_invoker = true)
AS SELECT * FROM iam.units;

GRANT SELECT, INSERT, UPDATE ON public.units TO authenticated;

-- 2. Many-to-many: profile_instruments
CREATE TABLE IF NOT EXISTS core.profile_instruments (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    instrument_id   uuid NOT NULL REFERENCES core.instruments(id) ON DELETE CASCADE,
    is_primary      boolean NOT NULL DEFAULT false,
    created_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(user_id, instrument_id)
);

CREATE INDEX IF NOT EXISTS idx_profile_instruments_user
ON core.profile_instruments(user_id);

CREATE INDEX IF NOT EXISTS idx_profile_instruments_tenant
ON core.profile_instruments(tenant_id);

-- RLS on profile_instruments
ALTER TABLE core.profile_instruments ENABLE ROW LEVEL SECURITY;

CREATE POLICY tenant_read ON core.profile_instruments
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY admin_all ON core.profile_instruments
    FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')));

-- Passthrough view + grants
CREATE OR REPLACE VIEW public.profile_instruments
WITH (security_invoker = true)
AS SELECT * FROM core.profile_instruments;

GRANT SELECT, INSERT, DELETE ON public.profile_instruments TO authenticated;

-- 3. Enriched view: v_profile_instruments (with instrument name)
CREATE OR REPLACE VIEW public.v_profile_instruments
WITH (security_invoker = true)
AS
SELECT
    pi.id,
    pi.tenant_id,
    pi.user_id,
    pi.instrument_id,
    pi.is_primary,
    pi.created_at,
    i.name AS instrument_name
FROM core.profile_instruments pi
JOIN core.instruments i ON i.id = pi.instrument_id;

GRANT SELECT ON public.v_profile_instruments TO authenticated;

-- 4. Seed unidade Suzano
INSERT INTO iam.units (tenant_id, name, slug, city, state)
VALUES ('00000000-0000-0000-0000-000000000001', 'Suzano', 'suzano', 'Suzano', 'SP')
ON CONFLICT (tenant_id, slug) DO NOTHING;

-- 5. Update signup trigger: read unit_id from metadata + insert into profile_instruments
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
    v_unit_id uuid;
BEGIN
    -- Get first active tenant
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

    -- Read unit_id from metadata (validate it exists)
    v_unit_id := NULL;
    IF NEW.raw_user_meta_data->>'unit_id' IS NOT NULL THEN
        SELECT id INTO v_unit_id
        FROM iam.units
        WHERE id = (NEW.raw_user_meta_data->>'unit_id')::uuid
          AND tenant_id = v_tenant_id
          AND is_active = true;
    END IF;

    -- Create profile with phone, instrument, and unit
    INSERT INTO iam.profiles (user_id, tenant_id, full_name, display_name, phone, primary_instrument_id, unit_id)
    VALUES (
        NEW.id,
        v_tenant_id,
        COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.email),
        COALESCE(NEW.raw_user_meta_data->>'display_name', split_part(NEW.email, '@', 1)),
        NEW.raw_user_meta_data->>'phone',
        v_instrument_id,
        v_unit_id
    )
    ON CONFLICT (user_id, tenant_id) DO UPDATE SET
        phone = COALESCE(EXCLUDED.phone, iam.profiles.phone),
        primary_instrument_id = COALESCE(EXCLUDED.primary_instrument_id, iam.profiles.primary_instrument_id),
        unit_id = COALESCE(EXCLUDED.unit_id, iam.profiles.unit_id);

    -- If primary_instrument_id was provided, also insert into profile_instruments
    IF v_instrument_id IS NOT NULL THEN
        INSERT INTO core.profile_instruments (tenant_id, user_id, instrument_id, is_primary)
        VALUES (v_tenant_id, NEW.id, v_instrument_id, true)
        ON CONFLICT (user_id, instrument_id) DO NOTHING;
    END IF;

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

-- 6. Add "Escola" navigation item for admin sidebar
INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission)
VALUES ('school', 'Escola', '/settings/school', 'building-2', 'settings.view')
ON CONFLICT (slug) DO NOTHING;

-- Add to admin role navigation (group "Gestão Escolar")
INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000012', ni.id, NULL, 'Gestão Escolar', 0, 4
FROM iam.navigation_items ni
WHERE ni.slug = 'school'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';
