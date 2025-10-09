import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.VITE_SUPABASE_URL || ''
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY || ''

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ ERRO: Variáveis de ambiente não configuradas!')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

async function getTableStructure() {
  console.log('🔍 DESCOBRINDO ESTRUTURA DA TABELA PROFILES\n')

  try {
    // Buscar apenas 1 registro para ver as colunas
    const { data, error } = await supabase
      .from('profiles')
      .select('*')
      .limit(1)

    if (error) {
      console.error('❌ Erro:', error.message)
      console.log('\n💡 Tentando descobrir colunas via metadata...')
      
      // Tentar buscar colunas específicas comuns
      const commonColumns = ['id', 'nome', 'email', 'tipo', 'avatar_url', 'updated_at', 'created_at', 'user_id']
      
      for (const col of commonColumns) {
        const { error: colError } = await supabase
          .from('profiles')
          .select(col)
          .limit(1)
        
        if (!colError) {
          console.log(`✅ Coluna existe: ${col}`)
        }
      }
      return
    }

    if (!data || data.length === 0) {
      console.log('⚠️  Nenhum registro encontrado')
      console.log('💡 Tentando buscar estrutura via select vazio...')
      
      const { error: emptyError } = await supabase
        .from('profiles')
        .select('*')
        .limit(0)
      
      if (!emptyError) {
        console.log('✅ Tabela existe mas está vazia')
      }
      return
    }

    console.log('✅ ESTRUTURA DA TABELA (baseada em 1 registro):\n')
    console.log(JSON.stringify(data[0], null, 2))
    
    console.log('\n📋 COLUNAS ENCONTRADAS:')
    Object.keys(data[0]).forEach(key => {
      const value = data[0][key]
      const type = value === null ? 'null' : typeof value
      console.log(`   - ${key}: ${type}`)
    })

  } catch (error: any) {
    console.error('❌ Erro inesperado:', error.message)
  }
}

getTableStructure()
