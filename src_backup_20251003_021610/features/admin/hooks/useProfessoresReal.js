// hooks/useProfessoresReal.js - Hook para gerenciar dados reais de professores
import { useState, useEffect, useCallback } from 'react';
import { supabase } from '../../shared/lib/supabase/supabaseClient';

export const useProfessoresReal = () => {
  const [professores, setProfessores] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [stats, setStats] = useState({});

  const buscarProfessores = useCallback(async () => {
    try {
      setLoading(true);
      setError(null);

      console.log('👨‍🏫 Buscando professores reais...');

      // Buscar professores da tabela profiles
      const { data: professoresData, error: profError } = await supabase
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
          tipo_usuario
        `)
        .eq('tipo_usuario', 'professor')
        .order('joined_at', { ascending: false });

      if (profError) throw profError;

      // Tentar buscar dados complementares da tabela professores (se existir)
      let dadosComplementares = {};
      try {
        const { data: profComplementar, error: compError } = await supabase
          .from('professores')
          .select('*');
        
        if (!compError && profComplementar) {
          dadosComplementares = profComplementar.reduce((acc, prof) => {
            acc[prof.id] = prof;
            return acc;
          }, {});
        }
      } catch (err) {
        console.log('ℹ️ Tabela professores complementar não encontrada');
      }

      // Processar dados dos professores
      const professoresProcessados = professoresData.map(professor => {
        const complemento = dadosComplementares[professor.id] || {};

        // Calcular status de atividade
        const calcularStatus = (lastActive) => {
          if (!lastActive) return 'nunca_ativo';
          const agora = new Date();
          const ultimaAtividade = new Date(lastActive);
          const diasSemAcesso = (agora - ultimaAtividade) / (1000 * 60 * 60 * 24);
          
          if (diasSemAcesso <= 7) return 'ativo';
          if (diasSemAcesso <= 30) return 'moderado';
          return 'inativo';
        };

        // Calcular completude do perfil
        const calcularCompletude = (perfil) => {
          const campos = ['nome', 'instrument', 'bio', 'phone', 'city'];
          const preenchidos = campos.filter(campo => perfil[campo]).length;
          return Math.round((preenchidos / campos.length) * 100);
        };

        return {
          id: professor.id,
          nome: professor.nome || professor.full_name || 'Sem nome',
          email: professor.email,
          avatar: professor.avatar_url,
          instrumento_principal: professor.instrument || 'Não especificado',
          especialidades: complemento.especialidades || [professor.instrument].filter(Boolean),
          formacao: complemento.formacao || 'Não informado',
          experiencia: complemento.experiencia || 0,
          biografia: professor.bio || complemento.biografia || 'Não informado',
          telefone: professor.phone,
          endereco: professor.city && professor.state ? `${professor.city}, ${professor.state}` : null,
          status: calcularStatus(professor.last_active),
          ativo: complemento.ativo !== undefined ? complemento.ativo : true,
          ultimo_acesso: professor.last_active,
          membro_desde: professor.joined_at,
          perfil_completo: calcularCompletude(professor),
          
          // Métricas de ensino (serão implementadas com sistema de conteúdos)
          total_alunos: 0,
          total_aulas: 0,
          total_conteudos: 0,
          avaliacao_media: 0,
          total_visualizacoes: 0,
          
          // Dados calculados
          dias_como_professor: professor.joined_at ? 
            Math.floor((new Date() - new Date(professor.joined_at)) / (1000 * 60 * 60 * 24)) : 0
        };
      });

      // Calcular estatísticas
      const estatisticas = {
        total: professoresProcessados.length,
        ativos: professoresProcessados.filter(p => p.status === 'ativo').length,
        moderados: professoresProcessados.filter(p => p.status === 'moderado').length,
        inativos: professoresProcessados.filter(p => p.status === 'inativo').length,
        nunca_ativos: professoresProcessados.filter(p => p.status === 'nunca_ativo').length,
        instrumentos_ensinados: professoresProcessados.reduce((acc, p) => {
          acc[p.instrumento_principal] = (acc[p.instrumento_principal] || 0) + 1;
          return acc;
        }, {}),
        media_completude_perfil: professoresProcessados.length ?
          Math.round(professoresProcessados.reduce((sum, p) => sum + p.perfil_completo, 0) / professoresProcessados.length) : 0,
        experiencia_total: professoresProcessados.reduce((sum, p) => sum + p.experiencia, 0),
        novos_este_mes: professoresProcessados.filter(p => {
          if (!p.membro_desde) return false;
          const umMesAtras = new Date();
          umMesAtras.setMonth(umMesAtras.getMonth() - 1);
          return new Date(p.membro_desde) >= umMesAtras;
        }).length
      };

      setProfessores(professoresProcessados);
      setStats(estatisticas);

      console.log(`✅ ${professoresProcessados.length} professores carregados:`, estatisticas);

    } catch (err) {
      console.error('❌ Erro ao buscar professores:', err);
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, []);

  // Função para atualizar um professor
  const atualizarProfessor = useCallback(async (id, dadosAtualizados) => {
    try {
      const { data, error } = await supabase
        .from('profiles')
        .update(dadosAtualizados)
        .eq('id', id)
        .eq('tipo_usuario', 'professor')
        .select()
        .single();

      if (error) throw error;

      // Atualizar o estado local
      setProfessores(prevProfessores => 
        prevProfessores.map(professor => 
          professor.id === id ? { ...professor, ...dadosAtualizados } : professor
        )
      );

      console.log('✅ Professor atualizado:', data);
      return { success: true, data };

    } catch (err) {
      console.error('❌ Erro ao atualizar professor:', err);
      return { success: false, error: err.message };
    }
  }, []);

  // Função para desativar/ativar professor
  const toggleStatusProfessor = useCallback(async (id, novoStatus) => {
    try {
      // Se existir tabela professores complementar, atualizar lá também
      try {
        await supabase
          .from('professores')
          .upsert({ id, ativo: novoStatus })
          .eq('id', id);
      } catch (err) {
        console.log('ℹ️ Tabela professores complementar não disponível');
      }

      // Atualizar o estado local
      setProfessores(prevProfessores => 
        prevProfessores.map(professor => 
          professor.id === id ? { ...professor, ativo: novoStatus } : professor
        )
      );

      console.log(`✅ Professor ${novoStatus ? 'ativado' : 'desativado'}:`, id);
      return { success: true };

    } catch (err) {
      console.error('❌ Erro ao alterar status do professor:', err);
      return { success: false, error: err.message };
    }
  }, []);

  // Função para excluir um professor
  const excluirProfessor = useCallback(async (id) => {
    try {
      const { error } = await supabase
        .from('profiles')
        .delete()
        .eq('id', id)
        .eq('tipo_usuario', 'professor');

      if (error) throw error;

      // Tentar remover da tabela complementar também
      try {
        await supabase
          .from('professores')
          .delete()
          .eq('id', id);
      } catch (err) {
        console.log('ℹ️ Não foi possível remover da tabela professores complementar');
      }

      // Atualizar o estado local
      setProfessores(prevProfessores => prevProfessores.filter(professor => professor.id !== id));

      console.log('✅ Professor excluído:', id);
      return { success: true };

    } catch (err) {
      console.error('❌ Erro ao excluir professor:', err);
      return { success: false, error: err.message };
    }
  }, []);

  // Função para buscar detalhes de um professor específico
  const buscarProfessorDetalhado = useCallback(async (id) => {
    try {
      const { data, error } = await supabase
        .from('profiles')
        .select('*')
        .eq('id', id)
        .eq('tipo_usuario', 'professor')
        .single();

      if (error) throw error;

      console.log('✅ Detalhes do professor:', data);
      return { success: true, data };

    } catch (err) {
      console.error('❌ Erro ao buscar detalhes do professor:', err);
      return { success: false, error: err.message };
    }
  }, []);

  useEffect(() => {
    buscarProfessores();
  }, [buscarProfessores]);

  return {
    professores,
    stats,
    loading,
    error,
    refetch: buscarProfessores,
    atualizarProfessor,
    toggleStatusProfessor,
    excluirProfessor,
    buscarProfessorDetalhado
  };
};