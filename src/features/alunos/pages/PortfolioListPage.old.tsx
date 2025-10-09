import { Plus, Eye, Lock, Globe } from 'lucide-react'
import { Link } from 'react-router-dom'
import { ROUTES } from '@/lib/constants/routes'
import { usePortfolio } from '../hooks'

export default function PortfolioListPage() {
  const { portfolios, loading, error } = usePortfolio()

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
          <p className="text-gray-600 mt-4">Carregando portfolios...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center text-red-600">
          <p>Erro ao carregar portfolios: {error}</p>
        </div>
      </div>
    )
  }

  // Mapear dados do Supabase para o formato usado no componente
  const portfoliosFormatados = portfolios.map((p) => ({
    id: p.id,
    title: p.titulo,
    description: p.descricao || '',
    visibility: p.visibilidade, // 'privado' | 'turma' | 'publico'
    evidence_count: 0, // TODO: buscar contagem real de evidências
    created_at: p.created_at,
    cover_image: undefined,
  }))

  const getVisibilityIcon = (visibility: string) => {
    switch (visibility) {
      case 'public':
        return <Globe className="w-4 h-4" />
      case 'private':
        return <Lock className="w-4 h-4" />
      default:
        return <Eye className="w-4 h-4" />
    }
  }

  const getVisibilityLabel = (visibility: string) => {
    switch (visibility) {
      case 'public':
        return 'Público'
      case 'private':
        return 'Privado'
      default:
        return 'Turma'
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      {/* Header */}
      <div className="flex items-center justify-between mb-8">
        <div>
          <h1 className="text-3xl font-bold text-gray-900 mb-2">Meus Portfólios</h1>
          <p className="text-gray-600">Organize e compartilhe suas evidências de aprendizado</p>
        </div>
        <Link
          to={ROUTES.ALUNO.PORTFOLIO.CREATE}
          className="flex items-center gap-2 px-6 py-3 bg-indigo-600 text-white rounded-lg font-medium hover:bg-indigo-700 transition-colors"
        >
          <Plus className="w-5 h-5" />
          Criar Portfólio
        </Link>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <p className="text-sm text-gray-600 mb-1">Total de Portfólios</p>
          <p className="text-3xl font-bold text-gray-900">{portfoliosFormatados.length}</p>
        </div>
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <p className="text-sm text-gray-600 mb-1">Total de Evidências</p>
          <p className="text-3xl font-bold text-gray-900">
            {portfoliosFormatados.reduce((sum, p) => sum + p.evidence_count, 0)}
          </p>
        </div>
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <p className="text-sm text-gray-600 mb-1">Públicos</p>
          <p className="text-3xl font-bold text-gray-900">
            {portfoliosFormatados.filter((p) => p.visibility === 'publico').length}
          </p>
        </div>
      </div>

      {/* Portfolios Grid */}
      {portfoliosFormatados.length > 0 ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {portfoliosFormatados.map((portfolio) => (
            <Link
              key={portfolio.id}
              to={`${ROUTES.ALUNO.PORTFOLIO.INDEX}/${portfolio.id}`}
              className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden hover:shadow-lg transition-all group"
            >
              {/* Cover Image */}
              {portfolio.cover_image ? (
                <div className="h-48 overflow-hidden">
                  <img
                    src={portfolio.cover_image}
                    alt={portfolio.title}
                    className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                  />
                </div>
              ) : (
                <div className="h-48 bg-gradient-to-br from-indigo-500 to-purple-600 flex items-center justify-center">
                  <span className="text-6xl">📁</span>
                </div>
              )}

              {/* Content */}
              <div className="p-6">
                <div className="flex items-start justify-between mb-3">
                  <h3 className="text-xl font-bold text-gray-900 group-hover:text-indigo-600 transition-colors line-clamp-1">
                    {portfolio.title}
                  </h3>
                  <span
                    className={`flex items-center gap-1 px-2 py-1 rounded-full text-xs font-medium ${
                      portfolio.visibility === 'publico'
                        ? 'bg-green-100 text-green-700'
                        : portfolio.visibility === 'privado'
                          ? 'bg-gray-100 text-gray-700'
                          : 'bg-blue-100 text-blue-700'
                    }`}
                  >
                    {getVisibilityIcon(portfolio.visibility)}
                    {getVisibilityLabel(portfolio.visibility)}
                  </span>
                </div>

                <p className="text-gray-600 text-sm mb-4 line-clamp-2">{portfolio.description}</p>

                <div className="flex items-center justify-between pt-4 border-t border-gray-200">
                  <span className="text-sm text-gray-500">{portfolio.evidence_count} evidências</span>
                  <span className="text-xs text-gray-400">
                    {new Date(portfolio.created_at).toLocaleDateString('pt-BR')}
                  </span>
                </div>
              </div>
            </Link>
          ))}
        </div>
      ) : (
        // Empty State
        <div className="text-center py-16">
          <div className="w-24 h-24 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <Plus className="w-12 h-12 text-gray-400" />
          </div>
          <h3 className="text-xl font-semibold text-gray-900 mb-2">Nenhum portfólio ainda</h3>
          <p className="text-gray-600 mb-6">Crie seu primeiro portfólio para começar a organizar suas evidências</p>
          <Link
            to={ROUTES.ALUNO.PORTFOLIO.CREATE}
            className="inline-flex items-center gap-2 px-6 py-3 bg-indigo-600 text-white rounded-lg font-medium hover:bg-indigo-700 transition-colors"
          >
            <Plus className="w-5 h-5" />
            Criar Primeiro Portfólio
          </Link>
        </div>
      )}
    </div>
  )
}
