-- =====================================================================
-- MIGRAÇÃO 09: ADICIONAR TIMESTAMPS - PARTE 1
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🟡 ALTO
-- Descrição: Adiciona created_at e updated_at em 15 tabelas (parte 1 de 2)
-- =====================================================================

BEGIN;

-- =====================================================================
-- FUNÇÃO AUXILIAR PARA ATUALIZAR updated_at
-- =====================================================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION update_updated_at_column() IS
'Função de trigger para atualizar automaticamente a coluna updated_at';

-- =====================================================================
-- 1. ADMINS
-- =====================================================================

ALTER TABLE admins ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE admins ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_admins_updated_at
    BEFORE UPDATE ON admins
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 2. ALUNOS
-- =====================================================================

ALTER TABLE alunos ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE alunos ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_alunos_updated_at
    BEFORE UPDATE ON alunos
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 3. PROFESSORES
-- =====================================================================

ALTER TABLE professores ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE professores ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_professores_updated_at
    BEFORE UPDATE ON professores
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 4. TURMAS
-- =====================================================================

ALTER TABLE turmas ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE turmas ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_turmas_updated_at
    BEFORE UPDATE ON turmas
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 5. AULAS
-- =====================================================================

ALTER TABLE aulas ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE aulas ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_aulas_updated_at
    BEFORE UPDATE ON aulas
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 6. MATRICULAS
-- =====================================================================

ALTER TABLE matriculas ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE matriculas ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_matriculas_updated_at
    BEFORE UPDATE ON matriculas
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 7. PROFILES
-- =====================================================================

ALTER TABLE profiles ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE profiles ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_profiles_updated_at
    BEFORE UPDATE ON profiles
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 8. INSTRUMENTOS
-- =====================================================================

ALTER TABLE instrumentos ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE instrumentos ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_instrumentos_updated_at
    BEFORE UPDATE ON instrumentos
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 9. HISTORICO_INSTRUMENTOS
-- =====================================================================

ALTER TABLE historico_instrumentos ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE historico_instrumentos ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_historico_instrumentos_updated_at
    BEFORE UPDATE ON historico_instrumentos
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 10. PROFESSOR_INSTRUMENTOS
-- =====================================================================

ALTER TABLE professor_instrumentos ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE professor_instrumentos ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_professor_instrumentos_updated_at
    BEFORE UPDATE ON professor_instrumentos
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 11. PRESENCAS
-- =====================================================================

ALTER TABLE presencas ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE presencas ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_presencas_updated_at
    BEFORE UPDATE ON presencas
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 12. QR_SCANS
-- =====================================================================

ALTER TABLE qr_scans ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE qr_scans ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_qr_scans_updated_at
    BEFORE UPDATE ON qr_scans
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 13. USER_ACHIEVEMENTS
-- =====================================================================

ALTER TABLE user_achievements ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE user_achievements ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_user_achievements_updated_at
    BEFORE UPDATE ON user_achievements
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 14. USER_PROGRESS
-- =====================================================================

ALTER TABLE user_progress ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE user_progress ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER update_user_progress_updated_at
    BEFORE UPDATE ON user_progress
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================================
-- 15. USUARIOS
-- =====================================================================

-- Verifica se é tabela
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'public'
            AND table_name = 'usuarios'
            AND table_type = 'BASE TABLE'
    ) THEN
        ALTER TABLE usuarios ADD COLUMN created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
        ALTER TABLE usuarios ADD COLUMN updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;
        
        CREATE TRIGGER update_usuarios_updated_at
            BEFORE UPDATE ON usuarios
            FOR EACH ROW
            EXECUTE FUNCTION update_updated_at_column();
        
        RAISE NOTICE '✅ Timestamps adicionados em usuarios';
    ELSE
        RAISE NOTICE 'ℹ️ usuarios é uma view - timestamps não aplicáveis';
    END IF;
END $$;

-- =====================================================================
-- POPULA created_at PARA REGISTROS EXISTENTES
-- =====================================================================

-- Para registros que já existem, define created_at como data mais antiga possível
-- ou usa informação de outras tabelas se disponível

UPDATE admins SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;
UPDATE alunos SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;
UPDATE professores SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;
UPDATE turmas SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;
UPDATE aulas SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;
UPDATE matriculas SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;
UPDATE profiles SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;
UPDATE instrumentos SET created_at = COALESCE(created_at, '2024-01-01'::timestamptz) WHERE created_at IS NULL;

-- =====================================================================
-- ADICIONA COMENTÁRIOS
-- =====================================================================

COMMENT ON COLUMN admins.created_at IS 'Data de criação do registro';
COMMENT ON COLUMN admins.updated_at IS 'Data da última atualização do registro';
COMMENT ON COLUMN alunos.created_at IS 'Data de cadastro do aluno';
COMMENT ON COLUMN alunos.updated_at IS 'Data da última atualização do cadastro';
COMMENT ON COLUMN professores.created_at IS 'Data de cadastro do professor';
COMMENT ON COLUMN professores.updated_at IS 'Data da última atualização do cadastro';
COMMENT ON COLUMN turmas.created_at IS 'Data de criação da turma';
COMMENT ON COLUMN turmas.updated_at IS 'Data da última modificação da turma';
COMMENT ON COLUMN aulas.created_at IS 'Data de criação do planejamento da aula';
COMMENT ON COLUMN aulas.updated_at IS 'Data da última modificação da aula';

-- =====================================================================
-- VERIFICAÇÃO
-- =====================================================================

DO $$
DECLARE
    tabelas_com_timestamps INTEGER;
    total_triggers INTEGER;
BEGIN
    -- Conta tabelas que agora têm created_at
    SELECT COUNT(DISTINCT table_name) INTO tabelas_com_timestamps
    FROM information_schema.columns
    WHERE table_schema = 'public'
        AND column_name = 'created_at'
        AND table_name IN (
            'admins', 'alunos', 'professores', 'turmas', 'aulas',
            'matriculas', 'profiles', 'instrumentos', 'historico_instrumentos',
            'professor_instrumentos', 'presencas', 'qr_scans',
            'user_achievements', 'user_progress', 'usuarios'
        );
    
    -- Conta triggers criados
    SELECT COUNT(*) INTO total_triggers
    FROM information_schema.triggers
    WHERE trigger_schema = 'public'
        AND trigger_name LIKE '%_updated_at';
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'MIGRAÇÃO 09 CONCLUÍDA';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'Tabelas com timestamps: %/15', tabelas_com_timestamps;
    RAISE NOTICE 'Triggers criados: %', total_triggers;
    RAISE NOTICE '===================================';
    RAISE NOTICE '✅ Timestamps adicionados (Parte 1)';
    RAISE NOTICE '📝 Execute Migração 10 para parte 2';
    RAISE NOTICE '===================================';
END $$;

COMMIT;

-- =====================================================================
-- ROLLBACK (se necessário)
-- =====================================================================
--
-- Para reverter esta migração:
-- ATENÇÃO: Você perderá os dados de created_at/updated_at!
--
/*
BEGIN;
ALTER TABLE admins DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE alunos DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE professores DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE turmas DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE aulas DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE matriculas DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE profiles DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE instrumentos DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE historico_instrumentos DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE professor_instrumentos DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE presencas DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE qr_scans DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE user_achievements DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE user_progress DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
ALTER TABLE usuarios DROP COLUMN IF EXISTS created_at, DROP COLUMN IF EXISTS updated_at;
DROP FUNCTION IF EXISTS update_updated_at_column();
COMMIT;
*/
--
-- =====================================================================
