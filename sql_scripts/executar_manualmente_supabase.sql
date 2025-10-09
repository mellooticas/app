-- EXECUÇÃO MANUAL NO SUPABASE SQL EDITOR
-- =====================================
-- Este arquivo contém comandos SQL para executar manualmente
-- no painel SQL do Supabase para criar o Sistema Alpha

-- PASSO 1: CRIAR TABELAS PRINCIPAIS
-- ================================

-- 1.1 Tabela de Metodologias
CREATE TABLE IF NOT EXISTS alpha_metodologias (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    codigo varchar(50) UNIQUE NOT NULL,
    nome varchar(200) NOT NULL,
    criador varchar(100),
    pais_origem varchar(50),
    periodo varchar(50),
    descricao_curta text,
    descricao_completa text,
    principios_fundamentais text[],
    filosofia text,
    publico_alvo text,
    instrumentos_principais text[],
    metodologia_ensino text,
    pontos_fortes text[],
    limitacoes text[],
    aplicacao_brasil text,
    nivel_dificuldade integer CHECK (nivel_dificuldade BETWEEN 1 AND 5),
    idade_minima integer,
    recursos_necessarios text[],
    cor_tema varchar(7),
    icone varchar(50),
    ordem_apresentacao integer DEFAULT 1,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- 1.2 Tabela de Competências
CREATE TABLE IF NOT EXISTS alpha_competencias (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    metodologia_id uuid REFERENCES alpha_metodologias(id) ON DELETE CASCADE,
    codigo varchar(50) NOT NULL,
    nome varchar(200) NOT NULL,
    descricao text,
    categoria varchar(100),
    nivel_complexidade integer CHECK (nivel_complexidade BETWEEN 1 AND 5),
    pre_requisitos text[],
    ordem integer DEFAULT 1,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);

-- 1.3 Tabela de Desafios
CREATE TABLE IF NOT EXISTS alpha_desafios (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    metodologia_id uuid REFERENCES alpha_metodologias(id) ON DELETE CASCADE,
    competencia_id uuid REFERENCES alpha_competencias(id) ON DELETE SET NULL,
    codigo varchar(50) NOT NULL,
    titulo varchar(300) NOT NULL,
    descricao text NOT NULL,
    objetivos text[],
    instrucoes text NOT NULL,
    dificuldade integer CHECK (dificuldade BETWEEN 1 AND 5),
    tempo_estimado_minutos integer,
    pontos_base integer DEFAULT 100,
    criterios_avaliacao jsonb,
    tipo_evidencia varchar(50) CHECK (tipo_evidencia IN ('video', 'audio', 'foto', 'texto', 'arquivo')),
    recursos_necessarios text[],
    dicas text[],
    categoria varchar(100),
    tags text[],
    ordem integer DEFAULT 1,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- 1.4 Tabela de Submissões
CREATE TABLE IF NOT EXISTS alpha_submissoes (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    desafio_id uuid REFERENCES alpha_desafios(id) ON DELETE CASCADE,
    titulo varchar(300),
    descricao text,
    evidencia_url text,
    evidencia_tipo varchar(50),
    tempo_execucao_minutos integer,
    auto_avaliacao jsonb,
    status varchar(20) DEFAULT 'pendente' CHECK (status IN ('pendente', 'avaliando', 'aprovado', 'revisao', 'rejeitado')),
    pontos_obtidos integer DEFAULT 0,
    feedback_professor text,
    avaliacao_professor jsonb,
    data_submissao timestamp with time zone DEFAULT now(),
    data_avaliacao timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- 1.5 Tabela de Progresso
CREATE TABLE IF NOT EXISTS alpha_progresso (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    metodologia_id uuid REFERENCES alpha_metodologias(id) ON DELETE CASCADE,
    competencia_id uuid REFERENCES alpha_competencias(id) ON DELETE CASCADE,
    desafios_completados integer DEFAULT 0,
    total_desafios integer DEFAULT 0,
    pontos_acumulados integer DEFAULT 0,
    nivel_atual integer DEFAULT 1,
    progresso_percentual decimal(5,2) DEFAULT 0.00,
    ultima_atividade timestamp with time zone DEFAULT now(),
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    UNIQUE(user_id, metodologia_id, competencia_id)
);

-- PASSO 2: CRIAR ÍNDICES
-- ======================

CREATE INDEX IF NOT EXISTS idx_alpha_metodologias_codigo ON alpha_metodologias(codigo);
CREATE INDEX IF NOT EXISTS idx_alpha_metodologias_ativo ON alpha_metodologias(ativo) WHERE ativo = true;
CREATE INDEX IF NOT EXISTS idx_alpha_competencias_metodologia ON alpha_competencias(metodologia_id);
CREATE INDEX IF NOT EXISTS idx_alpha_desafios_metodologia ON alpha_desafios(metodologia_id);
CREATE INDEX IF NOT EXISTS idx_alpha_desafios_competencia ON alpha_desafios(competencia_id);
CREATE INDEX IF NOT EXISTS idx_alpha_submissoes_user ON alpha_submissoes(user_id);
CREATE INDEX IF NOT EXISTS idx_alpha_submissoes_desafio ON alpha_submissoes(desafio_id);
CREATE INDEX IF NOT EXISTS idx_alpha_progresso_user ON alpha_progresso(user_id);

-- PASSO 3: CONFIGURAR RLS (Row Level Security)
-- ============================================

-- Habilitar RLS
ALTER TABLE alpha_metodologias ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_competencias ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_desafios ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_submissoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE alpha_progresso ENABLE ROW LEVEL SECURITY;

-- Políticas para leitura pública dos dados curriculares
CREATE POLICY "Metodologias são visíveis para todos" ON alpha_metodologias
    FOR SELECT USING (ativo = true);

CREATE POLICY "Competências são visíveis para todos" ON alpha_competencias
    FOR SELECT USING (ativo = true);

CREATE POLICY "Desafios são visíveis para todos" ON alpha_desafios
    FOR SELECT USING (ativo = true);

-- Políticas para submissões (privadas do usuário)
CREATE POLICY "Usuários veem suas próprias submissões" ON alpha_submissoes
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Usuários podem criar submissões" ON alpha_submissoes
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Usuários podem atualizar suas submissões" ON alpha_submissoes
    FOR UPDATE USING (auth.uid() = user_id);

-- Políticas para progresso (privado do usuário)
CREATE POLICY "Usuários veem seu próprio progresso" ON alpha_progresso
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Sistema pode gerenciar progresso" ON alpha_progresso
    FOR ALL USING (true);

-- SUCESSO!
-- ========
-- Se todos os comandos executaram sem erro, o Sistema Alpha está criado!
-- Execute agora o arquivo test-alpha-system.mjs para verificar.