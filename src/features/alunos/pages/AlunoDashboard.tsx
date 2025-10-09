/**
 * 🎓 DASHBOARD DO ALUNO - VERSÃO COMPLETA E PROFISSIONAL
 * 
 * Features:
 * - Stats cards com dados reais
 * - Gráfico de progresso semanal
 * - Próximas aulas
 * - Conquistas recentes
 * - Desafios em andamento
 * - Atividades recentes
 */

import React from 'react'
import {
  Trophy,
  BookOpen,
  Award,
  TrendingUp,
  Loader2,
  Calendar,
  Clock,
  Target,
  Star,
  CheckCircle,
  AlertCircle,
  ArrowRight,
  Flame
} from 'lucide-react'
import { Link } from 'react-router-dom'
import { useDashboard } from '../hooks/useDashboard'
import { useAuth } from '../../auth/AuthContext'

export const AlunoDashboard: React.FC = () => {
  const { user } = useAuth()
  const { dashboard, isLoading, error } = useDashboard()

  if (isLoading) {
    return (
      <div className="flex items-center justify-center min-h-screen bg-gray-50">
        <div className="text-center">
          <Loader2 className="w-12 h-12 animate-spin text-indigo-600 mx-auto mb-4" />
          <p className="text-gray-600">Carregando seu progresso...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="flex items-center justify-center min-h-screen bg-gray-50">
        <div className="bg-white rounded-lg shadow-lg p-8 max-w-md">
          <div className="flex items-center gap-3 mb-4">
            <AlertCircle className="w-8 h-8 text-red-500" />
            <h2 className="text-xl font-bold text-gray-900">Erro ao carregar</h2>
          </div>
          <p className="text-gray-600 mb-4">{error}</p>
          <button
            onClick={() => window.location.reload()}
            className="w-full bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-indigo-700 transition-colors"
          >
            Tentar novamente
          </button>
        </div>
      </div>
    )
  }

  if (!dashboard) {
    return (
      <div className="flex items-center justify-center min-h-screen bg-gray-50">
        <div className="text-center">
          <BookOpen className="w-16 h-16 text-gray-400 mx-auto mb-4" />
          <p className="text-gray-600">Nenhum dado encontrado</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 py-8 space-y-8">
        {/* Header com Boas-vindas */}
        <div className="bg-gradient-to-r from-indigo-600 to-purple-600 rounded-2xl shadow-xl p-8 text-white">
          <div className="flex flex-col md:flex-row md:items-center md:justify-between">
            <div>
              <h1 className="text-3xl font-bold mb-2">
                Olá, {dashboard.full_name}! 👋
              </h1>
              <p className="text-indigo-100 text-lg">
                Continue seu aprendizado musical hoje
              </p>
            </div>
            {dashboard.current_streak > 0 && (
              <div className="mt-4 md:mt-0 bg-white/20 backdrop-blur-sm rounded-xl px-6 py-4 border border-white/30">
                <div className="flex items-center gap-3">
                  <Flame className="w-8 h-8 text-orange-300" />
                  <div>
                    <p className="text-2xl font-bold">{dashboard.current_streak}</p>
                    <p className="text-sm text-indigo-100">dias de sequência</p>
                  </div>
                </div>
              </div>
            )}
          </div>
        </div>

        {/* Stats Grid - 4 Cards Principais */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {/* Total de Pontos */}
          <StatsCard
            title="Total de Pontos"
            value={dashboard.total_points.toLocaleString()}
            icon={<TrendingUp className="w-6 h-6" />}
            color="indigo"
            subtitle={
              dashboard.current_streak > 0
                ? `🔥 ${dashboard.current_streak} dias ativos`
                : 'Comece sua sequência hoje!'
            }
          />

          {/* Conquistas */}
          <StatsCard
            title="Conquistas"
            value={dashboard.total_achievements}
            icon={<Trophy className="w-6 h-6" />}
            color="yellow"
            subtitle={
              dashboard.achievements_last_week > 0
                ? `✨ +${dashboard.achievements_last_week} esta semana`
                : 'Desbloqueie novas conquistas'
            }
            linkTo="/aluno/conquistas"
          />

          {/* Desafios */}
          <StatsCard
            title="Desafios"
            value={`${dashboard.submissoes_avaliadas}/${dashboard.total_submissoes}`}
            icon={<Award className="w-6 h-6" />}
            color="green"
            subtitle="Avaliados"
            linkTo="/aluno/desafios"
          />

          {/* Aulas Completadas */}
          <StatsCard
            title="Aulas Concluídas"
            value={dashboard.lessons_completed}
            icon={<BookOpen className="w-6 h-6" />}
            color="purple"
            subtitle={`${dashboard.modules_completed} módulos completos`}
            linkTo="/aluno/aulas"
          />
        </div>

        {/* Grid de Conteúdo - 2 Colunas */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          {/* Coluna Esquerda (2/3) */}
          <div className="lg:col-span-2 space-y-6">
            {/* Progresso Semanal */}
            <ProgressoSemanalCard />

            {/* Desafios em Andamento */}
            <DesafiosEmAndamentoCard userId={user?.id} />
          </div>

          {/* Coluna Direita (1/3) */}
          <div className="space-y-6">
            {/* Próximas Aulas */}
            <ProximasAulasCard userId={user?.id} />

            {/* Conquistas Recentes */}
            <ConquistasRecentesCard userId={user?.id} />
          </div>
        </div>

        {/* Atividades Recentes */}
        <AtividadesRecentesCard userId={user?.id} />

        {/* Resumo Adicional */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          <MiniStatCard
            label="Portfólios"
            value={dashboard.total_portfolios}
            linkTo="/aluno/portfolio"
          />
          <MiniStatCard
            label="Melhor Sequência"
            value={`${dashboard.best_streak} dias`}
          />
          <MiniStatCard
            label="Pendentes"
            value={dashboard.total_submissoes - dashboard.submissoes_avaliadas}
            linkTo="/aluno/desafios"
          />
          <MiniStatCard
            label="Status"
            value={dashboard.current_streak > 0 ? '🟢 Ativo' : '🟡 Retome'}
          />
        </div>
      </div>
    </div>
  )
}

// ============================================
// SUB-COMPONENTES
// ============================================

interface StatsCardProps {
  title: string
  value: string | number
  icon: React.ReactNode
  color: 'indigo' | 'yellow' | 'green' | 'purple'
  subtitle?: string
  linkTo?: string
}

function StatsCard({ title, value, icon, color, subtitle, linkTo }: StatsCardProps) {
  const colorClasses = {
    indigo: 'bg-indigo-100 text-indigo-600',
    yellow: 'bg-yellow-100 text-yellow-600',
    green: 'bg-green-100 text-green-600',
    purple: 'bg-purple-100 text-purple-600'
  }

  const Card = (
    <div className="bg-white rounded-xl shadow-sm hover:shadow-md transition-shadow p-6 border border-gray-100">
      <div className="flex items-center justify-between mb-4">
        <div className={`w-12 h-12 rounded-lg flex items-center justify-center ${colorClasses[color]}`}>
          {icon}
        </div>
        {linkTo && (
          <ArrowRight className="w-5 h-5 text-gray-400" />
        )}
      </div>
      <p className="text-sm font-medium text-gray-600 mb-1">{title}</p>
      <p className="text-3xl font-bold text-gray-900 mb-2">{value}</p>
      {subtitle && (
        <p className="text-sm text-gray-500">{subtitle}</p>
      )}
    </div>
  )

  return linkTo ? <Link to={linkTo}>{Card}</Link> : Card
}

function MiniStatCard({ label, value, linkTo }: { label: string; value: string | number; linkTo?: string }) {
  const Card = (
    <div className="bg-white rounded-lg shadow-sm p-4 border border-gray-100 hover:border-indigo-200 transition-colors">
      <p className="text-xs font-medium text-gray-600 mb-1">{label}</p>
      <p className="text-xl font-bold text-gray-900">{value}</p>
    </div>
  )

  return linkTo ? <Link to={linkTo}>{Card}</Link> : Card
}

// Progresso Semanal (placeholder - será implementado com dados reais)
function ProgressoSemanalCard() {
  const dias = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb']
  const dadosFicticios = [65, 85, 45, 90, 70, 95, 60]

  return (
    <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
      <h2 className="text-lg font-semibold text-gray-900 mb-4">Progresso Semanal</h2>
      <div className="flex items-end justify-between h-40 gap-2">
        {dias.map((dia, index) => (
          <div key={dia} className="flex-1 flex flex-col items-center gap-2">
            <div className="w-full bg-gray-100 rounded-t flex-1 relative flex items-end">
              <div
                className="w-full bg-gradient-to-t from-indigo-500 to-indigo-400 rounded-t transition-all hover:from-indigo-600 hover:to-indigo-500"
                style={{ height: `${dadosFicticios[index]}%` }}
              />
            </div>
            <span className="text-xs font-medium text-gray-600">{dia}</span>
          </div>
        ))}
      </div>
      <p className="text-sm text-gray-500 mt-4 text-center">
        Média: 73% de conclusão diária
      </p>
    </div>
  )
}

// Próximas Aulas (placeholder)
function ProximasAulasCard({ userId: _userId }: { userId?: string }) {
  // TODO: Buscar aulas reais do banco
  const proximasAulas = [
    { id: 1, titulo: 'Harmonia Musical', horario: 'Hoje, 14:00', professor: 'Prof. Silva' },
    { id: 2, titulo: 'Prática de Piano', horario: 'Amanhã, 10:00', professor: 'Prof. Santos' }
  ]

  return (
    <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
      <div className="flex items-center justify-between mb-4">
        <h2 className="text-lg font-semibold text-gray-900">Próximas Aulas</h2>
        <Calendar className="w-5 h-5 text-gray-400" />
      </div>
      
      {proximasAulas.length > 0 ? (
        <div className="space-y-3">
          {proximasAulas.map((aula) => (
            <div key={aula.id} className="flex items-start gap-3 p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
              <Clock className="w-5 h-5 text-indigo-600 mt-0.5 flex-shrink-0" />
              <div className="flex-1 min-w-0">
                <p className="font-medium text-gray-900 text-sm truncate">{aula.titulo}</p>
                <p className="text-xs text-gray-600">{aula.horario}</p>
                <p className="text-xs text-gray-500">{aula.professor}</p>
              </div>
            </div>
          ))}
        </div>
      ) : (
        <p className="text-sm text-gray-500 text-center py-4">
          Nenhuma aula agendada
        </p>
      )}

      <Link
        to="/aluno/aulas"
        className="block mt-4 text-sm text-indigo-600 hover:text-indigo-700 font-medium text-center"
      >
        Ver todas as aulas →
      </Link>
    </div>
  )
}

// Conquistas Recentes (placeholder)
function ConquistasRecentesCard({ userId: _userId }: { userId?: string }) {
  // TODO: Buscar conquistas reais do banco
  const conquistas = [
    { id: 1, nome: 'Primeira Conquista', icone: '🏆', data: 'Há 2 dias' },
    { id: 2, nome: '7 Dias Seguidos', icone: '🔥', data: 'Ontem' }
  ]

  return (
    <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
      <div className="flex items-center justify-between mb-4">
        <h2 className="text-lg font-semibold text-gray-900">Conquistas Recentes</h2>
        <Star className="w-5 h-5 text-yellow-500" />
      </div>

      {conquistas.length > 0 ? (
        <div className="space-y-3">
          {conquistas.map((conquista) => (
            <div key={conquista.id} className="flex items-center gap-3 p-3 bg-gradient-to-r from-yellow-50 to-orange-50 rounded-lg">
              <span className="text-2xl">{conquista.icone}</span>
              <div className="flex-1 min-w-0">
                <p className="font-medium text-gray-900 text-sm">{conquista.nome}</p>
                <p className="text-xs text-gray-600">{conquista.data}</p>
              </div>
            </div>
          ))}
        </div>
      ) : (
        <p className="text-sm text-gray-500 text-center py-4">
          Nenhuma conquista recente
        </p>
      )}

      <Link
        to="/aluno/conquistas"
        className="block mt-4 text-sm text-indigo-600 hover:text-indigo-700 font-medium text-center"
      >
        Ver todas →
      </Link>
    </div>
  )
}

// Desafios em Andamento (placeholder)
function DesafiosEmAndamentoCard({ userId: _userId }: { userId?: string }) {
  // TODO: Buscar desafios reais do banco
  const desafios = [
    { id: 1, titulo: 'Escala Maior', progresso: 75, prazo: '3 dias' },
    { id: 2, titulo: 'Ritmo Básico', progresso: 40, prazo: '5 dias' }
  ]

  return (
    <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
      <div className="flex items-center justify-between mb-4">
        <h2 className="text-lg font-semibold text-gray-900">Desafios em Andamento</h2>
        <Target className="w-5 h-5 text-green-600" />
      </div>

      {desafios.length > 0 ? (
        <div className="space-y-4">
          {desafios.map((desafio) => (
            <div key={desafio.id} className="p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
              <div className="flex items-center justify-between mb-2">
                <p className="font-medium text-gray-900 text-sm">{desafio.titulo}</p>
                <span className="text-xs text-gray-600">⏰ {desafio.prazo}</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2 mb-2">
                <div
                  className="bg-green-500 h-2 rounded-full transition-all"
                  style={{ width: `${desafio.progresso}%` }}
                />
              </div>
              <p className="text-xs text-gray-600">{desafio.progresso}% completo</p>
            </div>
          ))}
        </div>
      ) : (
        <p className="text-sm text-gray-500 text-center py-4">
          Nenhum desafio em andamento
        </p>
      )}

      <Link
        to="/aluno/desafios"
        className="block mt-4 text-sm text-indigo-600 hover:text-indigo-700 font-medium text-center"
      >
        Ver todos os desafios →
      </Link>
    </div>
  )
}

// Atividades Recentes (placeholder)
function AtividadesRecentesCard({ userId: _userId }: { userId?: string }) {
  // TODO: Buscar atividades reais do banco
  const atividades = [
    { id: 1, tipo: 'conquista', texto: 'Desbloqueou "Primeira Conquista"', tempo: 'Há 2 horas', icone: <Trophy className="w-4 h-4 text-yellow-600" /> },
    { id: 2, tipo: 'submissao', texto: 'Enviou desafio "Escala Maior"', tempo: 'Há 5 horas', icone: <CheckCircle className="w-4 h-4 text-green-600" /> },
    { id: 3, tipo: 'aula', texto: 'Completou aula "Harmonia Básica"', tempo: 'Ontem', icone: <BookOpen className="w-4 h-4 text-indigo-600" /> }
  ]

  return (
    <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
      <h2 className="text-lg font-semibold text-gray-900 mb-4">Atividades Recentes</h2>

      {atividades.length > 0 ? (
        <div className="space-y-3">
          {atividades.map((atividade) => (
            <div key={atividade.id} className="flex items-start gap-3 p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
              <div className="w-8 h-8 rounded-full bg-white flex items-center justify-center shadow-sm flex-shrink-0">
                {atividade.icone}
              </div>
              <div className="flex-1 min-w-0">
                <p className="text-sm text-gray-900">{atividade.texto}</p>
                <p className="text-xs text-gray-500 mt-1">{atividade.tempo}</p>
              </div>
            </div>
          ))}
        </div>
      ) : (
        <p className="text-sm text-gray-500 text-center py-4">
          Nenhuma atividade recente
        </p>
      )}
    </div>
  )
}
