-- =============================================
-- Nipo School - New Database Schema
-- File: 05_rls_policies.sql
-- Description: Row Level Security on ALL tables
-- Pattern: tenant isolation + role-based access
-- Performance: Always use (SELECT ...) for initPlan caching
-- =============================================

-- =============================================
-- IAM SCHEMA
-- =============================================

-- iam.tenants
ALTER TABLE iam.tenants ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON iam.tenants
    FOR SELECT TO authenticated
    USING (id = (SELECT internal.fn_tenant_id()));
CREATE POLICY tenant_admin_write ON iam.tenants
    FOR ALL TO authenticated
    USING (id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')))
    WITH CHECK (id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')));

-- iam.units
ALTER TABLE iam.units ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON iam.units
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()));
CREATE POLICY admin_write ON iam.units
    FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')));

-- iam.profiles
ALTER TABLE iam.profiles ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_read ON iam.profiles
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()));
CREATE POLICY own_update ON iam.profiles
    FOR UPDATE TO authenticated
    USING (user_id = (SELECT auth.uid()) AND tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (user_id = (SELECT auth.uid()) AND tenant_id = (SELECT internal.fn_tenant_id()));
CREATE POLICY admin_all ON iam.profiles
    FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')));

-- iam.roles
ALTER TABLE iam.roles ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_read ON iam.roles
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()));
CREATE POLICY admin_write ON iam.roles
    FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')));

-- iam.permissions (global, read by all authenticated)
ALTER TABLE iam.permissions ENABLE ROW LEVEL SECURITY;
CREATE POLICY read_all ON iam.permissions
    FOR SELECT TO authenticated
    USING (true);

-- iam.role_permissions
ALTER TABLE iam.role_permissions ENABLE ROW LEVEL SECURITY;
CREATE POLICY read_own_tenant ON iam.role_permissions
    FOR SELECT TO authenticated
    USING (role_id IN (SELECT id FROM iam.roles WHERE tenant_id = (SELECT internal.fn_tenant_id())));
CREATE POLICY admin_write ON iam.role_permissions
    FOR ALL TO authenticated
    USING ((SELECT internal.fn_has_role('admin')))
    WITH CHECK ((SELECT internal.fn_has_role('admin')));

-- iam.user_roles
ALTER TABLE iam.user_roles ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_read ON iam.user_roles
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()));
CREATE POLICY admin_write ON iam.user_roles
    FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')));

-- iam.navigation_items (global config)
ALTER TABLE iam.navigation_items ENABLE ROW LEVEL SECURITY;
CREATE POLICY read_all ON iam.navigation_items
    FOR SELECT TO authenticated
    USING (true);

-- iam.role_navigation
ALTER TABLE iam.role_navigation ENABLE ROW LEVEL SECURITY;
CREATE POLICY read_own_tenant ON iam.role_navigation
    FOR SELECT TO authenticated
    USING (role_id IN (SELECT id FROM iam.roles WHERE tenant_id = (SELECT internal.fn_tenant_id())));

-- iam.invitations
ALTER TABLE iam.invitations ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_read ON iam.invitations
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()));
CREATE POLICY admin_write ON iam.invitations
    FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')));

-- =============================================
-- CORE SCHEMA - Macro for tenant isolation
-- Most core tables follow the same pattern:
--   SELECT: tenant isolation
--   INSERT/UPDATE/DELETE: tenant isolation + permission check via RPCs
-- Since writes go through RPCs (SECURITY DEFINER), core RLS
-- primarily enforces tenant isolation on reads.
-- =============================================

-- Helper: Enable RLS + tenant isolation for a core table
-- (We repeat the pattern for clarity and auditability)

-- core.modules
ALTER TABLE core.modules ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.modules FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.courses
ALTER TABLE core.courses ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.courses FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.enrollments
ALTER TABLE core.enrollments ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.enrollments FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.lessons
ALTER TABLE core.lessons ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.lessons FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.lesson_activities
ALTER TABLE core.lesson_activities ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.lesson_activities FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.lesson_materials
ALTER TABLE core.lesson_materials ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.lesson_materials FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.lesson_progress
ALTER TABLE core.lesson_progress ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.lesson_progress FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.lesson_favorites
ALTER TABLE core.lesson_favorites ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.lesson_favorites FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.lesson_comments
ALTER TABLE core.lesson_comments ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.lesson_comments FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.lesson_tags
ALTER TABLE core.lesson_tags ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.lesson_tags FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.evaluation_criteria
ALTER TABLE core.evaluation_criteria ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.evaluation_criteria FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.attendance
ALTER TABLE core.attendance ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.attendance FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.instruments
ALTER TABLE core.instruments ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.instruments FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.instrument_media
ALTER TABLE core.instrument_media ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.instrument_media FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.instrument_sounds
ALTER TABLE core.instrument_sounds ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.instrument_sounds FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.instrument_techniques
ALTER TABLE core.instrument_techniques ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.instrument_techniques FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.instrument_performances
ALTER TABLE core.instrument_performances ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.instrument_performances FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.instrument_facts
ALTER TABLE core.instrument_facts ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.instrument_facts FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.instrument_quizzes
ALTER TABLE core.instrument_quizzes ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.instrument_quizzes FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.instrument_relations
ALTER TABLE core.instrument_relations ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.instrument_relations FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.repertoire_categories
ALTER TABLE core.repertoire_categories ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.repertoire_categories FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.repertoire
ALTER TABLE core.repertoire ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.repertoire FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.history_periods
ALTER TABLE core.history_periods ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.history_periods FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.history_composers
ALTER TABLE core.history_composers ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.history_composers FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.history_works
ALTER TABLE core.history_works ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.history_works FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.achievements
ALTER TABLE core.achievements ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.achievements FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.user_achievements
ALTER TABLE core.user_achievements ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.user_achievements FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.user_progress
ALTER TABLE core.user_progress ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.user_progress FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.points_log
ALTER TABLE core.points_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.points_log FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.portfolios
ALTER TABLE core.portfolios ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.portfolios FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.portfolio_evidence
ALTER TABLE core.portfolio_evidence ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.portfolio_evidence FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.evaluation_rubrics
ALTER TABLE core.evaluation_rubrics ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.evaluation_rubrics FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.methodologies
ALTER TABLE core.methodologies ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.methodologies FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.competencies
ALTER TABLE core.competencies ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.competencies FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.challenges
ALTER TABLE core.challenges ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.challenges FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.challenge_submissions
ALTER TABLE core.challenge_submissions ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.challenge_submissions FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.methodology_progress
ALTER TABLE core.methodology_progress ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.methodology_progress FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.forum_topics
ALTER TABLE core.forum_topics ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.forum_topics FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.forum_replies
ALTER TABLE core.forum_replies ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.forum_replies FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.forum_likes
ALTER TABLE core.forum_likes ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.forum_likes FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.qr_codes
ALTER TABLE core.qr_codes ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.qr_codes FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.qr_scans
ALTER TABLE core.qr_scans ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON core.qr_scans FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- core.notifications
ALTER TABLE core.notifications ENABLE ROW LEVEL SECURITY;
CREATE POLICY own_notifications ON core.notifications
    FOR SELECT TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND user_id = (SELECT auth.uid()));
CREATE POLICY admin_all_notifications ON core.notifications
    FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()) AND (SELECT internal.fn_has_role('admin')));

-- =============================================
-- service_role bypasses RLS by default, no policies needed
-- =============================================
