// Script para verificar usuários no Auth do Supabase
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://eehidnwlwrzqzgytbfsd.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVlaGlkbndsd3J6cXpneXRiZnNkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDgyMzA1MjQsImV4cCI6MjA2MzgwNjUyNH0.SawTk_G0H8CYFEQ7h62Wsv35uNqZz0Q5rsLNT5wCcUM'

const supabase = createClient(supabaseUrl, supabaseKey)

console.log('🔍 VERIFICANDO USUÁRIOS NO SISTEMA DE AUTENTICAÇÃO\n')
console.log('=' .repeat(80))

async function checkAuth() {
  // Verificar usuários na tabela profiles
  const { data: profiles, error } = await supabase
    .from('profiles')
    .select('id, email, full_name, nome, tipo_usuario, total_points')
    .order('total_points', { ascending: false })
    .limit(5)

  if (error) {
    console.log('❌ Erro ao buscar profiles:', error.message)
    return
  }

  console.log('\n👥 TOP 5 USUÁRIOS NO BANCO:\n')
  profiles?.forEach((p, i) => {
    console.log(`${i + 1}. ${p.nome || p.full_name}`)
    console.log(`   Email: ${p.email}`)
    console.log(`   Tipo: ${p.tipo_usuario}`)
    console.log(`   Pontos: ${p.total_points}`)
    console.log(`   ID: ${p.id}`)
    console.log('')
  })

  console.log('=' .repeat(80))
  console.log('\n🔐 IMPORTANTE SOBRE AUTENTICAÇÃO:\n')
  console.log('Os usuários existem na tabela PROFILES, mas para LOGIN funcionar,')
  console.log('eles precisam existir também no SUPABASE AUTH.\n')
  
  console.log('📝 COMO VERIFICAR:')
  console.log('1. Acesse: https://supabase.com/dashboard')
  console.log('2. Selecione o projeto: eehidnwlwrzqzgytbfsd')
  console.log('3. Vá em: Authentication → Users')
  console.log('4. Veja se os emails acima aparecem na lista\n')

  console.log('❓ SE OS USUÁRIOS NÃO APARECEM NO AUTH:')
  console.log('   → Eles foram importados apenas na tabela profiles')
  console.log('   → Não têm senha cadastrada')
  console.log('   → Não conseguem fazer login\n')

  console.log('✅ SOLUÇÃO:')
  console.log('1. OPÇÃO A - Criar novo usuário via SignUp no app')
  console.log('   - Vá para http://localhost:3000/signup')
  console.log('   - Cadastre um novo usuário de teste')
  console.log('')
  console.log('2. OPÇÃO B - Importar usuários no Supabase Auth')
  console.log('   - No Dashboard → Authentication → Users')
  console.log('   - Clique em "Invite user" ou "Add user"')
  console.log('   - Use um dos emails acima')
  console.log('   - Defina uma senha')
  console.log('')
  console.log('3. OPÇÃO C - Resetar senha de um usuário existente')
  console.log('   - Se o usuário já existe no Auth')
  console.log('   - Clique em "Send password reset email"')

  console.log('\n' + '='.repeat(80))
  console.log('\n🚀 TESTE RÁPIDO NO NAVEGADOR:')
  console.log('1. Abra: http://localhost:3000')
  console.log('2. Clique em "Cadastrar" ou "SignUp"')
  console.log('3. Crie um novo usuário de teste')
  console.log('4. Tipo: aluno, professor ou admin')
  console.log('5. Depois faça login com essas credenciais')
  console.log('\n✅ Isso vai confirmar se o sistema está funcionando!')
}

checkAuth()
