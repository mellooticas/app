-- Verificar políticas RLS da tabela profiles

-- Ver se RLS está habilitado
SELECT tablename, rowsecurity 
FROM pg_tables 
WHERE schemaname = 'public' 
AND tablename = 'profiles';


| tablename | rowsecurity |
| --------- | ----------- |
| profiles  | true        |

-- Ver políticas existentes
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual,
  with_check
FROM pg_policies 
WHERE tablename = 'profiles';


| schemaname | tablename | policyname                             | permissive | roles           | cmd    | qual                                                                                                                                  | with_check        |
| ---------- | --------- | -------------------------------------- | ---------- | --------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------- | ----------------- |
| public     | profiles  | Permitir leitura de todos os profiles  | PERMISSIVE | {public}        | SELECT | true                                                                                                                                  | null              |
| public     | profiles  | Usuários podem criar próprio perfil    | PERMISSIVE | {public}        | INSERT | null                                                                                                                                  | (auth.uid() = id) |
| public     | profiles  | Usuários podem editar próprio perfil   | PERMISSIVE | {public}        | UPDATE | (auth.uid() = id)                                                                                                                     | (auth.uid() = id) |
| public     | profiles  | admins_select_all_profiles             | PERMISSIVE | {authenticated} | SELECT | (EXISTS ( SELECT 1
   FROM profiles profiles_1
  WHERE ((profiles_1.id = auth.uid()) AND (profiles_1.tipo_usuario = 'admin'::text)))) | null              |
| public     | profiles  | authenticated_users_select_own_profile | PERMISSIVE | {authenticated} | SELECT | (auth.uid() = id)                                                                                                                     | null              |
| public     | profiles  | profiles_insert_service_simple         | PERMISSIVE | {service_role}  | INSERT | null                                                                                                                                  | true              |
| public     | profiles  | profiles_insert_simple                 | PERMISSIVE | {authenticated} | INSERT | null                                                                                                                                  | (auth.uid() = id) |
| public     | profiles  | profiles_select_simple                 | PERMISSIVE | {authenticated} | SELECT | (auth.uid() = id)                                                                                                                     | null              |
| public     | profiles  | profiles_update_simple                 | PERMISSIVE | {authenticated} | UPDATE | (auth.uid() = id)                                                                                                                     | (auth.uid() = id) |
