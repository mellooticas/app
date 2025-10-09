// Script para verificar usuários no Supabase Auth
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://eehidnwlwrzqzgytbfsd.supabase.co'
const supabaseServiceKey = process.env.SUPABASE_SERVICE_KEY || ''

if (!supabaseServiceKey) {
  console.error('❌ SUPABASE_SERVICE_KEY não encontrada!')
  console.log('Para obter a Service Key:')
  console.log('1. Acesse: https://supabase.com/dashboard/project/eehidnwlwrzqzgytbfsd/settings/api')
  console.log('2. Copie a "service_role key" (não a anon key!)')
  console.log('3. Execute: set SUPABASE_SERVICE_KEY=sua_key_aqui')
  console.log('4. Execute novamente este script')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseServiceKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false
  }
})

async function verifyUsers() {
  console.log('🔍 VERIFICANDO USUÁRIOS NO SUPABASE AUTH\n')
  console.log('='.repeat(80))

  try {
    // Listar usuários do Auth (requer service_role key)
    const { data: { users }, error } = await supabase.auth.admin.listUsers()

    if (error) {
      console.error('❌ Erro ao listar usuários:', error.message)
      return
    }

    console.log(`\n✅ Total de usuários no Auth: ${users?.length || 0}\n`)

    if (!users || users.length === 0) {
      console.log('⚠️  NENHUM USUÁRIO ENCONTRADO NO SUPABASE AUTH!')
      console.log('\nIsso significa que:')
      console.log('1. Os usuários existem apenas na tabela "profiles"')
      console.log('2. Eles NÃO foram criados no sistema de autenticação')
      console.log('3. Login NÃO VAI FUNCIONAR sem criar os usuários no Auth\n')
      
      console.log('💡 SOLUÇÃO:')
      console.log('Os usuários precisam fazer cadastro novamente usando a página de SignUp')
      console.log('Ou podemos criar um script para migrar os profiles existentes para o Auth')
      return
    }

    // Mostrar primeiros 10 usuários
    console.log('👥 USUÁRIOS NO AUTH:\n')
    users.slice(0, 10).forEach((user, i) => {
      console.log(`${i + 1}. Email: ${user.email}`)
      console.log(`   ID: ${user.id}`)
      console.log(`   Created: ${user.created_at}`)
      console.log(`   Confirmed: ${user.email_confirmed_at ? 'Sim ✅' : 'Não ❌'}`)
      console.log(`   Last Sign In: ${user.last_sign_in_at || 'Nunca'}`)
      console.log('')
    })

    // Comparar com profiles
    const { data: profiles, error: profilesError } = await supabase
      .from('profiles')
      .select('id, email, nome, full_name, tipo_usuario')
      .limit(100)

    if (profilesError) {
      console.error('❌ Erro ao buscar profiles:', profilesError.message)
      return
    }

    console.log('='.repeat(80))
    console.log('\n📊 COMPARAÇÃO:\n')
    console.log(`Usuários no Auth: ${users.length}`)
    console.log(`Perfis no banco: ${profiles?.length || 0}`)
    
    if (users.length < (profiles?.length || 0)) {
      console.log('\n⚠️  PROBLEMA DETECTADO!')
      console.log('Existem mais perfis no banco do que usuários no Auth.')
      console.log('Alguns usuários não conseguirão fazer login!\n')
      
      // Encontrar perfis sem Auth
      const authEmails = new Set(users.map(u => u.email))
      const profilesWithoutAuth = profiles?.filter(p => p.email && !authEmails.has(p.email))
      
      if (profilesWithoutAuth && profilesWithoutAuth.length > 0) {
        console.log('Perfis SEM usuário no Auth:')
        profilesWithoutAuth.forEach(p => {
          console.log(`  • ${p.email} (${p.nome || p.full_name})`)
        })
      }
    }

  } catch (error: any) {
    console.error('❌ Erro:', error.message)
  }

  console.log('\n' + '='.repeat(80))
}

verifyUsers()
