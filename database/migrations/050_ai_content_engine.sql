-- =============================================
-- Migration 050: AI Content Engine + Alpha Queue
-- =============================================

-- 1. AI-generated content (lesson materials, exercises, feedback)
CREATE TABLE IF NOT EXISTS core.ai_generated_content (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    lesson_id       uuid REFERENCES core.lessons(id) ON DELETE SET NULL,
    challenge_id    uuid REFERENCES core.challenges(id) ON DELETE SET NULL,
    content_type    varchar(30) NOT NULL,  -- 'material', 'exercise', 'explanation', 'micro_challenge', 'feedback'
    title           text NOT NULL,
    content         text NOT NULL,         -- markdown content
    metadata        jsonb DEFAULT '{}',    -- difficulty, methodology, tags, exercises array, etc.
    ai_model        varchar(50),           -- 'gpt-4o-mini', 'gpt-4o'
    ai_prompt_hash  varchar(64),           -- for dedup/cache
    status          varchar(20) NOT NULL DEFAULT 'active',  -- 'active', 'archived', 'draft'
    created_by      uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_ai_content_tenant ON core.ai_generated_content(tenant_id);
CREATE INDEX IF NOT EXISTS idx_ai_content_lesson ON core.ai_generated_content(lesson_id);
CREATE INDEX IF NOT EXISTS idx_ai_content_challenge ON core.ai_generated_content(challenge_id);
CREATE INDEX IF NOT EXISTS idx_ai_content_type ON core.ai_generated_content(content_type, status);

-- 2. Alpha Queue: continuous learning items per student
CREATE TABLE IF NOT EXISTS core.alpha_queue (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    source_type     varchar(30) NOT NULL,  -- 'lesson', 'challenge', 'practice', 'ai_generated'
    source_id       uuid,                  -- ID of the lesson/challenge/content that triggered this
    item_type       varchar(30) NOT NULL,  -- 'exercise', 'micro_challenge', 'practice_tip', 'review', 'next_lesson'
    title           text NOT NULL,
    description     text,
    content         text,                  -- full markdown content
    difficulty      integer NOT NULL DEFAULT 3 CHECK (difficulty BETWEEN 1 AND 5),
    points_reward   integer NOT NULL DEFAULT 5,
    priority        integer NOT NULL DEFAULT 0,
    status          varchar(20) NOT NULL DEFAULT 'pending',  -- 'pending', 'in_progress', 'completed', 'skipped'
    expires_at      timestamptz,
    completed_at    timestamptz,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_alpha_queue_user_status ON core.alpha_queue(user_id, status);
CREATE INDEX IF NOT EXISTS idx_alpha_queue_priority ON core.alpha_queue(user_id, priority DESC, created_at ASC);
CREATE INDEX IF NOT EXISTS idx_alpha_queue_tenant ON core.alpha_queue(tenant_id);

-- 3. RLS policies

-- ai_generated_content: all authenticated users can read, admin/teacher can write
ALTER TABLE core.ai_generated_content ENABLE ROW LEVEL SECURITY;

CREATE POLICY tenant_read_ai_content ON core.ai_generated_content
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY admin_teacher_write_ai_content ON core.ai_generated_content
    FOR ALL TO authenticated
    USING (
        tenant_id = (SELECT internal.fn_tenant_id())
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    )
    WITH CHECK (
        tenant_id = (SELECT internal.fn_tenant_id())
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    );

-- alpha_queue: student reads/updates own, admin/teacher manages all
ALTER TABLE core.alpha_queue ENABLE ROW LEVEL SECURITY;

CREATE POLICY own_read_alpha ON core.alpha_queue
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND user_id = auth.uid());

CREATE POLICY own_update_alpha ON core.alpha_queue
    FOR UPDATE TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND user_id = auth.uid())
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()) AND user_id = auth.uid());

CREATE POLICY admin_teacher_all_alpha ON core.alpha_queue
    FOR ALL TO authenticated
    USING (
        tenant_id = (SELECT internal.fn_tenant_id())
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    )
    WITH CHECK (
        tenant_id = (SELECT internal.fn_tenant_id())
    );

-- 4. Passthrough views (exposed via PostgREST)

CREATE OR REPLACE VIEW public.ai_generated_content
WITH (security_invoker = true)
AS SELECT * FROM core.ai_generated_content;

GRANT SELECT, INSERT, UPDATE ON public.ai_generated_content TO authenticated;

CREATE OR REPLACE VIEW public.alpha_queue
WITH (security_invoker = true)
AS SELECT * FROM core.alpha_queue;

GRANT SELECT, INSERT, UPDATE ON public.alpha_queue TO authenticated;

-- 5. Enriched views

CREATE OR REPLACE VIEW public.v_ai_generated_content
WITH (security_invoker = true)
AS
SELECT
    c.id,
    c.tenant_id,
    c.lesson_id,
    c.challenge_id,
    c.content_type,
    c.title,
    c.content,
    c.metadata,
    c.ai_model,
    c.status,
    c.created_by,
    c.created_at,
    l.title AS lesson_title,
    l.number AS lesson_number
FROM core.ai_generated_content c
LEFT JOIN core.lessons l ON l.id = c.lesson_id;

GRANT SELECT ON public.v_ai_generated_content TO authenticated;

CREATE OR REPLACE VIEW public.v_alpha_queue
WITH (security_invoker = true)
AS
SELECT
    q.id,
    q.tenant_id,
    q.user_id,
    q.source_type,
    q.source_id,
    q.item_type,
    q.title,
    q.description,
    q.content,
    q.difficulty,
    q.points_reward,
    q.priority,
    q.status,
    q.expires_at,
    q.completed_at,
    q.created_at,
    CASE WHEN q.source_type = 'lesson' THEN l.title END AS lesson_title,
    CASE WHEN q.source_type = 'lesson' THEN l.number END AS lesson_number,
    CASE WHEN q.source_type = 'challenge' THEN ch.title END AS challenge_title
FROM core.alpha_queue q
LEFT JOIN core.lessons l ON q.source_type = 'lesson' AND l.id = q.source_id
LEFT JOIN core.challenges ch ON q.source_type = 'challenge' AND ch.id = q.source_id;

GRANT SELECT ON public.v_alpha_queue TO authenticated;

-- 6. Navigation item for admin AI content management
INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission)
VALUES ('ai-content', 'Conteúdo AI', '/settings/ai-content', 'sparkles', 'settings.view')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000012', ni.id, NULL, 'Gestão Escolar', 0, 5
FROM iam.navigation_items ni
WHERE ni.slug = 'ai-content'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';
