-- =============================================
-- Nipo School - New Database Schema
-- File: 03_core_tables.sql
-- Description: Core schema - 43 domain tables
-- =============================================

-- ===========================================
-- EDUCATION (12 tables)
-- ===========================================

-- 1. core.modules
CREATE TABLE core.modules (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    name            varchar(200) NOT NULL,
    description     text,
    order_index     integer NOT NULL DEFAULT 0,
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_modules_tenant_id ON core.modules(tenant_id);

-- 2. core.courses (turmas)
CREATE TABLE core.courses (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    unit_id         uuid REFERENCES iam.units(id) ON DELETE SET NULL,
    name            varchar(200) NOT NULL,
    description     text,
    instrument_id   uuid,  -- FK added after core.instruments is created
    teacher_id      uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    level           course_level NOT NULL DEFAULT 'beginner',
    max_students    integer,
    schedule        text,
    start_date      date,
    end_date        date,
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now(),
    deleted_at      timestamptz
);

CREATE INDEX idx_courses_tenant_id ON core.courses(tenant_id);
CREATE INDEX idx_courses_unit_id ON core.courses(unit_id) WHERE unit_id IS NOT NULL;
CREATE INDEX idx_courses_teacher_id ON core.courses(teacher_id) WHERE teacher_id IS NOT NULL;
CREATE INDEX idx_courses_active ON core.courses(tenant_id, is_active) WHERE deleted_at IS NULL;

-- 3. core.enrollments (matriculas)
CREATE TABLE core.enrollments (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    course_id       uuid NOT NULL REFERENCES core.courses(id) ON DELETE CASCADE,
    student_id      uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    status          enrollment_status NOT NULL DEFAULT 'pending',
    enrolled_at     timestamptz NOT NULL DEFAULT now(),
    completed_at    timestamptz,
    created_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(course_id, student_id)
);

CREATE INDEX idx_enrollments_tenant_id ON core.enrollments(tenant_id);
CREATE INDEX idx_enrollments_student_id ON core.enrollments(student_id);
CREATE INDEX idx_enrollments_course_id ON core.enrollments(course_id);

-- 4. core.lessons (aulas)
CREATE TABLE core.lessons (
    id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id           uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    module_id           uuid REFERENCES core.modules(id) ON DELETE SET NULL,
    number              integer,
    title               varchar(200) NOT NULL,
    description         text,
    learning_objective  text,
    scheduled_date      date,
    duration_minutes    integer,
    status              lesson_status NOT NULL DEFAULT 'draft',
    teacher_id          uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    is_active           boolean NOT NULL DEFAULT true,
    created_at          timestamptz NOT NULL DEFAULT now(),
    updated_at          timestamptz NOT NULL DEFAULT now(),
    deleted_at          timestamptz
);

CREATE INDEX idx_lessons_tenant_id ON core.lessons(tenant_id);
CREATE INDEX idx_lessons_module_id ON core.lessons(module_id) WHERE module_id IS NOT NULL;
CREATE INDEX idx_lessons_teacher_id ON core.lessons(teacher_id) WHERE teacher_id IS NOT NULL;
CREATE INDEX idx_lessons_status ON core.lessons(tenant_id, status) WHERE deleted_at IS NULL;

-- 5. core.lesson_activities
CREATE TABLE core.lesson_activities (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    lesson_id       uuid NOT NULL REFERENCES core.lessons(id) ON DELETE CASCADE,
    title           text NOT NULL,
    description     text,
    activity_type   varchar(50),
    duration_minutes integer,
    order_index     integer NOT NULL DEFAULT 0,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_lesson_activities_lesson_id ON core.lesson_activities(lesson_id);

-- 6. core.lesson_materials
CREATE TABLE core.lesson_materials (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    lesson_id       uuid NOT NULL REFERENCES core.lessons(id) ON DELETE CASCADE,
    title           varchar(200) NOT NULL,
    description     text,
    material_type   material_type NOT NULL DEFAULT 'document',
    file_url        text,
    order_index     integer NOT NULL DEFAULT 0,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_lesson_materials_lesson_id ON core.lesson_materials(lesson_id);

-- 7. core.lesson_progress
CREATE TABLE core.lesson_progress (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    lesson_id       uuid NOT NULL REFERENCES core.lessons(id) ON DELETE CASCADE,
    student_id      uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    is_completed    boolean NOT NULL DEFAULT false,
    progress_percent integer NOT NULL DEFAULT 0 CHECK (progress_percent BETWEEN 0 AND 100),
    notes           text,
    completed_at    timestamptz,
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(lesson_id, student_id)
);

CREATE INDEX idx_lesson_progress_student_id ON core.lesson_progress(student_id);
CREATE INDEX idx_lesson_progress_tenant_id ON core.lesson_progress(tenant_id);

-- 8. core.lesson_favorites
CREATE TABLE core.lesson_favorites (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    lesson_id       uuid NOT NULL REFERENCES core.lessons(id) ON DELETE CASCADE,
    student_id      uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(lesson_id, student_id)
);

CREATE INDEX idx_lesson_favorites_student_id ON core.lesson_favorites(student_id);

-- 9. core.lesson_comments
CREATE TABLE core.lesson_comments (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    lesson_id       uuid NOT NULL REFERENCES core.lessons(id) ON DELETE CASCADE,
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    content         text NOT NULL,
    parent_id       uuid REFERENCES core.lesson_comments(id) ON DELETE CASCADE,
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now(),
    deleted_at      timestamptz
);

CREATE INDEX idx_lesson_comments_lesson_id ON core.lesson_comments(lesson_id);
CREATE INDEX idx_lesson_comments_user_id ON core.lesson_comments(user_id);

-- 10. core.lesson_tags
CREATE TABLE core.lesson_tags (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    lesson_id       uuid NOT NULL REFERENCES core.lessons(id) ON DELETE CASCADE,
    tag             varchar(50) NOT NULL,
    created_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(lesson_id, tag)
);

CREATE INDEX idx_lesson_tags_lesson_id ON core.lesson_tags(lesson_id);

-- 11. core.evaluation_criteria
CREATE TABLE core.evaluation_criteria (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    lesson_id       uuid NOT NULL REFERENCES core.lessons(id) ON DELETE CASCADE,
    name            varchar(200) NOT NULL,
    description     text,
    weight          decimal(3,2) NOT NULL DEFAULT 1.00,
    order_index     integer NOT NULL DEFAULT 0,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_evaluation_criteria_lesson_id ON core.evaluation_criteria(lesson_id);

-- 12. core.attendance
CREATE TABLE core.attendance (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    course_id       uuid NOT NULL REFERENCES core.courses(id) ON DELETE CASCADE,
    lesson_id       uuid REFERENCES core.lessons(id) ON DELETE SET NULL,
    student_id      uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    date            date NOT NULL,
    is_present      boolean,
    justification   text,
    notes           text,
    created_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(course_id, student_id, date)
);

CREATE INDEX idx_attendance_tenant_id ON core.attendance(tenant_id);
CREATE INDEX idx_attendance_student_id ON core.attendance(student_id);
CREATE INDEX idx_attendance_course_id ON core.attendance(course_id);

-- ===========================================
-- INSTRUMENTS (8 tables)
-- ===========================================

-- 13. core.instruments
CREATE TABLE core.instruments (
    id                      uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id               uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    name                    varchar(200) NOT NULL,
    family                  varchar(50),
    category                varchar(50),
    description             text,
    detailed_description    text,
    origin                  varchar(100),
    difficulty_level        integer CHECK (difficulty_level BETWEEN 1 AND 5),
    recommended_age_range   varchar(30),
    image_url               text,
    video_url               text,
    audio_url               text,
    popularity              integer NOT NULL DEFAULT 0,
    display_order           integer NOT NULL DEFAULT 0,
    is_active               boolean NOT NULL DEFAULT true,
    created_at              timestamptz NOT NULL DEFAULT now(),
    updated_at              timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_instruments_tenant_id ON core.instruments(tenant_id);
CREATE INDEX idx_instruments_active ON core.instruments(tenant_id, is_active) WHERE is_active = true;

-- Add deferred FK from courses to instruments
ALTER TABLE core.courses
    ADD CONSTRAINT fk_courses_instrument
    FOREIGN KEY (instrument_id) REFERENCES core.instruments(id) ON DELETE SET NULL;

-- 14. core.instrument_media
CREATE TABLE core.instrument_media (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    instrument_id   uuid NOT NULL REFERENCES core.instruments(id) ON DELETE CASCADE,
    title           varchar(200) NOT NULL,
    media_type      varchar(20) NOT NULL CHECK (media_type IN ('image', 'video', 'audio', 'model_3d')),
    url             text NOT NULL,
    thumbnail_url   text,
    order_index     integer NOT NULL DEFAULT 0,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_instrument_media_instrument_id ON core.instrument_media(instrument_id);

-- 15. core.instrument_sounds
CREATE TABLE core.instrument_sounds (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    instrument_id   uuid NOT NULL REFERENCES core.instruments(id) ON DELETE CASCADE,
    title           varchar(200) NOT NULL,
    description     text,
    audio_url       text NOT NULL,
    sound_type      varchar(50),
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_instrument_sounds_instrument_id ON core.instrument_sounds(instrument_id);

-- 16. core.instrument_techniques
CREATE TABLE core.instrument_techniques (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    instrument_id   uuid NOT NULL REFERENCES core.instruments(id) ON DELETE CASCADE,
    name            varchar(200) NOT NULL,
    description     text,
    difficulty      technique_difficulty NOT NULL DEFAULT 'beginner',
    video_url       text,
    order_index     integer NOT NULL DEFAULT 0,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_instrument_techniques_instrument_id ON core.instrument_techniques(instrument_id);

-- 17. core.instrument_performances
CREATE TABLE core.instrument_performances (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    instrument_id   uuid NOT NULL REFERENCES core.instruments(id) ON DELETE CASCADE,
    artist          varchar(200) NOT NULL,
    title           varchar(200) NOT NULL,
    video_url       text,
    description     text,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_instrument_performances_instrument_id ON core.instrument_performances(instrument_id);

-- 18. core.instrument_facts
CREATE TABLE core.instrument_facts (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    instrument_id   uuid NOT NULL REFERENCES core.instruments(id) ON DELETE CASCADE,
    title           varchar(200) NOT NULL,
    description     text,
    image_url       text,
    order_index     integer NOT NULL DEFAULT 0,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_instrument_facts_instrument_id ON core.instrument_facts(instrument_id);

-- 19. core.instrument_quizzes
CREATE TABLE core.instrument_quizzes (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    instrument_id   uuid NOT NULL REFERENCES core.instruments(id) ON DELETE CASCADE,
    question_type   quiz_type NOT NULL DEFAULT 'multiple_choice',
    question        text NOT NULL,
    correct_answer  text NOT NULL,
    options         jsonb,
    points          integer NOT NULL DEFAULT 10,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_instrument_quizzes_instrument_id ON core.instrument_quizzes(instrument_id);

-- 20. core.instrument_relations
CREATE TABLE core.instrument_relations (
    id                      uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id               uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    instrument_id           uuid NOT NULL REFERENCES core.instruments(id) ON DELETE CASCADE,
    related_instrument_id   uuid NOT NULL REFERENCES core.instruments(id) ON DELETE CASCADE,
    relation_type           varchar(50),
    created_at              timestamptz NOT NULL DEFAULT now(),

    UNIQUE(instrument_id, related_instrument_id),
    CHECK (instrument_id <> related_instrument_id)
);

CREATE INDEX idx_instrument_relations_instrument_id ON core.instrument_relations(instrument_id);

-- ===========================================
-- MUSICAL CONTENT (5 tables)
-- ===========================================

-- 21. core.repertoire_categories
CREATE TABLE core.repertoire_categories (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    name            varchar(200) NOT NULL,
    description     text,
    order_index     integer NOT NULL DEFAULT 0,
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_repertoire_categories_tenant_id ON core.repertoire_categories(tenant_id);

-- 22. core.repertoire
CREATE TABLE core.repertoire (
    id                      uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id               uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    title                   varchar(200) NOT NULL,
    composer                varchar(200),
    arranger                varchar(200),
    category_id             uuid REFERENCES core.repertoire_categories(id) ON DELETE SET NULL,
    key_signature           varchar(10),
    tempo                   varchar(30),
    estimated_duration      interval,
    difficulty_level        difficulty_level,
    required_instruments    jsonb DEFAULT '[]',
    min_participants        integer,
    sheet_music_url         text,
    chord_chart_url         text,
    lyrics_url              text,
    playback_url            text,
    tutorial_video_url      text,
    is_public               boolean NOT NULL DEFAULT false,
    requires_approval       boolean NOT NULL DEFAULT false,
    tags                    jsonb NOT NULL DEFAULT '[]',
    notes                   text,
    is_active               boolean NOT NULL DEFAULT true,
    created_at              timestamptz NOT NULL DEFAULT now(),
    updated_at              timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_repertoire_tenant_id ON core.repertoire(tenant_id);
CREATE INDEX idx_repertoire_category_id ON core.repertoire(category_id) WHERE category_id IS NOT NULL;
CREATE INDEX idx_repertoire_active ON core.repertoire(tenant_id, is_active) WHERE is_active = true;

-- 23. core.history_periods
CREATE TABLE core.history_periods (
    id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id           uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    name                varchar(200) NOT NULL,
    description         text,
    start_year          integer,
    end_year            integer,
    theme_color         varchar(20),
    cover_image_url     text,
    chronological_order integer NOT NULL DEFAULT 0,
    is_active           boolean NOT NULL DEFAULT true,
    created_at          timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_history_periods_tenant_id ON core.history_periods(tenant_id);

-- 24. core.history_composers
CREATE TABLE core.history_composers (
    id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id           uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    full_name           varchar(200) NOT NULL,
    artistic_name       varchar(200),
    period_id           uuid REFERENCES core.history_periods(id) ON DELETE SET NULL,
    birth_country       varchar(100),
    birth_date          date,
    death_date          date,
    biography           text,
    photo_url           text,
    importance_level    integer CHECK (importance_level BETWEEN 1 AND 5),
    is_active           boolean NOT NULL DEFAULT true,
    created_at          timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_history_composers_tenant_id ON core.history_composers(tenant_id);
CREATE INDEX idx_history_composers_period_id ON core.history_composers(period_id) WHERE period_id IS NOT NULL;

-- 25. core.history_works
CREATE TABLE core.history_works (
    id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id           uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    title               varchar(200) NOT NULL,
    original_title      varchar(200),
    composer_id         uuid REFERENCES core.history_composers(id) ON DELETE SET NULL,
    period_id           uuid REFERENCES core.history_periods(id) ON DELETE SET NULL,
    composition_year    integer,
    work_type           varchar(50),
    genre               varchar(50),
    difficulty_level    difficulty_level,
    popularity          integer NOT NULL DEFAULT 0,
    audio_url           text,
    video_url           text,
    score_url           text,
    is_active           boolean NOT NULL DEFAULT true,
    created_at          timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_history_works_tenant_id ON core.history_works(tenant_id);
CREATE INDEX idx_history_works_composer_id ON core.history_works(composer_id) WHERE composer_id IS NOT NULL;
CREATE INDEX idx_history_works_period_id ON core.history_works(period_id) WHERE period_id IS NOT NULL;

-- ===========================================
-- GAMIFICATION (4 tables)
-- ===========================================

-- 26. core.achievements
CREATE TABLE core.achievements (
    id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id           uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    name                varchar(200) NOT NULL,
    description         text,
    badge_icon          varchar(50),
    badge_color         varchar(20),
    points_reward       integer NOT NULL DEFAULT 0,
    category            achievement_category NOT NULL DEFAULT 'progress',
    requirement_type    varchar(50),
    requirement_value   integer,
    is_active           boolean NOT NULL DEFAULT true,
    created_at          timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_achievements_tenant_id ON core.achievements(tenant_id);

-- 27. core.user_achievements
CREATE TABLE core.user_achievements (
    id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id           uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id             uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    achievement_id      uuid NOT NULL REFERENCES core.achievements(id) ON DELETE CASCADE,
    current_progress    integer NOT NULL DEFAULT 0,
    target_progress     integer,
    is_completed        boolean NOT NULL DEFAULT false,
    completed_at        timestamptz,
    metadata            jsonb NOT NULL DEFAULT '{}',
    created_at          timestamptz NOT NULL DEFAULT now(),
    updated_at          timestamptz NOT NULL DEFAULT now(),

    UNIQUE(user_id, achievement_id)
);

CREATE INDEX idx_user_achievements_tenant_id ON core.user_achievements(tenant_id);
CREATE INDEX idx_user_achievements_user_id ON core.user_achievements(user_id);

-- 28. core.user_progress
CREATE TABLE core.user_progress (
    id                      uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id               uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id                 uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    total_points            integer NOT NULL DEFAULT 0,
    level                   integer NOT NULL DEFAULT 1,
    level_name              varchar(50) NOT NULL DEFAULT 'Beginner',
    current_xp              integer NOT NULL DEFAULT 0,
    xp_to_next_level        integer NOT NULL DEFAULT 100,
    current_streak          integer NOT NULL DEFAULT 0,
    longest_streak          integer NOT NULL DEFAULT 0,
    lessons_completed       integer NOT NULL DEFAULT 0,
    achievements_unlocked   integer NOT NULL DEFAULT 0,
    badges_earned           integer NOT NULL DEFAULT 0,
    created_at              timestamptz NOT NULL DEFAULT now(),
    updated_at              timestamptz NOT NULL DEFAULT now(),

    UNIQUE(tenant_id, user_id)
);

CREATE INDEX idx_user_progress_user_id ON core.user_progress(user_id);

-- 29. core.points_log
CREATE TABLE core.points_log (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    points          integer NOT NULL,
    source          varchar(50) NOT NULL,
    action          varchar(100),
    description     text,
    reference_type  varchar(50),
    reference_id    uuid,
    metadata        jsonb NOT NULL DEFAULT '{}',
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_points_log_tenant_id ON core.points_log(tenant_id);
CREATE INDEX idx_points_log_user_id ON core.points_log(user_id);
CREATE INDEX idx_points_log_created_at ON core.points_log(created_at DESC);

-- ===========================================
-- PORTFOLIO (3 tables)
-- ===========================================

-- 30. core.portfolios
CREATE TABLE core.portfolios (
    id                      uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id               uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    student_id              uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    title                   varchar(200) NOT NULL,
    description             text,
    work_type               portfolio_type NOT NULL DEFAULT 'project',
    status                  portfolio_status NOT NULL DEFAULT 'draft',
    visibility              visibility NOT NULL DEFAULT 'private',
    learning_objectives     text,
    initial_reflection      text,
    final_reflection        text,
    instrument_id           uuid REFERENCES core.instruments(id) ON DELETE SET NULL,
    difficulty_level        difficulty_level,
    file_url                text,
    video_url               text,
    audio_url               text,
    tags                    jsonb NOT NULL DEFAULT '[]',
    grade                   decimal(5,2),
    feedback                text,
    evaluated_by            uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    evaluated_at            timestamptz,
    created_at              timestamptz NOT NULL DEFAULT now(),
    updated_at              timestamptz NOT NULL DEFAULT now(),
    deleted_at              timestamptz
);

CREATE INDEX idx_portfolios_tenant_id ON core.portfolios(tenant_id);
CREATE INDEX idx_portfolios_student_id ON core.portfolios(student_id);
CREATE INDEX idx_portfolios_status ON core.portfolios(tenant_id, status) WHERE deleted_at IS NULL;

-- 31. core.portfolio_evidence
CREATE TABLE core.portfolio_evidence (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    portfolio_id    uuid NOT NULL REFERENCES core.portfolios(id) ON DELETE CASCADE,
    evidence_type   evidence_type NOT NULL DEFAULT 'document',
    title           varchar(200) NOT NULL,
    description     text,
    file_url        text NOT NULL,
    notes           text,
    metadata        jsonb NOT NULL DEFAULT '{}',
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_portfolio_evidence_portfolio_id ON core.portfolio_evidence(portfolio_id);

-- 32. core.evaluation_rubrics
CREATE TABLE core.evaluation_rubrics (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    portfolio_id    uuid REFERENCES core.portfolios(id) ON DELETE CASCADE,
    submission_id   uuid,  -- FK added after core.challenge_submissions is created
    evaluator_id    uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    criterion       varchar(100) NOT NULL,
    score           decimal(4,2) NOT NULL,
    max_score       decimal(4,2) NOT NULL,
    feedback        text,
    created_at      timestamptz NOT NULL DEFAULT now(),

    CHECK (portfolio_id IS NOT NULL OR submission_id IS NOT NULL)
);

CREATE INDEX idx_evaluation_rubrics_portfolio_id ON core.evaluation_rubrics(portfolio_id) WHERE portfolio_id IS NOT NULL;

-- ===========================================
-- CHALLENGES / ALPHA (5 tables)
-- ===========================================

-- 33. core.methodologies
CREATE TABLE core.methodologies (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    code            varchar(20) NOT NULL,
    name            varchar(200) NOT NULL,
    description     text,
    philosophy      text,
    key_principles  jsonb,
    icon_name       varchar(30),
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(tenant_id, code)
);

CREATE INDEX idx_methodologies_tenant_id ON core.methodologies(tenant_id);

-- 34. core.competencies
CREATE TABLE core.competencies (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    methodology_id  uuid NOT NULL REFERENCES core.methodologies(id) ON DELETE CASCADE,
    name            varchar(200) NOT NULL,
    description     text,
    order_index     integer NOT NULL DEFAULT 0,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_competencies_methodology_id ON core.competencies(methodology_id);

-- 35. core.challenges
CREATE TABLE core.challenges (
    id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id           uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    code                varchar(20),
    methodology_id      uuid REFERENCES core.methodologies(id) ON DELETE SET NULL,
    competency_id       uuid REFERENCES core.competencies(id) ON DELETE SET NULL,
    title               varchar(200) NOT NULL,
    description         text,
    objectives          text,
    difficulty          integer NOT NULL DEFAULT 1 CHECK (difficulty BETWEEN 1 AND 5),
    base_points         integer NOT NULL DEFAULT 50,
    challenge_type      challenge_type NOT NULL DEFAULT 'practical',
    evaluation_criteria jsonb,
    required_resources  jsonb,
    is_active           boolean NOT NULL DEFAULT true,
    created_at          timestamptz NOT NULL DEFAULT now(),
    updated_at          timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_challenges_tenant_id ON core.challenges(tenant_id);
CREATE INDEX idx_challenges_methodology_id ON core.challenges(methodology_id) WHERE methodology_id IS NOT NULL;

-- 36. core.challenge_submissions
CREATE TABLE core.challenge_submissions (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    challenge_id    uuid NOT NULL REFERENCES core.challenges(id) ON DELETE CASCADE,
    student_id      uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    response        text,
    evidence_urls   jsonb NOT NULL DEFAULT '[]',
    file_url        text,
    status          submission_status NOT NULL DEFAULT 'submitted',
    grade           decimal(5,2),
    feedback        text,
    evaluated_by    uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    evaluated_at    timestamptz,
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now(),
    deleted_at      timestamptz
);

CREATE INDEX idx_challenge_submissions_tenant_id ON core.challenge_submissions(tenant_id);
CREATE INDEX idx_challenge_submissions_challenge_id ON core.challenge_submissions(challenge_id);
CREATE INDEX idx_challenge_submissions_student_id ON core.challenge_submissions(student_id);

-- Add deferred FK from evaluation_rubrics to challenge_submissions
ALTER TABLE core.evaluation_rubrics
    ADD CONSTRAINT fk_evaluation_rubrics_submission
    FOREIGN KEY (submission_id) REFERENCES core.challenge_submissions(id) ON DELETE CASCADE;

-- 37. core.methodology_progress
CREATE TABLE core.methodology_progress (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    methodology_id  uuid NOT NULL REFERENCES core.methodologies(id) ON DELETE CASCADE,
    level           integer NOT NULL DEFAULT 1,
    xp              integer NOT NULL DEFAULT 0,
    badges          jsonb NOT NULL DEFAULT '[]',
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now(),

    UNIQUE(user_id, methodology_id)
);

CREATE INDEX idx_methodology_progress_user_id ON core.methodology_progress(user_id);

-- ===========================================
-- COMMUNITY (3 tables)
-- ===========================================

-- 38. core.forum_topics
CREATE TABLE core.forum_topics (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    unit_id         uuid REFERENCES iam.units(id) ON DELETE SET NULL,
    author_id       uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    title           varchar(200) NOT NULL,
    content         text NOT NULL,
    category        varchar(50),
    is_pinned       boolean NOT NULL DEFAULT false,
    is_locked       boolean NOT NULL DEFAULT false,
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now(),
    deleted_at      timestamptz
);

CREATE INDEX idx_forum_topics_tenant_id ON core.forum_topics(tenant_id);
CREATE INDEX idx_forum_topics_author_id ON core.forum_topics(author_id);

-- 39. core.forum_replies
CREATE TABLE core.forum_replies (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    topic_id        uuid NOT NULL REFERENCES core.forum_topics(id) ON DELETE CASCADE,
    author_id       uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    content         text NOT NULL,
    parent_id       uuid REFERENCES core.forum_replies(id) ON DELETE CASCADE,
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now(),
    deleted_at      timestamptz
);

CREATE INDEX idx_forum_replies_topic_id ON core.forum_replies(topic_id);
CREATE INDEX idx_forum_replies_author_id ON core.forum_replies(author_id);

-- 40. core.forum_likes
CREATE TABLE core.forum_likes (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    topic_id        uuid REFERENCES core.forum_topics(id) ON DELETE CASCADE,
    reply_id        uuid REFERENCES core.forum_replies(id) ON DELETE CASCADE,
    created_at      timestamptz NOT NULL DEFAULT now(),

    CHECK (topic_id IS NOT NULL OR reply_id IS NOT NULL),
    UNIQUE(user_id, topic_id),
    UNIQUE(user_id, reply_id)
);

-- ===========================================
-- QR CODES (2 tables)
-- ===========================================

-- 41. core.qr_codes
CREATE TABLE core.qr_codes (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    reference_type  varchar(50) NOT NULL,
    reference_id    uuid NOT NULL,
    code            varchar(100) UNIQUE NOT NULL,
    metadata        jsonb NOT NULL DEFAULT '{}',
    is_active       boolean NOT NULL DEFAULT true,
    created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_qr_codes_tenant_id ON core.qr_codes(tenant_id);
CREATE INDEX idx_qr_codes_code ON core.qr_codes(code);

-- 42. core.qr_scans
CREATE TABLE core.qr_scans (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id       uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    qr_code_id      uuid NOT NULL REFERENCES core.qr_codes(id) ON DELETE CASCADE,
    user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    scanned_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_qr_scans_qr_code_id ON core.qr_scans(qr_code_id);
CREATE INDEX idx_qr_scans_user_id ON core.qr_scans(user_id);

-- ===========================================
-- SYSTEM (1 table)
-- ===========================================

-- 43. core.notifications
CREATE TABLE core.notifications (
    id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id           uuid NOT NULL REFERENCES iam.tenants(id) ON DELETE CASCADE,
    user_id             uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    title               varchar(200) NOT NULL,
    message             text,
    notification_type   varchar(50),
    reference_type      varchar(50),
    reference_id        uuid,
    is_read             boolean NOT NULL DEFAULT false,
    read_at             timestamptz,
    created_at          timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_notifications_user_id ON core.notifications(user_id);
CREATE INDEX idx_notifications_unread ON core.notifications(user_id, is_read) WHERE is_read = false;

-- =============================================
-- Explicit grants
-- =============================================
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA core TO authenticated;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA core TO authenticated;
GRANT ALL ON ALL TABLES IN SCHEMA core TO service_role;
