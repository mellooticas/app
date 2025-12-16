-- =====================================================================
-- MIGRAÇÃO 07: CRIAR ENUMS PARA CAMPOS DE STATUS
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🟡 ALTO
-- Descrição: Cria tipos ENUM para padronizar valores de status/estado
-- =====================================================================

BEGIN;

-- =====================================================================
-- 1. ENUM PARA STATUS GERAL
-- =====================================================================

CREATE TYPE status_type AS ENUM (
    'ativo',
    'inativo',
    'pendente',
    'concluido',
    'cancelado',
    'arquivado'
);

-- =====================================================================
-- 2. ENUM PARA STATUS DE AULAS
-- =====================================================================

CREATE TYPE aula_status_type AS ENUM (
    'rascunho',
    'planejada',
    'em_andamento',
    'concluida',
    'cancelada',
    'reagendada'
);

-- =====================================================================
-- 3. ENUM PARA STATUS DE MATRÍCULAS
-- =====================================================================

CREATE TYPE matricula_status_type AS ENUM (
    'ativa',
    'trancada',
    'concluida',
    'cancelada',
    'transferida'
);

-- =====================================================================
-- 4. ENUM PARA STATUS DE CESSÃO DE INSTRUMENTOS
-- =====================================================================

CREATE TYPE cessao_status_type AS ENUM (
    'emprestado',
    'devolvido',
    'atrasado',
    'danificado',
    'perdido'
);

-- =====================================================================
-- 5. ENUM PARA ESTADO DE INSTRUMENTOS
-- =====================================================================

CREATE TYPE instrumento_estado_type AS ENUM (
    'excelente',
    'bom',
    'regular',
    'necessita_reparo',
    'inutilizavel'
);

-- =====================================================================
-- 6. ENUM PARA STATUS DE MANUTENÇÃO
-- =====================================================================

CREATE TYPE manutencao_status_type AS ENUM (
    'agendada',
    'em_andamento',
    'concluida',
    'cancelada',
    'aguardando_pecas'
);

-- =====================================================================
-- 7. ENUM PARA STATUS DE PORTFOLIO
-- =====================================================================

CREATE TYPE portfolio_status_type AS ENUM (
    'rascunho',
    'em_revisao',
    'aprovado',
    'rejeitado',
    'publicado'
);

-- =====================================================================
-- 8. ENUM PARA STATUS DE FORUM
-- =====================================================================

CREATE TYPE forum_status_type AS ENUM (
    'aberta',
    'respondida',
    'fechada',
    'arquivada',
    'spam'
);

-- =====================================================================
-- 9. ENUM PARA STATUS DE DESAFIOS/SUBMISSÕES
-- =====================================================================

CREATE TYPE desafio_status_type AS ENUM (
    'nao_iniciado',
    'em_andamento',
    'submetido',
    'em_avaliacao',
    'aprovado',
    'reprovado',
    'refazer'
);

-- =====================================================================
-- 10. ENUM PARA STATUS DE TURMAS
-- =====================================================================

CREATE TYPE turma_status_type AS ENUM (
    'planejada',
    'inscricoes_abertas',
    'em_andamento',
    'concluida',
    'cancelada'
);

-- =====================================================================
-- COMENTÁRIOS DOS ENUMS
-- =====================================================================

COMMENT ON TYPE status_type IS 'Status genérico usado em várias tabelas';
COMMENT ON TYPE aula_status_type IS 'Status específico para aulas';
COMMENT ON TYPE matricula_status_type IS 'Status de matrícula do aluno';
COMMENT ON TYPE cessao_status_type IS 'Status de empréstimo de instrumentos';
COMMENT ON TYPE instrumento_estado_type IS 'Estado físico do instrumento';
COMMENT ON TYPE manutencao_status_type IS 'Status de manutenção de instrumentos';
COMMENT ON TYPE portfolio_status_type IS 'Status de portfolio do aluno';
COMMENT ON TYPE forum_status_type IS 'Status de perguntas no fórum';
COMMENT ON TYPE desafio_status_type IS 'Status de desafios e submissões';
COMMENT ON TYPE turma_status_type IS 'Status de turmas';

-- =====================================================================
-- VERIFICAÇÃO
-- =====================================================================

DO $$
DECLARE
    total_enums INTEGER;
    enum_list TEXT;
BEGIN
    SELECT COUNT(*), string_agg(typname, ', ')
    INTO total_enums, enum_list
    FROM pg_type
    WHERE typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public')
        AND typtype = 'e'
        AND typname LIKE '%_type';
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'MIGRAÇÃO 07 CONCLUÍDA';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'ENUMs criados: %', total_enums;
    RAISE NOTICE 'Lista: %', enum_list;
    RAISE NOTICE '===================================';
    RAISE NOTICE '✅ Próximo passo: Alterar colunas';
    RAISE NOTICE '   para usar os ENUMs criados';
    RAISE NOTICE '===================================';
END $$;

-- =====================================================================
-- IMPORTANTE: ALTERAÇÃO DAS COLUNAS
-- =====================================================================
--
-- Esta migração apenas CRIA os tipos ENUM.
-- Para APLICAR os ENUMs nas tabelas existentes, você precisará:
--
-- 1. Padronizar os valores existentes nas tabelas
-- 2. Alterar o tipo da coluna
--
-- Exemplo para tabela 'aulas':
--
-- -- 1. Padronizar valores
-- UPDATE aulas SET status = 'planejada' WHERE status = 'Planejada';
-- UPDATE aulas SET status = 'planejada' WHERE status = 'PLANEJADA';
--
-- -- 2. Alterar tipo da coluna
-- ALTER TABLE aulas 
-- ALTER COLUMN status TYPE aula_status_type 
-- USING status::aula_status_type;
--
-- =====================================================================

-- =====================================================================
-- SCRIPT DE MIGRAÇÃO DAS TABELAS (executar separadamente)
-- =====================================================================
/*

-- AULAS
UPDATE aulas SET status = lower(trim(status)) WHERE status IS NOT NULL;
ALTER TABLE aulas 
ALTER COLUMN status TYPE aula_status_type 
USING CASE 
    WHEN status IN ('rascunho', 'planejada', 'em_andamento', 'concluida', 'cancelada', 'reagendada')
    THEN status::aula_status_type
    ELSE 'planejada'::aula_status_type
END;

-- MATRICULAS
UPDATE matriculas SET status = lower(trim(status)) WHERE status IS NOT NULL;
ALTER TABLE matriculas 
ALTER COLUMN status TYPE matricula_status_type 
USING CASE 
    WHEN status IN ('ativa', 'trancada', 'concluida', 'cancelada', 'transferida')
    THEN status::matricula_status_type
    ELSE 'ativa'::matricula_status_type
END;

-- CESSOES_INSTRUMENTOS
UPDATE cessoes_instrumentos SET status = lower(trim(status)) WHERE status IS NOT NULL;
ALTER TABLE cessoes_instrumentos 
ALTER COLUMN status TYPE cessao_status_type 
USING CASE 
    WHEN status IN ('emprestado', 'devolvido', 'atrasado', 'danificado', 'perdido')
    THEN status::cessao_status_type
    ELSE 'emprestado'::cessao_status_type
END;

-- INSTRUMENTOS_FISICOS
UPDATE instrumentos_fisicos SET estado = lower(trim(estado)) WHERE estado IS NOT NULL;
ALTER TABLE instrumentos_fisicos 
ALTER COLUMN estado TYPE instrumento_estado_type 
USING CASE 
    WHEN estado IN ('excelente', 'bom', 'regular', 'necessita_reparo', 'inutilizavel')
    THEN estado::instrumento_estado_type
    ELSE 'bom'::instrumento_estado_type
END;

-- PORTFOLIOS
UPDATE portfolios SET status = lower(trim(status)) WHERE status IS NOT NULL;
ALTER TABLE portfolios 
ALTER COLUMN status TYPE portfolio_status_type 
USING CASE 
    WHEN status IN ('rascunho', 'em_revisao', 'aprovado', 'rejeitado', 'publicado')
    THEN status::portfolio_status_type
    ELSE 'rascunho'::portfolio_status_type
END;

-- FORUM_PERGUNTAS
UPDATE forum_perguntas SET status = lower(trim(status)) WHERE status IS NOT NULL;
ALTER TABLE forum_perguntas 
ALTER COLUMN status TYPE forum_status_type 
USING CASE 
    WHEN status IN ('aberta', 'respondida', 'fechada', 'arquivada', 'spam')
    THEN status::forum_status_type
    ELSE 'aberta'::forum_status_type
END;

-- TURMAS
UPDATE turmas SET status = lower(trim(status)) WHERE status IS NOT NULL;
ALTER TABLE turmas 
ALTER COLUMN status TYPE turma_status_type 
USING CASE 
    WHEN status IN ('planejada', 'inscricoes_abertas', 'em_andamento', 'concluida', 'cancelada')
    THEN status::turma_status_type
    ELSE 'planejada'::turma_status_type
END;

*/

COMMIT;

-- =====================================================================
-- ROLLBACK (se necessário)
-- =====================================================================
--
-- ATENÇÃO: Só execute o rollback se NÃO tiver alterado as colunas ainda!
--
-- BEGIN;
-- DROP TYPE IF EXISTS status_type CASCADE;
-- DROP TYPE IF EXISTS aula_status_type CASCADE;
-- DROP TYPE IF EXISTS matricula_status_type CASCADE;
-- DROP TYPE IF EXISTS cessao_status_type CASCADE;
-- DROP TYPE IF EXISTS instrumento_estado_type CASCADE;
-- DROP TYPE IF EXISTS manutencao_status_type CASCADE;
-- DROP TYPE IF EXISTS portfolio_status_type CASCADE;
-- DROP TYPE IF EXISTS forum_status_type CASCADE;
-- DROP TYPE IF EXISTS desafio_status_type CASCADE;
-- DROP TYPE IF EXISTS turma_status_type CASCADE;
-- COMMIT;
--
-- =====================================================================
