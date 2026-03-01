-- =============================================
-- Nipo School - New Database Schema
-- File: 09_seed.sql
-- Description: Initial data: tenant, roles, permissions, navigation, achievements, methodologies
-- Super Admin: 7beec796-292d-49dd-8cef-38659485ea12
-- =============================================

-- =============================================
-- 1. TENANT
-- =============================================
INSERT INTO iam.tenants (id, name, slug, plan) VALUES
    ('00000000-0000-0000-0000-000000000001', 'Nipo School', 'nipo-school', 'pro')
ON CONFLICT (slug) DO NOTHING;

-- =============================================
-- 2. UNIT (main campus)
-- =============================================
INSERT INTO iam.units (id, tenant_id, name, slug) VALUES
    ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Sede Principal', 'sede-principal')
ON CONFLICT (tenant_id, slug) DO NOTHING;

-- =============================================
-- 3. ROLES (system defaults for Nipo School tenant)
-- =============================================
INSERT INTO iam.roles (id, tenant_id, slug, display_name, kanji, kanji_meaning, primary_color, secondary_color, gradient, pattern, icon_name, hierarchy_level, is_system) VALUES
    ('00000000-0000-0000-0000-000000000010', '00000000-0000-0000-0000-000000000001', 'student', 'Aluno', '生徒', 'Growth & Vitality', 'text-red-600', 'bg-red-100', 'from-red-600 to-orange-600', 'bg-pattern-asanoha', 'Flower2', 0, true),
    ('00000000-0000-0000-0000-000000000011', '00000000-0000-0000-0000-000000000001', 'teacher', 'Sensei', '先生', 'Wisdom & Serenity', 'text-blue-600', 'bg-blue-100', 'from-blue-600 to-cyan-600', 'bg-pattern-seigaiha', 'Waves', 1, true),
    ('00000000-0000-0000-0000-000000000012', '00000000-0000-0000-0000-000000000001', 'admin', 'Administrator', '管理', 'Nobility & Structure', 'text-purple-600', 'bg-purple-100', 'from-purple-600 to-indigo-600', 'bg-pattern-sayagata', 'Crown', 3, true)
ON CONFLICT (tenant_id, slug) DO NOTHING;

-- =============================================
-- 4. SUPER ADMIN PROFILE + ROLE
-- =============================================
INSERT INTO iam.profiles (user_id, tenant_id, unit_id, full_name, display_name)
VALUES (
    '7beec796-292d-49dd-8cef-38659485ea12',
    '00000000-0000-0000-0000-000000000001',
    '00000000-0000-0000-0000-000000000002',
    'Super Admin',
    'Admin'
)
ON CONFLICT (user_id, tenant_id) DO NOTHING;

INSERT INTO iam.user_roles (user_id, tenant_id, role_id)
VALUES (
    '7beec796-292d-49dd-8cef-38659485ea12',
    '00000000-0000-0000-0000-000000000001',
    '00000000-0000-0000-0000-000000000012'  -- admin role
)
ON CONFLICT (user_id, tenant_id, role_id) DO NOTHING;

-- Create initial user_progress for super admin
INSERT INTO core.user_progress (tenant_id, user_id)
VALUES ('00000000-0000-0000-0000-000000000001', '7beec796-292d-49dd-8cef-38659485ea12')
ON CONFLICT (tenant_id, user_id) DO NOTHING;

-- =============================================
-- 5. PERMISSIONS (~50)
-- =============================================
INSERT INTO iam.permissions (slug, display_name, resource, action) VALUES
    ('dashboard.view',             'View dashboard',              'dashboard',           'view'),
    ('lessons.view',               'View lessons',                'lessons',             'view'),
    ('lessons.create',             'Create lessons',              'lessons',             'create'),
    ('lessons.edit',               'Edit lessons',                'lessons',             'edit'),
    ('lessons.delete',             'Delete lessons',              'lessons',             'delete'),
    ('courses.view',               'View courses',                'courses',             'view'),
    ('courses.view_all',           'View all courses',            'courses',             'view_all'),
    ('courses.create',             'Create courses',              'courses',             'create'),
    ('courses.edit',               'Edit courses',                'courses',             'edit'),
    ('instruments.view',           'View instruments',            'instruments',         'view'),
    ('instruments.create',         'Create instruments',          'instruments',         'create'),
    ('instruments.edit',           'Edit instruments',            'instruments',         'edit'),
    ('repertoire.view',            'View repertoire',             'repertoire',          'view'),
    ('repertoire.create',          'Create repertoire',           'repertoire',          'create'),
    ('repertoire.edit',            'Edit repertoire',             'repertoire',          'edit'),
    ('history.view',               'View music history',          'history',             'view'),
    ('history.create',             'Create history periods',      'history',             'create'),
    ('history.edit',               'Edit history periods',        'history',             'edit'),
    ('gamification.view',          'View gamification',           'gamification',        'view'),
    ('gamification.manage',        'Manage gamification',         'gamification',        'manage'),
    ('portfolios.view',            'View portfolios',             'portfolios',          'view'),
    ('portfolios.submit',          'Submit portfolio',            'portfolios',          'submit'),
    ('portfolios.grade',           'Grade portfolios',            'portfolios',          'grade'),
    ('challenges.view',            'View challenges',             'challenges',          'view'),
    ('challenges.participate',     'Participate in challenges',   'challenges',          'participate'),
    ('challenges.grade',           'Grade challenges',            'challenges',          'grade'),
    ('achievements.view',          'View achievements',           'achievements',        'view'),
    ('show_final.view',            'View final show',             'show_final',          'view'),
    ('videos.view',                'View videos',                 'videos',              'view'),
    ('progress.view',              'View progress',               'progress',            'view'),
    ('corrections.view',           'View corrections',            'corrections',         'view'),
    ('corrections.grade',          'Grade corrections',           'corrections',         'grade'),
    ('schedule.view',              'View schedule',               'schedule',            'view'),
    ('training.view',              'View teacher training',       'training',            'view'),
    ('experiences.view',           'View experiences',            'experiences',         'view'),
    ('references.view',            'View references',             'references',          'view'),
    ('documents.view',             'View documents',              'documents',           'view'),
    ('spaces.view',                'View alternative spaces',     'spaces',              'view'),
    ('strategies.view',            'View strategies',             'strategies',          'view'),
    ('forum.view',                 'View forum',                  'forum',               'view'),
    ('profile.view',               'View profile',                'profile',             'view'),
    ('profile.edit',               'Edit profile',                'profile',             'edit'),
    ('settings.view',              'View settings',               'settings',            'view'),
    ('help.view',                  'View help',                   'help',                'view'),
    ('students.manage',            'Manage students',             'students',            'manage'),
    ('teachers.manage',            'Manage teachers',             'teachers',            'manage'),
    ('qr.manage',                  'Manage QR codes',             'qr',                  'manage'),
    ('diagnostics.view',           'View diagnostics',            'diagnostics',         'view'),
    ('database.view',              'View database',               'database',            'view'),
    ('enrollments.manage',         'Manage enrollments',          'enrollments',         'manage'),
    ('attendance.manage',          'Manage attendance',            'attendance',          'manage')
ON CONFLICT (slug) DO NOTHING;

-- =============================================
-- 6. ROLE-PERMISSIONS
-- =============================================

-- Admin: ALL permissions
INSERT INTO iam.role_permissions (role_id, permission_id)
SELECT '00000000-0000-0000-0000-000000000012', p.id
FROM iam.permissions p
ON CONFLICT (role_id, permission_id) DO NOTHING;

-- Teacher: 38 permissions
INSERT INTO iam.role_permissions (role_id, permission_id)
SELECT '00000000-0000-0000-0000-000000000011', p.id
FROM iam.permissions p
WHERE p.slug IN (
    'dashboard.view',
    'lessons.view', 'lessons.create', 'lessons.edit',
    'courses.view',
    'instruments.view',
    'repertoire.view', 'repertoire.create', 'repertoire.edit',
    'history.view', 'history.create', 'history.edit',
    'gamification.view', 'gamification.manage',
    'portfolios.view', 'portfolios.grade',
    'challenges.view', 'challenges.grade',
    'achievements.view', 'show_final.view', 'videos.view', 'progress.view',
    'corrections.view', 'corrections.grade',
    'schedule.view', 'training.view', 'experiences.view', 'references.view',
    'documents.view', 'spaces.view', 'strategies.view', 'forum.view',
    'profile.view', 'profile.edit', 'settings.view', 'help.view',
    'enrollments.manage', 'attendance.manage'
)
ON CONFLICT (role_id, permission_id) DO NOTHING;

-- Student: 20 permissions
INSERT INTO iam.role_permissions (role_id, permission_id)
SELECT '00000000-0000-0000-0000-000000000010', p.id
FROM iam.permissions p
WHERE p.slug IN (
    'dashboard.view',
    'lessons.view',
    'instruments.view',
    'repertoire.view',
    'history.view',
    'gamification.view',
    'portfolios.view', 'portfolios.submit',
    'challenges.view', 'challenges.participate',
    'achievements.view', 'show_final.view', 'videos.view', 'progress.view',
    'profile.view', 'profile.edit', 'settings.view', 'help.view',
    'courses.view', 'forum.view'
)
ON CONFLICT (role_id, permission_id) DO NOTHING;

-- =============================================
-- 7. NAVIGATION ITEMS (34 items)
-- =============================================
INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission) VALUES
    ('dashboard',           'Dashboard',              '/dashboard',       'home',           'dashboard.view'),
    ('lessons',             'Aulas',                  '/lessons',         'book-open',      'lessons.view'),
    ('new-lesson',          'Nova Aula',              '/lessons/new',     'plus-circle',    'lessons.create'),
    ('courses',             'Turmas',                 '/courses',         'users',          'courses.view'),
    ('instruments',         'Instrumentos',           '/instruments',     'music',          'instruments.view'),
    ('repertoire',          'Repertório',             '/repertoire',      'book-open',      'repertoire.view'),
    ('history',             'História da Música',     '/history',         'scroll',         'history.view'),
    ('gamification',        'Gamificação',            '/progress',        'trophy',         'gamification.view'),
    ('portfolio',           'Portfólio',              '/portfolio',       'target',         'portfolios.view'),
    ('progress',            'Meu Progresso',          '/progress',        'trophy',         'progress.view'),
    ('show-final',          'Show Final',             '/show-final',      'star',           'show_final.view'),
    ('videos',              'Vídeos',                 '/videos',          'video',          'videos.view'),
    ('challenges',          'Desafios',               '/challenges',      'zap',            'challenges.view'),
    ('achievements',        'Conquistas',             '/achievements',    'award',          'achievements.view'),
    ('corrections',         'Correções',              '/evaluate',        'check-circle',   'corrections.view'),
    ('schedule',            'Agenda',                 '/schedule',        'calendar',       'schedule.view'),
    ('training',            'Formação Docente',       '/training',        'graduation-cap', 'training.view'),
    ('experiences',         'Experiências BR',        '/experiences',     'map-pin',        'experiences.view'),
    ('references',          'Referências Int.',       '/references',      'globe',          'references.view'),
    ('documents',           'Documentos',             '/documents',       'file-text',      'documents.view'),
    ('spaces',              'Espaços Alt.',           '/spaces',          'building',       'spaces.view'),
    ('strategies',          'Estratégias',            '/strategies',      'lightbulb',      'strategies.view'),
    ('forum',               'Comunidade',             '/community',       'message-square', 'forum.view'),
    ('manage-students',     'Alunos',                 '/students',        'users',          'students.manage'),
    ('manage-teachers',     'Professores',            '/teachers',        'graduation-cap', 'teachers.manage'),
    ('qr-manage',           'QR Codes',               '/qr/manage',      'qr-code',        'qr.manage'),
    ('diagnostics',         'Diagnósticos',           '/diagnostics',     'bar-chart',      'diagnostics.view'),
    ('profile',             'Meu Perfil',             '/profile',         'user',           'profile.view'),
    ('settings',            'Configurações',          '/settings',        'settings',       'settings.view'),
    ('help',                'Ajuda',                  '/help',            'help-circle',    'help.view'),
    ('feed',                'Feed Musical',           '/feed',            'video',          'feed.view'),
    ('practice',            'Diário de Prática',      '/practice',        'clock',          'practice.view'),
    ('evaluate',            'SpeedGrader',            '/evaluate',        'check-circle',   'challenges.evaluate'),
    ('students',            'Alunos',                 '/students',        'graduation-cap', 'students.view')
ON CONFLICT (slug) DO NOTHING;

-- =============================================
-- 8. ROLE-NAVIGATION
-- =============================================

-- Student: navegação agrupada (16 items, 3 grupos)
INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000010', ni.id, v.label_override, v.group_name, v.group_order, v.item_order
FROM (VALUES
    ('dashboard',     NULL::varchar,       NULL::varchar,       0, 0),
    ('feed',          NULL,                NULL,                0, 1),
    ('challenges',    NULL,                NULL,                0, 2),
    ('practice',      NULL,                NULL,                0, 3),
    ('lessons',       'Minhas Aulas'::varchar, 'Aprender'::varchar, 1, 0),
    ('instruments',   NULL,                'Aprender',          1, 1),
    ('history',       'História'::varchar, 'Aprender',          1, 2),
    ('repertoire',    NULL,                'Aprender',          1, 3),
    ('portfolio',     NULL,                'Aprender',          1, 4),
    ('progress',      NULL,                'Conquistas'::varchar, 2, 0),
    ('achievements',  NULL,                'Conquistas',        2, 1),
    ('forum',         NULL,                'Conquistas',        2, 2),
    ('profile',       NULL,                'Conquistas',        2, 3)
) AS v(nav_slug, label_override, group_name, group_order, item_order)
JOIN iam.navigation_items ni ON ni.slug = v.nav_slug
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

-- Teacher: navegação agrupada (20 items, 5 grupos)
INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000011', ni.id, v.label_override, v.group_name, v.group_order, v.item_order
FROM (VALUES
    ('dashboard',    'Início'::varchar,        'Ensino'::varchar,     0, 0),
    ('schedule',     NULL,                     'Ensino',              0, 1),
    ('courses',      'Minhas Turmas'::varchar, 'Ensino',              0, 2),
    ('new-lesson',   NULL,                     'Ensino',              0, 3),
    ('evaluate',     NULL,                     'Ensino',              0, 4),
    ('feed',         NULL,                     'Ensino',              0, 5),
    ('training',     NULL,                     'Formação'::varchar,   1, 0),
    ('experiences',  NULL,                     'Formação',            1, 1),
    ('references',   NULL,                     'Formação',            1, 2),
    ('repertoire',   NULL,                     'Conteúdo'::varchar,   2, 0),
    ('instruments',  NULL,                     'Conteúdo',            2, 1),
    ('history',      NULL,                     'Conteúdo',            2, 2),
    ('documents',    NULL,                     'Conteúdo',            2, 3),
    ('spaces',       NULL,                     'Conteúdo',            2, 4),
    ('gamification', NULL,                     'Engajamento'::varchar, 3, 0),
    ('strategies',   NULL,                     'Engajamento',         3, 1),
    ('forum',        NULL,                     'Engajamento',         3, 2),
    ('show-final',   NULL,                     'Engajamento',         3, 3),
    ('settings',     NULL,                     'Sistema'::varchar,    4, 0),
    ('help',         NULL,                     'Sistema',             4, 1)
) AS v(nav_slug, label_override, group_name, group_order, item_order)
JOIN iam.navigation_items ni ON ni.slug = v.nav_slug
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

-- Admin: navegação agrupada (16 items, 4 grupos)
INSERT INTO iam.role_navigation (role_id, navigation_item_id, label_override, group_name, group_order, item_order)
SELECT '00000000-0000-0000-0000-000000000012', ni.id, v.label_override, v.group_name, v.group_order, v.item_order
FROM (VALUES
    ('dashboard',        NULL::varchar,                  'Gestão Escolar'::varchar,     0, 0),
    ('manage-students',  NULL,                           'Gestão Escolar',              0, 1),
    ('manage-teachers',  NULL,                           'Gestão Escolar',              0, 2),
    ('courses',          'Turmas e Matrículas'::varchar, 'Gestão Escolar',              0, 3),
    ('evaluate',         NULL,                           'Gestão Escolar',              0, 4),
    ('lessons',          NULL,                           'Acadêmico'::varchar,          1, 0),
    ('instruments',      NULL,                           'Acadêmico',                   1, 1),
    ('repertoire',       NULL,                           'Acadêmico',                   1, 2),
    ('history',          NULL,                           'Acadêmico',                   1, 3),
    ('feed',             NULL,                           'Engajamento'::varchar,        2, 0),
    ('gamification',     'Gamificação e XP'::varchar,    'Engajamento',                 2, 1),
    ('qr-manage',        NULL,                           'Sistema'::varchar,            3, 0),
    ('diagnostics',      NULL,                           'Sistema',                     3, 1),
    ('settings',         NULL,                           'Sistema',                     3, 2),
    ('help',             NULL,                           'Sistema',                     3, 3)
) AS v(nav_slug, label_override, group_name, group_order, item_order)
JOIN iam.navigation_items ni ON ni.slug = v.nav_slug
ON CONFLICT (role_id, navigation_item_id) DO NOTHING;

-- =============================================
-- 9. ACHIEVEMENTS (24)
-- =============================================
INSERT INTO core.achievements (tenant_id, name, description, badge_icon, badge_color, points_reward, category, requirement_type, requirement_value) VALUES
    -- Progresso
    ('00000000-0000-0000-0000-000000000001', 'Primeiro Passo',           'Completou sua primeira aula',                'footprints',     '#9CA3AF', 50,  'progress',    'lessons_completed', 1),
    ('00000000-0000-0000-0000-000000000001', 'Começando a Jornada',      'Completou 5 aulas',                          'rocket',         '#84CC16', 100, 'progress',    'lessons_completed', 5),
    ('00000000-0000-0000-0000-000000000001', 'Aluno Dedicado',           'Completou 10 aulas',                         'book-open',      '#22D3EE', 150, 'progress',    'lessons_completed', 10),
    ('00000000-0000-0000-0000-000000000001', 'Buscador de Conhecimento', 'Completou 25 aulas',                         'graduation-cap', '#A78BFA', 200, 'progress',    'lessons_completed', 25),
    ('00000000-0000-0000-0000-000000000001', 'Mestre da Música',         'Completou todas as 30 aulas',                'crown',          '#F59E0B', 500, 'progress',    'lessons_completed', 30),
    -- Consistência
    ('00000000-0000-0000-0000-000000000001', 'Fogo Sagrado',             'Manteve sequência de 3 dias',                'flame',          '#EF4444', 75,  'consistency', 'streak', 3),
    ('00000000-0000-0000-0000-000000000001', 'Disciplina',               'Manteve sequência de 7 dias',                'calendar-check', '#F97316', 150, 'consistency', 'streak', 7),
    ('00000000-0000-0000-0000-000000000001', 'Vontade de Ferro',         'Manteve sequência de 30 dias',               'shield',         '#DC2626', 500, 'consistency', 'streak', 30),
    -- Marcos
    ('00000000-0000-0000-0000-000000000001', 'Centenário',               'Alcançou 100 pontos no total',               'star',           '#84CC16', 50,  'milestone',   'total_points', 100),
    ('00000000-0000-0000-0000-000000000001', 'Meio Milhar',              'Alcançou 500 pontos no total',               'trophy',         '#22D3EE', 100, 'milestone',   'total_points', 500),
    ('00000000-0000-0000-0000-000000000001', 'Milenário',                'Alcançou 1000 pontos no total',              'gem',            '#A78BFA', 200, 'milestone',   'total_points', 1000),
    ('00000000-0000-0000-0000-000000000001', 'Grande Total',             'Alcançou 5000 pontos no total',              'diamond',        '#F59E0B', 500, 'milestone',   'total_points', 5000),
    -- Nível
    ('00000000-0000-0000-0000-000000000001', 'Aprendiz',                 'Alcançou o nível 2',                         'arrow-up',       '#84CC16', 50,  'milestone',   'level', 2),
    ('00000000-0000-0000-0000-000000000001', 'Praticante',               'Alcançou o nível 3',                         'trending-up',    '#22D3EE', 75,  'milestone',   'level', 3),
    ('00000000-0000-0000-0000-000000000001', 'Experiente',               'Alcançou o nível 4',                         'award',          '#A78BFA', 100, 'milestone',   'level', 4),
    ('00000000-0000-0000-0000-000000000001', 'Mestre',                   'Alcançou o nível 5',                         'medal',          '#F59E0B', 200, 'milestone',   'level', 5),
    ('00000000-0000-0000-0000-000000000001', 'Grão-Mestre',              'Alcançou o nível 6',                         'shield-check',   '#EF4444', 300, 'milestone',   'level', 6),
    ('00000000-0000-0000-0000-000000000001', 'Lenda',                    'Alcançou o nível 7',                         'sparkles',       '#EC4899', 500, 'milestone',   'level', 7),
    -- Especial
    ('00000000-0000-0000-0000-000000000001', 'Primeiro Portfólio',       'Enviou seu primeiro trabalho ao portfólio',  'briefcase',      '#84CC16', 100, 'special',     'lessons_completed', 1),
    ('00000000-0000-0000-0000-000000000001', 'Colecionador',             'Desbloqueou 5 conquistas',                   'package',        '#22D3EE', 100, 'special',     'achievements_unlocked', 5),
    ('00000000-0000-0000-0000-000000000001', 'Caçador de Conquistas',    'Desbloqueou 10 conquistas',                  'target',         '#A78BFA', 200, 'special',     'achievements_unlocked', 10),
    ('00000000-0000-0000-0000-000000000001', 'Completista',              'Desbloqueou 20 conquistas',                  'check-circle',   '#F59E0B', 500, 'special',     'achievements_unlocked', 20),
    ('00000000-0000-0000-0000-000000000001', 'Explorador',               'Experimentou todas as categorias de instrumentos', 'compass',   '#6366F1', 150, 'special',     'lessons_completed', 1),
    ('00000000-0000-0000-0000-000000000001', 'Membro da Comunidade',     'Fez sua primeira publicação no fórum',       'message-circle', '#14B8A6', 50,  'special',     'lessons_completed', 1)
ON CONFLICT DO NOTHING;

-- =============================================
-- 10. METHODOLOGIES (9) — IDs must match migrations 016/017
-- =============================================
INSERT INTO core.methodologies (id, tenant_id, code, name, description, philosophy, icon_name) VALUES
    ('d64dac55-ed34-4f4d-93c7-d6fca955eff5', '00000000-0000-0000-0000-000000000001', 'ORFF',      'Orff-Schulwerk',        'Elementary music education through body, voice, and movement', 'Learning through play and improvisation', 'Music'),
    ('68632b58-86b0-44e7-becc-69099e78764d', '00000000-0000-0000-0000-000000000001', 'FUTURES',   'Musical Futures',       'Student-chosen repertoire and band-style collaborative learning', 'Student agency and real-world music making', 'Users'),
    ('8622a0d3-c389-47bf-a3a9-843bfcc293a2', '00000000-0000-0000-0000-000000000001', 'SUZUKI',    'Suzuki Method',         'Gradual progression with emphasis on listening and family involvement', 'Every child can learn through immersion', 'Heart'),
    ('a5a5b85d-bace-4415-90bb-01c80cb1564c', '00000000-0000-0000-0000-000000000001', 'KODALY',    'Kodaly Method',         'Vocal emphasis, music literacy through folk music traditions', 'Singing is the foundation of musicianship', 'Mic'),
    ('eaf8c6d8-d709-4b2a-8b6e-8ecdbbc772b0', '00000000-0000-0000-0000-000000000001', 'GORDON',    'Gordon Learning',       'Audiation-based sequence: listening, speaking, reading, creating', 'Understanding before performance', 'Ear'),
    ('a8a09c03-0771-4b2a-911b-8a357f312b63', '00000000-0000-0000-0000-000000000001', 'WILLEMS',   'Willems Method',        'Hearing, rhythm, and movement as foundations of musical expression', 'Deep listening leads to deep musicality', 'Headphones'),
    ('28ff3697-1df2-48a6-a961-2f10054a3720', '00000000-0000-0000-0000-000000000001', 'ALPHA',     'Alpha Principles',      'Weekly challenges integrating digital tools and pedagogical innovation', 'Progressive mastery through structured challenges', 'Zap'),
    ('5122d3b5-3f1e-4cb0-bc9b-ff6e140a51a2', '00000000-0000-0000-0000-000000000001', 'BERKLEE',   'Berklee/International', 'Advanced techniques, production, and contemporary music practices', 'Professional-grade music education', 'Globe'),
    ('99551ce6-bdc4-4cd2-b72f-728cc09f36ae', '00000000-0000-0000-0000-000000000001', 'DALCROZE',  'Dalcroze Eurythmics',   'Movement-based approach connecting body, mind, and music through rhythm', 'The body is the first instrument', 'Activity')
ON CONFLICT DO NOTHING;

-- =============================================
-- Notify PostgREST to reload schema cache
-- =============================================
NOTIFY pgrst, 'reload schema';
