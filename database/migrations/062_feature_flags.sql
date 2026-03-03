-- =============================================
-- Migration 062: Feature Flags per Tenant
-- =============================================
-- Enables phased rollout of modules during the pilot.
-- Each flag controls a product feature per tenant.

BEGIN;

CREATE TABLE core.feature_flags (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
  flag_key text NOT NULL,
  is_enabled boolean NOT NULL DEFAULT false,
  metadata jsonb DEFAULT '{}',
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(tenant_id, flag_key)
);

CREATE INDEX idx_feature_flags_tenant ON core.feature_flags(tenant_id);

ALTER TABLE core.feature_flags ENABLE ROW LEVEL SECURITY;

CREATE POLICY "tenant_read_flags" ON core.feature_flags
  FOR SELECT USING (tenant_id = internal.fn_tenant_id());

CREATE POLICY "admin_manage_flags" ON core.feature_flags
  FOR ALL USING (
    tenant_id = internal.fn_tenant_id()
    AND internal.fn_has_permission('settings.manage')
  );

CREATE OR REPLACE VIEW public.feature_flags
  WITH (security_invoker = true) AS
  SELECT * FROM core.feature_flags;

-- Seed pilot flags for Nipo School tenant (all enabled for initial pilot)
INSERT INTO core.feature_flags (tenant_id, flag_key, is_enabled) VALUES
  ('00000000-0000-0000-0000-000000000001', 'ai_generation', true),
  ('00000000-0000-0000-0000-000000000001', 'ai_feedback', true),
  ('00000000-0000-0000-0000-000000000001', 'alpha_engine', true),
  ('00000000-0000-0000-0000-000000000001', 'community_feed', true),
  ('00000000-0000-0000-0000-000000000001', 'learning_paths', true),
  ('00000000-0000-0000-0000-000000000001', 'file_uploads', true),
  ('00000000-0000-0000-0000-000000000001', 'gamification', true),
  ('00000000-0000-0000-0000-000000000001', 'qr_codes', false),
  ('00000000-0000-0000-0000-000000000001', 'portfolio', true),
  ('00000000-0000-0000-0000-000000000001', 'practice_diary', true)
ON CONFLICT (tenant_id, flag_key) DO NOTHING;

NOTIFY pgrst, 'reload schema';

COMMIT;
