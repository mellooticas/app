-- =============================================
-- Migration 055a: Library Items — Structure
-- =============================================
-- Table, indexes, RLS, views. Idempotent (safe to re-run).

BEGIN;

-- 1. Table
CREATE TABLE IF NOT EXISTS core.library_items (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id),
    title           text NOT NULL,
    description     text,
    category        varchar(30) NOT NULL DEFAULT 'resource',
    subcategory     varchar(50),
    file_type       varchar(30) DEFAULT 'pdf',
    file_url        text,
    content         text,
    tags            text[] DEFAULT '{}',
    is_featured     boolean DEFAULT false,
    order_index     integer DEFAULT 0,
    uploaded_by     uuid REFERENCES auth.users(id),
    created_at      timestamptz DEFAULT now(),
    updated_at      timestamptz DEFAULT now()
);

-- 2. Unique constraint for idempotent seeds
ALTER TABLE core.library_items
  DROP CONSTRAINT IF EXISTS uq_library_tenant_sub_order;
ALTER TABLE core.library_items
  ADD CONSTRAINT uq_library_tenant_sub_order UNIQUE (tenant_id, subcategory, order_index);

-- 3. Indexes
CREATE INDEX IF NOT EXISTS idx_library_category ON core.library_items(category);
CREATE INDEX IF NOT EXISTS idx_library_subcategory ON core.library_items(subcategory);
CREATE INDEX IF NOT EXISTS idx_library_tenant ON core.library_items(tenant_id);

-- 3. RLS (drop first for idempotency)
ALTER TABLE core.library_items ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS library_tenant_read ON core.library_items;
CREATE POLICY library_tenant_read ON core.library_items
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()));

DROP POLICY IF EXISTS library_teacher_write ON core.library_items;
CREATE POLICY library_teacher_write ON core.library_items
    FOR ALL TO authenticated
    USING (
        tenant_id = (SELECT internal.fn_tenant_id())
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    )
    WITH CHECK (
        tenant_id = (SELECT internal.fn_tenant_id())
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    );

-- 4. Passthrough view
CREATE OR REPLACE VIEW public.library_items
WITH (security_invoker = true)
AS SELECT * FROM core.library_items;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.library_items TO authenticated;

-- 5. Enriched view
CREATE OR REPLACE VIEW public.v_library_items
WITH (security_invoker = true)
AS
SELECT
    li.*,
    p.full_name AS uploaded_by_name,
    p.avatar_url AS uploaded_by_avatar
FROM core.library_items li
LEFT JOIN iam.profiles p ON p.user_id = li.uploaded_by AND p.tenant_id = li.tenant_id;

GRANT SELECT ON public.v_library_items TO authenticated;

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';

COMMIT;
