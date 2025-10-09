import { createClient } from '@supabase/supabase-js'

// Configuração do Supabase
const supabaseUrl = process.env.VITE_SUPABASE_URL || ''
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY || ''

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ ERRO: Variáveis de ambiente não configuradas!')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

async function checkProfiles() {
  console.log('👥 VERIFICANDO PROFILES CADASTRADOS\n')

  try {
    // Buscar todos os profiles
    const { data: profiles, error, count } = await supabase
      .from('profiles')
      .select('*', { count: 'exact' })
      .order('created_at', { ascending: false })

    if (error) {
      console.error('❌ Erro ao buscar profiles:', error.message)
      
      // Tentar buscar apenas a contagem
      console.log('\n🔍 Tentando buscar apenas contagem...')
      const { count: totalCount, error: countError } = await supabase
        .from('profiles')
        .select('*', { count: 'exact', head: true })
      
      if (countError) {
        console.error('❌ Erro ao buscar contagem:', countError.message)
      } else {
        console.log(`✅ Total de profiles: ${totalCount}`)
        console.log('\n⚠️  Nota: RLS pode estar bloqueando acesso aos dados sem autenticação')
      }
      return
    }

    console.log(`✅ Total de profiles encontrados: ${count}\n`)

    if (!profiles || profiles.length === 0) {
      console.log('📝 Nenhum profile cadastrado ainda')
      return
    }

    // Mostrar resumo dos profiles
    console.log('📋 RESUMO DOS PROFILES:\n')
    profiles.forEach((profile, index) => {
      console.log(`${index + 1}. ${profile.nome || 'Sem nome'}`)
      console.log(`   ID: ${profile.id}`)
      console.log(`   Email: ${profile.email || 'N/A'}`)
      console.log(`   Tipo: ${profile.tipo || 'N/A'}`)
      console.log(`   Criado: ${new Date(profile.created_at).toLocaleString('pt-BR')}`)
      console.log('')
    })

    // Estatísticas por tipo
    const tipos = profiles.reduce((acc: any, p) => {
      const tipo = p.tipo || 'indefinido'
      acc[tipo] = (acc[tipo] || 0) + 1
      return acc
    }, {})

    console.log('📊 ESTATÍSTICAS POR TIPO:')
    Object.entries(tipos).forEach(([tipo, count]) => {
      console.log(`   ${tipo}: ${count}`)
    })

  } catch (error: any) {
    console.error('❌ Erro inesperado:', error.message)
  }
}

// Executar
checkProfiles()
