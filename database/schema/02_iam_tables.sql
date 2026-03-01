-- =============================================
-- Nipo School - New Database Schema
-- File: 02_iam_tables.sql
-- Description: IAM schema - 10 tables for identity, access, and navigation
-- =============================================

-- =============================================
-- 1. iam.tenants
-- =============================================
CREATE TABLE iam.tenants (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name            varchar(200) NOT NULL,
    slug            varchar(50) UNIQUE NOT NULL,
    plan            varchar(30) NOT NULL DEFAULT 'free',
    logo_url        text,
    settings        jsonb NOT NULL DEFAULT '{}',
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE iam.tenants IS 'Each school/organization is a tenant';

-- =============================================
-- 2. iam.units
-- =============================================
CREATE TABLE iam.units (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    name            varchar(200) NOT NULL,
    slug            varchar(50) NOT NULL,
    address         text,
    city            varchar(100),
    state           varchar(50),
    phone           varchar(30),
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(tenant_id, slug)
);

CREATE INDEX idx_units_tenant_id ON iam.units(tenant_id);

COMMENT ON TABLE iam.units IS 'Physical campuses/branches of a tenant';

-- =============================================
-- 3. iam.profiles
-- =============================================
CREATE TABLE iam.profiles (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    unit_id         uuid REFERENCES iam.units(id) ON DELETE SET NULL,
    full_name       varchar(200) NOT NULL,
    display_name    varchar(100),
    avatar_url      text,
    phone           varchar(30),
    birth_date      date,
    locale          varchar(10) NOT NULL DEFAULT 'pt-BR',
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(user_id, tenant_id)
);

CREATE INDEX idx_profiles_user_id ON iam.profiles(user_id);
CREATE INDEX idx_profiles_tenant_id ON iam.profiles(tenant_id);
CREATE INDEX idx_profiles_unit_id ON iam.profiles(unit_id) WHERE unit_id IS NOT NULL;

COMMENT ON TABLE iam.profiles IS 'Extends auth.users with app-specific data. One profile per user per tenant.';

-- =============================================
-- 4. iam.roles
-- =============================================
CREATE TABLE iam.roles (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    slug            varchar(30) NOT NULL,
    display_name    varchar(100) NOT NULL,
    description     text,
    kanji           varchar(10),
    kanji_meaning   varchar(100),
    primary_color   varchar(30),
    secondary_color varchar(30),
    gradient        varchar(60),
    pattern         varchar(30),
    icon_name       varchar(30),
    hierarchy_level integer NOT NULL DEFAULT 0,
    is_system       boolean NOT NULL DEFAULT false,
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(tenant_id, slug)
);

CREATE INDEX idx_roles_tenant_id ON iam.roles(tenant_id);

COMMENT ON TABLE iam.roles IS 'Roles per tenant. System roles (is_system=true) cannot be deleted.';

-- =============================================
-- 5. iam.permissions
-- =============================================
CREATE TABLE iam.permissions (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    slug            varchar(100) UNIQUE NOT NULL,
    display_name    varchar(100) NOT NULL,
    resource        varchar(50) NOT NULL,
    action          varchar(30) NOT NULL,
    description     text,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_permissions_resource ON iam.permissions(resource);

COMMENT ON TABLE iam.permissions IS 'Granular permissions (resource.action). Shared across all tenants.';

-- =============================================
-- 6. iam.role_permissions
-- =============================================
CREATE TABLE iam.role_permissions (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    role_id         uuid NOT NULL REFERENCES iam.roles(id) ON DELETE CASCADE,
    permission_id   uuid NOT NULL REFERENCES iam.permissions(id) ON DELETE CASCADE,
    constraints     jsonb NOT NULL DEFAULT '{}',
    created_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(role_id, permission_id)
);

CREATE INDEX idx_role_permissions_role_id ON iam.role_permissions(role_id);
CREATE INDEX idx_role_permissions_permission_id ON iam.role_permissions(permission_id);

COMMENT ON TABLE iam.role_permissions IS 'Many-to-many: which permissions each role has';

-- =============================================
-- 7. iam.user_roles
-- =============================================
CREATE TABLE iam.user_roles (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    role_id         uuid NOT NULL REFERENCES iam.roles(id) ON DELETE CASCADE,
    assigned_by     uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(user_id, tenant_id, role_id)
);

CREATE INDEX idx_user_roles_user_id ON iam.user_roles(user_id);
CREATE INDEX idx_user_roles_tenant_id ON iam.user_roles(tenant_id);
CREATE INDEX idx_user_roles_role_id ON iam.user_roles(role_id);

COMMENT ON TABLE iam.user_roles IS 'A user can have multiple roles within a tenant';

-- =============================================
-- 8. iam.navigation_items
-- =============================================
CREATE TABLE iam.navigation_items (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    slug            varchar(100) UNIQUE NOT NULL,
    label           varchar(100) NOT NULL,
    href            varchar(200) NOT NULL,
    icon_name       varchar(50),
    required_permission varchar(100),
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE iam.navigation_items IS 'Menu items for unified routing. Shared across all tenants.';

-- =============================================
-- 9. iam.role_navigation
-- =============================================
CREATE TABLE iam.role_navigation (
    id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    role_id             uuid NOT NULL REFERENCES iam.roles(id) ON DELETE CASCADE,
    navigation_item_id  uuid NOT NULL REFERENCES iam.navigation_items(id) ON DELETE CASCADE,
    label_override      varchar(100),
    group_name          varchar(100),
    group_order         integer NOT NULL DEFAULT 0,
    item_order          integer NOT NULL DEFAULT 0,
    is_active           boolean NOT NULL DEFAULT true,
    created_at          timestamptz NOT NULL DEFAULT now(),

    UNIQUE(role_id, navigation_item_id)
);

CREATE INDEX idx_role_navigation_role_id ON iam.role_navigation(role_id);

COMMENT ON TABLE iam.role_navigation IS 'Navigation per role with label/group overrides';

-- =============================================
-- 10. iam.invitations
-- =============================================
CREATE TABLE iam.invitations (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    unit_id         uuid REFERENCES iam.units(id) ON DELETE SET NULL,
    email           varchar(255) NOT NULL,
    role_slug       varchar(30) NOT NULL,
    token           varchar(100) UNIQUE NOT NULL,
    invited_by      uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    status          invitation_status NOT NULL DEFAULT 'pending',
    expires_at      timestamptz NOT NULL,
    accepted_at     timestamptz,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_invitations_tenant_id ON iam.invitations(tenant_id);
CREATE INDEX idx_invitations_token ON iam.invitations(token);
CREATE INDEX idx_invitations_email ON iam.invitations(email);

COMMENT ON TABLE iam.invitations IS 'Invite flow for new users with token-based acceptance';

-- =============================================
-- Explicit grants (belt & suspenders with ALTER DEFAULT PRIVILEGES)
-- =============================================
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA iam TO authenticated;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA iam TO authenticated;
GRANT ALL ON ALL TABLES IN SCHEMA iam TO service_role;
