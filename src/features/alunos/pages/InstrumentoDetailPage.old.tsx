import { ArrowLeft, BookOpen, Music, Play, Loader2 } from 'lucide-react'
import { useNavigate, useParams } from 'react-router-dom'
import { useEffect, useState } from 'react'
import { useInstrumentos } from '../hooks'

export default function InstrumentoDetailPage() {
  const { slug } = useParams()
  const navigate = useNavigate()
  const { getInstrumentoBySlug } = useInstrumentos()
  const [instrumento, setInstrumento] = useState<any>(null) // TODO: type properly
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!slug) {
      setError('Instrumento não encontrado')
      setLoading(false)
      return
    }

    const fetchInstrumento = async () => {
      try {
        setLoading(true)
        const data = await getInstrumentoBySlug(slug)
        if (data) {
          setInstrumento(data)
        } else {
          setError('Instrumento não encontrado')
        }
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Erro ao carregar instrumento')
      } finally {
        setLoading(false)
      }
    }

    fetchInstrumento()
  }, [slug, getInstrumentoBySlug])

  // Loading state
  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="w-12 h-12 text-indigo-600 animate-spin mx-auto mb-4" />
          <p className="text-gray-600 font-medium">Carregando instrumento...</p>
        </div>
      </div>
    )
  }

  // Error state
  if (error || !instrumento) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <Music className="w-16 h-16 text-red-400 mx-auto mb-4" />
          <p className="text-red-600 font-medium">Erro ao carregar instrumento</p>
          <p className="text-gray-600 text-sm mt-2">{error || 'Instrumento não encontrado'}</p>
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
          Voltar
        </button>
        <div className="flex items-start gap-6">
          {instrumento.imagem_url ? (
            <img
              src={instrumento.imagem_url}
              alt={instrumento.nome}
              className="w-32 h-32 object-cover rounded-2xl flex-shrink-0"
            />
          ) : (
            <div className="w-32 h-32 bg-gradient-to-br from-amber-400 to-orange-600 rounded-2xl flex items-center justify-center flex-shrink-0">
              <Music className="w-16 h-16 text-white" />
            </div>
          )}
          <div className="flex-1">
            <h1 className="text-4xl font-bold text-gray-900 mb-2">{instrumento.nome}</h1>
            <div className="flex items-center gap-3 mb-3">
              {instrumento.categoria && (
                <span className="px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-sm font-medium">
                  {instrumento.categoria.nome}
                </span>
              )}
              {instrumento.origem && <span className="text-gray-600">{instrumento.origem}</span>}
            </div>
            <p className="text-gray-700 leading-relaxed">
              {instrumento.uso_tradicional || instrumento.historia || 'Instrumento musical'}
            </p>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {/* Conteúdo Principal */}
        <div className="lg:col-span-2 space-y-8">
          {/* História */}
          {instrumento.historia && (
            <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
              <div className="flex items-center gap-2 mb-4">
                <BookOpen className="w-6 h-6 text-blue-600" />
                <h2 className="text-2xl font-bold text-gray-900">História</h2>
              </div>
              <p className="text-gray-700 leading-relaxed whitespace-pre-line">{instrumento.historia}</p>
            </div>
          )}

          {/* Características Técnicas */}
          {(instrumento.classificacao || instrumento.material || instrumento.afinacao) && (
            <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
              <h2 className="text-2xl font-bold text-gray-900 mb-4">Características</h2>
              <div className="space-y-4">
                {instrumento.classificacao && (
                  <div className="border-l-4 border-blue-500 pl-4">
                    <h3 className="font-semibold text-gray-900 mb-1">Classificação</h3>
                    <p className="text-gray-700">{instrumento.classificacao}</p>
                  </div>
                )}
                {instrumento.material && (
                  <div className="border-l-4 border-blue-500 pl-4">
                    <h3 className="font-semibold text-gray-900 mb-1">Material</h3>
                    <p className="text-gray-700">{instrumento.material}</p>
                  </div>
                )}
                {instrumento.afinacao && (
                  <div className="border-l-4 border-blue-500 pl-4">
                    <h3 className="font-semibold text-gray-900 mb-1">Afinação</h3>
                    <p className="text-gray-700">{instrumento.afinacao}</p>
                  </div>
                )}
              </div>
            </div>
          )}

          {/* Técnicas Básicas */}
          {instrumento.tecnicas_basicas && (
            <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
              <h2 className="text-2xl font-bold text-gray-900 mb-4">Técnicas Principais</h2>
              <p className="text-gray-700 leading-relaxed whitespace-pre-line">
                {instrumento.tecnicas_basicas}
              </p>
            </div>
          )}

          {/* Uso Moderno */}
          {instrumento.uso_moderno && (
            <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
              <div className="flex items-center gap-2 mb-4">
                <Music className="w-6 h-6 text-purple-600" />
                <h2 className="text-2xl font-bold text-gray-900">Uso Contemporâneo</h2>
              </div>
              <p className="text-gray-700 leading-relaxed whitespace-pre-line">
                {instrumento.uso_moderno}
              </p>
            </div>
          )}

          {/* Vídeo Demonstração */}
          {instrumento.video_demonstracao_url && (
            <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
              <div className="flex items-center gap-2 mb-4">
                <Play className="w-6 h-6 text-red-600" />
                <h2 className="text-2xl font-bold text-gray-900">Vídeo Demonstração</h2>
              </div>
              <a
                href={instrumento.video_demonstracao_url}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg hover:border-blue-300 hover:bg-blue-50 transition-colors"
              >
                <div className="w-12 h-12 bg-red-100 rounded-lg flex items-center justify-center flex-shrink-0">
                  <Play className="w-6 h-6 text-red-600" />
                </div>
                <div>
                  <h3 className="font-medium text-gray-900">Ver demonstração completa</h3>
                  <p className="text-xs text-gray-500">Abre em nova janela</p>
                </div>
              </a>
            </div>
          )}

          {/* Curiosidades */}
          {instrumento.curiosidades && (
            <div className="bg-gradient-to-br from-blue-50 to-indigo-50 rounded-xl shadow-sm border border-blue-200 p-6">
              <h2 className="text-2xl font-bold text-gray-900 mb-4">💡 Curiosidades</h2>
              <p className="text-gray-700 leading-relaxed whitespace-pre-line">
                {instrumento.curiosidades}
              </p>
            </div>
          )}
        </div>

        {/* Sidebar */}
        <div className="space-y-6">
          {/* Informações Pedagógicas */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <h3 className="font-bold text-gray-900 mb-4">Informações Pedagógicas</h3>
            <div className="space-y-3">
              {instrumento.nivel_dificuldade && (
                <div>
                  <span className="text-sm text-gray-600">Nível:</span>
                  <p className="font-medium text-gray-900 capitalize">{instrumento.nivel_dificuldade}</p>
                </div>
              )}
              {instrumento.idade_recomendada && (
                <div>
                  <span className="text-sm text-gray-600">Idade Recomendada:</span>
                  <p className="font-medium text-gray-900">{instrumento.idade_recomendada}</p>
                </div>
              )}
              {instrumento.pre_requisitos && (
                <div>
                  <span className="text-sm text-gray-600">Pré-requisitos:</span>
                  <p className="text-sm text-gray-700 mt-1">{instrumento.pre_requisitos}</p>
                </div>
              )}
            </div>
          </div>

          {/* Disponibilidade na Escola */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <h3 className="font-bold text-gray-900 mb-4">Disponibilidade</h3>
            <div className="space-y-2">
              <div className="flex items-center gap-2">
                <div
                  className={`w-3 h-3 rounded-full ${instrumento.disponivel_escola ? 'bg-green-500' : 'bg-gray-300'}`}
                ></div>
                <span className="text-sm text-gray-700">
                  {instrumento.disponivel_escola ? 'Disponível na escola' : 'Não disponível'}
                </span>
              </div>
              {instrumento.pode_emprestar && (
                <div className="flex items-center gap-2">
                  <div className="w-3 h-3 rounded-full bg-blue-500"></div>
                  <span className="text-sm text-gray-700">Disponível para empréstimo</span>
                </div>
              )}
            </div>
          </div>

          {/* Áudio de Exemplo */}
          {instrumento.audio_exemplo_url && (
            <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
              <h3 className="font-bold text-gray-900 mb-4">Áudio de Exemplo</h3>
              <audio controls className="w-full">
                <source src={instrumento.audio_exemplo_url} type="audio/mpeg" />
                Seu navegador não suporta o elemento de áudio.
              </audio>
            </div>
          )}

          {/* CTA - Começar a Aprender */}
          <div className="bg-gradient-to-br from-blue-600 to-purple-600 rounded-xl shadow-lg p-6 text-white">
            <h3 className="text-xl font-bold mb-2">Interessado?</h3>
            <p className="text-blue-100 text-sm mb-4">Comece sua jornada musical agora mesmo!</p>
            <button className="w-full px-6 py-3 bg-white text-indigo-600 rounded-lg font-medium hover:bg-gray-100 transition-colors">
              Falar com Coordenação
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
