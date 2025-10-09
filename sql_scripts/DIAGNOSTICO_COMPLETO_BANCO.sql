-- ============================================
-- 🔍 DIAGNÓSTICO COMPLETO DO BANCO DE DADOS
-- ============================================
-- Este script verifica o estado atual do Supabase
-- e compara com o esperado na documentação

-- ============================================
-- 1️⃣ LISTAR TODAS AS TABELAS EXISTENTES
-- ============================================

SELECT 
    table_name,
    (SELECT COUNT(*) FROM information_schema.columns WHERE table_name = t.table_name) as num_colunas
FROM information_schema.tables t
WHERE table_schema = 'public'
ORDER BY table_name;


| table_name                      | num_colunas |
| ------------------------------- | ----------- |
| achievements                    | 11          |
| achievements_educacionais       | 10          |
| achievements_progress           | 10          |
| adaptacoes_espacos_alternativos | 23          |
| admin_alunos                    | 24          |
| admin_professores               | 21          |
| admin_usuarios_completos        | 23          |
| admins                          | 7           |
| alpha_competencias              | 11          |
| alpha_desafios                  | 21          |
| alpha_metodologias              | 25          |
| alpha_progresso                 | 12          |
| alpha_submissoes                | 17          |
| alunos                          | 9           |
| audit_activities                | 15          |
| aula_atividades                 | 4           |
| aula_checklist                  | 5           |
| aula_criterios_avaliacao        | 3           |
| aula_desafio_alpha              | 3           |
| aula_desafios                   | 7           |
| aula_feedback                   | 5           |
| aula_feedbacks                  | 5           |
| aula_materiais                  | 5           |
| aula_permissoes                 | 5           |
| aula_registros                  | 4           |
| aula_status_log                 | 5           |
| aula_tags                       | 4           |
| aulas                           | 14          |
| autoavaliacoes                  | 18          |
| avaliacoes_rubricas             | 9           |
| capacitacao_docente             | 24          |
| cessoes_instrumentos            | 15          |
| comunicacao_engajamento         | 26          |
| desafios_alpha                  | 14          |
| desafios_alpha_respostas        | 10          |
| devotional_content              | 11          |
| documentos_institucionais       | 23          |
| experiencias_brasileiras        | 19          |
| feedback_pares                  | 13          |
| forum_likes                     | 4           |
| forum_perguntas                 | 11          |
| forum_respostas                 | 7           |
| historico_instrumentos          | 7           |
| hook_cache                      | 9           |
| indicadores_impacto             | 9           |
| instrumento_curiosidades        | 9           |
| instrumento_midias              | 18          |
| instrumento_performances        | 14          |
| instrumento_quiz                | 15          |
| instrumento_sons                | 11          |
| instrumento_sons_variacoes      | 10          |
| instrumento_tecnicas            | 14          |
| instrumentos                    | 16          |
| instrumentos_alunos             | 11          |
| instrumentos_fisicos            | 15          |
| instrumentos_relacionados       | 7           |
| lessons                         | 21          |
| logos                           | 6           |
| manutencoes_instrumentos        | 14          |
| materiais_apoio                 | 19          |
| matriculas                      | 15          |
| metodologias_ensino             | 17          |
| migration_log                   | 5           |
| modules                         | 14          |
| modulos                         | 6           |
| permission_templates            | 7           |
| permissions                     | 4           |
| portfolio_evidencias            | 21          |
| portfolios                      | 17          |
| presencas                       | 7           |
| professor_instrumentos          | 8           |
| professores                     | 6           |
| professores_categorias          | 8           |
| professores_conteudos           | 21          |
| professores_dashboard_stats     | 10          |
| profiles                        | 26          |
| proposta_curricular             | 22          |
| qr_codes                        | 13          |
| qr_scans                        | 10          |
| referenciais_internacionais     | 16          |
| repertorio_musical              | 22          |
| role_permissions                | 2           |
| roles                           | 4           |
| rubricas_avaliacao              | 11          |
| sequencias_didaticas            | 14          |
| sequencias_didaticas_expandidas | 25          |
| sistema_presto                  | 17          |
| trigger_logs                    | 7           |
| turma_alunos                    | 3           |
| turmas                          | 21          |
| user_achievements               | 5           |
| user_devotional_progress        | 6           |
| user_notifications              | 12          |
| user_points_log                 | 10          |
| user_progress                   | 9           |
| user_roles                      | 12          |
| usuarios                        | 5           |
| view_admin_dashboard            | 15          |
| view_attendance_analytics       | 12          |
| view_aulas_admin                | 13          |


-- ============================================
-- 2️⃣ VERIFICAR TABELAS CRÍTICAS (Documento espera 68)
-- ============================================

-- Tabelas de Autenticação & Perfil
SELECT 'profiles' as tabela_critica, 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'profiles') as existe;

       | tabela_critica | existe |
| -------------- | ------ |
| profiles       | true   |

-- Tabelas de Gamificação
SELECT 'achievements' as tabela_critica, 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'achievements') as existe
UNION ALL
SELECT 'user_achievements', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'user_achievements')
UNION ALL
SELECT 'achievements_progress', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'achievements_progress')
UNION ALL
SELECT 'user_points_log', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'user_points_log');

-- Tabelas de Portfólio
SELECT 'portfolios' as tabela_critica, 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'portfolios') as existe
UNION ALL
SELECT 'portfolio_evidencias', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'portfolio_evidencias')
UNION ALL
SELECT 'portfolio_avaliacoes', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'portfolio_avaliacoes');

| tabela_critica       | existe |
| -------------------- | ------ |
| portfolios           | true   |
| portfolio_evidencias | true   |
| portfolio_avaliacoes | false  |
    

-- Tabelas de Alpha Desafios
SELECT 'alpha_desafios' as tabela_critica, 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'alpha_desafios') as existe
UNION ALL
SELECT 'alpha_submissoes', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'alpha_submissoes')
UNION ALL
SELECT 'alpha_avaliacoes', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'alpha_avaliacoes');

| tabela_critica   | existe |
| ---------------- | ------ |
| alpha_desafios   | true   |
| alpha_submissoes | true   |
| alpha_avaliacoes | false  |

-- Tabelas de Turmas & Aulas
SELECT 'turmas' as tabela_critica, 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'turmas') as existe
UNION ALL
SELECT 'matriculas', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'matriculas')
UNION ALL
SELECT 'aulas', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'aulas')
UNION ALL
SELECT 'presencas', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'presencas');


       | tabela_critica | existe |
| -------------- | ------ |
| turmas         | true   |
| matriculas     | true   |
| aulas          | true   |
| presencas      | true   |

-- Tabelas de Instrumentos
SELECT 'instrumentos_musicais' as tabela_critica, 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'instrumentos_musicais') as existe
UNION ALL
SELECT 'user_instruments', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'user_instruments')
UNION ALL
SELECT 'emprestimos', 
       EXISTS(SELECT 1 FROM information_schema.tables WHERE table_name = 'emprestimos');


       | tabela_critica        | existe |
| --------------------- | ------ |
| instrumentos_musicais | false  |
| user_instruments      | false  |
| emprestimos           | false  |

-- ============================================
-- 3️⃣ ESTRUTURA DETALHADA DAS TABELAS PRÉ-EXISTENTES
-- ============================================

-- achievements
SELECT 'achievements' as tabela, column_name, data_type, is_nullable
FROM information_schema.columns 
WHERE table_name = 'achievements'
ORDER BY ordinal_position;

| tabela       | column_name       | data_type                | is_nullable |
| ------------ | ----------------- | ------------------------ | ----------- |
| achievements | id                | uuid                     | NO          |
| achievements | name              | text                     | NO          |
| achievements | description       | text                     | YES         |
| achievements | badge_icon        | text                     | YES         |
| achievements | badge_color       | text                     | YES         |
| achievements | points_reward     | integer                  | YES         |
| achievements | category          | text                     | YES         |
| achievements | requirement_type  | text                     | YES         |
| achievements | requirement_value | integer                  | YES         |
| achievements | is_active         | boolean                  | YES         |
| achievements | created_at        | timestamp with time zone | YES         |

-- user_points_log
SELECT 'user_points_log' as tabela, column_name, data_type, is_nullable
FROM information_schema.columns 
WHERE table_name = 'user_points_log'
ORDER BY ordinal_position;


| tabela          | column_name   | data_type                | is_nullable |
| --------------- | ------------- | ------------------------ | ----------- |
| user_points_log | id            | uuid                     | NO          |
| user_points_log | user_id       | uuid                     | YES         |
| user_points_log | action        | text                     | NO          |
| user_points_log | points_earned | integer                  | NO          |
| user_points_log | multiplier    | numeric                  | YES         |
| user_points_log | source_type   | text                     | NO          |
| user_points_log | source_id     | uuid                     | YES         |
| user_points_log | notes         | text                     | YES         |
| user_points_log | aula_id       | uuid                     | YES         |
| user_points_log | created_at    | timestamp with time zone | YES         |

-- turmas
SELECT 'turmas' as tabela, column_name, data_type, is_nullable
FROM information_schema.columns 
WHERE table_name = 'turmas'
ORDER BY ordinal_position;

| tabela | column_name         | data_type                   | is_nullable |
| ------ | ------------------- | --------------------------- | ----------- |
| turmas | id                  | uuid                        | NO          |
| turmas | nome                | character varying           | NO          |
| turmas | descricao           | text                        | YES         |
| turmas | professor_id        | uuid                        | NO          |
| turmas | instrumento_id      | uuid                        | NO          |
| turmas | nivel               | character varying           | NO          |
| turmas | max_alunos          | integer                     | YES         |
| turmas | min_alunos          | integer                     | YES         |
| turmas | valor_mensalidade   | numeric                     | YES         |
| turmas | horarios            | jsonb                       | YES         |
| turmas | status              | character varying           | YES         |
| turmas | data_inicio         | date                        | YES         |
| turmas | data_fim            | date                        | YES         |
| turmas | observacoes         | text                        | YES         |
| turmas | modalidade          | character varying           | YES         |
| turmas | local               | character varying           | YES         |
| turmas | material_necessario | text                        | YES         |
| turmas | pre_requisitos      | text                        | YES         |
| turmas | ativo               | boolean                     | YES         |
| turmas | criado_em           | timestamp without time zone | YES         |
| turmas | atualizado_em       | timestamp without time zone | YES         |


-- matriculas
SELECT 'matriculas' as tabela, column_name, data_type, is_nullable
FROM information_schema.columns 
WHERE table_name = 'matriculas'
ORDER BY ordinal_position;


| tabela     | column_name         | data_type                   | is_nullable |
| ---------- | ------------------- | --------------------------- | ----------- |
| matriculas | id                  | uuid                        | NO          |
| matriculas | turma_id            | uuid                        | NO          |
| matriculas | aluno_id            | uuid                        | NO          |
| matriculas | status              | character varying           | YES         |
| matriculas | data_matricula      | date                        | YES         |
| matriculas | data_inicio_aulas   | date                        | YES         |
| matriculas | data_cancelamento   | date                        | YES         |
| matriculas | motivo_cancelamento | text                        | YES         |
| matriculas | valor_acordado      | numeric                     | YES         |
| matriculas | desconto_aplicado   | numeric                     | YES         |
| matriculas | forma_pagamento     | character varying           | YES         |
| matriculas | observacoes         | text                        | YES         |
| matriculas | notas_professor     | text                        | YES         |
| matriculas | criado_em           | timestamp without time zone | YES         |
| matriculas | atualizado_em       | timestamp without time zone | YES         |

-- aulas
SELECT 'aulas' as tabela, column_name, data_type, is_nullable
FROM information_schema.columns 
WHERE table_name = 'aulas'
ORDER BY ordinal_position;


| tabela | column_name       | data_type                   | is_nullable |
| ------ | ----------------- | --------------------------- | ----------- |
| aulas  | id                | uuid                        | NO          |
| aulas  | numero            | integer                     | NO          |
| aulas  | titulo            | text                        | NO          |
| aulas  | modulo_id         | uuid                        | YES         |
| aulas  | data_programada   | date                        | NO          |
| aulas  | objetivo_didatico | text                        | YES         |
| aulas  | resumo_atividades | text                        | YES         |
| aulas  | desafio_alpha     | text                        | YES         |
| aulas  | nivel             | text                        | YES         |
| aulas  | formato           | text                        | YES         |
| aulas  | status            | text                        | YES         |
| aulas  | criado_em         | timestamp without time zone | YES         |
| aulas  | responsavel_id    | uuid                        | YES         |
| aulas  | detalhes_aula     | jsonb                       | YES         |

-- presencas
SELECT 'presencas' as tabela, column_name, data_type, is_nullable
FROM information_schema.columns 
WHERE table_name = 'presencas'  
ORDER BY ordinal_position;

| tabela    | column_name   | data_type                   | is_nullable |
| --------- | ------------- | --------------------------- | ----------- |
| presencas | id            | uuid                        | NO          |
| presencas | matricula_id  | uuid                        | NO          |
| presencas | data_aula     | date                        | NO          |
| presencas | presente      | boolean                     | YES         |
| presencas | justificativa | text                        | YES         |
| presencas | observacoes   | text                        | YES         |
| presencas | criado_em     | timestamp without time zone | YES         |

-- ============================================
-- 4️⃣ VERIFICAR ÍNDICES EXISTENTES
-- ============================================

SELECT 
    tablename,
    indexname,
    indexdef
FROM pg_indexes 
WHERE schemaname = 'public'
ORDER BY tablename, indexname;


| tablename                       | indexname                                                 | indexdef                                                                                                                                                       |
| ------------------------------- | --------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| achievements                    | achievements_pkey                                         | CREATE UNIQUE INDEX achievements_pkey ON public.achievements USING btree (id)                                                                                  |
| achievements                    | idx_achievements_active                                   | CREATE INDEX idx_achievements_active ON public.achievements USING btree (is_active)                                                                            |
| achievements                    | idx_achievements_category                                 | CREATE INDEX idx_achievements_category ON public.achievements USING btree (category)                                                                           |
| achievements                    | idx_achievements_requirement_type                         | CREATE INDEX idx_achievements_requirement_type ON public.achievements USING btree (requirement_type)                                                           |
| achievements_educacionais       | achievements_educacionais_pkey                            | CREATE UNIQUE INDEX achievements_educacionais_pkey ON public.achievements_educacionais USING btree (id)                                                        |
| achievements_progress           | achievements_progress_pkey                                | CREATE UNIQUE INDEX achievements_progress_pkey ON public.achievements_progress USING btree (id)                                                                |
| achievements_progress           | achievements_progress_user_id_achievement_id_key          | CREATE UNIQUE INDEX achievements_progress_user_id_achievement_id_key ON public.achievements_progress USING btree (user_id, achievement_id)                     |
| achievements_progress           | idx_achievement_progress                                  | CREATE INDEX idx_achievement_progress ON public.achievements_progress USING btree (user_id, is_completed, updated_at DESC)                                     |
| achievements_progress           | idx_achievements_progress_user_id                         | CREATE INDEX idx_achievements_progress_user_id ON public.achievements_progress USING btree (user_id)                                                           |
| adaptacoes_espacos_alternativos | adaptacoes_espacos_alternativos_pkey                      | CREATE UNIQUE INDEX adaptacoes_espacos_alternativos_pkey ON public.adaptacoes_espacos_alternativos USING btree (id)                                            |
| admins                          | admins_pkey                                               | CREATE UNIQUE INDEX admins_pkey ON public.admins USING btree (id)                                                                                              |
| alpha_competencias              | alpha_competencias_pkey                                   | CREATE UNIQUE INDEX alpha_competencias_pkey ON public.alpha_competencias USING btree (id)                                                                      |
| alpha_competencias              | idx_alpha_competencias_metodologia                        | CREATE INDEX idx_alpha_competencias_metodologia ON public.alpha_competencias USING btree (metodologia_id)                                                      |
| alpha_desafios                  | alpha_desafios_pkey                                       | CREATE UNIQUE INDEX alpha_desafios_pkey ON public.alpha_desafios USING btree (id)                                                                              |
| alpha_desafios                  | idx_alpha_desafios_competencia                            | CREATE INDEX idx_alpha_desafios_competencia ON public.alpha_desafios USING btree (competencia_id)                                                              |
| alpha_desafios                  | idx_alpha_desafios_metodologia                            | CREATE INDEX idx_alpha_desafios_metodologia ON public.alpha_desafios USING btree (metodologia_id)                                                              |
| alpha_desafios                  | idx_alpha_desafios_search                                 | CREATE INDEX idx_alpha_desafios_search ON public.alpha_desafios USING gin (to_tsvector('portuguese'::regconfig, (((titulo)::text || ' '::text) || descricao))) |
| alpha_metodologias              | alpha_metodologias_codigo_key                             | CREATE UNIQUE INDEX alpha_metodologias_codigo_key ON public.alpha_metodologias USING btree (codigo)                                                            |
| alpha_metodologias              | alpha_metodologias_pkey                                   | CREATE UNIQUE INDEX alpha_metodologias_pkey ON public.alpha_metodologias USING btree (id)                                                                      |
| alpha_metodologias              | idx_alpha_metodologias_ativo                              | CREATE INDEX idx_alpha_metodologias_ativo ON public.alpha_metodologias USING btree (ativo) WHERE (ativo = true)                                                |
| alpha_metodologias              | idx_alpha_metodologias_codigo                             | CREATE INDEX idx_alpha_metodologias_codigo ON public.alpha_metodologias USING btree (codigo)                                                                   |
| alpha_progresso                 | alpha_progresso_pkey                                      | CREATE UNIQUE INDEX alpha_progresso_pkey ON public.alpha_progresso USING btree (id)                                                                            |
| alpha_progresso                 | alpha_progresso_user_id_metodologia_id_competencia_id_key | CREATE UNIQUE INDEX alpha_progresso_user_id_metodologia_id_competencia_id_key ON public.alpha_progresso USING btree (user_id, metodologia_id, competencia_id)  |
| alpha_progresso                 | idx_alpha_progresso_user                                  | CREATE INDEX idx_alpha_progresso_user ON public.alpha_progresso USING btree (user_id)                                                                          |
| alpha_submissoes                | alpha_submissoes_pkey                                     | CREATE UNIQUE INDEX alpha_submissoes_pkey ON public.alpha_submissoes USING btree (id)                                                                          |
| alpha_submissoes                | idx_alpha_submissoes_desafio                              | CREATE INDEX idx_alpha_submissoes_desafio ON public.alpha_submissoes USING btree (desafio_id)                                                                  |
| alpha_submissoes                | idx_alpha_submissoes_status                               | CREATE INDEX idx_alpha_submissoes_status ON public.alpha_submissoes USING btree (status)                                                                       |
| alpha_submissoes                | idx_alpha_submissoes_user                                 | CREATE INDEX idx_alpha_submissoes_user ON public.alpha_submissoes USING btree (user_id)                                                                        |
| alpha_submissoes                | idx_alpha_submissoes_user_id                              | CREATE INDEX idx_alpha_submissoes_user_id ON public.alpha_submissoes USING btree (user_id)                                                                     |
| alunos                          | aluno_id_unique                                           | CREATE UNIQUE INDEX aluno_id_unique ON public.alunos USING btree (id)                                                                                          |
| alunos                          | alunos_pkey                                               | CREATE UNIQUE INDEX alunos_pkey ON public.alunos USING btree (id)                                                                                              |
| alunos                          | idx_alunos_instrumento                                    | CREATE INDEX idx_alunos_instrumento ON public.alunos USING btree (instrumento_id)                                                                              |
| audit_activities                | audit_activities_pkey                                     | CREATE UNIQUE INDEX audit_activities_pkey ON public.audit_activities USING btree (id)                                                                          |
| audit_activities                | idx_audit_action_time                                     | CREATE INDEX idx_audit_action_time ON public.audit_activities USING btree (action, created_at DESC)                                                            |
| audit_activities                | idx_audit_activities_created_at                           | CREATE INDEX idx_audit_activities_created_at ON public.audit_activities USING btree (created_at DESC)                                                          |
| audit_activities                | idx_audit_resource                                        | CREATE INDEX idx_audit_resource ON public.audit_activities USING btree (resource, resource_id)                                                                 |
| audit_activities                | idx_audit_severity                                        | CREATE INDEX idx_audit_severity ON public.audit_activities USING btree (severity, created_at DESC) WHERE (severity <> 'info'::text)                            |
| audit_activities                | idx_audit_user_time                                       | CREATE INDEX idx_audit_user_time ON public.audit_activities USING btree (user_id, created_at DESC)                                                             |
| aula_atividades                 | aula_atividades_pkey                                      | CREATE UNIQUE INDEX aula_atividades_pkey ON public.aula_atividades USING btree (id)                                                                            |
| aula_atividades                 | idx_aula_atividades_aula_id                               | CREATE INDEX idx_aula_atividades_aula_id ON public.aula_atividades USING btree (aula_id)                                                                       |
| aula_checklist                  | aula_checklist_pkey                                       | CREATE UNIQUE INDEX aula_checklist_pkey ON public.aula_checklist USING btree (id)                                                                              |
| aula_checklist                  | idx_aula_checklist_aula_id                                | CREATE INDEX idx_aula_checklist_aula_id ON public.aula_checklist USING btree (aula_id)                                                                         |
| aula_criterios_avaliacao        | aula_criterios_avaliacao_pkey                             | CREATE UNIQUE INDEX aula_criterios_avaliacao_pkey ON public.aula_criterios_avaliacao USING btree (id)                                                          |
| aula_criterios_avaliacao        | idx_aula_criterios_aula_id                                | CREATE INDEX idx_aula_criterios_aula_id ON public.aula_criterios_avaliacao USING btree (aula_id)                                                               |
| aula_desafio_alpha              | aula_desafio_alpha_pkey                                   | CREATE UNIQUE INDEX aula_desafio_alpha_pkey ON public.aula_desafio_alpha USING btree (id)                                                                      |
| aula_desafio_alpha              | idx_aula_desafio_alpha_aula_id                            | CREATE INDEX idx_aula_desafio_alpha_aula_id ON public.aula_desafio_alpha USING btree (aula_id)                                                                 |
| aula_desafios                   | aula_desafios_pkey                                        | CREATE UNIQUE INDEX aula_desafios_pkey ON public.aula_desafios USING btree (id)                                                                                |
| aula_desafios                   | idx_aula_desafios_aula_id                                 | CREATE INDEX idx_aula_desafios_aula_id ON public.aula_desafios USING btree (aula_id)                                                                           |
| aula_feedback                   | aula_feedback_pkey                                        | CREATE UNIQUE INDEX aula_feedback_pkey ON public.aula_feedback USING btree (id)                                                                                |
| aula_feedback                   | idx_aula_feedback_aula_id                                 | CREATE INDEX idx_aula_feedback_aula_id ON public.aula_feedback USING btree (aula_id)                                                                           |
| aula_feedbacks                  | aula_feedbacks_pkey                                       | CREATE UNIQUE INDEX aula_feedbacks_pkey ON public.aula_feedbacks USING btree (id)                                                                              |
| aula_feedbacks                  | idx_aula_feedbacks_aula_id                                | CREATE INDEX idx_aula_feedbacks_aula_id ON public.aula_feedbacks USING btree (aula_id)                                                                         |
| aula_materiais                  | aula_materiais_pkey                                       | CREATE UNIQUE INDEX aula_materiais_pkey ON public.aula_materiais USING btree (id)                                                                              |
| aula_materiais                  | idx_aula_materiais_aula_id                                | CREATE INDEX idx_aula_materiais_aula_id ON public.aula_materiais USING btree (aula_id)                                                                         |
| aula_permissoes                 | aula_permissoes_pkey                                      | CREATE UNIQUE INDEX aula_permissoes_pkey ON public.aula_permissoes USING btree (id)                                                                            |
| aula_permissoes                 | idx_aula_permissoes_aula_id                               | CREATE INDEX idx_aula_permissoes_aula_id ON public.aula_permissoes USING btree (aula_id)                                                                       |
| aula_registros                  | aula_registros_pkey                                       | CREATE UNIQUE INDEX aula_registros_pkey ON public.aula_registros USING btree (id)                                                                              |
| aula_registros                  | idx_aula_registros_aula_id                                | CREATE INDEX idx_aula_registros_aula_id ON public.aula_registros USING btree (aula_id)                                                                         |
| aula_status_log                 | aula_status_log_pkey                                      | CREATE UNIQUE INDEX aula_status_log_pkey ON public.aula_status_log USING btree (id)                                                                            |
| aula_status_log                 | idx_aula_status_log_aula_id                               | CREATE INDEX idx_aula_status_log_aula_id ON public.aula_status_log USING btree (aula_id)                                                                       |
| aula_tags                       | aula_tags_pkey                                            | CREATE UNIQUE INDEX aula_tags_pkey ON public.aula_tags USING btree (id)                                                                                        |
| aula_tags                       | idx_aula_tags_aula_id                                     | CREATE INDEX idx_aula_tags_aula_id ON public.aula_tags USING btree (aula_id)                                                                                   |
| aulas                           | aulas_pkey                                                | CREATE UNIQUE INDEX aulas_pkey ON public.aulas USING btree (id)                                                                                                |
| aulas                           | idx_aulas_responsavel_id                                  | CREATE INDEX idx_aulas_responsavel_id ON public.aulas USING btree (responsavel_id)                                                                             |
| autoavaliacoes                  | autoavaliacoes_pkey                                       | CREATE UNIQUE INDEX autoavaliacoes_pkey ON public.autoavaliacoes USING btree (id)                                                                              |
| autoavaliacoes                  | idx_autoavaliacoes_periodo                                | CREATE INDEX idx_autoavaliacoes_periodo ON public.autoavaliacoes USING btree (periodo_tipo)                                                                    |
| autoavaliacoes                  | idx_autoavaliacoes_portfolio                              | CREATE INDEX idx_autoavaliacoes_portfolio ON public.autoavaliacoes USING btree (portfolio_id)                                                                  |
| autoavaliacoes                  | idx_autoavaliacoes_user                                   | CREATE INDEX idx_autoavaliacoes_user ON public.autoavaliacoes USING btree (user_id)                                                                            |
| avaliacoes_rubricas             | avaliacoes_rubricas_pkey                                  | CREATE UNIQUE INDEX avaliacoes_rubricas_pkey ON public.avaliacoes_rubricas USING btree (id)                                                                    |
| avaliacoes_rubricas             | idx_avaliacoes_rubrica                                    | CREATE INDEX idx_avaliacoes_rubrica ON public.avaliacoes_rubricas USING btree (rubrica_id)                                                                     |
| capacitacao_docente             | capacitacao_docente_pkey                                  | CREATE UNIQUE INDEX capacitacao_docente_pkey ON public.capacitacao_docente USING btree (id)                                                                    |
| capacitacao_docente             | idx_capacitacao_professor                                 | CREATE INDEX idx_capacitacao_professor ON public.capacitacao_docente USING btree (professor_id)                                                                |
| cessoes_instrumentos            | cessoes_instrumentos_pkey                                 | CREATE UNIQUE INDEX cessoes_instrumentos_pkey ON public.cessoes_instrumentos USING btree (id)                                                                  |
| cessoes_instrumentos            | idx_cessoes_aluno_id                                      | CREATE INDEX idx_cessoes_aluno_id ON public.cessoes_instrumentos USING btree (aluno_id)                                                                        |
| cessoes_instrumentos            | idx_cessoes_data_inicio                                   | CREATE INDEX idx_cessoes_data_inicio ON public.cessoes_instrumentos USING btree (data_inicio)                                                                  |
| cessoes_instrumentos            | idx_cessoes_instrumento_fisico_id                         | CREATE INDEX idx_cessoes_instrumento_fisico_id ON public.cessoes_instrumentos USING btree (instrumento_fisico_id)                                              |
| comunicacao_engajamento         | comunicacao_engajamento_pkey                              | CREATE UNIQUE INDEX comunicacao_engajamento_pkey ON public.comunicacao_engajamento USING btree (id)                                                            |
| desafios_alpha                  | desafios_alpha_pkey                                       | CREATE UNIQUE INDEX desafios_alpha_pkey ON public.desafios_alpha USING btree (id)                                                                              |
| desafios_alpha_respostas        | desafios_alpha_respostas_pkey                             | CREATE UNIQUE INDEX desafios_alpha_respostas_pkey ON public.desafios_alpha_respostas USING btree (id)                                                          |
| devotional_content              | devotional_content_pkey                                   | CREATE UNIQUE INDEX devotional_content_pkey ON public.devotional_content USING btree (id)                                                                      |
| devotional_content              | idx_devotional_content_category                           | CREATE INDEX idx_devotional_content_category ON public.devotional_content USING btree (category)                                                               |
| devotional_content              | idx_devotional_content_published                          | CREATE INDEX idx_devotional_content_published ON public.devotional_content USING btree (is_published)                                                          |
| devotional_content              | idx_devotional_content_published_date                     | CREATE INDEX idx_devotional_content_published_date ON public.devotional_content USING btree (published_date DESC)                                              |
| documentos_institucionais       | documentos_institucionais_pkey                            | CREATE UNIQUE INDEX documentos_institucionais_pkey ON public.documentos_institucionais USING btree (id)                                                        |
| experiencias_brasileiras        | experiencias_brasileiras_pkey                             | CREATE UNIQUE INDEX experiencias_brasileiras_pkey ON public.experiencias_brasileiras USING btree (id)                                                          |
| experiencias_brasileiras        | idx_experiencias_regiao                                   | CREATE INDEX idx_experiencias_regiao ON public.experiencias_brasileiras USING btree (regiao_brasil)                                                            |
| experiencias_brasileiras        | idx_experiencias_status                                   | CREATE INDEX idx_experiencias_status ON public.experiencias_brasileiras USING btree (status_projeto)                                                           |
| experiencias_brasileiras        | idx_experiencias_tipo                                     | CREATE INDEX idx_experiencias_tipo ON public.experiencias_brasileiras USING btree (tipo_experiencia)                                                           |
| feedback_pares                  | feedback_pares_pkey                                       | CREATE UNIQUE INDEX feedback_pares_pkey ON public.feedback_pares USING btree (id)                                                                              |
| feedback_pares                  | idx_feedback_avaliado                                     | CREATE INDEX idx_feedback_avaliado ON public.feedback_pares USING btree (avaliado_id)                                                                          |
| feedback_pares                  | idx_feedback_avaliador                                    | CREATE INDEX idx_feedback_avaliador ON public.feedback_pares USING btree (avaliador_id)                                                                        |
| feedback_pares                  | idx_feedback_evidencia                                    | CREATE INDEX idx_feedback_evidencia ON public.feedback_pares USING btree (evidencia_id)                                                                        |
| feedback_pares                  | idx_feedback_pares_evidencia                              | CREATE INDEX idx_feedback_pares_evidencia ON public.feedback_pares USING btree (evidencia_id)                                                                  |
| forum_likes                     | forum_likes_pkey                                          | CREATE UNIQUE INDEX forum_likes_pkey ON public.forum_likes USING btree (id)                                                                                    |
| forum_likes                     | forum_likes_user_id_resposta_id_key                       | CREATE UNIQUE INDEX forum_likes_user_id_resposta_id_key ON public.forum_likes USING btree (user_id, resposta_id)                                               |
| forum_perguntas                 | forum_perguntas_pkey                                      | CREATE UNIQUE INDEX forum_perguntas_pkey ON public.forum_perguntas USING btree (id)                                                                            |
| forum_perguntas                 | idx_forum_perguntas_aluno                                 | CREATE INDEX idx_forum_perguntas_aluno ON public.forum_perguntas USING btree (aluno_id)                                                                        |
| forum_perguntas                 | idx_forum_perguntas_modulo                                | CREATE INDEX idx_forum_perguntas_modulo ON public.forum_perguntas USING btree (modulo_id)                                                                      |
| forum_perguntas                 | idx_forum_perguntas_status                                | CREATE INDEX idx_forum_perguntas_status ON public.forum_perguntas USING btree (status)                                                                         |
| forum_respostas                 | forum_respostas_pkey                                      | CREATE UNIQUE INDEX forum_respostas_pkey ON public.forum_respostas USING btree (id)                                                                            |


-- ============================================
-- 5️⃣ VERIFICAR POLÍTICAS RLS
-- ============================================

SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual
FROM pg_policies 
WHERE schemaname = 'public'
ORDER BY tablename, policyname;

| schemaname | tablename                  | policyname                                           | permissive | roles           | cmd    | qual                                                                                                                                                                                                                                                                                                 |
| ---------- | -------------------------- | ---------------------------------------------------- | ---------- | --------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| public     | achievements               | Achievements are viewable by everyone                | PERMISSIVE | {public}        | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | achievements               | Anyone can view public achievements                  | PERMISSIVE | {public}        | SELECT | (is_active = true)                                                                                                                                                                                                                                                                                   |
| public     | achievements_progress      | achievements_progress_simple                         | PERMISSIVE | {public}        | ALL    | (user_id = auth.uid())                                                                                                                                                                                                                                                                               |
| public     | admins                     | admins_simple_access                                 | PERMISSIVE | {public}        | ALL    | (id = auth.uid())                                                                                                                                                                                                                                                                                    |
| public     | alpha_competencias         | Competências são visíveis para todos                 | PERMISSIVE | {public}        | SELECT | (ativo = true)                                                                                                                                                                                                                                                                                       |
| public     | alpha_desafios             | Desafios são visíveis para todos                     | PERMISSIVE | {public}        | SELECT | (ativo = true)                                                                                                                                                                                                                                                                                       |
| public     | alpha_metodologias         | Metodologias são visíveis para todos                 | PERMISSIVE | {public}        | SELECT | (ativo = true)                                                                                                                                                                                                                                                                                       |
| public     | alpha_progresso            | Sistema pode gerenciar progresso                     | PERMISSIVE | {public}        | ALL    | true                                                                                                                                                                                                                                                                                                 |
| public     | alpha_progresso            | Usuários veem seu próprio progresso                  | PERMISSIVE | {public}        | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | alpha_submissoes           | Admin gerencia todas submissoes alpha                | PERMISSIVE | {authenticated} | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | alpha_submissoes           | Admin vê todas submissoes                            | PERMISSIVE | {authenticated} | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | alpha_submissoes           | Aluno cria próprias submissoes alpha                 | PERMISSIVE | {authenticated} | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | alpha_submissoes           | Aluno vê próprias submissoes                         | PERMISSIVE | {authenticated} | SELECT | (user_id = auth.uid())                                                                                                                                                                                                                                                                               |
| public     | alpha_submissoes           | Aluno vê próprias submissoes alpha                   | PERMISSIVE | {authenticated} | SELECT | (user_id = auth.uid())                                                                                                                                                                                                                                                                               |
| public     | alpha_submissoes           | Professor avalia submissoes de seus alunos           | PERMISSIVE | {authenticated} | UPDATE | is_professor_of_student(user_id)                                                                                                                                                                                                                                                                     |
| public     | alpha_submissoes           | Professor vê submissoes de alunos                    | PERMISSIVE | {authenticated} | SELECT | is_professor_of_student(user_id)                                                                                                                                                                                                                                                                     |
| public     | alpha_submissoes           | Professor vê submissoes de seus alunos               | PERMISSIVE | {authenticated} | SELECT | is_professor_of_student(user_id)                                                                                                                                                                                                                                                                     |
| public     | alpha_submissoes           | Usuários podem atualizar suas submissões             | PERMISSIVE | {public}        | UPDATE | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | alpha_submissoes           | Usuários podem criar submissões                      | PERMISSIVE | {public}        | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | alpha_submissoes           | Usuários veem suas próprias submissões               | PERMISSIVE | {public}        | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | alunos                     | Admins veem todos alunos                             | PERMISSIVE | {authenticated} | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | alunos                     | Alunos veem próprios dados                           | PERMISSIVE | {authenticated} | SELECT | (auth.uid() = id)                                                                                                                                                                                                                                                                                    |
| public     | alunos                     | Professores veem seus alunos                         | PERMISSIVE | {authenticated} | SELECT | is_professor_of_student(id)                                                                                                                                                                                                                                                                          |
| public     | audit_activities           | admin_full_access_audit                              | PERMISSIVE | {authenticated} | ALL    | ((detect_user_role(auth.uid()) ->> 'role'::text) = 'admin'::text)                                                                                                                                                                                                                                    |
| public     | audit_activities           | audit_activities_simple                              | PERMISSIVE | {public}        | SELECT | (user_id = auth.uid())                                                                                                                                                                                                                                                                               |
| public     | aula_atividades            | Acesso via aula                                      | PERMISSIVE | {authenticated} | SELECT | (EXISTS ( SELECT 1
   FROM aulas a
  WHERE ((a.id = aula_atividades.aula_id) AND ((a.responsavel_id = auth.uid()) OR is_admin(auth.uid())))))                                                                                                                                                        |
| public     | aula_atividades            | aula_atividades_access                               | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_checklist             | aula_checklist_access                                | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | aula_criterios_avaliacao   | aula_criterios_avaliacao_access                      | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | aula_desafio_alpha         | aula_desafio_alpha_access                            | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_desafios              | aula_desafios_access                                 | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_feedback              | aula_feedback_access                                 | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_feedbacks             | aula_feedbacks_access                                | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_materiais             | aula_materiais_access                                | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_permissoes            | aula_permissoes_admin                                | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | aula_registros             | aula_registros_access                                | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_status_log            | aula_status_log_staff                                | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | aula_tags                  | aula_tags_read                                       | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | aulas                      | Admin gerencia todas aulas                           | PERMISSIVE | {authenticated} | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | aulas                      | Aluno vê aulas de suas turmas                        | PERMISSIVE | {authenticated} | SELECT | (EXISTS ( SELECT 1
   FROM (matriculas m
     JOIN turmas t ON ((t.id = m.turma_id)))
  WHERE ((m.aluno_id = auth.uid()) AND ((m.status)::text = 'ativa'::text))))                                                                                                                                   |
| public     | aulas                      | Professor vê suas aulas                              | PERMISSIVE | {authenticated} | ALL    | (responsavel_id = auth.uid())                                                                                                                                                                                                                                                                        |
| public     | aulas                      | aulas_modify_staff                                   | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | aulas                      | aulas_read_all                                       | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | autoavaliacoes             | Usuários podem atualizar suas autoavaliações         | PERMISSIVE | {public}        | UPDATE | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | autoavaliacoes             | Usuários podem criar autoavaliações                  | PERMISSIVE | {public}        | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | autoavaliacoes             | Usuários veem suas autoavaliações                    | PERMISSIVE | {public}        | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | avaliacoes_rubricas        | Usuários veem avaliações de suas evidências          | PERMISSIVE | {public}        | SELECT | ((EXISTS ( SELECT 1
   FROM (portfolio_evidencias pe
     JOIN portfolios p ON ((pe.portfolio_id = p.id)))
  WHERE ((pe.id = avaliacoes_rubricas.evidencia_id) AND (p.user_id = auth.uid())))) OR (auth.uid() = avaliador_id))                                                                       |
| public     | cessoes_instrumentos       | cessoes_instrumentos_access                          | PERMISSIVE | {authenticated} | ALL    | ((aluno_id = auth.uid()) OR (EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                     |
| public     | devotional_content         | Anyone can view published devotionals                | PERMISSIVE | {public}        | SELECT | (is_published = true)                                                                                                                                                                                                                                                                                |
| public     | devotional_content         | Published devotional content is viewable by everyone | PERMISSIVE | {public}        | SELECT | (is_published = true)                                                                                                                                                                                                                                                                                |
| public     | feedback_pares             | Usuários podem dar feedback                          | PERMISSIVE | {public}        | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | feedback_pares             | Usuários veem feedback relacionado a eles            | PERMISSIVE | {public}        | SELECT | ((auth.uid() = avaliador_id) OR (auth.uid() = avaliado_id))                                                                                                                                                                                                                                          |
| public     | historico_instrumentos     | historico_instrumentos_access                        | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | hook_cache                 | users_own_cache                                      | PERMISSIVE | {authenticated} | ALL    | (user_id = auth.uid())                                                                                                                                                                                                                                                                               |
| public     | indicadores_impacto        | Usuários podem registrar indicadores                 | PERMISSIVE | {public}        | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | indicadores_impacto        | Usuários veem seus indicadores                       | PERMISSIVE | {public}        | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | instrumento_curiosidades   | instrumento_curiosidades_read                        | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_midias         | instrumento_midias_read                              | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_performances   | instrumento_performances_read                        | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_quiz           | instrumento_quiz_read                                | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_sons           | instrumento_sons_read                                | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_sons_variacoes | instrumento_sons_variacoes_read                      | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_tecnicas       | instrumento_tecnicas_read                            | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumentos               | Admin gerencia instrumentos                          | PERMISSIVE | {authenticated} | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | instrumentos               | Todos veem instrumentos ativos                       | PERMISSIVE | {authenticated} | SELECT | (ativo = true)                                                                                                                                                                                                                                                                                       |
| public     | instrumentos               | instrumentos_modify_staff                            | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | instrumentos               | instrumentos_read_all                                | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumentos_alunos        | instrumentos_alunos_access                           | PERMISSIVE | {authenticated} | ALL    | ((aluno_id = auth.uid()) OR (EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                     |
| public     | instrumentos_fisicos       | instrumentos_fisicos_access                          | PERMISSIVE | {authenticated} | ALL    | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumentos_relacionados  | instrumentos_relacionados_read                       | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | lessons                    | Anyone can view lessons from active modules          | PERMISSIVE | {public}        | SELECT | (EXISTS ( SELECT 1
   FROM modules
  WHERE ((modules.id = lessons.module_id) AND (modules.is_active = true))))                                                                                                                                                                                       |
| public     | lessons                    | Authenticated users can manage lessons               | PERMISSIVE | {public}        | ALL    | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | lessons                    | Lessons are viewable by everyone                     | PERMISSIVE | {public}        | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | lessons                    | Only admins can modify lessons                       | PERMISSIVE | {public}        | ALL    | ((auth.jwt() ->> 'role'::text) = 'admin'::text)                                                                                                                                                                                                                                                      |
| public     | logos                      | logos_modify_admin                                   | PERMISSIVE | {authenticated} | ALL    | (EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true))))                                                                                                                                                                                                     |
| public     | logos                      | logos_read_all                                       | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | manutencoes_instrumentos   | manutencoes_instrumentos_access                      | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | matriculas                 | Admin gerencia todas matriculas                      | PERMISSIVE | {authenticated} | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | matriculas                 | Aluno vê próprias matriculas                         | PERMISSIVE | {authenticated} | SELECT | (aluno_id = auth.uid())                                                                                                                                                                                                                                                                              |
| public     | matriculas                 | Professor vê matriculas de suas turmas               | PERMISSIVE | {authenticated} | SELECT | (EXISTS ( SELECT 1
   FROM turmas t
  WHERE ((t.id = matriculas.turma_id) AND (t.professor_id = auth.uid()))))                                                                                                                                                                                       |
| public     | migration_log              | migration_log_admin_only                             | PERMISSIVE | {authenticated} | ALL    | (EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true))))                                                                                                                                                                                                     |
| public     | modules                    | Anyone can view active modules                       | PERMISSIVE | {public}        | SELECT | (is_active = true)                                                                                                                                                                                                                                                                                   |
| public     | modules                    | Authenticated users can manage modules               | PERMISSIVE | {public}        | ALL    | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | modules                    | Modules are viewable by everyone                     | PERMISSIVE | {public}        | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | modules                    | Only admins can modify modules                       | PERMISSIVE | {public}        | ALL    | ((auth.jwt() ->> 'role'::text) = 'admin'::text)                                                                                                                                                                                                                                                      |
| public     | modules                    | modules_modify_staff                                 | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | modules                    | modules_read_all                                     | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | modulos                    | modulos_modify_staff                                 | PERMISSIVE | {authenticated} | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | modulos                    | modulos_read_all                                     | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | permission_templates       | permission_templates_admin_only                      | PERMISSIVE | {authenticated} | ALL    | (EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true))))                                                                                                                                                                                                     |
| public     | permissions                | Allow admin full access                              | PERMISSIVE | {public}        | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | permissions                | Allow authenticated read access                      | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | portfolio_evidencias       | Acesso a evidências via portfolio                    | PERMISSIVE | {public}        | SELECT | (EXISTS ( SELECT 1
   FROM portfolios p
  WHERE ((p.id = portfolio_evidencias.portfolio_id) AND ((p.user_id = auth.uid()) OR ((p.visibilidade)::text = ANY ((ARRAY['turma'::character varying, 'publico'::character varying])::text[]))))))                                                          |
| public     | portfolio_evidencias       | Admin vê todas evidencias                            | PERMISSIVE | {authenticated} | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | portfolio_evidencias       | Aluno gerencia próprias evidencias                   | PERMISSIVE | {authenticated} | ALL    | (EXISTS ( SELECT 1
   FROM portfolios p
  WHERE ((p.id = portfolio_evidencias.portfolio_id) AND (p.user_id = auth.uid()))))                                                                                                                                                                          |
| public     | portfolio_evidencias       | Professor vê evidencias de seus alunos               | PERMISSIVE | {authenticated} | SELECT | (EXISTS ( SELECT 1
   FROM portfolios p
  WHERE ((p.id = portfolio_evidencias.portfolio_id) AND is_professor_of_student(p.user_id))))                                                                                                                                                                |
| public     | portfolio_evidencias       | Usuários podem atualizar suas evidências             | PERMISSIVE | {public}        | UPDATE | (EXISTS ( SELECT 1
   FROM portfolios p
  WHERE ((p.id = portfolio_evidencias.portfolio_id) AND (p.user_id = auth.uid()))))                                                                                                                                                                          |
| public     | portfolio_evidencias       | Usuários podem criar evidências em seus portfolios   | PERMISSIVE | {public}        | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | portfolios                 | Admin vê todos portfolios                            | PERMISSIVE | {authenticated} | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | portfolios                 | Aluno atualiza próprio portfolio                     | PERMISSIVE | {authenticated} | UPDATE | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |


-- ============================================
-- 6️⃣ VERIFICAR FUNCTIONS/PROCEDURES
-- ============================================

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
| atualizar_status_aula          | FUNCTION     | trigger      |
| atualizar_timestamp_portfolio  | FUNCTION     | trigger      |
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
| update_user_streak             | FUNCTION     | boolean      |


-- ============================================
-- 7️⃣ VERIFICAR VIEWS
-- ============================================

SELECT 
    table_name as view_name,
    view_definition
FROM information_schema.views 
WHERE table_schema = 'public'
ORDER BY table_name;

| view_name                             | view_definition                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| admin_alunos                          |  SELECT a.id,
    prof.nome,
    prof.email,
    prof.full_name,
    prof.phone,
    a.instrumento,
    a.nivel,
    a.turma,
    a.data_ingresso,
    a.ativo,
    a.criado_em,
    prof.last_active,
    prof.total_points,
    prof.user_level,
    prof.current_streak,
    prof.lessons_completed,
    prof.voted_logo,
    prof.has_voted,
    prof.joined_at,
    prof.dob,
    prof.city,
    prof.state,
        CASE
            WHEN (prof.last_active IS NULL) THEN 'nunca_ativo'::text
            WHEN (prof.last_active >= (CURRENT_DATE - '7 days'::interval)) THEN 'ativo'::text
            ELSE 'inativo'::text
        END AS status_atividade,
        CASE
            WHEN ((prof.nome IS NOT NULL) AND (a.instrumento IS NOT NULL)) THEN true
            ELSE false
        END AS perfil_completo
   FROM (alunos a
     LEFT JOIN profiles prof ON ((a.id = prof.id)))
  WHERE (a.ativo = true)
  ORDER BY a.criado_em DESC;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| admin_professores                     |  SELECT p.id,
    prof.nome,
    prof.email,
    prof.full_name,
    prof.phone,
    p.formacao,
    p.biografia,
    p.especialidades,
    p.ativo,
    p.criado_em,
    prof.last_active,
    prof.total_points,
    prof.user_level,
    prof.current_streak,
    prof.lessons_completed,
    prof.modules_completed,
    prof.joined_at,
        CASE
            WHEN (prof.last_active IS NULL) THEN 'nunca_ativo'::text
            WHEN (prof.last_active >= (CURRENT_DATE - '7 days'::interval)) THEN 'ativo'::text
            WHEN (prof.last_active >= (CURRENT_DATE - '30 days'::interval)) THEN 'moderado'::text
            ELSE 'inativo'::text
        END AS status_atividade,
    COALESCE(( SELECT count(*) AS count
           FROM turmas t
          WHERE (t.professor_id = p.id)), (0)::bigint) AS total_turmas,
    COALESCE(( SELECT count(DISTINCT ta.aluno_id) AS count
           FROM (turmas t
             JOIN turma_alunos ta ON ((t.id = ta.turma_id)))
          WHERE (t.professor_id = p.id)), (0)::bigint) AS total_alunos,
    COALESCE(( SELECT count(*) AS count
           FROM professores_conteudos pc
          WHERE (pc.criado_por = p.id)), (0)::bigint) AS total_conteudos
   FROM (professores p
     LEFT JOIN profiles prof ON ((p.id = prof.id)))
  WHERE (p.ativo = true)
  ORDER BY p.criado_em DESC;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| admin_usuarios_completos              |  SELECT prof.id,
    prof.nome,
    prof.email,
    prof.full_name,
    prof.phone,
    prof.tipo_usuario,
    prof.joined_at,
    prof.last_active,
    prof.total_points,
    prof.user_level,
    prof.current_streak,
    prof.best_streak,
    prof.lessons_completed,
    prof.modules_completed,
    prof.voted_logo,
    prof.has_voted,
    prof.dob,
    prof.city,
    prof.state,
        CASE
            WHEN (prof.last_active IS NULL) THEN 'nunca_ativo'::text
            WHEN (prof.last_active >= (CURRENT_DATE - '7 days'::interval)) THEN 'ativo'::text
            WHEN (prof.last_active >= (CURRENT_DATE - '30 days'::interval)) THEN 'moderado'::text
            ELSE 'inativo'::text
        END AS status_atividade,
    (EXISTS ( SELECT 1
           FROM professores
          WHERE (professores.id = prof.id))) AS e_professor,
    (EXISTS ( SELECT 1
           FROM alunos
          WHERE (alunos.id = prof.id))) AS e_aluno,
    (EXISTS ( SELECT 1
           FROM admins
          WHERE (admins.id = prof.id))) AS e_admin
   FROM profiles prof
  ORDER BY prof.joined_at DESC;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| professores_dashboard_stats           |  SELECT p.id AS professor_id,
    p.full_name AS professor_nome,
    count(pc.id) AS total_conteudos,
    count(pc.id) FILTER (WHERE (pc.tipo = 'video'::text)) AS total_videos,
    count(pc.id) FILTER (WHERE (pc.tipo = 'sacada'::text)) AS total_sacadas,
    count(pc.id) FILTER (WHERE (pc.tipo = 'devocional'::text)) AS total_devocionais,
    count(pc.id) FILTER (WHERE (pc.tipo = 'material'::text)) AS total_materiais,
    COALESCE(sum(pc.visualizacoes), (0)::bigint) AS total_visualizacoes,
    COALESCE(sum(pc.downloads), (0)::bigint) AS total_downloads,
    max(pc.criado_em) AS ultimo_conteudo_criado
   FROM (profiles p
     LEFT JOIN professores_conteudos pc ON (((pc.criado_por = p.id) AND (pc.ativo = true))))
  WHERE (p.tipo_usuario = ANY (ARRAY['professor'::text, 'pastor'::text, 'admin'::text]))
  GROUP BY p.id, p.full_name;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| view_admin_dashboard                  |  SELECT ( SELECT count(*) AS count
           FROM profiles) AS total_users,
    ( SELECT count(*) AS count
           FROM admins
          WHERE (admins.ativo = true)) AS total_admins,
    ( SELECT count(*) AS count
           FROM professores
          WHERE (professores.ativo = true)) AS total_professores,
    ( SELECT count(*) AS count
           FROM alunos
          WHERE (alunos.ativo = true)) AS total_alunos,
    ( SELECT count(*) AS count
           FROM aulas) AS total_aulas,
    ( SELECT count(*) AS count
           FROM instrumentos) AS total_instrumentos,
    ( SELECT count(*) AS count
           FROM professores_conteudos) AS total_conteudos,
    ( SELECT count(*) AS count
           FROM achievements) AS total_achievements,
    ( SELECT count(*) AS count
           FROM audit_activities
          WHERE (audit_activities.created_at >= (CURRENT_DATE - '7 days'::interval))) AS activities_week,
    ( SELECT count(*) AS count
           FROM qr_scans
          WHERE (qr_scans.scanned_at >= (CURRENT_DATE - '7 days'::interval))) AS qr_scans_week,
    ( SELECT count(*) AS count
           FROM user_points_log
          WHERE (user_points_log.created_at >= (CURRENT_DATE - '7 days'::interval))) AS points_awarded_week,
    ( SELECT count(*) AS count
           FROM hook_cache
          WHERE (hook_cache.expires_at > now())) AS active_cache_entries,
    ( SELECT COALESCE(avg(hook_cache.hit_count), (0)::numeric) AS "coalesce"
           FROM hook_cache) AS avg_cache_hits,
    ( SELECT count(*) AS count
           FROM user_notifications
          WHERE (user_notifications.is_read = false)) AS unread_notifications,
    ( SELECT jsonb_agg(jsonb_build_object('user_id', top.id, 'nome', top.nome, 'points', top.total_points) ORDER BY top.total_points DESC) AS jsonb_agg
           FROM ( SELECT profiles.id,
                    profiles.nome,
                    profiles.total_points
                   FROM profiles
                  WHERE (profiles.tipo_usuario = 'estudante'::text)
                  ORDER BY profiles.total_points DESC
                 LIMIT 5) top) AS top_students;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| view_attendance_analytics             |  SELECT a.id AS aula_id,
    a.numero,
    a.titulo,
    a.data_programada,
    a.status,
    ( SELECT count(*) AS count
           FROM alunos
          WHERE (alunos.ativo = true)) AS total_enrolled,
    0 AS total_present,
    0 AS confirmed_present,
    (0)::numeric AS attendance_percentage,
    ( SELECT count(*) AS count
           FROM qr_codes qr
          WHERE ((qr.aula_id = a.id) AND (qr.type = 'attendance'::text))) AS qr_codes_generated,
    ( SELECT count(*) AS count
           FROM (qr_scans qs
             JOIN qr_codes qr ON ((qs.qr_code_id = qr.id)))
          WHERE (qr.aula_id = a.id)) AS qr_scans_total,
    ( SELECT count(*) AS count
           FROM (qr_scans qs
             JOIN qr_codes qr ON ((qs.qr_code_id = qr.id)))
          WHERE ((qr.aula_id = a.id) AND (qs.result = 'success'::text))) AS qr_scans_success
   FROM aulas a;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| view_aulas_admin                      |  SELECT a.id,
    a.numero,
    a.titulo,
    a.status,
    a.objetivo_didatico,
    a.resumo_atividades,
    a.desafio_alpha,
    a.nivel,
    a.formato,
    a.data_programada,
    a.criado_em,
    m.nome AS modulo_nome,
    u.nome AS responsavel_nome
   FROM ((aulas a
     LEFT JOIN modulos m ON ((a.modulo_id = m.id)))
     LEFT JOIN usuarios u ON ((a.responsavel_id = u.id)));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| view_aulas_aluno                      |  SELECT a.id,
    a.numero,
    a.titulo,
    a.data_programada,
    a.desafio_alpha
   FROM aulas a
  WHERE (a.status = 'liberada'::text);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| view_aulas_professor                  |  SELECT a.id,
    a.numero,
    a.titulo,
    a.status,
    a.objetivo_didatico,
    a.resumo_atividades,
    a.data_programada,
    a.desafio_alpha,
    m.nome AS modulo_nome
   FROM (aulas a
     LEFT JOIN modulos m ON ((a.modulo_id = m.id)));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| view_dashboard_aluno                  |  SELECT p.id,
    p.full_name,
    p.total_points,
    p.current_streak,
    p.best_streak,
    p.lessons_completed,
    p.modules_completed,
    count(DISTINCT ua.achievement_id) AS total_achievements,
    count(DISTINCT ua.achievement_id) FILTER (WHERE (ua.earned_at > (now() - '7 days'::interval))) AS achievements_last_week,
    count(DISTINCT po.id) AS total_portfolios,
    count(DISTINCT asub.id) AS total_submissoes,
    count(DISTINCT asub.id) FILTER (WHERE ((asub.status)::text = 'avaliada'::text)) AS submissoes_avaliadas
   FROM (((profiles p
     LEFT JOIN user_achievements ua ON ((ua.user_id = p.id)))
     LEFT JOIN portfolios po ON ((po.user_id = p.id)))
     LEFT JOIN alpha_submissoes asub ON ((asub.user_id = p.id)))
  WHERE (p.tipo_usuario = 'aluno'::text)
  GROUP BY p.id;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| view_dashboard_professor              |  SELECT p.id,
    p.full_name,
    count(DISTINCT t.id) AS total_turmas,
    count(DISTINCT m.aluno_id) AS total_alunos,
    ( SELECT count(*) AS count
           FROM alpha_submissoes asub
          WHERE (((asub.status)::text = 'pendente'::text) AND (asub.user_id IN ( SELECT ma.aluno_id
                   FROM (matriculas ma
                     JOIN turmas tu ON ((tu.id = ma.turma_id)))
                  WHERE ((tu.professor_id = p.id) AND ((ma.status)::text = 'ativa'::text)))))) AS submissoes_pendentes,
    COALESCE((avg(
        CASE
            WHEN pr.presente THEN 1.0
            ELSE 0.0
        END) * (100)::numeric), (0)::numeric) AS taxa_presenca
   FROM ((((profiles p
     JOIN professores prof ON ((prof.id = p.id)))
     LEFT JOIN turmas t ON ((t.professor_id = p.id)))
     LEFT JOIN matriculas m ON (((m.turma_id = t.id) AND ((m.status)::text = 'ativa'::text))))
     LEFT JOIN presencas pr ON ((pr.matricula_id = m.id)))
  WHERE (p.tipo_usuario = 'professor'::text)
  GROUP BY p.id, p.full_name;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| view_placar_logos                     |  SELECT l.id,
    l.nome,
    l.descricao,
    l.url,
    l.ativo,
    COALESCE(count(p.voted_logo), (0)::bigint) AS votos,
    round(
        CASE
            WHEN (total_votes.total > 0) THEN (((count(p.voted_logo))::numeric / (total_votes.total)::numeric) * (100)::numeric)
            ELSE (0)::numeric
        END, 2) AS percentual
   FROM ((logos l
     LEFT JOIN profiles p ON ((l.id = p.voted_logo)))
     CROSS JOIN ( SELECT count(*) AS total
           FROM profiles
          WHERE (profiles.voted_logo IS NOT NULL)) total_votes)
  WHERE (l.ativo = true)
  GROUP BY l.id, l.nome, l.descricao, l.url, l.ativo, total_votes.total
  ORDER BY COALESCE(count(p.voted_logo), (0)::bigint) DESC, l.nome;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| view_professor_dashboard              |  SELECT p.id,
    COALESCE(( SELECT pr.nome
           FROM profiles pr
          WHERE (pr.id = p.id)), ( SELECT pr.full_name
           FROM profiles pr
          WHERE (pr.id = p.id)), ('Professor '::text || (p.id)::text)) AS nome,
    false AS admin_access,
    0 AS total_conteudos,
    0 AS total_videos,
    0 AS total_sacadas,
    COALESCE(( SELECT (count(*))::integer AS count
           FROM qr_codes qr
          WHERE (qr.created_by = p.id)), 0) AS qr_codes_created,
    COALESCE(( SELECT (count(*))::integer AS count
           FROM qr_codes qr
          WHERE ((qr.created_by = p.id) AND (qr.is_active = true))), 0) AS qr_codes_active,
    COALESCE(( SELECT (count(*))::integer AS count
           FROM (qr_scans qs
             JOIN qr_codes qr ON ((qs.qr_code_id = qr.id)))
          WHERE (qr.created_by = p.id)), 0) AS total_qr_scans,
    COALESCE(( SELECT (sum(qs.points_awarded))::integer AS sum
           FROM (qr_scans qs
             JOIN qr_codes qr ON ((qs.qr_code_id = qr.id)))
          WHERE ((qr.created_by = p.id) AND (qs.result = 'success'::text))), 0) AS points_awarded_via_qr,
    COALESCE(( SELECT (count(*))::integer AS count
           FROM audit_activities aa
          WHERE ((aa.user_id = p.id) AND (aa.created_at >= (CURRENT_DATE - '7 days'::interval)))), 0) AS recent_activities
   FROM professores p
  WHERE (p.ativo = true);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| view_qr_analytics                     |  SELECT qr.id,
    qr.code,
    qr.type,
    qr.created_by,
    p.nome AS creator_name,
    qr.aula_id,
    a.titulo AS aula_titulo,
    qr.expires_at,
    qr.max_scans,
    qr.current_scans,
    qr.is_active,
    count(qs.id) AS total_scans,
    count(
        CASE
            WHEN (qs.result = 'success'::text) THEN 1
            ELSE NULL::integer
        END) AS successful_scans,
    count(DISTINCT qs.user_id) AS unique_users,
    sum(qs.points_awarded) AS total_points_awarded,
    qr.created_at
   FROM (((qr_codes qr
     LEFT JOIN profiles p ON ((qr.created_by = p.id)))
     LEFT JOIN aulas a ON ((qr.aula_id = a.id)))
     LEFT JOIN qr_scans qs ON ((qr.id = qs.qr_code_id)))
  GROUP BY qr.id, p.nome, a.titulo;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| view_user_gamification                |  SELECT p.id,
    p.nome,
    p.full_name,
    p.total_points,
    p.current_streak,
    p.best_streak,
    p.lessons_completed,
    p.modules_completed,
    p.user_level,
    ( SELECT count(*) AS count
           FROM user_achievements ua
          WHERE (ua.user_id = p.id)) AS total_achievements,
    ( SELECT count(*) AS count
           FROM user_achievements ua
          WHERE ((ua.user_id = p.id) AND (ua.earned_at >= (CURRENT_DATE - '7 days'::interval)))) AS recent_achievements,
    ( SELECT count(*) AS count
           FROM user_points_log upl
          WHERE ((upl.user_id = p.id) AND (upl.created_at >= (CURRENT_DATE - '7 days'::interval)))) AS points_this_week,
    rank() OVER (ORDER BY p.total_points DESC) AS points_rank
   FROM profiles p
  WHERE (p.tipo_usuario = 'estudante'::text);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| vw_forum_stats                        |  SELECT fp.id,
    fp.titulo,
    fp.categoria,
    fp.status,
    fp.nivel_urgencia,
    p.nome AS aluno_nome,
    m.nome AS modulo_nome,
    count(fr.id) AS total_respostas,
    count(
        CASE
            WHEN (fr.eh_resposta_oficial = true) THEN 1
            ELSE NULL::integer
        END) AS respostas_oficiais,
    fp.visualizacoes,
    fp.created_at,
    fp.updated_at
   FROM (((forum_perguntas fp
     LEFT JOIN profiles p ON ((p.id = fp.aluno_id)))
     LEFT JOIN modulos m ON ((m.id = fp.modulo_id)))
     LEFT JOIN forum_respostas fr ON ((fr.pergunta_id = fp.id)))
  GROUP BY fp.id, fp.titulo, fp.categoria, fp.status, fp.nivel_urgencia, p.nome, m.nome, fp.visualizacoes, fp.created_at, fp.updated_at
  ORDER BY fp.updated_at DESC;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| vw_metodologias_stats                 |  SELECT me.id,
    me.nome,
    me.origem,
    me.descricao_resumo,
    me.faixa_etaria_ideal,
    me.principios_fundamentais,
    me.vantagens,
    me.aplicacao_brasileira,
    count(ma.id) AS materiais_relacionados,
    me.created_at
   FROM (metodologias_ensino me
     LEFT JOIN materiais_apoio ma ON ((ma.metodologia_relacionada_id = me.id)))
  WHERE (me.ativa = true)
  GROUP BY me.id, me.nome, me.origem, me.descricao_resumo, me.faixa_etaria_ideal, me.principios_fundamentais, me.vantagens, me.aplicacao_brasileira, me.created_at
  ORDER BY me.nome;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| vw_repertorio_stats                   |  SELECT rm.id,
    rm.titulo,
    rm.artista,
    rm.genero,
    rm.nivel,
    rm.instrumento_principal_id,
    i.nome AS instrumento_nome,
    rm.tags,
    rm.tempo_bpm,
    rm.tonalidade,
    rm.observacoes_professor,
    rm.created_at
   FROM (repertorio_musical rm
     LEFT JOIN instrumentos i ON ((i.id = rm.instrumento_principal_id)))
  WHERE (rm.ativo = true)
  ORDER BY rm.genero, rm.nivel, rm.titulo;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| vw_violin_ids                         |  SELECT instrumentos.id AS instrumento_id,
    instrumentos.nome
   FROM instrumentos
  WHERE ((lower((instrumentos.nome)::text) = 'violino'::text) OR (lower((instrumentos.nome)::text) = 'violin'::text) OR (lower((instrumentos.nome)::text) ~~ 'violino%'::text) OR (lower((instrumentos.nome)::text) ~~ 'violin%'::text));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| vw_violino_instrumento_sons           |  SELECT s.id,
    s.instrumento_id,
    s.nota_musical,
    s.tecnica,
    s.dinamica,
    s.arquivo_audio,
    s.waveform_data,
    s.bpm,
    s.tonalidade,
    s.artista_performer,
    s.created_at
   FROM instrumento_sons s
  WHERE (s.instrumento_id IN ( SELECT vw_violin_ids.instrumento_id
           FROM vw_violin_ids));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| vw_violino_instrumento_sons_variacoes |  SELECT v.id,
    v.som_id,
    v.arquivo_audio,
    v.artista_performer,
    v.qualidade_gravacao,
    v.instrumento_usado,
    v.local_gravacao,
    v.ano_gravacao,
    v.duracao_segundos,
    v.created_at
   FROM (instrumento_sons_variacoes v
     JOIN instrumento_sons s ON ((s.id = v.som_id)))
  WHERE (s.instrumento_id IN ( SELECT vw_violin_ids.instrumento_id
           FROM vw_violin_ids));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| vw_violino_instrumentos               |  SELECT i.id,
    i.nome,
    i.categoria,
    i.descricao,
    i.imagem_url,
    i.ativo,
    i.ordem_exibicao,
    i.criado_em,
    i.historia,
    i.origem,
    i.familia_instrumental,
    i.material_principal,
    i.tecnica_producao_som,
    i.dificuldade_aprendizado,
    i.anatomia_partes,
    i.curiosidades
   FROM (instrumentos i
     JOIN vw_violin_ids v ON ((v.instrumento_id = i.id)));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| vw_violino_instrumentos_relacionados  |  SELECT r.id,
    r.instrumento_id,
    r.relacionado_id,
    r.tipo_relacao,
    r.descricao_relacao,
    r.similaridade_score,
    r.created_at,
    i.nome AS instrumento_nome,
    rel.nome AS relacionado_nome
   FROM ((instrumentos_relacionados r
     LEFT JOIN instrumentos i ON ((i.id = r.instrumento_id)))
     LEFT JOIN instrumentos rel ON ((rel.id = r.relacionado_id)))
  WHERE ((r.instrumento_id IN ( SELECT vw_violin_ids.instrumento_id
           FROM vw_violin_ids)) OR (r.relacionado_id IN ( SELECT vw_violin_ids.instrumento_id
           FROM vw_violin_ids)));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| vw_violino_palestra                   |  WITH base AS (
         SELECT vw_violino_instrumentos.id,
            vw_violino_instrumentos.nome,
            vw_violino_instrumentos.categoria,
            vw_violino_instrumentos.descricao,
            vw_violino_instrumentos.imagem_url,
            vw_violino_instrumentos.ativo,
            vw_violino_instrumentos.ordem_exibicao,
            vw_violino_instrumentos.criado_em,
            vw_violino_instrumentos.historia,
            vw_violino_instrumentos.origem,
            vw_violino_instrumentos.familia_instrumental,
            vw_violino_instrumentos.material_principal,
            vw_violino_instrumentos.tecnica_producao_som,
            vw_violino_instrumentos.dificuldade_aprendizado,
            vw_violino_instrumentos.anatomia_partes,
            vw_violino_instrumentos.curiosidades
           FROM vw_violino_instrumentos
        )
 SELECT b.id AS instrumento_id,
    b.nome AS instrumento,
    b.descricao AS o_que_e,
    b.familia_instrumental AS familia,
    b.origem,
    b.material_principal AS material,
    b.tecnica_producao_som AS como_produz_som,
    b.dificuldade_aprendizado AS dificuldade,
        CASE
            WHEN ((pg_typeof(b.anatomia_partes))::text = ANY (ARRAY['json'::text, 'jsonb'::text])) THEN b.anatomia_partes
            ELSE NULL::jsonb
        END AS anatomia_partes,
    b.imagem_url,
    b.categoria,
    b.ativo,
    b.ordem_exibicao,
    b.criado_em,
    b.historia,
        CASE
            WHEN ((pg_typeof(b.curiosidades))::text = 'text[]'::text) THEN to_jsonb(b.curiosidades)
            ELSE
            CASE
                WHEN (jsonb_typeof(b.curiosidades) = 'array'::text) THEN b.curiosidades
                ELSE jsonb_build_array(b.curiosidades)
            END
        END AS curiosidades,
    COALESCE(( SELECT jsonb_agg(jsonb_build_object('arquivo_audio', s.arquivo_audio, 'artista', s.artista_performer, 'bpm', s.bpm, 'nota', s.nota_musical, 'tonalidade', s.tonalidade, 'tecnica', s.tecnica, 'dinamica', s.dinamica, 'created_at', s.created_at) ORDER BY s.created_at) AS jsonb_agg
           FROM instrumento_sons s
          WHERE (s.instrumento_id = b.id)), '[]'::jsonb) AS sons_exemplos,
    COALESCE(( SELECT jsonb_agg(jsonb_build_object('arquivo_audio', v.arquivo_audio, 'artista', v.artista_performer, 'ano_gravacao', v.ano_gravacao, 'local_gravacao', v.local_gravacao, 'duracao_segundos', v.duracao_segundos, 'instrumento_usado', v.instrumento_usado, 'qualidade_gravacao', v.qualidade_gravacao, 'created_at', v.created_at) ORDER BY v.created_at) AS jsonb_agg
           FROM (instrumento_sons_variacoes v
             JOIN instrumento_sons s ON ((s.id = v.som_id)))
          WHERE (s.instrumento_id = b.id)), '[]'::jsonb) AS sons_variacoes,
    COALESCE(( SELECT jsonb_agg(jsonb_build_object('relacionado_id', r.relacionado_id, 'relacionado_nome', rel.nome, 'tipo_relacao', r.tipo_relacao, 'descricao', r.descricao_relacao, 'similaridade', r.similaridade_score, 'created_at', r.created_at) ORDER BY r.created_at) AS jsonb_agg
           FROM (instrumentos_relacionados r
             LEFT JOIN instrumentos rel ON ((rel.id = r.relacionado_id)))
          WHERE (r.instrumento_id = b.id)), '[]'::jsonb) AS relacionados
   FROM base b; |


-- ============================================
-- 8️⃣ CONTAGEM FINAL
-- ============================================

-- Total de tabelas
SELECT COUNT(*) as total_tabelas
FROM information_schema.tables 
WHERE table_schema = 'public';

| total_tabelas |
| ------------- |
| 117           |

-- Total de índices
SELECT COUNT(*) as total_indices
FROM pg_indexes 
WHERE schemaname = 'public';

| total_indices |
| ------------- |
| 295           |

-- Total de políticas RLS
SELECT COUNT(*) as total_rls_policies
FROM pg_policies 
WHERE schemaname = 'public';


| total_rls_policies |
| ------------------ |
| 153                |

-- Total de functions
SELECT COUNT(*) as total_functions
FROM information_schema.routines 
WHERE routine_schema = 'public';

| total_functions |
| --------------- |
| 56              |

-- Total de views
SELECT COUNT(*) as total_views
FROM information_schema.views 
WHERE table_schema = 'public';

| total_views |
| ----------- |
| 24          |

-- ============================================
-- 9️⃣ RESUMO EXECUTIVO
-- ============================================

SELECT 
    'RESUMO DO BANCO DE DADOS' as titulo,
    (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public') as tabelas,
    (SELECT COUNT(*) FROM pg_indexes WHERE schemaname = 'public') as indices,
    (SELECT COUNT(*) FROM pg_policies WHERE schemaname = 'public') as rls_policies,
    (SELECT COUNT(*) FROM information_schema.routines WHERE routine_schema = 'public') as functions,
    (SELECT COUNT(*) FROM information_schema.views WHERE table_schema = 'public') as views;


| titulo                   | tabelas | indices | rls_policies | functions | views |
| ------------------------ | ------- | ------- | ------------ | --------- | ----- |
| RESUMO DO BANCO DE DADOS | 117     | 295     | 153          | 56        | 24    |

-- ============================================
-- 🎯 COMPARAÇÃO COM DOCUMENTAÇÃO
-- ============================================

-- Esperado (segundo estrutura_completo_backend.md):
-- - 68 tabelas
-- - 50+ functions
-- - 29 RLS policies

SELECT 
    'COMPARAÇÃO' as tipo,
    (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public') as tabelas_atual,
    68 as tabelas_esperado,
    CASE 
        WHEN (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public') >= 68 
        THEN '✅ OK' 
        ELSE '⚠️ FALTAM TABELAS' 
    END as status_tabelas,
    (SELECT COUNT(*) FROM information_schema.routines WHERE routine_schema = 'public') as functions_atual,
    50 as functions_esperado,
    CASE 
        WHEN (SELECT COUNT(*) FROM information_schema.routines WHERE routine_schema = 'public') >= 50 
        THEN '✅ OK' 
        ELSE '⚠️ FALTAM FUNCTIONS' 
    END as status_functions,
    (SELECT COUNT(*) FROM pg_policies WHERE schemaname = 'public') as rls_atual,
    29 as rls_esperado,
    CASE 
        WHEN (SELECT COUNT(*) FROM pg_policies WHERE schemaname = 'public') >= 29 
        THEN '✅ OK' 
        ELSE '⚠️ FALTAM RLS' 
    END as status_rls;


    | tipo       | tabelas_atual | tabelas_esperado | status_tabelas | functions_atual | functions_esperado | status_functions | rls_atual | rls_esperado | status_rls |
| ---------- | ------------- | ---------------- | -------------- | --------------- | ------------------ | ---------------- | --------- | ------------ | ---------- |
| COMPARAÇÃO | 117           | 68               | ✅ OK           | 56              | 50                 | ✅ OK             | 153       | 29           | ✅ OK       |
