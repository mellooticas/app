-- ============================================
-- MÓDULO: HISTÓRIA DA MÚSICA - NIPO SCHOOL
-- ============================================
-- Este script cria todas as tabelas necessárias para o módulo
-- de História da Música do sistema Nipo School
-- 
-- Ordem de criação: tabelas principais → tabelas de relação
-- Execute este script no SQL Editor do Supabase
-- ============================================

-- ============================================
-- 1. PERÍODOS HISTÓRICOS DA MÚSICA
-- ============================================
CREATE TABLE IF NOT EXISTS historia_periodos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome VARCHAR(100) NOT NULL, -- Ex: "Barroco", "Classicismo", "Romantismo"
  periodo_inicio INTEGER, -- Ano de início (ex: 1600)
  periodo_fim INTEGER, -- Ano de fim (ex: 1750)
  descricao_curta TEXT,
  descricao_completa TEXT,
  contexto_historico TEXT, -- O que acontecia no mundo
  caracteristicas_principais JSONB, -- Array de características musicais
  imagem_capa_url TEXT,
  cor_tematica VARCHAR(7), -- Hex color para UI
  ordem_cronologica INTEGER,
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- 2. COMPOSITORES E ARTISTAS
-- ============================================
CREATE TABLE IF NOT EXISTS historia_compositores (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome_completo VARCHAR(200) NOT NULL,
  nome_artistico VARCHAR(200),
  data_nascimento DATE,
  data_falecimento DATE,
  pais_nascimento VARCHAR(100),
  cidade_nascimento VARCHAR(100),
  periodo_id UUID REFERENCES historia_periodos(id),
  biografia_curta TEXT, -- 2-3 linhas
  biografia_completa TEXT,
  principais_obras TEXT[], -- Array de obras famosas
  estilo_musical VARCHAR(100),
  instrumentos_tocados TEXT[],
  curiosidades JSONB, -- [{titulo, texto, imagem_url}]
  foto_url TEXT,
  audio_assinatura_url TEXT, -- URL de uma obra característica
  nivel_importancia INTEGER DEFAULT 1, -- 1-5 (para ordenação)
  tags TEXT[], -- ["piano", "sinfonia", "opera"]
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- 3. OBRAS MUSICAIS
-- ============================================
CREATE TABLE IF NOT EXISTS historia_obras (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo VARCHAR(300) NOT NULL,
  titulo_original VARCHAR(300),
  compositor_id UUID REFERENCES historia_compositores(id),
  periodo_id UUID REFERENCES historia_periodos(id),
  ano_composicao INTEGER,
  tipo_obra VARCHAR(100), -- "Sinfonia", "Ópera", "Concerto", "Sonata"
  genero VARCHAR(100), -- "Clássica", "Jazz", "MPB", "Bossa Nova"
  duracao_minutos INTEGER,
  instrumentacao TEXT[], -- Instrumentos usados
  tonalidade VARCHAR(50),
  opus_numero VARCHAR(50),
  descricao TEXT,
  contexto_criacao TEXT, -- História por trás da obra
  estrutura_formal JSONB, -- Movimentos, partes, seções
  analise_musical TEXT, -- Análise técnica
  significado_historico TEXT,
  audio_url TEXT, -- Link para Spotify, YouTube, etc
  partitura_url TEXT, -- PDF da partitura
  video_performance_url TEXT,
  nivel_dificuldade INTEGER, -- 1-5
  popularidade INTEGER DEFAULT 0, -- Contador de views
  tags TEXT[],
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- 4. GÊNEROS E ESTILOS MUSICAIS
-- ============================================
CREATE TABLE IF NOT EXISTS historia_generos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome VARCHAR(100) NOT NULL UNIQUE,
  slug VARCHAR(100) NOT NULL UNIQUE,
  periodo_origem_id UUID REFERENCES historia_periodos(id),
  decada_origem INTEGER, -- Ex: 1950 para Rock'n'Roll
  pais_origem VARCHAR(100),
  descricao TEXT,
  caracteristicas_musicais JSONB, -- {ritmo, harmonia, instrumentacao}
  generos_relacionados UUID[], -- Array de IDs de outros gêneros
  compositores_principais UUID[], -- Array de IDs
  obras_representativas UUID[], -- Array de IDs de obras
  influencias_culturais TEXT,
  imagem_url TEXT,
  cor_tematica VARCHAR(7),
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- 5. MOVIMENTOS ARTÍSTICOS
-- ============================================
CREATE TABLE IF NOT EXISTS historia_movimentos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome VARCHAR(200) NOT NULL,
  periodo_inicio INTEGER,
  periodo_fim INTEGER,
  locais_principais TEXT[], -- Cidades/países onde surgiu
  manifesto TEXT, -- Princípios do movimento
  caracteristicas JSONB,
  compositores UUID[], -- Array de IDs
  obras_iconicas UUID[], -- Array de IDs
  contexto_historico TEXT,
  legado TEXT,
  imagem_url TEXT,
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- 6. INSTRUMENTOS HISTÓRICOS (evolução)
-- ============================================
CREATE TABLE IF NOT EXISTS historia_instrumentos_evolucao (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  instrumento_id UUID REFERENCES instrumentos(id),
  periodo_id UUID REFERENCES historia_periodos(id),
  versao_historica VARCHAR(200), -- Ex: "Cravo (precursor do piano)"
  ano_aproximado INTEGER,
  inventor_ou_luthier VARCHAR(200),
  descricao_tecnica TEXT,
  diferencas_versao_moderna TEXT,
  imagem_url TEXT,
  audio_exemplo_url TEXT,
  curiosidades TEXT,
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- 7. TEORIA MUSICAL E CONCEITOS
-- ============================================
CREATE TABLE IF NOT EXISTS historia_conceitos_teoricos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome VARCHAR(200) NOT NULL,
  categoria VARCHAR(100), -- "Harmonia", "Ritmo", "Forma", "Notação"
  definicao_simples TEXT,
  definicao_tecnica TEXT,
  periodo_origem_id UUID REFERENCES historia_periodos(id),
  exemplos_auditivos JSONB, -- [{obra_id, timestamp_inicio, descricao}]
  diagramas_url TEXT[], -- Imagens explicativas
  nivel_dificuldade INTEGER, -- 1-5
  pre_requisitos UUID[], -- Array de IDs de outros conceitos
  exercicios JSONB, -- Quiz, exercícios práticos
  tags TEXT[],
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- 8. LINHA DO TEMPO INTERATIVA
-- ============================================
CREATE TABLE IF NOT EXISTS historia_eventos_timeline (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  ano INTEGER NOT NULL,
  mes INTEGER, -- Opcional
  dia INTEGER, -- Opcional
  titulo VARCHAR(300) NOT NULL,
  tipo_evento VARCHAR(50), -- "nascimento", "morte", "estreia", "invencao"
  categoria VARCHAR(50), -- "compositor", "obra", "instrumento", "movimento"
  descricao TEXT,
  compositor_id UUID REFERENCES historia_compositores(id),
  obra_id UUID REFERENCES historia_obras(id),
  periodo_id UUID REFERENCES historia_periodos(id),
  imagem_url TEXT,
  importancia INTEGER DEFAULT 1, -- 1-5 (para filtrar eventos principais)
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- 9. CONTEXTO CULTURAL (relação música e história)
-- ============================================
CREATE TABLE IF NOT EXISTS historia_contexto_cultural (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  periodo_id UUID REFERENCES historia_periodos(id),
  titulo VARCHAR(300) NOT NULL,
  tipo VARCHAR(50), -- "politica", "economia", "artes", "ciencia", "religiao"
  descricao TEXT,
  impacto_na_musica TEXT,
  ano_inicio INTEGER,
  ano_fim INTEGER,
  imagens_url TEXT[],
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- 10. PROGRESSO DO ALUNO NO ACERVO
-- ============================================
CREATE TABLE IF NOT EXISTS historia_progresso_usuario (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  tipo_conteudo VARCHAR(50), -- "compositor", "obra", "periodo", "conceito"
  conteudo_id UUID NOT NULL,
  progresso INTEGER DEFAULT 0, -- 0-100%
  tempo_estudado_minutos INTEGER DEFAULT 0,
  concluido BOOLEAN DEFAULT false,
  data_conclusao TIMESTAMPTZ,
  notas_pessoais TEXT,
  favorito BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(user_id, tipo_conteudo, conteudo_id)
);

-- ============================================
-- 11. QUIZ E AVALIAÇÕES
-- ============================================
CREATE TABLE IF NOT EXISTS historia_quiz (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo VARCHAR(300) NOT NULL,
  periodo_id UUID REFERENCES historia_periodos(id),
  nivel_dificuldade INTEGER, -- 1-5
  tipo VARCHAR(50), -- "multipla_escolha", "audio", "imagem", "cronologia"
  pergunta TEXT NOT NULL,
  opcoes JSONB, -- [{id, texto, correta: boolean}]
  explicacao TEXT, -- Explicação da resposta correta
  audio_url TEXT, -- Para quiz de reconhecimento auditivo
  imagem_url TEXT, -- Para quiz visual
  tags TEXT[],
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS historia_quiz_respostas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  quiz_id UUID REFERENCES historia_quiz(id) ON DELETE CASCADE,
  resposta_escolhida TEXT,
  correta BOOLEAN,
  tempo_resposta_segundos INTEGER,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- 12. PLAYLISTS PEDAGÓGICAS
-- ============================================
CREATE TABLE IF NOT EXISTS historia_playlists (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo VARCHAR(300) NOT NULL,
  descricao TEXT,
  tipo VARCHAR(50), -- "introducao", "aprofundamento", "comparativo"
  tema VARCHAR(200), -- Ex: "Evolução da Sinfonia"
  periodo_id UUID REFERENCES historia_periodos(id),
  criador_id UUID REFERENCES profiles(id),
  nivel_recomendado VARCHAR(50), -- "iniciante", "intermediario", "avancado"
  ordem_obras JSONB, -- [{obra_id, ordem, notas_pedagogicas}]
  duracao_total_minutos INTEGER,
  visualizacoes INTEGER DEFAULT 0,
  publicada BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- ÍNDICES PARA PERFORMANCE
-- ============================================
CREATE INDEX IF NOT EXISTS idx_compositores_periodo ON historia_compositores(periodo_id);
CREATE INDEX IF NOT EXISTS idx_obras_compositor ON historia_obras(compositor_id);
CREATE INDEX IF NOT EXISTS idx_obras_periodo ON historia_obras(periodo_id);
CREATE INDEX IF NOT EXISTS idx_timeline_ano ON historia_eventos_timeline(ano);
CREATE INDEX IF NOT EXISTS idx_progresso_user ON historia_progresso_usuario(user_id);
CREATE INDEX IF NOT EXISTS idx_quiz_respostas_user ON historia_quiz_respostas(user_id);

-- ============================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================

-- Habilitar RLS nas tabelas
ALTER TABLE historia_periodos ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_compositores ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_obras ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_generos ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_movimentos ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_instrumentos_evolucao ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_conceitos_teoricos ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_eventos_timeline ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_contexto_cultural ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_progresso_usuario ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_quiz ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_quiz_respostas ENABLE ROW LEVEL SECURITY;
ALTER TABLE historia_playlists ENABLE ROW LEVEL SECURITY;

-- Políticas: Conteúdo público (leitura para todos autenticados)
CREATE POLICY "Conteúdo público - leitura" ON historia_periodos
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Conteúdo público - leitura" ON historia_compositores
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Conteúdo público - leitura" ON historia_obras
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Conteúdo público - leitura" ON historia_generos
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Conteúdo público - leitura" ON historia_movimentos
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Conteúdo público - leitura" ON historia_instrumentos_evolucao
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Conteúdo público - leitura" ON historia_conceitos_teoricos
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Conteúdo público - leitura" ON historia_eventos_timeline
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Conteúdo público - leitura" ON historia_contexto_cultural
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Conteúdo público - leitura" ON historia_quiz
  FOR SELECT USING (auth.role() = 'authenticated');

-- Políticas: Progresso do usuário (cada um acessa apenas o seu)
CREATE POLICY "Usuário vê apenas seu progresso" ON historia_progresso_usuario
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Usuário gerencia seu progresso" ON historia_progresso_usuario
  FOR ALL USING (auth.uid() = user_id);

-- Políticas: Quiz respostas (cada um acessa apenas as suas)
CREATE POLICY "Usuário vê apenas suas respostas" ON historia_quiz_respostas
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Usuário insere suas respostas" ON historia_quiz_respostas
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Políticas: Playlists (públicas se publicadas, privadas se não)
CREATE POLICY "Playlists publicadas são públicas" ON historia_playlists
  FOR SELECT USING (publicada = true OR auth.uid() = criador_id);

CREATE POLICY "Criador gerencia suas playlists" ON historia_playlists
  FOR ALL USING (auth.uid() = criador_id);

-- ============================================
-- TRIGGERS PARA UPDATED_AT
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_historia_progresso_updated_at BEFORE UPDATE ON historia_progresso_usuario
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_historia_playlists_updated_at BEFORE UPDATE ON historia_playlists
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- FIM DO SCRIPT
-- ============================================
-- ✅ Tabelas criadas com sucesso!
-- ✅ Índices criados para performance
-- ✅ RLS configurado para segurança
-- ✅ Triggers criados para updated_at
--
-- PRÓXIMO PASSO: Popular com dados iniciais
-- Execute o script de dados em: sql_scripts/populate_historia_musica.sql
-- ============================================
