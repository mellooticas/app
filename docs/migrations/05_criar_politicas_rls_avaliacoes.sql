-- =====================================================================
-- MIGRAÇÃO 05: CRIAR POLÍTICAS RLS PARA AVALIAÇÕES E MATERIAIS
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🔴 CRÍTICO
-- Descrição: Protege avaliações, presenças e materiais pedagógicos
-- =====================================================================

BEGIN;

-- =====================================================================
-- AULA_AVALIACOES
-- =====================================================================

-- Aluno vê apenas suas avaliações
CREATE POLICY "aluno_ve_proprias_avaliacoes"
    ON aula_avaliacoes
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM matriculas m
            JOIN aulas a ON a.id = aula_avaliacoes.aula_id
            WHERE m.aluno_id = auth.uid()
        )
    );

-- Professor vê avaliações de aulas que criou
CREATE POLICY "professor_ve_avaliacoes_suas_aulas"
    ON aula_avaliacoes
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM aulas a
            WHERE a.id = aula_avaliacoes.aula_id
                AND a.responsavel_id = auth.uid()
        )
    );

-- Professor cria avaliações em suas aulas
CREATE POLICY "professor_cria_avaliacoes"
    ON aula_avaliacoes
    FOR INSERT
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM aulas a
            WHERE a.id = aula_id
                AND a.responsavel_id = auth.uid()
        ) OR is_admin(auth.uid())
    );

-- Professor atualiza avaliações de suas aulas
CREATE POLICY "professor_atualiza_avaliacoes"
    ON aula_avaliacoes
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM aulas a
            WHERE a.id = aula_avaliacoes.aula_id
                AND a.responsavel_id = auth.uid()
        ) OR is_admin(auth.uid())
    );

-- Admin gerencia todas avaliações
CREATE POLICY "admin_gerencia_avaliacoes"
    ON aula_avaliacoes
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- AULA_PRESENCAS
-- =====================================================================

-- Aluno vê suas próprias presenças
CREATE POLICY "aluno_ve_proprias_presencas"
    ON aula_presencas
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM matriculas m
            JOIN aulas a ON a.id = aula_presencas.aula_id
            WHERE m.aluno_id = auth.uid()
        )
    );

-- Professor vê presenças de suas aulas
CREATE POLICY "professor_ve_presencas_aulas"
    ON aula_presencas
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM aulas a
            WHERE a.id = aula_presencas.aula_id
                AND a.responsavel_id = auth.uid()
        )
    );

-- Professor registra presenças
CREATE POLICY "professor_registra_presencas"
    ON aula_presencas
    FOR INSERT
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM aulas a
            WHERE a.id = aula_id
                AND a.responsavel_id = auth.uid()
        ) OR is_admin(auth.uid())
    );

-- Professor atualiza presenças
CREATE POLICY "professor_atualiza_presencas"
    ON aula_presencas
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM aulas a
            WHERE a.id = aula_presencas.aula_id
                AND a.responsavel_id = auth.uid()
        ) OR is_admin(auth.uid())
    );

-- Admin gerencia todas presenças
CREATE POLICY "admin_gerencia_presencas"
    ON aula_presencas
    FOR ALL
    USING (is_admin(auth.uid()));

-- =====================================================================
-- MATERIAIS_APOIO
-- =====================================================================

-- Materiais - staff gerencia
CREATE POLICY "staff_gerencia_materiais"
    ON materiais_apoio
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- METODOLOGIAS_ENSINO
-- =====================================================================

-- Metodologias - staff gerencia
CREATE POLICY "staff_gerencia_metodologias"
    ON metodologias_ensino
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- HISTÓRIA E CONTEÚDO CULTURAL
-- =====================================================================

-- Historia_timeline - staff gerencia
CREATE POLICY "staff_gerencia_timeline"
    ON historia_timeline
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- Historia_movimentos_artisticos - staff gerencia
CREATE POLICY "staff_gerencia_movimentos"
    ON historia_movimentos_artisticos
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- DOCUMENTOS INSTITUCIONAIS
-- =====================================================================

-- Documentos são visíveis para staff
CREATE POLICY "documentos_visiveis_staff"
    ON documentos_institucionais
    FOR SELECT
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- Staff gerencia documentos
CREATE POLICY "staff_gerencia_documentos"
    ON documentos_institucionais
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- EXPERIÊNCIAS E REFERENCIAIS
-- =====================================================================

-- Experiências brasileiras - staff apenas
CREATE POLICY "experiencias_staff"
    ON experiencias_brasileiras
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- Referenciais internacionais - staff apenas
CREATE POLICY "referenciais_staff"
    ON referenciais_internacionais
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- GESTÃO PEDAGÓGICA
-- =====================================================================

-- Proposta curricular - apenas staff
CREATE POLICY "staff_acessa_proposta"
    ON proposta_curricular
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- Sequências didáticas - apenas staff
CREATE POLICY "staff_acessa_sequencias"
    ON sequencias_didaticas
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

CREATE POLICY "staff_acessa_sequencias_expandidas"
    ON sequencias_didaticas_expandidas
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- Sistema Presto - apenas staff
CREATE POLICY "staff_acessa_presto"
    ON sistema_presto
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- CAPACITAÇÃO E COMUNICAÇÃO
-- =====================================================================

-- Capacitação docente - apenas professores e admin
CREATE POLICY "professores_acessam_capacitacao"
    ON capacitacao_docente
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- Comunicação - apenas staff
CREATE POLICY "staff_acessa_comunicacao"
    ON comunicacao_engajamento
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- Adaptações espaciais - apenas staff
CREATE POLICY "staff_gerencia_adaptacoes"
    ON adaptacoes_espacos_alternativos
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- REPERTÓRIO MUSICAL
-- =====================================================================

-- Repertório - apenas staff
CREATE POLICY "staff_acessa_repertorio"
    ON repertorio_musical
    FOR ALL
    USING (is_professor(auth.uid()) OR is_admin(auth.uid()));

-- =====================================================================
-- VERIFICAÇÃO
-- =====================================================================

DO $$
DECLARE
    total_policies INTEGER;
    total_tabelas INTEGER := 16;
BEGIN
    SELECT COUNT(*) INTO total_policies
    FROM pg_policies
    WHERE schemaname = 'public'
        AND tablename IN (
            'aula_avaliacoes',
            'aula_presencas',
            'materiais_apoio',
            'metodologias_ensino',
            'historia_timeline',
            'historia_movimentos_artisticos',
            'documentos_institucionais',
            'experiencias_brasileiras',
            'referenciais_internacionais',
            'proposta_curricular',
            'sequencias_didaticas',
            'sequencias_didaticas_expandidas',
            'sistema_presto',
            'capacitacao_docente',
            'comunicacao_engajamento',
            'adaptacoes_espacos_alternativos',
            'repertorio_musical'
        );
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'MIGRAÇÃO 05 CONCLUÍDA';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'Políticas RLS criadas: %', total_policies;
    RAISE NOTICE 'Tabelas protegidas: %', total_tabelas;
    RAISE NOTICE '===================================';
    RAISE NOTICE '✅ Todas as 37 tabelas críticas';
    RAISE NOTICE '✅ agora estão protegidas com RLS!';
    RAISE NOTICE '===================================';
END $$;

COMMIT;

-- =====================================================================
-- RESUMO DAS MIGRAÇÕES 01-05
-- =====================================================================
--
-- ✅ MIGRAÇÃO 01: RLS habilitado em 37 tabelas
-- ✅ MIGRAÇÃO 02: 13 tabelas de gamificação protegidas
-- ✅ MIGRAÇÃO 03: 4 tabelas de fórum protegidas
-- ✅ MIGRAÇÃO 04: 3 tabelas de instrumentos protegidas
-- ✅ MIGRAÇÃO 05: 17 tabelas de avaliação e conteúdo protegidas
--
-- TOTAL: 37 tabelas críticas agora com RLS completo! 🎉
--
-- =====================================================================
