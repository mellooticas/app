-- SISTEMA DE PORTFOLIO - BASEADO NO CAPÍTULO 15
-- =================================================
-- Schema para sistema de portfólio de evidências de aprendizagem
-- Baseado na curadoria do Capítulo15—Avaliacao_Portfolio_e_Impacto.md

-- TABELA PRINCIPAL DE PORTFOLIOS
CREATE TABLE IF NOT EXISTS portfolios (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    titulo varchar(300) NOT NULL,
    descricao text,
    tipo varchar(50) CHECK (tipo IN ('pessoal', 'projeto', 'metodologia', 'competencia')) DEFAULT 'pessoal',
    status varchar(20) CHECK (status IN ('ativo', 'finalizado', 'arquivado')) DEFAULT 'ativo',
    visibilidade varchar(20) CHECK (visibilidade IN ('privado', 'turma', 'publico')) DEFAULT 'privado',
    data_inicio date DEFAULT CURRENT_DATE,
    data_fim date,
    metodologia_id uuid REFERENCES alpha_metodologias(id) ON DELETE SET NULL,
    competencia_id uuid REFERENCES alpha_competencias(id) ON DELETE SET NULL,
    tags text[],
    objetivos text[],
    reflexoes_iniciais text,
    reflexoes_finais text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- TABELA DE EVIDÊNCIAS/ARTEFATOS
CREATE TABLE IF NOT EXISTS portfolio_evidencias (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    portfolio_id uuid REFERENCES portfolios(id) ON DELETE CASCADE,
    titulo varchar(300) NOT NULL,
    descricao text,
    tipo_evidencia varchar(50) CHECK (tipo_evidencia IN ('video', 'audio', 'foto', 'texto', 'arquivo', 'link', 'reflexao')) NOT NULL,
    arquivo_url text,
    arquivo_tipo varchar(100), -- MIME type
    arquivo_tamanho bigint, -- bytes
    conteudo_texto text, -- para reflexões e textos
    link_externo text, -- para links e referências
    metadata jsonb, -- dados específicos por tipo
    ordem integer DEFAULT 1,
    data_criacao timestamp with time zone DEFAULT now(),
    data_evento date, -- quando aconteceu o que está sendo evidenciado
    aprovado boolean DEFAULT false,
    aprovado_por uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    data_aprovacao timestamp with time zone,
    feedback_professor text,
    autoavaliacao jsonb,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- TABELA DE AUTOAVALIAÇÕES SEMANAIS/MENSAIS
CREATE TABLE IF NOT EXISTS autoavaliacoes (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    portfolio_id uuid REFERENCES portfolios(id) ON DELETE CASCADE,
    periodo_tipo varchar(20) CHECK (periodo_tipo IN ('semanal', 'mensal', 'projeto')) DEFAULT 'semanal',
    data_inicio date NOT NULL,
    data_fim date NOT NULL,
    maior_progresso text,
    principais_dificuldades text,
    objetivos_proximos text,
    contribuicao_grupo text,
    ideias_experimentadas text,
    nivel_satisfacao integer CHECK (nivel_satisfacao BETWEEN 1 AND 5),
    tempo_dedicado_horas decimal(4,1),
    atividades_realizadas text[],
    reflexoes_livres text,
    metas_alcancadas text[],
    desafios_futuros text[],
    created_at timestamp with time zone DEFAULT now()
);

-- TABELA DE FEEDBACK E AVALIAÇÕES DE PARES
CREATE TABLE IF NOT EXISTS feedback_pares (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    evidencia_id uuid REFERENCES portfolio_evidencias(id) ON DELETE CASCADE,
    avaliador_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    avaliado_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    pontos_fortes text NOT NULL,
    sugestoes_melhoria text,
    nota_criatividade integer CHECK (nota_criatividade BETWEEN 1 AND 3),
    nota_tecnica integer CHECK (nota_tecnica BETWEEN 1 AND 3),
    nota_cooperacao integer CHECK (nota_cooperacao BETWEEN 1 AND 3),
    nota_participacao integer CHECK (nota_participacao BETWEEN 1 AND 3),
    comentarios_gerais text,
    aprovado boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);

-- TABELA DE RUBRICAS DE AVALIAÇÃO
CREATE TABLE IF NOT EXISTS rubricas_avaliacao (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    nome varchar(200) NOT NULL,
    descricao text,
    tipo varchar(50) CHECK (tipo IN ('apresentacao', 'projeto', 'colaboracao', 'tecnica', 'criatividade')) NOT NULL,
    criterios jsonb NOT NULL, -- estrutura de critérios e níveis
    escala_maxima integer DEFAULT 3,
    metodologia_id uuid REFERENCES alpha_metodologias(id) ON DELETE SET NULL,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);

-- TABELA DE AVALIAÇÕES COM RUBRICAS
CREATE TABLE IF NOT EXISTS avaliacoes_rubricas (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    evidencia_id uuid REFERENCES portfolio_evidencias(id) ON DELETE CASCADE,
    rubrica_id uuid REFERENCES rubricas_avaliacao(id) ON DELETE CASCADE,
    avaliador_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    notas jsonb NOT NULL, -- notas por critério
    nota_final decimal(3,1),
    observacoes text,
    data_avaliacao timestamp with time zone DEFAULT now(),
    created_at timestamp with time zone DEFAULT now()
);

-- TABELA DE INDICADORES DE IMPACTO
CREATE TABLE IF NOT EXISTS indicadores_impacto (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    tipo_indicador varchar(50) CHECK (tipo_indicador IN ('autoestima', 'engajamento', 'autonomia', 'cooperacao', 'criatividade', 'tecnica')) NOT NULL,
    valor_inicial decimal(3,1),
    valor_atual decimal(3,1),
    data_medicao date DEFAULT CURRENT_DATE,
    observacoes text,
    metodo_coleta varchar(100),
    created_at timestamp with time zone DEFAULT now()
);

-- ÍNDICES PARA PERFORMANCE
CREATE INDEX IF NOT EXISTS idx_portfolios_user ON portfolios(user_id);
CREATE INDEX IF NOT EXISTS idx_portfolios_metodologia ON portfolios(metodologia_id);
CREATE INDEX IF NOT EXISTS idx_portfolio_evidencias_portfolio ON portfolio_evidencias(portfolio_id);
CREATE INDEX IF NOT EXISTS idx_portfolio_evidencias_tipo ON portfolio_evidencias(tipo_evidencia);
CREATE INDEX IF NOT EXISTS idx_autoavaliacoes_user ON autoavaliacoes(user_id);
CREATE INDEX IF NOT EXISTS idx_autoavaliacoes_portfolio ON autoavaliacoes(portfolio_id);
CREATE INDEX IF NOT EXISTS idx_feedback_pares_evidencia ON feedback_pares(evidencia_id);
CREATE INDEX IF NOT EXISTS idx_indicadores_impacto_user ON indicadores_impacto(user_id);

-- CONFIGURAR RLS (Row Level Security)
ALTER TABLE portfolios ENABLE ROW LEVEL SECURITY;
ALTER TABLE portfolio_evidencias ENABLE ROW LEVEL SECURITY;
ALTER TABLE autoavaliacoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE feedback_pares ENABLE ROW LEVEL SECURITY;
ALTER TABLE rubricas_avaliacao ENABLE ROW LEVEL SECURITY;
ALTER TABLE avaliacoes_rubricas ENABLE ROW LEVEL SECURITY;
ALTER TABLE indicadores_impacto ENABLE ROW LEVEL SECURITY;

-- POLÍTICAS RLS - PORTFOLIOS
CREATE POLICY "Usuários podem ver seus próprios portfolios" ON portfolios
    FOR SELECT USING (auth.uid() = user_id OR visibilidade = 'publico');

CREATE POLICY "Usuários podem criar seus portfolios" ON portfolios
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Usuários podem atualizar seus portfolios" ON portfolios
    FOR UPDATE USING (auth.uid() = user_id);

-- POLÍTICAS RLS - EVIDÊNCIAS
CREATE POLICY "Acesso a evidências via portfolio" ON portfolio_evidencias
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM portfolios p 
            WHERE p.id = portfolio_id 
            AND (p.user_id = auth.uid() OR p.visibilidade IN ('turma', 'publico'))
        )
    );

CREATE POLICY "Usuários podem criar evidências em seus portfolios" ON portfolio_evidencias
    FOR INSERT WITH CHECK (
        EXISTS (
            SELECT 1 FROM portfolios p 
            WHERE p.id = portfolio_id AND p.user_id = auth.uid()
        )
    );

CREATE POLICY "Usuários podem atualizar suas evidências" ON portfolio_evidencias
    FOR UPDATE USING (
        EXISTS (
            SELECT 1 FROM portfolios p 
            WHERE p.id = portfolio_id AND p.user_id = auth.uid()
        )
    );

-- POLÍTICAS RLS - AUTOAVALIAÇÕES
CREATE POLICY "Usuários veem suas autoavaliações" ON autoavaliacoes
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Usuários podem criar autoavaliações" ON autoavaliacoes
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Usuários podem atualizar suas autoavaliações" ON autoavaliacoes
    FOR UPDATE USING (auth.uid() = user_id);

-- POLÍTICAS RLS - FEEDBACK ENTRE PARES
CREATE POLICY "Usuários veem feedback relacionado a eles" ON feedback_pares
    FOR SELECT USING (auth.uid() = avaliador_id OR auth.uid() = avaliado_id);

CREATE POLICY "Usuários podem dar feedback" ON feedback_pares
    FOR INSERT WITH CHECK (auth.uid() = avaliador_id);

-- POLÍTICAS RLS - RUBRICAS (públicas para leitura)
CREATE POLICY "Rubricas são visíveis para todos" ON rubricas_avaliacao
    FOR SELECT USING (ativo = true);

-- POLÍTICAS RLS - AVALIAÇÕES COM RUBRICAS
CREATE POLICY "Usuários veem avaliações de suas evidências" ON avaliacoes_rubricas
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM portfolio_evidencias pe 
            JOIN portfolios p ON pe.portfolio_id = p.id
            WHERE pe.id = evidencia_id AND p.user_id = auth.uid()
        )
        OR auth.uid() = avaliador_id
    );

-- POLÍTICAS RLS - INDICADORES DE IMPACTO
CREATE POLICY "Usuários veem seus indicadores" ON indicadores_impacto
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Usuários podem registrar indicadores" ON indicadores_impacto
    FOR INSERT WITH CHECK (auth.uid() = user_id);

-- FUNÇÕES ÚTEIS
CREATE OR REPLACE FUNCTION atualizar_timestamp_portfolio()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- TRIGGERS
CREATE TRIGGER trigger_atualizar_portfolios
    BEFORE UPDATE ON portfolios
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_timestamp_portfolio();

CREATE TRIGGER trigger_atualizar_evidencias
    BEFORE UPDATE ON portfolio_evidencias
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_timestamp_portfolio();

-- SUCESSO! Sistema de Portfolio criado baseado no Capítulo 15