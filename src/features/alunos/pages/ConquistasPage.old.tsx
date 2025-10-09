import { useState } from 'react'
import { Trophy, Lock, Star } from 'lucide-react'
import { useGamification } from '../hooks'

export default function ConquistasPage() {
  const [filter, setFilter] = useState<'all' | 'unlocked' | 'locked'>('all')
  const { badges, conquistas, perfil, loading, error } = useGamification()

  // Transformar dados reais do Supabase em formato de achievements
  const achievements = [
    ...badges.map((badge) => ({
      id: badge.id,
      name: badge.nome_badge,
      description: badge.descricao || 'Conquista desbloqueada!',
      badge_icon: badge.icone || '�',
      badge_color: badge.cor || '#3B82F6',
      points_reward: 0,
      is_unlocked: true,
      unlocked_at: new Date(badge.data_conquista).toISOString().split('T')[0],
    })),
    ...conquistas.map((c) => ({
      id: c.id,
      name: c.nome_conquista,
      description: c.descricao || 'Conquista especial',
      badge_icon: '🎖️',
      badge_color: '#8B5CF6',
      points_reward: c.valor_conquista || 0,
      is_unlocked: true,
      unlocked_at: new Date(c.data_conquista).toISOString().split('T')[0],
    })),
  ]

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
          <p className="text-gray-600 mt-4">Carregando conquistas...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center text-red-600">
          <p>Erro ao carregar conquistas: {error}</p>
        </div>
      </div>
    )
  }

  const filteredAchievements = achievements.filter((achievement) => {
    if (filter === 'unlocked') return achievement.is_unlocked
    if (filter === 'locked') return !achievement.is_unlocked
    return true
  })

  const stats = {
    total: achievements.length,
    unlocked: achievements.filter((a) => a.is_unlocked).length,
    points: perfil?.total_pontos || 0,
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Minhas Conquistas</h1>
        <p className="text-gray-600">Desbloqueie conquistas e ganhe pontos!</p>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <div className="flex items-center gap-3">
            <div className="p-3 bg-indigo-100 rounded-lg">
              <Trophy className="w-6 h-6 text-indigo-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600">Total de Conquistas</p>
              <p className="text-2xl font-bold text-gray-900">{stats.total}</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <div className="flex items-center gap-3">
            <div className="p-3 bg-green-100 rounded-lg">
              <Star className="w-6 h-6 text-green-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600">Desbloqueadas</p>
              <p className="text-2xl font-bold text-gray-900">
                {stats.unlocked} / {stats.total}
              </p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <div className="flex items-center gap-3">
            <div className="p-3 bg-yellow-100 rounded-lg">
              <Trophy className="w-6 h-6 text-yellow-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600">Pontos Ganhos</p>
              <p className="text-2xl font-bold text-gray-900">{stats.points} pts</p>
            </div>
          </div>
        </div>
      </div>

      {/* Filters */}
      <div className="flex gap-2 mb-6">
        <button
          onClick={() => setFilter('all')}
          className={`px-4 py-2 rounded-lg font-medium transition-colors ${
            filter === 'all'
              ? 'bg-indigo-600 text-white'
              : 'bg-white text-gray-700 border border-gray-300 hover:bg-gray-50'
          }`}
        >
          Todas ({achievements.length})
        </button>
        <button
          onClick={() => setFilter('unlocked')}
          className={`px-4 py-2 rounded-lg font-medium transition-colors ${
            filter === 'unlocked'
              ? 'bg-indigo-600 text-white'
              : 'bg-white text-gray-700 border border-gray-300 hover:bg-gray-50'
          }`}
        >
          Desbloqueadas ({stats.unlocked})
        </button>
        <button
          onClick={() => setFilter('locked')}
          className={`px-4 py-2 rounded-lg font-medium transition-colors ${
            filter === 'locked'
              ? 'bg-indigo-600 text-white'
              : 'bg-white text-gray-700 border border-gray-300 hover:bg-gray-50'
          }`}
        >
          Bloqueadas ({stats.total - stats.unlocked})
        </button>
      </div>

      {/* Achievements Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {filteredAchievements.map((achievement) => (
          <div
            key={achievement.id}
            className={`bg-white rounded-xl shadow-sm p-6 border border-gray-200 transition-all hover:shadow-md ${
              !achievement.is_unlocked ? 'opacity-60' : ''
            }`}
          >
            {/* Badge Icon */}
            <div className="flex items-start justify-between mb-4">
              <div
                className="text-5xl p-3 rounded-xl"
                style={{ backgroundColor: achievement.badge_color + '20' }}
              >
                {achievement.is_unlocked ? achievement.badge_icon : <Lock className="w-8 h-8 text-gray-400" />}
              </div>
              {achievement.is_unlocked && (
                <span className="px-3 py-1 bg-green-100 text-green-700 text-sm font-medium rounded-full">
                  Desbloqueada
                </span>
              )}
            </div>

            {/* Info */}
            <h3 className="text-xl font-bold text-gray-900 mb-2">{achievement.name}</h3>
            <p className="text-gray-600 mb-4">{achievement.description}</p>

            {/* Footer */}
            <div className="flex items-center justify-between pt-4 border-t border-gray-200">
              <span className="text-sm font-medium text-indigo-600">+{achievement.points_reward} pts</span>
              {achievement.unlocked_at && (
                <span className="text-xs text-gray-500">
                  {new Date(achievement.unlocked_at).toLocaleDateString('pt-BR')}
                </span>
              )}
            </div>
          </div>
        ))}
      </div>

      {/* Empty State */}
      {filteredAchievements.length === 0 && (
        <div className="text-center py-12">
          <Lock className="w-16 h-16 text-gray-400 mx-auto mb-4" />
          <h3 className="text-xl font-semibold text-gray-900 mb-2">Nenhuma conquista encontrada</h3>
          <p className="text-gray-600">Continue estudando para desbloquear novas conquistas!</p>
        </div>
      )}
    </div>
  )
}
