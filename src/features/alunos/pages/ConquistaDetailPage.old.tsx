import { ArrowLeft, Award, Calendar, CheckCircle, Loader2, Target } from 'lucide-react'
import { useNavigate, useParams } from 'react-router-dom'
import { useEffect, useState } from 'react'
import { useGamification } from '../hooks'

export default function ConquistaDetailPage() {
  const { id } = useParams()
  const navigate = useNavigate()
  const { badges, conquistas, loading } = useGamification()
  const [conquista, setConquista] = useState<any>(null)

  useEffect(() => {
    if (!id) return

    // Buscar nos badges
    const badge = badges.find((b) => b.id === id)
    if (badge) {
      setConquista({
        id: badge.id,
        titulo: badge.nome_badge,
        descricao: badge.descricao || 'Badge conquistado!',
        icone: badge.icone || '🏆',
        cor: badge.cor || '#6366f1',
        dataDesbloqueio: badge.data_conquista,
        tipo: 'badge',
        metadata: badge.metadata,
      })
      return
    }

    // Buscar nas conquistas
    const conq = conquistas.find((c) => c.id === id)
    if (conq) {
      setConquista({
        id: conq.id,
        titulo: conq.nome_conquista,
        descricao: conq.descricao || 'Conquista desbloqueada!',
        pontos: conq.valor_conquista || 0,
        dataDesbloqueio: conq.data_conquista,
        tipo: 'conquista',
        categoria: conq.tipo_conquista,
        metadata: conq.metadata,
      })
    }
  }, [id, badges, conquistas])

  // Loading state
  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="w-12 h-12 text-indigo-600 animate-spin mx-auto mb-4" />
          <p className="text-gray-600 font-medium">Carregando conquista...</p>
        </div>
      </div>
    )
  }

  // Not found
  if (!conquista) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <Award className="w-16 h-16 text-gray-400 mx-auto mb-4" />
          <p className="text-gray-600 font-medium">Conquista não encontrada</p>
          <button
            onClick={() => navigate(-1)}
            className="mt-4 px-4 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700"
          >
            Voltar
          </button>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      {/* Header */}
      <div className="mb-8">
        <button
          onClick={() => navigate(-1)}
          className="flex items-center gap-2 text-gray-600 hover:text-gray-900 mb-4"
        >
          <ArrowLeft className="w-5 h-5" />
          Voltar para Conquistas
        </button>
      </div>

      <div className="max-w-4xl mx-auto space-y-8">
        {/* Card Principal da Conquista */}
        <div
          className="bg-gradient-to-br from-indigo-500 to-purple-600 rounded-2xl shadow-2xl p-8 text-white relative overflow-hidden"
          style={conquista.cor && typeof conquista.cor === 'string' && conquista.cor.startsWith('#') 
            ? { background: `linear-gradient(to bottom right, ${conquista.cor}, ${conquista.cor}dd)` }
            : undefined
          }
        >
          {/* Decoração de fundo */}
          <div className="absolute top-0 right-0 w-64 h-64 bg-white opacity-10 rounded-full -translate-y-32 translate-x-32"></div>
          <div className="absolute bottom-0 left-0 w-48 h-48 bg-white opacity-10 rounded-full translate-y-24 -translate-x-24"></div>

          <div className="relative z-10">
            <div className="flex items-start justify-between mb-6">
              <div className="flex items-center gap-4">
                <div className="text-7xl">{conquista.icone || '🏆'}</div>
                <div>
                  <div className="flex items-center gap-2 mb-2">
                    <h1 className="text-3xl font-bold">{conquista.titulo}</h1>
                    <CheckCircle className="w-6 h-6" />
                  </div>
                  <div className="flex items-center gap-3 text-sm opacity-90">
                    {conquista.categoria && (
                      <>
                        <span className="capitalize">{conquista.categoria}</span>
                        <span>•</span>
                      </>
                    )}
                    {conquista.pontos > 0 && (
                      <span className="flex items-center gap-1">
                        <Award className="w-4 h-4" />
                        {conquista.pontos} pontos
                      </span>
                    )}
                  </div>
                </div>
              </div>
            </div>

            <p className="text-lg opacity-90 leading-relaxed">{conquista.descricao}</p>

            {conquista.dataDesbloqueio && (
              <div className="mt-6 pt-6 border-t border-white border-opacity-20 flex items-center gap-2 text-sm opacity-75">
                <Calendar className="w-4 h-4" />
                Conquistado em {new Date(conquista.dataDesbloqueio).toLocaleDateString('pt-BR', {
                  day: '2-digit',
                  month: 'long',
                  year: 'numeric',
                })}
              </div>
            )}
          </div>
        </div>

        {/* Metadados */}
        {conquista.metadata && typeof conquista.metadata === 'object' && Object.keys(conquista.metadata).length > 0 && (
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <div className="flex items-center gap-2 mb-4">
              <Target className="w-5 h-5 text-blue-600" />
              <h2 className="text-xl font-bold text-gray-900">Informações Adicionais</h2>
            </div>
            <div className="space-y-2">
              {Object.entries(conquista.metadata as Record<string, any>).map(([key, value]) => (
                <div key={key} className="flex items-start gap-2 text-sm">
                  <span className="font-medium text-gray-600 capitalize">{key.replace(/_/g, ' ')}:</span>
                  <span className="text-gray-900">{String(value)}</span>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Ações */}
        <div className="bg-gradient-to-r from-blue-50 to-indigo-50 border border-blue-200 rounded-xl p-6">
          <div className="flex items-start gap-3">
            <div className="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center flex-shrink-0">
              💪
            </div>
            <div className="flex-1">
              <h3 className="font-bold text-gray-900 mb-1">Continue Conquistando!</h3>
              <p className="text-gray-700 text-sm mb-4">
                Mantenha o ritmo e complete mais desafios para desbloquear novas conquistas e badges.
              </p>
              <button
                onClick={() => navigate('/app/aluno/desafios')}
                className="px-4 py-2 bg-indigo-600 text-white rounded-lg font-medium hover:bg-indigo-700 transition-colors"
              >
                Ver Desafios Disponíveis
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
