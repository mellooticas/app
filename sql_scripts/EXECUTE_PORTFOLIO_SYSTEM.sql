-- =====================================
-- SCRIPT COMPLETO - SISTEMA PORTFOLIO
-- =====================================
-- Execute este script inteiro no Supabase SQL Editor
-- Baseado no Capítulo 15 da curadoria

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

-- TABELA DE AUTOAVALIAÇÕES
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

-- TABELA DE FEEDBACK ENTRE PARES
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

-- TABELA DE RUBRICAS DE AVALIAÇÃO
CREATE TABLE IF NOT EXISTS rubricas_avaliacao (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    nome varchar(200) NOT NULL,
    descricao text,
    tipo varchar(50) CHECK (tipo IN ('metodologia', 'competencia', 'geral', 'peer_review')) NOT NULL,
    metodologia_id uuid REFERENCES alpha_metodologias(id) ON DELETE SET NULL,
    criterios jsonb NOT NULL,
    niveis_desempenho jsonb NOT NULL,
    peso_total integer DEFAULT 100,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- TABELA DE AVALIAÇÕES COM RUBRICAS
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

-- TABELA DE INDICADORES DE IMPACTO
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

-- ÍNDICES PARA PERFORMANCE
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

-- POLÍTICAS RLS (Row Level Security)
ALTER TABLE portfolios ENABLE ROW LEVEL SECURITY;
ALTER TABLE portfolio_evidencias ENABLE ROW LEVEL SECURITY;
ALTER TABLE autoavaliacoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE feedback_pares ENABLE ROW LEVEL SECURITY;
ALTER TABLE rubricas_avaliacao ENABLE ROW LEVEL SECURITY;
ALTER TABLE avaliacoes_rubricas ENABLE ROW LEVEL SECURITY;
ALTER TABLE indicadores_impacto ENABLE ROW LEVEL SECURITY;

-- Política para portfolios
CREATE POLICY "Usuários podem ver seus próprios portfolios" 
ON portfolios FOR ALL 
USING (auth.uid() = user_id);

-- Política para evidências  
CREATE POLICY "Usuários podem gerenciar evidências de seus portfolios" 
ON portfolio_evidencias FOR ALL 
USING (portfolio_id IN (SELECT id FROM portfolios WHERE user_id = auth.uid()));

-- Política para autoavaliações
CREATE POLICY "Usuários podem gerenciar suas autoavaliações" 
ON autoavaliacoes FOR ALL 
USING (auth.uid() = user_id);

-- Política para feedback
CREATE POLICY "Usuários podem dar e receber feedback" 
ON feedback_pares FOR ALL 
USING (auth.uid() = avaliador_id OR auth.uid() = avaliado_id);

-- Política para rubricas (leitura pública)
CREATE POLICY "Rubricas são acessíveis para leitura" 
ON rubricas_avaliacao FOR SELECT 
USING (ativo = true);

-- Política para avaliações
CREATE POLICY "Usuários podem ver avaliações relacionadas a si" 
ON avaliacoes_rubricas FOR SELECT 
USING (auth.uid() = avaliador_id OR auth.uid() = avaliado_id);

-- Política para indicadores
CREATE POLICY "Usuários podem gerenciar seus indicadores" 
ON indicadores_impacto FOR ALL 
USING (auth.uid() = user_id);

-- COMENTÁRIOS DE DOCUMENTAÇÃO
COMMENT ON TABLE portfolios IS 'Sistema de portfolios de evidências de aprendizagem baseado no Capítulo 15';
COMMENT ON TABLE portfolio_evidencias IS 'Artefatos e evidências que compõem os portfolios';
COMMENT ON TABLE autoavaliacoes IS 'Reflexões periódicas dos estudantes sobre seu progresso';
COMMENT ON TABLE feedback_pares IS 'Sistema de avaliação entre pares';
COMMENT ON TABLE rubricas_avaliacao IS 'Instrumentos estruturados de avaliação';
COMMENT ON TABLE avaliacoes_rubricas IS 'Avaliações realizadas usando rubricas';
COMMENT ON TABLE indicadores_impacto IS 'Métricas de impacto da aprendizagem';

-- =====================================
-- DADOS INICIAIS - RUBRICAS PADRÃO
-- =====================================

-- Rubrica para Metodologia Orff
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, metodologia_id, criterios, niveis_desempenho) 
SELECT 
    'Avaliação Orff Schulwerk',
    'Rubrica para avaliar desenvolvimento musical através da metodologia Orff',
    'metodologia',
    id,
    '{"expressao_corporal": {"peso": 25, "descricao": "Capacidade de expressar música através do movimento"}, "criatividade_musical": {"peso": 25, "descricao": "Improviso e criação musical"}, "trabalho_colaborativo": {"peso": 25, "descricao": "Participação em atividades coletivas"}, "dominio_instrumental": {"peso": 25, "descricao": "Uso de instrumentos de percussão Orff"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Necessita apoio constante"}, "em_desenvolvimento": {"faixa": "26-50", "descricao": "Demonstra compreensão básica"}, "proficiente": {"faixa": "51-75", "descricao": "Aplica conceitos adequadamente"}, "avancado": {"faixa": "76-100", "descricao": "Demonstra maestria e criatividade"}}'::jsonb
FROM alpha_metodologias WHERE nome = 'Orff Schulwerk';

-- Rubrica para Metodologia Kodály
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, metodologia_id, criterios, niveis_desempenho) 
SELECT 
    'Avaliação Kodály',
    'Rubrica para desenvolvimento da literacia musical através do método Kodály',
    'metodologia',
    id,
    '{"solfejos": {"peso": 30, "descricao": "Precisão na entoação usando dó móvel"}, "leitura_musical": {"peso": 25, "descricao": "Capacidade de ler partituras"}, "manossolfa": {"peso": 25, "descricao": "Uso correto dos gestos manuais"}, "patrimonio_folclorico": {"peso": 20, "descricao": "Conhecimento do repertório tradicional"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Reconhece elementos básicos"}, "em_desenvolvimento": {"faixa": "26-50", "descricao": "Aplica conceitos com orientação"}, "proficiente": {"faixa": "51-75", "descricao": "Usa ferramentas independentemente"}, "avancado": {"faixa": "76-100", "descricao": "Demonstra fluência e ensina outros"}}'::jsonb
FROM alpha_metodologias WHERE nome = 'Kodály';

-- Rubrica para Dalcroze
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, metodologia_id, criterios, niveis_desempenho) 
SELECT 
    'Avaliação Dalcroze',
    'Rubrica para euritmia e desenvolvimento rítmico-corporal',
    'metodologia',
    id,
    '{"coordenacao_ritmica": {"peso": 30, "descricao": "Sincronização corpo-música"}, "expressividade": {"peso": 25, "descricao": "Comunicação através do movimento"}, "improvisacao": {"peso": 25, "descricao": "Criação espontânea de movimentos"}, "consciencia_espacial": {"peso": 20, "descricao": "Uso adequado do espaço"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Movimentos básicos e hesitantes"}, "em_desenvolvimento": {"faixa": "26-50", "descricao": "Coordenação emergente"}, "proficiente": {"faixa": "51-75", "descricao": "Fluidez e expressividade"}, "avancado": {"faixa": "76-100", "descricao": "Maestria artística e liderança"}}'::jsonb
FROM alpha_metodologias WHERE nome = 'Dalcroze';

-- Rubrica Geral para Competências
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, criterios, niveis_desempenho) VALUES 
(
    'Avaliação de Competências Musicais',
    'Rubrica geral para avaliar competências musicais transversais',
    'competencia',
    '{"criatividade": {"peso": 20, "descricao": "Originalidade e inovação"}, "colaboracao": {"peso": 20, "descricao": "Trabalho em equipe efetivo"}, "comunicacao": {"peso": 20, "descricao": "Expressão clara de ideias musicais"}, "pensamento_critico": {"peso": 20, "descricao": "Análise e reflexão musical"}, "autonomia": {"peso": 20, "descricao": "Independência na aprendizagem"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Habilidades emergentes"}, "em_desenvolvimento": {"faixa": "26-50", "descricao": "Progresso consistente"}, "proficiente": {"faixa": "51-75", "descricao": "Competência estabelecida"}, "avancado": {"faixa": "76-100", "descricao": "Excelência e liderança"}}'::jsonb
);

-- Rubrica para Peer Review
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, criterios, niveis_desempenho) VALUES 
(
    'Avaliação entre Pares',
    'Estrutura para feedback construtivo entre estudantes',
    'peer_review',
    '{"feedback_construtivo": {"peso": 25, "descricao": "Qualidade dos comentários oferecidos"}, "especificidade": {"peso": 25, "descricao": "Detalhamento das observações"}, "encorajamento": {"peso": 25, "descricao": "Positividade e motivação"}, "sugestoes_praticas": {"peso": 25, "descricao": "Propostas viáveis de melhoria"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Comentários superficiais"}, "em_desenvolvimento": {"faixa": "26-50", "descricao": "Observações úteis básicas"}, "proficiente": {"faixa": "51-75", "descricao": "Feedback detalhado e construtivo"}, "avancado": {"faixa": "76-100", "descricao": "Mentoria excepcional"}}'::jsonb
);