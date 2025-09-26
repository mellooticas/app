// hooks/useAlunosReal.js - Hook para gerenciar dados reais de alunos
import { useState, useEffect, useCallback } from 'react';
import { supabase } from '../../shared/lib/supabase/supabaseClient';

export const useAlunosReal = () => {
  const [alunos, setAlunos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [stats, setStats] = useState({});

  const buscarAlunos = useCallback(async () => {
    try {
      setLoading(true);
      setError(null);

      console.log('🔍 Buscando alunos reais...');

      // Buscar alunos da tabela profiles
      const { data: alunosData, error: alunosError } = await supabase
        .from('profiles')
        .select(`
          id,
          email,
          nome,
          full_name,
          instrument,
          phone,
          city,
          state,
          bio,
          avatar_url,
          last_active,
          joined_at,
          total_points,
          current_streak,
          lessons_completed,
          modules_completed,
          tipo_usuario
        `)
        .eq('tipo_usuario', 'aluno')
        .order('joined_at', { ascending: false });

      if (alunosError) throw alunosError;

      // Processar dados dos alunos
      const alunosProcessados = alunosData.map(aluno => {
        // Calcular status de atividade
        const calcularStatus = (lastActive) => {
          if (!lastActive) return 'nunca_ativo';
          const agora = new Date();
          const ultimaAtividade = new Date(lastActive);
          const diasSemAcesso = (agora - ultimaAtividade) / (1000 * 60 * 60 * 24);
          
          if (diasSemAcesso <= 3) return 'ativo';
          if (diasSemAcesso <= 14) return 'moderado';
          return 'inativo';
        };

        // Calcular completude do perfil
        const calcularCompletude = (perfil) => {
          const campos = ['nome', 'instrument', 'phone', 'city'];
          const preenchidos = campos.filter(campo => perfil[campo]).length;
          return Math.round((preenchidos / campos.length) * 100);
        };

        return {
          id: aluno.id,
          nome: aluno.nome || aluno.full_name || 'Sem nome',
          email: aluno.email,
          avatar: aluno.avatar_url,
          instrumento: aluno.instrument || 'Não especificado',
          telefone: aluno.phone,
          endereco: aluno.city && aluno.state ? `${aluno.city}, ${aluno.state}` : null,
          bio: aluno.bio,
          status: calcularStatus(aluno.last_active),
          ultimo_acesso: aluno.last_active,
          membro_desde: aluno.joined_at,
          pontos_total: aluno.total_points || 0,
          sequencia_atual: aluno.current_streak || 0,
          aulas_concluidas: aluno.lessons_completed || 0,
          modulos_concluidos: aluno.modules_completed || 0,
          perfil_completo: calcularCompletude(aluno),
          dias_como_aluno: aluno.joined_at ? 
            Math.floor((new Date() - new Date(aluno.joined_at)) / (1000 * 60 * 60 * 24)) : 0
        };
      });

      // Calcular estatísticas
      const estatisticas = {
        total: alunosProcessados.length,
        ativos: alunosProcessados.filter(a => a.status === 'ativo').length,
        moderados: alunosProcessados.filter(a => a.status === 'moderado').length,
        inativos: alunosProcessados.filter(a => a.status === 'inativo').length,
        nunca_ativos: alunosProcessados.filter(a => a.status === 'nunca_ativo').length,
        instrumentos_populares: alunosProcessados.reduce((acc, a) => {
          acc[a.instrumento] = (acc[a.instrumento] || 0) + 1;
          return acc;
        }, {}),
        media_pontos: alunosProcessados.length ? 
          Math.round(alunosProcessados.reduce((sum, a) => sum + a.pontos_total, 0) / alunosProcessados.length) : 0,
        total_aulas_concluidas: alunosProcessados.reduce((sum, a) => sum + a.aulas_concluidas, 0),
        media_completude_perfil: alunosProcessados.length ?
          Math.round(alunosProcessados.reduce((sum, a) => sum + a.perfil_completo, 0) / alunosProcessados.length) : 0
      };

      setAlunos(alunosProcessados);
      setStats(estatisticas);

      console.log(`✅ ${alunosProcessados.length} alunos carregados:`, estatisticas);

    } catch (err) {
      console.error('❌ Erro ao buscar alunos:', err);
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, []);

  // Função para atualizar um aluno
  const atualizarAluno = useCallback(async (id, dadosAtualizados) => {
    try {
      const { data, error } = await supabase
        .from('profiles')
        .update(dadosAtualizados)
        .eq('id', id)
        .eq('tipo_usuario', 'aluno')
        .select()
        .single();

      if (error) throw error;

      // Atualizar o estado local
      setAlunos(prevAlunos => 
        prevAlunos.map(aluno => 
          aluno.id === id ? { ...aluno, ...dadosAtualizados } : aluno
        )
      );

      console.log('✅ Aluno atualizado:', data);
      return { success: true, data };

    } catch (err) {
      console.error('❌ Erro ao atualizar aluno:', err);
      return { success: false, error: err.message };
    }
  }, []);

  // Função para excluir um aluno
  const excluirAluno = useCallback(async (id) => {
    try {
      const { error } = await supabase
        .from('profiles')
        .delete()
        .eq('id', id)
        .eq('tipo_usuario', 'aluno');

      if (error) throw error;

      // Atualizar o estado local
      setAlunos(prevAlunos => prevAlunos.filter(aluno => aluno.id !== id));

      console.log('✅ Aluno excluído:', id);
      return { success: true };

    } catch (err) {
      console.error('❌ Erro ao excluir aluno:', err);
      return { success: false, error: err.message };
    }
  }, []);

  // Função para buscar detalhes de um aluno específico
  const buscarAlunoDetalhado = useCallback(async (id) => {
    try {
      const { data, error } = await supabase
        .from('profiles')
        .select('*')
        .eq('id', id)
        .eq('tipo_usuario', 'aluno')
        .single();

      if (error) throw error;

      console.log('✅ Detalhes do aluno:', data);
      return { success: true, data };

    } catch (err) {
      console.error('❌ Erro ao buscar detalhes do aluno:', err);
      return { success: false, error: err.message };
    }
  }, []);

  useEffect(() => {
    buscarAlunos();
  }, [buscarAlunos]);

  return {
    alunos,
    stats,
    loading,
    error,
    refetch: buscarAlunos,
    atualizarAluno,
    excluirAluno,
    buscarAlunoDetalhado
  };
};