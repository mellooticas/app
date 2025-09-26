// AdminDashboardCompleto.jsx - Dashboard com todos os dados do banco
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { 
  Users, Music, BookOpen, Award, BarChart3, Activity,
  TrendingUp, Eye, Calendar, Clock, Star, Download,
  RefreshCw, Database, Server, Zap, Globe
} from 'lucide-react';
import { supabase } from '../../../shared/lib/supabase/supabaseClient';

const AdminDashboardCompleto = () => {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [estatisticas, setEstatisticas] = useState({});
  const [refreshing, setRefreshing] = useState(false);

  const fetchEstatisticasCompletas = async () => {
    try {
      setLoading(true);
      console.log('📊 CARREGANDO DASHBOARD COMPLETO...');

      const stats = {};

      // 1. USUÁRIOS POR TIPO
      const { data: profiles } = await supabase
        .from('profiles')
        .select('tipo_usuario, last_active, joined_at');
      
      const usuariosPorTipo = profiles?.reduce((acc, p) => {
        acc[p.tipo_usuario] = (acc[p.tipo_usuario] || 0) + 1;
        return acc;
      }, {}) || {};

      // Usuários ativos (últimos 7 dias)
      const agora = new Date();
      const usuariosAtivos = profiles?.filter(p => {
        if (!p.last_active) return false;
        const ultimoAcesso = new Date(p.last_active);
        const diasSemAcesso = (agora - ultimoAcesso) / (1000 * 60 * 60 * 24);
        return diasSemAcesso <= 7;
      }).length || 0;

      stats.usuarios = {
        total: profiles?.length || 0,
        por_tipo: usuariosPorTipo,
        ativos_7_dias: usuariosAtivos,
        taxa_atividade: profiles?.length ? Math.round((usuariosAtivos / profiles.length) * 100) : 0
      };

      // 2. INSTRUMENTOS E CONTEÚDO
      const { data: instrumentos } = await supabase
        .from('instrumentos')
        .select('id, nome, categoria');
      
      const instrumentosPorCategoria = instrumentos?.reduce((acc, i) => {
        acc[i.categoria] = (acc[i.categoria] || 0) + 1;
        return acc;
      }, {}) || {};

      // Sons de instrumentos
      const { count: totalSons } = await supabase
        .from('sons_instrumentos')
        .select('*', { count: 'exact', head: true });

      // Mídias
      const { count: totalMidias } = await supabase
        .from('midias_instrumentos')
        .select('*', { count: 'exact', head: true });

      // Técnicas
      const { count: totalTecnicas } = await supabase
        .from('tecnicas_instrumentos')
        .select('*', { count: 'exact', head: true });

      // Curiosidades
      const { count: totalCuriosidades } = await supabase
        .from('curiosidades_instrumentos')
        .select('*', { count: 'exact', head: true });

      // Performances
      const { count: totalPerformances } = await supabase
        .from('performances_instrumentos')
        .select('*', { count: 'exact', head: true });

      // Quizzes
      const { count: totalQuizzes } = await supabase
        .from('quizzes_instrumentos')
        .select('*', { count: 'exact', head: true });

      stats.instrumentos = {
        total: instrumentos?.length || 0,
        por_categoria: instrumentosPorCategoria,
        conteudo: {
          sons: totalSons || 0,
          midias: totalMidias || 0,
          tecnicas: totalTecnicas || 0,
          curiosidades: totalCuriosidades || 0,
          performances: totalPerformances || 0,
          quizzes: totalQuizzes || 0
        },
        total_conteudo: (totalSons || 0) + (totalMidias || 0) + (totalTecnicas || 0) + 
                       (totalCuriosidades || 0) + (totalPerformances || 0) + (totalQuizzes || 0)
      };

      // 3. SISTEMA DE ENSINO (se existirem tabelas)
      try {
        const { count: totalTurmas } = await supabase
          .from('turmas')
          .select('*', { count: 'exact', head: true });
        
        const { count: totalAulas } = await supabase
          .from('aulas')
          .select('*', { count: 'exact', head: true });

        const { count: totalModulos } = await supabase
          .from('modulos')
          .select('*', { count: 'exact', head: true });

        stats.ensino = {
          turmas: totalTurmas || 0,
          aulas: totalAulas || 0,
          modulos: totalModulos || 0
        };
      } catch {
        stats.ensino = { turmas: 0, aulas: 0, modulos: 0 };
      }

      // 4. CRESCIMENTO (últimos 30 dias)
      const umMesAtras = new Date(agora.getTime() - 30 * 24 * 60 * 60 * 1000);
      const novosUsuarios = profiles?.filter(p => 
        p.joined_at && new Date(p.joined_at) >= umMesAtras
      ).length || 0;

      stats.crescimento = {
        novos_usuarios_30_dias: novosUsuarios,
        taxa_crescimento: profiles?.length ? Math.round((novosUsuarios / profiles.length) * 100) : 0
      };

      console.log('✅ Estatísticas carregadas:', stats);
      setEstatisticas(stats);

    } catch (error) {
      console.error('❌ Erro ao carregar estatísticas:', error);
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  };

  useEffect(() => {
    fetchEstatisticasCompletas();
  }, []);

  const handleRefresh = async () => {
    setRefreshing(true);
    await fetchEstatisticasCompletas();
  };

  if (loading && !refreshing) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-orange-50 via-red-50 to-pink-50 flex items-center justify-center">
        <div className="text-center">
          <div className="w-16 h-16 bg-red-500 rounded-full mx-auto mb-4 flex items-center justify-center animate-pulse">
            <Database className="h-8 w-8 text-white" />
          </div>
          <p className="text-gray-600">Carregando dashboard completo...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-orange-50 via-red-50 to-pink-50">
      <div className="max-w-7xl mx-auto p-6">
        
        {/* Header */}
        <div className="bg-white rounded-2xl shadow-lg p-6 mb-8">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-4">
              <div className="w-12 h-12 bg-gradient-to-br from-red-500 to-orange-500 rounded-xl flex items-center justify-center">
                <BarChart3 className="h-6 w-6 text-white" />
              </div>
              <div>
                <h1 className="text-2xl font-bold text-gray-900">Dashboard Administrativo</h1>
                <p className="text-gray-600">Visão completa do sistema Nipo School</p>
              </div>
            </div>
            <button
              onClick={handleRefresh}
              disabled={refreshing}
              className="flex items-center space-x-2 px-4 py-2 bg-blue-600 text-white rounded-xl hover:bg-blue-700 transition-colors disabled:opacity-50"
            >
              <RefreshCw className={`h-5 w-5 ${refreshing ? 'animate-spin' : ''}`} />
              <span>Atualizar</span>
            </button>
          </div>
        </div>

        {/* Métricas Principais */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          
          {/* Total de Usuários */}
          <div className="bg-white rounded-xl p-6 shadow-lg">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-gray-600 text-sm">Total de Usuários</p>
                <h3 className="text-3xl font-bold text-gray-900">{estatisticas.usuarios?.total || 0}</h3>
                <p className="text-green-600 text-sm">
                  {estatisticas.usuarios?.taxa_atividade || 0}% ativos
                </p>
              </div>
              <Users className="h-12 w-12 text-blue-500" />
            </div>
          </div>

          {/* Total de Instrumentos */}
          <div className="bg-white rounded-xl p-6 shadow-lg">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-gray-600 text-sm">Instrumentos</p>
                <h3 className="text-3xl font-bold text-gray-900">{estatisticas.instrumentos?.total || 0}</h3>
                <p className="text-purple-600 text-sm">
                  {Object.keys(estatisticas.instrumentos?.por_categoria || {}).length} categorias
                </p>
              </div>
              <Music className="h-12 w-12 text-purple-500" />
            </div>
          </div>

          {/* Total de Conteúdo */}
          <div className="bg-white rounded-xl p-6 shadow-lg">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-gray-600 text-sm">Conteúdo Total</p>
                <h3 className="text-3xl font-bold text-gray-900">{estatisticas.instrumentos?.total_conteudo || 0}</h3>
                <p className="text-orange-600 text-sm">
                  {estatisticas.instrumentos?.conteudo?.sons || 0} sons + {estatisticas.instrumentos?.conteudo?.midias || 0} mídias
                </p>
              </div>
              <BookOpen className="h-12 w-12 text-orange-500" />
            </div>
          </div>

          {/* Crescimento */}
          <div className="bg-white rounded-xl p-6 shadow-lg">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-gray-600 text-sm">Crescimento (30d)</p>
                <h3 className="text-3xl font-bold text-gray-900">{estatisticas.crescimento?.novos_usuarios_30_dias || 0}</h3>
                <p className="text-green-600 text-sm">
                  +{estatisticas.crescimento?.taxa_crescimento || 0}% este mês
                </p>
              </div>
              <TrendingUp className="h-12 w-12 text-green-500" />
            </div>
          </div>

        </div>

        {/* Detalhes por Seção */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          
          {/* Usuários por Tipo */}
          <div className="bg-white rounded-xl p-6 shadow-lg">
            <h3 className="text-xl font-bold text-gray-900 mb-4">Usuários por Tipo</h3>
            <div className="space-y-4">
              {Object.entries(estatisticas.usuarios?.por_tipo || {}).map(([tipo, quantidade]) => (
                <div key={tipo} className="flex items-center justify-between">
                  <div className="flex items-center space-x-3">
                    <div className={`w-3 h-3 rounded-full ${
                      tipo === 'aluno' ? 'bg-blue-500' :
                      tipo === 'professor' ? 'bg-green-500' :
                      tipo === 'admin' ? 'bg-red-500' :
                      'bg-gray-400'
                    }`}></div>
                    <span className="capitalize font-medium">{tipo}s</span>
                  </div>
                  <span className="text-2xl font-bold text-gray-900">{quantidade}</span>
                </div>
              ))}
            </div>
          </div>

          {/* Conteúdo por Tipo */}
          <div className="bg-white rounded-xl p-6 shadow-lg">
            <h3 className="text-xl font-bold text-gray-900 mb-4">Conteúdo Detalhado</h3>
            <div className="space-y-4">
              {Object.entries(estatisticas.instrumentos?.conteudo || {}).map(([tipo, quantidade]) => (
                <div key={tipo} className="flex items-center justify-between">
                  <div className="flex items-center space-x-3">
                    <div className="w-3 h-3 rounded-full bg-purple-500"></div>
                    <span className="capitalize font-medium">{tipo}</span>
                  </div>
                  <span className="text-2xl font-bold text-gray-900">{quantidade}</span>
                </div>
              ))}
            </div>
          </div>

        </div>

        {/* Ações Rápidas */}
        <div className="mt-8 bg-white rounded-xl p-6 shadow-lg">
          <h3 className="text-xl font-bold text-gray-900 mb-6">Ações Administrativas</h3>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            
            <button
              onClick={() => navigate('/admin/alunos')}
              className="flex items-center space-x-3 p-4 bg-blue-50 hover:bg-blue-100 rounded-xl transition-colors group"
            >
              <Users className="h-8 w-8 text-blue-600 group-hover:text-blue-700" />
              <div>
                <h4 className="font-semibold text-blue-800">Gerenciar Alunos</h4>
                <p className="text-blue-600 text-sm">{estatisticas.usuarios?.por_tipo?.aluno || 0} alunos cadastrados</p>
              </div>
            </button>

            <button
              onClick={() => navigate('/admin/professores')}
              className="flex items-center space-x-3 p-4 bg-green-50 hover:bg-green-100 rounded-xl transition-colors group"
            >
              <Award className="h-8 w-8 text-green-600 group-hover:text-green-700" />
              <div>
                <h4 className="font-semibold text-green-800">Gerenciar Professores</h4>
                <p className="text-green-600 text-sm">{estatisticas.usuarios?.por_tipo?.professor || 0} professores ativos</p>
              </div>
            </button>

            <button
              onClick={() => navigate('/admin/instruments')}
              className="flex items-center space-x-3 p-4 bg-purple-50 hover:bg-purple-100 rounded-xl transition-colors group"
            >
              <Music className="h-8 w-8 text-purple-600 group-hover:text-purple-700" />
              <div>
                <h4 className="font-semibold text-purple-800">Gerenciar Instrumentos</h4>
                <p className="text-purple-600 text-sm">{estatisticas.instrumentos?.total || 0} instrumentos disponíveis</p>
              </div>
            </button>

          </div>
        </div>

      </div>
    </div>
  );
};

export default AdminDashboardCompleto;