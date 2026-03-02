-- =============================================
-- Migration 052: Learning Paths (Trilhas de Aprendizagem)
-- =============================================

-- 1. core.learning_paths — trilhas que organizam aulas, desafios e portfólio em sequência
CREATE TABLE IF NOT EXISTS core.learning_paths (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    title           text NOT NULL,
    description     text,
    cycle           varchar(30),      -- 'initial', 'fundamental', 'intermediate', 'advanced'
    methodology_id  uuid REFERENCES core.methodologies(id) ON DELETE SET NULL,
    instrument_id   uuid REFERENCES core.instruments(id) ON DELETE SET NULL,
    difficulty_min  integer NOT NULL DEFAULT 1 CHECK (difficulty_min BETWEEN 1 AND 5),
    difficulty_max  integer NOT NULL DEFAULT 5 CHECK (difficulty_max BETWEEN 1 AND 5),
    total_steps     integer NOT NULL DEFAULT 0,
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_learning_paths_tenant ON core.learning_paths(tenant_id);
CREATE INDEX IF NOT EXISTS idx_learning_paths_cycle ON core.learning_paths(tenant_id, cycle);
CREATE INDEX IF NOT EXISTS idx_learning_paths_active ON core.learning_paths(tenant_id, is_active) WHERE is_active = true;

-- 2. core.learning_path_steps — cada step pode referenciar aula, desafio, portfólio ou conteúdo AI
CREATE TABLE IF NOT EXISTS core.learning_path_steps (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    path_id         uuid NOT NULL REFERENCES core.learning_paths(id) ON DELETE CASCADE,
    step_order      integer NOT NULL,
    step_type       varchar(30) NOT NULL, -- 'lesson', 'challenge', 'portfolio', 'practice', 'ai_content'
    reference_id    uuid,                 -- ID da lesson/challenge/portfolio/ai_content
    title           text NOT NULL,
    description     text,
    is_optional     boolean NOT NULL DEFAULT false,
    unlock_after    uuid REFERENCES core.learning_path_steps(id) ON DELETE SET NULL,
    points_reward   integer NOT NULL DEFAULT 10,
    created_at      timestamptz NOT NULL DEFAULT now(),
    UNIQUE(path_id, step_order)
);

CREATE INDEX IF NOT EXISTS idx_path_steps_path ON core.learning_path_steps(path_id, step_order);

-- 3. core.user_path_progress — progresso do aluno em cada trilha
CREATE TABLE IF NOT EXISTS core.user_path_progress (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    path_id         uuid NOT NULL REFERENCES core.learning_paths(id) ON DELETE CASCADE,
    current_step    integer NOT NULL DEFAULT 0,
    status          varchar(20) NOT NULL DEFAULT 'active', -- 'active', 'completed', 'paused'
    started_at      timestamptz NOT NULL DEFAULT now(),
    completed_at    timestamptz,
    UNIQUE(user_id, path_id)
);

CREATE INDEX IF NOT EXISTS idx_user_path_progress_user ON core.user_path_progress(user_id, status);
CREATE INDEX IF NOT EXISTS idx_user_path_progress_path ON core.user_path_progress(path_id);

-- 4. core.user_step_completions — registro individual de conclusão de cada step
CREATE TABLE IF NOT EXISTS core.user_step_completions (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    step_id         uuid NOT NULL REFERENCES core.learning_path_steps(id) ON DELETE CASCADE,
    path_id         uuid NOT NULL REFERENCES core.learning_paths(id) ON DELETE CASCADE,
    completed_at    timestamptz NOT NULL DEFAULT now(),
    UNIQUE(user_id, step_id)
);

CREATE INDEX IF NOT EXISTS idx_user_step_completions_user ON core.user_step_completions(user_id, path_id);

-- =============================================
-- 5. RLS Policies
-- =============================================

-- learning_paths: all authenticated read, admin/teacher write
ALTER TABLE core.learning_paths ENABLE ROW LEVEL SECURITY;

CREATE POLICY tenant_read_paths ON core.learning_paths
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY admin_teacher_write_paths ON core.learning_paths
    FOR ALL TO authenticated
    USING (
        tenant_id = (SELECT internal.fn_tenant_id())
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    )
    WITH CHECK (
        tenant_id = (SELECT internal.fn_tenant_id())
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    );

-- learning_path_steps: all authenticated read (through path), admin/teacher write
ALTER TABLE core.learning_path_steps ENABLE ROW LEVEL SECURITY;

CREATE POLICY tenant_read_steps ON core.learning_path_steps
    FOR SELECT TO authenticated
    USING (
        path_id IN (SELECT id FROM core.learning_paths WHERE tenant_id = (SELECT internal.fn_tenant_id()))
    );

CREATE POLICY admin_teacher_write_steps ON core.learning_path_steps
    FOR ALL TO authenticated
    USING (
        path_id IN (SELECT id FROM core.learning_paths WHERE tenant_id = (SELECT internal.fn_tenant_id()))
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    )
    WITH CHECK (
        path_id IN (SELECT id FROM core.learning_paths WHERE tenant_id = (SELECT internal.fn_tenant_id()))
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    );

-- user_path_progress: student own, admin/teacher all
ALTER TABLE core.user_path_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY own_read_progress ON core.user_path_progress
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND user_id = auth.uid());

CREATE POLICY own_write_progress ON core.user_path_progress
    FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND user_id = auth.uid())
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()) AND user_id = auth.uid());

CREATE POLICY admin_teacher_progress ON core.user_path_progress
    FOR ALL TO authenticated
    USING (
        tenant_id = (SELECT internal.fn_tenant_id())
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    )
    WITH CHECK (
        tenant_id = (SELECT internal.fn_tenant_id())
    );

-- user_step_completions: student own, admin/teacher all
ALTER TABLE core.user_step_completions ENABLE ROW LEVEL SECURITY;

CREATE POLICY own_read_step_completions ON core.user_step_completions
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND user_id = auth.uid());

CREATE POLICY own_write_step_completions ON core.user_step_completions
    FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND user_id = auth.uid())
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()) AND user_id = auth.uid());

CREATE POLICY admin_teacher_step_completions ON core.user_step_completions
    FOR ALL TO authenticated
    USING (
        tenant_id = (SELECT internal.fn_tenant_id())
        AND (SELECT internal.fn_has_role('admin') OR internal.fn_has_role('teacher'))
    )
    WITH CHECK (
        tenant_id = (SELECT internal.fn_tenant_id())
    );

-- =============================================
-- 6. Passthrough views (PostgREST exposure)
-- =============================================

CREATE OR REPLACE VIEW public.learning_paths
WITH (security_invoker = true)
AS SELECT * FROM core.learning_paths;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.learning_paths TO authenticated;

CREATE OR REPLACE VIEW public.learning_path_steps
WITH (security_invoker = true)
AS SELECT * FROM core.learning_path_steps;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.learning_path_steps TO authenticated;

CREATE OR REPLACE VIEW public.user_path_progress
WITH (security_invoker = true)
AS SELECT * FROM core.user_path_progress;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.user_path_progress TO authenticated;

CREATE OR REPLACE VIEW public.user_step_completions
WITH (security_invoker = true)
AS SELECT * FROM core.user_step_completions;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.user_step_completions TO authenticated;

-- =============================================
-- 7. Enriched views
-- =============================================

CREATE OR REPLACE VIEW public.v_learning_paths
WITH (security_invoker = true)
AS
SELECT
    lp.id,
    lp.tenant_id,
    lp.title,
    lp.description,
    lp.cycle,
    lp.methodology_id,
    lp.instrument_id,
    lp.difficulty_min,
    lp.difficulty_max,
    lp.total_steps,
    lp.is_active,
    lp.created_at,
    lp.updated_at,
    m.name AS methodology_name,
    i.name AS instrument_name,
    (SELECT count(*) FROM core.learning_path_steps s WHERE s.path_id = lp.id) AS step_count
FROM core.learning_paths lp
LEFT JOIN core.methodologies m ON m.id = lp.methodology_id
LEFT JOIN core.instruments i ON i.id = lp.instrument_id;

GRANT SELECT ON public.v_learning_paths TO authenticated;

CREATE OR REPLACE VIEW public.v_learning_path_steps
WITH (security_invoker = true)
AS
SELECT
    s.id,
    s.path_id,
    s.step_order,
    s.step_type,
    s.reference_id,
    s.title,
    s.description,
    s.is_optional,
    s.unlock_after,
    s.points_reward,
    s.created_at,
    CASE WHEN s.step_type = 'lesson' THEN l.title END AS lesson_title,
    CASE WHEN s.step_type = 'challenge' THEN ch.title END AS challenge_title
FROM core.learning_path_steps s
LEFT JOIN core.lessons l ON s.step_type = 'lesson' AND l.id = s.reference_id
LEFT JOIN core.challenges ch ON s.step_type = 'challenge' AND ch.id = s.reference_id;

GRANT SELECT ON public.v_learning_path_steps TO authenticated;

CREATE OR REPLACE VIEW public.v_user_path_progress
WITH (security_invoker = true)
AS
SELECT
    up.id,
    up.tenant_id,
    up.user_id,
    up.path_id,
    up.current_step,
    up.status,
    up.started_at,
    up.completed_at,
    lp.title AS path_title,
    lp.cycle AS path_cycle,
    lp.total_steps,
    lp.methodology_id,
    m.name AS methodology_name,
    (SELECT count(*) FROM core.user_step_completions sc
     WHERE sc.user_id = up.user_id AND sc.path_id = up.path_id) AS completed_steps
FROM core.user_path_progress up
JOIN core.learning_paths lp ON lp.id = up.path_id
LEFT JOIN core.methodologies m ON m.id = lp.methodology_id;

GRANT SELECT ON public.v_user_path_progress TO authenticated;

-- =============================================
-- 8. Navigation item
-- =============================================

INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission)
VALUES ('paths', 'Trilhas', '/paths', 'route', 'lessons.view')
ON CONFLICT (slug) DO NOTHING;

-- Add to student, teacher, and admin roles
INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000010', ni.id, NULL, 'Aprendizado', 1, 3
FROM iam.navigation_items ni WHERE ni.slug = 'paths'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000011', ni.id, NULL, 'Ensino', 1, 4
FROM iam.navigation_items ni WHERE ni.slug = 'paths'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000012', ni.id, NULL, 'Pedagógico', 1, 5
FROM iam.navigation_items ni WHERE ni.slug = 'paths'
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

-- Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';
