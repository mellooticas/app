// create-alpha-tables.mjs
// Criar tabelas Alpha via API do Supabase

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

const supabase = createClient(process.env.VITE_SUPABASE_URL, process.env.VITE_SUPABASE_ANON_KEY);

console.log('🛠️ CRIANDO SISTEMA ALPHA VIA API');
console.log('=================================');

async function criarTabelasAlpha() {
  try {
    console.log('\n1️⃣ Criando tabela alpha_metodologias...');
    
    const sqlCreateMetodologias = `
      CREATE TABLE IF NOT EXISTS alpha_metodologias (
        id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
        codigo varchar(50) UNIQUE NOT NULL,
        nome varchar(200) NOT NULL,
        criador varchar(100),
        pais_origem varchar(50),
        periodo varchar(50),
        descricao_curta text,
        descricao_completa text,
        principios_fundamentais text[],
        filosofia text,
        publico_alvo text,
        instrumentos_principais text[],
        metodologia_ensino text,
        pontos_fortes text[],
        limitacoes text[],
        aplicacao_brasil text,
        nivel_dificuldade integer CHECK (nivel_dificuldade BETWEEN 1 AND 5),
        idade_minima integer,
        recursos_necessarios text[],
        cor_tema varchar(7),
        icone varchar(50),
        ordem_apresentacao integer DEFAULT 1,
        ativo boolean DEFAULT true,
        created_at timestamp with time zone DEFAULT now(),
        updated_at timestamp with time zone DEFAULT now()
      );
    `;

    const { data: result1, error: error1 } = await supabase.rpc('create_alpha_metodologias', {
      sql_statement: sqlCreateMetodologias
    });

    if (error1) {
      console.log('⚠️ Tentativa 1 falhou:', error1.message);
      
      // Tentativa alternativa usando edge function ou direct SQL
      console.log('🔄 Tentando método alternativo...');
      
      // Vamos tentar inserir diretamente - se a tabela não existir, receberemos erro específico
      const { data: test, error: testError } = await supabase
        .from('alpha_metodologias')
        .select('count')
        .limit(1);
      
      if (testError && testError.code === '42P01') {
        console.log('❌ Tabela realmente não existe. Necessário criar via painel do Supabase.');
        console.log('\n📋 INSTRUÇÕES MANUAIS:');
        console.log('1. Acesse: https://supabase.com/dashboard/project/eehidnwlwrzqzgytbfsd');
        console.log('2. Vá para "SQL Editor"');
        console.log('3. Cole o conteúdo do arquivo: sql_scripts/executar_manualmente_supabase.sql');
        console.log('4. Clique "Run"');
        console.log('5. Execute este script novamente');
        return false;
      }
    } else {
      console.log('✅ Tabela alpha_metodologias criada');
    }

    console.log('\n2️⃣ Testando se conseguimos inserir dados...');
    
    const metodologiaTeste = {
      codigo: 'teste_criacao',
      nome: 'Teste de Criação',
      descricao_curta: 'Metodologia para testar criação',
      nivel_dificuldade: 1,
      idade_minima: 18,
      cor_tema: '#00FF00',
      icone: 'test',
      ordem_apresentacao: 999
    };

    const { data: insercao, error: erroInsercao } = await supabase
      .from('alpha_metodologias')
      .insert(metodologiaTeste)
      .select()
      .single();

    if (erroInsercao) {
      console.log('❌ Erro na inserção:', erroInsercao.message);
      
      if (erroInsercao.code === '42P01') {
        console.log('\n🚨 TABELAS NÃO EXISTEM NO BANCO!');
        console.log('\n📋 SOLUÇÕES:');
        console.log('OPÇÃO 1 - Via painel web:');
        console.log('1. Acesse: https://supabase.com/dashboard');
        console.log('2. Selecione seu projeto');
        console.log('3. SQL Editor → New query');
        console.log('4. Cole o arquivo sql_scripts/executar_manualmente_supabase.sql');
        console.log('5. Execute');
        
        console.log('\nOPÇÃO 2 - Via CLI (se instalado):');
        console.log('1. npm install -g supabase');
        console.log('2. supabase login');
        console.log('3. supabase db push --local');
        
        return false;
      }
      
      return false;
    } else {
      console.log('✅ Inserção de teste bem-sucedida:', insercao.nome);
      
      // Limpar teste
      await supabase
        .from('alpha_metodologias')
        .delete()
        .eq('codigo', 'teste_criacao');
      
      console.log('✅ Limpeza concluída');
      
      console.log('\n🎉 SISTEMA ALPHA FUNCIONANDO!');
      console.log('✅ Pronto para popular com dados reais');
      return true;
    }

  } catch (error) {
    console.log('\n❌ ERRO GERAL:', error.message);
    
    console.log('\n🔧 DIAGNÓSTICO:');
    console.log('- As tabelas Alpha não existem no banco');
    console.log('- É necessário criar via painel do Supabase');
    console.log('- Scripts SQL prontos em: sql_scripts/');
    
    return false;
  }
}

criarTabelasAlpha()
  .then(success => {
    if (success) {
      console.log('\n🚀 Sistema Alpha criado com sucesso!');
      console.log('Execute: node populate-alpha.mjs');
    } else {
      console.log('\n⚠️ Criar tabelas manualmente antes de continuar.');
    }
    process.exit(success ? 0 : 1);
  })
  .catch(err => {
    console.error('💥 Erro fatal:', err);
    process.exit(1);
  });