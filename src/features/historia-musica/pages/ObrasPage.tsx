import { useState } from 'react'
import { useObras, useHistoriaPeriodos } from '../hooks/useHistoria'
import { HistoriaObra } from '../../../lib/supabase/queries/historia-musica'
import { Link } from 'react-router-dom'
import { ArrowLeft, Music, Search, Filter, Play, FileText, Video, Clock, Star } from 'lucide-react'

export default function ObrasPage() {
  const { data: periodos } = useHistoriaPeriodos()
  const [searchTerm, setSearchTerm] = useState('')
  const [periodoSelecionado, setPeriodoSelecionado] = useState<string>('')
  const [generoSelecionado, setGeneroSelecionado] = useState<string>('')
  const [tipoSelecionado, setTipoSelecionado] = useState<string>('')

  const { data: obras, isLoading, error } = useObras({
    periodoId: periodoSelecionado || undefined,
    genero: generoSelecionado || undefined
  })

  // Filtrar obras por busca e tipo
  const obrasFiltradas = obras?.filter((obra) => {
    const matchSearch = obra.titulo.toLowerCase().includes(searchTerm.toLowerCase()) ||
      obra.titulo_original?.toLowerCase().includes(searchTerm.toLowerCase())
    const matchTipo = !tipoSelecionado || obra.tipo_obra === tipoSelecionado
    return matchSearch && matchTipo
  })

  // Extrair valores únicos para filtros
  const generos = Array.from(new Set(obras?.map((o) => o.genero).filter(Boolean) as string[])).sort()
  const tipos = Array.from(new Set(obras?.map((o) => o.tipo_obra).filter(Boolean) as string[])).sort()

  if (isLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-900 via-indigo-900 to-purple-900 p-6">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center justify-center h-64">
            <div className="text-center">
              <div className="w-16 h-16 border-4 border-white border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
              <p className="text-white text-lg">Carregando obras musicais...</p>
            </div>
          </div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-900 via-indigo-900 to-purple-900 p-6">
        <div className="max-w-7xl mx-auto">
          <div className="bg-red-500/20 border border-red-500 rounded-lg p-6">
            <h3 className="text-white font-bold text-xl mb-2">Erro ao carregar obras</h3>
            <p className="text-red-200">{error.message}</p>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-900 via-indigo-900 to-purple-900 p-6">
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
                Catálogo de Obras Musicais
              </h1>
              <p className="text-blue-200 text-lg">
                Explore sinfonias, óperas, concertos e muito mais
              </p>
            </div>

            <div className="bg-white/10 backdrop-blur-sm rounded-lg px-6 py-3 border border-white/20">
              <div className="text-3xl font-bold text-white">
                {obrasFiltradas?.length || 0}
              </div>
              <div className="text-sm text-blue-200">Obras</div>
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
            {/* Busca */}
            <div className="relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-white/60" />
              <input
                type="text"
                placeholder="Buscar obra..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full bg-white/10 border border-white/20 rounded-lg px-10 py-3 text-white placeholder-white/60 focus:outline-none focus:ring-2 focus:ring-blue-400"
              />
            </div>

            {/* Filtro por Período */}
            <select
              value={periodoSelecionado}
              onChange={(e) => setPeriodoSelecionado(e.target.value)}
              className="bg-white/10 border border-white/20 rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-400 cursor-pointer"
            >
              <option value="">Todos os períodos</option>
              {periodos?.map((periodo) => (
                <option key={periodo.id} value={periodo.id}>
                  {periodo.nome}
                </option>
              ))}
            </select>

            {/* Filtro por Gênero */}
            <select
              value={generoSelecionado}
              onChange={(e) => setGeneroSelecionado(e.target.value)}
              className="bg-white/10 border border-white/20 rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-400 cursor-pointer"
            >
              <option value="">Todos os gêneros</option>
              {generos.map((genero) => (
                <option key={genero} value={genero}>
                  {genero}
                </option>
              ))}
            </select>

            {/* Filtro por Tipo */}
            <select
              value={tipoSelecionado}
              onChange={(e) => setTipoSelecionado(e.target.value)}
              className="bg-white/10 border border-white/20 rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-400 cursor-pointer"
            >
              <option value="">Todos os tipos</option>
              {tipos.map((tipo) => (
                <option key={tipo} value={tipo}>
                  {tipo}
                </option>
              ))}
            </select>
          </div>

          {/* Limpar filtros */}
          {(searchTerm || periodoSelecionado || generoSelecionado || tipoSelecionado) && (
            <button
              onClick={() => {
                setSearchTerm('')
                setPeriodoSelecionado('')
                setGeneroSelecionado('')
                setTipoSelecionado('')
              }}
              className="mt-4 text-sm text-blue-300 hover:text-white transition-colors"
            >
              Limpar todos os filtros
            </button>
          )}
        </div>

        {/* Lista de Obras */}
        {obrasFiltradas && obrasFiltradas.length > 0 ? (
          <div className="space-y-4">
            {obrasFiltradas.map((obra) => (
              <ObraCard key={obra.id} obra={obra} />
            ))}
          </div>
        ) : (
          <div className="bg-white/10 backdrop-blur-md rounded-xl p-12 text-center border border-white/20">
            <Music className="w-16 h-16 text-white/40 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-white mb-2">
              Nenhuma obra encontrada
            </h3>
            <p className="text-blue-200">
              Tente ajustar os filtros ou limpar a busca
            </p>
          </div>
        )}
      </div>
    </div>
  )
}

// Componente do Card de Obra
function ObraCard({ obra }: { obra: HistoriaObra & { compositor?: { nome_completo: string }; periodo?: { nome: string } } }) {
  return (
    <Link
      to={`/historia/obras/${obra.id}`}
      className="group block"
    >
      <div className="bg-white/10 backdrop-blur-md rounded-xl p-6 border border-white/20 hover:border-white/40 transition-all duration-300 hover:shadow-2xl">
        <div className="flex flex-col md:flex-row gap-6">
          {/* Lado esquerdo - Info principal */}
          <div className="flex-1">
            {/* Cabeçalho */}
            <div className="flex items-start justify-between mb-4">
              <div className="flex-1">
                <div className="flex items-center gap-3 mb-2">
                  {/* Badge de tipo */}
                  {obra.tipo_obra && (
                    <span className="text-xs px-3 py-1 bg-blue-500/30 rounded-full text-blue-200 font-medium">
                      {obra.tipo_obra}
                    </span>
                  )}
                  {/* Ano */}
                  {obra.ano_composicao && (
                    <span className="text-xs text-white/60">{obra.ano_composicao}</span>
                  )}
                  {/* Badge de popularidade */}
                  {obra.popularidade && obra.popularidade >= 100 && (
                    <div className="flex items-center gap-1 text-yellow-400">
                      <Star className="w-3 h-3" fill="currentColor" />
                      <span className="text-xs">Popular</span>
                    </div>
                  )}
                </div>

                <h3 className="text-2xl font-bold text-white mb-1 group-hover:text-blue-300 transition-colors">
                  {obra.titulo}
                </h3>

                {obra.titulo_original && obra.titulo_original !== obra.titulo && (
                  <p className="text-sm text-blue-300 mb-2 italic">
                    ({obra.titulo_original})
                  </p>
                )}

                {/* Compositor */}
                {obra.compositor && (
                  <p className="text-blue-200 mb-2">
                    Por <span className="font-semibold">{obra.compositor.nome_completo}</span>
                  </p>
                )}
              </div>
            </div>

            {/* Descrição */}
            {obra.descricao && (
              <p className="text-blue-200 text-sm mb-4 line-clamp-2">
                {obra.descricao}
              </p>
            )}

            {/* Detalhes técnicos */}
            <div className="flex flex-wrap gap-4 text-sm text-white/70">
              {obra.duracao_minutos && (
                <div className="flex items-center gap-2">
                  <Clock className="w-4 h-4" />
                  <span>{obra.duracao_minutos} min</span>
                </div>
              )}
              {obra.tonalidade && (
                <div className="flex items-center gap-2">
                  <Music className="w-4 h-4" />
                  <span>{obra.tonalidade}</span>
                </div>
              )}
              {obra.opus_numero && (
                <span className="px-2 py-1 bg-white/10 rounded">Op. {obra.opus_numero}</span>
              )}
            </div>

            {/* Tags */}
            {obra.tags && obra.tags.length > 0 && (
              <div className="flex flex-wrap gap-2 mt-4">
                {obra.tags.slice(0, 5).map((tag, index) => (
                  <span
                    key={index}
                    className="text-xs px-2 py-1 bg-blue-500/20 rounded-full text-blue-200"
                  >
                    {tag}
                  </span>
                ))}
              </div>
            )}
          </div>

          {/* Lado direito - Ações */}
          <div className="flex md:flex-col gap-3 md:w-40">
            {/* Botão de áudio */}
            {obra.audio_url && (
              <button
                onClick={(e) => {
                  e.preventDefault()
                  window.open(obra.audio_url!, '_blank')
                }}
                className="flex items-center justify-center gap-2 bg-green-500 hover:bg-green-600 text-white px-4 py-3 rounded-lg transition-colors flex-1 md:flex-initial"
              >
                <Play className="w-4 h-4" />
                <span className="text-sm font-medium">Ouvir</span>
              </button>
            )}

            {/* Botão de partitura */}
            {obra.partitura_url && (
              <button
                onClick={(e) => {
                  e.preventDefault()
                  window.open(obra.partitura_url!, '_blank')
                }}
                className="flex items-center justify-center gap-2 bg-blue-500 hover:bg-blue-600 text-white px-4 py-3 rounded-lg transition-colors flex-1 md:flex-initial"
              >
                <FileText className="w-4 h-4" />
                <span className="text-sm font-medium">Partitura</span>
              </button>
            )}

            {/* Botão de vídeo */}
            {obra.video_performance_url && (
              <button
                onClick={(e) => {
                  e.preventDefault()
                  window.open(obra.video_performance_url!, '_blank')
                }}
                className="flex items-center justify-center gap-2 bg-red-500 hover:bg-red-600 text-white px-4 py-3 rounded-lg transition-colors flex-1 md:flex-initial"
              >
                <Video className="w-4 h-4" />
                <span className="text-sm font-medium">Vídeo</span>
              </button>
            )}

            {/* Dificuldade */}
            {obra.nivel_dificuldade && (
              <div className="bg-white/10 rounded-lg px-3 py-2 text-center">
                <div className="text-xs text-white/60 mb-1">Dificuldade</div>
                <div className="flex gap-1 justify-center">
                  {Array.from({ length: 5 }).map((_, i) => (
                    <div
                      key={i}
                      className={`w-2 h-2 rounded-full ${
                        i < obra.nivel_dificuldade! ? 'bg-yellow-400' : 'bg-white/20'
                      }`}
                    />
                  ))}
                </div>
              </div>
            )}
          </div>
        </div>

        {/* Hover effect bar */}
        <div className="h-1 w-0 group-hover:w-full transition-all duration-300 bg-gradient-to-r from-blue-400 to-purple-400 mt-4 rounded-full" />
      </div>
    </Link>
  )
}
