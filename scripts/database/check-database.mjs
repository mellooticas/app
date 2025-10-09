// check-database.mjs
// Verificar estrutura atual do banco de dados

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;

console.log('🔍 VERIFICAÇÃO DO BANCO DE DADOS');
console.log('================================');

async function verificarBanco() {
  try {
    console.log('\n1️⃣ Conectando...');
    const supabase = createClient(supabaseUrl, supabaseKey);
    console.log('✅ Conectado ao Supabase');

    console.log('\n2️⃣ Verificando tabelas conhecidas...');
    
    const tabelasParaTestar = [
      'auth.users',
      'alpha_metodologias',
      'alpha_competencias', 
      'alpha_desafios',
      'alpha_submissoes',
      'alpha_progresso',
      'instruments',
      'profiles',
      'metodologias'
    ];

    const tabelasEncontradas = [];

    for (const tabela of tabelasParaTestar) {
      try {
        const { data, error, count } = await supabase
          .from(tabela)
          .select('*', { count: 'exact', head: true });
        
        if (error) {
          console.log(`❌ ${tabela}: ${error.message}`);
        } else {
          console.log(`✅ ${tabela}: ${count || 0} registros`);
          tabelasEncontradas.push(tabela);
        }
      } catch (err) {
        console.log(`❌ ${tabela}: Erro de acesso`);
      }
    }

    console.log(`\n📊 RESUMO: ${tabelasEncontradas.length} tabelas encontradas`);
    
    if (tabelasEncontradas.length > 0) {
      console.log('\n✅ Tabelas existentes:');
      tabelasEncontradas.forEach(t => console.log(`   - ${t}`));
    }

    // Verificar se tem tabelas Alpha
    const tabelasAlpha = tabelasEncontradas.filter(t => t.startsWith('alpha_'));
    
    if (tabelasAlpha.length === 0) {
      console.log('\n⚠️ SISTEMA ALPHA NÃO INSTALADO');
      console.log('\n📋 INSTRUÇÕES DE INSTALAÇÃO:');
      console.log('1. Acesse: https://supabase.com/dashboard');
      console.log('2. Selecione seu projeto');
      console.log('3. Vá para "SQL Editor"');
      console.log('4. Copie e cole o conteúdo do arquivo:');
      console.log('   sql_scripts/executar_manualmente_supabase.sql');
      console.log('5. Clique "Run" para executar');
      console.log('6. Execute este teste novamente');
    } else {
      console.log(`\n🎯 Sistema Alpha: ${tabelasAlpha.length}/5 tabelas instaladas`);
      tabelasAlpha.forEach(t => console.log(`   ✅ ${t}`));
      
      if (tabelasAlpha.length === 5) {
        console.log('\n🎉 SISTEMA ALPHA COMPLETAMENTE INSTALADO!');
        console.log('✅ Pronto para usar a API Alpha Challenges');
      }
    }

    return tabelasAlpha.length === 5;

  } catch (error) {
    console.log('\n❌ ERRO:', error.message);
    return false;
  }
}

verificarBanco()
  .then(completo => {
    if (completo) {
      console.log('\n🚀 Sistema pronto para produção!');
    } else {
      console.log('\n⚠️ Completar instalação antes de continuar.');
    }
    process.exit(completo ? 0 : 1);
  })
  .catch(err => {
    console.error('💥 Erro fatal:', err);
    process.exit(1);
  });