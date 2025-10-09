import { createClient } from '@supabase/supabase-js'

// Configuração do Supabase
const supabaseUrl = process.env.VITE_SUPABASE_URL || ''
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY || ''

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ ERRO: Variáveis de ambiente não configuradas!')
  console.error('Configure VITE_SUPABASE_URL e VITE_SUPABASE_ANON_KEY no .env.local')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

async function testConnection() {
  console.log('🔌 TESTE DE CONEXÃO COM SUPABASE\n')
  console.log('URL:', supabaseUrl)
  console.log('Key:', supabaseKey.substring(0, 20) + '...\n')

  let successCount = 0
  let errorCount = 0

  // ============================================
  // TESTE 1: Profiles
  // ============================================
  try {
    console.log('📊 Teste 1: Tabela profiles')
    const { count, error } = await supabase
      .from('profiles')
      .select('*', { count: 'exact', head: true })

    if (error) throw error

    console.log(`✅ profiles: ${count} registros`)
    successCount++
  } catch (error: any) {
    console.error(`❌ profiles: ${error.message}`)
    errorCount++
  }

  // ============================================
  // TESTE 2: Achievements
  // ============================================
  try {
    console.log('\n🏆 Teste 2: Tabela achievements')
    const { count, error } = await supabase
      .from('achievements')
      .select('*', { count: 'exact', head: true })

    if (error) throw error

    console.log(`✅ achievements: ${count} registros`)
    successCount++
  } catch (error: any) {
    console.error(`❌ achievements: ${error.message}`)
    errorCount++
  }

  // ============================================
  // TESTE 3: Portfolios
  // ============================================
  try {
    console.log('\n📚 Teste 3: Tabela portfolios')
    const { count, error } = await supabase
      .from('portfolios')
      .select('*', { count: 'exact', head: true })

    if (error) throw error

    console.log(`✅ portfolios: ${count} registros`)
    successCount++
  } catch (error: any) {
    console.error(`❌ portfolios: ${error.message}`)
    errorCount++
  }

  // ============================================
  // TESTE 4: Alpha Desafios
  // ============================================
  try {
    console.log('\n🎯 Teste 4: Tabela alpha_desafios')
    const { count, error } = await supabase
      .from('alpha_desafios')
      .select('*', { count: 'exact', head: true })

    if (error) throw error

    console.log(`✅ alpha_desafios: ${count} registros`)
    successCount++
  } catch (error: any) {
    console.error(`❌ alpha_desafios: ${error.message}`)
    errorCount++
  }

  // ============================================
  // TESTE 5: Turmas
  // ============================================
  try {
    console.log('\n🏫 Teste 5: Tabela turmas')
    const { count, error } = await supabase
      .from('turmas')
      .select('*', { count: 'exact', head: true })

    if (error) throw error

    console.log(`✅ turmas: ${count} registros`)
    successCount++
  } catch (error: any) {
    console.error(`❌ turmas: ${error.message}`)
    errorCount++
  }

  // ============================================
  // TESTE 6: Instrumentos
  // ============================================
  try {
    console.log('\n🎼 Teste 6: Tabela instrumentos')
    const { count, error } = await supabase
      .from('instrumentos')
      .select('*', { count: 'exact', head: true })

    if (error) throw error

    console.log(`✅ instrumentos: ${count} registros`)
    successCount++
  } catch (error: any) {
    console.error(`❌ instrumentos: ${error.message}`)
    errorCount++
  }

  // ============================================
  // TESTE 7: User Achievements
  // ============================================
  try {
    console.log('\n🎖️ Teste 7: Tabela user_achievements')
    const { count, error } = await supabase
      .from('user_achievements')
      .select('*', { count: 'exact', head: true })

    if (error) throw error

    console.log(`✅ user_achievements: ${count} registros`)
    successCount++
  } catch (error: any) {
    console.error(`❌ user_achievements: ${error.message}`)
    errorCount++
  }

  // ============================================
  // TESTE 8: Aulas
  // ============================================
  try {
    console.log('\n📝 Teste 8: Tabela aulas')
    const { count, error } = await supabase
      .from('aulas')
      .select('*', { count: 'exact', head: true })

    if (error) throw error

    console.log(`✅ aulas: ${count} registros`)
    successCount++
  } catch (error: any) {
    console.error(`❌ aulas: ${error.message}`)
    errorCount++
  }

  // ============================================
  // TESTE 9: Matriculas
  // ============================================
  try {
    console.log('\n👥 Teste 9: Tabela matriculas')
    const { count, error } = await supabase
      .from('matriculas')
      .select('*', { count: 'exact', head: true })

    if (error) throw error

    console.log(`✅ matriculas: ${count} registros`)
    successCount++
  } catch (error: any) {
    console.error(`❌ matriculas: ${error.message}`)
    errorCount++
  }

  // ============================================
  // TESTE 10: User Points Log
  // ============================================
  try {
    console.log('\n💰 Teste 10: Tabela user_points_log')
    const { count, error } = await supabase
      .from('user_points_log')
      .select('*', { count: 'exact', head: true })

    if (error) throw error

    console.log(`✅ user_points_log: ${count} registros`)
    successCount++
  } catch (error: any) {
    console.error(`❌ user_points_log: ${error.message}`)
    errorCount++
  }

  // ============================================
  // RESUMO FINAL
  // ============================================
  console.log('\n' + '='.repeat(50))
  console.log('📊 RESUMO DOS TESTES')
  console.log('='.repeat(50))
  console.log(`✅ Sucessos: ${successCount}/10`)
  console.log(`❌ Erros: ${errorCount}/10`)
  
  if (errorCount === 0) {
    console.log('\n🎉 TODOS OS TESTES PASSARAM!')
    console.log('✅ Banco de dados 100% funcional!')
    console.log('✅ Conexão estabelecida com sucesso!')
    console.log('\n🚀 Próximos passos:')
    console.log('   1. Gerar types: npx supabase gen types typescript')
    console.log('   2. Iniciar dev: npm run dev')
    console.log('   3. Desenvolver features! 🎨')
  } else {
    console.log('\n⚠️ Alguns testes falharam!')
    console.log('Verifique:')
    console.log('   - Variáveis de ambiente (.env.local)')
    console.log('   - Políticas RLS no Supabase')
    console.log('   - Acesso anônimo às tabelas')
  }
  console.log('='.repeat(50))
}

// Executar testes
testConnection().catch((error) => {
  console.error('❌ Erro fatal:', error)
  process.exit(1)
})
