-- CRIAÇÃO SEQUENCIAL - SISTEMA PORTFOLIO
-- Execute em ordem para evitar erros de dependência

-- =====================================
-- ETAPA 1: TABELA PRINCIPAL PORTFOLIOS
-- =====================================

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
    configuracoes jsonb DEFAULT '{}'::jsonb,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- Verificar criação
SELECT 'PORTFOLIOS CRIADA' as status, count(*) as registros FROM portfolios;


| status            | registros |
| ----------------- | --------- |
| PORTFOLIOS CRIADA | 1         |

-- =====================================
-- ETAPA 2: TABELAS DEPENDENTES
-- =====================================

-- EVIDÊNCIAS (depende de portfolios)
CREATE TABLE IF NOT EXISTS portfolio_evidencias (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    portfolio_id uuid REFERENCES portfolios(id) ON DELETE CASCADE,
    titulo varchar(300) NOT NULL,
    descricao text,
    tipo_evidencia varchar(50) CHECK (tipo_evidencia IN ('video', 'audio', 'foto', 'texto', 'arquivo', 'link', 'reflexao')) NOT NULL,
    arquivo_url text,
    arquivo_tipo varchar(100),
    arquivo_tamanho bigint,
    conteudo_texto text,
    link_externo text,
    metadata jsonb,
    ordem integer DEFAULT 1,
    data_criacao timestamp with time zone DEFAULT now(),
    data_evento date,
    aprovado boolean DEFAULT false,
    aprovado_por uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    data_aprovacao timestamp with time zone,
    feedback_professor text,
    autoavaliacao jsonb,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- AUTOAVALIAÇÕES (depende de portfolios)
CREATE TABLE IF NOT EXISTS autoavaliacoes (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    portfolio_id uuid REFERENCES portfolios(id) ON DELETE CASCADE,
    periodo_tipo varchar(20) CHECK (periodo_tipo IN ('semanal', 'mensal', 'trimestral', 'semestral', 'anual', 'projeto')) NOT NULL,
    data_inicio date NOT NULL,
    data_fim date NOT NULL,
    conquistas text[],
    dificuldades text[],
    aprendizados text[],
    objetivos_proximos text[],
    autoavaliacao_competencias jsonb,
    nivel_satisfacao integer CHECK (nivel_satisfacao BETWEEN 1 AND 5),
    pontos_fortes text,
    areas_melhoria text,
    reflexao_processo text,
    metas_futuras text[],
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- INDICADORES (depende de portfolios)
CREATE TABLE IF NOT EXISTS indicadores_impacto (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    portfolio_id uuid REFERENCES portfolios(id) ON DELETE CASCADE,
    tipo_indicador varchar(50) CHECK (tipo_indicador IN ('academico', 'social', 'criativo', 'colaborativo', 'autonomia', 'tecnico')) NOT NULL,
    nome_indicador varchar(200) NOT NULL,
    valor_numerico decimal(10,2),
    valor_qualitativo text,
    escala varchar(50),
    contexto text,
    evidencias text[],
    data_medicao date DEFAULT CURRENT_DATE,
    periodo_referencia varchar(100),
    observacoes text,
    validado_por uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    created_at timestamp with time zone DEFAULT now()
);

-- Verificar criação das dependentes
SELECT 'EVIDENCIAS CRIADA' as status, count(*) as registros FROM portfolio_evidencias;

| status            | registros |
| ----------------- | --------- |
| EVIDENCIAS CRIADA | 0         |

SELECT 'AUTOAVALIACOES CRIADA' as status, count(*) as registros FROM autoavaliacoes;
| status                | registros |
| --------------------- | --------- |
| AUTOAVALIACOES CRIADA | 0         |

SELECT 'INDICADORES CRIADA' as status, count(*) as registros FROM indicadores_impacto;

| status             | registros |
| ------------------ | --------- |
| INDICADORES CRIADA | 5         |

-- =====================================
-- ETAPA 3: TABELAS ESPECIAIS
-- =====================================

-- RUBRICAS (independente)
CREATE TABLE IF NOT EXISTS rubricas_avaliacao (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    nome varchar(200) NOT NULL,
    descricao text,
    tipo varchar(50) CHECK (tipo IN ('metodologia', 'competencia', 'geral', 'peer_review')) NOT NULL,
    metodologia_id uuid REFERENCES alpha_metodologias(id) ON DELETE SET NULL,
    criterios jsonb NOT NULL DEFAULT '{}'::jsonb,
    niveis_desempenho jsonb NOT NULL DEFAULT '{}'::jsonb,
    peso_total integer DEFAULT 100,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- FEEDBACK (depende de evidencias)
CREATE TABLE IF NOT EXISTS feedback_pares (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    evidencia_id uuid REFERENCES portfolio_evidencias(id) ON DELETE CASCADE,
    avaliador_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    avaliado_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    pontos_fortes text,
    sugestoes_melhoria text,
    nota_criatividade integer CHECK (nota_criatividade BETWEEN 1 AND 5),
    nota_tecnica integer CHECK (nota_tecnica BETWEEN 1 AND 5),
    nota_geral integer CHECK (nota_geral BETWEEN 1 AND 5),
    feedback_detalhado text,
    aprovado boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    UNIQUE(evidencia_id, avaliador_id)
);

-- AVALIAÇÕES COM RUBRICAS (depende de rubricas e portfolios)
CREATE TABLE IF NOT EXISTS avaliacoes_rubricas (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    rubrica_id uuid REFERENCES rubricas_avaliacao(id) ON DELETE CASCADE,
    portfolio_id uuid REFERENCES portfolios(id) ON DELETE CASCADE,
    evidencia_id uuid REFERENCES portfolio_evidencias(id) ON DELETE SET NULL,
    avaliador_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    avaliado_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    pontuacoes jsonb NOT NULL,
    comentarios jsonb,
    pontuacao_total decimal(5,2),
    nivel_atingido varchar(50),
    recomendacoes text,
    data_avaliacao timestamp with time zone DEFAULT now(),
    created_at timestamp with time zone DEFAULT now()
);

-- Verificar criação finais
SELECT 'RUBRICAS CRIADA' as status, count(*) as registros FROM rubricas_avaliacao;


| status          | registros |
| --------------- | --------- |
| RUBRICAS CRIADA | 2         |
SELECT 'FEEDBACK CRIADO' as status, count(*) as registros FROM feedback_pares;

| status          | registros |
| --------------- | --------- |
| FEEDBACK CRIADO | 0         |
SELECT 'AVALIACOES CRIADA' as status, count(*) as registros FROM avaliacoes_rubricas;

| status            | registros |
| ----------------- | --------- |
| AVALIACOES CRIADA | 0         |

-- =====================================
-- ETAPA 4: ÍNDICES
-- =====================================

CREATE INDEX IF NOT EXISTS idx_portfolios_user_id ON portfolios(user_id);
CREATE INDEX IF NOT EXISTS idx_portfolios_metodologia ON portfolios(metodologia_id);
CREATE INDEX IF NOT EXISTS idx_portfolios_status ON portfolios(status);

CREATE INDEX IF NOT EXISTS idx_evidencias_portfolio ON portfolio_evidencias(portfolio_id);
CREATE INDEX IF NOT EXISTS idx_evidencias_tipo ON portfolio_evidencias(tipo_evidencia);
CREATE INDEX IF NOT EXISTS idx_evidencias_aprovado ON portfolio_evidencias(aprovado);

CREATE INDEX IF NOT EXISTS idx_autoavaliacoes_user ON autoavaliacoes(user_id);
CREATE INDEX IF NOT EXISTS idx_autoavaliacoes_portfolio ON autoavaliacoes(portfolio_id);
CREATE INDEX IF NOT EXISTS idx_autoavaliacoes_periodo ON autoavaliacoes(periodo_tipo);

CREATE INDEX IF NOT EXISTS idx_feedback_evidencia ON feedback_pares(evidencia_id);
CREATE INDEX IF NOT EXISTS idx_feedback_avaliador ON feedback_pares(avaliador_id);
CREATE INDEX IF NOT EXISTS idx_feedback_avaliado ON feedback_pares(avaliado_id);

CREATE INDEX IF NOT EXISTS idx_rubricas_tipo ON rubricas_avaliacao(tipo);
CREATE INDEX IF NOT EXISTS idx_rubricas_ativo ON rubricas_avaliacao(ativo);

CREATE INDEX IF NOT EXISTS idx_avaliacoes_rubrica ON avaliacoes_rubricas(rubrica_id);
CREATE INDEX IF NOT EXISTS idx_avaliacoes_portfolio ON avaliacoes_rubricas(portfolio_id);

CREATE INDEX IF NOT EXISTS idx_indicadores_user ON indicadores_impacto(user_id);
CREATE INDEX IF NOT EXISTS idx_indicadores_tipo ON indicadores_impacto(tipo_indicador);
CREATE INDEX IF NOT EXISTS idx_indicadores_medicao ON indicadores_impacto(data_medicao);


ERROR:  42703: column "portfolio_id" does not exist

-- =====================================
-- ETAPA 5: RLS (CUIDADOSO)
-- =====================================

-- Habilitar RLS
ALTER TABLE portfolios ENABLE ROW LEVEL SECURITY;
ALTER TABLE portfolio_evidencias ENABLE ROW LEVEL SECURITY;
ALTER TABLE autoavaliacoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE feedback_pares ENABLE ROW LEVEL SECURITY;
ALTER TABLE rubricas_avaliacao ENABLE ROW LEVEL SECURITY;
ALTER TABLE avaliacoes_rubricas ENABLE ROW LEVEL SECURITY;
ALTER TABLE indicadores_impacto ENABLE ROW LEVEL SECURITY;

-- Criar políticas (uma por vez para evitar erros)
DO $$
BEGIN
    -- Política para portfolios
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'portfolios' 
        AND policyname = 'Usuários podem ver seus próprios portfolios'
    ) THEN
        EXECUTE 'CREATE POLICY "Usuários podem ver seus próprios portfolios" 
                 ON portfolios FOR ALL 
                 USING (auth.uid() = user_id)';
    END IF;
    
    -- Política para evidências
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'portfolio_evidencias' 
        AND policyname = 'Usuários podem gerenciar evidências de seus portfolios'
    ) THEN
        EXECUTE 'CREATE POLICY "Usuários podem gerenciar evidências de seus portfolios" 
                 ON portfolio_evidencias FOR ALL 
                 USING (portfolio_id IN (SELECT id FROM portfolios WHERE user_id = auth.uid()))';
    END IF;
    
    -- Política para autoavaliações
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'autoavaliacoes' 
        AND policyname = 'Usuários podem gerenciar suas autoavaliações'
    ) THEN
        EXECUTE 'CREATE POLICY "Usuários podem gerenciar suas autoavaliações" 
                 ON autoavaliacoes FOR ALL 
                 USING (auth.uid() = user_id)';
    END IF;
    
    -- Política para rubricas
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'rubricas_avaliacao' 
        AND policyname = 'Rubricas são acessíveis para leitura'
    ) THEN
        EXECUTE 'CREATE POLICY "Rubricas são acessíveis para leitura" 
                 ON rubricas_avaliacao FOR SELECT 
                 USING (ativo = true)';
    END IF;
    
    -- Política para feedback
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'feedback_pares' 
        AND policyname = 'Usuários podem dar e receber feedback'
    ) THEN
        EXECUTE 'CREATE POLICY "Usuários podem dar e receber feedback" 
                 ON feedback_pares FOR ALL 
                 USING (auth.uid() = avaliador_id OR auth.uid() = avaliado_id)';
    END IF;
    
    -- Política para indicadores
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'indicadores_impacto' 
        AND policyname = 'Usuários podem gerenciar seus indicadores'
    ) THEN
        EXECUTE 'CREATE POLICY "Usuários podem gerenciar seus indicadores" 
                 ON indicadores_impacto FOR ALL 
                 USING (auth.uid() = user_id)';
    END IF;
    
    -- Política para avaliações
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'avaliacoes_rubricas' 
        AND policyname = 'Usuários podem ver avaliações relacionadas a si'
    ) THEN
        EXECUTE 'CREATE POLICY "Usuários podem ver avaliações relacionadas a si" 
                 ON avaliacoes_rubricas FOR SELECT 
                 USING (auth.uid() = avaliador_id OR auth.uid() = avaliado_id)';
    END IF;
END $$;

ERROR:  42703: column "avaliado_id" does not exist
HINT:  Perhaps you meant to reference the column "avaliacoes_rubricas.avaliador_id".
CONTEXT:  SQL statement "CREATE POLICY "Usuários podem ver avaliações relacionadas a si" 
                 ON avaliacoes_rubricas FOR SELECT 
                 USING (auth.uid() = avaliador_id OR auth.uid() = avaliado_id)"
PL/pgSQL function inline_code_block line 75 at EXECUTE

-- =====================================
-- ETAPA 6: VERIFICAÇÃO FINAL
-- =====================================

SELECT 
    'PORTFOLIO SYSTEM CRIADO COM SUCESSO' as resultado,
    (SELECT count(*) FROM information_schema.tables WHERE table_schema = 'public' AND table_name LIKE '%portfolio%') as tabelas_portfolio,
    (SELECT count(*) FROM pg_policies WHERE tablename LIKE '%portfolio%') as politicas_ativas;

-- Mostrar todas as tabelas Portfolio criadas
SELECT table_name, 
       (SELECT count(*) FROM information_schema.columns WHERE table_name = t.table_name AND table_schema = 'public') as colunas
FROM information_schema.tables t
WHERE table_schema = 'public' 
AND table_name IN ('portfolios', 'portfolio_evidencias', 'autoavaliacoes', 'feedback_pares', 'rubricas_avaliacao', 'avaliacoes_rubricas', 'indicadores_impacto')
ORDER BY table_name;


| table_name           | colunas |
| -------------------- | ------- |
| autoavaliacoes       | 18      |
| avaliacoes_rubricas  | 9       |
| feedback_pares       | 13      |
| indicadores_impacto  | 9       |
| portfolio_evidencias | 21      |
| portfolios           | 17      |
| rubricas_avaliacao   | 11      |