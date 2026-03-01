-- =============================================
-- PATCH: Atualizar navegação para português
-- Executar no Supabase SQL Editor
-- =============================================

-- 1. Atualizar labels e icon_names dos navigation_items existentes
UPDATE iam.navigation_items SET label = 'Dashboard',           href = '/dashboard',   icon_name = 'home'           WHERE slug = 'dashboard';
UPDATE iam.navigation_items SET label = 'Aulas',               href = '/lessons',     icon_name = 'book-open'      WHERE slug = 'lessons';
UPDATE iam.navigation_items SET label = 'Nova Aula',           href = '/lessons/new', icon_name = 'plus-circle'    WHERE slug = 'new-lesson';
UPDATE iam.navigation_items SET label = 'Turmas',              href = '/courses',     icon_name = 'users'          WHERE slug = 'courses';
UPDATE iam.navigation_items SET label = 'Instrumentos',        href = '/instruments', icon_name = 'music'          WHERE slug = 'instruments';
UPDATE iam.navigation_items SET label = 'Repertório',          href = '/repertoire',  icon_name = 'book-open'      WHERE slug = 'repertoire';
UPDATE iam.navigation_items SET label = 'História da Música',  href = '/history',     icon_name = 'scroll'         WHERE slug = 'history';
UPDATE iam.navigation_items SET label = 'Gamificação',         href = '/progress',    icon_name = 'trophy'         WHERE slug = 'gamification';
UPDATE iam.navigation_items SET label = 'Portfólio',           href = '/portfolio',   icon_name = 'target'         WHERE slug = 'portfolio';
UPDATE iam.navigation_items SET label = 'Meu Progresso',       href = '/progress',    icon_name = 'trophy'         WHERE slug = 'progress';
UPDATE iam.navigation_items SET label = 'Show Final',          href = '/show-final',  icon_name = 'star'           WHERE slug = 'show-final';
UPDATE iam.navigation_items SET label = 'Vídeos',              href = '/videos',      icon_name = 'video'          WHERE slug = 'videos';
UPDATE iam.navigation_items SET label = 'Desafios',            href = '/challenges',  icon_name = 'zap'            WHERE slug = 'challenges';
UPDATE iam.navigation_items SET label = 'Conquistas',          href = '/achievements', icon_name = 'award'         WHERE slug = 'achievements';
UPDATE iam.navigation_items SET label = 'Correções',           href = '/evaluate',    icon_name = 'check-circle'   WHERE slug = 'corrections';
UPDATE iam.navigation_items SET label = 'Agenda',              href = '/schedule',    icon_name = 'calendar'       WHERE slug = 'schedule';
UPDATE iam.navigation_items SET label = 'Formação Docente',    href = '/training',    icon_name = 'graduation-cap' WHERE slug = 'training';
UPDATE iam.navigation_items SET label = 'Experiências BR',     href = '/experiences', icon_name = 'map-pin'        WHERE slug = 'experiences';
UPDATE iam.navigation_items SET label = 'Referências Int.',    href = '/references',  icon_name = 'globe'          WHERE slug = 'references';
UPDATE iam.navigation_items SET label = 'Documentos',          href = '/documents',   icon_name = 'file-text'      WHERE slug = 'documents';
UPDATE iam.navigation_items SET label = 'Espaços Alt.',        href = '/spaces',      icon_name = 'building'       WHERE slug = 'spaces';
UPDATE iam.navigation_items SET label = 'Estratégias',         href = '/strategies',  icon_name = 'lightbulb'      WHERE slug = 'strategies';
UPDATE iam.navigation_items SET label = 'Comunidade',          href = '/community',   icon_name = 'message-square' WHERE slug = 'forum';
UPDATE iam.navigation_items SET label = 'Alunos',              href = '/students',    icon_name = 'users'          WHERE slug = 'manage-students';
UPDATE iam.navigation_items SET label = 'Professores',         href = '/students',    icon_name = 'graduation-cap' WHERE slug = 'manage-teachers';
UPDATE iam.navigation_items SET label = 'QR Codes',            href = '/qr/manage',   icon_name = 'qr-code'        WHERE slug = 'qr-manage';
UPDATE iam.navigation_items SET label = 'Diagnósticos',        href = '/diagnostics', icon_name = 'bar-chart'      WHERE slug = 'diagnostics';
UPDATE iam.navigation_items SET label = 'Meu Perfil',          href = '/profile',     icon_name = 'user'           WHERE slug = 'profile';
UPDATE iam.navigation_items SET label = 'Configurações',       href = '/settings',    icon_name = 'settings'       WHERE slug = 'settings';
UPDATE iam.navigation_items SET label = 'Ajuda',               href = '/help',        icon_name = 'help-circle'    WHERE slug = 'help';

-- 2. Inserir novos items de navegação
INSERT INTO iam.navigation_items (slug, label, href, icon_name, required_permission) VALUES
    ('feed',       'Feed Musical',       '/feed',     'video',        'feed.view'),
    ('practice',   'Diário de Prática',  '/practice', 'clock',        'practice.view'),
    ('evaluate',   'SpeedGrader',        '/evaluate', 'check-circle', 'challenges.evaluate'),
    ('students',   'Alunos',             '/students', 'graduation-cap', 'students.view')
ON CONFLICT (slug) DO NOTHING;

-- 3. Adicionar permissões novas (feed.view, practice.view)
INSERT INTO iam.permissions (slug, display_name, resource, action, description) VALUES
    ('feed.view',     'Ver Feed',      'feed',     'view', 'Visualizar o feed musical'),
    ('practice.view', 'Ver Prática',   'practice', 'view', 'Visualizar diário de prática')
ON CONFLICT (slug) DO NOTHING;

-- 4. Dar permissões novas para todos os roles
INSERT INTO iam.role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM iam.roles r
CROSS JOIN iam.permissions p
WHERE p.slug IN ('feed.view', 'practice.view')
ON CONFLICT (role_id, permission_id) DO NOTHING;

-- 5. Limpar role_navigation existente e recriar
DELETE FROM iam.role_navigation;

-- Student: navegação agrupada (13 items, 3 grupos)
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
JOIN iam.navigation_items ni ON ni.slug = v.nav_slug;

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
JOIN iam.navigation_items ni ON ni.slug = v.nav_slug;

-- Admin: navegação agrupada (15 items, 4 grupos)
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
JOIN iam.navigation_items ni ON ni.slug = v.nav_slug;
