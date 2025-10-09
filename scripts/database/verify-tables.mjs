// verify-tables.mjs
// Verificar se as tabelas realmente existem

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

const supabase = createClient(process.env.VITE_SUPABASE_URL, process.env.VITE_SUPABASE_ANON_KEY);

console.log('🔍 VERIFICAÇÃO DETALHADA DAS TABELAS');
console.log('====================================');

async function verificarTabelas() {
  try {
    console.log('\n1️⃣ Testando acesso direto ao sistema...');
    
    // Testar com RPC para listar tabelas
    const { data: tabelas, error: rpcError } = await supabase
      .rpc('get_public_tables');
    
    if (rpcError) {
      console.log('⚠️ RPC get_public_tables não disponível:', rpcError.message);
    } else {
      console.log('✅ Tabelas públicas encontradas:', tabelas);
    }

    console.log('\n2️⃣ Tentando queries diretas...');
    
    // Tentar uma query simples de informações do sistema
    const { data: info, error: infoError } = await supabase
      .from('information_schema.tables')
      .select('table_name')
      .eq('table_schema', 'public');
    
    if (infoError) {
      console.log('⚠️ Não foi possível acessar information_schema:', infoError.message);
    } else {
      console.log('✅ Tabelas encontradas via information_schema:', info);
    }

    console.log('\n3️⃣ Testando tabelas uma por uma...');
    
    const tabelasAlpha = [
      'alpha_metodologias',
      'alpha_competencias', 
      'alpha_desafios',
      'alpha_submissoes',
      'alpha_progresso'
    ];

    for (const tabela of tabelasAlpha) {
      try {
        // Tentar SELECT com limit 0 (sem retornar dados)
        const { data, error } = await supabase
          .from(tabela)
          .select('*')
          .limit(0);
        
        if (error) {
          console.log(`❌ ${tabela}: ${error.code} - ${error.message}`);
        } else {
          console.log(`✅ ${tabela}: acessível (${Array.isArray(data) ? data.length : 'N/A'} registros)`);
        }
      } catch (err) {
        console.log(`❌ ${tabela}: Exceção - ${err.message}`);
      }
    }

    console.log('\n4️⃣ Informações de conexão...');
    console.log(`URL: ${process.env.VITE_SUPABASE_URL}`);
    console.log(`Key: ${process.env.VITE_SUPABASE_ANON_KEY ? 'Definida' : 'Não definida'}`);

    console.log('\n5️⃣ Teste de autenticação...');
    const { data: user, error: authError } = await supabase.auth.getUser();
    
    if (authError) {
      console.log('⚠️ Usuário não autenticado:', authError.message);
    } else {
      console.log('✅ Usuário:', user?.user?.email || 'Anônimo');
    }

    return true;

  } catch (error) {
    console.log('\n❌ ERRO GERAL:', error.message);
    return false;
  }
}

verificarTabelas()
  .then(() => {
    console.log('\n🏁 Verificação concluída.');
    console.log('\n💡 Se as tabelas Alpha não existem:');
    console.log('1. Acesse o painel do Supabase');
    console.log('2. Vá para SQL Editor');
    console.log('3. Execute: sql_scripts/executar_manualmente_supabase.sql');
    process.exit(0);
  })
  .catch(err => {
    console.error('💥 Erro fatal:', err);
    process.exit(1);
  });