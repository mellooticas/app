-- =====================================================================
-- MIGRAÇÃO 01: HABILITAR RLS NAS TABELAS CRÍTICAS
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🔴 CRÍTICO
-- Descrição: Habilita Row Level Security nas 37 tabelas que estão sem proteção
-- =====================================================================

-- Início da transação
BEGIN;

-- =====================================================================
-- GAMIFICAÇÃO E PROGRESSO DO ALUNO (13 tabelas)
-- =====================================================================

ALTER TABLE alpha_aluno_badges ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_aluno_desafios ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_aula_progresso ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_progresso_estudante ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_ranking ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_xp_historico ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_celebracoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_estudante_badges ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_mentorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_niveis ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_projetos_coletivos ENABLE ROW LEVEL SECURITY;
ALTER TABLE achievements_educacionais ENABLE ROW LEVEL SECURITY;
ALTER TABLE desafios_alpha ENABLE ROW LEVEL SECURITY;

-- =====================================================================
-- AVALIAÇÕES E PRESENÇAS (2 tabelas)
-- =====================================================================

ALTER TABLE aula_avaliacoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE aula_presencas ENABLE ROW LEVEL SECURITY;

-- =====================================================================
-- FÓRUM (4 tabelas)
-- =====================================================================

ALTER TABLE forum_perguntas ENABLE ROW LEVEL SECURITY;
ALTER TABLE forum_respostas ENABLE ROW LEVEL SECURITY;
ALTER TABLE forum_likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE desafios_alpha_respostas ENABLE ROW LEVEL SECURITY;

-- =====================================================================
-- INSTRUMENTOS (3 tabelas)
-- =====================================================================

ALTER TABLE instrumentos ENABLE ROW LEVEL SECURITY;
ALTER TABLE instrumentos_alunos ENABLE ROW LEVEL SECURITY;
ALTER TABLE professor_instrumentos ENABLE ROW LEVEL SECURITY;

-- =====================================================================
-- CONTEÚDO E MATERIAIS (7 tabelas)
-- =====================================================================

ALTER TABLE materiais_apoio ENABLE ROW LEVEL SECURITY;
ALTER TABLE metodologias_ensino ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_timeline ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_movimentos_artisticos ENABLE ROW LEVEL SECURITY;
ALTER TABLE documentos_institucionais ENABLE ROW LEVEL SECURITY;
ALTER TABLE experiencias_brasileiras ENABLE ROW LEVEL SECURITY;
ALTER TABLE referenciais_internacionais ENABLE ROW LEVEL SECURITY;

-- =====================================================================
-- INSTITUCIONAIS E GESTÃO (8 tabelas)
-- =====================================================================

ALTER TABLE proposta_curricular ENABLE ROW LEVEL SECURITY;
ALTER TABLE sequencias_didaticas ENABLE ROW LEVEL SECURITY;
ALTER TABLE sequencias_didaticas_expandidas ENABLE ROW LEVEL SECURITY;
ALTER TABLE sistema_presto ENABLE ROW LEVEL SECURITY;
ALTER TABLE capacitacao_docente ENABLE ROW LEVEL SECURITY;
ALTER TABLE comunicacao_engajamento ENABLE ROW LEVEL SECURITY;
ALTER TABLE adaptacoes_espacos_alternativos ENABLE ROW LEVEL SECURITY;
ALTER TABLE repertorio_musical ENABLE ROW LEVEL SECURITY;

-- =====================================================================
-- VERIFICAÇÃO
-- =====================================================================

-- Verifica quantas tabelas agora têm RLS habilitado
DO $$
DECLARE
    tabelas_sem_rls INTEGER;
    total_tabelas INTEGER;
BEGIN
    SELECT COUNT(*) INTO tabelas_sem_rls
    FROM pg_tables
    WHERE schemaname = 'public'
        AND rowsecurity = false
        AND tablename NOT LIKE 'pg_%';
    
    SELECT COUNT(*) INTO total_tabelas
    FROM pg_tables
    WHERE schemaname = 'public'
        AND tablename NOT LIKE 'pg_%';
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'RESULTADO DA MIGRAÇÃO 01';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'Total de tabelas: %', total_tabelas;
    RAISE NOTICE 'Tabelas sem RLS: %', tabelas_sem_rls;
    RAISE NOTICE 'Tabelas com RLS: %', (total_tabelas - tabelas_sem_rls);
    RAISE NOTICE '===================================';
    
    IF tabelas_sem_rls = 0 THEN
        RAISE NOTICE '✅ SUCESSO: Todas as tabelas agora têm RLS habilitado!';
    ELSE
        RAISE WARNING '⚠️ ATENÇÃO: Ainda existem % tabelas sem RLS', tabelas_sem_rls;
    END IF;
END $$;

-- Finaliza a transação
COMMIT;

-- =====================================================================
-- NOTAS IMPORTANTES
-- =====================================================================
-- 
-- 1. RLS HABILITADO mas SEM POLÍTICAS = ACESSO BLOQUEADO
--    Após executar esta migração, é ESSENCIAL executar as próximas
--    migrações (02-05) para criar as políticas de acesso.
--
-- 2. TESTE EM DESENVOLVIMENTO PRIMEIRO
--    Execute esta migração em dev/staging antes de produção.
--
-- 3. IMPACTO NA APLICAÇÃO
--    Queries que antes funcionavam podem começar a retornar vazio.
--    Execute as migrações de políticas imediatamente após esta.
--
-- 4. ROLLBACK
--    Para reverter, execute: 01_habilitar_rls_tabelas_criticas_rollback.sql
--
-- =====================================================================
