import { useState } from 'react'
import { useTimelineEventos, useHistoriaPeriodos } from '../hooks/useHistoria'
import { HistoriaEventoTimeline } from '../../../lib/supabase/queries/historia-musica'
import { Link } from 'react-router-dom'
import { ArrowLeft, Calendar, Filter, Music, User, Award, Lightbulb, Star } from 'lucide-react'

type CategoriaEvento = 'compositor' | 'obra' | 'instrumento' | 'movimento' | ''

export default function TimelinePage() {
  const { data: periodos } = useHistoriaPeriodos()
  const [anoInicio, setAnoInicio] = useState<number>(1400)
  const [anoFim, setAnoFim] = useState<number>(2000)
  const [categoriaSelecionada, setCategoriaSelecionada] = useState<CategoriaEvento>('')
  const [importanciaMinima, setImportanciaMinima] = useState<number>(1)

  const { data: eventos, isLoading, error } = useTimelineEventos({
    anoInicio,
    anoFim,
    categoria: categoriaSelecionada || undefined,
    importanciaMinima
  })

  // Agrupar eventos por década
  const eventosPorDecada = eventos?.reduce((acc, evento) => {
    const decada = Math.floor(evento.ano / 10) * 10
    if (!acc[decada]) acc[decada] = []
    acc[decada].push(evento)
    return acc
  }, {} as Record<number, typeof eventos>)

  const decadas = eventosPorDecada ? Object.keys(eventosPorDecada).map(Number).sort((a, b) => a - b) : []

  if (isLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-slate-900 via-purple-900 to-slate-900 p-6">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center justify-center h-64">
            <div className="text-center">
              <div className="w-16 h-16 border-4 border-white border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
              <p className="text-white text-lg">Carregando linha do tempo...</p>
            </div>
          </div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-slate-900 via-purple-900 to-slate-900 p-6">
        <div className="max-w-7xl mx-auto">
          <div className="bg-red-500/20 border border-red-500 rounded-lg p-6">
            <h3 className="text-white font-bold text-xl mb-2">Erro ao carregar timeline</h3>
            <p className="text-red-200">{error.message}</p>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-900 via-purple-900 to-slate-900 p-6">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <Link
            to="/historia"
            className="inline-flex items-center gap-2 text-white/80 hover:text-white mb-4 transition-colors"
          >
            <ArrowLeft className="w-4 h-4" />
            Voltar para História da Música
          </Link>

          <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
            <div>
              <h1 className="text-4xl font-bold text-white mb-2">
                Linha do Tempo Musical
              </h1>
              <p className="text-purple-200 text-lg">
                Viaje através dos séculos e descubra os momentos que marcaram a história da música
              </p>
            </div>

            <div className="bg-white/10 backdrop-blur-sm rounded-lg px-6 py-3 border border-white/20">
              <div className="text-3xl font-bold text-white">
                {eventos?.length || 0}
              </div>
              <div className="text-sm text-purple-200">Eventos</div>
            </div>
          </div>
        </div>

        {/* Filtros */}
        <div className="bg-white/10 backdrop-blur-md rounded-xl p-6 mb-8 border border-white/20">
          <div className="flex items-center gap-2 mb-4">
            <Filter className="w-5 h-5 text-white" />
            <h2 className="text-lg font-semibold text-white">Filtros</h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            {/* Ano início */}
            <div>
              <label className="text-sm text-white/80 mb-2 block">Ano Início</label>
              <input
                type="number"
                value={anoInicio}
                onChange={(e) => setAnoInicio(Number(e.target.value))}
                min="1000"
                max="2100"
                className="w-full bg-white/10 border border-white/20 rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-purple-400"
              />
            </div>

            {/* Ano fim */}
            <div>
              <label className="text-sm text-white/80 mb-2 block">Ano Fim</label>
              <input
                type="number"
                value={anoFim}
                onChange={(e) => setAnoFim(Number(e.target.value))}
                min="1000"
                max="2100"
                className="w-full bg-white/10 border border-white/20 rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-purple-400"
              />
            </div>

            {/* Categoria */}
            <div>
              <label className="text-sm text-white/80 mb-2 block">Categoria</label>
              <select
                value={categoriaSelecionada}
                onChange={(e) => setCategoriaSelecionada(e.target.value as CategoriaEvento)}
                className="w-full bg-white/10 border border-white/20 rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-purple-400 cursor-pointer"
              >
                <option value="">Todas as categorias</option>
                <option value="compositor">Compositores</option>
                <option value="obra">Obras</option>
                <option value="instrumento">Instrumentos</option>
                <option value="movimento">Movimentos</option>
              </select>
            </div>

            {/* Importância */}
            <div>
              <label className="text-sm text-white/80 mb-2 block">Importância Mínima</label>
              <select
                value={importanciaMinima}
                onChange={(e) => setImportanciaMinima(Number(e.target.value))}
                className="w-full bg-white/10 border border-white/20 rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-purple-400 cursor-pointer"
              >
                <option value="1">Todos os eventos</option>
                <option value="3">Importantes</option>
                <option value="4">Muito importantes</option>
                <option value="5">Essenciais</option>
              </select>
            </div>
          </div>

          {/* Botão limpar */}
          <button
            onClick={() => {
              setAnoInicio(1400)
              setAnoFim(2000)
              setCategoriaSelecionada('')
              setImportanciaMinima(1)
            }}
            className="mt-4 text-sm text-purple-300 hover:text-white transition-colors"
          >
            Resetar filtros
          </button>
        </div>

        {/* Timeline Visual */}
        {decadas.length > 0 ? (
          <div className="space-y-8">
            {decadas.map((decada) => (
              <DecadaSection
                key={decada}
                decada={decada}
                eventos={eventosPorDecada![decada]}
                periodos={periodos}
              />
            ))}
          </div>
        ) : (
          <div className="bg-white/10 backdrop-blur-md rounded-xl p-12 text-center border border-white/20">
            <Calendar className="w-16 h-16 text-white/40 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-white mb-2">
              Nenhum evento encontrado
            </h3>
            <p className="text-purple-200">
              Tente ajustar os filtros de data ou categoria
            </p>
          </div>
        )}
      </div>
    </div>
  )
}

// Componente de Seção por Década
function DecadaSection({
  decada,
  eventos,
  periodos
}: {
  decada: number
  eventos: HistoriaEventoTimeline[]
  periodos?: Array<{ periodo_inicio: number; periodo_fim: number; nome: string; cor_tematica?: string }>
}) {
  // Encontrar período correspondente
  const periodo = periodos?.find(
    (p) => p.periodo_inicio <= decada && p.periodo_fim >= decada
  )

  return (
    <div className="relative">
      {/* Marcador de década */}
      <div className="sticky top-4 z-10 mb-6">
        <div
          className="inline-flex items-center gap-3 bg-gradient-to-r from-purple-600 to-pink-600 rounded-full px-6 py-3 shadow-xl border border-white/20"
          style={periodo?.cor_tematica ? {
            background: `linear-gradient(135deg, ${periodo.cor_tematica} 0%, ${periodo.cor_tematica}cc 100%)`
          } : undefined}
        >
          <Calendar className="w-5 h-5 text-white" />
          <span className="text-xl font-bold text-white">{decada}s</span>
          {periodo && (
            <span className="text-sm text-white/90 ml-2">• {periodo.nome}</span>
          )}
        </div>
      </div>

      {/* Linha vertical */}
      <div className="absolute left-8 top-20 bottom-0 w-0.5 bg-gradient-to-b from-purple-400 via-pink-400 to-transparent"></div>

      {/* Eventos */}
      <div className="space-y-6 pl-20">
        {eventos
          .sort((a, b) => a.ano - b.ano)
          .map((evento) => (
            <EventoCard key={evento.id} evento={evento} />
          ))}
      </div>
    </div>
  )
}

// Componente do Card de Evento
function EventoCard({ evento }: { evento: HistoriaEventoTimeline }) {
  const getIconeCategoria = () => {
    switch (evento.categoria) {
      case 'compositor': return <User className="w-5 h-5" />
      case 'obra': return <Music className="w-5 h-5" />
      case 'instrumento': return <Award className="w-5 h-5" />
      case 'movimento': return <Lightbulb className="w-5 h-5" />
      default: return <Calendar className="w-5 h-5" />
    }
  }

  const getCorCategoria = () => {
    switch (evento.categoria) {
      case 'compositor': return 'from-blue-500 to-blue-600'
      case 'obra': return 'from-green-500 to-green-600'
      case 'instrumento': return 'from-yellow-500 to-yellow-600'
      case 'movimento': return 'from-purple-500 to-purple-600'
      default: return 'from-gray-500 to-gray-600'
    }
  }

  const dataCompleta = [evento.dia, evento.mes, evento.ano]
    .filter(Boolean)
    .join('/')

  return (
    <div className="group relative">
      {/* Ponto na linha do tempo */}
      <div className={`absolute -left-20 top-6 w-3 h-3 rounded-full bg-gradient-to-br ${getCorCategoria()} ring-4 ring-white/20 group-hover:ring-white/40 transition-all`}></div>

      <div className="bg-white/10 backdrop-blur-md rounded-xl p-6 border border-white/20 hover:border-white/40 transition-all duration-300 hover:shadow-2xl">
        <div className="flex flex-col md:flex-row gap-4">
          {/* Ícone e Data */}
          <div className="flex md:flex-col items-center md:items-start gap-3">
            <div className={`p-3 rounded-lg bg-gradient-to-br ${getCorCategoria()} text-white shadow-lg`}>
              {getIconeCategoria()}
            </div>
            <div className="text-center md:text-left">
              <div className="text-2xl font-bold text-white">{evento.ano}</div>
              {dataCompleta !== String(evento.ano) && (
                <div className="text-xs text-white/60">{dataCompleta}</div>
              )}
            </div>
          </div>

          {/* Conteúdo */}
          <div className="flex-1">
            <div className="flex items-start justify-between mb-2">
              <div>
                <span className="text-xs px-2 py-1 bg-white/20 rounded-full text-white/80 uppercase tracking-wide">
                  {evento.tipo_evento || evento.categoria}
                </span>
              </div>
              {evento.importancia && evento.importancia >= 4 && (
                <div className="flex items-center gap-1 text-yellow-400">
                  <Star className="w-4 h-4" fill="currentColor" />
                  <span className="text-xs">Importante</span>
                </div>
              )}
            </div>

            <h3 className="text-xl font-bold text-white mb-2 group-hover:text-purple-300 transition-colors">
              {evento.titulo}
            </h3>

            {evento.descricao && (
              <p className="text-purple-200 text-sm mb-3 line-clamp-2">
                {evento.descricao}
              </p>
            )}

            {/* Imagem */}
            {evento.imagem_url && (
              <div className="mt-4 rounded-lg overflow-hidden">
                <img
                  src={evento.imagem_url}
                  alt={evento.titulo}
                  className="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-300"
                />
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
