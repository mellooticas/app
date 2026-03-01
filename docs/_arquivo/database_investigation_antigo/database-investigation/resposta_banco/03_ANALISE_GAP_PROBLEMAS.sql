-- ========================================================================
-- 🔍 ANÁLISE DE GAP E PROBLEMAS NO BANCO DE DADOS
-- ========================================================================
-- Data: 2025-12-15
-- Objetivo: Identificar problemas, inconsistências e melhorias necessárias
-- ========================================================================

-- ========================================================================
-- 1️⃣ PROBLEMAS DE NOMENCLATURA
-- ========================================================================

-- 1.1 Tabelas sem padrão de nomenclatura consistente
SELECT 
    table_name,
    CASE 
        WHEN table_name ~ '^[a-z_]+$' THEN '✅ Snake case'
        WHEN table_name ~ '^[A-Z]' THEN '⚠️ PascalCase (deveria ser snake_case)'
        ELSE '❌ Nomenclatura inconsistente'
    END as status_nomenclatura
FROM information_schema.tables
WHERE table_schema = 'public'
    AND table_type = 'BASE TABLE'
ORDER BY table_name;

| table_name                      | status_nomenclatura |
| ------------------------------- | ------------------- |
| achievements                    | ✅ Snake case        |
| achievements_educacionais       | ✅ Snake case        |
| achievements_progress           | ✅ Snake case        |
| adaptacoes_espacos_alternativos | ✅ Snake case        |
| admins                          | ✅ Snake case        |
| alpha_aluno_badges              | ✅ Snake case        |
| alpha_aluno_desafios            | ✅ Snake case        |
| alpha_aula_progresso            | ✅ Snake case        |
| alpha_badges                    | ✅ Snake case        |
| alpha_celebracoes               | ✅ Snake case        |
| alpha_competencias              | ✅ Snake case        |
| alpha_desafios                  | ✅ Snake case        |
| alpha_estudante_badges          | ✅ Snake case        |
| alpha_mentorias                 | ✅ Snake case        |
| alpha_metodologias              | ✅ Snake case        |
| alpha_niveis                    | ✅ Snake case        |
| alpha_progresso                 | ✅ Snake case        |
| alpha_progresso_estudante       | ✅ Snake case        |
| alpha_projetos_coletivos        | ✅ Snake case        |
| alpha_ranking                   | ✅ Snake case        |
| alpha_submissoes                | ✅ Snake case        |
| alpha_xp_historico              | ✅ Snake case        |
| alunos                          | ✅ Snake case        |
| audit_activities                | ✅ Snake case        |
| aula_atividades                 | ✅ Snake case        |
| aula_avaliacoes                 | ✅ Snake case        |
| aula_checklist                  | ✅ Snake case        |
| aula_criterios_avaliacao        | ✅ Snake case        |
| aula_desafio_alpha              | ✅ Snake case        |
| aula_desafios                   | ✅ Snake case        |
| aula_feedback                   | ✅ Snake case        |
| aula_feedbacks                  | ✅ Snake case        |
| aula_materiais                  | ✅ Snake case        |
| aula_permissoes                 | ✅ Snake case        |
| aula_presencas                  | ✅ Snake case        |
| aula_registros                  | ✅ Snake case        |
| aula_status_log                 | ✅ Snake case        |
| aula_tags                       | ✅ Snake case        |
| aulas                           | ✅ Snake case        |
| autoavaliacoes                  | ✅ Snake case        |
| avaliacoes_rubricas             | ✅ Snake case        |
| capacitacao_docente             | ✅ Snake case        |
| cessoes_instrumentos            | ✅ Snake case        |
| comunicacao_engajamento         | ✅ Snake case        |
| desafios_alpha                  | ✅ Snake case        |
| desafios_alpha_respostas        | ✅ Snake case        |
| devotional_content              | ✅ Snake case        |
| documentos_institucionais       | ✅ Snake case        |
| experiencias_brasileiras        | ✅ Snake case        |
| feedback_pares                  | ✅ Snake case        |
| forum_likes                     | ✅ Snake case        |
| forum_perguntas                 | ✅ Snake case        |
| forum_respostas                 | ✅ Snake case        |
| historia_compositores           | ✅ Snake case        |
| historia_conceitos_teoricos     | ✅ Snake case        |
| historia_contexto_cultural      | ✅ Snake case        |
| historia_eventos_timeline       | ✅ Snake case        |
| historia_generos                | ✅ Snake case        |
| historia_instrumentos_evolucao  | ✅ Snake case        |
| historia_movimentos             | ✅ Snake case        |
| historia_movimentos_artisticos  | ✅ Snake case        |
| historia_obras                  | ✅ Snake case        |
| historia_periodos               | ✅ Snake case        |
| historia_playlists              | ✅ Snake case        |
| historia_progresso_usuario      | ✅ Snake case        |
| historia_quiz                   | ✅ Snake case        |
| historia_quiz_respostas         | ✅ Snake case        |
| historia_timeline               | ✅ Snake case        |
| historico_instrumentos          | ✅ Snake case        |
| hook_cache                      | ✅ Snake case        |
| indicadores_impacto             | ✅ Snake case        |
| instrumento_curiosidades        | ✅ Snake case        |
| instrumento_midias              | ✅ Snake case        |
| instrumento_performances        | ✅ Snake case        |
| instrumento_quiz                | ✅ Snake case        |
| instrumento_sons                | ✅ Snake case        |
| instrumento_sons_variacoes      | ✅ Snake case        |
| instrumento_tecnicas            | ✅ Snake case        |
| instrumentos                    | ✅ Snake case        |
| instrumentos_alunos             | ✅ Snake case        |
| instrumentos_fisicos            | ✅ Snake case        |
| instrumentos_relacionados       | ✅ Snake case        |
| lessons                         | ✅ Snake case        |
| logos                           | ✅ Snake case        |
| manutencoes_instrumentos        | ✅ Snake case        |
| materiais_apoio                 | ✅ Snake case        |
| matriculas                      | ✅ Snake case        |
| metodologias_ensino             | ✅ Snake case        |
| migration_log                   | ✅ Snake case        |
| modules                         | ✅ Snake case        |
| modulos                         | ✅ Snake case        |
| permission_templates            | ✅ Snake case        |
| permissions                     | ✅ Snake case        |
| portfolio_evidencias            | ✅ Snake case        |
| portfolios                      | ✅ Snake case        |
| presencas                       | ✅ Snake case        |
| professor_instrumentos          | ✅ Snake case        |
| professores                     | ✅ Snake case        |
| professores_categorias          | ✅ Snake case        |
| professores_conteudos           | ✅ Snake case        |



-- 1.2 Colunas sem padrão de nomenclatura
SELECT DISTINCT
    c.column_name,
    COUNT(DISTINCT c.table_name) as usado_em_tabelas,
    string_agg(DISTINCT c.table_name, ', ') as tabelas
FROM information_schema.columns c
WHERE c.table_schema = 'public'
    AND (
        c.column_name !~ '^[a-z_]+$'  -- Não é snake_case
        OR c.column_name LIKE '%ID%'  -- ID em maiúscula
        OR c.column_name LIKE '%URL%' -- URL em maiúscula
    )
GROUP BY c.column_name
ORDER BY usado_em_tabelas DESC;

| column_name | usado_em_tabelas | tabelas       |
| ----------- | ---------------- | ------------- |
| top_3       | 1                | alpha_ranking |



-- ========================================================================
-- 2️⃣ PROBLEMAS DE INTEGRIDADE REFERENCIAL
-- ========================================================================

-- 2.1 Foreign Keys sem índice (performance problem)
SELECT DISTINCT
    kcu.table_name,
    kcu.column_name,
    'Adicionar índice para melhor performance' as recomendacao
FROM information_schema.key_column_usage kcu
JOIN information_schema.table_constraints tc 
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'public'
    AND NOT EXISTS (
        SELECT 1
        FROM pg_indexes pi
        WHERE pi.schemaname = 'public'
            AND pi.tablename = kcu.table_name
            AND pi.indexdef LIKE '%' || kcu.column_name || '%'
    )
ORDER BY kcu.table_name, kcu.column_name;

| table_name                      | column_name                | recomendacao                             |
| ------------------------------- | -------------------------- | ---------------------------------------- |
| alpha_aluno_badges              | desafio_origem_id          | Adicionar índice para melhor performance |
| alpha_mentorias                 | mentor_id                  | Adicionar índice para melhor performance |
| alpha_mentorias                 | mentorado_id               | Adicionar índice para melhor performance |
| alpha_projetos_coletivos        | criador_id                 | Adicionar índice para melhor performance |
| alunos                          | turma_principal_id         | Adicionar índice para melhor performance |
| aula_feedback                   | professor_id               | Adicionar índice para melhor performance |
| aula_status_log                 | alterado_por               | Adicionar índice para melhor performance |
| avaliacoes_rubricas             | avaliador_id               | Adicionar índice para melhor performance |
| avaliacoes_rubricas             | evidencia_id               | Adicionar índice para melhor performance |
| cessoes_instrumentos            | responsavel_devolucao      | Adicionar índice para melhor performance |
| cessoes_instrumentos            | responsavel_entrega        | Adicionar índice para melhor performance |
| desafios_alpha                  | modulo_relacionado_id      | Adicionar índice para melhor performance |
| desafios_alpha_respostas        | aluno_id                   | Adicionar índice para melhor performance |
| desafios_alpha_respostas        | desafio_id                 | Adicionar índice para melhor performance |
| forum_respostas                 | pergunta_id                | Adicionar índice para melhor performance |
| forum_respostas                 | resposta_de_id             | Adicionar índice para melhor performance |
| historia_conceitos_teoricos     | periodo_origem_id          | Adicionar índice para melhor performance |
| historia_contexto_cultural      | periodo_id                 | Adicionar índice para melhor performance |
| historia_eventos_timeline       | compositor_id              | Adicionar índice para melhor performance |
| historia_eventos_timeline       | obra_id                    | Adicionar índice para melhor performance |
| historia_eventos_timeline       | periodo_id                 | Adicionar índice para melhor performance |
| historia_generos                | periodo_origem_id          | Adicionar índice para melhor performance |
| historia_instrumentos_evolucao  | instrumento_id             | Adicionar índice para melhor performance |
| historia_instrumentos_evolucao  | periodo_id                 | Adicionar índice para melhor performance |
| historia_playlists              | criador_id                 | Adicionar índice para melhor performance |
| historia_playlists              | periodo_id                 | Adicionar índice para melhor performance |
| historia_quiz                   | periodo_id                 | Adicionar índice para melhor performance |
| historia_quiz_respostas         | quiz_id                    | Adicionar índice para melhor performance |
| historico_instrumentos          | aluno_afetado_id           | Adicionar índice para melhor performance |
| instrumento_sons_variacoes      | som_id                     | Adicionar índice para melhor performance |
| instrumentos_alunos             | aluno_id                   | Adicionar índice para melhor performance |
| instrumentos_alunos             | instrumento_id             | Adicionar índice para melhor performance |
| instrumentos_fisicos            | instrumento_id             | Adicionar índice para melhor performance |
| lessons                         | professor_responsavel_id   | Adicionar índice para melhor performance |
| materiais_apoio                 | instrumento_relacionado_id | Adicionar índice para melhor performance |
| materiais_apoio                 | metodologia_relacionada_id | Adicionar índice para melhor performance |
| portfolio_evidencias            | aprovado_por               | Adicionar índice para melhor performance |
| portfolios                      | competencia_id             | Adicionar índice para melhor performance |
| professores_conteudos           | editado_por                | Adicionar índice para melhor performance |
| proposta_curricular             | metodologia_principal      | Adicionar índice para melhor performance |
| qr_codes                        | created_by                 | Adicionar índice para melhor performance |
| qr_codes                        | instrument_id              | Adicionar índice para melhor performance |
| repertorio_musical              | modulo_sugerido_id         | Adicionar índice para melhor performance |
| rubricas_avaliacao              | metodologia_id             | Adicionar índice para melhor performance |
| sequencias_didaticas            | criado_por_id              | Adicionar índice para melhor performance |
| sequencias_didaticas            | metodologia_id             | Adicionar índice para melhor performance |
| sequencias_didaticas_expandidas | competencia_foco           | Adicionar índice para melhor performance |
| user_points_log                 | aula_id                    | Adicionar índice para melhor performance |
| user_points_log                 | user_id                    | Adicionar índice para melhor performance |
| user_roles                      | granted_by                 | Adicionar índice para melhor performance |


-- 2.2 Foreign Keys com CASCADE delete (potencial perda de dados)
SELECT 
    tc.table_name,
    kcu.column_name,
    ccu.table_name as referencia_tabela,
    rc.delete_rule,
    CASE 
        WHEN rc.delete_rule = 'CASCADE' THEN '⚠️ PERIGO: Delete em cascata'
        WHEN rc.delete_rule = 'SET NULL' THEN '⚠️ Atenção: Seta NULL'
        WHEN rc.delete_rule = 'NO ACTION' THEN '✅ Seguro: Impede delete'
        WHEN rc.delete_rule = 'RESTRICT' THEN '✅ Seguro: Restringe delete'
        ELSE '❓ Verificar'
    END as avaliacao
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage ccu 
    ON ccu.constraint_name = tc.constraint_name
JOIN information_schema.referential_constraints rc
    ON rc.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'public'
ORDER BY rc.delete_rule, tc.table_name;


| table_name                      | column_name                | referencia_tabela      | delete_rule | avaliacao                    |
| ------------------------------- | -------------------------- | ---------------------- | ----------- | ---------------------------- |
| achievements_progress           | user_id                    | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| achievements_progress           | achievement_id             | achievements           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| admins                          | id                         | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_aluno_badges              | aluno_id                   | alunos                 | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_aluno_desafios            | desafio_id                 | alpha_desafios         | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_aluno_desafios            | aluno_id                   | alunos                 | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_aula_progresso            | aluno_id                   | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_aula_progresso            | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_celebracoes               | estudante_id               | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_competencias              | metodologia_id             | alpha_metodologias     | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_estudante_badges          | estudante_id               | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_mentorias                 | mentorado_id               | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_mentorias                 | mentor_id                  | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_progresso                 | competencia_id             | alpha_competencias     | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_progresso                 | metodologia_id             | alpha_metodologias     | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_progresso_estudante       | estudante_id               | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_projetos_coletivos        | criador_id                 | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_ranking                   | estudante_id               | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alpha_xp_historico              | estudante_id               | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alunos                          | id                         | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_atividades                 | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_avaliacoes                 | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_checklist                  | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_criterios_avaliacao        | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_desafio_alpha              | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_desafios                   | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_feedback                   | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_feedbacks                  | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_materiais                  | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_permissoes                 | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_presencas                  | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_registros                  | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_status_log                 | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| aula_tags                       | aula_id                    | aulas                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| autoavaliacoes                  | portfolio_id               | portfolios             | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| avaliacoes_rubricas             | evidencia_id               | portfolio_evidencias   | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| desafios_alpha_respostas        | desafio_id                 | desafios_alpha         | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| feedback_pares                  | evidencia_id               | portfolio_evidencias   | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| forum_likes                     | resposta_id                | forum_respostas        | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| forum_respostas                 | pergunta_id                | forum_perguntas        | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| historia_progresso_usuario      | user_id                    | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| historia_quiz_respostas         | user_id                    | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| historia_quiz_respostas         | quiz_id                    | historia_quiz          | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| instrumento_curiosidades        | instrumento_id             | instrumentos           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| instrumento_midias              | instrumento_id             | instrumentos           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| instrumento_performances        | instrumento_id             | instrumentos           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| instrumento_quiz                | instrumento_id             | instrumentos           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| instrumento_sons                | instrumento_id             | instrumentos           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| instrumento_sons_variacoes      | som_id                     | instrumento_sons       | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| instrumento_tecnicas            | instrumento_id             | instrumentos           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| instrumentos_relacionados       | relacionado_id             | instrumentos           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| instrumentos_relacionados       | instrumento_id             | instrumentos           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| lessons                         | module_id                  | modules                | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| matriculas                      | turma_id                   | turmas                 | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| matriculas                      | aluno_id                   | alunos                 | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| portfolio_evidencias            | portfolio_id               | portfolios             | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| presencas                       | matricula_id               | matriculas             | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| professor_instrumentos          | professor_id               | professores            | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| professor_instrumentos          | instrumento_id             | instrumentos           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| professores                     | id                         | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| qr_scans                        | qr_code_id                 | qr_codes               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| role_permissions                | role_id                    | roles                  | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| role_permissions                | permission_id              | permissions            | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| turma_alunos                    | aluno_id                   | alunos                 | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| turma_alunos                    | turma_id                   | turmas                 | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| turmas                          | professor_id               | professores            | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| turmas                          | instrumento_id             | instrumentos           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| user_achievements               | achievement_id             | achievements           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| user_badges                     | badge_id                   | alpha_badges           | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| user_devotional_progress        | devotional_id              | devotional_content     | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| user_notifications              | user_id                    | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| user_points_log                 | user_id                    | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| user_progress                   | lesson_id                  | lessons                | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| user_roles                      | user_id                    | profiles               | CASCADE     | ⚠️ PERIGO: Delete em cascata |
| alunos                          | instrumento_id             | instrumentos           | NO ACTION   | ✅ Seguro: Impede delete      |
| alunos                          | turma_principal_id         | turmas                 | NO ACTION   | ✅ Seguro: Impede delete      |
| audit_activities                | user_id                    | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| aula_feedback                   | professor_id               | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| aula_status_log                 | alterado_por               | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| cessoes_instrumentos            | aluno_id                   | alunos                 | NO ACTION   | ✅ Seguro: Impede delete      |
| cessoes_instrumentos            | responsavel_entrega        | professores            | NO ACTION   | ✅ Seguro: Impede delete      |
| cessoes_instrumentos            | responsavel_devolucao      | professores            | NO ACTION   | ✅ Seguro: Impede delete      |
| cessoes_instrumentos            | instrumento_fisico_id      | instrumentos_fisicos   | NO ACTION   | ✅ Seguro: Impede delete      |
| desafios_alpha                  | modulo_relacionado_id      | modulos                | NO ACTION   | ✅ Seguro: Impede delete      |
| desafios_alpha_respostas        | aluno_id                   | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| forum_likes                     | user_id                    | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| forum_perguntas                 | aluno_id                   | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| forum_perguntas                 | modulo_id                  | modulos                | NO ACTION   | ✅ Seguro: Impede delete      |
| forum_respostas                 | resposta_de_id             | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_compositores           | periodo_id                 | historia_periodos      | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_conceitos_teoricos     | periodo_origem_id          | historia_periodos      | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_contexto_cultural      | periodo_id                 | historia_periodos      | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_eventos_timeline       | compositor_id              | historia_compositores  | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_eventos_timeline       | periodo_id                 | historia_periodos      | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_eventos_timeline       | obra_id                    | historia_obras         | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_generos                | periodo_origem_id          | historia_periodos      | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_instrumentos_evolucao  | instrumento_id             | instrumentos           | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_instrumentos_evolucao  | periodo_id                 | historia_periodos      | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_obras                  | compositor_id              | historia_compositores  | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_obras                  | periodo_id                 | historia_periodos      | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_playlists              | periodo_id                 | historia_periodos      | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_playlists              | criador_id                 | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| historia_quiz                   | periodo_id                 | historia_periodos      | NO ACTION   | ✅ Seguro: Impede delete      |
| historico_instrumentos          | instrumento_fisico_id      | instrumentos_fisicos   | NO ACTION   | ✅ Seguro: Impede delete      |
| historico_instrumentos          | aluno_afetado_id           | alunos                 | NO ACTION   | ✅ Seguro: Impede delete      |
| hook_cache                      | user_id                    | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| instrumentos_alunos             | instrumento_id             | instrumentos           | NO ACTION   | ✅ Seguro: Impede delete      |
| instrumentos_alunos             | aluno_id                   | alunos                 | NO ACTION   | ✅ Seguro: Impede delete      |
| instrumentos_fisicos            | instrumento_id             | instrumentos           | NO ACTION   | ✅ Seguro: Impede delete      |
| lessons                         | professor_responsavel_id   | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| manutencoes_instrumentos        | instrumento_fisico_id      | instrumentos_fisicos   | NO ACTION   | ✅ Seguro: Impede delete      |
| materiais_apoio                 | modulo_relacionado_id      | modulos                | NO ACTION   | ✅ Seguro: Impede delete      |
| materiais_apoio                 | metodologia_relacionada_id | metodologias_ensino    | NO ACTION   | ✅ Seguro: Impede delete      |
| materiais_apoio                 | instrumento_relacionado_id | instrumentos           | NO ACTION   | ✅ Seguro: Impede delete      |
| proposta_curricular             | metodologia_principal      | alpha_metodologias     | NO ACTION   | ✅ Seguro: Impede delete      |
| qr_codes                        | instrument_id              | instrumentos           | NO ACTION   | ✅ Seguro: Impede delete      |
| qr_codes                        | created_by                 | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| qr_codes                        | aula_id                    | aulas                  | NO ACTION   | ✅ Seguro: Impede delete      |
| qr_scans                        | user_id                    | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| repertorio_musical              | instrumento_principal_id   | instrumentos           | NO ACTION   | ✅ Seguro: Impede delete      |
| repertorio_musical              | modulo_sugerido_id         | modulos                | NO ACTION   | ✅ Seguro: Impede delete      |
| sequencias_didaticas            | criado_por_id              | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| sequencias_didaticas            | metodologia_id             | metodologias_ensino    | NO ACTION   | ✅ Seguro: Impede delete      |
| sequencias_didaticas_expandidas | competencia_foco           | alpha_competencias     | NO ACTION   | ✅ Seguro: Impede delete      |
| sequencias_didaticas_expandidas | metodologia_base           | alpha_metodologias     | NO ACTION   | ✅ Seguro: Impede delete      |
| sistema_presto                  | metodologia_associada      | alpha_metodologias     | NO ACTION   | ✅ Seguro: Impede delete      |
| user_points_log                 | aula_id                    | aulas                  | NO ACTION   | ✅ Seguro: Impede delete      |
| user_roles                      | granted_by                 | profiles               | NO ACTION   | ✅ Seguro: Impede delete      |
| alpha_aluno_badges              | desafio_origem_id          | alpha_desafios         | SET NULL    | ⚠️ Atenção: Seta NULL        |
| aulas                           | responsavel_id             | professores            | SET NULL    | ⚠️ Atenção: Seta NULL        |
| historia_timeline               | compositor_id              | historia_compositores  | SET NULL    | ⚠️ Atenção: Seta NULL        |
| historia_timeline               | obra_id                    | historia_obras         | SET NULL    | ⚠️ Atenção: Seta NULL        |
| historia_timeline               | periodo_id                 | historia_periodos      | SET NULL    | ⚠️ Atenção: Seta NULL        |
| portfolios                      | competencia_id             | alpha_competencias     | SET NULL    | ⚠️ Atenção: Seta NULL        |
| portfolios                      | metodologia_id             | alpha_metodologias     | SET NULL    | ⚠️ Atenção: Seta NULL        |
| professores_conteudos           | categoria_id               | professores_categorias | SET NULL    | ⚠️ Atenção: Seta NULL        |
| rubricas_avaliacao              | metodologia_id             | alpha_metodologias     | SET NULL    | ⚠️ Atenção: Seta NULL        |


-- ========================================================================
-- 3️⃣ PROBLEMAS DE VALIDAÇÃO
-- ========================================================================

-- 3.1 Campos de email sem validação
SELECT 
    table_name,
    column_name,
    'Adicionar CHECK constraint para validar email' as recomendacao
FROM information_schema.columns
WHERE table_schema = 'public'
    AND (column_name LIKE '%email%' OR column_name LIKE '%mail%')
    AND table_name || '_' || column_name NOT IN (
        SELECT tc.table_name || '_' || kcu.column_name
        FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu 
            ON tc.constraint_name = kcu.constraint_name
        WHERE tc.constraint_type = 'CHECK'
            AND tc.table_schema = 'public'
    )
ORDER BY table_name;

| table_name               | column_name | recomendacao                                  |
| ------------------------ | ----------- | --------------------------------------------- |
| admin_alunos             | email       | Adicionar CHECK constraint para validar email |
| admin_professores        | email       | Adicionar CHECK constraint para validar email |
| admin_usuarios_completos | email       | Adicionar CHECK constraint para validar email |
| profiles                 | email       | Adicionar CHECK constraint para validar email |
| usuarios                 | email       | Adicionar CHECK constraint para validar email |



-- 3.2 Campos numéricos sem limites (min/max)
SELECT 
    c.table_name,
    c.column_name,
    c.data_type,
    'Considerar adicionar CHECK constraint para range válido' as recomendacao
FROM information_schema.columns c
WHERE c.table_schema = 'public'
    AND c.data_type IN ('integer', 'bigint', 'numeric', 'real')
    AND c.column_name IN ('idade', 'ano', 'semestre', 'nivel', 'nota', 'pontos', 'xp')
    AND c.table_name || '_' || c.column_name NOT IN (
        SELECT tc.table_name || '_' || kcu.column_name
        FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu 
            ON tc.constraint_name = kcu.constraint_name
        WHERE tc.constraint_type = 'CHECK'
    )
ORDER BY c.table_name, c.column_name;

| table_name                | column_name | data_type | recomendacao                                            |
| ------------------------- | ----------- | --------- | ------------------------------------------------------- |
| alpha_niveis              | nivel       | integer   | Considerar adicionar CHECK constraint para range válido |
| aula_avaliacoes           | nota        | numeric   | Considerar adicionar CHECK constraint para range válido |
| historia_eventos_timeline | ano         | integer   | Considerar adicionar CHECK constraint para range válido |
| historia_timeline         | ano         | integer   | Considerar adicionar CHECK constraint para range válido |



-- 3.3 Campos de status sem ENUM ou CHECK
SELECT 
    table_name,
    column_name,
    data_type,
    'Criar ENUM type ou CHECK constraint com valores válidos' as recomendacao
FROM information_schema.columns
WHERE table_schema = 'public'
    AND column_name IN ('status', 'estado', 'situacao')
    AND data_type NOT IN (
        SELECT typname FROM pg_type WHERE typtype = 'e'
    )
ORDER BY table_name;


| table_name                | column_name | data_type         | recomendacao                                            |
| ------------------------- | ----------- | ----------------- | ------------------------------------------------------- |
| alpha_aluno_desafios      | status      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| alpha_aula_progresso      | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |
| alpha_projetos_coletivos  | status      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| alpha_submissoes          | status      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| aula_status_log           | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |
| aulas                     | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |
| cessoes_instrumentos      | status      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| desafios_alpha_respostas  | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |
| forum_perguntas           | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |
| instrumentos_alunos       | estado      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| instrumentos_fisicos      | estado      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| manutencoes_instrumentos  | status      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| matriculas                | status      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| migration_log             | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |
| portfolios                | status      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| proposta_curricular       | status      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| sistema_presto            | status      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| turmas                    | status      | character varying | Criar ENUM type ou CHECK constraint com valores válidos |
| view_attendance_analytics | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |
| view_aulas_admin          | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |
| view_aulas_aluno          | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |
| view_aulas_professor      | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |
| vw_forum_stats            | status      | text              | Criar ENUM type ou CHECK constraint com valores válidos |



-- ========================================================================
-- 4️⃣ PROBLEMAS DE PERFORMANCE
-- ========================================================================

-- 4.1 Tabelas sem Primary Key
SELECT table_name
FROM information_schema.tables t
WHERE t.table_schema = 'public'
    AND t.table_type = 'BASE TABLE'
    AND t.table_name NOT IN (
        SELECT tc.table_name
        FROM information_schema.table_constraints tc
        WHERE tc.constraint_type = 'PRIMARY KEY'
            AND tc.table_schema = 'public'
    )
ORDER BY table_name;


Success. No rows returned





-- 4.2 Campos de busca frequente sem índice
SELECT 
    c.table_name,
    c.column_name,
    c.data_type,
    'Considerar adicionar índice para buscas' as recomendacao
FROM information_schema.columns c
WHERE c.table_schema = 'public'
    AND c.column_name IN ('nome', 'titulo', 'email', 'cpf', 'codigo', 'slug')
    AND NOT EXISTS (
        SELECT 1
        FROM pg_indexes pi
        WHERE pi.schemaname = 'public'
            AND pi.tablename = c.table_name
            AND pi.indexdef LIKE '%' || c.column_name || '%'
    )
ORDER BY c.table_name, c.column_name;

| table_name                      | column_name | data_type         | recomendacao                            |
| ------------------------------- | ----------- | ----------------- | --------------------------------------- |
| achievements_educacionais       | nome        | text              | Considerar adicionar índice para buscas |
| admin_alunos                    | email       | text              | Considerar adicionar índice para buscas |
| admin_alunos                    | nome        | text              | Considerar adicionar índice para buscas |
| admin_professores               | email       | text              | Considerar adicionar índice para buscas |
| admin_professores               | nome        | text              | Considerar adicionar índice para buscas |
| admin_usuarios_completos        | email       | text              | Considerar adicionar índice para buscas |
| admin_usuarios_completos        | nome        | text              | Considerar adicionar índice para buscas |
| alpha_badges                    | nome        | character varying | Considerar adicionar índice para buscas |
| alpha_celebracoes               | titulo      | character varying | Considerar adicionar índice para buscas |
| alpha_competencias              | codigo      | character varying | Considerar adicionar índice para buscas |
| alpha_competencias              | nome        | character varying | Considerar adicionar índice para buscas |
| alpha_desafios                  | titulo      | character varying | Considerar adicionar índice para buscas |
| alpha_metodologias              | nome        | character varying | Considerar adicionar índice para buscas |
| alpha_niveis                    | nome        | character varying | Considerar adicionar índice para buscas |
| alpha_projetos_coletivos        | titulo      | character varying | Considerar adicionar índice para buscas |
| alpha_submissoes                | titulo      | character varying | Considerar adicionar índice para buscas |
| aula_desafios                   | titulo      | text              | Considerar adicionar índice para buscas |
| aulas                           | titulo      | text              | Considerar adicionar índice para buscas |
| desafios_alpha                  | titulo      | text              | Considerar adicionar índice para buscas |
| documentos_institucionais       | titulo      | character varying | Considerar adicionar índice para buscas |
| forum_perguntas                 | titulo      | text              | Considerar adicionar índice para buscas |
| historia_conceitos_teoricos     | nome        | character varying | Considerar adicionar índice para buscas |
| historia_contexto_cultural      | titulo      | character varying | Considerar adicionar índice para buscas |
| historia_eventos_timeline       | titulo      | character varying | Considerar adicionar índice para buscas |
| historia_movimentos             | nome        | character varying | Considerar adicionar índice para buscas |
| historia_obras                  | titulo      | character varying | Considerar adicionar índice para buscas |
| historia_periodos               | nome        | character varying | Considerar adicionar índice para buscas |
| historia_playlists              | titulo      | character varying | Considerar adicionar índice para buscas |
| historia_quiz                   | titulo      | character varying | Considerar adicionar índice para buscas |
| historia_timeline               | titulo      | character varying | Considerar adicionar índice para buscas |
| instrumento_curiosidades        | titulo      | character varying | Considerar adicionar índice para buscas |
| instrumento_midias              | titulo      | character varying | Considerar adicionar índice para buscas |
| instrumento_performances        | titulo      | character varying | Considerar adicionar índice para buscas |
| instrumento_tecnicas            | nome        | character varying | Considerar adicionar índice para buscas |
| logos                           | nome        | text              | Considerar adicionar índice para buscas |
| materiais_apoio                 | titulo      | text              | Considerar adicionar índice para buscas |
| metodologias_ensino             | nome        | text              | Considerar adicionar índice para buscas |
| modulos                         | nome        | text              | Considerar adicionar índice para buscas |
| portfolio_evidencias            | titulo      | character varying | Considerar adicionar índice para buscas |
| portfolios                      | titulo      | character varying | Considerar adicionar índice para buscas |
| professores_conteudos           | titulo      | text              | Considerar adicionar índice para buscas |
| profiles                        | nome        | text              | Considerar adicionar índice para buscas |
| repertorio_musical              | titulo      | text              | Considerar adicionar índice para buscas |
| rubricas_avaliacao              | nome        | character varying | Considerar adicionar índice para buscas |
| sequencias_didaticas            | titulo      | text              | Considerar adicionar índice para buscas |
| sequencias_didaticas_expandidas | titulo      | character varying | Considerar adicionar índice para buscas |
| sistema_presto                  | titulo      | character varying | Considerar adicionar índice para buscas |
| turmas                          | nome        | character varying | Considerar adicionar índice para buscas |
| usuarios                        | nome        | text              | Considerar adicionar índice para buscas |
| view_attendance_analytics       | titulo      | text              | Considerar adicionar índice para buscas |
| view_aulas_admin                | titulo      | text              | Considerar adicionar índice para buscas |
| view_aulas_aluno                | titulo      | text              | Considerar adicionar índice para buscas |
| view_aulas_professor            | titulo      | text              | Considerar adicionar índice para buscas |
| view_placar_logos               | nome        | text              | Considerar adicionar índice para buscas |
| view_professor_dashboard        | nome        | text              | Considerar adicionar índice para buscas |
| view_user_gamification          | nome        | text              | Considerar adicionar índice para buscas |
| vw_forum_stats                  | titulo      | text              | Considerar adicionar índice para buscas |
| vw_metodologias_stats           | nome        | text              | Considerar adicionar índice para buscas |
| vw_ranking_geral                | nome        | text              | Considerar adicionar índice para buscas |
| vw_repertorio_stats             | titulo      | text              | Considerar adicionar índice para buscas |
| vw_violin_ids                   | nome        | character varying | Considerar adicionar índice para buscas |
| vw_violino_instrumentos         | nome        | character varying | Considerar adicionar índice para buscas |



-- 4.3 Campos TEXT sem limite (possível problema de armazenamento)
SELECT 
    table_name,
    column_name,
    'Considerar usar VARCHAR(n) com limite apropriado' as recomendacao
FROM information_schema.columns
WHERE table_schema = 'public'
    AND data_type = 'text'
    AND column_name NOT IN ('descricao', 'conteudo', 'biografia', 'observacoes', 'requisitos')
ORDER BY table_name, column_name;


| table_name                      | column_name              | recomendacao                                     |
| ------------------------------- | ------------------------ | ------------------------------------------------ |
| achievements                    | badge_color              | Considerar usar VARCHAR(n) com limite apropriado |
| achievements                    | badge_icon               | Considerar usar VARCHAR(n) com limite apropriado |
| achievements                    | category                 | Considerar usar VARCHAR(n) com limite apropriado |
| achievements                    | description              | Considerar usar VARCHAR(n) com limite apropriado |
| achievements                    | name                     | Considerar usar VARCHAR(n) com limite apropriado |
| achievements                    | requirement_type         | Considerar usar VARCHAR(n) com limite apropriado |
| achievements_educacionais       | categoria                | Considerar usar VARCHAR(n) com limite apropriado |
| achievements_educacionais       | icone                    | Considerar usar VARCHAR(n) com limite apropriado |
| achievements_educacionais       | nome                     | Considerar usar VARCHAR(n) com limite apropriado |
| achievements_educacionais       | tipo_criterio            | Considerar usar VARCHAR(n) com limite apropriado |
| adaptacoes_espacos_alternativos | impacto_comunitario      | Considerar usar VARCHAR(n) com limite apropriado |
| adaptacoes_espacos_alternativos | replicabilidade_modelo   | Considerar usar VARCHAR(n) com limite apropriado |
| adaptacoes_espacos_alternativos | resultados_observados    | Considerar usar VARCHAR(n) com limite apropriado |
| adaptacoes_espacos_alternativos | sustentabilidade_projeto | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | city                     | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | email                    | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | full_name                | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | instrumento              | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | nivel                    | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | nome                     | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | phone                    | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | state                    | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | status_atividade         | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | turma                    | Considerar usar VARCHAR(n) com limite apropriado |
| admin_alunos                    | user_level               | Considerar usar VARCHAR(n) com limite apropriado |
| admin_professores               | email                    | Considerar usar VARCHAR(n) com limite apropriado |
| admin_professores               | formacao                 | Considerar usar VARCHAR(n) com limite apropriado |
| admin_professores               | full_name                | Considerar usar VARCHAR(n) com limite apropriado |
| admin_professores               | nome                     | Considerar usar VARCHAR(n) com limite apropriado |
| admin_professores               | phone                    | Considerar usar VARCHAR(n) com limite apropriado |
| admin_professores               | status_atividade         | Considerar usar VARCHAR(n) com limite apropriado |
| admin_professores               | user_level               | Considerar usar VARCHAR(n) com limite apropriado |
| admin_usuarios_completos        | city                     | Considerar usar VARCHAR(n) com limite apropriado |
| admin_usuarios_completos        | email                    | Considerar usar VARCHAR(n) com limite apropriado |
| admin_usuarios_completos        | full_name                | Considerar usar VARCHAR(n) com limite apropriado |
| admin_usuarios_completos        | nome                     | Considerar usar VARCHAR(n) com limite apropriado |
| admin_usuarios_completos        | phone                    | Considerar usar VARCHAR(n) com limite apropriado |
| admin_usuarios_completos        | state                    | Considerar usar VARCHAR(n) com limite apropriado |
| admin_usuarios_completos        | status_atividade         | Considerar usar VARCHAR(n) com limite apropriado |
| admin_usuarios_completos        | tipo_usuario             | Considerar usar VARCHAR(n) com limite apropriado |
| admin_usuarios_completos        | user_level               | Considerar usar VARCHAR(n) com limite apropriado |
| admins                          | cargo                    | Considerar usar VARCHAR(n) com limite apropriado |
| admins                          | departamento             | Considerar usar VARCHAR(n) com limite apropriado |
| admins                          | nivel_acesso             | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_aluno_badges              | notas                    | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_aula_progresso            | status                   | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_badges                    | descricao_conquista      | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_badges                    | imagem_url               | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_desafios                  | imagem_url               | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_mentorias                 | feedback_mentorado       | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_metodologias              | aplicacao_brasil         | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_metodologias              | descricao_completa       | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_metodologias              | descricao_curta          | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_metodologias              | filosofia                | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_metodologias              | metodologia_ensino       | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_metodologias              | publico_alvo             | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_projetos_coletivos        | feedback_professor       | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_projetos_coletivos        | impacto                  | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_ranking                   | recompensa_especial      | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_submissoes                | evidencia_url            | Considerar usar VARCHAR(n) com limite apropriado |
| alpha_submissoes                | feedback_professor       | Considerar usar VARCHAR(n) com limite apropriado |
| alunos                          | instrumento              | Considerar usar VARCHAR(n) com limite apropriado |
| alunos                          | nivel                    | Considerar usar VARCHAR(n) com limite apropriado |
| alunos                          | turma                    | Considerar usar VARCHAR(n) com limite apropriado |
| audit_activities                | action                   | Considerar usar VARCHAR(n) com limite apropriado |
| audit_activities                | component_name           | Considerar usar VARCHAR(n) com limite apropriado |
| audit_activities                | hook_name                | Considerar usar VARCHAR(n) com limite apropriado |
| audit_activities                | resource                 | Considerar usar VARCHAR(n) com limite apropriado |
| audit_activities                | resource_id              | Considerar usar VARCHAR(n) com limite apropriado |
| audit_activities                | session_id               | Considerar usar VARCHAR(n) com limite apropriado |
| audit_activities                | severity                 | Considerar usar VARCHAR(n) com limite apropriado |
| audit_activities                | user_agent               | Considerar usar VARCHAR(n) com limite apropriado |
| aula_atividades                 | tipo                     | Considerar usar VARCHAR(n) com limite apropriado |
| aula_avaliacoes                 | comentario               | Considerar usar VARCHAR(n) com limite apropriado |
| aula_avaliacoes                 | pontos_melhorar          | Considerar usar VARCHAR(n) com limite apropriado |
| aula_avaliacoes                 | pontos_positivos         | Considerar usar VARCHAR(n) com limite apropriado |
| aula_checklist                  | item                     | Considerar usar VARCHAR(n) com limite apropriado |
| aula_checklist                  | tipo                     | Considerar usar VARCHAR(n) com limite apropriado |
| aula_criterios_avaliacao        | criterio                 | Considerar usar VARCHAR(n) com limite apropriado |
| aula_desafios                   | criterios_avaliacao      | Considerar usar VARCHAR(n) com limite apropriado |
| aula_desafios                   | publico_alvo             | Considerar usar VARCHAR(n) com limite apropriado |
| aula_desafios                   | titulo                   | Considerar usar VARCHAR(n) com limite apropriado |
| aula_feedback                   | texto                    | Considerar usar VARCHAR(n) com limite apropriado |
| aula_feedbacks                  | texto                    | Considerar usar VARCHAR(n) com limite apropriado |
| aula_materiais                  | tipo                     | Considerar usar VARCHAR(n) com limite apropriado |
| aula_materiais                  | url                      | Considerar usar VARCHAR(n) com limite apropriado |
| aula_registros                  | tipo                     | Considerar usar VARCHAR(n) com limite apropriado |
| aula_registros                  | url                      | Considerar usar VARCHAR(n) com limite apropriado |
| aula_status_log                 | status                   | Considerar usar VARCHAR(n) com limite apropriado |
| aula_tags                       | tipo                     | Considerar usar VARCHAR(n) com limite apropriado |
| aula_tags                       | valor                    | Considerar usar VARCHAR(n) com limite apropriado |
| aulas                           | desafio_alpha            | Considerar usar VARCHAR(n) com limite apropriado |
| aulas                           | formato                  | Considerar usar VARCHAR(n) com limite apropriado |
| aulas                           | nivel                    | Considerar usar VARCHAR(n) com limite apropriado |
| aulas                           | objetivo_didatico        | Considerar usar VARCHAR(n) com limite apropriado |
| aulas                           | resumo_atividades        | Considerar usar VARCHAR(n) com limite apropriado |
| aulas                           | status                   | Considerar usar VARCHAR(n) com limite apropriado |
| aulas                           | titulo                   | Considerar usar VARCHAR(n) com limite apropriado |
| autoavaliacoes                  | contribuicao_grupo       | Considerar usar VARCHAR(n) com limite apropriado |
| autoavaliacoes                  | ideias_experimentadas    | Considerar usar VARCHAR(n) com limite apropriado |



-- ========================================================================
-- 5️⃣ PROBLEMAS DE AUDITORIA
-- ========================================================================

-- 5.1 Tabelas importantes sem created_at
SELECT table_name
FROM information_schema.tables t
WHERE t.table_schema = 'public'
    AND t.table_type = 'BASE TABLE'
    AND t.table_name NOT IN (
        SELECT DISTINCT table_name
        FROM information_schema.columns
        WHERE table_schema = 'public'
            AND column_name = 'created_at'
    )
    AND t.table_name NOT LIKE '%_log'
    AND t.table_name NOT LIKE '%_history'
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



-- 5.2 Tabelas sem updated_at
SELECT table_name
FROM information_schema.tables t
WHERE t.table_schema = 'public'
    AND t.table_type = 'BASE TABLE'
    AND t.table_name NOT IN (
        SELECT DISTINCT table_name
        FROM information_schema.columns
        WHERE table_schema = 'public'
            AND column_name = 'updated_at'
    )
    AND t.table_name NOT LIKE '%_log'
    AND t.table_name NOT LIKE '%_history'
ORDER BY table_name;

| table_name                     |
| ------------------------------ |
| achievements                   |
| achievements_educacionais      |
| admins                         |
| alpha_aluno_badges             |
| alpha_badges                   |
| alpha_celebracoes              |
| alpha_competencias             |
| alpha_estudante_badges         |
| alpha_mentorias                |
| alpha_niveis                   |
| alpha_xp_historico             |
| alunos                         |
| audit_activities               |
| aula_atividades                |
| aula_checklist                 |
| aula_criterios_avaliacao       |
| aula_desafio_alpha             |
| aula_desafios                  |
| aula_feedback                  |
| aula_feedbacks                 |
| aula_materiais                 |
| aula_permissoes                |
| aula_registros                 |
| aula_tags                      |
| aulas                          |
| autoavaliacoes                 |
| avaliacoes_rubricas            |
| desafios_alpha                 |
| desafios_alpha_respostas       |
| devotional_content             |
| experiencias_brasileiras       |
| feedback_pares                 |
| forum_likes                    |
| forum_respostas                |
| historia_compositores          |
| historia_conceitos_teoricos    |
| historia_contexto_cultural     |
| historia_eventos_timeline      |
| historia_generos               |
| historia_instrumentos_evolucao |
| historia_movimentos            |
| historia_obras                 |
| historia_periodos              |
| historia_quiz                  |
| historia_quiz_respostas        |
| historico_instrumentos         |
| hook_cache                     |
| indicadores_impacto            |
| instrumento_curiosidades       |
| instrumento_midias             |
| instrumento_performances       |
| instrumento_quiz               |
| instrumento_sons               |
| instrumento_sons_variacoes     |
| instrumento_tecnicas           |
| instrumentos                   |
| instrumentos_relacionados      |
| logos                          |
| materiais_apoio                |
| matriculas                     |
| metodologias_ensino            |
| modulos                        |
| permissions                    |
| presencas                      |
| professor_instrumentos         |
| professores                    |
| professores_categorias         |
| professores_conteudos          |
| profiles                       |
| qr_scans                       |
| referenciais_internacionais    |
| repertorio_musical             |
| role_permissions               |
| roles                          |
| sequencias_didaticas           |
| trigger_logs                   |
| turma_alunos                   |
| turmas                         |
| user_achievements              |
| user_devotional_progress       |
| user_notifications             |
| user_progress                  |
| usuarios                       |



-- 5.3 Tabelas sem soft delete (deleted_at)
SELECT table_name
FROM information_schema.tables t
WHERE t.table_schema = 'public'
    AND t.table_type = 'BASE TABLE'
    AND t.table_name NOT IN (
        SELECT DISTINCT table_name
        FROM information_schema.columns
        WHERE table_schema = 'public'
            AND column_name IN ('deleted_at', 'ativo', 'excluido')
    )
    AND t.table_name IN ('alunos', 'professores', 'turmas', 'aulas', 'instrumentos')
ORDER BY table_name;

| table_name |
| ---------- |
| aulas      |



-- ========================================================================
-- 6️⃣ PROBLEMAS DE SEGURANÇA (RLS)
-- ========================================================================

-- 6.1 Tabelas sem Row Level Security habilitado
SELECT 
    schemaname,
    tablename,
    rowsecurity,
    CASE 
        WHEN rowsecurity = false THEN '⚠️ RLS desabilitado - RISCO DE SEGURANÇA'
        ELSE '✅ RLS habilitado'
    END as status_seguranca
FROM pg_tables
WHERE schemaname = 'public'
    AND tablename NOT LIKE 'pg_%'
ORDER BY rowsecurity, tablename;

| schemaname | tablename                       | rowsecurity | status_seguranca                         |
| ---------- | ------------------------------- | ----------- | ---------------------------------------- |
| public     | achievements_educacionais       | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | adaptacoes_espacos_alternativos | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_aluno_badges              | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_aluno_desafios            | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_aula_progresso            | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_celebracoes               | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_estudante_badges          | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_mentorias                 | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_niveis                    | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_progresso_estudante       | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_projetos_coletivos        | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_ranking                   | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | alpha_xp_historico              | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | aula_avaliacoes                 | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | aula_presencas                  | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | capacitacao_docente             | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | comunicacao_engajamento         | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | desafios_alpha                  | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | desafios_alpha_respostas        | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | documentos_institucionais       | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | experiencias_brasileiras        | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | forum_likes                     | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | forum_perguntas                 | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | forum_respostas                 | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | historia_movimentos_artisticos  | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | historia_timeline               | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | instrumentos                    | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | instrumentos_alunos             | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | materiais_apoio                 | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | metodologias_ensino             | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | professor_instrumentos          | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | proposta_curricular             | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | referenciais_internacionais     | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | repertorio_musical              | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | sequencias_didaticas            | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | sequencias_didaticas_expandidas | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | sistema_presto                  | false       | ⚠️ RLS desabilitado - RISCO DE SEGURANÇA |
| public     | achievements                    | true        | ✅ RLS habilitado                         |
| public     | achievements_progress           | true        | ✅ RLS habilitado                         |
| public     | admins                          | true        | ✅ RLS habilitado                         |
| public     | alpha_badges                    | true        | ✅ RLS habilitado                         |
| public     | alpha_competencias              | true        | ✅ RLS habilitado                         |
| public     | alpha_desafios                  | true        | ✅ RLS habilitado                         |
| public     | alpha_metodologias              | true        | ✅ RLS habilitado                         |
| public     | alpha_progresso                 | true        | ✅ RLS habilitado                         |
| public     | alpha_submissoes                | true        | ✅ RLS habilitado                         |
| public     | alunos                          | true        | ✅ RLS habilitado                         |
| public     | audit_activities                | true        | ✅ RLS habilitado                         |
| public     | aula_atividades                 | true        | ✅ RLS habilitado                         |
| public     | aula_checklist                  | true        | ✅ RLS habilitado                         |
| public     | aula_criterios_avaliacao        | true        | ✅ RLS habilitado                         |
| public     | aula_desafio_alpha              | true        | ✅ RLS habilitado                         |
| public     | aula_desafios                   | true        | ✅ RLS habilitado                         |
| public     | aula_feedback                   | true        | ✅ RLS habilitado                         |
| public     | aula_feedbacks                  | true        | ✅ RLS habilitado                         |
| public     | aula_materiais                  | true        | ✅ RLS habilitado                         |
| public     | aula_permissoes                 | true        | ✅ RLS habilitado                         |
| public     | aula_registros                  | true        | ✅ RLS habilitado                         |
| public     | aula_status_log                 | true        | ✅ RLS habilitado                         |
| public     | aula_tags                       | true        | ✅ RLS habilitado                         |
| public     | aulas                           | true        | ✅ RLS habilitado                         |
| public     | autoavaliacoes                  | true        | ✅ RLS habilitado                         |
| public     | avaliacoes_rubricas             | true        | ✅ RLS habilitado                         |
| public     | cessoes_instrumentos            | true        | ✅ RLS habilitado                         |
| public     | devotional_content              | true        | ✅ RLS habilitado                         |
| public     | feedback_pares                  | true        | ✅ RLS habilitado                         |
| public     | historia_compositores           | true        | ✅ RLS habilitado                         |
| public     | historia_conceitos_teoricos     | true        | ✅ RLS habilitado                         |
| public     | historia_contexto_cultural      | true        | ✅ RLS habilitado                         |
| public     | historia_eventos_timeline       | true        | ✅ RLS habilitado                         |
| public     | historia_generos                | true        | ✅ RLS habilitado                         |
| public     | historia_instrumentos_evolucao  | true        | ✅ RLS habilitado                         |
| public     | historia_movimentos             | true        | ✅ RLS habilitado                         |
| public     | historia_obras                  | true        | ✅ RLS habilitado                         |
| public     | historia_periodos               | true        | ✅ RLS habilitado                         |
| public     | historia_playlists              | true        | ✅ RLS habilitado                         |
| public     | historia_progresso_usuario      | true        | ✅ RLS habilitado                         |
| public     | historia_quiz                   | true        | ✅ RLS habilitado                         |
| public     | historia_quiz_respostas         | true        | ✅ RLS habilitado                         |
| public     | historico_instrumentos          | true        | ✅ RLS habilitado                         |
| public     | hook_cache                      | true        | ✅ RLS habilitado                         |
| public     | indicadores_impacto             | true        | ✅ RLS habilitado                         |
| public     | instrumento_curiosidades        | true        | ✅ RLS habilitado                         |
| public     | instrumento_midias              | true        | ✅ RLS habilitado                         |
| public     | instrumento_performances        | true        | ✅ RLS habilitado                         |
| public     | instrumento_quiz                | true        | ✅ RLS habilitado                         |
| public     | instrumento_sons                | true        | ✅ RLS habilitado                         |
| public     | instrumento_sons_variacoes      | true        | ✅ RLS habilitado                         |
| public     | instrumento_tecnicas            | true        | ✅ RLS habilitado                         |
| public     | instrumentos_fisicos            | true        | ✅ RLS habilitado                         |
| public     | instrumentos_relacionados       | true        | ✅ RLS habilitado                         |
| public     | lessons                         | true        | ✅ RLS habilitado                         |
| public     | logos                           | true        | ✅ RLS habilitado                         |
| public     | manutencoes_instrumentos        | true        | ✅ RLS habilitado                         |
| public     | matriculas                      | true        | ✅ RLS habilitado                         |
| public     | migration_log                   | true        | ✅ RLS habilitado                         |
| public     | modules                         | true        | ✅ RLS habilitado                         |
| public     | modulos                         | true        | ✅ RLS habilitado                         |
| public     | permission_templates            | true        | ✅ RLS habilitado                         |
| public     | permissions                     | true        | ✅ RLS habilitado                         |



-- 6.2 Políticas RLS por tabela
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

| schemaname | tablename                      | policyname                                           | permissive | roles                | cmd    | qual                                                                                                                                                                                                                                                                                                 |
| ---------- | ------------------------------ | ---------------------------------------------------- | ---------- | -------------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| public     | achievements                   | Achievements are viewable by everyone                | PERMISSIVE | {public}             | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | achievements                   | Anyone can view public achievements                  | PERMISSIVE | {public}             | SELECT | (is_active = true)                                                                                                                                                                                                                                                                                   |
| public     | achievements_progress          | achievements_progress_simple                         | PERMISSIVE | {public}             | ALL    | (user_id = auth.uid())                                                                                                                                                                                                                                                                               |
| public     | admins                         | admins_simple_access                                 | PERMISSIVE | {public}             | ALL    | (id = auth.uid())                                                                                                                                                                                                                                                                                    |
| public     | alpha_badges                   | Permitir leitura de badges                           | PERMISSIVE | {anon,authenticated} | SELECT | ((visivel = true) OR (visivel IS NULL))                                                                                                                                                                                                                                                              |
| public     | alpha_badges                   | alpha_badges_select_all                              | PERMISSIVE | {public}             | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | alpha_competencias             | Competências são visíveis para todos                 | PERMISSIVE | {public}             | SELECT | (ativo = true)                                                                                                                                                                                                                                                                                       |
| public     | alpha_competencias             | Permitir leitura de competências                     | PERMISSIVE | {anon,authenticated} | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | alpha_desafios                 | Permitir leitura de desafios ativos                  | PERMISSIVE | {anon,authenticated} | SELECT | ((ativo = true) OR (ativo IS NULL))                                                                                                                                                                                                                                                                  |
| public     | alpha_metodologias             | Metodologias são visíveis para todos                 | PERMISSIVE | {public}             | SELECT | (ativo = true)                                                                                                                                                                                                                                                                                       |
| public     | alpha_metodologias             | Permitir leitura de metodologias                     | PERMISSIVE | {anon,authenticated} | SELECT | ((ativo = true) OR (ativo IS NULL))                                                                                                                                                                                                                                                                  |
| public     | alpha_progresso                | Sistema pode gerenciar progresso                     | PERMISSIVE | {public}             | ALL    | true                                                                                                                                                                                                                                                                                                 |
| public     | alpha_progresso                | Usuários veem seu próprio progresso                  | PERMISSIVE | {public}             | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | alpha_submissoes               | Admin gerencia todas submissoes alpha                | PERMISSIVE | {authenticated}      | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | alpha_submissoes               | Admin vê todas submissoes                            | PERMISSIVE | {authenticated}      | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | alpha_submissoes               | Aluno cria próprias submissoes alpha                 | PERMISSIVE | {authenticated}      | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | alpha_submissoes               | Aluno vê próprias submissoes                         | PERMISSIVE | {authenticated}      | SELECT | (user_id = auth.uid())                                                                                                                                                                                                                                                                               |
| public     | alpha_submissoes               | Aluno vê próprias submissoes alpha                   | PERMISSIVE | {authenticated}      | SELECT | (user_id = auth.uid())                                                                                                                                                                                                                                                                               |
| public     | alpha_submissoes               | Alunos atualizam próprias submissões                 | PERMISSIVE | {authenticated}      | UPDATE | ((auth.uid() = user_id) AND ((status)::text = 'pendente'::text))                                                                                                                                                                                                                                     |
| public     | alpha_submissoes               | Alunos criam submissões                              | PERMISSIVE | {authenticated}      | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | alpha_submissoes               | Alunos veem próprias submissões                      | PERMISSIVE | {authenticated}      | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | alpha_submissoes               | Professor avalia submissoes de seus alunos           | PERMISSIVE | {authenticated}      | UPDATE | is_professor_of_student(user_id)                                                                                                                                                                                                                                                                     |
| public     | alpha_submissoes               | Professor vê submissoes de alunos                    | PERMISSIVE | {authenticated}      | SELECT | is_professor_of_student(user_id)                                                                                                                                                                                                                                                                     |
| public     | alpha_submissoes               | Professor vê submissoes de seus alunos               | PERMISSIVE | {authenticated}      | SELECT | is_professor_of_student(user_id)                                                                                                                                                                                                                                                                     |
| public     | alpha_submissoes               | Professores avaliam submissões                       | PERMISSIVE | {authenticated}      | UPDATE | (EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.tipo_usuario = ANY (ARRAY['professor'::text, 'admin'::text])))))                                                                                                                                               |
| public     | alpha_submissoes               | Professores veem todas submissões                    | PERMISSIVE | {authenticated}      | SELECT | (EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.tipo_usuario = ANY (ARRAY['professor'::text, 'admin'::text])))))                                                                                                                                               |
| public     | alpha_submissoes               | Usuários podem atualizar suas submissões             | PERMISSIVE | {public}             | UPDATE | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | alpha_submissoes               | Usuários veem suas próprias submissões               | PERMISSIVE | {public}             | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | alunos                         | Admins veem todos alunos                             | PERMISSIVE | {authenticated}      | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | alunos                         | Alunos veem próprios dados                           | PERMISSIVE | {authenticated}      | SELECT | (auth.uid() = id)                                                                                                                                                                                                                                                                                    |
| public     | alunos                         | Professores veem seus alunos                         | PERMISSIVE | {authenticated}      | SELECT | is_professor_of_student(id)                                                                                                                                                                                                                                                                          |
| public     | audit_activities               | admin_full_access_audit                              | PERMISSIVE | {authenticated}      | ALL    | ((detect_user_role(auth.uid()) ->> 'role'::text) = 'admin'::text)                                                                                                                                                                                                                                    |
| public     | audit_activities               | audit_activities_simple                              | PERMISSIVE | {public}             | SELECT | (user_id = auth.uid())                                                                                                                                                                                                                                                                               |
| public     | aula_atividades                | Acesso via aula                                      | PERMISSIVE | {authenticated}      | SELECT | (EXISTS ( SELECT 1
   FROM aulas a
  WHERE ((a.id = aula_atividades.aula_id) AND ((a.responsavel_id = auth.uid()) OR is_admin(auth.uid())))))                                                                                                                                                        |
| public     | aula_atividades                | aula_atividades_access                               | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_checklist                 | aula_checklist_access                                | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | aula_criterios_avaliacao       | aula_criterios_avaliacao_access                      | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | aula_desafio_alpha             | aula_desafio_alpha_access                            | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_desafios                  | alunos_podem_ver_desafios_aulas                      | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | aula_desafios                  | aula_desafios_access                                 | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_feedback                  | aula_feedback_access                                 | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_feedbacks                 | aula_feedbacks_access                                | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_materiais                 | alunos_podem_ver_materiais_aulas                     | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | aula_materiais                 | aula_materiais_access                                | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_permissoes                | aula_permissoes_admin                                | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | aula_registros                 | aula_registros_access                                | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM matriculas m
  WHERE (m.aluno_id = auth.uid())))) |
| public     | aula_status_log                | aula_status_log_staff                                | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | aula_tags                      | aula_tags_read                                       | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | aulas                          | Admin gerencia todas aulas                           | PERMISSIVE | {authenticated}      | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | aulas                          | Professor vê suas aulas                              | PERMISSIVE | {authenticated}      | ALL    | (responsavel_id = auth.uid())                                                                                                                                                                                                                                                                        |
| public     | aulas                          | alunos_podem_ver_aulas                               | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | aulas                          | aulas_modify_staff                                   | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | aulas                          | aulas_read_all                                       | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | autoavaliacoes                 | Usuários podem atualizar suas autoavaliações         | PERMISSIVE | {public}             | UPDATE | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | autoavaliacoes                 | Usuários podem criar autoavaliações                  | PERMISSIVE | {public}             | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | autoavaliacoes                 | Usuários veem suas autoavaliações                    | PERMISSIVE | {public}             | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | avaliacoes_rubricas            | Usuários veem avaliações de suas evidências          | PERMISSIVE | {public}             | SELECT | ((EXISTS ( SELECT 1
   FROM (portfolio_evidencias pe
     JOIN portfolios p ON ((pe.portfolio_id = p.id)))
  WHERE ((pe.id = avaliacoes_rubricas.evidencia_id) AND (p.user_id = auth.uid())))) OR (auth.uid() = avaliador_id))                                                                       |
| public     | cessoes_instrumentos           | cessoes_instrumentos_access                          | PERMISSIVE | {authenticated}      | ALL    | ((aluno_id = auth.uid()) OR (EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                     |
| public     | devotional_content             | Anyone can view published devotionals                | PERMISSIVE | {public}             | SELECT | (is_published = true)                                                                                                                                                                                                                                                                                |
| public     | devotional_content             | Published devotional content is viewable by everyone | PERMISSIVE | {public}             | SELECT | (is_published = true)                                                                                                                                                                                                                                                                                |
| public     | feedback_pares                 | Usuários podem dar feedback                          | PERMISSIVE | {public}             | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | feedback_pares                 | Usuários veem feedback relacionado a eles            | PERMISSIVE | {public}             | SELECT | ((auth.uid() = avaliador_id) OR (auth.uid() = avaliado_id))                                                                                                                                                                                                                                          |
| public     | historia_compositores          | Conteúdo público - leitura                           | PERMISSIVE | {public}             | SELECT | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | historia_conceitos_teoricos    | Conteúdo público - leitura                           | PERMISSIVE | {public}             | SELECT | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | historia_contexto_cultural     | Conteúdo público - leitura                           | PERMISSIVE | {public}             | SELECT | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | historia_eventos_timeline      | Conteúdo público - leitura                           | PERMISSIVE | {public}             | SELECT | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | historia_generos               | Conteúdo público - leitura                           | PERMISSIVE | {public}             | SELECT | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | historia_instrumentos_evolucao | Conteúdo público - leitura                           | PERMISSIVE | {public}             | SELECT | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | historia_movimentos            | Conteúdo público - leitura                           | PERMISSIVE | {public}             | SELECT | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | historia_obras                 | Conteúdo público - leitura                           | PERMISSIVE | {public}             | SELECT | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | historia_periodos              | Conteúdo público - leitura                           | PERMISSIVE | {public}             | SELECT | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | historia_playlists             | Criador gerencia suas playlists                      | PERMISSIVE | {public}             | ALL    | (auth.uid() = criador_id)                                                                                                                                                                                                                                                                            |
| public     | historia_playlists             | Playlists publicadas são públicas                    | PERMISSIVE | {public}             | SELECT | ((publicada = true) OR (auth.uid() = criador_id))                                                                                                                                                                                                                                                    |
| public     | historia_progresso_usuario     | Usuário gerencia seu progresso                       | PERMISSIVE | {public}             | ALL    | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | historia_progresso_usuario     | Usuário vê apenas seu progresso                      | PERMISSIVE | {public}             | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | historia_quiz                  | Conteúdo público - leitura                           | PERMISSIVE | {public}             | SELECT | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | historia_quiz_respostas        | Usuário insere suas respostas                        | PERMISSIVE | {public}             | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | historia_quiz_respostas        | Usuário vê apenas suas respostas                     | PERMISSIVE | {public}             | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | historico_instrumentos         | historico_instrumentos_access                        | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | hook_cache                     | users_own_cache                                      | PERMISSIVE | {authenticated}      | ALL    | (user_id = auth.uid())                                                                                                                                                                                                                                                                               |
| public     | indicadores_impacto            | Usuários podem registrar indicadores                 | PERMISSIVE | {public}             | INSERT | null                                                                                                                                                                                                                                                                                                 |
| public     | indicadores_impacto            | Usuários veem seus indicadores                       | PERMISSIVE | {public}             | SELECT | (auth.uid() = user_id)                                                                                                                                                                                                                                                                               |
| public     | instrumento_curiosidades       | instrumento_curiosidades_read                        | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_midias             | instrumento_midias_read                              | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_performances       | instrumento_performances_read                        | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_quiz               | instrumento_quiz_read                                | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_sons               | instrumento_sons_read                                | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_sons_variacoes     | instrumento_sons_variacoes_read                      | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumento_tecnicas           | instrumento_tecnicas_read                            | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumentos                   | Admin gerencia instrumentos                          | PERMISSIVE | {authenticated}      | ALL    | is_admin(auth.uid())                                                                                                                                                                                                                                                                                 |
| public     | instrumentos                   | Todos veem instrumentos ativos                       | PERMISSIVE | {authenticated}      | SELECT | (ativo = true)                                                                                                                                                                                                                                                                                       |
| public     | instrumentos                   | instrumentos_modify_staff                            | PERMISSIVE | {authenticated}      | ALL    | ((EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                                                |
| public     | instrumentos                   | instrumentos_read_all                                | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumentos_alunos            | instrumentos_alunos_access                           | PERMISSIVE | {authenticated}      | ALL    | ((aluno_id = auth.uid()) OR (EXISTS ( SELECT 1
   FROM admins
  WHERE ((admins.id = auth.uid()) AND (admins.ativo = true)))) OR (EXISTS ( SELECT 1
   FROM professores
  WHERE ((professores.id = auth.uid()) AND (professores.ativo = true)))))                                                     |
| public     | instrumentos_fisicos           | instrumentos_fisicos_access                          | PERMISSIVE | {authenticated}      | ALL    | true                                                                                                                                                                                                                                                                                                 |
| public     | instrumentos_relacionados      | instrumentos_relacionados_read                       | PERMISSIVE | {authenticated}      | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | lessons                        | Anyone can view lessons from active modules          | PERMISSIVE | {public}             | SELECT | (EXISTS ( SELECT 1
   FROM modules
  WHERE ((modules.id = lessons.module_id) AND (modules.is_active = true))))                                                                                                                                                                                       |
| public     | lessons                        | Authenticated users can manage lessons               | PERMISSIVE | {public}             | ALL    | (auth.role() = 'authenticated'::text)                                                                                                                                                                                                                                                                |
| public     | lessons                        | Lessons are viewable by everyone                     | PERMISSIVE | {public}             | SELECT | true                                                                                                                                                                                                                                                                                                 |
| public     | lessons                        | Only admins can modify lessons                       | PERMISSIVE | {public}             | ALL    | ((auth.jwt() ->> 'role'::text) = 'admin'::text)                                                                                                                                                                                                                                                      |



-- ========================================================================
-- 7️⃣ DUPLICAÇÕES E REDUNDÂNCIAS
-- ========================================================================

-- 7.1 Tabelas com nomes similares (possível duplicação)
SELECT 
    t1.table_name as tabela_1,
    t2.table_name as tabela_2,
    'Verificar se são duplicadas ou devem ser mescladas' as acao
FROM information_schema.tables t1
JOIN information_schema.tables t2 
    ON similarity(t1.table_name, t2.table_name) > 0.5
    AND t1.table_name < t2.table_name
WHERE t1.table_schema = 'public'
    AND t2.table_schema = 'public'
    AND t1.table_type = 'BASE TABLE'
    AND t2.table_type = 'BASE TABLE';

    Error: Failed to run sql query: ERROR: 42883: function similarity(information_schema.sql_identifier, information_schema.sql_identifier) does not exist LINE 7: ON similarity(t1.table_name, t2.table_name) > 0.5 ^ HINT: No function matches the given name and argument types. You might need to add explicit type casts.





-- 7.2 Colunas duplicadas entre tabelas relacionadas
SELECT 
    c1.table_name as tabela_1,
    c2.table_name as tabela_2,
    c1.column_name,
    'Verificar se é denormalização intencional' as observacao
FROM information_schema.columns c1
JOIN information_schema.columns c2 
    ON c1.column_name = c2.column_name
    AND c1.table_name < c2.table_name
WHERE c1.table_schema = 'public'
    AND c2.table_schema = 'public'
    AND c1.column_name NOT IN ('id', 'created_at', 'updated_at', 'deleted_at')
    AND c1.column_name NOT LIKE '%_id'
ORDER BY c1.column_name, c1.table_name;

| tabela_1                    | tabela_2                              | column_name          | observacao                                |
| --------------------------- | ------------------------------------- | -------------------- | ----------------------------------------- |
| audit_activities            | user_points_log                       | action               | Verificar se é denormalização intencional |
| instrumentos                | vw_violino_palestra                   | anatomia_partes      | Verificar se é denormalização intencional |
| instrumentos                | vw_violino_instrumentos               | anatomia_partes      | Verificar se é denormalização intencional |
| vw_violino_instrumentos     | vw_violino_palestra                   | anatomia_partes      | Verificar se é denormalização intencional |
| historia_eventos_timeline   | historia_timeline                     | ano                  | Verificar se é denormalização intencional |
| instrumento_sons_variacoes  | vw_violino_instrumento_sons_variacoes | ano_gravacao         | Verificar se é denormalização intencional |
| metodologias_ensino         | vw_metodologias_stats                 | aplicacao_brasileira | Verificar se é denormalização intencional |
| feedback_pares              | portfolio_evidencias                  | aprovado             | Verificar se é denormalização intencional |
| instrumento_quiz            | instrumento_sons_variacoes            | arquivo_audio        | Verificar se é denormalização intencional |
| instrumento_quiz            | vw_violino_instrumento_sons           | arquivo_audio        | Verificar se é denormalização intencional |
| instrumento_quiz            | vw_violino_instrumento_sons_variacoes | arquivo_audio        | Verificar se é denormalização intencional |
| instrumento_quiz            | instrumento_sons                      | arquivo_audio        | Verificar se é denormalização intencional |
| instrumento_sons            | vw_violino_instrumento_sons_variacoes | arquivo_audio        | Verificar se é denormalização intencional |
| instrumento_sons            | instrumento_sons_variacoes            | arquivo_audio        | Verificar se é denormalização intencional |
| instrumento_sons            | vw_violino_instrumento_sons           | arquivo_audio        | Verificar se é denormalização intencional |
| instrumento_sons_variacoes  | vw_violino_instrumento_sons_variacoes | arquivo_audio        | Verificar se é denormalização intencional |
| instrumento_sons_variacoes  | vw_violino_instrumento_sons           | arquivo_audio        | Verificar se é denormalização intencional |
| vw_violino_instrumento_sons | vw_violino_instrumento_sons_variacoes | arquivo_audio        | Verificar se é denormalização intencional |
| instrumento_performances    | vw_repertorio_stats                   | artista              | Verificar se é denormalização intencional |
| instrumento_performances    | repertorio_musical                    | artista              | Verificar se é denormalização intencional |
| repertorio_musical          | vw_repertorio_stats                   | artista              | Verificar se é denormalização intencional |
| instrumento_sons            | vw_violino_instrumento_sons           | artista_performer    | Verificar se é denormalização intencional |
| instrumento_sons            | instrumento_sons_variacoes            | artista_performer    | Verificar se é denormalização intencional |
| instrumento_sons            | vw_violino_instrumento_sons_variacoes | artista_performer    | Verificar se é denormalização intencional |
| instrumento_sons_variacoes  | vw_violino_instrumento_sons           | artista_performer    | Verificar se é denormalização intencional |
| instrumento_sons_variacoes  | vw_violino_instrumento_sons_variacoes | artista_performer    | Verificar se é denormalização intencional |
| vw_violino_instrumento_sons | vw_violino_instrumento_sons_variacoes | artista_performer    | Verificar se é denormalização intencional |
| achievements_educacionais   | turmas                                | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | alunos                                | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | professores_categorias                | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | instrumentos                          | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | logos                                 | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_movimentos_artisticos        | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | modulos                               | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_timeline                     | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_movimentos                   | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | vw_violino_instrumentos               | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | instrumento_midias                    | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | alpha_badges                          | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | admin_professores                     | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_contexto_cultural            | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_instrumentos_evolucao        | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | instrumento_quiz                      | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | materiais_apoio                       | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | repertorio_musical                    | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | admin_alunos                          | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_conceitos_teoricos           | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | view_placar_logos                     | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | professor_instrumentos                | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | alpha_metodologias                    | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_compositores                 | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | rubricas_avaliacao                    | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_eventos_timeline             | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_generos                      | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | vw_violino_palestra                   | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_periodos                     | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | alpha_competencias                    | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | professores_conteudos                 | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_quiz                         | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | desafios_alpha                        | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | admins                                | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | professores                           | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | historia_obras                        | ativo                | Verificar se é denormalização intencional |
| achievements_educacionais   | alpha_desafios                        | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | professores_conteudos                 | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | modulos                               | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | alunos                                | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | vw_violino_instrumentos               | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_movimentos_artisticos        | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_compositores                 | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_quiz                         | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | desafios_alpha                        | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | admins                                | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | alpha_desafios                        | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | rubricas_avaliacao                    | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_timeline                     | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | alpha_competencias                    | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | admin_professores                     | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_eventos_timeline             | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | repertorio_musical                    | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_conceitos_teoricos           | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | logos                                 | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_instrumentos_evolucao        | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | instrumento_midias                    | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_contexto_cultural            | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | professores_categorias                | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | professores                           | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | materiais_apoio                       | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | alpha_metodologias                    | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_obras                        | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | instrumento_quiz                      | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_generos                      | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | instrumentos                          | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | turmas                                | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | vw_violino_palestra                   | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | view_placar_logos                     | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_periodos                     | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | professor_instrumentos                | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | historia_movimentos                   | ativo                | Verificar se é denormalização intencional |
| admin_alunos                | alpha_badges                          | ativo                | Verificar se é denormalização intencional |



-- ========================================================================
-- 8️⃣ CAMPOS JSON E ESTRUTURADOS
-- ========================================================================

-- 8.1 Uso de JSONB (verificar se deveria ser normalizado)
SELECT 
    table_name,
    column_name,
    'Verificar se os dados JSON deveriam ser normalizados em tabelas separadas' as recomendacao
FROM information_schema.columns
WHERE table_schema = 'public'
    AND data_type IN ('json', 'jsonb')
ORDER BY table_name, column_name;

| table_name                      | column_name                | recomendacao                                                              |
| ------------------------------- | -------------------------- | ------------------------------------------------------------------------- |
| achievements_progress           | metadata                   | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| adaptacoes_espacos_alternativos | adaptacoes_realizadas      | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| adaptacoes_espacos_alternativos | contato_responsavel        | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| adaptacoes_espacos_alternativos | endereco_localizacao       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| adaptacoes_espacos_alternativos | recursos_disponiveis       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| admins                          | permissoes                 | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_aluno_desafios            | progresso_atual            | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_badges                    | criterio_desbloqueio       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_badges                    | recompensas                | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_badges                    | requisitos                 | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_desafios                  | criterios_avaliacao        | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_desafios                  | criterios_conclusao        | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_desafios                  | recursos_necessarios       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_niveis                    | beneficios_desbloqueados   | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_niveis                    | recompensa_desbloqueio     | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_projetos_coletivos        | evidencias                 | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_submissoes                | auto_avaliacao             | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_submissoes                | avaliacao_professor        | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| alpha_xp_historico              | acao_detalhes              | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| audit_activities                | details                    | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| audit_activities                | new_values                 | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| audit_activities                | old_values                 | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| aulas                           | detalhes_aula              | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| avaliacoes_rubricas             | notas                      | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| capacitacao_docente             | atividades_praticas        | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| capacitacao_docente             | avaliacoes_modulos         | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| capacitacao_docente             | conteudo_programatico      | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| capacitacao_docente             | criterios_certificacao     | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| comunicacao_engajamento         | conteudo_principal         | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| comunicacao_engajamento         | cronograma_execucao        | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| comunicacao_engajamento         | metricas_engajamento       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| comunicacao_engajamento         | resultados_mensuraveis     | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| documentos_institucionais       | campos_personalizaveis     | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| documentos_institucionais       | estrutura_documento        | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| experiencias_brasileiras        | contatos                   | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| experiencias_brasileiras        | impacto_social             | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| experiencias_brasileiras        | recursos_utilizados        | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| historia_compositores           | curiosidades               | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| historia_conceitos_teoricos     | exemplos_auditivos         | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| historia_conceitos_teoricos     | exercicios                 | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| historia_generos                | caracteristicas_musicais   | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| historia_movimentos             | caracteristicas            | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| historia_movimentos_artisticos  | caracteristicas            | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| historia_obras                  | estrutura_formal           | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| historia_periodos               | caracteristicas_principais | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| historia_playlists              | ordem_obras                | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| historia_quiz                   | opcoes                     | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| hook_cache                      | data                       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| instrumento_midias              | tags                       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| instrumento_quiz                | respostas_corretas         | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| instrumento_sons                | waveform_data              | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| instrumentos                    | anatomia_partes            | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| instrumentos                    | curiosidades               | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| lessons                         | audio_files                | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| lessons                         | pdf_materials              | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| migration_log                   | details                    | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| permission_templates            | permissions                | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| portfolio_evidencias            | autoavaliacao              | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| portfolio_evidencias            | metadata                   | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| proposta_curricular             | conteudos_essenciais       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| proposta_curricular             | progressao_curricular      | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| proposta_curricular             | projetos_integradores      | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| proposta_curricular             | sequencia_didatica         | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| qr_codes                        | metadata                   | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| qr_scans                        | location_data              | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| qr_scans                        | metadata                   | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| referenciais_internacionais     | avaliacao_metodos          | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| referenciais_internacionais     | contatos_institucionais    | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| referenciais_internacionais     | estrutura_curricular       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| rubricas_avaliacao              | criterios                  | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| rubricas_avaliacao              | niveis_desempenho          | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| sequencias_didaticas_expandidas | adaptacoes_niveis          | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| sequencias_didaticas_expandidas | avaliacao_formativa        | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| sequencias_didaticas_expandidas | avaliacao_somativa         | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| sequencias_didaticas_expandidas | feedback_professores       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| sequencias_didaticas_expandidas | sequencia_atividades       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| sistema_presto                  | configuracoes_interativas  | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| sistema_presto                  | conteudo_digital           | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| sistema_presto                  | metricas_engajamento       | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| sistema_presto                  | progresso_usuario          | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| turmas                          | horarios                   | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| user_notifications              | metadata                   | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| user_roles                      | metadata                   | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| user_roles                      | permissions                | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| view_admin_dashboard            | top_students               | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| view_aulas_aluno                | detalhes_aula              | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| vw_violino_instrumento_sons     | waveform_data              | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| vw_violino_instrumentos         | anatomia_partes            | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| vw_violino_instrumentos         | curiosidades               | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| vw_violino_palestra             | anatomia_partes            | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| vw_violino_palestra             | curiosidades               | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| vw_violino_palestra             | relacionados               | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| vw_violino_palestra             | sons_exemplos              | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |
| vw_violino_palestra             | sons_variacoes             | Verificar se os dados JSON deveriam ser normalizados em tabelas separadas |



-- 8.2 Arrays (verificar se deveria ser tabela relacionada)
SELECT 
    table_name,
    column_name,
    udt_name,
    'Considerar criar tabela intermediária para relacionamento many-to-many' as recomendacao
FROM information_schema.columns
WHERE table_schema = 'public'
    AND data_type = 'ARRAY'
ORDER BY table_name, column_name;

| table_name                      | column_name                  | udt_name | recomendacao                                                           |
| ------------------------------- | ---------------------------- | -------- | ---------------------------------------------------------------------- |
| adaptacoes_espacos_alternativos | desafios_especificos         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| adaptacoes_espacos_alternativos | documentacao_processo        | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| adaptacoes_espacos_alternativos | limitacoes_estruturais       | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| adaptacoes_espacos_alternativos | metodologias_adaptadas       | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| adaptacoes_espacos_alternativos | parcerias_estabelecidas      | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| adaptacoes_espacos_alternativos | solucoes_criativas           | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| admin_professores               | especialidades               | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_celebracoes               | parabens_enviados            | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_competencias              | pre_requisitos               | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_desafios                  | objetivos                    | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_metodologias              | instrumentos_principais      | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_metodologias              | limitacoes                   | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_metodologias              | pontos_fortes                | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_metodologias              | principios_fundamentais      | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_metodologias              | recursos_necessarios         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_niveis                    | requisitos_especiais         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_progresso_estudante       | badges_conquistados          | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_projetos_coletivos        | objetivos                    | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_projetos_coletivos        | participantes                | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| alpha_projetos_coletivos        | repertorio                   | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| autoavaliacoes                  | atividades_realizadas        | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| autoavaliacoes                  | desafios_futuros             | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| autoavaliacoes                  | metas_alcancadas             | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| capacitacao_docente             | competencias_desenvolvidas   | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| capacitacao_docente             | metodologias_abordadas       | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| capacitacao_docente             | projetos_realizados          | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| capacitacao_docente             | proximos_cursos_sugeridos    | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| capacitacao_docente             | recursos_materiais           | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| comunicacao_engajamento         | aprendizados_obtidos         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| comunicacao_engajamento         | canais_utilizados            | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| comunicacao_engajamento         | metodologias_promovidas      | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| comunicacao_engajamento         | parceiros_envolvidos         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| comunicacao_engajamento         | proximas_acoes               | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| comunicacao_engajamento         | recursos_necessarios         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| desafios_alpha                  | criterios_avaliacao          | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| desafios_alpha                  | exemplos_url                 | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| desafios_alpha                  | instrucoes                   | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| desafios_alpha                  | material_necessario          | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| documentos_institucionais       | criterios_validacao          | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| documentos_institucionais       | exemplos_preenchidos         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| documentos_institucionais       | metodologias_abordadas       | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| experiencias_brasileiras        | desafios_enfrentados         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| experiencias_brasileiras        | documentacao_midia           | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| experiencias_brasileiras        | metodologias_aplicadas       | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| experiencias_brasileiras        | solucoes_implementadas       | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_compositores           | instrumentos_tocados         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_compositores           | principais_obras             | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_compositores           | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_conceitos_teoricos     | diagramas_url                | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_conceitos_teoricos     | pre_requisitos               | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_conceitos_teoricos     | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_contexto_cultural      | imagens_url                  | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_generos                | compositores_principais      | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_generos                | generos_relacionados         | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_generos                | obras_representativas        | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_movimentos             | compositores                 | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_movimentos             | locais_principais            | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_movimentos             | obras_iconicas               | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_movimentos_artisticos  | compositores_representativos | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_movimentos_artisticos  | obras_importantes            | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_movimentos_artisticos  | periodos_relacionados        | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_movimentos_artisticos  | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_obras                  | instrumentacao               | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_obras                  | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_quiz                   | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| historia_timeline               | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| lessons                         | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| materiais_apoio                 | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| metodologias_ensino             | instrumentos_principais      | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| metodologias_ensino             | limitacoes                   | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| metodologias_ensino             | principios_fundamentais      | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| metodologias_ensino             | vantagens                    | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| permission_templates            | role_types                   | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| portfolios                      | objetivos                    | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| portfolios                      | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| professores                     | especialidades               | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| professores_conteudos           | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| proposta_curricular             | adaptacoes_inclusivas        | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| proposta_curricular             | competencias_bncc            | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| proposta_curricular             | instrumentos_avaliacao       | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| proposta_curricular             | metodologias_integradas      | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| proposta_curricular             | objetivos_aprendizagem       | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| proposta_curricular             | prerequisitos                | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| proposta_curricular             | recursos_necessarios         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| referenciais_internacionais     | links_recursos               | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| referenciais_internacionais     | metodologias_relacionadas    | _uuid    | Considerar criar tabela intermediária para relacionamento many-to-many |
| referenciais_internacionais     | principios_pedagogicos       | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| referenciais_internacionais     | referencias_bibliograficas   | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| repertorio_musical              | tags                         | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| sequencias_didaticas            | material_necessario          | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| sequencias_didaticas            | objetivos                    | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| sequencias_didaticas_expandidas | espacos_utilizados           | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| sequencias_didaticas_expandidas | extensoes_projetos           | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| sequencias_didaticas_expandidas | materiais_necessarios        | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| sequencias_didaticas_expandidas | objetivos_especificos        | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| sequencias_didaticas_expandidas | produtos_finais              | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| sequencias_didaticas_expandidas | referencias_apoio            | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| sequencias_didaticas_expandidas | tecnologias_integradas       | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| vw_metodologias_stats           | principios_fundamentais      | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |
| vw_metodologias_stats           | vantagens                    | _text    | Considerar criar tabela intermediária para relacionamento many-to-many |



-- ========================================================================
-- 9️⃣ ENUMS PROBLEMAS
-- ========================================================================

-- 9.1 ENUMs com poucos valores (poderia ser boolean)
SELECT 
    t.typname as enum_name,
    COUNT(e.enumlabel) as total_valores,
    string_agg(e.enumlabel, ', ') as valores,
    CASE 
        WHEN COUNT(e.enumlabel) = 2 THEN '💡 Considerar usar BOOLEAN'
        WHEN COUNT(e.enumlabel) <= 3 THEN '⚠️ Verificar se ENUM é necessário'
        ELSE '✅ ENUM apropriado'
    END as recomendacao
FROM pg_type t
JOIN pg_enum e ON t.oid = e.enumtypid
WHERE t.typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public')
GROUP BY t.typname
ORDER BY total_valores;

Success. No rows returned






-- 9.2 Valores TEXT em vez de ENUM (inconsistência possível)
SELECT 
    c.table_name,
    c.column_name,
    'Criar ENUM type para garantir consistência' as recomendacao
FROM information_schema.columns c
WHERE c.table_schema = 'public'
    AND c.column_name IN ('status', 'tipo', 'categoria', 'nivel', 'dificuldade')
    AND c.data_type IN ('character varying', 'text')
    AND c.udt_name NOT IN (
        SELECT typname FROM pg_type WHERE typtype = 'e'
    )
ORDER BY c.table_name, c.column_name;

| table_name                  | column_name | recomendacao                               |
| --------------------------- | ----------- | ------------------------------------------ |
| achievements_educacionais   | categoria   | Criar ENUM type para garantir consistência |
| admin_alunos                | nivel       | Criar ENUM type para garantir consistência |
| alpha_aluno_desafios        | status      | Criar ENUM type para garantir consistência |
| alpha_aula_progresso        | status      | Criar ENUM type para garantir consistência |
| alpha_badges                | categoria   | Criar ENUM type para garantir consistência |
| alpha_celebracoes           | tipo        | Criar ENUM type para garantir consistência |
| alpha_competencias          | categoria   | Criar ENUM type para garantir consistência |
| alpha_desafios              | categoria   | Criar ENUM type para garantir consistência |
| alpha_desafios              | tipo        | Criar ENUM type para garantir consistência |
| alpha_mentorias             | tipo        | Criar ENUM type para garantir consistência |
| alpha_projetos_coletivos    | status      | Criar ENUM type para garantir consistência |
| alpha_projetos_coletivos    | tipo        | Criar ENUM type para garantir consistência |
| alpha_submissoes            | status      | Criar ENUM type para garantir consistência |
| alunos                      | nivel       | Criar ENUM type para garantir consistência |
| aula_atividades             | tipo        | Criar ENUM type para garantir consistência |
| aula_checklist              | tipo        | Criar ENUM type para garantir consistência |
| aula_materiais              | tipo        | Criar ENUM type para garantir consistência |
| aula_registros              | tipo        | Criar ENUM type para garantir consistência |
| aula_status_log             | status      | Criar ENUM type para garantir consistência |
| aula_tags                   | tipo        | Criar ENUM type para garantir consistência |
| aulas                       | nivel       | Criar ENUM type para garantir consistência |
| aulas                       | status      | Criar ENUM type para garantir consistência |
| cessoes_instrumentos        | status      | Criar ENUM type para garantir consistência |
| desafios_alpha_respostas    | status      | Criar ENUM type para garantir consistência |
| forum_perguntas             | categoria   | Criar ENUM type para garantir consistência |
| forum_perguntas             | status      | Criar ENUM type para garantir consistência |
| historia_conceitos_teoricos | categoria   | Criar ENUM type para garantir consistência |
| historia_contexto_cultural  | tipo        | Criar ENUM type para garantir consistência |
| historia_eventos_timeline   | categoria   | Criar ENUM type para garantir consistência |
| historia_playlists          | tipo        | Criar ENUM type para garantir consistência |
| historia_quiz               | tipo        | Criar ENUM type para garantir consistência |
| instrumento_curiosidades    | categoria   | Criar ENUM type para garantir consistência |
| instrumento_midias          | categoria   | Criar ENUM type para garantir consistência |
| instrumento_midias          | nivel       | Criar ENUM type para garantir consistência |
| instrumento_midias          | tipo        | Criar ENUM type para garantir consistência |
| instrumento_quiz            | categoria   | Criar ENUM type para garantir consistência |
| instrumento_quiz            | dificuldade | Criar ENUM type para garantir consistência |
| instrumento_tecnicas        | nivel       | Criar ENUM type para garantir consistência |
| instrumentos                | categoria   | Criar ENUM type para garantir consistência |
| lessons                     | categoria   | Criar ENUM type para garantir consistência |
| manutencoes_instrumentos    | status      | Criar ENUM type para garantir consistência |
| materiais_apoio             | categoria   | Criar ENUM type para garantir consistência |
| materiais_apoio             | nivel       | Criar ENUM type para garantir consistência |
| materiais_apoio             | tipo        | Criar ENUM type para garantir consistência |
| matriculas                  | status      | Criar ENUM type para garantir consistência |
| migration_log               | status      | Criar ENUM type para garantir consistência |
| portfolios                  | status      | Criar ENUM type para garantir consistência |
| portfolios                  | tipo        | Criar ENUM type para garantir consistência |
| professores_conteudos       | categoria   | Criar ENUM type para garantir consistência |
| professores_conteudos       | tipo        | Criar ENUM type para garantir consistência |
| proposta_curricular         | status      | Criar ENUM type para garantir consistência |
| referenciais_internacionais | tipo        | Criar ENUM type para garantir consistência |
| repertorio_musical          | nivel       | Criar ENUM type para garantir consistência |
| rubricas_avaliacao          | tipo        | Criar ENUM type para garantir consistência |
| sistema_presto              | status      | Criar ENUM type para garantir consistência |
| turmas                      | nivel       | Criar ENUM type para garantir consistência |
| turmas                      | status      | Criar ENUM type para garantir consistência |
| usuarios                    | tipo        | Criar ENUM type para garantir consistência |
| view_attendance_analytics   | status      | Criar ENUM type para garantir consistência |
| view_aulas_admin            | nivel       | Criar ENUM type para garantir consistência |
| view_aulas_admin            | status      | Criar ENUM type para garantir consistência |
| view_aulas_aluno            | nivel       | Criar ENUM type para garantir consistência |
| view_aulas_aluno            | status      | Criar ENUM type para garantir consistência |
| view_aulas_professor        | status      | Criar ENUM type para garantir consistência |
| vw_forum_stats              | categoria   | Criar ENUM type para garantir consistência |
| vw_forum_stats              | status      | Criar ENUM type para garantir consistência |
| vw_repertorio_stats         | nivel       | Criar ENUM type para garantir consistência |
| vw_violino_instrumentos     | categoria   | Criar ENUM type para garantir consistência |
| vw_violino_palestra         | categoria   | Criar ENUM type para garantir consistência |
| vw_violino_palestra         | dificuldade | Criar ENUM type para garantir consistência |


-- ========================================================================
-- 🔟 RESUMO DE PROBLEMAS
-- ========================================================================

-- 10.1 Contagem de problemas por categoria
SELECT 
    'Tabelas sem PK' as problema,
    COUNT(*)::text as total
FROM information_schema.tables t
WHERE t.table_schema = 'public'
    AND t.table_type = 'BASE TABLE'
    AND t.table_name NOT IN (
        SELECT tc.table_name
        FROM information_schema.table_constraints tc
        WHERE tc.constraint_type = 'PRIMARY KEY'
    )

UNION ALL

SELECT 
    'Tabelas sem RLS',
    COUNT(*)::text
FROM pg_tables
WHERE schemaname = 'public'
    AND rowsecurity = false

UNION ALL

SELECT 
    'FK sem índice',
    COUNT(DISTINCT kcu.table_name || '.' || kcu.column_name)::text
FROM information_schema.key_column_usage kcu
JOIN information_schema.table_constraints tc 
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
    AND NOT EXISTS (
        SELECT 1
        FROM pg_indexes pi
        WHERE pi.tablename = kcu.table_name
            AND pi.indexdef LIKE '%' || kcu.column_name || '%'
    )

UNION ALL

SELECT 
    'Tabelas sem created_at',
    COUNT(*)::text
FROM information_schema.tables t
WHERE t.table_schema = 'public'
    AND t.table_type = 'BASE TABLE'
    AND t.table_name NOT IN (
        SELECT DISTINCT table_name
        FROM information_schema.columns
        WHERE column_name = 'created_at'
    );


| problema               | total |
| ---------------------- | ----- |
| Tabelas sem PK         | 0     |
| Tabelas sem RLS        | 37    |
| FK sem índice          | 56    |
| Tabelas sem created_at | 31    |