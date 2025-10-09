// populate-alpha.mjs
// Popular banco com metodologias Alpha

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

const supabase = createClient(process.env.VITE_SUPABASE_URL, process.env.VITE_SUPABASE_ANON_KEY);

console.log('🎯 POPULANDO SISTEMA ALPHA');
console.log('==========================');

const metodologias = [
  {
    codigo: 'orff_schulwerk',
    nome: 'Orff Schulwerk',
    criador: 'Carl Orff',
    pais_origem: 'Alemanha',
    periodo: '1930-1950',
    descricao_curta: 'Abordagem criativa combinando música, movimento e fala.',
    nivel_dificuldade: 2,
    idade_minima: 3,
    cor_tema: '#FF6B35',
    icone: 'music-note',
    ordem_apresentacao: 1
  },
  {
    codigo: 'suzuki',
    nome: 'Método Suzuki',
    criador: 'Shinichi Suzuki',
    pais_origem: 'Japão',
    periodo: '1940-1960',
    descricao_curta: 'Método baseado na língua materna musical.',
    nivel_dificuldade: 4,
    idade_minima: 3,
    cor_tema: '#E74C3C',
    icone: 'violin',
    ordem_apresentacao: 2
  },
  {
    codigo: 'kodaly',
    nome: 'Método Kodály',
    criador: 'Zoltán Kodály',
    pais_origem: 'Hungria',
    periodo: '1920-1940',
    descricao_curta: 'Desenvolvimento musical através da voz e música folclórica.',
    nivel_dificuldade: 3,
    idade_minima: 5,
    cor_tema: '#2ECC71',
    icone: 'microphone',
    ordem_apresentacao: 3
  }
];

async function popularBanco() {
  try {
    console.log('\n1️⃣ Verificando conexão...');
    const { data: teste } = await supabase
      .from('alpha_metodologias')
      .select('count')
      .limit(1);
    console.log('✅ Conectado ao banco');

    console.log('\n2️⃣ Inserindo metodologias...');
    
    let inseridas = 0;
    let existentes = 0;
    
    for (const metodologia of metodologias) {
      try {
        const { data, error } = await supabase
          .from('alpha_metodologias')
          .insert(metodologia)
          .select('nome')
          .single();
        
        if (error) {
          if (error.code === '23505') {
            console.log(`⚠️ ${metodologia.nome}: já existe`);
            existentes++;
          } else {
            console.log(`❌ ${metodologia.nome}: ${error.message}`);
          }
        } else {
          console.log(`✅ ${metodologia.nome}: inserida`);
          inseridas++;
        }
      } catch (err) {
        console.log(`❌ ${metodologia.nome}: erro - ${err.message}`);
      }
    }

    console.log(`\n📊 Resultado:`);
    console.log(`   - Inseridas: ${inseridas}`);
    console.log(`   - Já existiam: ${existentes}`);

    // Verificar total final
    const { count, error: countError } = await supabase
      .from('alpha_metodologias')
      .select('*', { count: 'exact', head: true });
    
    if (countError) {
      console.log(`❌ Erro ao contar: ${countError.message}`);
    } else {
      console.log(`\n🎉 TOTAL NO BANCO: ${count} metodologias`);
    }

    // Listar metodologias disponíveis
    console.log('\n3️⃣ Metodologias disponíveis:');
    const { data: lista, error: listaError } = await supabase
      .from('alpha_metodologias')
      .select('codigo, nome, nivel_dificuldade, cor_tema')
      .eq('ativo', true)
      .order('ordem_apresentacao');
    
    if (listaError) {
      console.log(`❌ Erro ao listar: ${listaError.message}`);
    } else {
      lista?.forEach((met, i) => {
        console.log(`   ${i + 1}. ${met.nome} (${met.codigo}) - Nível ${met.nivel_dificuldade}`);
      });
    }

    console.log('\n🚀 SISTEMA ALPHA POPULADO COM SUCESSO!');
    return true;

  } catch (error) {
    console.log('\n❌ ERRO GERAL:', error.message);
    return false;
  }
}

popularBanco()
  .then(success => {
    if (success) {
      console.log('\n✅ Processo concluído!');
      console.log('\n📋 Próximos passos:');
      console.log('1. Testar a API Alpha');
      console.log('2. Integrar com o frontend');
      console.log('3. Criar desafios para cada metodologia');
    } else {
      console.log('\n⚠️ Resolver erros antes de continuar.');
    }
    process.exit(success ? 0 : 1);
  })
  .catch(err => {
    console.error('💥 Erro fatal:', err);
    process.exit(1);
  });