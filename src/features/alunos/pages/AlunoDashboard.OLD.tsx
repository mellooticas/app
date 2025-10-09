/**
 * 🎓 DASHBOARD DO ALUNO - VERSÃO LIMPA
 * 
 * Página simples que mostra métricas REAIS do banco de dados
 * Usa APENAS a view_dashboard_aluno (pré-calculada)
 */

import React from 'react'
import { Trophy, BookOpen, Award, TrendingUp, Loader2 } from 'lucide-react'
import { useDashboard } from '../hooks/useDashboard'

export const AlunoDashboard: React.FC = () => {
  const { dashboard, isLoading, error } = useDashboard()

  if (isLoading) {
    return (
      <div className="flex items-center justify-center h-screen">
        <Loader2 className="w-12 h-12 animate-spin text-indigo-600" />
      </div>
    )
  }

  if (error) {
    return (
      <div className="flex items-center justify-center h-screen">
        <div className="text-center">
          <p className="text-red-600 text-lg">❌ Erro ao carregar dashboard</p>
          <p className="text-gray-600 mt-2">{error}</p>
        </div>
      </div>
    )
  }

  if (!dashboard) {
    return (
      <div className="flex items-center justify-center h-screen">
        <p className="text-gray-600">Nenhum dado encontrado</p>
      </div>
    )
  }

  return (
    <div className="max-w-7xl mx-auto px-4 py-8 space-y-8">
      {/* Header */}
      <div>
        <h1 className="text-3xl font-bold text-gray-900">
          Olá, {dashboard.full_name}! 👋
        </h1>
        <p className="text-gray-600 mt-2">
          Seu progresso em música japonesa
        </p>
      </div>

      {/* Stats Grid - DADOS REAIS DO BANCO */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {/* Total de Pontos */}
        <div className="bg-white rounded-lg shadow p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-gray-600">Total de Pontos</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">
                {dashboard.total_points.toLocaleString()}
              </p>
            </div>
            <div className="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center">
              <TrendingUp className="w-6 h-6 text-indigo-600" />
            </div>
          </div>
          {dashboard.current_streak > 0 && (
            <p className="text-sm text-indigo-600 mt-2">
              🔥 {dashboard.current_streak} dias de sequência
            </p>
          )}
        </div>

        {/* Conquistas */}
        <div className="bg-white rounded-lg shadow p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-gray-600">Conquistas</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">
                {dashboard.total_achievements}
              </p>
            </div>
            <div className="w-12 h-12 bg-yellow-100 rounded-full flex items-center justify-center">
              <Trophy className="w-6 h-6 text-yellow-600" />
            </div>
          </div>
          {dashboard.achievements_last_week > 0 && (
            <p className="text-sm text-green-600 mt-2">
              ✨ +{dashboard.achievements_last_week} esta semana
            </p>
          )}
        </div>

        {/* Submissões */}
        <div className="bg-white rounded-lg shadow p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-gray-600">Desafios</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">
                {dashboard.submissoes_avaliadas}/{dashboard.total_submissoes}
              </p>
            </div>
            <div className="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center">
              <Award className="w-6 h-6 text-green-600" />
            </div>
          </div>
          <p className="text-sm text-gray-600 mt-2">
            Avaliados
          </p>
        </div>

        {/* Aulas Completadas */}
        <div className="bg-white rounded-lg shadow p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-gray-600">Aulas Concluídas</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">
                {dashboard.lessons_completed}
              </p>
            </div>
            <div className="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center">
              <BookOpen className="w-6 h-6 text-purple-600" />
            </div>
          </div>
          <p className="text-sm text-gray-600 mt-2">
            {dashboard.modules_completed} módulos completos
          </p>
        </div>
      </div>

      {/* Info adicional */}
      <div className="bg-blue-50 border border-blue-200 rounded-lg p-6">
        <h2 className="text-lg font-semibold text-blue-900 mb-2">
          📊 Resumo do Perfil
        </h2>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
          <div>
            <p className="text-blue-600 font-medium">Portfólios</p>
            <p className="text-blue-900 text-2xl font-bold">{dashboard.total_portfolios}</p>
          </div>
          <div>
            <p className="text-blue-600 font-medium">Melhor Sequência</p>
            <p className="text-blue-900 text-2xl font-bold">{dashboard.best_streak} dias</p>
          </div>
          <div>
            <p className="text-blue-600 font-medium">Submissões Pendentes</p>
            <p className="text-blue-900 text-2xl font-bold">
              {dashboard.total_submissoes - dashboard.submissoes_avaliadas}
            </p>
          </div>
          <div>
            <p className="text-blue-600 font-medium">Status</p>
            <p className="text-blue-900 text-2xl font-bold">
              {dashboard.current_streak > 0 ? '🟢 Ativo' : '🔴 Inativo'}
            </p>
          </div>
        </div>
      </div>

      {/* Debug Info - REMOVER EM PRODUÇÃO */}
      <details className="bg-gray-50 border border-gray-200 rounded-lg p-4">
        <summary className="cursor-pointer font-semibold text-gray-700">
          🔍 Dados Brutos (Debug)
        </summary>
        <pre className="mt-4 text-xs bg-gray-900 text-green-400 p-4 rounded overflow-auto">
          {JSON.stringify(dashboard, null, 2)}
        </pre>
      </details>
    </div>
  )
}
