-- ============================================
-- 🏆 TABELAS FALTANTES - ACHIEVEMENTS & GAMIFICAÇÃO
-- ============================================
-- ⚠️ ATENÇÃO: Estas tabelas estavam faltando no schema
-- Data: 05/10/2025

-- ============================================
-- 🎖️ SISTEMA DE CONQUISTAS (ACHIEVEMENTS)
-- ============================================

-- Tabela de definição de conquistas
CREATE TABLE IF NOT EXISTS achievements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT NOT NULL,
    icone VARCHAR(50),
    categoria VARCHAR(50) NOT NULL, -- Ex: 'instrumento', 'portfolio', 'alpha', 'social'
    
    -- Condições para desbloquear
    condicao_tipo VARCHAR(50) NOT NULL, -- Ex: 'contador', 'sequencia', 'especial'
    condicao_meta INTEGER, -- Meta numérica (ex: 10 portfolios)
    condicao_detalhes JSONB, -- Detalhes complexos da condição
    
    -- Recompensas
    pontos_recompensa INTEGER DEFAULT 0,
    badge_visual VARCHAR(100), -- URL ou identificador do badge visual
    
    -- Raridade e dificuldade
    raridade VARCHAR(20) DEFAULT 'comum' CHECK (raridade IN ('comum', 'raro', 'epico', 'lendario')),
    dificuldade VARCHAR(20) DEFAULT 'facil' CHECK (dificuldade IN ('facil', 'medio', 'dificil', 'extremo')),
    
    -- Visibilidade
    visivel BOOLEAN DEFAULT TRUE,
    ordem_exibicao INTEGER DEFAULT 0,
    
    -- Metadados
    ativo BOOLEAN DEFAULT TRUE,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de conquistas desbloqueadas pelos usuários
CREATE TABLE IF NOT EXISTS user_achievements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    achievement_id UUID NOT NULL REFERENCES achievements(id) ON DELETE CASCADE,
    
    -- Quando desbloqueou
    earned_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Contexto do desbloqueio
    contexto JSONB, -- O que o usuário fez para desbloquear
    
    -- Controle
    notificado BOOLEAN DEFAULT FALSE, -- Se o usuário já foi notificado
    exibido BOOLEAN DEFAULT FALSE, -- Se já foi mostrado na UI
    
    UNIQUE(user_id, achievement_id)
);

-- Tabela de progresso em conquistas em andamento
CREATE TABLE IF NOT EXISTS achievements_progress (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    achievement_id UUID NOT NULL REFERENCES achievements(id) ON DELETE CASCADE,
    
    -- Progresso atual
    progresso_atual INTEGER DEFAULT 0,
    progresso_necessario INTEGER NOT NULL,
    porcentagem_conclusao DECIMAL(5,2) DEFAULT 0.0,
    
    -- Controle
    iniciado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    UNIQUE(user_id, achievement_id)
);

-- ============================================
-- 💰 SISTEMA DE PONTOS
-- ============================================

-- Log detalhado de todas as transações de pontos
CREATE TABLE IF NOT EXISTS user_points_log (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    
    -- Pontos
    pontos INTEGER NOT NULL, -- Pode ser negativo para penalidades
    tipo_transacao VARCHAR(50) NOT NULL, -- 'ganho', 'perda', 'ajuste'
    
    -- Origem dos pontos
    origem VARCHAR(50) NOT NULL, -- 'portfolio', 'alpha', 'achievement', 'manual', 'bonus'
    origem_id UUID, -- ID da entidade que gerou os pontos (portfolio_id, achievement_id, etc)
    origem_detalhes JSONB, -- Detalhes adicionais
    
    -- Descrição
    descricao TEXT,
    descricao_publica TEXT, -- Descrição visível para o usuário
    
    -- Metadados
    admin_id UUID REFERENCES auth.users(id), -- Se foi ajuste manual
    observacoes TEXT, -- Observações internas
    
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 🎓 SISTEMA ESCOLAR - TURMAS & MATRÍCULAS
-- ============================================

-- Turmas (classes)
CREATE TABLE IF NOT EXISTS turmas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    
    -- Professor responsável
    professor_id UUID NOT NULL REFERENCES auth.users(id),
    
    -- Informações da turma
    ano_letivo INTEGER NOT NULL,
    semestre INTEGER CHECK (semestre IN (1, 2)),
    nivel VARCHAR(50), -- Ex: 'Iniciante', 'Intermediário', 'Avançado'
    
    -- Datas
    data_inicio DATE NOT NULL,
    data_fim DATE,
    
    -- Horários
    dias_semana JSONB, -- Array: ['segunda', 'quarta', 'sexta']
    horario_inicio TIME,
    horario_fim TIME,
    
    -- Capacidade
    vagas_totais INTEGER DEFAULT 0,
    vagas_ocupadas INTEGER DEFAULT 0,
    
    -- Status
    ativa BOOLEAN DEFAULT TRUE,
    
    -- Metadados
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Matrículas (alunos nas turmas)
CREATE TABLE IF NOT EXISTS matriculas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    aluno_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    turma_id UUID NOT NULL REFERENCES turmas(id) ON DELETE CASCADE,
    
    -- Status da matrícula
    status VARCHAR(20) DEFAULT 'ativa' CHECK (status IN ('ativa', 'trancada', 'cancelada', 'concluida')),
    
    -- Datas
    data_matricula TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    data_conclusao TIMESTAMP WITH TIME ZONE,
    data_cancelamento TIMESTAMP WITH TIME ZONE,
    motivo_cancelamento TEXT,
    
    -- Controle
    UNIQUE(aluno_id, turma_id)
);

-- ============================================
-- 📅 SISTEMA DE AULAS
-- ============================================

-- Aulas (classes/lessons)
CREATE TABLE IF NOT EXISTS aulas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    turma_id UUID REFERENCES turmas(id) ON DELETE CASCADE,
    responsavel_id UUID NOT NULL REFERENCES auth.users(id), -- Professor
    
    -- Informações da aula
    titulo VARCHAR(200) NOT NULL,
    descricao TEXT,
    
    -- Conteúdo programático
    modulo VARCHAR(100), -- Qual módulo do curso
    topico VARCHAR(200), -- Tópico específico
    objetivos JSONB, -- Array de objetivos de aprendizagem
    conteudo_programatico TEXT,
    
    -- Data e horário
    data_aula DATE NOT NULL,
    horario_inicio TIME NOT NULL,
    horario_fim TIME NOT NULL,
    duracao_minutos INTEGER,
    
    -- Status
    status VARCHAR(20) DEFAULT 'planejada' CHECK (status IN ('planejada', 'em_andamento', 'concluida', 'cancelada')),
    
    -- Materiais
    materiais_necessarios JSONB, -- Array de instrumentos, partituras, etc
    recursos_digitais JSONB, -- Array de links, vídeos, PDFs
    
    -- Observações
    observacoes TEXT,
    observacoes_pos_aula TEXT, -- O que aconteceu na prática
    
    -- Metadados
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- ✅ SISTEMA DE PRESENÇA
-- ============================================

-- Presenças dos alunos nas aulas
CREATE TABLE IF NOT EXISTS presencas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    matricula_id UUID NOT NULL REFERENCES matriculas(id) ON DELETE CASCADE,
    aula_id UUID REFERENCES aulas(id) ON DELETE CASCADE,
    
    -- Status de presença
    presente BOOLEAN DEFAULT FALSE,
    justificado BOOLEAN DEFAULT FALSE,
    justificativa TEXT,
    
    -- Horários
    horario_entrada TIME,
    horario_saida TIME,
    
    -- Observações do professor
    observacoes TEXT,
    
    -- Participação
    nivel_participacao VARCHAR(20) CHECK (nivel_participacao IN ('baixa', 'media', 'alta')),
    
    -- Metadados
    registrado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    registrado_por UUID REFERENCES auth.users(id), -- Quem registrou (professor)
    
    UNIQUE(matricula_id, aula_id)
);

-- ============================================
-- 📝 SISTEMA DE AUDITORIA
-- ============================================

-- Log de atividades importantes do sistema
CREATE TABLE IF NOT EXISTS audit_activities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    
    -- Quem fez
    user_id UUID REFERENCES auth.users(id),
    user_email VARCHAR(255),
    user_role VARCHAR(50),
    
    -- O que foi feito
    acao VARCHAR(100) NOT NULL, -- 'create', 'update', 'delete', 'login', etc
    recurso VARCHAR(100) NOT NULL, -- 'portfolio', 'achievement', 'turma', etc
    recurso_id UUID,
    
    -- Detalhes
    descricao TEXT,
    dados_anteriores JSONB, -- Estado antes da mudança
    dados_novos JSONB, -- Estado depois da mudança
    
    -- Contexto
    ip_address VARCHAR(45),
    user_agent TEXT,
    metadados JSONB,
    
    -- Timestamp
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 📊 ÍNDICES PARA AS NOVAS TABELAS
-- ============================================

-- Achievements - REMOVIDOS (tabela já existe com estrutura diferente no Supabase)
-- Se você criou a tabela achievements por este script, pode descomentar:
-- CREATE INDEX IF NOT EXISTS idx_achievements_nome ON achievements(nome);
-- CREATE INDEX IF NOT EXISTS idx_achievements_categoria ON achievements(categoria);

-- User Achievements
CREATE INDEX IF NOT EXISTS idx_user_achievements_user_id ON user_achievements(user_id);
CREATE INDEX IF NOT EXISTS idx_user_achievements_achievement_id ON user_achievements(achievement_id);
CREATE INDEX IF NOT EXISTS idx_user_achievements_earned_at ON user_achievements(earned_at DESC);

-- Achievements Progress
CREATE INDEX IF NOT EXISTS idx_achievements_progress_user_id ON achievements_progress(user_id);
CREATE INDEX IF NOT EXISTS idx_achievements_progress_achievement_id ON achievements_progress(achievement_id);

-- User Points Log - REMOVIDOS (tabela já existe com estrutura diferente)
-- Se você criou a tabela por este script, pode descomentar:
-- CREATE INDEX IF NOT EXISTS idx_user_points_log_user_id ON user_points_log(user_id);
-- CREATE INDEX IF NOT EXISTS idx_user_points_log_origem ON user_points_log(origem);
-- CREATE INDEX IF NOT EXISTS idx_user_points_log_created_at ON user_points_log(created_at DESC);

-- Turmas - REMOVIDOS (tabela já existe com estrutura diferente)
-- Se você criou a tabela por este script, pode descomentar:
-- CREATE INDEX IF NOT EXISTS idx_turmas_professor_id ON turmas(professor_id);
-- CREATE INDEX IF NOT EXISTS idx_turmas_ativa ON turmas(ativa) WHERE ativa = TRUE;
-- CREATE INDEX IF NOT EXISTS idx_turmas_ativo ON turmas(ativo) WHERE ativo = TRUE;
-- CREATE INDEX IF NOT EXISTS idx_turmas_ano_letivo ON turmas(ano_letivo);

-- Matrículas - REMOVIDOS (tabela já existe com estrutura diferente)
-- Se você criou a tabela por este script, pode descomentar:
-- CREATE INDEX IF NOT EXISTS idx_matriculas_aluno_id ON matriculas(aluno_id);
-- CREATE INDEX IF NOT EXISTS idx_matriculas_turma_id ON matriculas(turma_id);
-- CREATE INDEX IF NOT EXISTS idx_matriculas_status ON matriculas(status);

-- Aulas - REMOVIDOS (tabela já existe com estrutura diferente)
-- Se você criou a tabela por este script, pode descomentar:
-- CREATE INDEX IF NOT EXISTS idx_aulas_turma_id ON aulas(turma_id);
-- CREATE INDEX IF NOT EXISTS idx_aulas_responsavel_id ON aulas(responsavel_id);
-- CREATE INDEX IF NOT EXISTS idx_aulas_data ON aulas(data_aula DESC);
-- CREATE INDEX IF NOT EXISTS idx_aulas_status ON aulas(status);

-- Presenças - REMOVIDOS (tabela já existe com estrutura diferente)
-- Se você criou a tabela por este script, pode descomentar:
-- CREATE INDEX IF NOT EXISTS idx_presencas_matricula_id ON presencas(matricula_id);
-- CREATE INDEX IF NOT EXISTS idx_presencas_aula_id ON presencas(aula_id);

-- Audit Activities
CREATE INDEX IF NOT EXISTS idx_audit_activities_user_id ON audit_activities(user_id);
CREATE INDEX IF NOT EXISTS idx_audit_activities_acao ON audit_activities(acao);
CREATE INDEX IF NOT EXISTS idx_audit_activities_recurso ON audit_activities(recurso);
CREATE INDEX IF NOT EXISTS idx_audit_activities_created_at ON audit_activities(created_at DESC);

-- ============================================
-- 🔒 ROW LEVEL SECURITY (RLS)
-- ============================================

-- Achievements (público para leitura) - DESABILITADO (tabela já existe)
-- ALTER TABLE achievements ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Achievements são visíveis para todos autenticados" ON achievements
--     FOR SELECT USING (auth.uid() IS NOT NULL AND ativo = TRUE);

-- User Achievements (usuário vê apenas os próprios)
ALTER TABLE user_achievements ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Usuários veem suas próprias conquistas" ON user_achievements
    FOR SELECT USING (auth.uid() = user_id);

-- Achievements Progress (usuário vê apenas o próprio)
ALTER TABLE achievements_progress ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Usuários veem seu próprio progresso" ON achievements_progress
    FOR SELECT USING (auth.uid() = user_id);

-- User Points Log (usuário vê apenas o próprio) - DESABILITADO (tabela já existe)
-- ALTER TABLE user_points_log ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Usuários veem seu próprio histórico de pontos" ON user_points_log
--     FOR SELECT USING (auth.uid() = user_id);

-- Turmas (visível para professores e alunos matriculados) - DESABILITADO (tabela já existe)
-- ALTER TABLE turmas ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Turmas visíveis para todos" ON turmas
--     FOR SELECT USING (auth.uid() IS NOT NULL);

-- Matrículas (aluno vê as próprias, professor vê as da turma) - DESABILITADO (tabela já existe)
-- ALTER TABLE matriculas ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Alunos veem suas próprias matrículas" ON matriculas
--     FOR SELECT USING (auth.uid() = aluno_id);

-- Aulas (visível para professor e alunos da turma) - DESABILITADO (tabela já existe)
-- ALTER TABLE aulas ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Aulas visíveis para responsável" ON aulas
--     FOR SELECT USING (auth.uid() = responsavel_id);

-- Presenças (aluno vê as próprias, professor vê todas da turma) - DESABILITADO (tabela já existe)
-- ALTER TABLE presencas ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Presenças visíveis" ON presencas
--     FOR SELECT USING (auth.uid() IS NOT NULL);

-- Audit Activities (apenas admins)
ALTER TABLE audit_activities ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Apenas admins veem audit" ON audit_activities
    FOR SELECT USING (
        auth.uid() IN (
            SELECT id FROM auth.users 
            WHERE raw_user_meta_data->>'tipo_usuario' = 'admin'
        )
    );

-- ============================================
-- 📝 COMENTÁRIOS
-- ============================================

-- COMMENT ON TABLE achievements IS 'Definições de todas as conquistas disponíveis no sistema';
COMMENT ON TABLE user_achievements IS 'Conquistas desbloqueadas pelos usuários';
COMMENT ON TABLE achievements_progress IS 'Progresso em conquistas ainda não completadas';
-- COMMENT ON TABLE user_points_log IS 'Histórico completo de todas as transações de pontos';
-- COMMENT ON TABLE turmas IS 'Turmas/classes do centro de estudos';
-- COMMENT ON TABLE matriculas IS 'Matrículas dos alunos nas turmas';
-- COMMENT ON TABLE aulas IS 'Aulas planejadas e realizadas';
-- COMMENT ON TABLE presencas IS 'Registro de presença dos alunos nas aulas';
COMMENT ON TABLE audit_activities IS 'Log de auditoria de todas as ações importantes no sistema';



