import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.VITE_SUPABASE_URL || ''
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY || ''

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Variáveis de ambiente não configuradas!')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

async function checkAlunos() {
  console.log('🎓 VERIFICANDO ALUNOS CADASTRADOS\n')

  try {
    // Buscar contagem total
    const { count, error: countError } = await supabase
      .from('alunos')
      .select('*', { count: 'exact', head: true })

    if (countError) {
      console.error('❌ Erro ao buscar contagem:', countError.message)
      return
    }

    console.log(`✅ Total de alunos: ${count}\n`)

    if (!count || count === 0) {
      console.log('📝 Nenhum aluno cadastrado')
      return
    }

    // Buscar primeiros 10 alunos
    const { data: alunos, error } = await supabase
      .from('alunos')
      .select('*')
      .limit(10)
      .order('id', { ascending: false })

    if (error) {
      console.error('❌ Erro ao buscar alunos:', error.message)
      console.log('\n⚠️  RLS pode estar bloqueando acesso')
      return
    }

    if (!alunos || alunos.length === 0) {
      console.log('⚠️  Não foi possível acessar os dados (RLS ativo)')
      return
    }

    console.log(`📋 PRIMEIROS ${alunos.length} ALUNOS:\n`)
    alunos.forEach((aluno, index) => {
      console.log(`${index + 1}. ${aluno.nome || 'Sem nome'}`)
      console.log(`   ID: ${aluno.id}`)
      console.log(`   Matrícula: ${aluno.matricula || 'N/A'}`)
      console.log(`   User ID: ${aluno.user_id || 'N/A'}`)
      console.log('')
    })

    console.log(`\n✅ Total: ${count} alunos no banco de dados`)

  } catch (err) {
    console.error('❌ Erro inesperado:', err)
  }
}

checkAlunos()
