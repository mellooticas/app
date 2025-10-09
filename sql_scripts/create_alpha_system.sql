-- Criação das tabelas para o Sistema Alpha Challenges
-- Baseado na curadoria completa do curriculum Nipo School

-- Tabela principal de metodologias
CREATE TABLE IF NOT EXISTS alpha_metodologias (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  codigo VARCHAR(20) UNIQUE NOT NULL,
  nome VARCHAR(100) NOT NULL,
  nome_original VARCHAR(150),
  criador VARCHAR(100),
  pais_origem VARCHAR(50),
  periodo VARCHAR(50),
  descricao_curta TEXT NOT NULL,
  descricao_completa TEXT NOT NULL,
  principios_fundamentais TEXT[] NOT NULL,
  filosofia TEXT NOT NULL,
  publico_alvo TEXT NOT NULL,
  instrumentos_principais TEXT[],
  metodologia_ensino TEXT NOT NULL,
  pontos_fortes TEXT[] NOT NULL,
  limitacoes TEXT[],
  aplicacao_brasil TEXT NOT NULL,
  nivel_dificuldade INTEGER CHECK (nivel_dificuldade BETWEEN 1 AND 5) NOT NULL,
  idade_minima INTEGER,
  idade_maxima INTEGER,
  duracao_tipica_meses INTEGER,
  recursos_necessarios TEXT[],
  cor_tema VARCHAR(7) NOT NULL, -- Hex color
  icone VARCHAR(50) NOT NULL,
  ativo BOOLEAN DEFAULT true,
  ordem_apresentacao INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de competências por metodologia
CREATE TABLE IF NOT EXISTS alpha_competencias (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  metodologia_id UUID NOT NULL REFERENCES alpha_metodologias(id) ON DELETE CASCADE,
  tipo VARCHAR(50) NOT NULL, -- 'tecnica', 'criativa', 'colaborativa', 'cultural'
  nome VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  nivel INTEGER CHECK (nivel BETWEEN 1 AND 5) NOT NULL,
  pre_requisitos TEXT[],
  ordem INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de desafios Alpha
CREATE TABLE IF NOT EXISTS alpha_desafios (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  metodologia_id UUID NOT NULL REFERENCES alpha_metodologias(id) ON DELETE CASCADE,
  competencia_id UUID REFERENCES alpha_competencias(id) ON DELETE SET NULL,
  titulo VARCHAR(200) NOT NULL,
  descricao TEXT NOT NULL,
  objetivo TEXT NOT NULL,
  instrucoes TEXT NOT NULL,
  tempo_estimado_minutos INTEGER,
  dificuldade INTEGER CHECK (dificuldade BETWEEN 1 AND 5) NOT NULL,
  tipo_evidencia VARCHAR(50) NOT NULL, -- 'video', 'audio', 'foto', 'texto', 'arquivo'
  criterios_avaliacao JSONB NOT NULL,
  pontos_base INTEGER DEFAULT 10,
  pontos_bonus INTEGER DEFAULT 0,
  materiais_necessarios TEXT[],
  tags TEXT[],
  ativo BOOLEAN DEFAULT true,
  ordem INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de submissões dos estudantes
CREATE TABLE IF NOT EXISTS alpha_submissoes (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  desafio_id UUID NOT NULL REFERENCES alpha_desafios(id) ON DELETE CASCADE,
  estudante_id UUID NOT NULL, -- FK para profiles ou tabela de estudantes
  titulo VARCHAR(200),
  descricao TEXT,
  url_evidencia TEXT,
  tipo_arquivo VARCHAR(10),
  tamanho_arquivo BIGINT,
  status VARCHAR(20) DEFAULT 'pendente', -- 'pendente', 'avaliado', 'aprovado', 'rejeitado'
  nota DECIMAL(3,1) CHECK (nota BETWEEN 0 AND 10),
  feedback_professor TEXT,
  pontos_obtidos INTEGER DEFAULT 0,
  tempo_execucao_minutos INTEGER,
  data_submissao TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  data_avaliacao TIMESTAMP WITH TIME ZONE,
  avaliador_id UUID, -- FK para profiles (professor)
  metadata JSONB, -- Dados extras como qualidade do vídeo, etc.
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de progresso dos estudantes
CREATE TABLE IF NOT EXISTS alpha_progresso (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  estudante_id UUID NOT NULL,
  metodologia_id UUID NOT NULL REFERENCES alpha_metodologias(id) ON DELETE CASCADE,
  competencia_id UUID REFERENCES alpha_competencias(id) ON DELETE SET NULL,
  nivel_atual INTEGER DEFAULT 1,
  pontos_totais INTEGER DEFAULT 0,
  desafios_completados INTEGER DEFAULT 0,
  desafios_disponiveis INTEGER DEFAULT 0,
  ultima_atividade TIMESTAMP WITH TIME ZONE,
  tempo_total_minutos INTEGER DEFAULT 0,
  streak_dias INTEGER DEFAULT 0, -- Dias consecutivos de atividade
  conquistas TEXT[], -- Array de conquistas/badges
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(estudante_id, metodologia_id, competencia_id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_alpha_desafios_metodologia ON alpha_desafios(metodologia_id);
CREATE INDEX IF NOT EXISTS idx_alpha_submissoes_estudante ON alpha_submissoes(estudante_id);
CREATE INDEX IF NOT EXISTS idx_alpha_submissoes_desafio ON alpha_submissoes(desafio_id);
CREATE INDEX IF NOT EXISTS idx_alpha_progresso_estudante ON alpha_progresso(estudante_id);
CREATE INDEX IF NOT EXISTS idx_alpha_competencias_metodologia ON alpha_competencias(metodologia_id);

-- Funções para atualizar timestamps
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Triggers para auto-update de timestamps
CREATE TRIGGER update_alpha_metodologias_updated_at BEFORE UPDATE ON alpha_metodologias FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_alpha_desafios_updated_at BEFORE UPDATE ON alpha_desafios FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_alpha_submissoes_updated_at BEFORE UPDATE ON alpha_submissoes FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_alpha_progresso_updated_at BEFORE UPDATE ON alpha_progresso FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();