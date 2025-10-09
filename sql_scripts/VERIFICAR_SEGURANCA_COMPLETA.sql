-- VERIFICAÇÃO COMPLETA DAS REGRAS DE SEGURANÇA DO BANCO
-- Execute este script para validar todas as configurações

-- ============================================
-- 1. VERIFICAR RLS HABILITADO NAS TABELAS
-- ============================================
SELECT 
    schemaname,
    tablename,
    CASE 
        WHEN rowsecurity THEN '✅ RLS Habilitado'
        ELSE '❌ RLS Desabilitado'
    END as status_rls
FROM pg_tables
WHERE schemaname = 'public'
AND tablename IN (
    'profiles',
    'achievements', 
    'user_achievements',
    'portfolios',
    'portfolio_items',
    'lessons',
    'lesson_progress',
    'instruments',
    'user_instruments',
    'turmas',
    'turma_students'
)
ORDER BY tablename;


| schemaname | tablename         | status_rls       |
| ---------- | ----------------- | ---------------- |
| public     | achievements      | ✅ RLS Habilitado |
| public     | lessons           | ✅ RLS Habilitado |
| public     | portfolios        | ✅ RLS Habilitado |
| public     | profiles          | ✅ RLS Habilitado |
| public     | turmas            | ✅ RLS Habilitado |
| public     | user_achievements | ✅ RLS Habilitado |

-- ============================================
-- 2. VERIFICAR POLÍTICAS RLS DA TABELA PROFILES
-- ============================================
SELECT 
    policyname as "Nome da Política",
    cmd as "Operação",
    CASE 
        WHEN roles = '{authenticated}' THEN '✅ authenticated'
        WHEN roles = '{public}' THEN '⚠️ public'
        ELSE roles::text
    END as "Roles",
    qual as "Condição USING",
    with_check as "Condição WITH CHECK"
FROM pg_policies 
WHERE schemaname = 'public' 
AND tablename = 'profiles'
ORDER BY cmd, policyname;


| Nome da Política   | Operação | Roles           | Condição USING    | Condição WITH CHECK |
| ------------------ | -------- | --------------- | ----------------- | ------------------- |
| insert_own_profile | INSERT   | ✅ authenticated | null              | (auth.uid() = id)   |
| select_own_profile | SELECT   | ✅ authenticated | (auth.uid() = id) | null                |
| update_own_profile | UPDATE   | ✅ authenticated | (auth.uid() = id) | (auth.uid() = id)   |

-- ============================================
-- 3. VERIFICAR POLÍTICAS DE OUTRAS TABELAS CRÍTICAS
-- ============================================
SELECT 
    tablename as "Tabela",
    COUNT(*) as "Total Políticas",
    string_agg(DISTINCT cmd::text, ', ') as "Operações Protegidas"
FROM pg_policies 
WHERE schemaname = 'public'
AND tablename IN (
    'achievements',
    'user_achievements', 
    'portfolios',
    'portfolio_items',
    'lessons',
    'lesson_progress'
)
GROUP BY tablename
ORDER BY tablename;

| Tabela            | Total Políticas | Operações Protegidas        |
| ----------------- | --------------- | --------------------------- |
| achievements      | 2               | SELECT                      |
| lessons           | 4               | ALL, SELECT                 |
| portfolios        | 6               | ALL, INSERT, SELECT, UPDATE |
| user_achievements | 4               | INSERT, SELECT              |

-- ============================================
-- 4. VERIFICAR FUNÇÕES DE SEGURANÇA
-- ============================================
SELECT 
    routine_name as "Função",
    routine_type as "Tipo",
    security_type as "Tipo de Segurança"
FROM information_schema.routines
WHERE routine_schema = 'public'
AND routine_name LIKE '%auth%'
OR routine_name LIKE '%security%'
ORDER BY routine_name;

| Função              | Tipo     | Tipo de Segurança |
| ------------------- | -------- | ----------------- |
| row_security_active | FUNCTION | INVOKER           |
| row_security_active | FUNCTION | INVOKER           |

-- ============================================
-- 5. VERIFICAR TRIGGERS AUTOMÁTICOS
-- ============================================
SELECT 
    trigger_name as "Trigger",
    event_manipulation as "Evento",
    event_object_table as "Tabela",
    action_statement as "Ação"
FROM information_schema.triggers
WHERE trigger_schema = 'public'
AND event_object_table IN ('profiles', 'user_achievements', 'portfolios')
ORDER BY event_object_table, trigger_name;

| Trigger                      | Evento | Tabela     | Ação                                             |
| ---------------------------- | ------ | ---------- | ------------------------------------------------ |
| trigger_atualizar_portfolios | UPDATE | portfolios | EXECUTE FUNCTION atualizar_timestamp_portfolio() |
| trigger_inserir_tipo         | INSERT | profiles   | EXECUTE FUNCTION inserir_em_tabela_especifica()  |
| trigger_update_last_active   | UPDATE | profiles   | EXECUTE FUNCTION update_last_active()            |

-- ============================================
-- 6. TESTAR ACESSO PRÓPRIO PERFIL (como usuário autenticado)
-- ============================================
-- Este teste só funciona se você estiver autenticado
SELECT 
    'Teste de Segurança' as teste,
    current_setting('request.jwt.claims', true)::json->>'sub' as meu_user_id,
    (
        SELECT COUNT(*) 
        FROM profiles 
        WHERE id = auth.uid()
    ) as consigo_ler_meu_perfil,
    (
        SELECT COUNT(*) 
        FROM profiles 
        WHERE id != auth.uid()
    ) as consigo_ler_outros_perfis;


    | teste              | meu_user_id | consigo_ler_meu_perfil | consigo_ler_outros_perfis |
| ------------------ | ----------- | ---------------------- | ------------------------- |
| Teste de Segurança | null        | 0                      | 0                         |

-- ============================================
-- 7. VERIFICAR POLÍTICAS RECOMENDADAS
-- ============================================

-- Verificar se profiles tem as 3 políticas essenciais
WITH expected_policies AS (
    SELECT unnest(ARRAY['select_own_profile', 'update_own_profile', 'insert_own_profile']) as policy_name
),
actual_policies AS (
    SELECT policyname 
    FROM pg_policies 
    WHERE tablename = 'profiles'
)
SELECT 
    e.policy_name as "Política Esperada",
    CASE 
        WHEN a.policyname IS NOT NULL THEN '✅ Existe'
        ELSE '❌ Faltando'
    END as status
FROM expected_policies e
LEFT JOIN actual_policies a ON e.policy_name = a.policyname;


| Política Esperada  | status   |
| ------------------ | -------- |
| select_own_profile | ✅ Existe |
| update_own_profile | ✅ Existe |
| insert_own_profile | ✅ Existe |

-- ============================================
-- 8. VERIFICAR ÍNDICES DE PERFORMANCE
-- ============================================
SELECT 
    tablename as "Tabela",
    indexname as "Índice",
    indexdef as "Definição"
FROM pg_indexes
WHERE schemaname = 'public'
AND tablename = 'profiles'
AND indexdef LIKE '%id%'
ORDER BY tablename, indexname;


| Tabela   | Índice                    | Definição                                                                                 |
| -------- | ------------------------- | ----------------------------------------------------------------------------------------- |
| profiles | idx_profiles_city_state   | CREATE INDEX idx_profiles_city_state ON public.profiles USING btree (city, state)         |
| profiles | idx_profiles_instrument   | CREATE INDEX idx_profiles_instrument ON public.profiles USING btree (instrument)          |
| profiles | idx_profiles_last_active  | CREATE INDEX idx_profiles_last_active ON public.profiles USING btree (last_active DESC)   |
| profiles | idx_profiles_total_points | CREATE INDEX idx_profiles_total_points ON public.profiles USING btree (total_points DESC) |
| profiles | idx_profiles_user_id      | CREATE INDEX idx_profiles_user_id ON public.profiles USING btree (id)                     |
| profiles | idx_profiles_user_level   | CREATE INDEX idx_profiles_user_level ON public.profiles USING btree (user_level)          |
| profiles | profiles_pkey             | CREATE UNIQUE INDEX profiles_pkey ON public.profiles USING btree (id)                     |

-- ============================================
-- 9. VERIFICAR FOREIGN KEYS
-- ============================================
SELECT
    tc.table_name as "Tabela",
    kcu.column_name as "Coluna",
    ccu.table_name AS "Referencia Tabela",
    ccu.column_name AS "Referencia Coluna"
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
    AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
AND tc.table_schema = 'public'
AND tc.table_name IN ('profiles', 'user_achievements', 'portfolios', 'lesson_progress')
ORDER BY tc.table_name, kcu.column_name;


| Tabela            | Coluna         | Referencia Tabela  | Referencia Coluna |
| ----------------- | -------------- | ------------------ | ----------------- |
| portfolios        | competencia_id | alpha_competencias | id                |
| portfolios        | metodologia_id | alpha_metodologias | id                |
| user_achievements | achievement_id | achievements       | id                |

-- ============================================
-- 10. RESUMO FINAL
-- ============================================
SELECT 
    '🎯 RESUMO DE SEGURANÇA' as titulo,
    (SELECT COUNT(*) FROM pg_tables WHERE schemaname = 'public' AND rowsecurity = true) as tabelas_com_rls,
    (SELECT COUNT(*) FROM pg_policies WHERE schemaname = 'public') as total_politicas,
    (SELECT COUNT(*) FROM pg_policies WHERE schemaname = 'public' AND tablename = 'profiles') as politicas_profiles,
    (SELECT COUNT(*) FROM information_schema.triggers WHERE trigger_schema = 'public') as total_triggers;


| titulo                 | tabelas_com_rls | total_politicas | politicas_profiles | total_triggers |
| ---------------------- | --------------- | --------------- | ------------------ | -------------- |
| 🎯 RESUMO DE SEGURANÇA | 71              | 152             | 3                  | 26             |