-- ========================================================================
-- 📊 ANÁLISE DE DADOS E POPULAÇÃO DAS TABELAS
-- ========================================================================
-- Data: 2025-12-15
-- Objetivo: Verificar quais tabelas têm dados, quais estão vazias e padrões
-- ========================================================================

-- ========================================================================
-- 1️⃣ CONTAGEM DE REGISTROS POR TABELA
-- ========================================================================

-- 1.1 Gerar query dinâmica para contar todas as tabelas
SELECT 
    'SELECT ''' || table_name || ''' as tabela, COUNT(*) as total_registros FROM ' || table_name || ' UNION ALL'
FROM information_schema.tables
WHERE table_schema = 'public'
    AND table_type = 'BASE TABLE'
ORDER BY table_name;


| ?column?                                                                                                                       |
| ------------------------------------------------------------------------------------------------------------------------------ |
| SELECT 'achievements' as tabela, COUNT(*) as total_registros FROM achievements UNION ALL                                       |
| SELECT 'achievements_educacionais' as tabela, COUNT(*) as total_registros FROM achievements_educacionais UNION ALL             |
| SELECT 'achievements_progress' as tabela, COUNT(*) as total_registros FROM achievements_progress UNION ALL                     |
| SELECT 'adaptacoes_espacos_alternativos' as tabela, COUNT(*) as total_registros FROM adaptacoes_espacos_alternativos UNION ALL |
| SELECT 'admins' as tabela, COUNT(*) as total_registros FROM admins UNION ALL                                                   |
| SELECT 'alpha_aluno_badges' as tabela, COUNT(*) as total_registros FROM alpha_aluno_badges UNION ALL                           |
| SELECT 'alpha_aluno_desafios' as tabela, COUNT(*) as total_registros FROM alpha_aluno_desafios UNION ALL                       |
| SELECT 'alpha_aula_progresso' as tabela, COUNT(*) as total_registros FROM alpha_aula_progresso UNION ALL                       |
| SELECT 'alpha_badges' as tabela, COUNT(*) as total_registros FROM alpha_badges UNION ALL                                       |
| SELECT 'alpha_celebracoes' as tabela, COUNT(*) as total_registros FROM alpha_celebracoes UNION ALL                             |
| SELECT 'alpha_competencias' as tabela, COUNT(*) as total_registros FROM alpha_competencias UNION ALL                           |
| SELECT 'alpha_desafios' as tabela, COUNT(*) as total_registros FROM alpha_desafios UNION ALL                                   |
| SELECT 'alpha_estudante_badges' as tabela, COUNT(*) as total_registros FROM alpha_estudante_badges UNION ALL                   |
| SELECT 'alpha_mentorias' as tabela, COUNT(*) as total_registros FROM alpha_mentorias UNION ALL                                 |
| SELECT 'alpha_metodologias' as tabela, COUNT(*) as total_registros FROM alpha_metodologias UNION ALL                           |
| SELECT 'alpha_niveis' as tabela, COUNT(*) as total_registros FROM alpha_niveis UNION ALL                                       |
| SELECT 'alpha_progresso' as tabela, COUNT(*) as total_registros FROM alpha_progresso UNION ALL                                 |
| SELECT 'alpha_progresso_estudante' as tabela, COUNT(*) as total_registros FROM alpha_progresso_estudante UNION ALL             |
| SELECT 'alpha_projetos_coletivos' as tabela, COUNT(*) as total_registros FROM alpha_projetos_coletivos UNION ALL               |
| SELECT 'alpha_ranking' as tabela, COUNT(*) as total_registros FROM alpha_ranking UNION ALL                                     |
| SELECT 'alpha_submissoes' as tabela, COUNT(*) as total_registros FROM alpha_submissoes UNION ALL                               |
| SELECT 'alpha_xp_historico' as tabela, COUNT(*) as total_registros FROM alpha_xp_historico UNION ALL                           |
| SELECT 'alunos' as tabela, COUNT(*) as total_registros FROM alunos UNION ALL                                                   |
| SELECT 'audit_activities' as tabela, COUNT(*) as total_registros FROM audit_activities UNION ALL                               |
| SELECT 'aula_atividades' as tabela, COUNT(*) as total_registros FROM aula_atividades UNION ALL                                 |
| SELECT 'aula_avaliacoes' as tabela, COUNT(*) as total_registros FROM aula_avaliacoes UNION ALL                                 |
| SELECT 'aula_checklist' as tabela, COUNT(*) as total_registros FROM aula_checklist UNION ALL                                   |
| SELECT 'aula_criterios_avaliacao' as tabela, COUNT(*) as total_registros FROM aula_criterios_avaliacao UNION ALL               |
| SELECT 'aula_desafio_alpha' as tabela, COUNT(*) as total_registros FROM aula_desafio_alpha UNION ALL                           |
| SELECT 'aula_desafios' as tabela, COUNT(*) as total_registros FROM aula_desafios UNION ALL                                     |
| SELECT 'aula_feedback' as tabela, COUNT(*) as total_registros FROM aula_feedback UNION ALL                                     |
| SELECT 'aula_feedbacks' as tabela, COUNT(*) as total_registros FROM aula_feedbacks UNION ALL                                   |
| SELECT 'aula_materiais' as tabela, COUNT(*) as total_registros FROM aula_materiais UNION ALL                                   |
| SELECT 'aula_permissoes' as tabela, COUNT(*) as total_registros FROM aula_permissoes UNION ALL                                 |
| SELECT 'aula_presencas' as tabela, COUNT(*) as total_registros FROM aula_presencas UNION ALL                                   |
| SELECT 'aula_registros' as tabela, COUNT(*) as total_registros FROM aula_registros UNION ALL                                   |
| SELECT 'aula_status_log' as tabela, COUNT(*) as total_registros FROM aula_status_log UNION ALL                                 |
| SELECT 'aula_tags' as tabela, COUNT(*) as total_registros FROM aula_tags UNION ALL                                             |
| SELECT 'aulas' as tabela, COUNT(*) as total_registros FROM aulas UNION ALL                                                     |
| SELECT 'autoavaliacoes' as tabela, COUNT(*) as total_registros FROM autoavaliacoes UNION ALL                                   |
| SELECT 'avaliacoes_rubricas' as tabela, COUNT(*) as total_registros FROM avaliacoes_rubricas UNION ALL                         |
| SELECT 'capacitacao_docente' as tabela, COUNT(*) as total_registros FROM capacitacao_docente UNION ALL                         |
| SELECT 'cessoes_instrumentos' as tabela, COUNT(*) as total_registros FROM cessoes_instrumentos UNION ALL                       |
| SELECT 'comunicacao_engajamento' as tabela, COUNT(*) as total_registros FROM comunicacao_engajamento UNION ALL                 |
| SELECT 'desafios_alpha' as tabela, COUNT(*) as total_registros FROM desafios_alpha UNION ALL                                   |
| SELECT 'desafios_alpha_respostas' as tabela, COUNT(*) as total_registros FROM desafios_alpha_respostas UNION ALL               |
| SELECT 'devotional_content' as tabela, COUNT(*) as total_registros FROM devotional_content UNION ALL                           |
| SELECT 'documentos_institucionais' as tabela, COUNT(*) as total_registros FROM documentos_institucionais UNION ALL             |
| SELECT 'experiencias_brasileiras' as tabela, COUNT(*) as total_registros FROM experiencias_brasileiras UNION ALL               |
| SELECT 'feedback_pares' as tabela, COUNT(*) as total_registros FROM feedback_pares UNION ALL                                   |
| SELECT 'forum_likes' as tabela, COUNT(*) as total_registros FROM forum_likes UNION ALL                                         |
| SELECT 'forum_perguntas' as tabela, COUNT(*) as total_registros FROM forum_perguntas UNION ALL                                 |
| SELECT 'forum_respostas' as tabela, COUNT(*) as total_registros FROM forum_respostas UNION ALL                                 |
| SELECT 'historia_compositores' as tabela, COUNT(*) as total_registros FROM historia_compositores UNION ALL                     |
| SELECT 'historia_conceitos_teoricos' as tabela, COUNT(*) as total_registros FROM historia_conceitos_teoricos UNION ALL         |
| SELECT 'historia_contexto_cultural' as tabela, COUNT(*) as total_registros FROM historia_contexto_cultural UNION ALL           |
| SELECT 'historia_eventos_timeline' as tabela, COUNT(*) as total_registros FROM historia_eventos_timeline UNION ALL             |
| SELECT 'historia_generos' as tabela, COUNT(*) as total_registros FROM historia_generos UNION ALL                               |
| SELECT 'historia_instrumentos_evolucao' as tabela, COUNT(*) as total_registros FROM historia_instrumentos_evolucao UNION ALL   |
| SELECT 'historia_movimentos' as tabela, COUNT(*) as total_registros FROM historia_movimentos UNION ALL                         |
| SELECT 'historia_movimentos_artisticos' as tabela, COUNT(*) as total_registros FROM historia_movimentos_artisticos UNION ALL   |
| SELECT 'historia_obras' as tabela, COUNT(*) as total_registros FROM historia_obras UNION ALL                                   |
| SELECT 'historia_periodos' as tabela, COUNT(*) as total_registros FROM historia_periodos UNION ALL                             |
| SELECT 'historia_playlists' as tabela, COUNT(*) as total_registros FROM historia_playlists UNION ALL                           |
| SELECT 'historia_progresso_usuario' as tabela, COUNT(*) as total_registros FROM historia_progresso_usuario UNION ALL           |
| SELECT 'historia_quiz' as tabela, COUNT(*) as total_registros FROM historia_quiz UNION ALL                                     |
| SELECT 'historia_quiz_respostas' as tabela, COUNT(*) as total_registros FROM historia_quiz_respostas UNION ALL                 |
| SELECT 'historia_timeline' as tabela, COUNT(*) as total_registros FROM historia_timeline UNION ALL                             |
| SELECT 'historico_instrumentos' as tabela, COUNT(*) as total_registros FROM historico_instrumentos UNION ALL                   |
| SELECT 'hook_cache' as tabela, COUNT(*) as total_registros FROM hook_cache UNION ALL                                           |
| SELECT 'indicadores_impacto' as tabela, COUNT(*) as total_registros FROM indicadores_impacto UNION ALL                         |
| SELECT 'instrumento_curiosidades' as tabela, COUNT(*) as total_registros FROM instrumento_curiosidades UNION ALL               |
| SELECT 'instrumento_midias' as tabela, COUNT(*) as total_registros FROM instrumento_midias UNION ALL                           |
| SELECT 'instrumento_performances' as tabela, COUNT(*) as total_registros FROM instrumento_performances UNION ALL               |
| SELECT 'instrumento_quiz' as tabela, COUNT(*) as total_registros FROM instrumento_quiz UNION ALL                               |
| SELECT 'instrumento_sons' as tabela, COUNT(*) as total_registros FROM instrumento_sons UNION ALL                               |
| SELECT 'instrumento_sons_variacoes' as tabela, COUNT(*) as total_registros FROM instrumento_sons_variacoes UNION ALL           |
| SELECT 'instrumento_tecnicas' as tabela, COUNT(*) as total_registros FROM instrumento_tecnicas UNION ALL                       |
| SELECT 'instrumentos' as tabela, COUNT(*) as total_registros FROM instrumentos UNION ALL                                       |
| SELECT 'instrumentos_alunos' as tabela, COUNT(*) as total_registros FROM instrumentos_alunos UNION ALL                         |
| SELECT 'instrumentos_fisicos' as tabela, COUNT(*) as total_registros FROM instrumentos_fisicos UNION ALL                       |
| SELECT 'instrumentos_relacionados' as tabela, COUNT(*) as total_registros FROM instrumentos_relacionados UNION ALL             |
| SELECT 'lessons' as tabela, COUNT(*) as total_registros FROM lessons UNION ALL                                                 |
| SELECT 'logos' as tabela, COUNT(*) as total_registros FROM logos UNION ALL                                                     |
| SELECT 'manutencoes_instrumentos' as tabela, COUNT(*) as total_registros FROM manutencoes_instrumentos UNION ALL               |
| SELECT 'materiais_apoio' as tabela, COUNT(*) as total_registros FROM materiais_apoio UNION ALL                                 |
| SELECT 'matriculas' as tabela, COUNT(*) as total_registros FROM matriculas UNION ALL                                           |
| SELECT 'metodologias_ensino' as tabela, COUNT(*) as total_registros FROM metodologias_ensino UNION ALL                         |
| SELECT 'migration_log' as tabela, COUNT(*) as total_registros FROM migration_log UNION ALL                                     |
| SELECT 'modules' as tabela, COUNT(*) as total_registros FROM modules UNION ALL                                                 |
| SELECT 'modulos' as tabela, COUNT(*) as total_registros FROM modulos UNION ALL                                                 |
| SELECT 'permission_templates' as tabela, COUNT(*) as total_registros FROM permission_templates UNION ALL                       |
| SELECT 'permissions' as tabela, COUNT(*) as total_registros FROM permissions UNION ALL                                         |
| SELECT 'portfolio_evidencias' as tabela, COUNT(*) as total_registros FROM portfolio_evidencias UNION ALL                       |
| SELECT 'portfolios' as tabela, COUNT(*) as total_registros FROM portfolios UNION ALL                                           |
| SELECT 'presencas' as tabela, COUNT(*) as total_registros FROM presencas UNION ALL                                             |
| SELECT 'professor_instrumentos' as tabela, COUNT(*) as total_registros FROM professor_instrumentos UNION ALL                   |
| SELECT 'professores' as tabela, COUNT(*) as total_registros FROM professores UNION ALL                                         |
| SELECT 'professores_categorias' as tabela, COUNT(*) as total_registros FROM professores_categorias UNION ALL                   |
| SELECT 'professores_conteudos' as tabela, COUNT(*) as total_registros FROM professores_conteudos UNION ALL                     |



-- 1.2 Executar manualmente (copiar resultado do 1.1 e executar)
-- Exemplo de resultado esperado:
-- SELECT 'achievements' as tabela, COUNT(*) as total_registros FROM achievements UNION ALL
-- SELECT 'alunos' as tabela, COUNT(*) as total_registros FROM alunos UNION ALL
-- ... (continuar para todas as tabelas)

-- ========================================================================
-- 2️⃣ TABELAS VAZIAS VS POPULADAS
-- ========================================================================

-- 2.1 Identificar tabelas vazias (usar após executar contagem)
-- Esta query precisa ser executada após ter os resultados da contagem

-- 2.2 Verificação sample de cada tabela (primeiros 3 registros)
-- Gerar queries para inspecionar dados
SELECT 
    'SELECT * FROM ' || table_name || ' LIMIT 3; -- 📋 ' || table_name
FROM information_schema.tables
WHERE table_schema = 'public'
    AND table_type = 'BASE TABLE'
ORDER BY table_name;

| ?column?                                                                                     |
| -------------------------------------------------------------------------------------------- |
| SELECT * FROM achievements LIMIT 3; -- 📋 achievements                                       |
| SELECT * FROM achievements_educacionais LIMIT 3; -- 📋 achievements_educacionais             |
| SELECT * FROM achievements_progress LIMIT 3; -- 📋 achievements_progress                     |
| SELECT * FROM adaptacoes_espacos_alternativos LIMIT 3; -- 📋 adaptacoes_espacos_alternativos |
| SELECT * FROM admins LIMIT 3; -- 📋 admins                                                   |
| SELECT * FROM alpha_aluno_badges LIMIT 3; -- 📋 alpha_aluno_badges                           |
| SELECT * FROM alpha_aluno_desafios LIMIT 3; -- 📋 alpha_aluno_desafios                       |
| SELECT * FROM alpha_aula_progresso LIMIT 3; -- 📋 alpha_aula_progresso                       |
| SELECT * FROM alpha_badges LIMIT 3; -- 📋 alpha_badges                                       |
| SELECT * FROM alpha_celebracoes LIMIT 3; -- 📋 alpha_celebracoes                             |
| SELECT * FROM alpha_competencias LIMIT 3; -- 📋 alpha_competencias                           |
| SELECT * FROM alpha_desafios LIMIT 3; -- 📋 alpha_desafios                                   |
| SELECT * FROM alpha_estudante_badges LIMIT 3; -- 📋 alpha_estudante_badges                   |
| SELECT * FROM alpha_mentorias LIMIT 3; -- 📋 alpha_mentorias                                 |
| SELECT * FROM alpha_metodologias LIMIT 3; -- 📋 alpha_metodologias                           |
| SELECT * FROM alpha_niveis LIMIT 3; -- 📋 alpha_niveis                                       |
| SELECT * FROM alpha_progresso LIMIT 3; -- 📋 alpha_progresso                                 |
| SELECT * FROM alpha_progresso_estudante LIMIT 3; -- 📋 alpha_progresso_estudante             |
| SELECT * FROM alpha_projetos_coletivos LIMIT 3; -- 📋 alpha_projetos_coletivos               |
| SELECT * FROM alpha_ranking LIMIT 3; -- 📋 alpha_ranking                                     |
| SELECT * FROM alpha_submissoes LIMIT 3; -- 📋 alpha_submissoes                               |
| SELECT * FROM alpha_xp_historico LIMIT 3; -- 📋 alpha_xp_historico                           |
| SELECT * FROM alunos LIMIT 3; -- 📋 alunos                                                   |
| SELECT * FROM audit_activities LIMIT 3; -- 📋 audit_activities                               |
| SELECT * FROM aula_atividades LIMIT 3; -- 📋 aula_atividades                                 |
| SELECT * FROM aula_avaliacoes LIMIT 3; -- 📋 aula_avaliacoes                                 |
| SELECT * FROM aula_checklist LIMIT 3; -- 📋 aula_checklist                                   |
| SELECT * FROM aula_criterios_avaliacao LIMIT 3; -- 📋 aula_criterios_avaliacao               |
| SELECT * FROM aula_desafio_alpha LIMIT 3; -- 📋 aula_desafio_alpha                           |
| SELECT * FROM aula_desafios LIMIT 3; -- 📋 aula_desafios                                     |
| SELECT * FROM aula_feedback LIMIT 3; -- 📋 aula_feedback                                     |
| SELECT * FROM aula_feedbacks LIMIT 3; -- 📋 aula_feedbacks                                   |
| SELECT * FROM aula_materiais LIMIT 3; -- 📋 aula_materiais                                   |
| SELECT * FROM aula_permissoes LIMIT 3; -- 📋 aula_permissoes                                 |
| SELECT * FROM aula_presencas LIMIT 3; -- 📋 aula_presencas                                   |
| SELECT * FROM aula_registros LIMIT 3; -- 📋 aula_registros                                   |
| SELECT * FROM aula_status_log LIMIT 3; -- 📋 aula_status_log                                 |
| SELECT * FROM aula_tags LIMIT 3; -- 📋 aula_tags                                             |
| SELECT * FROM aulas LIMIT 3; -- 📋 aulas                                                     |
| SELECT * FROM autoavaliacoes LIMIT 3; -- 📋 autoavaliacoes                                   |
| SELECT * FROM avaliacoes_rubricas LIMIT 3; -- 📋 avaliacoes_rubricas                         |
| SELECT * FROM capacitacao_docente LIMIT 3; -- 📋 capacitacao_docente                         |
| SELECT * FROM cessoes_instrumentos LIMIT 3; -- 📋 cessoes_instrumentos                       |
| SELECT * FROM comunicacao_engajamento LIMIT 3; -- 📋 comunicacao_engajamento                 |
| SELECT * FROM desafios_alpha LIMIT 3; -- 📋 desafios_alpha                                   |
| SELECT * FROM desafios_alpha_respostas LIMIT 3; -- 📋 desafios_alpha_respostas               |
| SELECT * FROM devotional_content LIMIT 3; -- 📋 devotional_content                           |
| SELECT * FROM documentos_institucionais LIMIT 3; -- 📋 documentos_institucionais             |
| SELECT * FROM experiencias_brasileiras LIMIT 3; -- 📋 experiencias_brasileiras               |
| SELECT * FROM feedback_pares LIMIT 3; -- 📋 feedback_pares                                   |
| SELECT * FROM forum_likes LIMIT 3; -- 📋 forum_likes                                         |
| SELECT * FROM forum_perguntas LIMIT 3; -- 📋 forum_perguntas                                 |
| SELECT * FROM forum_respostas LIMIT 3; -- 📋 forum_respostas                                 |
| SELECT * FROM historia_compositores LIMIT 3; -- 📋 historia_compositores                     |
| SELECT * FROM historia_conceitos_teoricos LIMIT 3; -- 📋 historia_conceitos_teoricos         |
| SELECT * FROM historia_contexto_cultural LIMIT 3; -- 📋 historia_contexto_cultural           |
| SELECT * FROM historia_eventos_timeline LIMIT 3; -- 📋 historia_eventos_timeline             |
| SELECT * FROM historia_generos LIMIT 3; -- 📋 historia_generos                               |
| SELECT * FROM historia_instrumentos_evolucao LIMIT 3; -- 📋 historia_instrumentos_evolucao   |
| SELECT * FROM historia_movimentos LIMIT 3; -- 📋 historia_movimentos                         |
| SELECT * FROM historia_movimentos_artisticos LIMIT 3; -- 📋 historia_movimentos_artisticos   |
| SELECT * FROM historia_obras LIMIT 3; -- 📋 historia_obras                                   |
| SELECT * FROM historia_periodos LIMIT 3; -- 📋 historia_periodos                             |
| SELECT * FROM historia_playlists LIMIT 3; -- 📋 historia_playlists                           |
| SELECT * FROM historia_progresso_usuario LIMIT 3; -- 📋 historia_progresso_usuario           |
| SELECT * FROM historia_quiz LIMIT 3; -- 📋 historia_quiz                                     |
| SELECT * FROM historia_quiz_respostas LIMIT 3; -- 📋 historia_quiz_respostas                 |
| SELECT * FROM historia_timeline LIMIT 3; -- 📋 historia_timeline                             |
| SELECT * FROM historico_instrumentos LIMIT 3; -- 📋 historico_instrumentos                   |
| SELECT * FROM hook_cache LIMIT 3; -- 📋 hook_cache                                           |
| SELECT * FROM indicadores_impacto LIMIT 3; -- 📋 indicadores_impacto                         |
| SELECT * FROM instrumento_curiosidades LIMIT 3; -- 📋 instrumento_curiosidades               |
| SELECT * FROM instrumento_midias LIMIT 3; -- 📋 instrumento_midias                           |
| SELECT * FROM instrumento_performances LIMIT 3; -- 📋 instrumento_performances               |
| SELECT * FROM instrumento_quiz LIMIT 3; -- 📋 instrumento_quiz                               |
| SELECT * FROM instrumento_sons LIMIT 3; -- 📋 instrumento_sons                               |
| SELECT * FROM instrumento_sons_variacoes LIMIT 3; -- 📋 instrumento_sons_variacoes           |
| SELECT * FROM instrumento_tecnicas LIMIT 3; -- 📋 instrumento_tecnicas                       |
| SELECT * FROM instrumentos LIMIT 3; -- 📋 instrumentos                                       |
| SELECT * FROM instrumentos_alunos LIMIT 3; -- 📋 instrumentos_alunos                         |
| SELECT * FROM instrumentos_fisicos LIMIT 3; -- 📋 instrumentos_fisicos                       |
| SELECT * FROM instrumentos_relacionados LIMIT 3; -- 📋 instrumentos_relacionados             |
| SELECT * FROM lessons LIMIT 3; -- 📋 lessons                                                 |
| SELECT * FROM logos LIMIT 3; -- 📋 logos                                                     |
| SELECT * FROM manutencoes_instrumentos LIMIT 3; -- 📋 manutencoes_instrumentos               |
| SELECT * FROM materiais_apoio LIMIT 3; -- 📋 materiais_apoio                                 |
| SELECT * FROM matriculas LIMIT 3; -- 📋 matriculas                                           |
| SELECT * FROM metodologias_ensino LIMIT 3; -- 📋 metodologias_ensino                         |
| SELECT * FROM migration_log LIMIT 3; -- 📋 migration_log                                     |
| SELECT * FROM modules LIMIT 3; -- 📋 modules                                                 |
| SELECT * FROM modulos LIMIT 3; -- 📋 modulos                                                 |
| SELECT * FROM permission_templates LIMIT 3; -- 📋 permission_templates                       |
| SELECT * FROM permissions LIMIT 3; -- 📋 permissions                                         |
| SELECT * FROM portfolio_evidencias LIMIT 3; -- 📋 portfolio_evidencias                       |
| SELECT * FROM portfolios LIMIT 3; -- 📋 portfolios                                           |
| SELECT * FROM presencas LIMIT 3; -- 📋 presencas                                             |
| SELECT * FROM professor_instrumentos LIMIT 3; -- 📋 professor_instrumentos                   |
| SELECT * FROM professores LIMIT 3; -- 📋 professores                                         |
| SELECT * FROM professores_categorias LIMIT 3; -- 📋 professores_categorias                   |
| SELECT * FROM professores_conteudos LIMIT 3; -- 📋 professores_conteudos                     |
| SELECT * FROM profiles LIMIT 3; -- 📋 profiles                                               |
| SELECT * FROM proposta_curricular LIMIT 3; -- 📋 proposta_curricular                         |
| SELECT * FROM qr_codes LIMIT 3; -- 📋 qr_codes                                               |
| SELECT * FROM qr_scans LIMIT 3; -- 📋 qr_scans                                               |
| SELECT * FROM referenciais_internacionais LIMIT 3; -- 📋 referenciais_internacionais         |
| SELECT * FROM repertorio_musical LIMIT 3; -- 📋 repertorio_musical                           |
| SELECT * FROM role_permissions LIMIT 3; -- 📋 role_permissions                               |
| SELECT * FROM roles LIMIT 3; -- 📋 roles                                                     |
| SELECT * FROM rubricas_avaliacao LIMIT 3; -- 📋 rubricas_avaliacao                           |
| SELECT * FROM sequencias_didaticas LIMIT 3; -- 📋 sequencias_didaticas                       |
| SELECT * FROM sequencias_didaticas_expandidas LIMIT 3; -- 📋 sequencias_didaticas_expandidas |
| SELECT * FROM sistema_presto LIMIT 3; -- 📋 sistema_presto                                   |
| SELECT * FROM trigger_logs LIMIT 3; -- 📋 trigger_logs                                       |
| SELECT * FROM turma_alunos LIMIT 3; -- 📋 turma_alunos                                       |
| SELECT * FROM turmas LIMIT 3; -- 📋 turmas                                                   |
| SELECT * FROM user_achievements LIMIT 3; -- 📋 user_achievements                             |
| SELECT * FROM user_badges LIMIT 3; -- 📋 user_badges                                         |
| SELECT * FROM user_devotional_progress LIMIT 3; -- 📋 user_devotional_progress               |
| SELECT * FROM user_notifications LIMIT 3; -- 📋 user_notifications                           |
| SELECT * FROM user_points_log LIMIT 3; -- 📋 user_points_log                                 |
| SELECT * FROM user_progress LIMIT 3; -- 📋 user_progress                                     |
| SELECT * FROM user_roles LIMIT 3; -- 📋 user_roles                                           |
| SELECT * FROM usuarios LIMIT 3; -- 📋 usuarios                                               |



-- ========================================================================
-- 3️⃣ ANÁLISE DE TIMESTAMPS (created_at, updated_at)
-- ========================================================================

-- 3.1 Tabelas com campos de timestamp
SELECT 
    table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
    AND column_name IN ('created_at', 'updated_at', 'deleted_at', 'data_criacao', 'data_atualizacao')
ORDER BY table_name, column_name;

| table_name                      | column_name | data_type                   |
| ------------------------------- | ----------- | --------------------------- |
| achievements                    | created_at  | timestamp with time zone    |
| achievements_educacionais       | created_at  | timestamp without time zone |
| achievements_progress           | created_at  | timestamp with time zone    |
| achievements_progress           | updated_at  | timestamp with time zone    |
| adaptacoes_espacos_alternativos | created_at  | timestamp with time zone    |
| adaptacoes_espacos_alternativos | updated_at  | timestamp with time zone    |
| alpha_aluno_badges              | created_at  | timestamp with time zone    |
| alpha_aluno_desafios            | created_at  | timestamp with time zone    |
| alpha_aluno_desafios            | updated_at  | timestamp with time zone    |
| alpha_aula_progresso            | created_at  | timestamp with time zone    |
| alpha_aula_progresso            | updated_at  | timestamp with time zone    |
| alpha_badges                    | created_at  | timestamp with time zone    |
| alpha_celebracoes               | created_at  | timestamp with time zone    |
| alpha_competencias              | created_at  | timestamp with time zone    |
| alpha_desafios                  | created_at  | timestamp with time zone    |
| alpha_desafios                  | updated_at  | timestamp with time zone    |
| alpha_estudante_badges          | created_at  | timestamp with time zone    |
| alpha_mentorias                 | created_at  | timestamp with time zone    |
| alpha_metodologias              | created_at  | timestamp with time zone    |
| alpha_metodologias              | updated_at  | timestamp with time zone    |
| alpha_niveis                    | created_at  | timestamp with time zone    |
| alpha_progresso                 | created_at  | timestamp with time zone    |
| alpha_progresso                 | updated_at  | timestamp with time zone    |
| alpha_progresso_estudante       | created_at  | timestamp with time zone    |
| alpha_progresso_estudante       | updated_at  | timestamp with time zone    |
| alpha_projetos_coletivos        | created_at  | timestamp with time zone    |
| alpha_projetos_coletivos        | updated_at  | timestamp with time zone    |
| alpha_ranking                   | created_at  | timestamp with time zone    |
| alpha_ranking                   | updated_at  | timestamp with time zone    |
| alpha_submissoes                | created_at  | timestamp with time zone    |
| alpha_submissoes                | updated_at  | timestamp with time zone    |
| alpha_xp_historico              | created_at  | timestamp with time zone    |
| audit_activities                | created_at  | timestamp with time zone    |
| aula_avaliacoes                 | created_at  | timestamp with time zone    |
| aula_avaliacoes                 | updated_at  | timestamp with time zone    |
| aula_feedback                   | created_at  | timestamp without time zone |
| aula_presencas                  | created_at  | timestamp with time zone    |
| aula_presencas                  | updated_at  | timestamp with time zone    |
| autoavaliacoes                  | created_at  | timestamp with time zone    |
| avaliacoes_rubricas             | created_at  | timestamp with time zone    |
| capacitacao_docente             | created_at  | timestamp with time zone    |
| capacitacao_docente             | updated_at  | timestamp with time zone    |
| cessoes_instrumentos            | created_at  | timestamp without time zone |
| cessoes_instrumentos            | updated_at  | timestamp without time zone |
| comunicacao_engajamento         | created_at  | timestamp with time zone    |
| comunicacao_engajamento         | updated_at  | timestamp with time zone    |
| desafios_alpha                  | created_at  | timestamp without time zone |
| desafios_alpha_respostas        | created_at  | timestamp without time zone |
| devotional_content              | created_at  | timestamp with time zone    |
| documentos_institucionais       | created_at  | timestamp with time zone    |
| documentos_institucionais       | updated_at  | timestamp with time zone    |
| experiencias_brasileiras        | created_at  | timestamp with time zone    |
| feedback_pares                  | created_at  | timestamp with time zone    |
| forum_likes                     | created_at  | timestamp without time zone |
| forum_perguntas                 | created_at  | timestamp without time zone |
| forum_perguntas                 | updated_at  | timestamp without time zone |
| forum_respostas                 | created_at  | timestamp without time zone |
| historia_compositores           | created_at  | timestamp with time zone    |
| historia_conceitos_teoricos     | created_at  | timestamp with time zone    |
| historia_contexto_cultural      | created_at  | timestamp with time zone    |
| historia_eventos_timeline       | created_at  | timestamp with time zone    |
| historia_generos                | created_at  | timestamp with time zone    |
| historia_instrumentos_evolucao  | created_at  | timestamp with time zone    |
| historia_movimentos             | created_at  | timestamp with time zone    |
| historia_movimentos_artisticos  | created_at  | timestamp with time zone    |
| historia_movimentos_artisticos  | updated_at  | timestamp with time zone    |
| historia_obras                  | created_at  | timestamp with time zone    |
| historia_periodos               | created_at  | timestamp with time zone    |
| historia_playlists              | created_at  | timestamp with time zone    |
| historia_playlists              | updated_at  | timestamp with time zone    |
| historia_progresso_usuario      | created_at  | timestamp with time zone    |
| historia_progresso_usuario      | updated_at  | timestamp with time zone    |
| historia_quiz                   | created_at  | timestamp with time zone    |
| historia_quiz_respostas         | created_at  | timestamp with time zone    |
| historia_timeline               | created_at  | timestamp with time zone    |
| historia_timeline               | updated_at  | timestamp with time zone    |
| hook_cache                      | created_at  | timestamp with time zone    |
| indicadores_impacto             | created_at  | timestamp with time zone    |
| instrumento_curiosidades        | created_at  | timestamp without time zone |
| instrumento_midias              | created_at  | timestamp without time zone |
| instrumento_performances        | created_at  | timestamp without time zone |
| instrumento_quiz                | created_at  | timestamp without time zone |
| instrumento_sons                | created_at  | timestamp without time zone |
| instrumento_sons_variacoes      | created_at  | timestamp without time zone |
| instrumento_tecnicas            | created_at  | timestamp without time zone |
| instrumentos_alunos             | created_at  | timestamp without time zone |
| instrumentos_alunos             | updated_at  | timestamp without time zone |
| instrumentos_fisicos            | created_at  | timestamp without time zone |
| instrumentos_fisicos            | updated_at  | timestamp without time zone |
| instrumentos_relacionados       | created_at  | timestamp without time zone |
| lessons                         | created_at  | timestamp with time zone    |
| lessons                         | updated_at  | timestamp with time zone    |
| logos                           | created_at  | timestamp with time zone    |
| manutencoes_instrumentos        | created_at  | timestamp without time zone |
| manutencoes_instrumentos        | updated_at  | timestamp without time zone |
| materiais_apoio                 | created_at  | timestamp without time zone |
| metodologias_ensino             | created_at  | timestamp without time zone |
| migration_log                   | created_at  | timestamp with time zone    |
| modules                         | created_at  | timestamp with time zone    |
| modules                         | updated_at  | timestamp with time zone    |



-- 3.2 Tabelas SEM controle de timestamps
SELECT DISTINCT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
    AND table_type = 'BASE TABLE'
    AND table_name NOT IN (
        SELECT DISTINCT table_name
        FROM information_schema.columns
        WHERE table_schema = 'public'
            AND column_name IN ('created_at', 'updated_at')
    )
ORDER BY table_name;

| table_name               |
| ------------------------ |
| admins                   |
| alunos                   |
| aula_atividades          |
| aula_checklist           |
| aula_criterios_avaliacao |
| aula_desafio_alpha       |
| aula_desafios            |
| aula_feedbacks           |
| aula_materiais           |
| aula_permissoes          |
| aula_registros           |
| aula_status_log          |
| aula_tags                |
| aulas                    |
| historico_instrumentos   |
| instrumentos             |
| matriculas               |
| presencas                |
| professor_instrumentos   |
| professores              |
| professores_categorias   |
| professores_conteudos    |
| profiles                 |
| qr_scans                 |
| role_permissions         |
| turma_alunos             |
| turmas                   |
| user_achievements        |
| user_devotional_progress |
| user_progress            |
| usuarios                 |



-- ========================================================================
-- 4️⃣ ANÁLISE DE USUÁRIOS E PROFILES
-- ========================================================================

-- 4.1 Estrutura de autenticação
SELECT * FROM auth.users LIMIT 5;

| instance_id                          | id                                   | aud           | role          | email                            | encrypted_password                                           | email_confirmed_at            | invited_at | confirmation_token | confirmation_sent_at          | recovery_token | recovery_sent_at | email_change_token_new | email_change | email_change_sent_at | last_sign_in_at               | raw_app_meta_data                          | raw_user_meta_data                                                                                                                                                                                                                                                                                                                                  | is_super_admin | created_at                    | updated_at                    | phone | phone_confirmed_at | phone_change | phone_change_token | phone_change_sent_at | confirmed_at                  | email_change_token_current | email_change_confirm_status | banned_until | reauthentication_token | reauthentication_sent_at | is_sso_user | deleted_at | is_anonymous |
| ------------------------------------ | ------------------------------------ | ------------- | ------------- | -------------------------------- | ------------------------------------------------------------ | ----------------------------- | ---------- | ------------------ | ----------------------------- | -------------- | ---------------- | ---------------------- | ------------ | -------------------- | ----------------------------- | ------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------------------------- | ----------------------------- | ----- | ------------------ | ------------ | ------------------ | -------------------- | ----------------------------- | -------------------------- | --------------------------- | ------------ | ---------------------- | ------------------------ | ----------- | ---------- | ------------ |
| 00000000-0000-0000-0000-000000000000 | 46e25388-417a-4d84-9f3d-fb59c804304d | authenticated | authenticated | rabelodamanivalda@gmail.com      | $2a$10$0r5Y7lU2//q1HkbrDtEsCe0ui8cHMuaUSg9sqWkX2cd84jIg5.ft6 | 2025-06-21 16:49:05.531348+00 | null       |                    | 2025-06-21 16:48:50.680498+00 |                | null             |                        |              | null                 | 2025-06-21 16:49:26.564972+00 | {"provider":"email","providers":["email"]} | {"sub":"46e25388-417a-4d84-9f3d-fb59c804304d","email":"rabelodamanivalda@gmail.com","email_verified":true,"phone_verified":false}                                                                                                                                                                                                                   | null           | 2025-06-21 16:48:50.607924+00 | 2025-07-30 03:33:38.385878+00 | null  | null               |              |                    | null                 | 2025-06-21 16:49:05.531348+00 |                            | 0                           | null         |                        | null                     | false       | null       | false        |
| 00000000-0000-0000-0000-000000000000 | 1dc09e87-282c-47a9-b0b8-6f84d79f300c | authenticated | authenticated | monicaquagliarelo@gmail.com      | $2a$10$CQbM8k/bnzv0NzYATk2Qi.AnVNtnFAKyV7WbdSkQt3Awm7.OaOogy | 2025-06-10 21:22:52.765939+00 | null       |                    | 2025-06-10 21:17:55.330387+00 |                | null             |                        |              | null                 | 2025-07-01 16:50:33.470844+00 | {"provider":"email","providers":["email"]} | {"sub":"1dc09e87-282c-47a9-b0b8-6f84d79f300c","email":"monicaquagliarelo@gmail.com","email_verified":true,"phone_verified":false}                                                                                                                                                                                                                   | null           | 2025-06-09 20:11:56.983797+00 | 2025-07-01 16:50:33.479673+00 | null  | null               |              |                    | null                 | 2025-06-10 21:22:52.765939+00 |                            | 0                           | null         |                        | null                     | false       | null       | false        |
| 00000000-0000-0000-0000-000000000000 | 07f4a049-faf4-4852-8512-6ef64f2966ff | authenticated | authenticated | larissa.nunesds0505@gmail.com    | $2a$10$doxRSiuwuLd3VMXzG0fmuOH7/VjweFtPWHrEmAiHVtJlsteGQgJJm | 2025-06-11 00:51:20.909776+00 | null       |                    | 2025-06-11 00:50:26.915933+00 |                | null             |                        |              | null                 | 2025-06-11 00:59:33.39298+00  | {"provider":"email","providers":["email"]} | {"sub":"07f4a049-faf4-4852-8512-6ef64f2966ff","email":"larissa.nunesds0505@gmail.com","email_verified":true,"phone_verified":false}                                                                                                                                                                                                                 | null           | 2025-06-11 00:50:26.879006+00 | 2025-07-05 14:59:49.847882+00 | null  | null               |              |                    | null                 | 2025-06-11 00:51:20.909776+00 |                            | 0                           | null         |                        | null                     | false       | null       | false        |
| 00000000-0000-0000-0000-000000000000 | 840f99c4-7479-4098-9c2e-474a695178f0 | authenticated | authenticated | jcarlos0710@gmail.com            | $2a$10$o1SFXIQXUe4t2jr.ZN814OOf12Ngcg.r6mL.6uHYfE3itZkr6adxO | 2025-05-27 18:56:45.092127+00 | null       |                    | 2025-05-27 18:56:17.498959+00 |                | null             |                        |              | null                 | 2025-05-27 18:56:45.097572+00 | {"provider":"email","providers":["email"]} | {"dob":"1972-10-07","sub":"840f99c4-7479-4098-9c2e-474a695178f0","email":"jcarlos0710@gmail.com","full_name":"Jose Carlos Oliveira","instrument":"trompete","user_level":"beginner","tipo_usuario":"aluno","sound_enabled":true,"email_verified":true,"phone_verified":false,"theme_preference":"light","notification_enabled":true}                | null           | 2025-05-27 18:56:17.455489+00 | 2025-05-27 18:56:45.100664+00 | null  | null               |              |                    | null                 | 2025-05-27 18:56:45.092127+00 |                            | 0                           | null         |                        | null                     | false       | null       | false        |
| 00000000-0000-0000-0000-000000000000 | a57eeb22-a246-4243-8e32-98297c6f3bad | authenticated | authenticated | nicollymellodecamargo2@gmail.com | $2a$10$BQoGE6ffEPQ9h7IS1G/FF.MoqVgu5QZJPk6TKtBsIykN2b1outi5S | 2025-06-04 16:01:34.434806+00 | null       |                    | 2025-06-04 16:01:12.062867+00 |                | null             |                        |              | null                 | 2025-06-04 16:01:34.44535+00  | {"provider":"email","providers":["email"]} | {"dob":"2013-06-07","sub":"a57eeb22-a246-4243-8e32-98297c6f3bad","email":"nicollymellodecamargo2@gmail.com","full_name":"Nicolly Mello de Camargo ","instrument":"teclado","user_level":"beginner","tipo_usuario":"aluno","sound_enabled":true,"email_verified":true,"phone_verified":false,"theme_preference":"light","notification_enabled":true} | null           | 2025-05-27 22:08:47.914966+00 | 2025-06-04 16:01:34.487562+00 | null  | null               |              |                    | null                 | 2025-06-04 16:01:34.434806+00 |                            | 0                           | null         |                        | null                     | false       | null       | false        |



-- 4.2 Profiles no schema public
SELECT * FROM profiles LIMIT 5;

| id                                   | email                            | full_name                           | dob        | instrument | voted_logo                           | has_voted | avatar_url | church_name | user_level | total_points | bio  | phone | city | state | joined_at                     | last_active                   | current_streak | best_streak | lessons_completed | modules_completed | theme_preference | notification_enabled | sound_enabled | tipo_usuario | nome                                |
| ------------------------------------ | -------------------------------- | ----------------------------------- | ---------- | ---------- | ------------------------------------ | --------- | ---------- | ----------- | ---------- | ------------ | ---- | ----- | ---- | ----- | ----------------------------- | ----------------------------- | -------------- | ----------- | ----------------- | ----------------- | ---------------- | -------------------- | ------------- | ------------ | ----------------------------------- |
| 5e31da6f-9ce6-4345-a056-efc5719039f0 | priscilasouza.musica@gmail.com   | Priscila Souza                      | 1981-11-17 | violoncelo | null                                 | false     | null       | null        | beginner   | 0            | null | null  | null | null  | 2025-05-30 13:18:26.529455+00 | 2025-06-01 19:37:19.513029+00 | 0              | 0           | 0                 | 0                 | light            | true                 | true          | professor    | null                                |
| a57eeb22-a246-4243-8e32-98297c6f3bad | nicollymellodecamargo2@gmail.com | Nicolly Mello de Camargo            | 2013-06-07 | teclado    | 5735bc8c-c8d6-4430-865b-e23b3a1f4fc8 | true      | null       | null        | beginner   | 0            | null | null  | null | null  | 2025-05-27 22:08:48.914966+00 | 2025-06-04 16:02:04.541869+00 | 0              | 0           | 0                 | 0                 | light            | true                 | true          | aluno        | Nicolly Mello de Camargo            |
| 509052e4-5f3a-41df-bf48-f46b6f3cc108 | junior_sax@hotmail.com           | Gilberto Junior                     | 1978-09-06 | piano      | 6dc8695b-f6af-4bbc-b933-6ff94d0424b6 | true      | null       | null        | beginner   | 0            | null | null  | null | null  | 2025-06-09 16:00:40.395572+00 | 2025-06-09 16:07:25.454873+00 | 0              | 0           | 0                 | 0                 | light            | true                 | true          | professor    | Gilberto Junior                     |
| 953666c4-4b76-4d52-8332-6be7323c0f55 | gianne.formis@gmail.com          | Kelebe Formis Takeuti               | 2015-02-18 | teclado    | null                                 | false     | null       | null        | beginner   | 0            | null | null  | null | null  | 2025-06-09 20:16:08.126768+00 | 2025-06-09 20:16:08.126768+00 | 0              | 0           | 0                 | 0                 | light            | true                 | true          | aluno        | Kelebe Formis Takeuti               |
| 1dc09e87-282c-47a9-b0b8-6f84d79f300c | monicaquagliarelo@gmail.com      | Monica de Souza Bacelar Quagliarelo | 1982-07-27 | flauta     | e4e9a1f4-6542-4ebe-9b1c-6f4e58da4e91 | true      | null       | null        | beginner   | 0            | null | null  | null | null  | 2025-06-09 20:11:59.393837+00 | 2025-06-10 21:23:53.746912+00 | 0              | 0           | 0                 | 0                 | light            | true                 | true          | aluno        | Monica de Souza Bacelar Quagliarelo |



-- 4.3 Relação entre auth.users e profiles
SELECT 
    COUNT(DISTINCT u.id) as total_users_auth,
    COUNT(DISTINCT p.id) as total_profiles,
    COUNT(DISTINCT u.id) - COUNT(DISTINCT p.id) as diferenca
FROM auth.users u
FULL OUTER JOIN profiles p ON u.id = p.id;

| total_users_auth | total_profiles | diferenca |
| ---------------- | -------------- | --------- |
| 30               | 29             | 1         |



-- 4.4 Tipos de usuários no sistema
SELECT 
    tipo_usuario,
    COUNT(*) as total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentual
FROM profiles
WHERE tipo_usuario IS NOT NULL
GROUP BY tipo_usuario
ORDER BY total DESC;

| tipo_usuario | total | percentual |
| ------------ | ----- | ---------- |
| aluno        | 24    | 82.76      |
| professor    | 4     | 13.79      |
| admin        | 1     | 3.45       |



-- ========================================================================
-- 5️⃣ ANÁLISE DE TURMAS E ALUNOS
-- ========================================================================

-- 5.1 Turmas existentes
SELECT 
    nome,
    nivel,
    ano,
    semestre,
    status,
    vagas_total,
    created_at
FROM turmas
ORDER BY ano DESC, semestre DESC, nivel;

mudei:

SELECT 
    nome,
    nivel,
    status
FROM turmas
;

| nome                       | nivel     | status    |
| -------------------------- | --------- | --------- |
| Flauta Iniciante - Turma A | iniciante | planejada |
| Violino Básico             | iniciante | ativa     |
| Bateria Iniciante          | iniciante | ativa     |
| Turma Teste - Saxofone     | iniciante | ativa     |



-- 5.2 Alunos por turma
SELECT 
    t.nome as turma,
    COUNT(m.aluno_id) as total_alunos,
    t.vagas_total,
    t.vagas_total - COUNT(m.aluno_id) as vagas_disponiveis
FROM turmas t
LEFT JOIN matriculas m ON m.turma_id = t.id
GROUP BY t.id, t.nome, t.vagas_total
ORDER BY t.nome;

não temos

-- 5.3 Status das matrículas
SELECT 
    status,
    COUNT(*) as total
FROM matriculas
GROUP BY status;

| status | total |
| ------ | ----- |
| ativa  | 6     |


-- ========================================================================
-- 6️⃣ ANÁLISE DE AULAS E CONTEÚDO
-- ========================================================================

-- 6.1 Aulas por nível
SELECT 
    nivel,
    COUNT(*) as total_aulas,
    COUNT(DISTINCT modulo) as total_modulos
FROM aulas
GROUP BY nivel
ORDER BY nivel;

-- 6.2 Status das aulas
SELECT 
    status,
    COUNT(*) as total
FROM aulas
GROUP BY status;

| status    | total |
| --------- | ----- |
| A Fazer   | 5     |
| Concluída | 25    |

-- 6.3 Aulas com/sem materiais
SELECT 
    a.titulo,
    COUNT(am.id) as total_materiais
FROM aulas a
LEFT JOIN aula_materiais am ON am.aula_id = a.id
GROUP BY a.id, a.titulo
ORDER BY total_materiais DESC;

| titulo                          | total_materiais |
| ------------------------------- | --------------- |
| Oficina de Bandas/Duplas        | 5               |
| Arranjos Pop/TikTok             | 5               |
| Iniciação Instrumental II       | 5               |
| Performance de Grupos           | 5               |
| Repertório Gospel e Louvor      | 5               |
| Semana Criativa                 | 5               |
| Revisão Geral                   | 5               |
| Alfabetização Musical II        | 5               |
| Tecnologia na Música            | 5               |
| Iniciação Instrumental I        | 5               |
| Oficina de Composição Coletiva  | 5               |
| Repertório Brasileiro II        | 5               |
| Melodia Criativa                | 5               |
| Alfabetização Musical I         | 5               |
| Técnicas de Afinação            | 5               |
| Jogo de Ritmos e Grupos         | 5               |
| Harmonia na Prática             | 5               |
| Repertório Brasileiro I         | 5               |
| Improvisação Guiada             | 5               |
| Produção de Vídeo Musical       | 5               |
| Músicas do Japão                | 5               |
| Revisão e Mostra de Grupos      | 4               |
| Ensaio Geral II                 | 4               |
| Som do Corpo e Ritmo Básico     | 4               |
| Ensaio Geral I                  | 4               |
| Show Final/Aula de Encerramento | 4               |
| Avaliação Criativa              | 4               |
| Sons do Dia a Dia (Orff)        | 4               |
| Ensaio Final/Preparação Show    | 4               |
| Aula Inaugural                  | 3               |



-- ========================================================================
-- 7️⃣ ANÁLISE DE INSTRUMENTOS
-- ========================================================================

-- 7.1 Instrumentos cadastrados
SELECT 
    nome,
    categoria,
    origem,
    dificuldade_aprendizado,
    disponivel_escola
FROM instrumentos
ORDER BY categoria, nome;

-- 7.2 Cessões de instrumentos ativas
SELECT 
    i.nome as instrumento,
    p.nome_completo as aluno,
    c.data_emprestimo,
    c.data_devolucao_prevista,
    c.status
FROM cessoes_instrumentos c
JOIN instrumentos i ON i.id = c.instrumento_id
JOIN profiles p ON p.id = c.aluno_id
WHERE c.status = 'ativa'
ORDER BY c.data_emprestimo DESC;

-- ========================================================================
-- 8️⃣ ANÁLISE DE GAMIFICAÇÃO
-- ========================================================================

-- 8.1 Conquistas disponíveis
SELECT 
    titulo,
    categoria,
    dificuldade,
    xp_reward,
    requisitos
FROM achievements
ORDER BY categoria, dificuldade;

-- 8.2 Progresso dos alunos nas conquistas
SELECT 
    p.nome_completo,
    COUNT(ap.achievement_id) as total_conquistas,
    SUM(a.xp_reward) as total_xp
FROM profiles p
LEFT JOIN achievements_progress ap ON ap.user_id = p.id
LEFT JOIN achievements a ON a.id = ap.achievement_id
WHERE p.tipo_usuario = 'aluno'
GROUP BY p.id, p.nome_completo
ORDER BY total_xp DESC NULLS LAST;

-- 8.3 Níveis de XP
SELECT 
    nivel_numero,
    nome,
    xp_necessario,
    descricao
FROM niveis
ORDER BY nivel_numero;

-- ========================================================================
-- 9️⃣ ANÁLISE DE HISTÓRIA DA MÚSICA
-- ========================================================================

-- 9.1 Períodos históricos
SELECT 
    nome,
    data_inicio,
    data_fim,
    ordem_cronologica,
    ativo
FROM historia_periodos
ORDER BY ordem_cronologica;

-- 9.2 Compositores por período
SELECT 
    hp.nome as periodo,
    COUNT(hc.id) as total_compositores
FROM historia_periodos hp
LEFT JOIN historia_compositores hc ON hc.periodo_id = hp.id
GROUP BY hp.id, hp.nome
ORDER BY hp.ordem_cronologica;

| periodo                         | total_compositores |
| ------------------------------- | ------------------ |
| Medieval                        | 0                  |
| Renascimento                    | 0                  |
| Barroco                         | 4                  |
| Clássico                        | 3                  |
| Romântico                       | 12                 |
| Impressionismo                  | 1                  |
| Modernismo                      | 3                  |
| Contemporâneo                   | 0                  |
| Jazz                            | 0                  |
| MPB - Música Popular Brasileira | 0                  |
| Bossa Nova                      | 3                  |
| Rock e Música Popular           | 0                  |
| Período Heian (Japão)           | 0                  |
| Período Kamakura (Japão)        | 0                  |
| Período Edo (Japão)             | 1                  |
| Era Meiji (Japão)               | 2                  |
| Shōwa Pós-Guerra (Japão)        | 1                  |
| J-Pop Contemporâneo             | 3                  |
| Brasil Colonial                 | 0                  |
| Brasil Imperial                 | 2                  |
| Era do Rádio (Brasil)           | 1                  |
| MPB e Tropicália                | 3                  |
| Música Brasileira Contemporânea | 1                  |


-- 9.3 Obras por compositor
SELECT 
    hc.nome as compositor,
    COUNT(ho.id) as total_obras
FROM historia_compositores hc
LEFT JOIN historia_obras ho ON ho.compositor_id = hc.id
GROUP BY hc.id, hc.nome
ORDER BY total_obras DESC;

-- ========================================================================
-- 🔟 ANÁLISE DE REPERTÓRIO E PORTFÓLIO
-- ========================================================================

-- 10.1 Repertório cadastrado
SELECT 
    titulo,
    compositor,
    nivel_dificuldade,
    categoria,
    duracao_estimada
FROM repertorio
ORDER BY nivel_dificuldade, titulo;

-- 10.2 Submissões de portfólio
SELECT 
    p.nome_completo as aluno,
    ps.titulo,
    ps.tipo,
    ps.status,
    ps.data_submissao
FROM portfolio_submissoes ps
JOIN profiles p ON p.id = ps.aluno_id
ORDER BY ps.data_submissao DESC;

-- 10.3 Status das submissões
SELECT 
    status,
    COUNT(*) as total
FROM portfolio_submissoes
GROUP BY status;

-- ========================================================================
-- 1️⃣1️⃣ ANÁLISE DE QR CODES
-- ========================================================================

-- 11.1 QR Codes ativos
SELECT 
    tipo,
    nome,
    ativo,
    total_escaneamentos,
    created_at
FROM qr_codes
WHERE ativo = true
ORDER BY tipo, nome;

-- 11.2 Escaneamentos por QR Code
SELECT 
    qc.nome,
    COUNT(qe.id) as total_escaneamentos,
    COUNT(DISTINCT qe.user_id) as usuarios_unicos
FROM qr_codes qc
LEFT JOIN qr_escaneamentos qe ON qe.qr_id = qc.id
GROUP BY qc.id, qc.nome
ORDER BY total_escaneamentos DESC;

-- ========================================================================
-- 1️⃣2️⃣ ANÁLISE DE ATIVIDADES E LOGS
-- ========================================================================

-- 12.1 Últimas atividades registradas
SELECT 
    p.nome_completo as usuario,
    aa.tipo_atividade,
    aa.descricao,
    aa.created_at
FROM audit_activities aa
JOIN profiles p ON p.id = aa.user_id
ORDER BY aa.created_at DESC
LIMIT 20;

-- 12.2 Tipos de atividades mais comuns
SELECT 
    tipo_atividade,
    COUNT(*) as total
FROM audit_activities
GROUP BY tipo_atividade
ORDER BY total DESC;

-- ========================================================================
-- 1️⃣3️⃣ ÓRFÃOS E INCONSISTÊNCIAS
-- ========================================================================

-- 13.1 Matrículas sem aluno válido
SELECT m.*
FROM matriculas m
LEFT JOIN profiles p ON p.id = m.aluno_id
WHERE p.id IS NULL;

-- 13.2 Matrículas sem turma válida
SELECT m.*
FROM matriculas m
LEFT JOIN turmas t ON t.id = m.turma_id
WHERE t.id IS NULL;

-- 13.3 Profiles sem usuário no auth
SELECT p.*
FROM profiles p
LEFT JOIN auth.users u ON u.id = p.id
WHERE u.id IS NULL;

| id                                   | email                | full_name                        | dob        | instrument | voted_logo | has_voted | avatar_url | church_name | user_level | total_points | bio  | phone | city | state | joined_at                     | last_active                   | current_streak | best_streak | lessons_completed | modules_completed | theme_preference | notification_enabled | sound_enabled | tipo_usuario | nome                             |
| ------------------------------------ | -------------------- | -------------------------------- | ---------- | ---------- | ---------- | --------- | ---------- | ----------- | ---------- | ------------ | ---- | ----- | ---- | ----- | ----------------------------- | ----------------------------- | -------------- | ----------- | ----------------- | ----------------- | ---------------- | -------------------- | ------------- | ------------ | -------------------------------- |
| 6ede891d-d6fd-4fe1-806c-e16533ae6fba | ph1goleiro@gmail.com | Pedro Henrique de Camargo Lorena | 2008-12-27 | fagote     | null       | false     | null       | null        | beginner   | 0            | null | null  | null | null  | 2025-09-28 15:53:04.215067+00 | 2025-09-28 15:53:04.215067+00 | 0              | 0           | 0                 | 0                 | light            | true                 | true          | aluno        | Pedro Henrique de Camargo Lorena |



-- 13.4 Usuários no auth sem profile
SELECT u.*
FROM auth.users u
LEFT JOIN profiles p ON p.id = u.id
WHERE p.id IS NULL;

| instance_id                          | id                                   | aud           | role          | email                     | encrypted_password                                           | email_confirmed_at | invited_at | confirmation_token                                       | confirmation_sent_at          | recovery_token | recovery_sent_at | email_change_token_new | email_change | email_change_sent_at | last_sign_in_at | raw_app_meta_data                          | raw_user_meta_data                                                                                                                                                                                                                                                                                                                 | is_super_admin | created_at                    | updated_at                    | phone | phone_confirmed_at | phone_change | phone_change_token | phone_change_sent_at | confirmed_at | email_change_token_current | email_change_confirm_status | banned_until | reauthentication_token | reauthentication_sent_at | is_sso_user | deleted_at | is_anonymous |
| ------------------------------------ | ------------------------------------ | ------------- | ------------- | ------------------------- | ------------------------------------------------------------ | ------------------ | ---------- | -------------------------------------------------------- | ----------------------------- | -------------- | ---------------- | ---------------------- | ------------ | -------------------- | --------------- | ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------------------------- | ----------------------------- | ----- | ------------------ | ------------ | ------------------ | -------------------- | ------------ | -------------------------- | --------------------------- | ------------ | ---------------------- | ------------------------ | ----------- | ---------- | ------------ |
| 00000000-0000-0000-0000-000000000000 | 491b7c68-00d0-4154-adb7-80fcb73a72e4 | authenticated | authenticated | oticastatymello@gmail.com | $2a$10$7u70rTvzzH1mDTZcjHlNZ.7Av6hmK4E/pG5oMJ/GVTVuHVJh1kfgK | null               | null       | c9900b2f3d438dd0fd892994efe05bcf5b39bfb44330f04d82710747 | 2025-06-09 19:45:22.313202+00 |                | null             |                        |              | null                 | null            | {"provider":"email","providers":["email"]} | {"dob":"1978-09-06","sub":"491b7c68-00d0-4154-adb7-80fcb73a72e4","email":"oticastatymello@gmail.com","full_name":"testes teste","instrument":"euphonium","user_level":"beginner","tipo_usuario":"aluno","sound_enabled":true,"email_verified":false,"phone_verified":false,"theme_preference":"light","notification_enabled":true} | null           | 2025-06-09 19:45:22.301244+00 | 2025-06-09 19:45:25.297047+00 | null  | null               |              |                    | null                 | null         |                            | 0                           | null         |                        | null                     | false       | null       | false        |
| 00000000-0000-0000-0000-000000000000 | 3f09ae20-53f8-4e34-8ddb-4223f9b5ef8e | authenticated | authenticated | professor@gmail.com       | $2a$10$TO/Qq4TbNn6S164RlnlTHuLVuaRK5TLWT9TbxadxKMe.Ngk/seWTi | null               | null       | ac495c310d5ae9e8044a52c5faf4d00519ca85d2094f49e7721e8736 | 2025-10-04 22:47:38.629119+00 |                | null             |                        |              | null                 | null            | {"provider":"email","providers":["email"]} | {"sub":"3f09ae20-53f8-4e34-8ddb-4223f9b5ef8e","email":"professor@gmail.com","email_verified":false,"phone_verified":false}                                                                                                                                                                                                         | null           | 2025-10-04 22:47:38.62072+00  | 2025-10-04 22:47:40.827559+00 | null  | null               |              |                    | null                 | null         |                            | 0                           | null         |                        | null                     | false       | null       | false        |




-- ========================================================================
-- 1️⃣4️⃣ RESUMO DE POPULAÇÃO
-- ========================================================================

SELECT 
    'Usuários (auth.users)' as entidade,
    (SELECT COUNT(*) FROM auth.users)::text as total
UNION ALL
SELECT 'Profiles', (SELECT COUNT(*) FROM profiles)::text
UNION ALL
SELECT 'Alunos', (SELECT COUNT(*) FROM profiles WHERE tipo_usuario = 'aluno')::text
UNION ALL
SELECT 'Professores', (SELECT COUNT(*) FROM profiles WHERE tipo_usuario = 'professor')::text
UNION ALL
SELECT 'Admins', (SELECT COUNT(*) FROM profiles WHERE tipo_usuario = 'admin')::text
UNION ALL
SELECT 'Turmas', (SELECT COUNT(*) FROM turmas)::text
UNION ALL
SELECT 'Matrículas', (SELECT COUNT(*) FROM matriculas)::text
UNION ALL
SELECT 'Aulas', (SELECT COUNT(*) FROM aulas)::text
UNION ALL
SELECT 'Instrumentos', (SELECT COUNT(*) FROM instrumentos)::text
UNION ALL
SELECT 'Conquistas', (SELECT COUNT(*) FROM achievements)::text
UNION ALL
SELECT 'Períodos Históricos', (SELECT COUNT(*) FROM historia_periodos)::text
UNION ALL
SELECT 'Compositores', (SELECT COUNT(*) FROM historia_compositores)::text
UNION ALL
SELECT 'QR Codes', (SELECT COUNT(*) FROM qr_codes)::text;


| entidade              | total |
| --------------------- | ----- |
| Usuários (auth.users) | 30    |
| Profiles              | 29    |
| Alunos                | 24    |
| Professores           | 4     |
| Admins                | 1     |
| Turmas                | 4     |
| Matrículas            | 6     |
| Aulas                 | 30    |
| Instrumentos          | 69    |
| Conquistas            | 24    |
| Períodos Históricos   | 23    |
| Compositores          | 40    |
| QR Codes              | 0     |
