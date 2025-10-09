-- LIMPEZA TOTAL E RECRIAÇÃO DAS POLÍTICAS RLS

-- 1. Desabilitar RLS temporariamente
ALTER TABLE profiles DISABLE ROW LEVEL SECURITY;

-- 2. DELETAR TODAS as políticas antigas
DROP POLICY IF EXISTS "Usuários podem criar próprio perfil" ON profiles;
DROP POLICY IF EXISTS "profiles_insert_simple" ON profiles;
DROP POLICY IF EXISTS "profiles_insert_service_simple" ON profiles;
DROP POLICY IF EXISTS "Permitir leitura de todos os profiles" ON profiles;
DROP POLICY IF EXISTS "admins_select_all_profiles" ON profiles;
DROP POLICY IF EXISTS "authenticated_users_select_own_profile" ON profiles;
DROP POLICY IF EXISTS "profiles_select_simple" ON profiles;
DROP POLICY IF EXISTS "profiles_update_simple" ON profiles;
DROP POLICY IF EXISTS "Usuários podem editar próprio perfil" ON profiles;
DROP POLICY IF EXISTS "authenticated_users_update_own_profile" ON profiles;
DROP POLICY IF EXISTS "authenticated_users_insert_own_profile" ON profiles;
DROP POLICY IF EXISTS "Users can view own profile" ON profiles;
DROP POLICY IF EXISTS "Users can update own profile" ON profiles;
DROP POLICY IF EXISTS "Users can insert own profile" ON profiles;

-- 3. Habilitar RLS
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- 4. Criar APENAS 3 políticas simples e funcionais

-- Política 1: SELECT - Usuários autenticados podem ler PRÓPRIO perfil
CREATE POLICY "select_own_profile"
ON profiles
FOR SELECT
TO authenticated
USING (auth.uid() = id);

-- Política 2: UPDATE - Usuários autenticados podem atualizar PRÓPRIO perfil  
CREATE POLICY "update_own_profile"
ON profiles
FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

-- Política 3: INSERT - Permitir criação de perfil após signup
CREATE POLICY "insert_own_profile"
ON profiles
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = id);

-- 5. Verificar políticas criadas
SELECT 
  policyname,
  cmd,
  qual
FROM pg_policies 
WHERE tablename = 'profiles'
ORDER BY cmd, policyname;

-- 6. Testar se funciona
SELECT 
  'Teste de leitura' as teste,
  current_setting('request.jwt.claims', true)::json->>'sub' as user_id,
  (SELECT count(*) FROM profiles WHERE id = auth.uid()) as can_read_own;
