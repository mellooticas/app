-- =====================================================================
-- MIGRAÇÃO 04: CRIAR POLÍTICAS RLS PARA INSTRUMENTOS
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🔴 CRÍTICO
-- Descrição: Protege dados de instrumentos e relacionamentos
-- =====================================================================

BEGIN;

-- =====================================================================
-- INSTRUMENTOS
-- =====================================================================

-- Todos veem instrumentos ativos (catálogo público)
CREATE POLICY "instrumentos_ativos_publicos"
    ON instrumentos
    FOR SELECT
    USING (ativo = true OR ativo IS NULL);

-- Apenas staff gerencia instrumentos
CREATE POLICY "staff_gerencia_instrumentos"
    ON instrumentos
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- INSTRUMENTOS_ALUNOS
-- =====================================================================

-- Aluno vê seus próprios instrumentos
CREATE POLICY "aluno_ve_proprios_instrumentos"
    ON instrumentos_alunos
    FOR SELECT
    USING (aluno_id = auth.uid());

-- Professor vê instrumentos de seus alunos
CREATE POLICY "professor_ve_instrumentos_alunos"
    ON instrumentos_alunos
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM turmas t
            JOIN matriculas m ON m.turma_id = t.id
            WHERE m.aluno_id = instrumentos_alunos.aluno_id
                AND t.professor_id = auth.uid()
        )
    );

-- Professor pode atribuir instrumentos
CREATE POLICY "professor_atribui_instrumentos"
    ON instrumentos_alunos
    FOR INSERT
    WITH CHECK (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- Professor pode atualizar instrumentos dos alunos
CREATE POLICY "professor_atualiza_instrumentos_alunos"
    ON instrumentos_alunos
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM turmas t
            JOIN matriculas m ON m.turma_id = t.id
            WHERE m.aluno_id = instrumentos_alunos.aluno_id
                AND t.professor_id = auth.uid()
        ) OR is_admin(auth.uid())
    );

-- Admin gerencia todos os relacionamentos
CREATE POLICY "admin_gerencia_instrumentos_alunos"
    ON instrumentos_alunos
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- PROFESSOR_INSTRUMENTOS
-- =====================================================================

-- Professor vê seus próprios instrumentos
CREATE POLICY "professor_ve_proprios_instrumentos"
    ON professor_instrumentos
    FOR SELECT
    USING (professor_id = auth.uid());

-- Todos podem ver quais instrumentos os professores ensinam (público)
CREATE POLICY "instrumentos_professor_publicos"
    ON professor_instrumentos
    FOR SELECT
    USING (true);

-- Professor gerencia seus instrumentos
CREATE POLICY "professor_gerencia_instrumentos"
    ON professor_instrumentos
    FOR ALL
    USING (professor_id = auth.uid());

-- Admin gerencia todos
CREATE POLICY "admin_gerencia_professor_instrumentos"
    ON professor_instrumentos
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- VERIFICAÇÃO
-- =====================================================================

DO $$
DECLARE
    total_policies INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_policies
    FROM pg_policies
    WHERE schemaname = 'public'
        AND tablename IN (
            'instrumentos',
            'instrumentos_alunos',
            'professor_instrumentos'
        );
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'MIGRAÇÃO 04 CONCLUÍDA';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'Políticas RLS criadas: %', total_policies;
    RAISE NOTICE 'Tabelas protegidas: 3';
    RAISE NOTICE '===================================';
    RAISE NOTICE '✅ Instrumentos agora estão seguros!';
    RAISE NOTICE '===================================';
END $$;

COMMIT;

-- =====================================================================
-- TESTES SUGERIDOS
-- =====================================================================
--
-- 1. Como aluno - ver instrumentos disponíveis:
--    SELECT * FROM instrumentos WHERE ativo = true;
--
-- 2. Como aluno - ver meus instrumentos:
--    SELECT * FROM instrumentos_alunos WHERE aluno_id = auth.uid();
--
-- 3. Como professor - ver instrumentos de alunos da turma:
--    SELECT ia.* FROM instrumentos_alunos ia
--    JOIN matriculas m ON m.aluno_id = ia.aluno_id
--    JOIN turmas t ON t.id = m.turma_id
--    WHERE t.professor_id = auth.uid();
--
-- 4. Ver instrumentos que um professor ensina:
--    SELECT * FROM professor_instrumentos WHERE professor_id = <id>;
--
-- =====================================================================
