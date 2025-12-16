-- ========================================================================
-- 📊 ANÁLISE ESTRUTURAL COMPLETA DO BANCO DE DADOS
-- ========================================================================
-- Data: 2025-12-15
-- Objetivo: Mapear toda estrutura, relacionamentos e constraints
-- ========================================================================

-- ========================================================================
-- 1️⃣ SCHEMAS E TABELAS
-- ========================================================================

-- 1.1 Todos os schemas do sistema
SELECT 
    schema_name,
    CASE 
        WHEN schema_name = 'public' THEN '🏠 Schema principal da aplicação'
        WHEN schema_name = 'auth' THEN '🔐 Autenticação Supabase'
        WHEN schema_name = 'storage' THEN '📦 Armazenamento de arquivos'
        WHEN schema_name = 'realtime' THEN '⚡ Realtime subscriptions'
        ELSE '⚙️ Sistema'
    END as descricao
FROM information_schema.schemata 
WHERE schema_name NOT LIKE 'pg_%'
    AND schema_name NOT IN ('information_schema', 'graphql', 'graphql_public', 'extensions', 'pgbouncer', 'vault')
ORDER BY schema_name;

| schema_name        | descricao                        |
| ------------------ | -------------------------------- |
| auth               | 🔐 Autenticação Supabase         |
| net                | ⚙️ Sistema                       |
| public             | 🏠 Schema principal da aplicação |
| realtime           | ⚡ Realtime subscriptions         |
| storage            | 📦 Armazenamento de arquivos     |
| supabase_functions | ⚙️ Sistema                       |



-- 1.2 Contagem de tabelas por schema
SELECT 
    table_schema,
    COUNT(*) as total_tabelas,
    string_agg(table_name, ', ' ORDER BY table_name) as tabelas
FROM information_schema.tables
WHERE table_schema IN ('public', 'auth', 'storage')
    AND table_type = 'BASE TABLE'
GROUP BY table_schema
ORDER BY total_tabelas DESC;

| table_schema | total_tabelas | tabelas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ------------ | ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| public       | 123           | achievements, achievements_educacionais, achievements_progress, adaptacoes_espacos_alternativos, admins, alpha_aluno_badges, alpha_aluno_desafios, alpha_aula_progresso, alpha_badges, alpha_celebracoes, alpha_competencias, alpha_desafios, alpha_estudante_badges, alpha_mentorias, alpha_metodologias, alpha_niveis, alpha_progresso, alpha_progresso_estudante, alpha_projetos_coletivos, alpha_ranking, alpha_submissoes, alpha_xp_historico, alunos, audit_activities, aula_atividades, aula_avaliacoes, aula_checklist, aula_criterios_avaliacao, aula_desafio_alpha, aula_desafios, aula_feedback, aula_feedbacks, aula_materiais, aula_permissoes, aula_presencas, aula_registros, aula_status_log, aula_tags, aulas, autoavaliacoes, avaliacoes_rubricas, capacitacao_docente, cessoes_instrumentos, comunicacao_engajamento, desafios_alpha, desafios_alpha_respostas, devotional_content, documentos_institucionais, experiencias_brasileiras, feedback_pares, forum_likes, forum_perguntas, forum_respostas, historia_compositores, historia_conceitos_teoricos, historia_contexto_cultural, historia_eventos_timeline, historia_generos, historia_instrumentos_evolucao, historia_movimentos, historia_movimentos_artisticos, historia_obras, historia_periodos, historia_playlists, historia_progresso_usuario, historia_quiz, historia_quiz_respostas, historia_timeline, historico_instrumentos, hook_cache, indicadores_impacto, instrumento_curiosidades, instrumento_midias, instrumento_performances, instrumento_quiz, instrumento_sons, instrumento_sons_variacoes, instrumento_tecnicas, instrumentos, instrumentos_alunos, instrumentos_fisicos, instrumentos_relacionados, lessons, logos, manutencoes_instrumentos, materiais_apoio, matriculas, metodologias_ensino, migration_log, modules, modulos, permission_templates, permissions, portfolio_evidencias, portfolios, presencas, professor_instrumentos, professores, professores_categorias, professores_conteudos, profiles, proposta_curricular, qr_codes, qr_scans, referenciais_internacionais, repertorio_musical, role_permissions, roles, rubricas_avaliacao, sequencias_didaticas, sequencias_didaticas_expandidas, sistema_presto, trigger_logs, turma_alunos, turmas, user_achievements, user_badges, user_devotional_progress, user_notifications, user_points_log, user_progress, user_roles, usuarios |
| auth         | 20            | audit_log_entries, flow_state, identities, instances, mfa_amr_claims, mfa_challenges, mfa_factors, oauth_authorizations, oauth_client_states, oauth_clients, oauth_consents, one_time_tokens, refresh_tokens, saml_providers, saml_relay_states, schema_migrations, sessions, sso_domains, sso_providers, users                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| storage      | 9             | buckets, buckets_analytics, buckets_vectors, migrations, objects, prefixes, s3_multipart_uploads, s3_multipart_uploads_parts, vector_indexes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |


-- 1.3 Todas as tabelas do schema public com descrições
SELECT 
    t.table_name,
    COALESCE(obj_description((quote_ident(t.table_schema)||'.'||quote_ident(t.table_name))::regclass), '❌ Sem descrição') as descricao,
    (SELECT COUNT(*) FROM information_schema.columns c WHERE c.table_name = t.table_name AND c.table_schema = 'public') as total_colunas
FROM information_schema.tables t
WHERE t.table_schema = 'public'
    AND t.table_type = 'BASE TABLE'
ORDER BY t.table_name;

| table_name                      | descricao                                                                          | total_colunas |
| ------------------------------- | ---------------------------------------------------------------------------------- | ------------- |
| achievements                    | Sistema de conquistas/badges do Nipo School                                        | 11            |
| achievements_educacionais       | ❌ Sem descrição                                                                    | 10            |
| achievements_progress           | ❌ Sem descrição                                                                    | 10            |
| adaptacoes_espacos_alternativos | Guia para ONGs e Igrejas baseado no Capítulo 18 (72 linhas)                        | 23            |
| admins                          | ❌ Sem descrição                                                                    | 7             |
| alpha_aluno_badges              | Badges conquistadas pelos alunos                                                   | 12            |
| alpha_aluno_desafios            | Relacionamento entre alunos e desafios com progresso                               | 15            |
| alpha_aula_progresso            | ❌ Sem descrição                                                                    | 11            |
| alpha_badges                    | Tabela corrigida e verificada - pronta para população!                             | 23            |
| alpha_celebracoes               | ❌ Sem descrição                                                                    | 19            |
| alpha_competencias              | ❌ Sem descrição                                                                    | 11            |
| alpha_desafios                  | Desafios e missões do sistema de gamificação                                       | 34            |
| alpha_estudante_badges          | ❌ Sem descrição                                                                    | 13            |
| alpha_mentorias                 | ❌ Sem descrição                                                                    | 14            |
| alpha_metodologias              | ❌ Sem descrição                                                                    | 25            |
| alpha_niveis                    | ❌ Sem descrição                                                                    | 13            |
| alpha_progresso                 | ❌ Sem descrição                                                                    | 12            |
| alpha_progresso_estudante       | ❌ Sem descrição                                                                    | 42            |
| alpha_projetos_coletivos        | ❌ Sem descrição                                                                    | 21            |
| alpha_ranking                   | ❌ Sem descrição                                                                    | 20            |
| alpha_submissoes                | ❌ Sem descrição                                                                    | 18            |
| alpha_xp_historico              | ❌ Sem descrição                                                                    | 17            |
| alunos                          | ❌ Sem descrição                                                                    | 9             |
| audit_activities                | ❌ Sem descrição                                                                    | 15            |
| aula_atividades                 | ❌ Sem descrição                                                                    | 4             |
| aula_avaliacoes                 | Avaliações dos alunos nas aulas                                                    | 9             |
| aula_checklist                  | ❌ Sem descrição                                                                    | 5             |
| aula_criterios_avaliacao        | ❌ Sem descrição                                                                    | 3             |
| aula_desafio_alpha              | ❌ Sem descrição                                                                    | 3             |
| aula_desafios                   | ❌ Sem descrição                                                                    | 7             |
| aula_feedback                   | ❌ Sem descrição                                                                    | 5             |
| aula_feedbacks                  | ❌ Sem descrição                                                                    | 5             |
| aula_materiais                  | Materiais didáticos das aulas                                                      | 5             |
| aula_permissoes                 | ❌ Sem descrição                                                                    | 5             |
| aula_presencas                  | Registro de presença dos alunos                                                    | 8             |
| aula_registros                  | ❌ Sem descrição                                                                    | 4             |
| aula_status_log                 | ❌ Sem descrição                                                                    | 5             |
| aula_tags                       | ❌ Sem descrição                                                                    | 4             |
| aulas                           | Aulas agendadas e realizadas                                                       | 14            |
| autoavaliacoes                  | ❌ Sem descrição                                                                    | 18            |
| avaliacoes_rubricas             | ❌ Sem descrição                                                                    | 9             |
| capacitacao_docente             | Sistema de formação continuada baseado no Capítulo 17 (93 linhas)                  | 24            |
| cessoes_instrumentos            | ❌ Sem descrição                                                                    | 15            |
| comunicacao_engajamento         | Estratégias de mobilização baseado no Capítulo 19 (84 linhas)                      | 26            |
| desafios_alpha                  | ❌ Sem descrição                                                                    | 14            |
| desafios_alpha_respostas        | ❌ Sem descrição                                                                    | 10            |
| devotional_content              | ❌ Sem descrição                                                                    | 11            |
| documentos_institucionais       | Templates e modelos baseado no Capítulo 16 (118 linhas)                            | 23            |
| experiencias_brasileiras        | Catalogação de projetos inovadores brasileiros baseado no Capítulo 11 (239 linhas) | 19            |
| feedback_pares                  | ❌ Sem descrição                                                                    | 13            |
| forum_likes                     | ❌ Sem descrição                                                                    | 4             |
| forum_perguntas                 | ❌ Sem descrição                                                                    | 11            |
| forum_respostas                 | ❌ Sem descrição                                                                    | 7             |
| historia_compositores           | ❌ Sem descrição                                                                    | 20            |
| historia_conceitos_teoricos     | ❌ Sem descrição                                                                    | 14            |
| historia_contexto_cultural      | ❌ Sem descrição                                                                    | 11            |
| historia_eventos_timeline       | ❌ Sem descrição                                                                    | 15            |
| historia_generos                | ❌ Sem descrição                                                                    | 16            |
| historia_instrumentos_evolucao  | ❌ Sem descrição                                                                    | 13            |
| historia_movimentos             | ❌ Sem descrição                                                                    | 14            |
| historia_movimentos_artisticos  | Movimentos artísticos e estilos musicais ao longo da história                      | 21            |
| historia_obras                  | ❌ Sem descrição                                                                    | 25            |
| historia_periodos               | ❌ Sem descrição                                                                    | 13            |
| historia_playlists              | ❌ Sem descrição                                                                    | 14            |
| historia_progresso_usuario      | ❌ Sem descrição                                                                    | 12            |
| historia_quiz                   | ❌ Sem descrição                                                                    | 13            |
| historia_quiz_respostas         | ❌ Sem descrição                                                                    | 7             |
| historia_timeline               | Linha do tempo com eventos importantes da história da música                       | 15            |
| historico_instrumentos          | ❌ Sem descrição                                                                    | 7             |
| hook_cache                      | ❌ Sem descrição                                                                    | 9             |
| indicadores_impacto             | ❌ Sem descrição                                                                    | 9             |
| instrumento_curiosidades        | Fatos interessantes e curiosidades sobre o instrumento                             | 9             |
| instrumento_midias              | Galeria de mídias (imagens, vídeos, áudios, 3D) para cada instrumento              | 18            |
| instrumento_performances        | Performances famosas que destacam o instrumento                                    | 14            |
| instrumento_quiz                | Perguntas interativas sobre o instrumento                                          | 15            |
| instrumento_sons                | Sons e samples específicos de cada instrumento com diferentes técnicas             | 11            |
| instrumento_sons_variacoes      | Múltiplas variações de gravação para cada som                                      | 10            |
| instrumento_tecnicas            | Técnicas específicas de aprendizado progressivo                                    | 14            |
| instrumentos                    | ❌ Sem descrição                                                                    | 16            |
| instrumentos_alunos             | ❌ Sem descrição                                                                    | 11            |
| instrumentos_fisicos            | ❌ Sem descrição                                                                    | 15            |
| instrumentos_relacionados       | Relacionamentos entre instrumentos (família, evolução, etc)                        | 7             |
| lessons                         | Tabela de aulas dos módulos do Nipo School                                         | 21            |
| logos                           | ❌ Sem descrição                                                                    | 6             |
| manutencoes_instrumentos        | ❌ Sem descrição                                                                    | 14            |
| materiais_apoio                 | ❌ Sem descrição                                                                    | 19            |
| matriculas                      | ❌ Sem descrição                                                                    | 15            |
| metodologias_ensino             | ❌ Sem descrição                                                                    | 17            |
| migration_log                   | ❌ Sem descrição                                                                    | 5             |
| modules                         | Tabela de módulos de aprendizado do Nipo School                                    | 14            |
| modulos                         | ❌ Sem descrição                                                                    | 6             |
| permission_templates            | ❌ Sem descrição                                                                    | 7             |
| permissions                     | ❌ Sem descrição                                                                    | 4             |
| portfolio_evidencias            | ❌ Sem descrição                                                                    | 21            |
| portfolios                      | ❌ Sem descrição                                                                    | 17            |
| presencas                       | ❌ Sem descrição                                                                    | 7             |
| professor_instrumentos          | ❌ Sem descrição                                                                    | 8             |
| professores                     | ❌ Sem descrição                                                                    | 6             |
| professores_categorias          | ❌ Sem descrição                                                                    | 8             |
| professores_conteudos           | ❌ Sem descrição                                                                    | 21            |


-- ========================================================================
-- 2️⃣ COLUNAS E TIPOS DE DADOS
-- ========================================================================

-- 2.1 Análise detalhada de TODAS as colunas
SELECT 
    c.table_name,
    c.column_name,
    c.data_type,
    c.character_maximum_length,
    c.is_nullable,
    c.column_default,
    CASE 
        WHEN c.column_name LIKE '%_id' THEN '🔑 Chave/Referência'
        WHEN c.column_name IN ('created_at', 'updated_at') THEN '⏰ Timestamp'
        WHEN c.data_type IN ('boolean') THEN '✅ Flag'
        WHEN c.data_type LIKE '%json%' THEN '📋 JSON'
        WHEN c.data_type IN ('uuid') THEN '🆔 UUID'
        ELSE '📝 Dado'
    END as tipo_funcional
FROM information_schema.columns c
WHERE c.table_schema = 'public'
ORDER BY c.table_name, c.ordinal_position;

| table_name                      | column_name              | data_type                   | character_maximum_length | is_nullable | column_default    | tipo_funcional      |
| ------------------------------- | ------------------------ | --------------------------- | ------------------------ | ----------- | ----------------- | ------------------- |
| achievements                    | id                       | uuid                        | null                     | NO          | gen_random_uuid() | 🆔 UUID             |
| achievements                    | name                     | text                        | null                     | NO          | null              | 📝 Dado             |
| achievements                    | description              | text                        | null                     | YES         | null              | 📝 Dado             |
| achievements                    | badge_icon               | text                        | null                     | YES         | null              | 📝 Dado             |
| achievements                    | badge_color              | text                        | null                     | YES         | '#E53E3E'::text   | 📝 Dado             |
| achievements                    | points_reward            | integer                     | null                     | YES         | 0                 | 📝 Dado             |
| achievements                    | category                 | text                        | null                     | YES         | null              | 📝 Dado             |
| achievements                    | requirement_type         | text                        | null                     | YES         | null              | 📝 Dado             |
| achievements                    | requirement_value        | integer                     | null                     | YES         | null              | 📝 Dado             |
| achievements                    | is_active                | boolean                     | null                     | YES         | true              | ✅ Flag              |
| achievements                    | created_at               | timestamp with time zone    | null                     | YES         | now()             | ⏰ Timestamp         |
| achievements_educacionais       | id                       | uuid                        | null                     | NO          | gen_random_uuid() | 🆔 UUID             |
| achievements_educacionais       | nome                     | text                        | null                     | NO          | null              | 📝 Dado             |
| achievements_educacionais       | descricao                | text                        | null                     | YES         | null              | 📝 Dado             |
| achievements_educacionais       | icone                    | text                        | null                     | YES         | null              | 📝 Dado             |
| achievements_educacionais       | categoria                | text                        | null                     | YES         | null              | 📝 Dado             |
| achievements_educacionais       | tipo_criterio            | text                        | null                     | YES         | null              | 📝 Dado             |
| achievements_educacionais       | meta_necessaria          | integer                     | null                     | YES         | null              | 📝 Dado             |
| achievements_educacionais       | pontos_recompensa        | integer                     | null                     | YES         | 10                | 📝 Dado             |
| achievements_educacionais       | created_at               | timestamp without time zone | null                     | YES         | now()             | ⏰ Timestamp         |
| achievements_educacionais       | ativo                    | boolean                     | null                     | YES         | true              | ✅ Flag              |
| achievements_progress           | id                       | uuid                        | null                     | NO          | gen_random_uuid() | 🆔 UUID             |
| achievements_progress           | user_id                  | uuid                        | null                     | YES         | null              | 🔑 Chave/Referência |
| achievements_progress           | achievement_id           | uuid                        | null                     | YES         | null              | 🔑 Chave/Referência |
| achievements_progress           | current_progress         | integer                     | null                     | YES         | 0                 | 📝 Dado             |
| achievements_progress           | target_progress          | integer                     | null                     | NO          | null              | 📝 Dado             |
| achievements_progress           | is_completed             | boolean                     | null                     | YES         | false             | ✅ Flag              |
| achievements_progress           | completed_at             | timestamp with time zone    | null                     | YES         | null              | 📝 Dado             |
| achievements_progress           | metadata                 | jsonb                       | null                     | YES         | '{}'::jsonb       | 📋 JSON             |
| achievements_progress           | created_at               | timestamp with time zone    | null                     | YES         | now()             | ⏰ Timestamp         |
| achievements_progress           | updated_at               | timestamp with time zone    | null                     | YES         | now()             | ⏰ Timestamp         |
| adaptacoes_espacos_alternativos | id                       | uuid                        | null                     | NO          | gen_random_uuid() | 🆔 UUID             |
| adaptacoes_espacos_alternativos | nome_organizacao         | character varying           | 200                      | NO          | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | tipo_organizacao         | character varying           | 100                      | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | endereco_localizacao     | jsonb                       | null                     | YES         | null              | 📋 JSON             |
| adaptacoes_espacos_alternativos | publico_atendido         | character varying           | 200                      | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | faixa_etaria_foco        | character varying           | 50                       | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | metodologias_adaptadas   | ARRAY                       | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | recursos_disponiveis     | jsonb                       | null                     | YES         | null              | 📋 JSON             |
| adaptacoes_espacos_alternativos | limitacoes_estruturais   | ARRAY                       | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | adaptacoes_realizadas    | jsonb                       | null                     | YES         | null              | 📋 JSON             |
| adaptacoes_espacos_alternativos | parcerias_estabelecidas  | ARRAY                       | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | resultados_observados    | text                        | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | desafios_especificos     | ARRAY                       | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | solucoes_criativas       | ARRAY                       | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | impacto_comunitario      | text                        | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | sustentabilidade_projeto | text                        | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | contato_responsavel      | jsonb                       | null                     | YES         | null              | 📋 JSON             |
| adaptacoes_espacos_alternativos | documentacao_processo    | ARRAY                       | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | replicabilidade_modelo   | text                        | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | status_projeto           | character varying           | 20                       | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | data_inicio              | date                        | null                     | YES         | null              | 📝 Dado             |
| adaptacoes_espacos_alternativos | created_at               | timestamp with time zone    | null                     | YES         | now()             | ⏰ Timestamp         |
| adaptacoes_espacos_alternativos | updated_at               | timestamp with time zone    | null                     | YES         | now()             | ⏰ Timestamp         |
| admin_alunos                    | id                       | uuid                        | null                     | YES         | null              | 🆔 UUID             |
| admin_alunos                    | nome                     | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | email                    | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | full_name                | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | phone                    | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | instrumento              | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | nivel                    | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | turma                    | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | data_ingresso            | date                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | ativo                    | boolean                     | null                     | YES         | null              | ✅ Flag              |
| admin_alunos                    | criado_em                | timestamp without time zone | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | last_active              | timestamp with time zone    | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | total_points             | integer                     | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | user_level               | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | current_streak           | integer                     | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | lessons_completed        | integer                     | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | voted_logo               | uuid                        | null                     | YES         | null              | 🆔 UUID             |
| admin_alunos                    | has_voted                | boolean                     | null                     | YES         | null              | ✅ Flag              |
| admin_alunos                    | joined_at                | timestamp with time zone    | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | dob                      | date                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | city                     | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | state                    | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | status_atividade         | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_alunos                    | perfil_completo          | boolean                     | null                     | YES         | null              | ✅ Flag              |
| admin_professores               | id                       | uuid                        | null                     | YES         | null              | 🆔 UUID             |
| admin_professores               | nome                     | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | email                    | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | full_name                | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | phone                    | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | formacao                 | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | biografia                | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | especialidades           | ARRAY                       | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | ativo                    | boolean                     | null                     | YES         | null              | ✅ Flag              |
| admin_professores               | criado_em                | timestamp without time zone | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | last_active              | timestamp with time zone    | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | total_points             | integer                     | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | user_level               | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | current_streak           | integer                     | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | lessons_completed        | integer                     | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | modules_completed        | integer                     | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | joined_at                | timestamp with time zone    | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | status_atividade         | text                        | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | total_turmas             | bigint                      | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | total_alunos             | bigint                      | null                     | YES         | null              | 📝 Dado             |
| admin_professores               | total_conteudos          | bigint                      | null                     | YES         | null              | 📝 Dado             |
| admin_usuarios_completos        | id                       | uuid                        | null                     | YES         | null              | 🆔 UUID             |



-- 2.2 Distribuição de tipos de dados
SELECT 
    data_type,
    COUNT(*) as total_colunas,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentual
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY data_type
ORDER BY total_colunas DESC;


| data_type                   | total_colunas | percentual |
| --------------------------- | ------------- | ---------- |
| text                        | 445           | 23.43      |
| uuid                        | 333           | 17.54      |
| integer                     | 263           | 13.85      |
| character varying           | 232           | 12.22      |
| timestamp with time zone    | 149           | 7.85       |
| ARRAY                       | 101           | 5.32       |
| boolean                     | 95            | 5.00       |
| jsonb                       | 94            | 4.95       |
| timestamp without time zone | 58            | 3.05       |
| bigint                      | 56            | 2.95       |
| date                        | 49            | 2.58       |
| numeric                     | 22            | 1.16       |
| inet                        | 2             | 0.11       |



-- ========================================================================
-- 3️⃣ PRIMARY KEYS E UNIQUE CONSTRAINTS
-- ========================================================================

-- 3.1 Primary Keys de todas as tabelas
SELECT 
    tc.table_name,
    kcu.column_name,
    c.data_type
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN information_schema.columns c
    ON c.table_name = tc.table_name
    AND c.column_name = kcu.column_name
    AND c.table_schema = tc.table_schema
WHERE tc.constraint_type = 'PRIMARY KEY'
    AND tc.table_schema = 'public'
ORDER BY tc.table_name;

| table_name                      | column_name | data_type |
| ------------------------------- | ----------- | --------- |
| achievements                    | id          | uuid      |
| achievements_educacionais       | id          | uuid      |
| achievements_progress           | id          | uuid      |
| adaptacoes_espacos_alternativos | id          | uuid      |
| admins                          | id          | uuid      |
| alpha_aluno_badges              | id          | uuid      |
| alpha_aluno_desafios            | id          | uuid      |
| alpha_aula_progresso            | id          | uuid      |
| alpha_badges                    | id          | uuid      |
| alpha_celebracoes               | id          | uuid      |
| alpha_competencias              | id          | uuid      |
| alpha_desafios                  | id          | uuid      |
| alpha_estudante_badges          | id          | uuid      |
| alpha_mentorias                 | id          | uuid      |
| alpha_metodologias              | id          | uuid      |
| alpha_niveis                    | id          | uuid      |
| alpha_progresso                 | id          | uuid      |
| alpha_progresso_estudante       | id          | uuid      |
| alpha_projetos_coletivos        | id          | uuid      |
| alpha_ranking                   | id          | uuid      |
| alpha_submissoes                | id          | uuid      |
| alpha_xp_historico              | id          | uuid      |
| alunos                          | id          | uuid      |
| audit_activities                | id          | uuid      |
| aula_atividades                 | id          | uuid      |
| aula_avaliacoes                 | id          | uuid      |
| aula_checklist                  | id          | uuid      |
| aula_criterios_avaliacao        | id          | uuid      |
| aula_desafio_alpha              | id          | uuid      |
| aula_desafios                   | id          | uuid      |
| aula_feedback                   | id          | uuid      |
| aula_feedbacks                  | id          | uuid      |
| aula_materiais                  | id          | uuid      |
| aula_permissoes                 | id          | uuid      |
| aula_presencas                  | id          | uuid      |
| aula_registros                  | id          | uuid      |
| aula_status_log                 | id          | uuid      |
| aula_tags                       | id          | uuid      |
| aulas                           | id          | uuid      |
| autoavaliacoes                  | id          | uuid      |
| avaliacoes_rubricas             | id          | uuid      |
| capacitacao_docente             | id          | uuid      |
| cessoes_instrumentos            | id          | uuid      |
| comunicacao_engajamento         | id          | uuid      |
| desafios_alpha                  | id          | uuid      |
| desafios_alpha_respostas        | id          | uuid      |
| devotional_content              | id          | uuid      |
| documentos_institucionais       | id          | uuid      |
| experiencias_brasileiras        | id          | uuid      |
| feedback_pares                  | id          | uuid      |
| forum_likes                     | id          | uuid      |
| forum_perguntas                 | id          | uuid      |
| forum_respostas                 | id          | uuid      |
| historia_compositores           | id          | uuid      |
| historia_conceitos_teoricos     | id          | uuid      |
| historia_contexto_cultural      | id          | uuid      |
| historia_eventos_timeline       | id          | uuid      |
| historia_generos                | id          | uuid      |
| historia_instrumentos_evolucao  | id          | uuid      |
| historia_movimentos             | id          | uuid      |
| historia_movimentos_artisticos  | id          | uuid      |
| historia_obras                  | id          | uuid      |
| historia_periodos               | id          | uuid      |
| historia_playlists              | id          | uuid      |
| historia_progresso_usuario      | id          | uuid      |
| historia_quiz                   | id          | uuid      |
| historia_quiz_respostas         | id          | uuid      |
| historia_timeline               | id          | uuid      |
| historico_instrumentos          | id          | uuid      |
| hook_cache                      | id          | uuid      |
| indicadores_impacto             | id          | uuid      |
| instrumento_curiosidades        | id          | uuid      |
| instrumento_midias              | id          | uuid      |
| instrumento_performances        | id          | uuid      |
| instrumento_quiz                | id          | uuid      |
| instrumento_sons                | id          | uuid      |
| instrumento_sons_variacoes      | id          | uuid      |
| instrumento_tecnicas            | id          | uuid      |
| instrumentos                    | id          | uuid      |
| instrumentos_alunos             | id          | uuid      |
| instrumentos_fisicos            | id          | uuid      |
| instrumentos_relacionados       | id          | uuid      |
| lessons                         | id          | uuid      |
| logos                           | id          | uuid      |
| manutencoes_instrumentos        | id          | uuid      |
| materiais_apoio                 | id          | uuid      |
| matriculas                      | id          | uuid      |
| metodologias_ensino             | id          | uuid      |
| migration_log                   | id          | uuid      |
| modules                         | id          | uuid      |
| modulos                         | id          | uuid      |
| permission_templates            | id          | uuid      |
| permissions                     | id          | bigint    |
| portfolio_evidencias            | id          | uuid      |
| portfolios                      | id          | uuid      |
| presencas                       | id          | uuid      |
| professor_instrumentos          | id          | uuid      |
| professores                     | id          | uuid      |
| professores_categorias          | id          | uuid      |
| professores_conteudos           | id          | uuid      |




-- 3.2 Unique Constraints
SELECT 
    tc.table_name,
    tc.constraint_name,
    string_agg(kcu.column_name, ', ' ORDER BY kcu.ordinal_position) as colunas_unicas
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.constraint_type = 'UNIQUE'
    AND tc.table_schema = 'public'
GROUP BY tc.table_name, tc.constraint_name
ORDER BY tc.table_name;

| table_name                     | constraint_name                                                 | colunas_unicas                          |
| ------------------------------ | --------------------------------------------------------------- | --------------------------------------- |
| achievements_progress          | achievements_progress_user_id_achievement_id_key                | user_id, achievement_id                 |
| alpha_aluno_badges             | alpha_aluno_badges_aluno_id_badge_id_key                        | aluno_id, badge_id                      |
| alpha_aluno_desafios           | alpha_aluno_desafios_aluno_id_desafio_id_key                    | aluno_id, desafio_id                    |
| alpha_aula_progresso           | alpha_aula_progresso_aluno_id_aula_id_key                       | aluno_id, aula_id                       |
| alpha_badges                   | alpha_badges_codigo_key                                         | codigo                                  |
| alpha_desafios                 | alpha_desafios_codigo_key                                       | codigo                                  |
| alpha_estudante_badges         | unique_estudante_badge                                          | estudante_id, badge_id                  |
| alpha_metodologias             | alpha_metodologias_codigo_key                                   | codigo                                  |
| alpha_niveis                   | alpha_niveis_nivel_key                                          | nivel                                   |
| alpha_progresso                | alpha_progresso_user_id_metodologia_id_competencia_id_key       | user_id, metodologia_id, competencia_id |
| alpha_progresso_estudante      | unique_estudante                                                | estudante_id                            |
| alunos                         | aluno_id_unique                                                 | id                                      |
| aula_avaliacoes                | aula_avaliacoes_aula_id_aluno_id_key                            | aula_id, aluno_id                       |
| aula_presencas                 | aula_presencas_aula_id_aluno_id_key                             | aula_id, aluno_id                       |
| forum_likes                    | forum_likes_user_id_resposta_id_key                             | user_id, resposta_id                    |
| historia_generos               | historia_generos_nome_key                                       | nome                                    |
| historia_generos               | historia_generos_slug_key                                       | slug                                    |
| historia_movimentos_artisticos | historia_movimentos_artisticos_nome_key                         | nome                                    |
| historia_progresso_usuario     | historia_progresso_usuario_user_id_tipo_conteudo_conteudo_i_key | user_id, tipo_conteudo, conteudo_id     |
| hook_cache                     | hook_cache_cache_key_key                                        | cache_key                               |
| instrumentos                   | instrumentos_nome_key                                           | nome                                    |
| instrumentos_fisicos           | instrumentos_fisicos_codigo_patrimonio_key                      | codigo_patrimonio                       |
| instrumentos_relacionados      | instrumentos_relacionados_instrumento_id_relacionado_id_key     | instrumento_id, relacionado_id          |
| lessons                        | lessons_module_id_slug_key                                      | module_id, slug                         |
| matriculas                     | matriculas_turma_id_aluno_id_key                                | turma_id, aluno_id                      |
| modules                        | modules_slug_key                                                | slug                                    |
| permission_templates           | permission_templates_name_key                                   | name                                    |
| permissions                    | permissions_name_key                                            | name                                    |
| presencas                      | presencas_matricula_id_data_aula_key                            | matricula_id, data_aula                 |
| professor_instrumentos         | professor_instrumentos_professor_id_instrumento_id_key          | professor_id, instrumento_id            |
| professores                    | professor_id_unique                                             | id                                      |
| professores_categorias         | professores_categorias_nome_key                                 | nome                                    |
| qr_codes                       | qr_codes_code_key                                               | code                                    |
| roles                          | roles_name_key                                                  | name                                    |
| user_achievements              | user_achievements_user_id_achievement_id_key                    | user_id, achievement_id                 |
| user_badges                    | user_badges_user_id_badge_id_key                                | user_id, badge_id                       |
| user_devotional_progress       | user_devotional_progress_user_id_devotional_id_key              | user_id, devotional_id                  |
| user_progress                  | user_progress_user_id_lesson_id_key                             | user_id, lesson_id                      |
| user_roles                     | user_roles_user_id_role_type_key                                | user_id, role_type                      |
| usuarios                       | usuarios_email_key                                              | email                                   |



-- ========================================================================
-- 4️⃣ FOREIGN KEYS E RELACIONAMENTOS
-- ========================================================================

-- 4.1 Todas as Foreign Keys
SELECT 
    tc.table_name as tabela_origem,
    kcu.column_name as coluna_origem,
    ccu.table_name as tabela_destino,
    ccu.column_name as coluna_destino,
    rc.update_rule,
    rc.delete_rule,
    tc.constraint_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage ccu 
    ON ccu.constraint_name = tc.constraint_name
JOIN information_schema.referential_constraints rc
    ON rc.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'public'
ORDER BY tc.table_name, kcu.column_name;



-- 4.2 Mapeamento de relacionamentos (grafo)
SELECT 
    tc.table_name || ' -> ' || ccu.table_name as relacionamento,
    kcu.column_name as via_coluna,
    rc.delete_rule as ao_deletar
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage ccu 
    ON ccu.constraint_name = tc.constraint_name
JOIN information_schema.referential_constraints rc
    ON rc.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'public'
ORDER BY tc.table_name;

| tabela_origem                  | coluna_origem              | tabela_destino        | coluna_destino | update_rule | delete_rule | constraint_name                                     |
| ------------------------------ | -------------------------- | --------------------- | -------------- | ----------- | ----------- | --------------------------------------------------- |
| achievements_progress          | achievement_id             | achievements          | id             | NO ACTION   | CASCADE     | achievements_progress_achievement_id_fkey           |
| achievements_progress          | user_id                    | profiles              | id             | NO ACTION   | CASCADE     | achievements_progress_user_id_fkey                  |
| admins                         | id                         | profiles              | id             | NO ACTION   | CASCADE     | admins_id_fkey                                      |
| alpha_aluno_badges             | aluno_id                   | alunos                | id             | NO ACTION   | CASCADE     | alpha_aluno_badges_aluno_id_fkey                    |
| alpha_aluno_badges             | desafio_origem_id          | alpha_desafios        | id             | NO ACTION   | SET NULL    | alpha_aluno_badges_desafio_origem_id_fkey           |
| alpha_aluno_desafios           | aluno_id                   | alunos                | id             | NO ACTION   | CASCADE     | alpha_aluno_desafios_aluno_id_fkey                  |
| alpha_aluno_desafios           | desafio_id                 | alpha_desafios        | id             | NO ACTION   | CASCADE     | alpha_aluno_desafios_desafio_id_fkey                |
| alpha_aula_progresso           | aluno_id                   | profiles              | id             | NO ACTION   | CASCADE     | alpha_aula_progresso_aluno_id_fkey                  |
| alpha_aula_progresso           | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | alpha_aula_progresso_aula_id_fkey                   |
| alpha_celebracoes              | estudante_id               | profiles              | id             | NO ACTION   | CASCADE     | fk_estudante_celebracao                             |
| alpha_competencias             | metodologia_id             | alpha_metodologias    | id             | NO ACTION   | CASCADE     | alpha_competencias_metodologia_id_fkey              |
| alpha_estudante_badges         | estudante_id               | profiles              | id             | NO ACTION   | CASCADE     | fk_estudante_badge                                  |
| alpha_mentorias                | mentor_id                  | profiles              | id             | NO ACTION   | CASCADE     | fk_mentor                                           |
| alpha_mentorias                | mentorado_id               | profiles              | id             | NO ACTION   | CASCADE     | fk_mentorado                                        |
| alpha_progresso                | competencia_id             | alpha_competencias    | id             | NO ACTION   | CASCADE     | alpha_progresso_competencia_id_fkey                 |
| alpha_progresso                | metodologia_id             | alpha_metodologias    | id             | NO ACTION   | CASCADE     | alpha_progresso_metodologia_id_fkey                 |
| alpha_progresso_estudante      | estudante_id               | profiles              | id             | NO ACTION   | CASCADE     | fk_estudante                                        |
| alpha_projetos_coletivos       | criador_id                 | profiles              | id             | NO ACTION   | CASCADE     | fk_criador_projeto                                  |
| alpha_ranking                  | estudante_id               | profiles              | id             | NO ACTION   | CASCADE     | fk_estudante_ranking                                |
| alpha_xp_historico             | estudante_id               | profiles              | id             | NO ACTION   | CASCADE     | fk_estudante_xp                                     |
| alunos                         | id                         | profiles              | id             | NO ACTION   | CASCADE     | fk_aluno_profile                                    |
| alunos                         | instrumento_id             | instrumentos          | id             | NO ACTION   | NO ACTION   | alunos_instrumento_id_fkey                          |
| alunos                         | turma_principal_id         | turmas                | id             | NO ACTION   | NO ACTION   | alunos_turma_principal_id_fkey                      |
| audit_activities               | user_id                    | profiles              | id             | NO ACTION   | NO ACTION   | audit_activities_user_id_fkey                       |
| aula_atividades                | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_atividades_aula_id_fkey                        |
| aula_avaliacoes                | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_avaliacoes_aula_id_fkey                        |
| aula_checklist                 | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_checklist_aula_id_fkey                         |
| aula_criterios_avaliacao       | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_criterios_avaliacao_aula_id_fkey               |
| aula_desafio_alpha             | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_desafio_alpha_aula_id_fkey                     |
| aula_desafios                  | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_desafios_aula_id_fkey                          |
| aula_feedback                  | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_feedback_aula_id_fkey                          |
| aula_feedback                  | professor_id               | profiles              | id             | NO ACTION   | NO ACTION   | aula_feedback_professor_id_fkey                     |
| aula_feedbacks                 | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_feedbacks_aula_id_fkey                         |
| aula_materiais                 | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_materiais_aula_id_fkey                         |
| aula_permissoes                | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_permissoes_aula_id_fkey                        |
| aula_presencas                 | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_presencas_aula_id_fkey                         |
| aula_registros                 | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_registros_aula_id_fkey                         |
| aula_status_log                | alterado_por               | profiles              | id             | NO ACTION   | NO ACTION   | aula_status_log_alterado_por_fkey                   |
| aula_status_log                | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_status_log_aula_id_fkey                        |
| aula_tags                      | aula_id                    | aulas                 | id             | NO ACTION   | CASCADE     | aula_tags_aula_id_fkey                              |
| aulas                          | responsavel_id             | professores           | id             | NO ACTION   | SET NULL    | aulas_responsavel_id_fkey                           |
| autoavaliacoes                 | portfolio_id               | portfolios            | id             | NO ACTION   | CASCADE     | autoavaliacoes_portfolio_id_fkey                    |
| avaliacoes_rubricas            | evidencia_id               | portfolio_evidencias  | id             | NO ACTION   | CASCADE     | avaliacoes_rubricas_evidencia_id_fkey               |
| cessoes_instrumentos           | aluno_id                   | alunos                | id             | NO ACTION   | NO ACTION   | cessoes_instrumentos_aluno_id_fkey                  |
| cessoes_instrumentos           | instrumento_fisico_id      | instrumentos_fisicos  | id             | NO ACTION   | NO ACTION   | cessoes_instrumentos_instrumento_fisico_id_fkey     |
| cessoes_instrumentos           | responsavel_devolucao      | professores           | id             | NO ACTION   | NO ACTION   | cessoes_instrumentos_responsavel_devolucao_fkey     |
| cessoes_instrumentos           | responsavel_entrega        | professores           | id             | NO ACTION   | NO ACTION   | cessoes_instrumentos_responsavel_entrega_fkey       |
| desafios_alpha                 | modulo_relacionado_id      | modulos               | id             | NO ACTION   | NO ACTION   | desafios_alpha_modulo_relacionado_id_fkey           |
| desafios_alpha_respostas       | aluno_id                   | profiles              | id             | NO ACTION   | NO ACTION   | desafios_alpha_respostas_aluno_id_fkey              |
| desafios_alpha_respostas       | desafio_id                 | desafios_alpha        | id             | NO ACTION   | CASCADE     | desafios_alpha_respostas_desafio_id_fkey            |
| feedback_pares                 | evidencia_id               | portfolio_evidencias  | id             | NO ACTION   | CASCADE     | feedback_pares_evidencia_id_fkey                    |
| forum_likes                    | resposta_id                | forum_respostas       | id             | NO ACTION   | CASCADE     | forum_likes_resposta_id_fkey                        |
| forum_likes                    | user_id                    | profiles              | id             | NO ACTION   | NO ACTION   | forum_likes_user_id_fkey                            |
| forum_perguntas                | aluno_id                   | profiles              | id             | NO ACTION   | NO ACTION   | forum_perguntas_aluno_id_fkey                       |
| forum_perguntas                | modulo_id                  | modulos               | id             | NO ACTION   | NO ACTION   | forum_perguntas_modulo_id_fkey                      |
| forum_respostas                | pergunta_id                | forum_perguntas       | id             | NO ACTION   | CASCADE     | forum_respostas_pergunta_id_fkey                    |
| forum_respostas                | resposta_de_id             | profiles              | id             | NO ACTION   | NO ACTION   | forum_respostas_resposta_de_id_fkey                 |
| historia_compositores          | periodo_id                 | historia_periodos     | id             | NO ACTION   | NO ACTION   | historia_compositores_periodo_id_fkey               |
| historia_conceitos_teoricos    | periodo_origem_id          | historia_periodos     | id             | NO ACTION   | NO ACTION   | historia_conceitos_teoricos_periodo_origem_id_fkey  |
| historia_contexto_cultural     | periodo_id                 | historia_periodos     | id             | NO ACTION   | NO ACTION   | historia_contexto_cultural_periodo_id_fkey          |
| historia_eventos_timeline      | compositor_id              | historia_compositores | id             | NO ACTION   | NO ACTION   | historia_eventos_timeline_compositor_id_fkey        |
| historia_eventos_timeline      | obra_id                    | historia_obras        | id             | NO ACTION   | NO ACTION   | historia_eventos_timeline_obra_id_fkey              |
| historia_eventos_timeline      | periodo_id                 | historia_periodos     | id             | NO ACTION   | NO ACTION   | historia_eventos_timeline_periodo_id_fkey           |
| historia_generos               | periodo_origem_id          | historia_periodos     | id             | NO ACTION   | NO ACTION   | historia_generos_periodo_origem_id_fkey             |
| historia_instrumentos_evolucao | instrumento_id             | instrumentos          | id             | NO ACTION   | NO ACTION   | historia_instrumentos_evolucao_instrumento_id_fkey  |
| historia_instrumentos_evolucao | periodo_id                 | historia_periodos     | id             | NO ACTION   | NO ACTION   | historia_instrumentos_evolucao_periodo_id_fkey      |
| historia_obras                 | compositor_id              | historia_compositores | id             | NO ACTION   | NO ACTION   | historia_obras_compositor_id_fkey                   |
| historia_obras                 | periodo_id                 | historia_periodos     | id             | NO ACTION   | NO ACTION   | historia_obras_periodo_id_fkey                      |
| historia_playlists             | criador_id                 | profiles              | id             | NO ACTION   | NO ACTION   | historia_playlists_criador_id_fkey                  |
| historia_playlists             | periodo_id                 | historia_periodos     | id             | NO ACTION   | NO ACTION   | historia_playlists_periodo_id_fkey                  |
| historia_progresso_usuario     | user_id                    | profiles              | id             | NO ACTION   | CASCADE     | historia_progresso_usuario_user_id_fkey             |
| historia_quiz                  | periodo_id                 | historia_periodos     | id             | NO ACTION   | NO ACTION   | historia_quiz_periodo_id_fkey                       |
| historia_quiz_respostas        | quiz_id                    | historia_quiz         | id             | NO ACTION   | CASCADE     | historia_quiz_respostas_quiz_id_fkey                |
| historia_quiz_respostas        | user_id                    | profiles              | id             | NO ACTION   | CASCADE     | historia_quiz_respostas_user_id_fkey                |
| historia_timeline              | compositor_id              | historia_compositores | id             | NO ACTION   | SET NULL    | historia_timeline_compositor_id_fkey                |
| historia_timeline              | obra_id                    | historia_obras        | id             | NO ACTION   | SET NULL    | historia_timeline_obra_id_fkey                      |
| historia_timeline              | periodo_id                 | historia_periodos     | id             | NO ACTION   | SET NULL    | historia_timeline_periodo_id_fkey                   |
| historico_instrumentos         | aluno_afetado_id           | alunos                | id             | NO ACTION   | NO ACTION   | historico_instrumentos_aluno_afetado_id_fkey        |
| historico_instrumentos         | instrumento_fisico_id      | instrumentos_fisicos  | id             | NO ACTION   | NO ACTION   | historico_instrumentos_instrumento_fisico_id_fkey   |
| hook_cache                     | user_id                    | profiles              | id             | NO ACTION   | NO ACTION   | hook_cache_user_id_fkey                             |
| instrumento_curiosidades       | instrumento_id             | instrumentos          | id             | NO ACTION   | CASCADE     | instrumento_curiosidades_instrumento_id_fkey        |
| instrumento_midias             | instrumento_id             | instrumentos          | id             | NO ACTION   | CASCADE     | instrumento_midias_instrumento_id_fkey              |
| instrumento_performances       | instrumento_id             | instrumentos          | id             | NO ACTION   | CASCADE     | instrumento_performances_instrumento_id_fkey        |
| instrumento_quiz               | instrumento_id             | instrumentos          | id             | NO ACTION   | CASCADE     | instrumento_quiz_instrumento_id_fkey                |
| instrumento_sons               | instrumento_id             | instrumentos          | id             | NO ACTION   | CASCADE     | instrumento_sons_instrumento_id_fkey                |
| instrumento_sons_variacoes     | som_id                     | instrumento_sons      | id             | NO ACTION   | CASCADE     | instrumento_sons_variacoes_som_id_fkey              |
| instrumento_tecnicas           | instrumento_id             | instrumentos          | id             | NO ACTION   | CASCADE     | instrumento_tecnicas_instrumento_id_fkey            |
| instrumentos_alunos            | aluno_id                   | alunos                | id             | NO ACTION   | NO ACTION   | instrumentos_alunos_aluno_id_fkey                   |
| instrumentos_alunos            | instrumento_id             | instrumentos          | id             | NO ACTION   | NO ACTION   | instrumentos_alunos_instrumento_id_fkey             |
| instrumentos_fisicos           | instrumento_id             | instrumentos          | id             | NO ACTION   | NO ACTION   | instrumentos_fisicos_instrumento_id_fkey            |
| instrumentos_relacionados      | instrumento_id             | instrumentos          | id             | NO ACTION   | CASCADE     | instrumentos_relacionados_instrumento_id_fkey       |
| instrumentos_relacionados      | relacionado_id             | instrumentos          | id             | NO ACTION   | CASCADE     | instrumentos_relacionados_relacionado_id_fkey       |
| lessons                        | module_id                  | modules               | id             | NO ACTION   | CASCADE     | lessons_module_id_fkey                              |
| lessons                        | professor_responsavel_id   | profiles              | id             | NO ACTION   | NO ACTION   | lessons_professor_responsavel_id_fkey               |
| manutencoes_instrumentos       | instrumento_fisico_id      | instrumentos_fisicos  | id             | NO ACTION   | NO ACTION   | manutencoes_instrumentos_instrumento_fisico_id_fkey |
| materiais_apoio                | instrumento_relacionado_id | instrumentos          | id             | NO ACTION   | NO ACTION   | materiais_apoio_instrumento_relacionado_id_fkey     |
| materiais_apoio                | metodologia_relacionada_id | metodologias_ensino   | id             | NO ACTION   | NO ACTION   | materiais_apoio_metodologia_relacionada_id_fkey     |
| materiais_apoio                | modulo_relacionado_id      | modulos               | id             | NO ACTION   | NO ACTION   | materiais_apoio_modulo_relacionado_id_fkey          |
| matriculas                     | aluno_id                   | alunos                | id             | NO ACTION   | CASCADE     | matriculas_aluno_id_fkey                            |
| matriculas                     | turma_id                   | turmas                | id             | NO ACTION   | CASCADE     | matriculas_turma_id_fkey                            |



-- 4.3 Tabelas sem foreign keys (isoladas)
SELECT DISTINCT t.table_name
FROM information_schema.tables t
WHERE t.table_schema = 'public'
    AND t.table_type = 'BASE TABLE'
    AND t.table_name NOT IN (
        SELECT DISTINCT tc.table_name
        FROM information_schema.table_constraints tc
        WHERE tc.constraint_type = 'FOREIGN KEY'
            AND tc.table_schema = 'public'
    )
ORDER BY t.table_name;

| table_name                      |
| ------------------------------- |
| achievements                    |
| achievements_educacionais       |
| adaptacoes_espacos_alternativos |
| alpha_badges                    |
| alpha_desafios                  |
| alpha_metodologias              |
| alpha_niveis                    |
| comunicacao_engajamento         |
| devotional_content              |
| documentos_institucionais       |
| experiencias_brasileiras        |
| historia_movimentos             |
| historia_movimentos_artisticos  |
| historia_periodos               |
| instrumentos                    |
| logos                           |
| metodologias_ensino             |
| migration_log                   |
| modules                         |
| modulos                         |
| permission_templates            |
| permissions                     |
| professores_categorias          |
| profiles                        |
| referenciais_internacionais     |
| roles                           |
| trigger_logs                    |
| usuarios                        |



-- ========================================================================
-- 5️⃣ ÍNDICES
-- ========================================================================

-- 5.1 Todos os índices
SELECT 
    schemaname,
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename, indexname;

| schemaname | tablename                       | indexname                                                 | indexdef                                                                                                                                                      |
| ---------- | ------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| public     | achievements                    | achievements_pkey                                         | CREATE UNIQUE INDEX achievements_pkey ON public.achievements USING btree (id)                                                                                 |
| public     | achievements                    | idx_achievements_active                                   | CREATE INDEX idx_achievements_active ON public.achievements USING btree (is_active)                                                                           |
| public     | achievements                    | idx_achievements_category                                 | CREATE INDEX idx_achievements_category ON public.achievements USING btree (category)                                                                          |
| public     | achievements                    | idx_achievements_is_active                                | CREATE INDEX idx_achievements_is_active ON public.achievements USING btree (is_active) WHERE (is_active = true)                                               |
| public     | achievements                    | idx_achievements_requirement_type                         | CREATE INDEX idx_achievements_requirement_type ON public.achievements USING btree (requirement_type)                                                          |
| public     | achievements_educacionais       | achievements_educacionais_pkey                            | CREATE UNIQUE INDEX achievements_educacionais_pkey ON public.achievements_educacionais USING btree (id)                                                       |
| public     | achievements_progress           | achievements_progress_pkey                                | CREATE UNIQUE INDEX achievements_progress_pkey ON public.achievements_progress USING btree (id)                                                               |
| public     | achievements_progress           | achievements_progress_user_id_achievement_id_key          | CREATE UNIQUE INDEX achievements_progress_user_id_achievement_id_key ON public.achievements_progress USING btree (user_id, achievement_id)                    |
| public     | achievements_progress           | idx_achievement_progress                                  | CREATE INDEX idx_achievement_progress ON public.achievements_progress USING btree (user_id, is_completed, updated_at DESC)                                    |
| public     | achievements_progress           | idx_achievements_progress_user_id                         | CREATE INDEX idx_achievements_progress_user_id ON public.achievements_progress USING btree (user_id)                                                          |
| public     | adaptacoes_espacos_alternativos | adaptacoes_espacos_alternativos_pkey                      | CREATE UNIQUE INDEX adaptacoes_espacos_alternativos_pkey ON public.adaptacoes_espacos_alternativos USING btree (id)                                           |
| public     | admins                          | admins_pkey                                               | CREATE UNIQUE INDEX admins_pkey ON public.admins USING btree (id)                                                                                             |
| public     | alpha_aluno_badges              | alpha_aluno_badges_aluno_id_badge_id_key                  | CREATE UNIQUE INDEX alpha_aluno_badges_aluno_id_badge_id_key ON public.alpha_aluno_badges USING btree (aluno_id, badge_id)                                    |
| public     | alpha_aluno_badges              | alpha_aluno_badges_pkey                                   | CREATE UNIQUE INDEX alpha_aluno_badges_pkey ON public.alpha_aluno_badges USING btree (id)                                                                     |
| public     | alpha_aluno_badges              | idx_alpha_aluno_badges_aluno                              | CREATE INDEX idx_alpha_aluno_badges_aluno ON public.alpha_aluno_badges USING btree (aluno_id)                                                                 |
| public     | alpha_aluno_badges              | idx_alpha_aluno_badges_aluno_id                           | CREATE INDEX idx_alpha_aluno_badges_aluno_id ON public.alpha_aluno_badges USING btree (aluno_id)                                                              |
| public     | alpha_aluno_badges              | idx_alpha_aluno_badges_badge                              | CREATE INDEX idx_alpha_aluno_badges_badge ON public.alpha_aluno_badges USING btree (badge_id)                                                                 |
| public     | alpha_aluno_badges              | idx_alpha_aluno_badges_badge_id                           | CREATE INDEX idx_alpha_aluno_badges_badge_id ON public.alpha_aluno_badges USING btree (badge_id)                                                              |
| public     | alpha_aluno_badges              | idx_alpha_aluno_badges_data                               | CREATE INDEX idx_alpha_aluno_badges_data ON public.alpha_aluno_badges USING btree (data_obtencao DESC)                                                        |
| public     | alpha_aluno_badges              | idx_alpha_aluno_badges_destacada                          | CREATE INDEX idx_alpha_aluno_badges_destacada ON public.alpha_aluno_badges USING btree (destacada)                                                            |
| public     | alpha_aluno_desafios            | alpha_aluno_desafios_aluno_id_desafio_id_key              | CREATE UNIQUE INDEX alpha_aluno_desafios_aluno_id_desafio_id_key ON public.alpha_aluno_desafios USING btree (aluno_id, desafio_id)                            |
| public     | alpha_aluno_desafios            | alpha_aluno_desafios_pkey                                 | CREATE UNIQUE INDEX alpha_aluno_desafios_pkey ON public.alpha_aluno_desafios USING btree (id)                                                                 |
| public     | alpha_aluno_desafios            | idx_alpha_aluno_desafios_aluno                            | CREATE INDEX idx_alpha_aluno_desafios_aluno ON public.alpha_aluno_desafios USING btree (aluno_id)                                                             |
| public     | alpha_aluno_desafios            | idx_alpha_aluno_desafios_aluno_id                         | CREATE INDEX idx_alpha_aluno_desafios_aluno_id ON public.alpha_aluno_desafios USING btree (aluno_id)                                                          |
| public     | alpha_aluno_desafios            | idx_alpha_aluno_desafios_desafio                          | CREATE INDEX idx_alpha_aluno_desafios_desafio ON public.alpha_aluno_desafios USING btree (desafio_id)                                                         |
| public     | alpha_aluno_desafios            | idx_alpha_aluno_desafios_desafio_id                       | CREATE INDEX idx_alpha_aluno_desafios_desafio_id ON public.alpha_aluno_desafios USING btree (desafio_id)                                                      |
| public     | alpha_aluno_desafios            | idx_alpha_aluno_desafios_status                           | CREATE INDEX idx_alpha_aluno_desafios_status ON public.alpha_aluno_desafios USING btree (status)                                                              |
| public     | alpha_aula_progresso            | alpha_aula_progresso_aluno_id_aula_id_key                 | CREATE UNIQUE INDEX alpha_aula_progresso_aluno_id_aula_id_key ON public.alpha_aula_progresso USING btree (aluno_id, aula_id)                                  |
| public     | alpha_aula_progresso            | alpha_aula_progresso_pkey                                 | CREATE UNIQUE INDEX alpha_aula_progresso_pkey ON public.alpha_aula_progresso USING btree (id)                                                                 |
| public     | alpha_aula_progresso            | idx_alpha_aula_progresso_aluno_id                         | CREATE INDEX idx_alpha_aula_progresso_aluno_id ON public.alpha_aula_progresso USING btree (aluno_id)                                                          |
| public     | alpha_aula_progresso            | idx_alpha_aula_progresso_aluno_status                     | CREATE INDEX idx_alpha_aula_progresso_aluno_status ON public.alpha_aula_progresso USING btree (aluno_id, status)                                              |
| public     | alpha_aula_progresso            | idx_alpha_aula_progresso_aula_id                          | CREATE INDEX idx_alpha_aula_progresso_aula_id ON public.alpha_aula_progresso USING btree (aula_id)                                                            |
| public     | alpha_aula_progresso            | idx_alpha_aula_progresso_status                           | CREATE INDEX idx_alpha_aula_progresso_status ON public.alpha_aula_progresso USING btree (status)                                                              |
| public     | alpha_badges                    | alpha_badges_codigo_key                                   | CREATE UNIQUE INDEX alpha_badges_codigo_key ON public.alpha_badges USING btree (codigo)                                                                       |
| public     | alpha_badges                    | alpha_badges_pkey                                         | CREATE UNIQUE INDEX alpha_badges_pkey ON public.alpha_badges USING btree (id)                                                                                 |
| public     | alpha_badges                    | idx_alpha_badges_ativo                                    | CREATE INDEX idx_alpha_badges_ativo ON public.alpha_badges USING btree (ativo) WHERE (ativo = true)                                                           |
| public     | alpha_badges                    | idx_alpha_badges_categoria                                | CREATE INDEX idx_alpha_badges_categoria ON public.alpha_badges USING btree (categoria)                                                                        |
| public     | alpha_badges                    | idx_alpha_badges_raridade                                 | CREATE INDEX idx_alpha_badges_raridade ON public.alpha_badges USING btree (raridade)                                                                          |
| public     | alpha_badges                    | idx_badges_categoria                                      | CREATE INDEX idx_badges_categoria ON public.alpha_badges USING btree (categoria)                                                                              |
| public     | alpha_badges                    | idx_badges_pilar                                          | CREATE INDEX idx_badges_pilar ON public.alpha_badges USING btree (pilar_alpha)                                                                                |
| public     | alpha_badges                    | idx_badges_raridade                                       | CREATE INDEX idx_badges_raridade ON public.alpha_badges USING btree (raridade)                                                                                |
| public     | alpha_badges                    | idx_badges_secreto                                        | CREATE INDEX idx_badges_secreto ON public.alpha_badges USING btree (secreto) WHERE (secreto = true)                                                           |
| public     | alpha_celebracoes               | alpha_celebracoes_pkey                                    | CREATE UNIQUE INDEX alpha_celebracoes_pkey ON public.alpha_celebracoes USING btree (id)                                                                       |
| public     | alpha_celebracoes               | idx_alpha_celebracoes_aluno_id                            | CREATE INDEX idx_alpha_celebracoes_aluno_id ON public.alpha_celebracoes USING btree (aluno_id)                                                                |
| public     | alpha_celebracoes               | idx_alpha_celebracoes_created_at                          | CREATE INDEX idx_alpha_celebracoes_created_at ON public.alpha_celebracoes USING btree (created_at DESC)                                                       |
| public     | alpha_celebracoes               | idx_alpha_celebracoes_estudante_id                        | CREATE INDEX idx_alpha_celebracoes_estudante_id ON public.alpha_celebracoes USING btree (estudante_id)                                                        |
| public     | alpha_celebracoes               | idx_alpha_celebracoes_tipo                                | CREATE INDEX idx_alpha_celebracoes_tipo ON public.alpha_celebracoes USING btree (tipo)                                                                        |
| public     | alpha_celebracoes               | idx_celebracoes_data                                      | CREATE INDEX idx_celebracoes_data ON public.alpha_celebracoes USING btree (created_at DESC)                                                                   |
| public     | alpha_celebracoes               | idx_celebracoes_publico                                   | CREATE INDEX idx_celebracoes_publico ON public.alpha_celebracoes USING btree (publico) WHERE (publico = true)                                                 |
| public     | alpha_competencias              | alpha_competencias_pkey                                   | CREATE UNIQUE INDEX alpha_competencias_pkey ON public.alpha_competencias USING btree (id)                                                                     |
| public     | alpha_competencias              | idx_alpha_competencias_ativo                              | CREATE INDEX idx_alpha_competencias_ativo ON public.alpha_competencias USING btree (ativo) WHERE (ativo = true)                                               |
| public     | alpha_competencias              | idx_alpha_competencias_metodologia                        | CREATE INDEX idx_alpha_competencias_metodologia ON public.alpha_competencias USING btree (metodologia_id)                                                     |
| public     | alpha_competencias              | idx_alpha_competencias_metodologia_id                     | CREATE INDEX idx_alpha_competencias_metodologia_id ON public.alpha_competencias USING btree (metodologia_id)                                                  |
| public     | alpha_desafios                  | alpha_desafios_codigo_key                                 | CREATE UNIQUE INDEX alpha_desafios_codigo_key ON public.alpha_desafios USING btree (codigo)                                                                   |
| public     | alpha_desafios                  | alpha_desafios_pkey                                       | CREATE UNIQUE INDEX alpha_desafios_pkey ON public.alpha_desafios USING btree (id)                                                                             |
| public     | alpha_desafios                  | idx_alpha_desafios_ativo                                  | CREATE INDEX idx_alpha_desafios_ativo ON public.alpha_desafios USING btree (ativo)                                                                            |
| public     | alpha_desafios                  | idx_alpha_desafios_categoria                              | CREATE INDEX idx_alpha_desafios_categoria ON public.alpha_desafios USING btree (categoria)                                                                    |
| public     | alpha_desafios                  | idx_alpha_desafios_codigo                                 | CREATE INDEX idx_alpha_desafios_codigo ON public.alpha_desafios USING btree (codigo)                                                                          |
| public     | alpha_desafios                  | idx_alpha_desafios_datas                                  | CREATE INDEX idx_alpha_desafios_datas ON public.alpha_desafios USING btree (data_inicio, data_fim)                                                            |
| public     | alpha_desafios                  | idx_alpha_desafios_tipo                                   | CREATE INDEX idx_alpha_desafios_tipo ON public.alpha_desafios USING btree (tipo)                                                                              |
| public     | alpha_estudante_badges          | alpha_estudante_badges_pkey                               | CREATE UNIQUE INDEX alpha_estudante_badges_pkey ON public.alpha_estudante_badges USING btree (id)                                                             |
| public     | alpha_estudante_badges          | unique_estudante_badge                                    | CREATE UNIQUE INDEX unique_estudante_badge ON public.alpha_estudante_badges USING btree (estudante_id, badge_id)                                              |
| public     | alpha_mentorias                 | alpha_mentorias_pkey                                      | CREATE UNIQUE INDEX alpha_mentorias_pkey ON public.alpha_mentorias USING btree (id)                                                                           |
| public     | alpha_metodologias              | alpha_metodologias_codigo_key                             | CREATE UNIQUE INDEX alpha_metodologias_codigo_key ON public.alpha_metodologias USING btree (codigo)                                                           |
| public     | alpha_metodologias              | alpha_metodologias_pkey                                   | CREATE UNIQUE INDEX alpha_metodologias_pkey ON public.alpha_metodologias USING btree (id)                                                                     |
| public     | alpha_metodologias              | idx_alpha_metodologias_ativo                              | CREATE INDEX idx_alpha_metodologias_ativo ON public.alpha_metodologias USING btree (ativo) WHERE (ativo = true)                                               |
| public     | alpha_metodologias              | idx_alpha_metodologias_codigo                             | CREATE INDEX idx_alpha_metodologias_codigo ON public.alpha_metodologias USING btree (codigo)                                                                  |
| public     | alpha_niveis                    | alpha_niveis_nivel_key                                    | CREATE UNIQUE INDEX alpha_niveis_nivel_key ON public.alpha_niveis USING btree (nivel)                                                                         |
| public     | alpha_niveis                    | alpha_niveis_pkey                                         | CREATE UNIQUE INDEX alpha_niveis_pkey ON public.alpha_niveis USING btree (id)                                                                                 |
| public     | alpha_progresso                 | alpha_progresso_pkey                                      | CREATE UNIQUE INDEX alpha_progresso_pkey ON public.alpha_progresso USING btree (id)                                                                           |
| public     | alpha_progresso                 | alpha_progresso_user_id_metodologia_id_competencia_id_key | CREATE UNIQUE INDEX alpha_progresso_user_id_metodologia_id_competencia_id_key ON public.alpha_progresso USING btree (user_id, metodologia_id, competencia_id) |
| public     | alpha_progresso                 | idx_alpha_progresso_user                                  | CREATE INDEX idx_alpha_progresso_user ON public.alpha_progresso USING btree (user_id)                                                                         |
| public     | alpha_progresso_estudante       | alpha_progresso_estudante_pkey                            | CREATE UNIQUE INDEX alpha_progresso_estudante_pkey ON public.alpha_progresso_estudante USING btree (id)                                                       |
| public     | alpha_progresso_estudante       | unique_estudante                                          | CREATE UNIQUE INDEX unique_estudante ON public.alpha_progresso_estudante USING btree (estudante_id)                                                           |
| public     | alpha_projetos_coletivos        | alpha_projetos_coletivos_pkey                             | CREATE UNIQUE INDEX alpha_projetos_coletivos_pkey ON public.alpha_projetos_coletivos USING btree (id)                                                         |
| public     | alpha_ranking                   | alpha_ranking_pkey                                        | CREATE UNIQUE INDEX alpha_ranking_pkey ON public.alpha_ranking USING btree (id)                                                                               |
| public     | alpha_ranking                   | idx_alpha_ranking_aluno_id                                | CREATE INDEX idx_alpha_ranking_aluno_id ON public.alpha_ranking USING btree (aluno_id)                                                                        |
| public     | alpha_ranking                   | idx_alpha_ranking_estudante_id                            | CREATE INDEX idx_alpha_ranking_estudante_id ON public.alpha_ranking USING btree (estudante_id)                                                                |
| public     | alpha_ranking                   | idx_alpha_ranking_posicao                                 | CREATE INDEX idx_alpha_ranking_posicao ON public.alpha_ranking USING btree (posicao)                                                                          |
| public     | alpha_ranking                   | idx_alpha_ranking_turma_id                                | CREATE INDEX idx_alpha_ranking_turma_id ON public.alpha_ranking USING btree (turma_id)                                                                        |
| public     | alpha_ranking                   | idx_ranking_estudante                                     | CREATE INDEX idx_ranking_estudante ON public.alpha_ranking USING btree (estudante_id)                                                                         |
| public     | alpha_ranking                   | idx_ranking_periodo                                       | CREATE INDEX idx_ranking_periodo ON public.alpha_ranking USING btree (periodo, data_fim DESC)                                                                 |
| public     | alpha_ranking                   | idx_ranking_posicao                                       | CREATE INDEX idx_ranking_posicao ON public.alpha_ranking USING btree (posicao)                                                                                |
| public     | alpha_submissoes                | alpha_submissoes_pkey                                     | CREATE UNIQUE INDEX alpha_submissoes_pkey ON public.alpha_submissoes USING btree (id)                                                                         |
| public     | alpha_submissoes                | idx_alpha_submissoes_aluno_id                             | CREATE INDEX idx_alpha_submissoes_aluno_id ON public.alpha_submissoes USING btree (aluno_id)                                                                  |
| public     | alpha_submissoes                | idx_alpha_submissoes_data                                 | CREATE INDEX idx_alpha_submissoes_data ON public.alpha_submissoes USING btree (data_submissao DESC)                                                           |
| public     | alpha_submissoes                | idx_alpha_submissoes_desafio                              | CREATE INDEX idx_alpha_submissoes_desafio ON public.alpha_submissoes USING btree (desafio_id)                                                                 |
| public     | alpha_submissoes                | idx_alpha_submissoes_desafio_id                           | CREATE INDEX idx_alpha_submissoes_desafio_id ON public.alpha_submissoes USING btree (desafio_id)                                                              |
| public     | alpha_submissoes                | idx_alpha_submissoes_status                               | CREATE INDEX idx_alpha_submissoes_status ON public.alpha_submissoes USING btree (status)                                                                      |
| public     | alpha_submissoes                | idx_alpha_submissoes_user                                 | CREATE INDEX idx_alpha_submissoes_user ON public.alpha_submissoes USING btree (user_id)                                                                       |
| public     | alpha_submissoes                | idx_alpha_submissoes_user_id                              | CREATE INDEX idx_alpha_submissoes_user_id ON public.alpha_submissoes USING btree (user_id)                                                                    |
| public     | alpha_xp_historico              | alpha_xp_historico_pkey                                   | CREATE UNIQUE INDEX alpha_xp_historico_pkey ON public.alpha_xp_historico USING btree (id)                                                                     |
| public     | alpha_xp_historico              | idx_alpha_xp_historico_aluno_id                           | CREATE INDEX idx_alpha_xp_historico_aluno_id ON public.alpha_xp_historico USING btree (aluno_id)                                                              |
| public     | alpha_xp_historico              | idx_alpha_xp_historico_data                               | CREATE INDEX idx_alpha_xp_historico_data ON public.alpha_xp_historico USING btree (created_at DESC)                                                           |
| public     | alpha_xp_historico              | idx_alpha_xp_historico_estudante_id                       | CREATE INDEX idx_alpha_xp_historico_estudante_id ON public.alpha_xp_historico USING btree (estudante_id)                                                      |
| public     | alpha_xp_historico              | idx_xp_historico_data                                     | CREATE INDEX idx_xp_historico_data ON public.alpha_xp_historico USING btree (created_at DESC)                                                                 |
| public     | alpha_xp_historico              | idx_xp_historico_estudante                                | CREATE INDEX idx_xp_historico_estudante ON public.alpha_xp_historico USING btree (estudante_id)                                                               |
| public     | alpha_xp_historico              | idx_xp_historico_level_up                                 | CREATE INDEX idx_xp_historico_level_up ON public.alpha_xp_historico USING btree (level_up) WHERE (level_up = true)                                            |
| public     | alunos                          | aluno_id_unique                                           | CREATE UNIQUE INDEX aluno_id_unique ON public.alunos USING btree (id)                                                                                         |
| public     | alunos                          | alunos_pkey                                               | CREATE UNIQUE INDEX alunos_pkey ON public.alunos USING btree (id)                                                                                             |



-- 5.2 Tabelas sem índices customizados
SELECT DISTINCT t.table_name
FROM information_schema.tables t
WHERE t.table_schema = 'public'
    AND t.table_type = 'BASE TABLE'
    AND t.table_name NOT IN (
        SELECT DISTINCT tablename
        FROM pg_indexes
        WHERE schemaname = 'public'
            AND indexname NOT LIKE '%_pkey'
    )
ORDER BY t.table_name;

| table_name                      |
| ------------------------------- |
| achievements_educacionais       |
| adaptacoes_espacos_alternativos |
| admins                          |
| alpha_mentorias                 |
| alpha_projetos_coletivos        |
| comunicacao_engajamento         |
| desafios_alpha                  |
| desafios_alpha_respostas        |
| documentos_institucionais       |
| forum_respostas                 |
| historia_conceitos_teoricos     |
| historia_contexto_cultural      |
| historia_instrumentos_evolucao  |
| historia_movimentos             |
| historia_periodos               |
| historia_playlists              |
| historia_quiz                   |
| instrumento_sons_variacoes      |
| instrumentos_alunos             |
| logos                           |
| metodologias_ensino             |
| migration_log                   |
| referenciais_internacionais     |
| role_permissions                |
| sequencias_didaticas            |



-- ========================================================================
-- 6️⃣ CHECK CONSTRAINTS E VALIDAÇÕES
-- ========================================================================

-- 6.1 Check Constraints
SELECT 
    tc.table_name,
    tc.constraint_name,
    cc.check_clause
FROM information_schema.table_constraints tc
JOIN information_schema.check_constraints cc
    ON tc.constraint_name = cc.constraint_name
WHERE tc.table_schema = 'public'
ORDER BY tc.table_name;

| table_name                      | constraint_name                                        | check_clause                                                                                                                                                                                                                                                            |
| ------------------------------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| achievements                    | 2200_17461_2_not_null                                  | name IS NOT NULL                                                                                                                                                                                                                                                        |
| achievements                    | 2200_17461_1_not_null                                  | id IS NOT NULL                                                                                                                                                                                                                                                          |
| achievements_educacionais       | 2200_79298_1_not_null                                  | id IS NOT NULL                                                                                                                                                                                                                                                          |
| achievements_educacionais       | 2200_79298_2_not_null                                  | nome IS NOT NULL                                                                                                                                                                                                                                                        |
| achievements_progress           | 2200_17471_5_not_null                                  | target_progress IS NOT NULL                                                                                                                                                                                                                                             |
| achievements_progress           | 2200_17471_1_not_null                                  | id IS NOT NULL                                                                                                                                                                                                                                                          |
| adaptacoes_espacos_alternativos | 2200_90875_2_not_null                                  | nome_organizacao IS NOT NULL                                                                                                                                                                                                                                            |
| adaptacoes_espacos_alternativos | adaptacoes_espacos_alternativos_tipo_organizacao_check | (((tipo_organizacao)::text = ANY ((ARRAY['ong'::character varying, 'igreja'::character varying, 'associacao_comunitaria'::character varying, 'centro_cultural'::character varying, 'cooperativa'::character varying, 'movimento_social'::character varying])::text[]))) |
| adaptacoes_espacos_alternativos | adaptacoes_espacos_alternativos_status_projeto_check   | (((status_projeto)::text = ANY ((ARRAY['planejamento'::character varying, 'piloto'::character varying, 'implementado'::character varying, 'expandido'::character varying, 'suspenso'::character varying])::text[])))                                                    |
| adaptacoes_espacos_alternativos | 2200_90875_1_not_null                                  | id IS NOT NULL                                                                                                                                                                                                                                                          |
| admins                          | 2200_17482_1_not_null                                  | id IS NOT NULL                                                                                                                                                                                                                                                          |
| admins                          | admins_nivel_acesso_check                              | ((nivel_acesso = ANY (ARRAY['admin'::text, 'super_admin'::text, 'moderador'::text])))                                                                                                                                                                                   |
| alpha_aluno_badges              | 2200_119121_2_not_null                                 | aluno_id IS NOT NULL                                                                                                                                                                                                                                                    |
| alpha_aluno_badges              | 2200_119121_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_aluno_badges              | 2200_119121_3_not_null                                 | badge_id IS NOT NULL                                                                                                                                                                                                                                                    |
| alpha_aluno_desafios            | 2200_119089_3_not_null                                 | desafio_id IS NOT NULL                                                                                                                                                                                                                                                  |
| alpha_aluno_desafios            | alpha_aluno_desafios_percentual_conclusao_check        | (((percentual_conclusao >= 0) AND (percentual_conclusao <= 100)))                                                                                                                                                                                                       |
| alpha_aluno_desafios            | 2200_119089_2_not_null                                 | aluno_id IS NOT NULL                                                                                                                                                                                                                                                    |
| alpha_aluno_desafios            | alpha_aluno_desafios_status_check                      | (((status)::text = ANY ((ARRAY['nao_iniciado'::character varying, 'em_progresso'::character varying, 'concluido'::character varying, 'expirado'::character varying])::text[])))                                                                                         |
| alpha_aluno_desafios            | 2200_119089_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_aula_progresso            | alpha_aula_progresso_status_check                      | ((status = ANY (ARRAY['nao_iniciado'::text, 'em_andamento'::text, 'concluido'::text, 'bloqueado'::text])))                                                                                                                                                              |
| alpha_aula_progresso            | 2200_159668_4_not_null                                 | status IS NOT NULL                                                                                                                                                                                                                                                      |
| alpha_aula_progresso            | 2200_159668_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_aula_progresso            | alpha_aula_progresso_porcentagem_conclusao_check       | (((porcentagem_conclusao >= 0) AND (porcentagem_conclusao <= 100)))                                                                                                                                                                                                     |
| alpha_badges                    | 2200_119876_2_not_null                                 | codigo IS NOT NULL                                                                                                                                                                                                                                                      |
| alpha_badges                    | 2200_119876_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_badges                    | 2200_119876_3_not_null                                 | nome IS NOT NULL                                                                                                                                                                                                                                                        |
| alpha_badges                    | 2200_119876_10_not_null                                | raridade IS NOT NULL                                                                                                                                                                                                                                                    |
| alpha_badges                    | 2200_119876_8_not_null                                 | categoria IS NOT NULL                                                                                                                                                                                                                                                   |
| alpha_badges                    | 2200_119876_13_not_null                                | criterio_desbloqueio IS NOT NULL                                                                                                                                                                                                                                        |
| alpha_badges                    | 2200_119876_12_not_null                                | cor_tematica IS NOT NULL                                                                                                                                                                                                                                                |
| alpha_badges                    | 2200_119876_4_not_null                                 | descricao IS NOT NULL                                                                                                                                                                                                                                                   |
| alpha_badges                    | 2200_119876_6_not_null                                 | icone IS NOT NULL                                                                                                                                                                                                                                                       |
| alpha_celebracoes               | 2200_119800_4_not_null                                 | tipo IS NOT NULL                                                                                                                                                                                                                                                        |
| alpha_celebracoes               | 2200_119800_5_not_null                                 | titulo IS NOT NULL                                                                                                                                                                                                                                                      |
| alpha_celebracoes               | 2200_119800_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_celebracoes               | 2200_119800_2_not_null                                 | estudante_id IS NOT NULL                                                                                                                                                                                                                                                |
| alpha_competencias              | alpha_competencias_nivel_complexidade_check            | (((nivel_complexidade >= 1) AND (nivel_complexidade <= 5)))                                                                                                                                                                                                             |
| alpha_competencias              | 2200_89573_1_not_null                                  | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_competencias              | 2200_89573_3_not_null                                  | codigo IS NOT NULL                                                                                                                                                                                                                                                      |
| alpha_competencias              | 2200_89573_4_not_null                                  | nome IS NOT NULL                                                                                                                                                                                                                                                        |
| alpha_desafios                  | 2200_119062_16_not_null                                | criterios_conclusao IS NOT NULL                                                                                                                                                                                                                                         |
| alpha_desafios                  | 2200_119062_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_desafios                  | 2200_119062_13_not_null                                | pontos_recompensa IS NOT NULL                                                                                                                                                                                                                                           |
| alpha_desafios                  | alpha_desafios_dificuldade_check                       | (((dificuldade >= 1) AND (dificuldade <= 5)))                                                                                                                                                                                                                           |
| alpha_desafios                  | 2200_119062_3_not_null                                 | titulo IS NOT NULL                                                                                                                                                                                                                                                      |
| alpha_desafios                  | 2200_119062_2_not_null                                 | codigo IS NOT NULL                                                                                                                                                                                                                                                      |
| alpha_desafios                  | 2200_119062_12_not_null                                | pontos_base IS NOT NULL                                                                                                                                                                                                                                                 |
| alpha_estudante_badges          | 2200_119718_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_estudante_badges          | 2200_119718_2_not_null                                 | estudante_id IS NOT NULL                                                                                                                                                                                                                                                |
| alpha_estudante_badges          | 2200_119718_4_not_null                                 | badge_codigo IS NOT NULL                                                                                                                                                                                                                                                |
| alpha_estudante_badges          | 2200_119718_3_not_null                                 | badge_id IS NOT NULL                                                                                                                                                                                                                                                    |
| alpha_mentorias                 | 2200_119760_3_not_null                                 | mentorado_id IS NOT NULL                                                                                                                                                                                                                                                |
| alpha_mentorias                 | alpha_mentorias_avaliacao_mentorado_check              | (((avaliacao_mentorado >= 1) AND (avaliacao_mentorado <= 5)))                                                                                                                                                                                                           |
| alpha_mentorias                 | 2200_119760_2_not_null                                 | mentor_id IS NOT NULL                                                                                                                                                                                                                                                   |
| alpha_mentorias                 | 2200_119760_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_metodologias              | 2200_89558_3_not_null                                  | nome IS NOT NULL                                                                                                                                                                                                                                                        |
| alpha_metodologias              | 2200_89558_2_not_null                                  | codigo IS NOT NULL                                                                                                                                                                                                                                                      |
| alpha_metodologias              | alpha_metodologias_nivel_dificuldade_check             | (((nivel_dificuldade >= 1) AND (nivel_dificuldade <= 5)))                                                                                                                                                                                                               |
| alpha_metodologias              | 2200_89558_1_not_null                                  | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_niveis                    | 2200_119639_3_not_null                                 | nome IS NOT NULL                                                                                                                                                                                                                                                        |
| alpha_niveis                    | alpha_niveis_nivel_check                               | (((nivel >= 1) AND (nivel <= 10)))                                                                                                                                                                                                                                      |
| alpha_niveis                    | 2200_119639_2_not_null                                 | nivel IS NOT NULL                                                                                                                                                                                                                                                       |
| alpha_niveis                    | 2200_119639_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_niveis                    | 2200_119639_7_not_null                                 | cor_badge IS NOT NULL                                                                                                                                                                                                                                                   |
| alpha_niveis                    | 2200_119639_10_not_null                                | beneficios_desbloqueados IS NOT NULL                                                                                                                                                                                                                                    |
| alpha_niveis                    | 2200_119639_9_not_null                                 | descricao IS NOT NULL                                                                                                                                                                                                                                                   |
| alpha_niveis                    | 2200_119639_8_not_null                                 | icone IS NOT NULL                                                                                                                                                                                                                                                       |
| alpha_niveis                    | 2200_119639_5_not_null                                 | xp_minimo IS NOT NULL                                                                                                                                                                                                                                                   |
| alpha_niveis                    | 2200_119639_6_not_null                                 | xp_maximo IS NOT NULL                                                                                                                                                                                                                                                   |
| alpha_progresso                 | 2200_89639_1_not_null                                  | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_progresso_estudante       | 2200_119651_5_not_null                                 | xp_nivel_atual IS NOT NULL                                                                                                                                                                                                                                              |
| alpha_progresso_estudante       | 2200_119651_2_not_null                                 | estudante_id IS NOT NULL                                                                                                                                                                                                                                                |
| alpha_progresso_estudante       | 2200_119651_3_not_null                                 | nivel_atual IS NOT NULL                                                                                                                                                                                                                                                 |
| alpha_progresso_estudante       | 2200_119651_4_not_null                                 | xp_total IS NOT NULL                                                                                                                                                                                                                                                    |
| alpha_progresso_estudante       | 2200_119651_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_projetos_coletivos        | 2200_119782_3_not_null                                 | descricao IS NOT NULL                                                                                                                                                                                                                                                   |
| alpha_projetos_coletivos        | 2200_119782_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_projetos_coletivos        | 2200_119782_4_not_null                                 | tipo IS NOT NULL                                                                                                                                                                                                                                                        |
| alpha_projetos_coletivos        | 2200_119782_5_not_null                                 | criador_id IS NOT NULL                                                                                                                                                                                                                                                  |
| alpha_projetos_coletivos        | alpha_projetos_coletivos_avaliacao_professor_check     | (((avaliacao_professor >= 1) AND (avaliacao_professor <= 10)))                                                                                                                                                                                                          |
| alpha_projetos_coletivos        | 2200_119782_6_not_null                                 | participantes IS NOT NULL                                                                                                                                                                                                                                               |
| alpha_projetos_coletivos        | 2200_119782_2_not_null                                 | titulo IS NOT NULL                                                                                                                                                                                                                                                      |
| alpha_ranking                   | 2200_119741_4_not_null                                 | data_fim IS NOT NULL                                                                                                                                                                                                                                                    |
| alpha_ranking                   | 2200_119741_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_ranking                   | 2200_119741_5_not_null                                 | estudante_id IS NOT NULL                                                                                                                                                                                                                                                |
| alpha_ranking                   | 2200_119741_9_not_null                                 | xp_periodo IS NOT NULL                                                                                                                                                                                                                                                  |
| alpha_ranking                   | 2200_119741_6_not_null                                 | posicao IS NOT NULL                                                                                                                                                                                                                                                     |
| alpha_ranking                   | 2200_119741_2_not_null                                 | periodo IS NOT NULL                                                                                                                                                                                                                                                     |
| alpha_ranking                   | 2200_119741_3_not_null                                 | data_inicio IS NOT NULL                                                                                                                                                                                                                                                 |
| alpha_submissoes                | alpha_submissoes_status_check                          | (((status)::text = ANY ((ARRAY['pendente'::character varying, 'avaliando'::character varying, 'aprovado'::character varying, 'revisao'::character varying, 'rejeitado'::character varying])::text[])))                                                                  |
| alpha_submissoes                | 2200_89615_1_not_null                                  | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_xp_historico              | 2200_119695_3_not_null                                 | acao_tipo IS NOT NULL                                                                                                                                                                                                                                                   |
| alpha_xp_historico              | 2200_119695_5_not_null                                 | xp_ganho IS NOT NULL                                                                                                                                                                                                                                                    |
| alpha_xp_historico              | 2200_119695_2_not_null                                 | estudante_id IS NOT NULL                                                                                                                                                                                                                                                |
| alpha_xp_historico              | 2200_119695_1_not_null                                 | id IS NOT NULL                                                                                                                                                                                                                                                          |
| alpha_xp_historico              | 2200_119695_6_not_null                                 | xp_total_apos IS NOT NULL                                                                                                                                                                                                                                               |
| alunos                          | 2200_17492_1_not_null                                  | id IS NOT NULL                                                                                                                                                                                                                                                          |
| audit_activities                | audit_activities_severity_check                        | ((severity = ANY (ARRAY['info'::text, 'warning'::text, 'error'::text, 'critical'::text])))                                                                                                                                                                              |
| audit_activities                | 2200_17500_4_not_null                                  | resource IS NOT NULL                                                                                                                                                                                                                                                    |



-- 6.2 Colunas NOT NULL
SELECT 
    table_name,
    COUNT(*) FILTER (WHERE is_nullable = 'NO') as colunas_not_null,
    COUNT(*) as total_colunas,
    ROUND(COUNT(*) FILTER (WHERE is_nullable = 'NO') * 100.0 / COUNT(*), 2) as percentual_not_null
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY table_name
ORDER BY percentual_not_null DESC;

| table_name                  | colunas_not_null | total_colunas | percentual_not_null |
| --------------------------- | ---------------- | ------------- | ------------------- |
| role_permissions            | 2                | 2             | 100.00              |
| alpha_niveis                | 9                | 13            | 69.23               |
| aula_desafio_alpha          | 2                | 3             | 66.67               |
| aula_criterios_avaliacao    | 2                | 3             | 66.67               |
| aula_feedback               | 3                | 5             | 60.00               |
| permission_templates        | 4                | 7             | 57.14               |
| hook_cache                  | 5                | 9             | 55.56               |
| logos                       | 3                | 6             | 50.00               |
| roles                       | 2                | 4             | 50.00               |
| aula_atividades             | 2                | 4             | 50.00               |
| aula_tags                   | 2                | 4             | 50.00               |
| permissions                 | 2                | 4             | 50.00               |
| rubricas_avaliacao          | 5                | 11            | 45.45               |
| trigger_logs                | 3                | 7             | 42.86               |
| user_badges                 | 3                | 7             | 42.86               |
| presencas                   | 3                | 7             | 42.86               |
| user_points_log             | 4                | 10            | 40.00               |
| aula_status_log             | 2                | 5             | 40.00               |
| aula_materiais              | 2                | 5             | 40.00               |
| migration_log               | 2                | 5             | 40.00               |
| alpha_badges                | 9                | 23            | 39.13               |
| aula_presencas              | 3                | 8             | 37.50               |
| professor_instrumentos      | 3                | 8             | 37.50               |
| alpha_ranking               | 7                | 20            | 35.00               |
| instrumento_curiosidades    | 3                | 9             | 33.33               |
| user_notifications          | 4                | 12            | 33.33               |
| modulos                     | 2                | 6             | 33.33               |
| aula_avaliacoes             | 3                | 9             | 33.33               |
| turma_alunos                | 1                | 3             | 33.33               |
| alpha_estudante_badges      | 4                | 13            | 30.77               |
| qr_codes                    | 4                | 13            | 30.77               |
| alpha_xp_historico          | 5                | 17            | 29.41               |
| forum_respostas             | 2                | 7             | 28.57               |
| alpha_projetos_coletivos    | 6                | 21            | 28.57               |
| aula_desafios               | 2                | 7             | 28.57               |
| aulas                       | 4                | 14            | 28.57               |
| desafios_alpha              | 4                | 14            | 28.57               |
| forum_perguntas             | 3                | 11            | 27.27               |
| alpha_competencias          | 3                | 11            | 27.27               |
| devotional_content          | 3                | 11            | 27.27               |
| professores_categorias      | 2                | 8             | 25.00               |
| forum_likes                 | 1                | 4             | 25.00               |
| aula_registros              | 1                | 4             | 25.00               |
| alpha_aluno_badges          | 3                | 12            | 25.00               |
| turmas                      | 5                | 21            | 23.81               |
| historia_quiz               | 3                | 13            | 23.08               |
| indicadores_impacto         | 2                | 9             | 22.22               |
| avaliacoes_rubricas         | 2                | 9             | 22.22               |
| alpha_mentorias             | 3                | 14            | 21.43               |
| modules                     | 3                | 14            | 21.43               |
| alpha_celebracoes           | 4                | 19            | 21.05               |
| aula_permissoes             | 1                | 5             | 20.00               |
| achievements_educacionais   | 2                | 10            | 20.00               |
| achievements_progress       | 2                | 10            | 20.00               |
| alpha_aluno_desafios        | 3                | 15            | 20.00               |
| audit_activities            | 3                | 15            | 20.00               |
| aula_checklist              | 1                | 5             | 20.00               |
| aula_feedbacks              | 1                | 5             | 20.00               |
| historia_eventos_timeline   | 3                | 15            | 20.00               |
| historia_timeline           | 3                | 15            | 20.00               |
| instrumento_quiz            | 3                | 15            | 20.00               |
| instrumento_sons_variacoes  | 2                | 10            | 20.00               |
| matriculas                  | 3                | 15            | 20.00               |
| qr_scans                    | 2                | 10            | 20.00               |
| user_achievements           | 1                | 5             | 20.00               |
| usuarios                    | 1                | 5             | 20.00               |
| historia_generos            | 3                | 16            | 18.75               |
| referenciais_internacionais | 3                | 16            | 18.75               |
| instrumento_sons            | 2                | 11            | 18.18               |
| historia_contexto_cultural  | 2                | 11            | 18.18               |
| alpha_aula_progresso        | 2                | 11            | 18.18               |
| achievements                | 2                | 11            | 18.18               |
| alpha_desafios              | 6                | 34            | 17.65               |
| user_devotional_progress    | 1                | 6             | 16.67               |
| professores                 | 1                | 6             | 16.67               |
| instrumento_midias          | 3                | 18            | 16.67               |
| user_roles                  | 2                | 12            | 16.67               |
| historia_progresso_usuario  | 2                | 12            | 16.67               |
| autoavaliacoes              | 3                | 18            | 16.67               |
| materiais_apoio             | 3                | 19            | 15.79               |
| historia_periodos           | 2                | 13            | 15.38               |
| feedback_pares              | 2                | 13            | 15.38               |
| admins                      | 1                | 7             | 14.29               |
| instrumentos_relacionados   | 1                | 7             | 14.29               |
| lessons                     | 3                | 21            | 14.29               |
| sequencias_didaticas        | 2                | 14            | 14.29               |
| historia_quiz_respostas     | 1                | 7             | 14.29               |
| portfolio_evidencias        | 3                | 21            | 14.29               |
| historia_movimentos         | 2                | 14            | 14.29               |
| instrumento_tecnicas        | 2                | 14            | 14.29               |
| historico_instrumentos      | 1                | 7             | 14.29               |
| professores_conteudos       | 3                | 21            | 14.29               |
| instrumento_performances    | 2                | 14            | 14.29               |
| historia_playlists          | 2                | 14            | 14.29               |
| historia_conceitos_teoricos | 2                | 14            | 14.29               |
| instrumentos                | 2                | 16            | 12.50               |
| alpha_metodologias          | 3                | 25            | 12.00               |
| alpha_progresso_estudante   | 5                | 42            | 11.90               |
| portfolios                  | 2                | 17            | 11.76               |
| metodologias_ensino         | 2                | 17            | 11.76               |



-- ========================================================================
-- 7️⃣ ENUMS E TIPOS CUSTOMIZADOS
-- ========================================================================

-- 7.1 Todos os ENUM types
SELECT 
    t.typname as enum_name,
    string_agg(e.enumlabel, ', ' ORDER BY e.enumsortorder) as valores_possiveis
FROM pg_type t
JOIN pg_enum e ON t.oid = e.enumtypid
WHERE t.typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public')
GROUP BY t.typname
ORDER BY t.typname;

Success. No rows returned






-- 7.2 Uso dos ENUMs nas tabelas
SELECT 
    c.table_name,
    c.column_name,
    c.udt_name as enum_type
FROM information_schema.columns c
WHERE c.table_schema = 'public'
    AND c.udt_name IN (
        SELECT typname FROM pg_type 
        WHERE typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public')
        AND typtype = 'e'
    )
ORDER BY c.table_name, c.column_name;

Success. No rows returned






-- ========================================================================
-- 8️⃣ DEFAULTS E VALORES AUTOMÁTICOS
-- ========================================================================

-- 8.1 Colunas com defaults
SELECT 
    table_name,
    column_name,
    column_default,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
    AND column_default IS NOT NULL
ORDER BY table_name, column_name;


| table_name                      | column_name            | column_default                    | data_type                   |
| ------------------------------- | ---------------------- | --------------------------------- | --------------------------- |
| achievements                    | badge_color            | '#E53E3E'::text                   | text                        |
| achievements                    | created_at             | now()                             | timestamp with time zone    |
| achievements                    | id                     | gen_random_uuid()                 | uuid                        |
| achievements                    | is_active              | true                              | boolean                     |
| achievements                    | points_reward          | 0                                 | integer                     |
| achievements_educacionais       | ativo                  | true                              | boolean                     |
| achievements_educacionais       | created_at             | now()                             | timestamp without time zone |
| achievements_educacionais       | id                     | gen_random_uuid()                 | uuid                        |
| achievements_educacionais       | pontos_recompensa      | 10                                | integer                     |
| achievements_progress           | created_at             | now()                             | timestamp with time zone    |
| achievements_progress           | current_progress       | 0                                 | integer                     |
| achievements_progress           | id                     | gen_random_uuid()                 | uuid                        |
| achievements_progress           | is_completed           | false                             | boolean                     |
| achievements_progress           | metadata               | '{}'::jsonb                       | jsonb                       |
| achievements_progress           | updated_at             | now()                             | timestamp with time zone    |
| adaptacoes_espacos_alternativos | created_at             | now()                             | timestamp with time zone    |
| adaptacoes_espacos_alternativos | id                     | gen_random_uuid()                 | uuid                        |
| adaptacoes_espacos_alternativos | updated_at             | now()                             | timestamp with time zone    |
| admins                          | ativo                  | true                              | boolean                     |
| admins                          | criado_em              | CURRENT_TIMESTAMP                 | timestamp without time zone |
| admins                          | nivel_acesso           | 'admin'::text                     | text                        |
| admins                          | permissoes             | '{}'::jsonb                       | jsonb                       |
| alpha_aluno_badges              | compartilhamentos      | 0                                 | integer                     |
| alpha_aluno_badges              | created_at             | now()                             | timestamp with time zone    |
| alpha_aluno_badges              | data_obtencao          | now()                             | timestamp with time zone    |
| alpha_aluno_badges              | destacada              | false                             | boolean                     |
| alpha_aluno_badges              | id                     | uuid_generate_v4()                | uuid                        |
| alpha_aluno_badges              | visualizacoes          | 0                                 | integer                     |
| alpha_aluno_desafios            | bonus_velocidade_ganho | false                             | boolean                     |
| alpha_aluno_desafios            | created_at             | now()                             | timestamp with time zone    |
| alpha_aluno_desafios            | id                     | uuid_generate_v4()                | uuid                        |
| alpha_aluno_desafios            | percentual_conclusao   | 0                                 | integer                     |
| alpha_aluno_desafios            | pontos_ganhos          | 0                                 | integer                     |
| alpha_aluno_desafios            | status                 | 'nao_iniciado'::character varying | character varying           |
| alpha_aluno_desafios            | tentativas             | 0                                 | integer                     |
| alpha_aluno_desafios            | updated_at             | now()                             | timestamp with time zone    |
| alpha_aula_progresso            | created_at             | now()                             | timestamp with time zone    |
| alpha_aula_progresso            | id                     | gen_random_uuid()                 | uuid                        |
| alpha_aula_progresso            | porcentagem_conclusao  | 0                                 | integer                     |
| alpha_aula_progresso            | tempo_gasto_minutos    | 0                                 | integer                     |
| alpha_aula_progresso            | tentativas             | 0                                 | integer                     |
| alpha_aula_progresso            | ultima_atividade       | now()                             | timestamp with time zone    |
| alpha_aula_progresso            | updated_at             | now()                             | timestamp with time zone    |
| alpha_badges                    | atualizado_em          | now()                             | timestamp with time zone    |
| alpha_badges                    | criado_em              | now()                             | timestamp with time zone    |
| alpha_badges                    | id                     | uuid_generate_v4()                | uuid                        |
| alpha_badges                    | ordem_exibicao         | 0                                 | integer                     |
| alpha_badges                    | secreto                | false                             | boolean                     |
| alpha_badges                    | valor_xp_bonus         | 0                                 | integer                     |
| alpha_badges                    | visivel                | true                              | boolean                     |
| alpha_celebracoes               | comentarios            | 0                                 | integer                     |
| alpha_celebracoes               | created_at             | now()                             | timestamp with time zone    |
| alpha_celebracoes               | curtidas               | 0                                 | integer                     |
| alpha_celebracoes               | destacado              | false                             | boolean                     |
| alpha_celebracoes               | id                     | uuid_generate_v4()                | uuid                        |
| alpha_celebracoes               | publico                | true                              | boolean                     |
| alpha_competencias              | ativo                  | true                              | boolean                     |
| alpha_competencias              | created_at             | now()                             | timestamp with time zone    |
| alpha_competencias              | id                     | gen_random_uuid()                 | uuid                        |
| alpha_competencias              | ordem                  | 1                                 | integer                     |
| alpha_desafios                  | ativo                  | true                              | boolean                     |
| alpha_desafios                  | created_at             | now()                             | timestamp with time zone    |
| alpha_desafios                  | id                     | uuid_generate_v4()                | uuid                        |
| alpha_desafios                  | pontos_bonus           | 0                                 | integer                     |
| alpha_desafios                  | total_concluintes      | 0                                 | integer                     |
| alpha_desafios                  | total_participantes    | 0                                 | integer                     |
| alpha_desafios                  | updated_at             | now()                             | timestamp with time zone    |
| alpha_desafios                  | visivel_para           | 'todos'::character varying        | character varying           |
| alpha_estudante_badges          | completo               | false                             | boolean                     |
| alpha_estudante_badges          | conquistado_em         | now()                             | timestamp with time zone    |
| alpha_estudante_badges          | created_at             | now()                             | timestamp with time zone    |
| alpha_estudante_badges          | destacado              | false                             | boolean                     |
| alpha_estudante_badges          | id                     | uuid_generate_v4()                | uuid                        |
| alpha_estudante_badges          | visto                  | false                             | boolean                     |
| alpha_mentorias                 | created_at             | now()                             | timestamp with time zone    |
| alpha_mentorias                 | id                     | uuid_generate_v4()                | uuid                        |
| alpha_mentorias                 | xp_mentor              | 30                                | integer                     |
| alpha_mentorias                 | xp_mentorado           | 10                                | integer                     |
| alpha_metodologias              | ativo                  | true                              | boolean                     |
| alpha_metodologias              | created_at             | now()                             | timestamp with time zone    |
| alpha_metodologias              | id                     | gen_random_uuid()                 | uuid                        |
| alpha_metodologias              | ordem_apresentacao     | 1                                 | integer                     |
| alpha_metodologias              | updated_at             | now()                             | timestamp with time zone    |
| alpha_niveis                    | created_at             | now()                             | timestamp with time zone    |
| alpha_niveis                    | id                     | uuid_generate_v4()                | uuid                        |
| alpha_progresso                 | created_at             | now()                             | timestamp with time zone    |
| alpha_progresso                 | desafios_completados   | 0                                 | integer                     |
| alpha_progresso                 | id                     | gen_random_uuid()                 | uuid                        |
| alpha_progresso                 | nivel_atual            | 1                                 | integer                     |
| alpha_progresso                 | pontos_acumulados      | 0                                 | integer                     |
| alpha_progresso                 | progresso_percentual   | 0.00                              | numeric                     |
| alpha_progresso                 | total_desafios         | 0                                 | integer                     |
| alpha_progresso                 | ultima_atividade       | now()                             | timestamp with time zone    |
| alpha_progresso                 | updated_at             | now()                             | timestamp with time zone    |
| alpha_progresso_estudante       | badges_conquistados    | '{}'::text[]                      | ARRAY                       |
| alpha_progresso_estudante       | badges_epicos          | 0                                 | integer                     |
| alpha_progresso_estudante       | badges_lendarios       | 0                                 | integer                     |
| alpha_progresso_estudante       | badges_raros           | 0                                 | integer                     |
| alpha_progresso_estudante       | created_at             | now()                             | timestamp with time zone    |
| alpha_progresso_estudante       | desafios_completados   | 0                                 | integer                     |


-- 8.2 Uso de gen_random_uuid()
SELECT 
    table_name,
    column_name
FROM information_schema.columns
WHERE table_schema = 'public'
    AND column_default LIKE '%gen_random_uuid%'
ORDER BY table_name;

| table_name                      | column_name |
| ------------------------------- | ----------- |
| achievements                    | id          |
| achievements_educacionais       | id          |
| achievements_progress           | id          |
| adaptacoes_espacos_alternativos | id          |
| alpha_aula_progresso            | id          |
| alpha_competencias              | id          |
| alpha_metodologias              | id          |
| alpha_progresso                 | id          |
| alpha_submissoes                | id          |
| audit_activities                | id          |
| aula_atividades                 | id          |
| aula_avaliacoes                 | id          |
| aula_checklist                  | id          |
| aula_criterios_avaliacao        | id          |
| aula_desafio_alpha              | id          |
| aula_desafios                   | id          |
| aula_feedback                   | id          |
| aula_feedbacks                  | id          |
| aula_materiais                  | id          |
| aula_permissoes                 | id          |
| aula_presencas                  | id          |
| aula_registros                  | id          |
| aula_status_log                 | id          |
| aula_tags                       | id          |
| aulas                           | id          |
| autoavaliacoes                  | id          |
| avaliacoes_rubricas             | id          |
| capacitacao_docente             | id          |
| comunicacao_engajamento         | id          |
| desafios_alpha                  | id          |
| desafios_alpha_respostas        | id          |
| devotional_content              | id          |
| documentos_institucionais       | id          |
| experiencias_brasileiras        | id          |
| feedback_pares                  | id          |
| forum_likes                     | id          |
| forum_perguntas                 | id          |
| forum_respostas                 | id          |
| historia_compositores           | id          |
| historia_conceitos_teoricos     | id          |
| historia_contexto_cultural      | id          |
| historia_eventos_timeline       | id          |
| historia_generos                | id          |
| historia_instrumentos_evolucao  | id          |
| historia_movimentos             | id          |
| historia_obras                  | id          |
| historia_periodos               | id          |
| historia_playlists              | id          |
| historia_progresso_usuario      | id          |
| historia_quiz                   | id          |
| historia_quiz_respostas         | id          |
| hook_cache                      | id          |
| indicadores_impacto             | id          |
| instrumento_curiosidades        | id          |
| instrumento_midias              | id          |
| instrumento_performances        | id          |
| instrumento_quiz                | id          |
| instrumento_sons                | id          |
| instrumento_sons_variacoes      | id          |
| instrumento_tecnicas            | id          |
| instrumentos                    | id          |
| instrumentos_relacionados       | id          |
| lessons                         | id          |
| logos                           | id          |
| materiais_apoio                 | id          |
| matriculas                      | id          |
| metodologias_ensino             | id          |
| migration_log                   | id          |
| modules                         | id          |
| modulos                         | id          |
| permission_templates            | id          |
| portfolio_evidencias            | id          |
| portfolios                      | id          |
| presencas                       | id          |
| professor_instrumentos          | id          |
| proposta_curricular             | id          |
| qr_codes                        | id          |
| qr_scans                        | id          |
| referenciais_internacionais     | id          |
| repertorio_musical              | id          |
| rubricas_avaliacao              | id          |
| sequencias_didaticas            | id          |
| sequencias_didaticas_expandidas | id          |
| sistema_presto                  | id          |
| trigger_logs                    | id          |
| turma_alunos                    | id          |
| turmas                          | id          |
| user_achievements               | id          |
| user_badges                     | id          |
| user_devotional_progress        | id          |
| user_notifications              | id          |
| user_points_log                 | id          |
| user_progress                   | id          |
| user_roles                      | id          |



-- ========================================================================
-- 9️⃣ TRIGGERS E FUNCTIONS
-- ========================================================================

-- 9.1 Todos os triggers
SELECT 
    trigger_name,
    event_manipulation,
    event_object_table,
    action_statement,
    action_timing
FROM information_schema.triggers
WHERE trigger_schema = 'public'
ORDER BY event_object_table, trigger_name;

| trigger_name                               | event_manipulation | event_object_table         | action_statement                                  | action_timing |
| ------------------------------------------ | ------------------ | -------------------------- | ------------------------------------------------- | ------------- |
| trigger_invalidate_admin_cache             | INSERT             | admins                     | EXECUTE FUNCTION invalidate_user_cache()          | AFTER         |
| trigger_invalidate_admin_cache             | DELETE             | admins                     | EXECUTE FUNCTION invalidate_user_cache()          | AFTER         |
| trigger_invalidate_admin_cache             | UPDATE             | admins                     | EXECUTE FUNCTION invalidate_user_cache()          | AFTER         |
| trigger_atualizar_conquistadores           | INSERT             | alpha_aluno_badges         | EXECUTE FUNCTION atualizar_total_conquistadores() | AFTER         |
| trigger_atualizar_conquistadores           | DELETE             | alpha_aluno_badges         | EXECUTE FUNCTION atualizar_total_conquistadores() | AFTER         |
| trigger_atualizar_contadores_desafio       | UPDATE             | alpha_aluno_desafios       | EXECUTE FUNCTION atualizar_contadores_desafio()   | AFTER         |
| trigger_atualizar_contadores_desafio       | INSERT             | alpha_aluno_desafios       | EXECUTE FUNCTION atualizar_contadores_desafio()   | AFTER         |
| update_alpha_badges_updated_at             | UPDATE             | alpha_badges               | EXECUTE FUNCTION update_updated_at_column()       | BEFORE        |
| trigger_invalidate_aluno_cache             | DELETE             | alunos                     | EXECUTE FUNCTION invalidate_user_cache()          | AFTER         |
| trigger_invalidate_aluno_cache             | INSERT             | alunos                     | EXECUTE FUNCTION invalidate_user_cache()          | AFTER         |
| trigger_invalidate_aluno_cache             | UPDATE             | alunos                     | EXECUTE FUNCTION invalidate_user_cache()          | AFTER         |
| trg_checklist_auto_status                  | INSERT             | aula_checklist             | EXECUTE FUNCTION fn_auto_status_from_checklist()  | AFTER         |
| trg_checklist_auto_status                  | UPDATE             | aula_checklist             | EXECUTE FUNCTION fn_auto_status_from_checklist()  | AFTER         |
| trg_checklist_pre                          | INSERT             | aula_checklist             | EXECUTE FUNCTION atualizar_status_aula()          | AFTER         |
| trg_checklist_pre                          | UPDATE             | aula_checklist             | EXECUTE FUNCTION atualizar_status_aula()          | AFTER         |
| trg_aulas_status_log                       | UPDATE             | aulas                      | EXECUTE FUNCTION fn_log_status_change()           | AFTER         |
| update_historia_playlists_updated_at       | UPDATE             | historia_playlists         | EXECUTE FUNCTION update_updated_at_column()       | BEFORE        |
| update_historia_progresso_updated_at       | UPDATE             | historia_progresso_usuario | EXECUTE FUNCTION update_updated_at_column()       | BEFORE        |
| trigger_update_lessons_count_delete        | DELETE             | lessons                    | EXECUTE FUNCTION update_module_lessons_count()    | AFTER         |
| trigger_update_lessons_count_insert        | INSERT             | lessons                    | EXECUTE FUNCTION update_module_lessons_count()    | AFTER         |
| trigger_update_lessons_updated_at          | UPDATE             | lessons                    | EXECUTE FUNCTION update_lessons_updated_at()      | BEFORE        |
| trigger_update_matriculas_updated_at       | UPDATE             | matriculas                 | EXECUTE FUNCTION update_matriculas_updated_at()   | BEFORE        |
| trigger_update_modules_updated_at          | UPDATE             | modules                    | EXECUTE FUNCTION update_modules_updated_at()      | BEFORE        |
| trigger_atualizar_evidencias               | UPDATE             | portfolio_evidencias       | EXECUTE FUNCTION atualizar_timestamp_portfolio()  | BEFORE        |
| trigger_atualizar_portfolios               | UPDATE             | portfolios                 | EXECUTE FUNCTION atualizar_timestamp_portfolio()  | BEFORE        |
| trigger_invalidate_professor_cache         | DELETE             | professores                | EXECUTE FUNCTION invalidate_user_cache()          | AFTER         |
| trigger_invalidate_professor_cache         | UPDATE             | professores                | EXECUTE FUNCTION invalidate_user_cache()          | AFTER         |
| trigger_invalidate_professor_cache         | INSERT             | professores                | EXECUTE FUNCTION invalidate_user_cache()          | AFTER         |
| normalize_professores_conteudos_tags       | INSERT             | professores_conteudos      | EXECUTE FUNCTION normalize_tags()                 | BEFORE        |
| normalize_professores_conteudos_tags       | UPDATE             | professores_conteudos      | EXECUTE FUNCTION normalize_tags()                 | BEFORE        |
| trigger_update_editado_em                  | UPDATE             | professores_conteudos      | EXECUTE FUNCTION update_editado_em()              | BEFORE        |
| update_professores_conteudos_atualizado_em | UPDATE             | professores_conteudos      | EXECUTE FUNCTION update_atualizado_em_column()    | BEFORE        |
| trigger_inserir_tipo                       | INSERT             | profiles                   | EXECUTE FUNCTION inserir_em_tabela_especifica()   | AFTER         |
| trigger_update_last_active                 | UPDATE             | profiles                   | EXECUTE FUNCTION update_last_active()             | BEFORE        |
| trigger_update_turmas_updated_at           | UPDATE             | turmas                     | EXECUTE FUNCTION update_turmas_updated_at()       | BEFORE        |
| after_points_check_achievements            | INSERT             | user_points_log            | EXECUTE FUNCTION trigger_check_achievements()     | AFTER         |



-- 9.2 Functions customizadas
SELECT 
    routine_name,
    routine_type,
    data_type as return_type
FROM information_schema.routines
WHERE routine_schema = 'public'
ORDER BY routine_name;

| routine_name                   | routine_type | return_type  |
| ------------------------------ | ------------ | ------------ |
| add_user_points                | FUNCTION     | boolean      |
| adicionar_xp                   | FUNCTION     | jsonb        |
| atualizar_contadores_desafio   | FUNCTION     | trigger      |
| atualizar_status_aula          | FUNCTION     | trigger      |
| atualizar_timestamp_portfolio  | FUNCTION     | trigger      |
| atualizar_total_conquistadores | FUNCTION     | trigger      |
| award_points                   | FUNCTION     | jsonb        |
| calculate_user_achievements    | FUNCTION     | jsonb        |
| check_achievements_trigger     | FUNCTION     | trigger      |
| check_and_grant_achievements   | FUNCTION     | integer      |
| cleanup_expired_data           | FUNCTION     | void         |
| column_exists                  | FUNCTION     | boolean      |
| create_user_with_profile       | FUNCTION     | json         |
| detect_user_role               | FUNCTION     | jsonb        |
| emergency_signup               | FUNCTION     | json         |
| find_professor_relation_column | FUNCTION     | text         |
| fn_auto_status_from_checklist  | FUNCTION     | trigger      |
| fn_log_status_change           | FUNCTION     | trigger      |
| generate_qr_code               | FUNCTION     | jsonb        |
| gerar_qr_aula                  | FUNCTION     | text         |
| get_alunos_by_instrumento      | FUNCTION     | record       |
| get_estatisticas_autor         | FUNCTION     | json         |
| get_estatisticas_gerais        | FUNCTION     | json         |
| get_lessons_by_module          | FUNCTION     | USER-DEFINED |
| get_modules_by_instrument      | FUNCTION     | USER-DEFINED |
| get_modules_by_level           | FUNCTION     | USER-DEFINED |
| get_modules_stats              | FUNCTION     | json         |
| get_professores_by_instrumento | FUNCTION     | record       |
| get_user_profile               | FUNCTION     | json         |
| get_user_stats                 | FUNCTION     | jsonb        |
| get_vagas_disponiveis          | FUNCTION     | integer      |
| handle_new_user_signup         | FUNCTION     | uuid         |
| has_permission                 | FUNCTION     | boolean      |
| incrementar_download           | FUNCTION     | void         |
| incrementar_visualizacao       | FUNCTION     | void         |
| inserir_em_tabela_especifica   | FUNCTION     | trigger      |
| invalidate_cache               | FUNCTION     | integer      |
| invalidate_user_cache          | FUNCTION     | trigger      |
| is_admin                       | FUNCTION     | boolean      |
| is_admin                       | FUNCTION     | boolean      |
| is_professor_of_student        | FUNCTION     | boolean      |
| is_professor_of_student_v2     | FUNCTION     | boolean      |
| log_activity                   | FUNCTION     | uuid         |
| normalizar_instrumento         | FUNCTION     | text         |
| normalize_tags                 | FUNCTION     | trigger      |
| process_qr_scan                | FUNCTION     | jsonb        |
| show_table_structure           | FUNCTION     | record       |
| simple_create_profile          | FUNCTION     | json         |
| test_profile_creation          | FUNCTION     | json         |
| trigger_check_achievements     | FUNCTION     | trigger      |
| update_attendance_view         | FUNCTION     | void         |
| update_atualizado_em_column    | FUNCTION     | trigger      |
| update_editado_em              | FUNCTION     | trigger      |
| update_last_active             | FUNCTION     | trigger      |
| update_lessons_updated_at      | FUNCTION     | trigger      |
| update_matriculas_updated_at   | FUNCTION     | trigger      |
| update_module_lessons_count    | FUNCTION     | trigger      |
| update_modules_updated_at      | FUNCTION     | trigger      |
| update_professor_view          | FUNCTION     | void         |
| update_professor_view_fixed    | FUNCTION     | void         |
| update_turmas_updated_at       | FUNCTION     | trigger      |
| update_updated_at_column       | FUNCTION     | trigger      |
| update_user_streak             | FUNCTION     | boolean      |


-- ========================================================================
-- 🔟 RESUMO ESTATÍSTICO
-- ========================================================================

-- 10.1 Resumo geral
SELECT 
    'Total de Tabelas' as metrica,
    COUNT(*)::text as valor
FROM information_schema.tables
WHERE table_schema = 'public' AND table_type = 'BASE TABLE'

UNION ALL

SELECT 
    'Total de Colunas',
    COUNT(*)::text
FROM information_schema.columns
WHERE table_schema = 'public'

UNION ALL

SELECT 
    'Total de Foreign Keys',
    COUNT(*)::text
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY' AND table_schema = 'public'

UNION ALL

SELECT 
    'Total de Índices',
    COUNT(*)::text
FROM pg_indexes
WHERE schemaname = 'public'

UNION ALL

SELECT 
    'Total de ENUMs',
    COUNT(*)::text
FROM pg_type
WHERE typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public')
AND typtype = 'e';


| metrica               | valor |
| --------------------- | ----- |
| Total de Tabelas      | 123   |
| Total de Colunas      | 1899  |
| Total de Foreign Keys | 158   |
| Total de Índices      | 427   |
| Total de ENUMs        | 0     |