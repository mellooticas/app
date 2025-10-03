// Utility para verificar todas as tabelas disponíveis no Supabase
import { supabase } from '../lib/supabase/supabaseClient';

export const verificarTabelasDisponiveis = async () => {
  console.log('🔍 VERIFICANDO TABELAS DISPONÍVEIS NO SUPABASE...');
  
  const tabelas = [
    'profiles', 'instrumentos', 'sons_instrumentos', 'midias_instrumentos',
    'tecnicas_instrumentos', 'curiosidades_instrumentos', 'performances_instrumentos',
    'quizzes_instrumentos', 'professores_instrumentos', 'instrumentos_relacionados',
    'professores', 'alunos', 'turmas', 'aulas', 'conteudos', 'modulos',
    'conquistas', 'metodologias', 'curriculum', 'avaliacoes'
  ];

  const resultados = {};

  for (const tabela of tabelas) {
    try {
      const { data, error, count } = await supabase
        .from(tabela)
        .select('*', { count: 'exact', head: true });

      if (error) {
        resultados[tabela] = { existe: false, erro: error.message };
      } else {
        resultados[tabela] = { existe: true, registros: count };
      }
    } catch (err) {
      resultados[tabela] = { existe: false, erro: err.message };
    }
  }

  console.table(resultados);
  return resultados;
};

export const buscarEstatisticasCompletas = async () => {
  console.log('📊 BUSCANDO ESTATÍSTICAS COMPLETAS...');
  
  const stats = {};
  
  try {
    // Profiles por tipo
    const { data: profiles, error: profilesError } = await supabase
      .from('profiles')
      .select('tipo_usuario');
    
    if (!profilesError) {
      const tipoContagem = profiles.reduce((acc, p) => {
        acc[p.tipo_usuario] = (acc[p.tipo_usuario] || 0) + 1;
        return acc;
      }, {});
      stats.usuarios = tipoContagem;
    }

    // Instrumentos
    const { data: instrumentos, error: instError } = await supabase
      .from('instrumentos')
      .select('id, nome, categoria');
    
    if (!instError) {
      stats.instrumentos = {
        total: instrumentos.length,
        por_categoria: instrumentos.reduce((acc, i) => {
          acc[i.categoria] = (acc[i.categoria] || 0) + 1;
          return acc;
        }, {})
      };
    }

    // Sons de instrumentos
    const { count: totalSons } = await supabase
      .from('sons_instrumentos')
      .select('*', { count: 'exact', head: true });
    
    stats.conteudo = { sons: totalSons };

    console.log('📈 Estatísticas:', stats);
    return stats;

  } catch (error) {
    console.error('❌ Erro ao buscar estatísticas:', error);
    return {};
  }
};