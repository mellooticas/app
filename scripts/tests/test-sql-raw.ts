import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.VITE_SUPABASE_URL || ''
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY || ''

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Variáveis de ambiente não configuradas!')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

async function rawSQLQuery() {
  console.log('🔍 CONSULTANDO PROFILES COM SQL DIRETO\n')
  console.log('=' .repeat(80))

  try {
    // Tentar query SQL básica via RPC ou função
    console.log('\n📊 Teste 1: COUNT(*) básico')
    console.log('SQL: SELECT COUNT(*) FROM profiles;\n')
    
    const { data: countData, error: countError } = await supabase
      .rpc('exec_sql', { 
        query: 'SELECT COUNT(*) as total FROM profiles' 
      })

    if (countError) {
      console.log('❌ RPC exec_sql não disponível:', countError.message)
      console.log('\n💡 Tentando query direta com Supabase client...\n')
    } else {
      console.log('✅ Resultado:', countData)
    }

    // Tentar query com select simples
    console.log('\n📊 Teste 2: SELECT básico')
    console.log('SQL: SELECT id, nome, full_name, email, tipo_usuario FROM profiles LIMIT 5;\n')
    
    const { data, error, count } = await supabase
      .from('profiles')
      .select('id, nome, full_name, email, tipo_usuario, total_points, joined_at', { count: 'exact' })
      .limit(5)

    if (error) {
      console.error('❌ Erro na query:', error)
      console.log('\nDetalhes do erro:')
      console.log('- Message:', error.message)
      console.log('- Code:', error.code)
      console.log('- Details:', error.details)
      console.log('- Hint:', error.hint)
      
      // Tentar verificar se é problema de RLS
      console.log('\n🔒 POSSÍVEL PROBLEMA DE RLS (Row Level Security)')
      console.log('A tabela pode ter políticas de segurança que bloqueiam acesso anônimo.')
      console.log('\nSugestões:')
      console.log('1. Verificar políticas RLS no Supabase Dashboard')
      console.log('2. Adicionar política: ENABLE ROW LEVEL SECURITY ON profiles;')
      console.log('3. Criar política pública para leitura:')
      console.log('   CREATE POLICY "Allow public read" ON profiles FOR SELECT USING (true);')
      
    } else {
      console.log(`✅ Query executada com sucesso!`)
      console.log(`📊 Total de registros: ${count}`)
      
      if (!data || data.length === 0) {
        console.log('\n⚠️  Nenhum registro retornado')
        console.log('Possíveis causas:')
        console.log('- Tabela está vazia')
        console.log('- RLS está bloqueando acesso')
        console.log('- Usuário anônimo não tem permissão')
      } else {
        console.log(`\n✅ ${data.length} registro(s) encontrado(s):\n`)
        console.log('=' .repeat(80))
        data.forEach((row, index) => {
          console.log(`\n${index + 1}.`)
          console.log(`   ID: ${row.id}`)
          console.log(`   Nome: ${row.nome || row.full_name || 'N/A'}`)
          console.log(`   Email: ${row.email || 'N/A'}`)
          console.log(`   Tipo: ${row.tipo_usuario || 'N/A'}`)
          console.log(`   Pontos: ${row.total_points || 0}`)
          console.log(`   Cadastrado: ${row.joined_at || 'N/A'}`)
        })
      }
    }

    // Teste 3: Verificar se há dados em outras views/tabelas relacionadas
    console.log('\n\n📊 Teste 3: Verificando tabelas relacionadas')
    console.log('=' .repeat(80))

    const relatedTables = ['alunos', 'professores', 'admins']
    
    for (const table of relatedTables) {
      const { count: tableCount, error: tableError } = await supabase
        .from(table)
        .select('*', { count: 'exact', head: true })

      if (tableError) {
        console.log(`\n❌ ${table}: ${tableError.message}`)
      } else {
        console.log(`\n✅ ${table}: ${tableCount} registro(s)`)
        
        if (tableCount && tableCount > 0) {
          // Buscar amostra
          const { data: sample } = await supabase
            .from(table)
            .select('*')
            .limit(3)

          if (sample && sample.length > 0) {
            console.log(`   Amostra (primeiros ${sample.length} registros):`)
            sample.forEach((row, i) => {
              console.log(`   ${i + 1}. ID: ${row.id}, User ID: ${row.user_id || 'N/A'}`)
            })
          }
        }
      }
    }

    console.log('\n' + '=' .repeat(80))
    console.log('\n💡 DIAGNÓSTICO:')
    console.log('Se você vê "0 registros" mas espera ver dados:')
    console.log('1. Verifique se os dados foram realmente inseridos')
    console.log('2. Verifique as políticas RLS no Supabase Dashboard → Authentication → Policies')
    console.log('3. Considere desabilitar RLS temporariamente para testes: ALTER TABLE profiles DISABLE ROW LEVEL SECURITY;')
    console.log('4. Ou adicione política pública: CREATE POLICY "Public read" ON profiles FOR SELECT USING (true);')

  } catch (err) {
    console.error('\n❌ Erro inesperado:', err)
  }
}

rawSQLQuery()
