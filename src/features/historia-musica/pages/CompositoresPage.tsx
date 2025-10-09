import { useState } from 'react'
import { useCompositores, useHistoriaPeriodos } from '../hooks/useHistoria'
import { HistoriaCompositor } from '../../../lib/supabase/queries/historia-musica'
import { Link } from 'react-router-dom'
import { ArrowLeft, Music, Search, Filter, MapPin, Calendar, Star } from 'lucide-react'

export default function CompositoresPage() {
  const { data: periodos } = useHistoriaPeriodos()
  const [searchTerm, setSearchTerm] = useState('')
  const [periodoSelecionado, setPeriodoSelecionado] = useState<string>('')
  const [paisSelecionado, setPaisSelecionado] = useState<string>('')

  const { data: compositores, isLoading, error } = useCompositores({
    periodoId: periodoSelecionado || undefined,
    paisNascimento: paisSelecionado || undefined
  })

  // Filtrar compositores por busca
  const compositoresFiltrados = compositores?.filter((compositor) =>
    compositor.nome_completo.toLowerCase().includes(searchTerm.toLowerCase()) ||
    compositor.nome_artistico?.toLowerCase().includes(searchTerm.toLowerCase())
  )

  // Extrair países únicos para o filtro
  const paises = Array.from(
    new Set(compositores?.map((c) => c.pais_nascimento).filter(Boolean) as string[])
  ).sort()

  if (isLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-indigo-900 via-purple-900 to-pink-900 p-6">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center justify-center h-64">
            <div className="text-center">
              <div className="w-16 h-16 border-4 border-white border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
              <p className="text-white text-lg">Carregando compositores...</p>
            </div>
          </div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-indigo-900 via-purple-900 to-pink-900 p-6">
        <div className="max-w-7xl mx-auto">
          <div className="bg-red-500/20 border border-red-500 rounded-lg p-6">
            <h3 className="text-white font-bold text-xl mb-2">Erro ao carregar compositores</h3>
            <p className="text-red-200">{error.message}</p>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-indigo-900 via-purple-900 to-pink-900 p-6">
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
                Compositores e Artistas
              </h1>
              <p className="text-purple-200 text-lg">
                Conheça os grandes mestres da música através dos séculos
              </p>
            </div>

            <div className="bg-white/10 backdrop-blur-sm rounded-lg px-6 py-3 border border-white/20">
              <div className="text-3xl font-bold text-white">
                {compositoresFiltrados?.length || 0}
              </div>
              <div className="text-sm text-purple-200">Compositores</div>
            </div>
          </div>
        </div>

        {/* Filtros */}
        <div className="bg-white/10 backdrop-blur-md rounded-xl p-6 mb-8 border border-white/20">
          <div className="flex items-center gap-2 mb-4">
            <Filter className="w-5 h-5 text-white" />
            <h2 className="text-lg font-semibold text-white">Filtros</h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            {/* Busca */}
            <div className="relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-white/60" />
              <input
                type="text"
                placeholder="Buscar compositor..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full bg-white/10 border border-white/20 rounded-lg px-10 py-3 text-white placeholder-white/60 focus:outline-none focus:ring-2 focus:ring-purple-400"
              />
            </div>

            {/* Filtro por Período */}
            <select
              value={periodoSelecionado}
              onChange={(e) => setPeriodoSelecionado(e.target.value)}
              className="bg-white/10 border border-white/20 rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-purple-400 cursor-pointer"
            >
              <option value="">Todos os períodos</option>
              {periodos?.map((periodo) => (
                <option key={periodo.id} value={periodo.id}>
                  {periodo.nome}
                </option>
              ))}
            </select>

            {/* Filtro por País */}
            <select
              value={paisSelecionado}
              onChange={(e) => setPaisSelecionado(e.target.value)}
              className="bg-white/10 border border-white/20 rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-purple-400 cursor-pointer"
            >
              <option value="">Todos os países</option>
              {paises.map((pais) => (
                <option key={pais} value={pais}>
                  {pais}
                </option>
              ))}
            </select>
          </div>

          {/* Limpar filtros */}
          {(searchTerm || periodoSelecionado || paisSelecionado) && (
            <button
              onClick={() => {
                setSearchTerm('')
                setPeriodoSelecionado('')
                setPaisSelecionado('')
              }}
              className="mt-4 text-sm text-purple-300 hover:text-white transition-colors"
            >
              Limpar todos os filtros
            </button>
          )}
        </div>

        {/* Grid de Compositores */}
        {compositoresFiltrados && compositoresFiltrados.length > 0 ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            {compositoresFiltrados.map((compositor) => (
              <CompositorCard key={compositor.id} compositor={compositor} />
            ))}
          </div>
        ) : (
          <div className="bg-white/10 backdrop-blur-md rounded-xl p-12 text-center border border-white/20">
            <Music className="w-16 h-16 text-white/40 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-white mb-2">
              Nenhum compositor encontrado
            </h3>
            <p className="text-purple-200">
              Tente ajustar os filtros ou limpar a busca
            </p>
          </div>
        )}
      </div>
    </div>
  )
}

// Componente do Card de Compositor
function CompositorCard({ compositor }: { compositor: HistoriaCompositor }) {
  const anoNascimento = compositor.data_nascimento
    ? new Date(compositor.data_nascimento).getFullYear()
    : null
  const anoFalecimento = compositor.data_falecimento
    ? new Date(compositor.data_falecimento).getFullYear()
    : null

  const anos = anoNascimento && anoFalecimento
    ? `${anoNascimento} - ${anoFalecimento}`
    : anoNascimento
    ? `${anoNascimento}`
    : 'Data não especificada'

  return (
    <Link
      to={`/historia/compositores/${compositor.id}`}
      className="group"
    >
      <div className="bg-white/10 backdrop-blur-md rounded-xl overflow-hidden border border-white/20 hover:border-white/40 transition-all duration-300 hover:shadow-2xl hover:scale-[1.02] h-full flex flex-col">
        {/* Foto do compositor */}
        <div className="relative h-64 overflow-hidden bg-gradient-to-br from-purple-600 to-pink-600">
          {compositor.foto_url ? (
            <img
              src={compositor.foto_url}
              alt={compositor.nome_completo}
              className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
            />
          ) : (
            <div className="w-full h-full flex items-center justify-center">
              <Music className="w-20 h-20 text-white/30" />
            </div>
          )}

          {/* Badge de importância */}
          {compositor.nivel_importancia && compositor.nivel_importancia >= 4 && (
            <div className="absolute top-3 right-3 bg-yellow-500 rounded-full p-2 shadow-lg">
              <Star className="w-4 h-4 text-white" fill="white" />
            </div>
          )}
        </div>

        {/* Conteúdo */}
        <div className="p-5 flex-1 flex flex-col">
          <h3 className="text-xl font-bold text-white mb-2 group-hover:text-purple-300 transition-colors line-clamp-2">
            {compositor.nome_completo}
          </h3>

          {compositor.nome_artistico && compositor.nome_artistico !== compositor.nome_completo && (
            <p className="text-sm text-purple-300 mb-3 italic">
              &ldquo;{compositor.nome_artistico}&rdquo;
            </p>
          )}

          {/* Informações básicas */}
          <div className="space-y-2 mb-4 text-sm text-purple-200">
            <div className="flex items-center gap-2">
              <Calendar className="w-4 h-4 text-purple-400" />
              <span>{anos}</span>
            </div>
            {compositor.pais_nascimento && (
              <div className="flex items-center gap-2">
                <MapPin className="w-4 h-4 text-purple-400" />
                <span>{compositor.pais_nascimento}</span>
              </div>
            )}
          </div>

          {/* Bio curta */}
          {compositor.biografia_curta && (
            <p className="text-sm text-purple-200 mb-4 line-clamp-3 flex-1">
              {compositor.biografia_curta}
            </p>
          )}

          {/* Tags */}
          {compositor.tags && compositor.tags.length > 0 && (
            <div className="flex flex-wrap gap-2 mt-auto">
              {compositor.tags.slice(0, 3).map((tag, index) => (
                <span
                  key={index}
                  className="text-xs px-2 py-1 bg-purple-500/30 rounded-full text-purple-200"
                >
                  {tag}
                </span>
              ))}
            </div>
          )}
        </div>

        {/* Hover effect bar */}
        <div className="h-1 w-0 group-hover:w-full transition-all duration-300 bg-gradient-to-r from-purple-400 to-pink-400" />
      </div>
    </Link>
  )
}
