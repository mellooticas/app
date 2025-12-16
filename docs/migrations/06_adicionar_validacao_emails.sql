-- =====================================================================
-- MIGRAÇÃO 06: ADICIONAR VALIDAÇÃO DE E-MAILS
-- =====================================================================
-- Data: 2025-12-15
-- Prioridade: 🟡 ALTO
-- Descrição: Adiciona CHECK constraints para validar formato de email
-- =====================================================================

BEGIN;

-- =====================================================================
-- FUNÇÃO DE VALIDAÇÃO DE EMAIL
-- =====================================================================

CREATE OR REPLACE FUNCTION is_valid_email(email TEXT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- =====================================================================
-- PROFILES
-- =====================================================================

-- Adiciona constraint de validação
ALTER TABLE profiles
ADD CONSTRAINT check_profiles_email_format
CHECK (email IS NULL OR is_valid_email(email));

COMMENT ON CONSTRAINT check_profiles_email_format ON profiles IS
'Valida que o email está em formato correto (ex: usuario@dominio.com)';

-- =====================================================================
-- ADMIN_ALUNOS (VIEW - não pode ter constraint, apenas comentário)
-- =====================================================================

-- Esta é uma view, a validação virá da tabela base (profiles/alunos)
COMMENT ON COLUMN admin_alunos.email IS
'Email do aluno - validado na tabela profiles';

-- =====================================================================
-- ADMIN_PROFESSORES (VIEW - não pode ter constraint)
-- =====================================================================

COMMENT ON COLUMN admin_professores.email IS
'Email do professor - validado na tabela profiles';

-- =====================================================================
-- ADMIN_USUARIOS_COMPLETOS (VIEW - não pode ter constraint)
-- =====================================================================

COMMENT ON COLUMN admin_usuarios_completos.email IS
'Email do usuário - validado na tabela profiles';

-- =====================================================================
-- USUARIOS (se for tabela, adicionar constraint)
-- =====================================================================

-- Verifica se 'usuarios' é uma tabela ou view
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'public'
            AND table_name = 'usuarios'
            AND table_type = 'BASE TABLE'
    ) THEN
        -- É tabela, adiciona constraint
        ALTER TABLE usuarios
        ADD CONSTRAINT check_usuarios_email_format
        CHECK (email IS NULL OR is_valid_email(email));
        
        RAISE NOTICE '✅ Constraint adicionada em usuarios';
    ELSE
        -- É view ou não existe
        RAISE NOTICE 'ℹ️ usuarios é uma view ou não existe - constraint não necessária';
    END IF;
END $$;

-- =====================================================================
-- VALIDAÇÃO DOS DADOS EXISTENTES
-- =====================================================================

-- Verifica se há emails inválidos no banco
DO $$
DECLARE
    invalid_emails_count INTEGER;
    sample_invalid TEXT;
BEGIN
    -- Conta emails inválidos em profiles
    SELECT COUNT(*), MIN(email) INTO invalid_emails_count, sample_invalid
    FROM profiles
    WHERE email IS NOT NULL
        AND NOT is_valid_email(email);
    
    IF invalid_emails_count > 0 THEN
        RAISE WARNING '⚠️ ATENÇÃO: % emails inválidos encontrados em profiles', invalid_emails_count;
        RAISE WARNING '⚠️ Exemplo: %', sample_invalid;
        RAISE WARNING '⚠️ Corrija estes emails antes de ativar a constraint!';
        RAISE WARNING '⚠️ Query para listar: SELECT id, nome, email FROM profiles WHERE email IS NOT NULL AND NOT is_valid_email(email);';
    ELSE
        RAISE NOTICE '✅ Todos os emails em profiles são válidos!';
    END IF;
END $$;

-- =====================================================================
-- EXEMPLOS DE EMAILS VÁLIDOS E INVÁLIDOS
-- =====================================================================

-- Query para testar a validação:
/*
SELECT 
    email,
    is_valid_email(email) as valido
FROM (VALUES
    ('usuario@exemplo.com'),      -- ✅ válido
    ('nome.sobrenome@escola.br'), -- ✅ válido
    ('aluno123@gmail.com'),       -- ✅ válido
    ('teste+tag@dominio.org'),    -- ✅ válido
    ('invalido'),                 -- ❌ inválido
    ('sem@arroba'),               -- ❌ inválido
    ('123'),                      -- ❌ inválido
    ('@dominio.com'),             -- ❌ inválido
    ('usuario@'),                 -- ❌ inválido
    (NULL)                        -- ✅ NULL é permitido
) AS test(email);
*/

-- =====================================================================
-- SCRIPT PARA CORREÇÃO DE EMAILS INVÁLIDOS
-- =====================================================================

-- Use este script para corrigir emails inválidos ANTES de rodar a migração:
/*
UPDATE profiles
SET email = NULL  -- ou corrija para o email correto
WHERE email IS NOT NULL
    AND NOT is_valid_email(email);
*/

-- =====================================================================
-- VERIFICAÇÃO FINAL
-- =====================================================================

DO $$
DECLARE
    total_constraints INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_constraints
    FROM information_schema.check_constraints
    WHERE constraint_schema = 'public'
        AND constraint_name LIKE '%email_format%';
    
    RAISE NOTICE '===================================';
    RAISE NOTICE 'MIGRAÇÃO 06 CONCLUÍDA';
    RAISE NOTICE '===================================';
    RAISE NOTICE 'Constraints de email criadas: %', total_constraints;
    RAISE NOTICE 'Função de validação: is_valid_email()';
    RAISE NOTICE '===================================';
    RAISE NOTICE '✅ Emails agora são validados!';
    RAISE NOTICE '===================================';
END $$;

COMMIT;

-- =====================================================================
-- ROLLBACK (se necessário)
-- =====================================================================
--
-- Para reverter esta migração:
-- 
-- BEGIN;
-- ALTER TABLE profiles DROP CONSTRAINT IF EXISTS check_profiles_email_format;
-- ALTER TABLE usuarios DROP CONSTRAINT IF EXISTS check_usuarios_email_format;
-- DROP FUNCTION IF EXISTS is_valid_email(TEXT);
-- COMMIT;
--
-- =====================================================================
