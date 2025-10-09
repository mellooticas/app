import { Award, Mail, TrendingUp, User } from 'lucide-react'
import { useAuth } from '../../auth/AuthContext'
import { useGamification } from '../hooks'

export default function PerfilPage() {
  const { user } = useAuth()
  const { perfil, badges, conquistas, loading } = useGamification()

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Carregando perfil...</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Meu Perfil</h1>
        <p className="text-gray-600">Suas informações e estatísticas</p>
      </div>

      <div className="max-w-4xl mx-auto space-y-6">
        {/* Card de Perfil */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
          <div className="flex items-start gap-6">
            {/* Avatar */}
            <div className="w-24 h-24 bg-gradient-to-br from-indigo-500 to-purple-600 rounded-full flex items-center justify-center flex-shrink-0">
              <User className="w-12 h-12 text-white" />
            </div>

            {/* Informações Principais */}
            <div className="flex-1">
              <h2 className="text-2xl font-bold text-gray-900 mb-1">
                {(user as any)?.user_metadata?.full_name || 'Aluno'}
              </h2>
              <div className="flex items-center gap-2 text-gray-600 mb-4">
                <Mail className="w-4 h-4" />
                <span className="text-sm">{user?.email}</span>
              </div>

              {/* Nível e Pontos */}
              {perfil && (
                <div className="flex items-center gap-6">
                  <div className="flex items-center gap-2">
                    <div
                      className="px-3 py-1 rounded-lg font-semibold text-sm"
                      style={{ backgroundColor: perfil.cor_nivel + '20', color: perfil.cor_nivel }}
                    >
                      Nível {perfil.nivel_atual} - {perfil.nome_nivel}
                    </div>
                  </div>
                  <div className="flex items-center gap-2 text-indigo-600">
                    <TrendingUp className="w-5 h-5" />
                    <span className="font-bold text-lg">{perfil.total_pontos}</span>
                    <span className="text-sm text-gray-600">pontos</span>
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>

        {/* Estatísticas */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {/* Badges */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <div className="flex items-center gap-2 mb-2">
              <Award className="w-5 h-5 text-yellow-600" />
              <h3 className="font-bold text-gray-900">Badges</h3>
            </div>
            <p className="text-3xl font-bold text-gray-900">{badges.length}</p>
            <p className="text-sm text-gray-600">Conquistados</p>
          </div>

          {/* Conquistas */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <div className="flex items-center gap-2 mb-2">
              <Award className="w-5 h-5 text-purple-600" />
              <h3 className="font-bold text-gray-900">Conquistas</h3>
            </div>
            <p className="text-3xl font-bold text-gray-900">{conquistas.length}</p>
            <p className="text-sm text-gray-600">Desbloqueadas</p>
          </div>

          {/* Pontos Totais */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <div className="flex items-center gap-2 mb-2">
              <TrendingUp className="w-5 h-5 text-indigo-600" />
              <h3 className="font-bold text-gray-900">Pontos</h3>
            </div>
            <p className="text-3xl font-bold text-gray-900">{perfil?.total_pontos || 0}</p>
            <p className="text-sm text-gray-600">Total acumulado</p>
          </div>
        </div>

        {/* Últimos Badges */}
        {badges.length > 0 && (
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <h3 className="font-bold text-gray-900 mb-4">Badges Recentes</h3>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              {badges.slice(0, 4).map((badge) => (
                <div
                  key={badge.id}
                  className="p-4 border border-gray-200 rounded-lg text-center hover:border-indigo-300 hover:bg-indigo-50 transition-colors"
                >
                  <div className="text-4xl mb-2">{badge.icone || '🏆'}</div>
                  <p className="text-sm font-medium text-gray-900 line-clamp-2">{badge.nome_badge}</p>
                  <p className="text-xs text-gray-500 mt-1">
                    {new Date(badge.data_conquista).toLocaleDateString('pt-BR')}
                  </p>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Informações da Conta */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
          <h3 className="font-bold text-gray-900 mb-4">Informações da Conta</h3>
          <div className="space-y-3">
            <div className="flex items-center justify-between py-2 border-b border-gray-100">
              <span className="text-sm text-gray-600">ID do Usuário</span>
              <span className="text-sm font-mono text-gray-900">{user?.id.slice(0, 8)}...</span>
            </div>
            <div className="flex items-center justify-between py-2 border-b border-gray-100">
              <span className="text-sm text-gray-600">Tipo de Conta</span>
              <span className="px-2 py-1 bg-indigo-100 text-indigo-700 text-xs font-medium rounded capitalize">
                {(user as any)?.user_metadata?.tipo_usuario || 'Aluno'}
              </span>
            </div>
            <div className="flex items-center justify-between py-2">
              <span className="text-sm text-gray-600">Email</span>
              <span className="text-sm text-gray-900">{user?.email}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
