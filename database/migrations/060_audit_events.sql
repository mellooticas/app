-- =============================================
-- Migration 060: Audit Events Table
-- =============================================
-- Tracks administrative actions: role assignments,
-- permission changes, profile updates, etc.

BEGIN;

CREATE TABLE core.audit_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
  actor_id uuid NOT NULL,
  event_type text NOT NULL,
  target_type text NOT NULL,
  target_id uuid,
  old_value jsonb,
  new_value jsonb,
  ip_address text,
  metadata jsonb DEFAULT '{}',
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_audit_events_tenant_date ON core.audit_events(tenant_id, created_at DESC);
CREATE INDEX idx_audit_events_type ON core.audit_events(event_type, created_at DESC);
CREATE INDEX idx_audit_events_actor ON core.audit_events(actor_id, created_at DESC);

ALTER TABLE core.audit_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "admin_read_audit" ON core.audit_events
  FOR SELECT USING (
    tenant_id = internal.fn_tenant_id()
    AND internal.fn_has_permission('settings.manage')
  );

CREATE POLICY "service_insert_audit" ON core.audit_events
  FOR INSERT WITH CHECK (tenant_id = internal.fn_tenant_id());

-- Passthrough view
CREATE OR REPLACE VIEW public.audit_events
  WITH (security_invoker = true) AS
  SELECT * FROM core.audit_events;

-- Enriched view with actor name
CREATE OR REPLACE VIEW public.v_audit_events AS
  SELECT
    ae.id,
    ae.tenant_id,
    ae.actor_id,
    p.full_name AS actor_name,
    ae.event_type,
    ae.target_type,
    ae.target_id,
    ae.old_value,
    ae.new_value,
    ae.ip_address,
    ae.metadata,
    ae.created_at
  FROM core.audit_events ae
  LEFT JOIN iam.profiles p ON ae.actor_id = p.user_id AND ae.tenant_id = p.tenant_id;

NOTIFY pgrst, 'reload schema';

COMMIT;
