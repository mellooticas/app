# 🚀 GUIA DE EXECUÇÃO DAS MIGRAÇÕES

**Data:** 15/12/2025  
**Banco:** Nipo School  
**Ambiente:** Desenvolvimento → Staging → Produção

---

## 📋 PRÉ-REQUISITOS

### 1. Ferramentas Necessárias
- [ ] PostgreSQL Client (psql) instalado
- [ ] Acesso ao banco de dados com permissões de administrador
- [ ] Git para versionamento
- [ ] Editor SQL (opcional: DBeaver, pgAdmin)

### 2. Backups
```bash
# Criar pasta de backups
mkdir -p backups/$(date +%Y%m%d)

# Backup completo do banco
pg_dump -h localhost -U postgres -d nipo_school \
  -F c -b -v \
  -f "backups/$(date +%Y%m%d)/nipo_school_pre_migration.dump"

# Backup apenas do schema
pg_dump -h localhost -U postgres -d nipo_school \
  --schema-only \
  -f "backups/$(date +%Y%m%d)/nipo_school_schema.sql"

# Backup apenas dos dados
pg_dump -h localhost -U postgres -d nipo_school \
  --data-only \
  -f "backups/$(date +%Y%m%d)/nipo_school_data.sql"
```

### 3. Verificar Estado Atual
```sql
-- Total de tabelas
SELECT COUNT(*) as total_tabelas
FROM information_schema.tables
WHERE table_schema = 'public' AND table_type = 'BASE TABLE';

-- Tabelas sem RLS
SELECT COUNT(*) as sem_rls
FROM pg_tables
WHERE schemaname = 'public' AND rowsecurity = false;

-- Tabelas sem timestamps
SELECT COUNT(*) as sem_created_at
FROM information_schema.tables t
WHERE t.table_schema = 'public'
  AND t.table_type = 'BASE TABLE'
  AND NOT EXISTS (
    SELECT 1 FROM information_schema.columns c
    WHERE c.table_schema = 'public'
      AND c.table_name = t.table_name
      AND c.column_name = 'created_at'
  );
```

---

## 🔥 FASE 1: SEGURANÇA (RLS) - EXECUTAR EM SEQUÊNCIA

### ⚠️ ATENÇÃO CRÍTICA
Após executar a migração 01, **TODAS as queries podem falhar** até que as políticas RLS sejam criadas. Execute as 5 migrações SEM INTERRUPÇÃO!

### Passo 1.1: Habilitar RLS
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/01_habilitar_rls_tabelas_criticas.sql \
  -v ON_ERROR_STOP=1
```

**Verificação:**
```sql
-- Deve retornar 0 (todas as tabelas com RLS)
SELECT COUNT(*) FROM pg_tables
WHERE schemaname = 'public' AND rowsecurity = false;
```

### Passo 1.2: Políticas de Gamificação
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/02_criar_politicas_rls_gamificacao.sql \
  -v ON_ERROR_STOP=1
```

**Verificação:**
```sql
-- Ver políticas criadas
SELECT tablename, policyname
FROM pg_policies
WHERE schemaname = 'public'
  AND tablename LIKE 'alpha%'
ORDER BY tablename, policyname;
```

### Passo 1.3: Políticas de Fórum
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/03_criar_politicas_rls_forum.sql \
  -v ON_ERROR_STOP=1
```

### Passo 1.4: Políticas de Instrumentos
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/04_criar_politicas_rls_instrumentos.sql \
  -v ON_ERROR_STOP=1
```

### Passo 1.5: Políticas de Avaliações
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/05_criar_politicas_rls_avaliacoes.sql \
  -v ON_ERROR_STOP=1
```

**Verificação Final de RLS:**
```sql
-- Total de políticas criadas
SELECT COUNT(*) as total_policies FROM pg_policies
WHERE schemaname = 'public';

-- Tabelas ainda sem políticas
SELECT t.tablename
FROM pg_tables t
WHERE t.schemaname = 'public'
  AND t.rowsecurity = true
  AND NOT EXISTS (
    SELECT 1 FROM pg_policies p
    WHERE p.schemaname = 'public'
      AND p.tablename = t.tablename
  );
```

### 🧪 Teste da Aplicação Pós-RLS
```bash
# Reinicie o servidor da aplicação
npm run dev

# Teste cada funcionalidade:
# 1. Login de aluno
# 2. Login de professor
# 3. Login de admin
# 4. Visualizar aulas
# 5. Visualizar badges
# 6. Criar pergunta no fórum
# 7. Visualizar instrumentos
```

**Se algum teste falhar:**
1. Verifique os logs da aplicação
2. Verifique os logs do PostgreSQL
3. Revise as políticas RLS criadas
4. Considere fazer rollback se necessário

---

## ✅ FASE 2: VALIDAÇÃO

### Passo 2.1: Validar Emails ANTES
```sql
-- Listar emails inválidos
SELECT id, nome, email
FROM profiles
WHERE email IS NOT NULL
  AND email !~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';

-- Se houver emails inválidos, corrija:
UPDATE profiles
SET email = NULL  -- ou corrija para email válido
WHERE email IS NOT NULL
  AND email !~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
```

### Passo 2.2: Executar Validação de Emails
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/06_adicionar_validacao_emails.sql \
  -v ON_ERROR_STOP=1
```

**Teste:**
```sql
-- Deve falhar (email inválido)
INSERT INTO profiles (id, email) VALUES (gen_random_uuid(), 'invalido');

-- Deve funcionar
INSERT INTO profiles (id, email) VALUES (gen_random_uuid(), 'teste@exemplo.com');
```

### Passo 2.3: Criar ENUMs de Status
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/07_criar_enums_status.sql \
  -v ON_ERROR_STOP=1
```

**Verificação:**
```sql
-- Listar ENUMs criados
SELECT typname, enumlabel
FROM pg_type t
JOIN pg_enum e ON t.oid = e.enumtypid
WHERE typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public')
  AND typname LIKE '%_type'
ORDER BY typname, enumlabel;
```

### Passo 2.4: Validação de Números
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/08_adicionar_validacao_numeros.sql \
  -v ON_ERROR_STOP=1
```

**Teste:**
```sql
-- Deve falhar (nota > 10)
UPDATE aula_avaliacoes SET nota = 15 WHERE id = (SELECT id FROM aula_avaliacoes LIMIT 1);

-- Deve funcionar
UPDATE aula_avaliacoes SET nota = 9.5 WHERE id = (SELECT id FROM aula_avaliacoes LIMIT 1);
```

---

## 📝 FASE 3: AUDITORIA

### Passo 3.1: Timestamps Parte 1
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/09_adicionar_timestamps_parte1.sql \
  -v ON_ERROR_STOP=1
```

### Passo 3.2: Timestamps Parte 2
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/10_adicionar_timestamps_parte2.sql \
  -v ON_ERROR_STOP=1
```

**Verificação:**
```sql
-- Tabelas com created_at
SELECT COUNT(*) as tabelas_com_timestamps
FROM (
  SELECT DISTINCT table_name
  FROM information_schema.columns
  WHERE table_schema = 'public'
    AND column_name = 'created_at'
) t;

-- Testar trigger de updated_at
UPDATE profiles SET nome = 'Teste'
WHERE id = (SELECT id FROM profiles LIMIT 1)
RETURNING id, updated_at;
-- updated_at deve ser alterado automaticamente
```

### Passo 3.3: Soft Delete
```bash
psql -h localhost -U postgres -d nipo_school \
  -f docs/migrations/11_adicionar_soft_delete.sql \
  -v ON_ERROR_STOP=1
```

**Teste:**
```sql
-- Criar aula teste
INSERT INTO aulas (id, titulo, responsavel_id)
VALUES (gen_random_uuid(), 'Teste Soft Delete', (SELECT id FROM professores LIMIT 1))
RETURNING id;

-- Soft delete
SELECT soft_delete('aulas', '<id-da-aula>');

-- Verificar que ainda existe
SELECT id, titulo, deleted_at FROM aulas WHERE id = '<id-da-aula>';

-- Ver apenas ativas
SELECT * FROM aulas_ativas;

-- Restaurar
SELECT restore_deleted('aulas', '<id-da-aula>');
```

---

## 📊 VERIFICAÇÃO FINAL

### Script de Verificação Completo
```sql
-- Criar função de verificação
CREATE OR REPLACE FUNCTION check_migration_status()
RETURNS TABLE (
    categoria TEXT,
    total INTEGER,
    implementado INTEGER,
    percentual NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    
    -- RLS
    SELECT
        'RLS Habilitado'::TEXT,
        (SELECT COUNT(*)::INTEGER FROM pg_tables WHERE schemaname = 'public'),
        (SELECT COUNT(*)::INTEGER FROM pg_tables WHERE schemaname = 'public' AND rowsecurity = true),
        ROUND((SELECT COUNT(*)::NUMERIC FROM pg_tables WHERE schemaname = 'public' AND rowsecurity = true) /
              (SELECT COUNT(*) FROM pg_tables WHERE schemaname = 'public') * 100, 2)
    
    UNION ALL
    
    -- Políticas RLS
    SELECT
        'Políticas RLS'::TEXT,
        37, -- tabelas que precisavam
        (SELECT COUNT(DISTINCT tablename)::INTEGER FROM pg_policies WHERE schemaname = 'public'),
        ROUND((SELECT COUNT(DISTINCT tablename)::NUMERIC FROM pg_policies WHERE schemaname = 'public') / 37 * 100, 2)
    
    UNION ALL
    
    -- Timestamps
    SELECT
        'Tabelas com Timestamps'::TEXT,
        31, -- tabelas que precisavam
        (SELECT COUNT(DISTINCT table_name)::INTEGER 
         FROM information_schema.columns 
         WHERE table_schema = 'public' 
           AND column_name = 'created_at'
           AND table_name IN (
             'admins', 'alunos', 'professores', 'turmas', 'aulas',
             'matriculas', 'profiles', 'instrumentos', 'presencas'
           )),
        ROUND((SELECT COUNT(DISTINCT table_name)::NUMERIC 
               FROM information_schema.columns 
               WHERE table_schema = 'public' AND column_name = 'created_at') / 31 * 100, 2)
    
    UNION ALL
    
    -- ENUMs
    SELECT
        'ENUMs Criados'::TEXT,
        10, -- ENUMs planejados
        (SELECT COUNT(*)::INTEGER FROM pg_type 
         WHERE typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public')
           AND typtype = 'e'
           AND typname LIKE '%_type'),
        ROUND((SELECT COUNT(*)::NUMERIC FROM pg_type 
               WHERE typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public')
                 AND typtype = 'e' AND typname LIKE '%_type') / 10 * 100, 2);
END;
$$ LANGUAGE plpgsql;

-- Executar verificação
SELECT * FROM check_migration_status();
```

### Relatório de Status
```sql
-- Gerar relatório completo
\pset format wrapped
\pset columns 100

SELECT
    'RELATÓRIO DE MIGRAÇÕES' as titulo,
    to_char(CURRENT_TIMESTAMP, 'DD/MM/YYYY HH24:MI:SS') as data_hora;

SELECT * FROM check_migration_status();

-- Detalhes RLS
SELECT
    tablename,
    CASE WHEN rowsecurity THEN '✅' ELSE '❌' END as rls,
    COUNT(p.policyname) as policies
FROM pg_tables t
LEFT JOIN pg_policies p ON p.tablename = t.tablename AND p.schemaname = 'public'
WHERE t.schemaname = 'public'
GROUP BY t.tablename, t.rowsecurity
ORDER BY policies DESC, tablename;
```

---

## 🔄 ROLLBACK (Em caso de emergência)

### Rollback Completo
```bash
# Restaurar backup
pg_restore -h localhost -U postgres -d nipo_school \
  --clean --if-exists \
  "backups/$(date +%Y%m%d)/nipo_school_pre_migration.dump"
```

### Rollback Parcial (por migração)

#### Rollback RLS (Migrações 01-05)
```sql
BEGIN;
-- Remover políticas
DROP POLICY IF EXISTS aluno_ve_proprias_badges ON alpha_aluno_badges;
-- ... (remover todas as políticas)

-- Desabilitar RLS
ALTER TABLE alpha_aluno_badges DISABLE ROW LEVEL SECURITY;
-- ... (desabilitar em todas as 37 tabelas)
COMMIT;
```

#### Rollback Validações (Migrações 06-08)
```sql
BEGIN;
ALTER TABLE profiles DROP CONSTRAINT IF EXISTS check_profiles_email_format;
DROP TYPE IF EXISTS status_type CASCADE;
ALTER TABLE aula_avaliacoes DROP CONSTRAINT IF EXISTS check_nota_valida;
DROP FUNCTION IF EXISTS is_valid_email(TEXT);
COMMIT;
```

#### Rollback Timestamps (Migrações 09-10)
```sql
BEGIN;
ALTER TABLE profiles DROP COLUMN IF EXISTS created_at;
ALTER TABLE profiles DROP COLUMN IF EXISTS updated_at;
-- ... (para todas as tabelas)
DROP FUNCTION IF EXISTS update_updated_at_column();
COMMIT;
```

---

## 📞 SUPORTE E TROUBLESHOOTING

### Problemas Comuns

#### 1. RLS bloqueando acesso
**Sintoma:** Queries retornam vazio após migração 01

**Solução:**
```sql
-- Verificar se as políticas foram criadas
SELECT tablename, policyname FROM pg_policies
WHERE schemaname = 'public' AND tablename = '<tabela-problema>';

-- Temporariamente desabilitar RLS para debug
ALTER TABLE <tabela> DISABLE ROW LEVEL SECURITY;
```

#### 2. Constraint de email falhando
**Sintoma:** Erro ao inserir/atualizar profiles

**Solução:**
```sql
-- Listar emails inválidos
SELECT id, email FROM profiles
WHERE email IS NOT NULL AND NOT is_valid_email(email);

-- Corrigir ou remover
UPDATE profiles SET email = NULL WHERE id = '<id>';
```

#### 3. Migração de ENUM falhando
**Sintoma:** Erro "tipo não existe" ou valores incompatíveis

**Solução:**
```sql
-- Padronizar valores antes
UPDATE aulas SET status = lower(trim(status));

-- Depois aplicar ENUM
ALTER TABLE aulas ALTER COLUMN status TYPE aula_status_type
USING status::aula_status_type;
```

### Logs e Monitoramento
```bash
# Logs do PostgreSQL
tail -f /var/log/postgresql/postgresql-*.log

# Query lenta (se performance cair)
SELECT pid, query, state, wait_event
FROM pg_stat_activity
WHERE state != 'idle' AND query NOT LIKE '%pg_stat%'
ORDER BY query_start;
```

---

## ✅ CHECKLIST FINAL

- [ ] Backup completo realizado
- [ ] Fase 1 (RLS) executada e testada
- [ ] Aplicação funcionando após RLS
- [ ] Fase 2 (Validação) executada
- [ ] Fase 3 (Auditoria) executada
- [ ] Verificação final passou 100%
- [ ] Documentação atualizada
- [ ] Equipe notificada
- [ ] Monitoramento ativo

---

**Boa sorte com as migrações! 🚀**

**Em caso de dúvidas, consulte:**
- `00_README_PLANO_MIGRACOES.md`
- `01_RESUMO_MIGRACOES.md`
- Documentação do PostgreSQL
- Logs da aplicação
