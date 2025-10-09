import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.VITE_SUPABASE_URL || ''
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY || ''

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Variáveis de ambiente não configuradas!')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

async function queryAllUsers() {
  console.log('👥 CONSULTANDO TODOS OS USUÁRIOS NA TABELA PROFILES\n')
  console.log('=' .repeat(80))

  try {
    // Buscar contagem total
    const { count: totalCount } = await supabase
      .from('profiles')
      .select('*', { count: 'exact', head: true })

    console.log(`\n📊 TOTAL DE REGISTROS: ${totalCount}\n`)

    // Buscar todos os profiles
    const { data: profiles, error } = await supabase
      .from('profiles')
      .select('*')
      .order('joined_at', { ascending: false })

    if (error) {
      console.error('❌ Erro:', error.message)
      console.log('\n💡 Tentando query simplificada...\n')
      
      // Query simplificada
      const { data: simpleProfiles, error: simpleError } = await supabase
        .from('profiles')
        .select('id, nome, full_name, email, tipo_usuario, instrument, total_points, joined_at')
        .order('joined_at', { ascending: false })

      if (simpleError) {
        console.error('❌ Erro na query simplificada:', simpleError.message)
        return
      }

      if (!simpleProfiles || simpleProfiles.length === 0) {
        console.log('⚠️  Tabela profiles está vazia')
        return
      }

      console.log(`✅ ${simpleProfiles.length} usuários encontrados:\n`)
      console.log('=' .repeat(80))
      
      simpleProfiles.forEach((profile, index) => {
        console.log(`\n${index + 1}. ${profile.nome || profile.full_name || 'Sem nome'}`)
        console.log(`   ID: ${profile.id}`)
        console.log(`   Email: ${profile.email || 'N/A'}`)
        console.log(`   Tipo: ${profile.tipo_usuario || 'N/A'}`)
        console.log(`   Instrumento: ${profile.instrument || 'N/A'}`)
        console.log(`   Pontos: ${profile.total_points || 0}`)
        console.log(`   Cadastrado: ${profile.joined_at ? new Date(profile.joined_at).toLocaleString('pt-BR') : 'N/A'}`)
      })

      // Estatísticas por tipo
      console.log('\n' + '='.repeat(80))
      console.log('\n📊 ESTATÍSTICAS POR TIPO DE USUÁRIO:\n')
      
      const stats = simpleProfiles.reduce((acc: Record<string, number>, p) => {
        const tipo = p.tipo_usuario || 'indefinido'
        acc[tipo] = (acc[tipo] || 0) + 1
        return acc
      }, {})

      Object.entries(stats).forEach(([tipo, count]) => {
        console.log(`   ${tipo.toUpperCase()}: ${count} usuário(s)`)
      })

      return
    }

    if (!profiles || profiles.length === 0) {
      console.log('⚠️  Tabela profiles está vazia\n')
      return
    }

    console.log(`✅ ${profiles.length} usuários encontrados:\n`)
    console.log('=' .repeat(80))
    
    // Exibir todos os profiles
    profiles.forEach((profile, index) => {
      console.log(`\n${index + 1}. ${profile.nome || profile.full_name || 'Sem nome'}`)
      console.log(`   ID: ${profile.id}`)
      console.log(`   Email: ${profile.email || 'N/A'}`)
      console.log(`   Nome Completo: ${profile.full_name || 'N/A'}`)
      console.log(`   Tipo: ${profile.tipo_usuario || 'N/A'}`)
      console.log(`   Instrumento: ${profile.instrument || 'N/A'}`)
      console.log(`   Igreja: ${profile.church_name || 'N/A'}`)
      console.log(`   Nível: ${profile.user_level || 'N/A'}`)
      console.log(`   Pontos: ${profile.total_points || 0}`)
      console.log(`   Streak Atual: ${profile.current_streak || 0}`)
      console.log(`   Melhor Streak: ${profile.best_streak || 0}`)
      console.log(`   Aulas Concluídas: ${profile.lessons_completed || 0}`)
      console.log(`   Módulos Concluídos: ${profile.modules_completed || 0}`)
      console.log(`   Cidade/Estado: ${profile.city || 'N/A'}/${profile.state || 'N/A'}`)
      console.log(`   Cadastrado: ${profile.joined_at ? new Date(profile.joined_at).toLocaleString('pt-BR') : 'N/A'}`)
      console.log(`   Último Acesso: ${profile.last_active ? new Date(profile.last_active).toLocaleString('pt-BR') : 'N/A'}`)
    })

    // Estatísticas detalhadas
    console.log('\n' + '='.repeat(80))
    console.log('\n📊 ESTATÍSTICAS DETALHADAS:\n')
    
    const stats = {
      porTipo: profiles.reduce((acc: Record<string, number>, p) => {
        const tipo = p.tipo_usuario || 'indefinido'
        acc[tipo] = (acc[tipo] || 0) + 1
        return acc
      }, {}),
      porInstrumento: profiles.reduce((acc: Record<string, number>, p) => {
        const inst = p.instrument || 'sem instrumento'
        acc[inst] = (acc[inst] || 0) + 1
        return acc
      }, {}),
      porNivel: profiles.reduce((acc: Record<string, number>, p) => {
        const nivel = p.user_level || 'indefinido'
        acc[nivel] = (acc[nivel] || 0) + 1
        return acc
      }, {}),
      totalPontos: profiles.reduce((sum, p) => sum + (p.total_points || 0), 0),
      mediaStreakAtual: profiles.reduce((sum, p) => sum + (p.current_streak || 0), 0) / profiles.length,
      totalAulasConcluidas: profiles.reduce((sum, p) => sum + (p.lessons_completed || 0), 0),
    }

    console.log('Por Tipo de Usuário:')
    Object.entries(stats.porTipo).forEach(([tipo, count]) => {
      console.log(`   ${tipo.toUpperCase()}: ${count}`)
    })

    console.log('\nPor Instrumento:')
    Object.entries(stats.porInstrumento).forEach(([inst, count]) => {
      console.log(`   ${inst}: ${count}`)
    })

    console.log('\nPor Nível:')
    Object.entries(stats.porNivel).forEach(([nivel, count]) => {
      console.log(`   ${nivel}: ${count}`)
    })

    console.log(`\nTotal de Pontos (soma): ${stats.totalPontos}`)
    console.log(`Média de Streak Atual: ${stats.mediaStreakAtual.toFixed(1)} dias`)
    console.log(`Total de Aulas Concluídas: ${stats.totalAulasConcluidas}`)

    console.log('\n' + '='.repeat(80))

  } catch (err) {
    console.error('❌ Erro inesperado:', err)
  }
}

queryAllUsers()
