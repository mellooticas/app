-- =============================================
-- Nipo School - Schema Expansion
-- File: 12_schema_expansion.sql
-- Description: 17 new tables for Feed, Practice, AI, History, Education, Inventory
-- Execute AFTER 11_storage.sql
-- =============================================

-- =============================================
-- 1. New Enums
-- =============================================

CREATE TYPE public.practice_type AS ENUM ('exercise', 'repertoire', 'improvisation', 'technique', 'warmup');
CREATE TYPE public.practice_mood AS ENUM ('easy', 'challenging', 'breakthrough', 'frustrating');
CREATE TYPE public.feed_content_type AS ENUM ('video', 'audio', 'image', 'text');
CREATE TYPE public.learning_style AS ENUM ('visual', 'auditory', 'kinesthetic', 'mixed');
CREATE TYPE public.recommendation_type AS ENUM ('challenge', 'practice', 'content', 'instrument', 'repertoire');

-- =============================================
-- 2. Feed Social / TikTok Musical
-- =============================================

-- 2.1 Feed Posts
CREATE TABLE core.feed_posts (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    author_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    content_type feed_content_type NOT NULL DEFAULT 'text',
    caption text,
    media_url text,
    thumbnail_url text,
    duration_seconds integer,
    visibility visibility NOT NULL DEFAULT 'class_only',
    challenge_id uuid REFERENCES core.challenges(id) ON DELETE SET NULL,
    is_pinned boolean NOT NULL DEFAULT false,
    is_featured boolean NOT NULL DEFAULT false,
    view_count integer NOT NULL DEFAULT 0,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    deleted_at timestamptz
);

CREATE INDEX idx_feed_posts_tenant_id ON core.feed_posts(tenant_id);
CREATE INDEX idx_feed_posts_author_id ON core.feed_posts(author_id);
CREATE INDEX idx_feed_posts_created_at ON core.feed_posts(tenant_id, created_at DESC);
CREATE INDEX idx_feed_posts_challenge ON core.feed_posts(challenge_id) WHERE challenge_id IS NOT NULL;

COMMENT ON TABLE core.feed_posts IS 'TikTok-style feed posts: short videos, audio recordings, images, text insights.';

-- 2.2 Feed Comments
CREATE TABLE core.feed_comments (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    post_id uuid NOT NULL REFERENCES core.feed_posts(id) ON DELETE CASCADE,
    author_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    content text NOT NULL,
    parent_id uuid REFERENCES core.feed_comments(id) ON DELETE CASCADE,
    created_at timestamptz NOT NULL DEFAULT now(),
    deleted_at timestamptz
);

CREATE INDEX idx_feed_comments_post ON core.feed_comments(post_id);
CREATE INDEX idx_feed_comments_tenant ON core.feed_comments(tenant_id);

COMMENT ON TABLE core.feed_comments IS 'Comments on feed posts. Supports threaded replies via parent_id.';

-- 2.3 Feed Likes
CREATE TABLE core.feed_likes (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    post_id uuid REFERENCES core.feed_posts(id) ON DELETE CASCADE,
    comment_id uuid REFERENCES core.feed_comments(id) ON DELETE CASCADE,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT feed_likes_target_check CHECK (post_id IS NOT NULL OR comment_id IS NOT NULL),
    CONSTRAINT feed_likes_unique_post UNIQUE (user_id, post_id),
    CONSTRAINT feed_likes_unique_comment UNIQUE (user_id, comment_id)
);

CREATE INDEX idx_feed_likes_post ON core.feed_likes(post_id) WHERE post_id IS NOT NULL;
CREATE INDEX idx_feed_likes_tenant ON core.feed_likes(tenant_id);

COMMENT ON TABLE core.feed_likes IS 'Likes on feed posts and comments. One like per user per target.';

-- =============================================
-- 3. Practice Diary
-- =============================================

CREATE TABLE core.practice_sessions (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    student_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    instrument_id uuid REFERENCES core.instruments(id) ON DELETE SET NULL,
    duration_minutes integer NOT NULL CHECK (duration_minutes > 0),
    practice_type practice_type NOT NULL DEFAULT 'exercise',
    mood practice_mood,
    notes text,
    media_url text,
    challenge_id uuid REFERENCES core.challenges(id) ON DELETE SET NULL,
    session_date date NOT NULL DEFAULT CURRENT_DATE,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_practice_sessions_tenant ON core.practice_sessions(tenant_id);
CREATE INDEX idx_practice_sessions_student ON core.practice_sessions(student_id);
CREATE INDEX idx_practice_sessions_date ON core.practice_sessions(tenant_id, student_id, session_date DESC);

COMMENT ON TABLE core.practice_sessions IS 'Daily practice diary entries. Students log their practice with duration, type, mood, and optional media.';

-- =============================================
-- 4. AI / Adaptive Learning
-- =============================================

-- 4.1 Student Learning Profiles
CREATE TABLE core.student_learning_profiles (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    preferred_style learning_style NOT NULL DEFAULT 'mixed',
    current_focus_areas jsonb NOT NULL DEFAULT '[]',
    strengths jsonb NOT NULL DEFAULT '[]',
    areas_for_growth jsonb NOT NULL DEFAULT '[]',
    weekly_goal_minutes integer NOT NULL DEFAULT 60,
    preferred_difficulty integer NOT NULL DEFAULT 2 CHECK (preferred_difficulty BETWEEN 1 AND 5),
    ai_notes jsonb NOT NULL DEFAULT '{}',
    last_recommendation_at timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT student_learning_profiles_unique UNIQUE (user_id)
);

CREATE INDEX idx_student_learning_profiles_tenant ON core.student_learning_profiles(tenant_id);

COMMENT ON TABLE core.student_learning_profiles IS 'AI learning profile per student. Stores preferences, strengths, and growth areas for adaptive recommendations.';

-- 4.2 Learning Recommendations
CREATE TABLE core.learning_recommendations (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    recommendation_type recommendation_type NOT NULL,
    title text NOT NULL,
    description text,
    reference_type varchar(50),
    reference_id uuid,
    reason text,
    priority integer NOT NULL DEFAULT 0,
    is_dismissed boolean NOT NULL DEFAULT false,
    is_completed boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_learning_recommendations_user ON core.learning_recommendations(tenant_id, user_id);
CREATE INDEX idx_learning_recommendations_active ON core.learning_recommendations(user_id) WHERE is_dismissed = false AND is_completed = false;

COMMENT ON TABLE core.learning_recommendations IS 'AI-generated learning recommendations personalized per student.';

-- =============================================
-- 5. History Expansion
-- =============================================

-- 5.1 Music Genres
CREATE TABLE core.history_genres (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    name varchar(200) NOT NULL,
    slug varchar(50),
    origin_period_id uuid REFERENCES core.history_periods(id) ON DELETE SET NULL,
    origin_decade varchar(10),
    origin_country varchar(100),
    description text,
    musical_characteristics text,
    related_genres jsonb NOT NULL DEFAULT '[]',
    main_composers jsonb NOT NULL DEFAULT '[]',
    representative_works jsonb NOT NULL DEFAULT '[]',
    cultural_influences text,
    image_url text,
    theme_color varchar(20),
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_history_genres_tenant ON core.history_genres(tenant_id);

COMMENT ON TABLE core.history_genres IS 'Music genres catalog: 32+ genres from Gagaku to J-Pop, Bossa Nova to Reggae.';

-- 5.2 Musical Movements
CREATE TABLE core.history_movements (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    name varchar(200) NOT NULL,
    description text,
    start_year integer,
    end_year integer,
    main_locations text,
    manifesto text,
    characteristics text,
    composers jsonb NOT NULL DEFAULT '[]',
    iconic_works jsonb NOT NULL DEFAULT '[]',
    historical_context text,
    legacy text,
    image_url text,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_history_movements_tenant ON core.history_movements(tenant_id);

COMMENT ON TABLE core.history_movements IS 'Musical and artistic movements: Tropicalismo, Nationalism, Impressionism, etc.';

-- 5.3 Cultural Contexts
CREATE TABLE core.history_cultural_contexts (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    period_id uuid REFERENCES core.history_periods(id) ON DELETE SET NULL,
    title varchar(200) NOT NULL,
    context_type varchar(50),
    description text,
    impact_on_music text,
    start_year integer,
    end_year integer,
    images_url jsonb NOT NULL DEFAULT '[]',
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_history_cultural_contexts_tenant ON core.history_cultural_contexts(tenant_id);
CREATE INDEX idx_history_cultural_contexts_period ON core.history_cultural_contexts(period_id);

COMMENT ON TABLE core.history_cultural_contexts IS 'Historical, political, social, and technological contexts that influenced music in each period.';

-- 5.4 Timeline Events
CREATE TABLE core.history_timeline_events (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    year integer NOT NULL,
    month integer,
    day integer,
    title varchar(200) NOT NULL,
    event_type varchar(50),
    category varchar(50),
    description text,
    composer_id uuid REFERENCES core.history_composers(id) ON DELETE SET NULL,
    work_id uuid REFERENCES core.history_works(id) ON DELETE SET NULL,
    period_id uuid REFERENCES core.history_periods(id) ON DELETE SET NULL,
    image_url text,
    importance integer NOT NULL DEFAULT 3 CHECK (importance BETWEEN 1 AND 5),
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_history_timeline_tenant ON core.history_timeline_events(tenant_id);
CREATE INDEX idx_history_timeline_year ON core.history_timeline_events(year);

COMMENT ON TABLE core.history_timeline_events IS 'Interactive timeline events: births, premieres, milestones across 1200 years of music history.';

-- 5.5 Music Theory Concepts
CREATE TABLE core.history_theory_concepts (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    name varchar(200) NOT NULL,
    category varchar(50),
    simple_definition text,
    technical_definition text,
    origin_period_id uuid REFERENCES core.history_periods(id) ON DELETE SET NULL,
    audio_examples jsonb NOT NULL DEFAULT '[]',
    diagram_url text,
    difficulty_level integer CHECK (difficulty_level BETWEEN 1 AND 5),
    prerequisites jsonb NOT NULL DEFAULT '[]',
    exercises jsonb NOT NULL DEFAULT '[]',
    tags jsonb NOT NULL DEFAULT '[]',
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_history_theory_tenant ON core.history_theory_concepts(tenant_id);

COMMENT ON TABLE core.history_theory_concepts IS 'Music theory concepts: Baixo Contínuo, Forma Sonata, Dodecafonismo, etc.';

-- 5.6 Instrument Evolution
CREATE TABLE core.history_instrument_evolution (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    instrument_id uuid REFERENCES core.instruments(id) ON DELETE SET NULL,
    period_id uuid REFERENCES core.history_periods(id) ON DELETE SET NULL,
    historical_version varchar(200),
    approximate_year integer,
    inventor varchar(200),
    technical_description text,
    differences_from_modern text,
    image_url text,
    audio_url text,
    curiosities text,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_history_instrument_evo_tenant ON core.history_instrument_evolution(tenant_id);
CREATE INDEX idx_history_instrument_evo_instrument ON core.history_instrument_evolution(instrument_id);

COMMENT ON TABLE core.history_instrument_evolution IS 'How instruments evolved through history: Stradivarius violin (1680), Boehm clarinet (1750), etc.';

-- 5.7 History Quizzes
CREATE TABLE core.history_quizzes (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    title varchar(200),
    period_id uuid REFERENCES core.history_periods(id) ON DELETE SET NULL,
    difficulty_level integer CHECK (difficulty_level BETWEEN 1 AND 5),
    question_type quiz_type NOT NULL DEFAULT 'multiple_choice',
    question text NOT NULL,
    options jsonb,
    correct_answer text NOT NULL,
    explanation text,
    audio_url text,
    image_url text,
    tags jsonb NOT NULL DEFAULT '[]',
    points integer NOT NULL DEFAULT 10,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_history_quizzes_tenant ON core.history_quizzes(tenant_id);
CREATE INDEX idx_history_quizzes_period ON core.history_quizzes(period_id) WHERE period_id IS NOT NULL;

COMMENT ON TABLE core.history_quizzes IS 'Quiz questions about music history, linked to periods.';

-- =============================================
-- 6. Education Expansion
-- =============================================

-- 6.1 Lesson Checklists
CREATE TABLE core.lesson_checklists (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    lesson_id uuid NOT NULL REFERENCES core.lessons(id) ON DELETE CASCADE,
    item text NOT NULL,
    checklist_type varchar(30) NOT NULL DEFAULT 'preparation',
    is_done boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_lesson_checklists_lesson ON core.lesson_checklists(lesson_id);
CREATE INDEX idx_lesson_checklists_tenant ON core.lesson_checklists(tenant_id);

COMMENT ON TABLE core.lesson_checklists IS 'Pre-lesson preparation and execution checklists for teachers.';

-- 6.2 Teaching Sequences
CREATE TABLE core.teaching_sequences (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    title varchar(200) NOT NULL,
    methodology_id uuid REFERENCES core.methodologies(id) ON DELETE SET NULL,
    age_range varchar(30),
    duration_weeks integer,
    objectives text,
    week_number integer,
    main_activity text,
    circle_activity text,
    game_dynamic text,
    required_materials text,
    notes text,
    created_by uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_teaching_sequences_tenant ON core.teaching_sequences(tenant_id);
CREATE INDEX idx_teaching_sequences_methodology ON core.teaching_sequences(methodology_id) WHERE methodology_id IS NOT NULL;

COMMENT ON TABLE core.teaching_sequences IS 'Didactic sequences organized by methodology, age range, and weekly structure.';

-- 6.3 Support Materials (Digital Library)
CREATE TABLE core.support_materials (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    title varchar(200) NOT NULL,
    material_type varchar(50) NOT NULL,
    category varchar(50),
    description text,
    file_url text,
    module_id uuid REFERENCES core.modules(id) ON DELETE SET NULL,
    methodology_id uuid REFERENCES core.methodologies(id) ON DELETE SET NULL,
    instrument_id uuid REFERENCES core.instruments(id) ON DELETE SET NULL,
    difficulty_level integer CHECK (difficulty_level BETWEEN 1 AND 5),
    tags jsonb NOT NULL DEFAULT '[]',
    file_size_mb decimal(6,2),
    duration_seconds integer,
    author varchar(200),
    license varchar(100),
    download_count integer NOT NULL DEFAULT 0,
    view_count integer NOT NULL DEFAULT 0,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_support_materials_tenant ON core.support_materials(tenant_id);
CREATE INDEX idx_support_materials_type ON core.support_materials(tenant_id, material_type);

COMMENT ON TABLE core.support_materials IS 'Centralized digital library: PDFs, videos, audio, guides, sheet music - organized by module, methodology, instrument.';

-- =============================================
-- 7. Physical Instrument Inventory
-- =============================================

CREATE TABLE core.instrument_inventory (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    unit_id uuid REFERENCES iam.units(id) ON DELETE SET NULL,
    instrument_id uuid NOT NULL REFERENCES core.instruments(id) ON DELETE CASCADE,
    asset_code varchar(50),
    serial_number varchar(100),
    brand varchar(100),
    model varchar(100),
    acquisition_value decimal(10,2),
    acquisition_date date,
    owner varchar(200),
    condition varchar(30) NOT NULL DEFAULT 'good',
    location varchar(200),
    is_available boolean NOT NULL DEFAULT true,
    notes text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_instrument_inventory_tenant ON core.instrument_inventory(tenant_id);
CREATE INDEX idx_instrument_inventory_instrument ON core.instrument_inventory(instrument_id);
CREATE INDEX idx_instrument_inventory_available ON core.instrument_inventory(tenant_id, is_available) WHERE is_available = true;

COMMENT ON TABLE core.instrument_inventory IS 'Physical instrument tracking: serial numbers, condition, location, availability.';

-- =============================================
-- 8. RLS Policies for all new tables
-- =============================================

-- Enable RLS on all new tables
ALTER TABLE core.feed_posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.feed_comments ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.feed_likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.practice_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.student_learning_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.learning_recommendations ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.history_genres ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.history_movements ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.history_cultural_contexts ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.history_timeline_events ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.history_theory_concepts ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.history_instrument_evolution ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.history_quizzes ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.lesson_checklists ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.teaching_sequences ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.support_materials ENABLE ROW LEVEL SECURITY;
ALTER TABLE core.instrument_inventory ENABLE ROW LEVEL SECURITY;

-- Tenant isolation for all new tables
CREATE POLICY tenant_isolation ON core.feed_posts FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.feed_comments FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.feed_likes FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.practice_sessions FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.student_learning_profiles FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.learning_recommendations FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.history_genres FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.history_movements FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.history_cultural_contexts FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.history_timeline_events FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.history_theory_concepts FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.history_instrument_evolution FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.history_quizzes FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.lesson_checklists FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.teaching_sequences FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.support_materials FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

CREATE POLICY tenant_isolation ON core.instrument_inventory FOR ALL TO authenticated
    USING (tenant_id = (SELECT internal.fn_tenant_id()))
    WITH CHECK (tenant_id = (SELECT internal.fn_tenant_id()));

-- =============================================
-- 9. Triggers (updated_at)
-- =============================================

CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.feed_posts
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.student_learning_profiles
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.lesson_checklists
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

CREATE TRIGGER set_updated_at BEFORE UPDATE ON core.instrument_inventory
    FOR EACH ROW EXECUTE FUNCTION public.fn_set_updated_at();

-- =============================================
-- 10. Points trigger for feed and practice
-- =============================================

-- Award points when practice session is logged (10 pts)
CREATE OR REPLACE FUNCTION core.fn_on_practice_logged()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core
AS $$
BEGIN
    INSERT INTO core.points_log (tenant_id, user_id, points, source, action, reference_type, reference_id)
    VALUES (NEW.tenant_id, NEW.student_id, 10, 'practice', 'session_logged', 'practice_session', NEW.id);
    RETURN NEW;
END;
$$;

CREATE TRIGGER on_practice_logged
    AFTER INSERT ON core.practice_sessions
    FOR EACH ROW
    EXECUTE FUNCTION core.fn_on_practice_logged();

-- Award points when feed post is created (10 pts)
CREATE OR REPLACE FUNCTION core.fn_on_feed_post_created()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core
AS $$
BEGIN
    INSERT INTO core.points_log (tenant_id, user_id, points, source, action, reference_type, reference_id)
    VALUES (NEW.tenant_id, NEW.author_id, 10, 'feed', 'post_created', 'feed_post', NEW.id);
    RETURN NEW;
END;
$$;

CREATE TRIGGER on_feed_post_created
    AFTER INSERT ON core.feed_posts
    FOR EACH ROW
    EXECUTE FUNCTION core.fn_on_feed_post_created();

-- Award points when receiving a like (2 pts to the post author)
CREATE OR REPLACE FUNCTION core.fn_on_feed_like()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = core
AS $$
DECLARE
    v_author_id uuid;
BEGIN
    IF NEW.post_id IS NOT NULL THEN
        SELECT author_id INTO v_author_id FROM core.feed_posts WHERE id = NEW.post_id;
        IF v_author_id IS NOT NULL AND v_author_id != NEW.user_id THEN
            INSERT INTO core.points_log (tenant_id, user_id, points, source, action, reference_type, reference_id)
            VALUES (NEW.tenant_id, v_author_id, 2, 'feed', 'like_received', 'feed_like', NEW.id);
        END IF;
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER on_feed_like
    AFTER INSERT ON core.feed_likes
    FOR EACH ROW
    EXECUTE FUNCTION core.fn_on_feed_like();

-- =============================================
-- 11. Summary
-- =============================================
-- New enums: 5 (practice_type, practice_mood, feed_content_type, learning_style, recommendation_type)
-- New tables: 17
--   Feed: feed_posts, feed_comments, feed_likes
--   Practice: practice_sessions
--   AI: student_learning_profiles, learning_recommendations
--   History: history_genres, history_movements, history_cultural_contexts,
--            history_timeline_events, history_theory_concepts,
--            history_instrument_evolution, history_quizzes
--   Education: lesson_checklists, teaching_sequences, support_materials
--   Inventory: instrument_inventory
-- RLS: tenant_isolation on all 17 tables
-- Triggers: 4 updated_at + 3 gamification (practice, feed post, feed like)
-- Total tables: 53 + 17 = 70

NOTIFY pgrst, 'reload schema';
