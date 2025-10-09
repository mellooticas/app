-- SQL para criação das tabelas do Sistema de Gamificação
-- Execução: Supabase SQL Editor

-- ===== TABELA: gamification_usuarios =====
-- Perfil de gamificação de cada usuário
CREATE TABLE IF NOT EXISTS gamification_usuarios (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    total_pontos INTEGER DEFAULT 0,
    nivel_atual INTEGER DEFAULT 1,
    nome_nivel VARCHAR(50) DEFAULT 'Iniciante',
    cor_nivel VARCHAR(20) DEFAULT 'gray',
    data_criacao TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    data_atualizacao TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    UNIQUE(usuario_id)
);

-- ===== TABELA: gamification_pontos =====
-- Histórico de pontos conquistados
CREATE TABLE IF NOT EXISTS gamification_pontos (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    pontos INTEGER NOT NULL,
    fonte VARCHAR(50) NOT NULL, -- 'alpha', 'portfolio', 'evidencia', 'autoavaliacao', 'badge'
    descricao TEXT,
    metadata JSONB DEFAULT '{}',
    data_conquista TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===== TABELA: gamification_badges =====
-- Badges conquistados pelos usuários
CREATE TABLE IF NOT EXISTS gamification_badges (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    tipo_badge VARCHAR(50) NOT NULL,
    nome_badge VARCHAR(100) NOT NULL,
    descricao TEXT,
    icone VARCHAR(50),
    cor VARCHAR(20),
    metadata JSONB DEFAULT '{}',
    data_conquista TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    UNIQUE(usuario_id, tipo_badge)
);

-- ===== TABELA: gamification_conquistas =====
-- Conquistas e marcos especiais
CREATE TABLE IF NOT EXISTS gamification_conquistas (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    tipo_conquista VARCHAR(50) NOT NULL,
    nome_conquista VARCHAR(100) NOT NULL,
    descricao TEXT,
    valor_conquista INTEGER, -- pontos, quantidade, etc.
    metadata JSONB DEFAULT '{}',
    data_conquista TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===== ÍNDICES PARA PERFORMANCE =====
CREATE INDEX IF NOT EXISTS idx_gamification_usuarios_total_pontos ON gamification_usuarios(total_pontos DESC);
CREATE INDEX IF NOT EXISTS idx_gamification_pontos_usuario ON gamification_pontos(usuario_id);
CREATE INDEX IF NOT EXISTS idx_gamification_pontos_data ON gamification_pontos(data_conquista DESC);
CREATE INDEX IF NOT EXISTS idx_gamification_badges_usuario ON gamification_badges(usuario_id);
CREATE INDEX IF NOT EXISTS idx_gamification_badges_tipo ON gamification_badges(tipo_badge);
CREATE INDEX IF NOT EXISTS idx_gamification_conquistas_usuario ON gamification_conquistas(usuario_id);

-- ===== RLS (ROW LEVEL SECURITY) =====
-- Usuários podem ver apenas seus próprios dados

ALTER TABLE gamification_usuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE gamification_pontos ENABLE ROW LEVEL SECURITY;
ALTER TABLE gamification_badges ENABLE ROW LEVEL SECURITY;
ALTER TABLE gamification_conquistas ENABLE ROW LEVEL SECURITY;

-- Políticas para gamification_usuarios
CREATE POLICY "Usuários podem ver seu próprio perfil de gamificação" ON gamification_usuarios
    FOR SELECT USING (auth.uid() = usuario_id);

CREATE POLICY "Usuários podem inserir seu próprio perfil" ON gamification_usuarios
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

CREATE POLICY "Usuários podem atualizar seu próprio perfil" ON gamification_usuarios
    FOR UPDATE USING (auth.uid() = usuario_id);

-- Políticas para gamification_pontos
CREATE POLICY "Usuários podem ver seus próprios pontos" ON gamification_pontos
    FOR SELECT USING (auth.uid() = usuario_id);

CREATE POLICY "Sistema pode inserir pontos" ON gamification_pontos
    FOR INSERT WITH CHECK (true);

-- Políticas para gamification_badges
CREATE POLICY "Usuários podem ver seus próprios badges" ON gamification_badges
    FOR SELECT USING (auth.uid() = usuario_id);

CREATE POLICY "Sistema pode inserir badges" ON gamification_badges
    FOR INSERT WITH CHECK (true);

-- Políticas para gamification_conquistas
CREATE POLICY "Usuários podem ver suas próprias conquistas" ON gamification_conquistas
    FOR SELECT USING (auth.uid() = usuario_id);

CREATE POLICY "Sistema pode inserir conquistas" ON gamification_conquistas
    FOR INSERT WITH CHECK (true);

-- ===== POLÍTICAS PARA RANKING PÚBLICO =====
-- Permitir que todos vejam o ranking (apenas dados básicos)
CREATE POLICY "Ranking público de pontos" ON gamification_usuarios
    FOR SELECT USING (true);

-- ===== FUNÇÕES AUXILIARES =====

-- Função para atualizar timestamp de última modificação
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.data_atualizacao = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger para atualizar timestamp automaticamente
CREATE TRIGGER update_gamification_usuarios_updated_at 
    BEFORE UPDATE ON gamification_usuarios 
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ===== DADOS INICIAIS =====
-- Inserir dados de demonstração (opcional)

-- Comentário: Executar este arquivo no Supabase SQL Editor para criar todas as tabelas
-- e configurações necessárias para o Sistema de Gamificação.