-- =====================================================================
-- MIGRAÇÃO 02: CRIAR POLÍTICAS RLS PARA SISTEMA DE GAMIFICAÇÃO
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🔴 CRÍTICO
-- Descrição: Cria políticas de acesso para as tabelas do sistema Alpha
-- =====================================================================

BEGIN;

-- =====================================================================
-- HELPER FUNCTIONS (se não existirem)
-- =====================================================================

-- Verifica se usuário é admin
CREATE OR REPLACE FUNCTION is_admin(user_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1 FROM admins
        WHERE id = user_id AND ativo = true
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Verifica se usuário é professor
CREATE OR REPLACE FUNCTION is_professor(user_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1 FROM professores
        WHERE id = user_id AND ativo = true
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =====================================================================
-- ALPHA_ALUNO_BADGES
-- =====================================================================

-- Aluno vê suas próprias badges
CREATE POLICY "aluno_ve_proprias_badges"
    ON alpha_aluno_badges
    FOR SELECT
    USING (aluno_id = auth.uid());

-- Aluno pode conquistar badges (INSERT automático pelo sistema)
CREATE POLICY "sistema_concede_badges"
    ON alpha_aluno_badges
    FOR INSERT
    WITH CHECK (true);

-- Admin vê todas as badges
CREATE POLICY "admin_ve_todas_badges"
    ON alpha_aluno_badges
    FOR ALL
    USING (is_admin(auth.uid()));

-- Professor vê badges de seus alunos
CREATE POLICY "professor_ve_badges_alunos"
    ON alpha_aluno_badges
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM turmas t
            JOIN matriculas m ON m.turma_id = t.id
            WHERE m.aluno_id = alpha_aluno_badges.aluno_id
                AND t.professor_id = auth.uid()
        )
    );

-- =====================================================================
-- ALPHA_ALUNO_DESAFIOS
-- =====================================================================

CREATE POLICY "aluno_ve_proprios_desafios"
    ON alpha_aluno_desafios
    FOR SELECT
    USING (aluno_id = auth.uid());

CREATE POLICY "aluno_aceita_desafios"
    ON alpha_aluno_desafios
    FOR INSERT
    WITH CHECK (aluno_id = auth.uid());

CREATE POLICY "aluno_atualiza_proprios_desafios"
    ON alpha_aluno_desafios
    FOR UPDATE
    USING (aluno_id = auth.uid());

CREATE POLICY "admin_gerencia_desafios_alunos"
    ON alpha_aluno_desafios
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- ALPHA_AULA_PROGRESSO
-- =====================================================================

CREATE POLICY "aluno_ve_proprio_progresso_aula"
    ON alpha_aula_progresso
    FOR SELECT
    USING (aluno_id = auth.uid());

CREATE POLICY "sistema_registra_progresso"
    ON alpha_aula_progresso
    FOR INSERT
    WITH CHECK (aluno_id = auth.uid());

CREATE POLICY "aluno_atualiza_proprio_progresso"
    ON alpha_aula_progresso
    FOR UPDATE
    USING (aluno_id = auth.uid());

CREATE POLICY "professor_ve_progresso_alunos"
    ON alpha_aula_progresso
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM aulas a
            WHERE a.id = alpha_aula_progresso.aula_id
                AND a.responsavel_id = auth.uid()
        )
    );

-- =====================================================================
-- ALPHA_PROGRESSO_ESTUDANTE
-- =====================================================================

CREATE POLICY "estudante_ve_proprio_progresso"
    ON alpha_progresso_estudante
    FOR SELECT
    USING (estudante_id = auth.uid());

CREATE POLICY "sistema_atualiza_progresso_estudante"
    ON alpha_progresso_estudante
    FOR ALL
    USING (estudante_id = auth.uid());

CREATE POLICY "admin_ve_todo_progresso"
    ON alpha_progresso_estudante
    FOR SELECT
    USING (is_admin(auth.uid()));

-- =====================================================================
-- ALPHA_RANKING
-- =====================================================================

-- Ranking é visível para todos (gamificação pública)
CREATE POLICY "ranking_publico"
    ON alpha_ranking
    FOR SELECT
    USING (true);

-- Apenas sistema atualiza ranking
CREATE POLICY "sistema_atualiza_ranking"
    ON alpha_ranking
    FOR INSERT
    WITH CHECK (estudante_id = auth.uid());

CREATE POLICY "sistema_modifica_ranking"
    ON alpha_ranking
    FOR UPDATE
    USING (true);

-- Admin pode gerenciar ranking
CREATE POLICY "admin_gerencia_ranking"
    ON alpha_ranking
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- ALPHA_XP_HISTORICO
-- =====================================================================

CREATE POLICY "estudante_ve_proprio_xp"
    ON alpha_xp_historico
    FOR SELECT
    USING (estudante_id = auth.uid());

CREATE POLICY "sistema_registra_xp"
    ON alpha_xp_historico
    FOR INSERT
    WITH CHECK (estudante_id = auth.uid());

CREATE POLICY "admin_ve_todo_historico_xp"
    ON alpha_xp_historico
    FOR SELECT
    USING (is_admin(auth.uid()));

-- =====================================================================
-- ALPHA_CELEBRACOES
-- =====================================================================

-- Estudante vê suas celebrações
CREATE POLICY "estudante_ve_proprias_celebracoes"
    ON alpha_celebracoes
    FOR SELECT
    USING (estudante_id = auth.uid());

-- Sistema cria celebrações
CREATE POLICY "sistema_cria_celebracoes"
    ON alpha_celebracoes
    FOR INSERT
    WITH CHECK (true);

-- =====================================================================
-- ALPHA_ESTUDANTE_BADGES
-- =====================================================================

CREATE POLICY "estudante_ve_proprias_badges"
    ON alpha_estudante_badges
    FOR SELECT
    USING (estudante_id = auth.uid());

CREATE POLICY "sistema_concede_badges_estudante"
    ON alpha_estudante_badges
    FOR INSERT
    WITH CHECK (true);

CREATE POLICY "admin_gerencia_badges_estudante"
    ON alpha_estudante_badges
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- ALPHA_MENTORIAS
-- =====================================================================

-- Mentor ou mentorado podem ver a mentoria
CREATE POLICY "participantes_veem_mentoria"
    ON alpha_mentorias
    FOR SELECT
    USING (
        mentor_id = auth.uid() OR
        mentorado_id = auth.uid()
    );

-- Professores podem criar mentorias
CREATE POLICY "professor_cria_mentorias"
    ON alpha_mentorias
    FOR INSERT
    WITH CHECK (is_professor(auth.uid()));

-- Mentor pode atualizar feedback
CREATE POLICY "mentor_atualiza_mentoria"
    ON alpha_mentorias
    FOR UPDATE
    USING (mentor_id = auth.uid());

-- Admin gerencia mentorias
CREATE POLICY "admin_gerencia_mentorias"
    ON alpha_mentorias
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- ALPHA_NIVEIS
-- =====================================================================

-- Níveis são públicos (leitura)
CREATE POLICY "niveis_publicos"
    ON alpha_niveis
    FOR SELECT
    USING (true);

-- Apenas admin gerencia níveis
CREATE POLICY "admin_gerencia_niveis"
    ON alpha_niveis
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- ALPHA_PROJETOS_COLETIVOS
-- =====================================================================

-- Participantes veem o projeto
CREATE POLICY "participantes_veem_projeto"
    ON alpha_projetos_coletivos
    FOR SELECT
    USING (
        criador_id = auth.uid() OR
        auth.uid() = ANY(participantes)
    );

-- Criador gerencia projeto
CREATE POLICY "criador_gerencia_projeto"
    ON alpha_projetos_coletivos
    FOR ALL
    USING (criador_id = auth.uid());

-- Professor pode criar projetos para turma
CREATE POLICY "professor_cria_projetos"
    ON alpha_projetos_coletivos
    FOR INSERT
    WITH CHECK (is_professor(auth.uid()));

-- Admin gerencia projetos
CREATE POLICY "admin_gerencia_projetos"
    ON alpha_projetos_coletivos
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- ACHIEVEMENTS_EDUCACIONAIS
-- =====================================================================

-- Conquistas são públicas
CREATE POLICY "achievements_publicos"
    ON achievements_educacionais
    FOR SELECT
    USING (ativo = true);

-- Apenas admin gerencia achievements
CREATE POLICY "admin_gerencia_achievements"
    ON achievements_educacionais
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- DESAFIOS_ALPHA
-- =====================================================================

-- Desafios ativos são públicos
CREATE POLICY "desafios_publicos"
    ON desafios_alpha
    FOR SELECT
    USING (ativo = true OR ativo IS NULL);

-- Professor e admin gerenciam desafios
CREATE POLICY "staff_gerencia_desafios"
    ON desafios_alpha
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

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
            'alpha_aluno_badges',
            'alpha_aluno_desafios',
            'alpha_aula_progresso',
            'alpha_progresso_estudante',
            'alpha_ranking',
            'alpha_xp_historico',
            'alpha_celebracoes',
            'alpha_estudante_badges',
            'alpha_mentorias',
            'alpha_niveis',
            'alpha_projetos_coletivos',
            'achievements_educacionais',
            'desafios_alpha'
        );
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'MIGRAÇÃO 02 CONCLUÍDA';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'Políticas RLS criadas: %', total_policies;
    RAISE NOTICE 'Tabelas protegidas: 13';
    RAISE NOTICE '===================================';
END $$;

COMMIT;

-- =====================================================================
-- TESTES SUGERIDOS
-- =====================================================================
--
-- 1. Testar como aluno:
--    SELECT * FROM alpha_aluno_badges; -- Deve ver apenas suas badges
--
-- 2. Testar como professor:
--    SELECT * FROM alpha_aluno_badges; -- Deve ver badges de seus alunos
--
-- 3. Testar como admin:
--    SELECT * FROM alpha_aluno_badges; -- Deve ver todas
--
-- 4. Testar ranking público:
--    SELECT * FROM alpha_ranking; -- Todos devem ver
--
-- =====================================================================
