-- =============================================
-- Migration 059: AI Usage Logging & Quotas
-- =============================================
-- Tracks every AI API call with token counts, cost
-- estimates, and action origin. Enables cost monitoring
-- and quota enforcement per tenant and user.

BEGIN;

-- =============================================
-- AI Usage Log
-- =============================================

CREATE TABLE core.ai_usage_log (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
  user_id uuid NOT NULL,
  action_name text NOT NULL,
  ai_model text NOT NULL,
  prompt_tokens integer NOT NULL DEFAULT 0,
  completion_tokens integer NOT NULL DEFAULT 0,
  total_tokens integer NOT NULL DEFAULT 0,
  estimated_cost_usd numeric(10,6) NOT NULL DEFAULT 0,
  duration_ms integer,
  status text NOT NULL DEFAULT 'success',
  error_message text,
  metadata jsonb DEFAULT '{}',
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_ai_usage_tenant_date ON core.ai_usage_log(tenant_id, created_at DESC);
CREATE INDEX idx_ai_usage_user_date ON core.ai_usage_log(user_id, created_at DESC);
CREATE INDEX idx_ai_usage_status ON core.ai_usage_log(status) WHERE status != 'success';

ALTER TABLE core.ai_usage_log ENABLE ROW LEVEL SECURITY;

CREATE POLICY "tenant_read_ai_usage" ON core.ai_usage_log
  FOR SELECT USING (tenant_id = internal.fn_tenant_id());

CREATE POLICY "service_insert_ai_usage" ON core.ai_usage_log
  FOR INSERT WITH CHECK (tenant_id = internal.fn_tenant_id());

-- Passthrough view for PostgREST
CREATE OR REPLACE VIEW public.ai_usage_log
  WITH (security_invoker = true) AS
  SELECT * FROM core.ai_usage_log;

-- Summary view: daily aggregation per tenant
CREATE OR REPLACE VIEW public.v_ai_usage_summary AS
  SELECT
    tenant_id,
    date_trunc('day', created_at)::date AS day,
    COUNT(*) AS request_count,
    SUM(total_tokens) AS total_tokens,
    SUM(prompt_tokens) AS total_prompt_tokens,
    SUM(completion_tokens) AS total_completion_tokens,
    SUM(estimated_cost_usd) AS total_cost_usd,
    COUNT(*) FILTER (WHERE status = 'error') AS error_count,
    AVG(duration_ms) FILTER (WHERE duration_ms IS NOT NULL) AS avg_duration_ms
  FROM core.ai_usage_log
  GROUP BY tenant_id, date_trunc('day', created_at)::date;

-- =============================================
-- AI Quotas per Tenant
-- =============================================

CREATE TABLE core.ai_quotas (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE UNIQUE,
  daily_token_limit integer NOT NULL DEFAULT 500000,
  monthly_token_limit integer NOT NULL DEFAULT 10000000,
  daily_request_limit integer NOT NULL DEFAULT 100,
  monthly_request_limit integer NOT NULL DEFAULT 2000,
  per_user_daily_limit integer NOT NULL DEFAULT 20,
  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE core.ai_quotas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "tenant_read_quotas" ON core.ai_quotas
  FOR SELECT USING (tenant_id = internal.fn_tenant_id());

CREATE POLICY "admin_manage_quotas" ON core.ai_quotas
  FOR ALL USING (
    tenant_id = internal.fn_tenant_id()
    AND internal.fn_has_permission('settings.manage')
  );

CREATE OR REPLACE VIEW public.ai_quotas
  WITH (security_invoker = true) AS
  SELECT * FROM core.ai_quotas;

-- Seed default quota for Nipo School
INSERT INTO core.ai_quotas (tenant_id)
VALUES ('00000000-0000-0000-0000-000000000001')
ON CONFLICT (tenant_id) DO NOTHING;

-- =============================================
-- Quota check helper RPC
-- =============================================

CREATE OR REPLACE FUNCTION public.rpc_check_ai_quota(
  p_tenant_id uuid,
  p_user_id uuid
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, core
AS $$
DECLARE
  v_quota record;
  v_today_tokens bigint;
  v_today_requests bigint;
  v_month_tokens bigint;
  v_month_requests bigint;
  v_user_today bigint;
BEGIN
  -- Get quota config
  SELECT * INTO v_quota FROM core.ai_quotas WHERE tenant_id = p_tenant_id;
  IF NOT FOUND OR NOT v_quota.is_active THEN
    RETURN jsonb_build_object('allowed', true, 'reason', 'no_quota_configured');
  END IF;

  -- Today's usage (tenant)
  SELECT COALESCE(SUM(total_tokens), 0), COUNT(*)
  INTO v_today_tokens, v_today_requests
  FROM core.ai_usage_log
  WHERE tenant_id = p_tenant_id
    AND created_at >= date_trunc('day', now())
    AND status = 'success';

  -- This month's usage (tenant)
  SELECT COALESCE(SUM(total_tokens), 0), COUNT(*)
  INTO v_month_tokens, v_month_requests
  FROM core.ai_usage_log
  WHERE tenant_id = p_tenant_id
    AND created_at >= date_trunc('month', now())
    AND status = 'success';

  -- User today
  SELECT COUNT(*) INTO v_user_today
  FROM core.ai_usage_log
  WHERE user_id = p_user_id
    AND created_at >= date_trunc('day', now())
    AND status = 'success';

  -- Check limits
  IF v_today_tokens >= v_quota.daily_token_limit THEN
    RETURN jsonb_build_object('allowed', false, 'reason', 'daily_token_limit',
      'current', v_today_tokens, 'limit', v_quota.daily_token_limit);
  END IF;

  IF v_today_requests >= v_quota.daily_request_limit THEN
    RETURN jsonb_build_object('allowed', false, 'reason', 'daily_request_limit',
      'current', v_today_requests, 'limit', v_quota.daily_request_limit);
  END IF;

  IF v_month_tokens >= v_quota.monthly_token_limit THEN
    RETURN jsonb_build_object('allowed', false, 'reason', 'monthly_token_limit',
      'current', v_month_tokens, 'limit', v_quota.monthly_token_limit);
  END IF;

  IF v_month_requests >= v_quota.monthly_request_limit THEN
    RETURN jsonb_build_object('allowed', false, 'reason', 'monthly_request_limit',
      'current', v_month_requests, 'limit', v_quota.monthly_request_limit);
  END IF;

  IF v_user_today >= v_quota.per_user_daily_limit THEN
    RETURN jsonb_build_object('allowed', false, 'reason', 'user_daily_limit',
      'current', v_user_today, 'limit', v_quota.per_user_daily_limit);
  END IF;

  RETURN jsonb_build_object('allowed', true, 'usage', jsonb_build_object(
    'today_tokens', v_today_tokens,
    'today_requests', v_today_requests,
    'month_tokens', v_month_tokens,
    'month_requests', v_month_requests,
    'user_today', v_user_today
  ));
END;
$$;

NOTIFY pgrst, 'reload schema';

COMMIT;
