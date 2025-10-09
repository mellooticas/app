import { useState } from 'react'
import { useHistoriaPeriodos } from '../hooks/useHistoria'
import { HistoriaPeriodo } from '../../../lib/supabase/queries/historia-musica'
import { Link } from 'react-router-dom'
import { ArrowLeft, Users, Music, Search, SlidersHorizontal } from 'lucide-react'

export default function PeriodosPage() {
  const { data: periodos, isLoading, error } = useHistoriaPeriodos()
  const [searchTerm, setSearchTerm] = useState('')
  const [ordenacao, setOrdenacao] = useState<'cronologica' | 'nome'>('cronologica')

  // Filtrar e ordenar períodos
  const periodosFiltrados = periodos
    ?.filter((periodo) =>
      periodo.nome.toLowerCase().includes(searchTerm.toLowerCase())
    )
    .sort((a, b) => {
      if (ordenacao === 'cronologica') {
        return (a.ordem_cronologica || 0) - (b.ordem_cronologica || 0)
      }
      return a.nome.localeCompare(b.nome)
    })

  if (isLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 p-6">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center justify-center h-64">
            <div className="text-center">
              <div className="w-16 h-16 border-4 border-white border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
              <p className="text-white text-lg">Carregando períodos históricos...</p>
            </div>
          </div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 p-6">
        <div className="max-w-7xl mx-auto">
          <div className="bg-red-500/20 border border-red-500 rounded-lg p-6">
            <h3 className="text-white font-bold text-xl mb-2">Erro ao carregar períodos</h3>
            <p className="text-red-200">{error.message}</p>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 p-6">
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
                Períodos Históricos da Música
              </h1>
              <p className="text-blue-200 text-lg">
                Explore a evolução da música através dos séculos
              </p>
            </div>

            <div className="bg-white/10 backdrop-blur-sm rounded-lg px-6 py-3 border border-white/20">
              <div className="text-3xl font-bold text-white">{periodos?.length || 0}</div>
              <div className="text-sm text-blue-200">Períodos</div>
            </div>
          </div>
        </div>

        {/* Filtros e Busca */}
        <div className="bg-white/10 backdrop-blur-md rounded-xl p-6 mb-8 border border-white/20">
          <div className="flex flex-col md:flex-row gap-4">
            {/* Busca */}
            <div className="flex-1 relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-white/60" />
              <input
                type="text"
                placeholder="Buscar período..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full bg-white/10 border border-white/20 rounded-lg px-10 py-3 text-white placeholder-white/60 focus:outline-none focus:ring-2 focus:ring-blue-400"
              />
            </div>

            {/* Ordenação */}
            <div className="flex items-center gap-2">
              <SlidersHorizontal className="w-5 h-5 text-white/60" />
              <select
                value={ordenacao}
                onChange={(e) => setOrdenacao(e.target.value as 'cronologica' | 'nome')}
                className="bg-white/10 border border-white/20 rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-400 cursor-pointer"
              >
                <option value="cronologica">Ordem Cronológica</option>
                <option value="nome">Ordem Alfabética</option>
              </select>
            </div>
          </div>
        </div>

        {/* Timeline Visual */}
        {periodosFiltrados && periodosFiltrados.length > 0 && (
          <div className="mb-8">
            <div className="bg-white/10 backdrop-blur-md rounded-xl p-6 border border-white/20">
              <h2 className="text-2xl font-bold text-white mb-4">Linha do Tempo</h2>
              <div className="relative">
                {/* Linha horizontal */}
                <div className="absolute top-6 left-0 right-0 h-1 bg-gradient-to-r from-blue-400 via-purple-400 to-pink-400"></div>
                
                {/* Pontos na timeline */}
                <div className="flex justify-between relative">
                  {periodosFiltrados.map((periodo) => (
                    <div key={periodo.id} className="flex flex-col items-center">
                      <div
                        className="w-12 h-12 rounded-full flex items-center justify-center shadow-lg border-4 border-white/20 cursor-pointer hover:scale-110 transition-transform"
                        style={{ backgroundColor: periodo.cor_tematica || '#6366f1' }}
                      >
                        <Music className="w-6 h-6 text-white" />
                      </div>
                      <div className="mt-2 text-xs text-white/80 text-center max-w-[80px]">
                        {periodo.periodo_inicio}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Grid de Períodos */}
        {periodosFiltrados && periodosFiltrados.length > 0 ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {periodosFiltrados.map((periodo) => (
              <PeriodoCard key={periodo.id} periodo={periodo} />
            ))}
          </div>
        ) : (
          <div className="bg-white/10 backdrop-blur-md rounded-xl p-12 text-center border border-white/20">
            <Music className="w-16 h-16 text-white/40 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-white mb-2">
              Nenhum período encontrado
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

// Componente do Card de Período
function PeriodoCard({ periodo }: { periodo: HistoriaPeriodo }) {
  const anos = periodo.periodo_inicio && periodo.periodo_fim
    ? `${periodo.periodo_inicio} - ${periodo.periodo_fim}`
    : 'Data não especificada'

  return (
    <Link
      to={`/historia/periodos/${periodo.id}`}
      className="group"
    >
      <div className="bg-white/10 backdrop-blur-md rounded-xl overflow-hidden border border-white/20 hover:border-white/40 transition-all duration-300 hover:shadow-2xl hover:scale-[1.02]">
        {/* Imagem de capa */}
        {periodo.imagem_capa_url ? (
          <div className="h-48 overflow-hidden">
            <img
              src={periodo.imagem_capa_url}
              alt={periodo.nome}
              className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
            />
          </div>
        ) : (
          <div
            className="h-48 flex items-center justify-center"
            style={{
              background: `linear-gradient(135deg, ${periodo.cor_tematica || '#6366f1'} 0%, ${periodo.cor_tematica || '#6366f1'}99 100%)`
            }}
          >
            <Music className="w-16 h-16 text-white/40" />
          </div>
        )}

        {/* Conteúdo */}
        <div className="p-6">
          {/* Badge de cor do período */}
          <div className="flex items-center gap-2 mb-3">
            <div
              className="w-3 h-3 rounded-full"
              style={{ backgroundColor: periodo.cor_tematica || '#6366f1' }}
            />
            <span className="text-xs font-medium text-white/60 uppercase tracking-wide">
              {anos}
            </span>
          </div>

          <h3 className="text-2xl font-bold text-white mb-3 group-hover:text-blue-300 transition-colors">
            {periodo.nome}
          </h3>

          <p className="text-blue-200 text-sm mb-4 line-clamp-3">
            {periodo.descricao_curta || 'Explore as características e compositores deste período musical.'}
          </p>

          {/* Características principais */}
          {periodo.caracteristicas_principais && Array.isArray(periodo.caracteristicas_principais) && (
            <div className="mb-4">
              <div className="flex flex-wrap gap-2">
                {(periodo.caracteristicas_principais as string[]).slice(0, 3).map((carac, index) => (
                  <span
                    key={index}
                    className="text-xs px-2 py-1 bg-white/10 rounded-full text-white/80"
                  >
                    {carac}
                  </span>
                ))}
              </div>
            </div>
          )}

          {/* Stats do período */}
          <div className="flex items-center gap-4 pt-4 border-t border-white/10">
            <div className="flex items-center gap-2 text-sm text-white/70">
              <Users className="w-4 h-4" />
              <span>Compositores</span>
            </div>
            <div className="flex items-center gap-2 text-sm text-white/70">
              <Music className="w-4 h-4" />
              <span>Obras</span>
            </div>
          </div>
        </div>

        {/* Hover effect bar */}
        <div
          className="h-1 w-0 group-hover:w-full transition-all duration-300"
          style={{ backgroundColor: periodo.cor_tematica || '#6366f1' }}
        />
      </div>
    </Link>
  )
}
