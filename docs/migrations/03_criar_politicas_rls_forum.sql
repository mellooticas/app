-- =====================================================================
-- MIGRAÇÃO 03: CRIAR POLÍTICAS RLS PARA FÓRUM
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🔴 CRÍTICO
-- Descrição: Protege dados do fórum e respostas de desafios
-- =====================================================================

BEGIN;

-- =====================================================================
-- FORUM_PERGUNTAS
-- =====================================================================

-- Todos podem ver perguntas ativas
CREATE POLICY "perguntas_publicas"
    ON forum_perguntas
    FOR SELECT
    USING (status = 'ativa' OR status = 'respondida' OR status IS NULL);

-- Aluno cria suas perguntas
CREATE POLICY "aluno_cria_pergunta"
    ON forum_perguntas
    FOR INSERT
    WITH CHECK (aluno_id = auth.uid());

-- Autor pode editar sua pergunta
CREATE POLICY "autor_edita_pergunta"
    ON forum_perguntas
    FOR UPDATE
    USING (aluno_id = auth.uid());

-- Autor pode deletar sua pergunta
CREATE POLICY "autor_deleta_pergunta"
    ON forum_perguntas
    FOR DELETE
    USING (aluno_id = auth.uid());

-- Professor e admin podem gerenciar perguntas
CREATE POLICY "staff_gerencia_perguntas"
    ON forum_perguntas
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- FORUM_RESPOSTAS
-- =====================================================================

-- Todos podem ver respostas de perguntas ativas
CREATE POLICY "respostas_publicas"
    ON forum_respostas
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM forum_perguntas fp
            WHERE fp.id = forum_respostas.pergunta_id
                AND (fp.status = 'ativa' OR fp.status = 'respondida')
        )
    );

-- Usuário autenticado pode responder
CREATE POLICY "usuario_cria_resposta"
    ON forum_respostas
    FOR INSERT
    WITH CHECK (resposta_de_id = auth.uid());

-- Autor pode editar sua resposta
CREATE POLICY "autor_edita_resposta"
    ON forum_respostas
    FOR UPDATE
    USING (resposta_de_id = auth.uid());

-- Autor pode deletar sua resposta
CREATE POLICY "autor_deleta_resposta"
    ON forum_respostas
    FOR DELETE
    USING (resposta_de_id = auth.uid());

-- Staff pode gerenciar respostas
CREATE POLICY "staff_gerencia_respostas"
    ON forum_respostas
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- FORUM_LIKES
-- =====================================================================

-- Usuário vê todos os likes
CREATE POLICY "likes_publicos"
    ON forum_likes
    FOR SELECT
    USING (true);

-- Usuário pode dar like
CREATE POLICY "usuario_da_like"
    ON forum_likes
    FOR INSERT
    WITH CHECK (user_id = auth.uid());

-- Usuário pode remover seu like
CREATE POLICY "usuario_remove_like"
    ON forum_likes
    FOR DELETE
    USING (user_id = auth.uid());

-- =====================================================================
-- DESAFIOS_ALPHA_RESPOSTAS
-- =====================================================================

-- Aluno vê suas próprias respostas
CREATE POLICY "aluno_ve_proprias_respostas_desafio"
    ON desafios_alpha_respostas
    FOR SELECT
    USING (aluno_id = auth.uid());

-- Aluno envia resposta
CREATE POLICY "aluno_envia_resposta_desafio"
    ON desafios_alpha_respostas
    FOR INSERT
    WITH CHECK (aluno_id = auth.uid());

-- Aluno pode atualizar enquanto pendente
CREATE POLICY "aluno_atualiza_resposta_pendente"
    ON desafios_alpha_respostas
    FOR UPDATE
    USING (
        aluno_id = auth.uid() AND
        (status = 'pendente' OR status IS NULL)
    );

-- Professor vê respostas de seus alunos
CREATE POLICY "professor_ve_respostas_alunos"
    ON desafios_alpha_respostas
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM turmas t
            JOIN matriculas m ON m.turma_id = t.id
            WHERE m.aluno_id = desafios_alpha_respostas.aluno_id
                AND t.professor_id = auth.uid()
        )
    );

-- Professor pode avaliar respostas
CREATE POLICY "professor_avalia_respostas"
    ON desafios_alpha_respostas
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM turmas t
            JOIN matriculas m ON m.turma_id = t.id
            WHERE m.aluno_id = desafios_alpha_respostas.aluno_id
                AND t.professor_id = auth.uid()
        )
    );

-- Admin gerencia todas as respostas
CREATE POLICY "admin_gerencia_respostas_desafios"
    ON desafios_alpha_respostas
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
            'forum_perguntas',
            'forum_respostas',
            'forum_likes',
            'desafios_alpha_respostas'
        );
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'MIGRAÇÃO 03 CONCLUÍDA';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'Políticas RLS criadas: %', total_policies;
    RAISE NOTICE 'Tabelas protegidas: 4';
    RAISE NOTICE '===================================';
    RAISE NOTICE '✅ Fórum agora está seguro!';
    RAISE NOTICE '===================================';
END $$;

COMMIT;

-- =====================================================================
-- TESTES SUGERIDOS
-- =====================================================================
--
-- 1. Como aluno - criar pergunta:
--    INSERT INTO forum_perguntas (aluno_id, titulo, descricao)
--    VALUES (auth.uid(), 'Teste', 'Descrição');
--
-- 2. Como aluno - ver apenas suas perguntas:
--    SELECT * FROM forum_perguntas WHERE aluno_id = auth.uid();
--
-- 3. Todos - ver perguntas ativas:
--    SELECT * FROM forum_perguntas WHERE status = 'ativa';
--
-- 4. Aluno - dar like:
--    INSERT INTO forum_likes (user_id, resposta_id)
--    VALUES (auth.uid(), <id_resposta>);
--
-- =====================================================================
