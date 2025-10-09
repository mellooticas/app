-- CORREÇÃO: Políticas RLS para tabela profiles
-- Este script garante que usuários autenticados possam ler seus próprios perfis

-- 1. Habilitar RLS na tabela profiles (se não estiver habilitado)
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- 2. Remover políticas antigas que podem estar causando conflito
DROP POLICY IF EXISTS "Usuários podem ver próprio perfil" ON profiles;
DROP POLICY IF EXISTS "Users can view own profile" ON profiles;
DROP POLICY IF EXISTS "Enable read access for authenticated users" ON profiles;
DROP POLICY IF EXISTS "profiles_select_policy" ON profiles;

-- 3. Criar política SIMPLES e FUNCIONAL para SELECT
-- Permite que usuários autenticados vejam APENAS seu próprio perfil
CREATE POLICY "authenticated_users_select_own_profile"
ON profiles
FOR SELECT
TO authenticated
USING (auth.uid() = id);

-- 4. Política para admins verem todos os perfis (opcional)
CREATE POLICY "admins_select_all_profiles"
ON profiles
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM profiles
    WHERE profiles.id = auth.uid()
    AND profiles.tipo_usuario = 'admin'
  )
);

-- 5. Política para UPDATE (usuário pode atualizar próprio perfil)
DROP POLICY IF EXISTS "Users can update own profile" ON profiles;
CREATE POLICY "authenticated_users_update_own_profile"
ON profiles
FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

-- 6. Política para INSERT (permitir criação de perfil após signup)
DROP POLICY IF EXISTS "Users can insert own profile" ON profiles;
CREATE POLICY "authenticated_users_insert_own_profile"
ON profiles
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = id);

-- Verificar se funcionou
SELECT 
  policyname,
  cmd,
  qual
FROM pg_policies 
WHERE tablename = 'profiles';
