import { Search, Music, Loader2 } from 'lucide-react'
import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useInstrumentos } from '../hooks'
import { ROUTES } from '../../../lib/constants/routes'

export default function InstrumentosPage() {
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategoria, setSelectedCategoria] = useState<string>('all')

  // Hook real - dados do Supabase
  const { instrumentos, categorias, loading, error } = useInstrumentos()

  // Gerar lista de categorias para filtros
  const categoriasLista = ['all', ...categorias.map((cat) => cat.nome)]

  // Filtrar instrumentos
  const filteredInstrumentos = instrumentos.filter((instrumento) => {
    const matchSearch =
      instrumento.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      (instrumento.historia || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
      (instrumento.origem || '').toLowerCase().includes(searchTerm.toLowerCase())
    const matchCategoria =
      selectedCategoria === 'all' || instrumento.categoria?.nome === selectedCategoria
    return matchSearch && matchCategoria
  })

  // Loading state
  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="w-12 h-12 text-indigo-600 animate-spin mx-auto mb-4" />
          <p className="text-gray-600 font-medium">Carregando instrumentos...</p>
        </div>
      </div>
    )
  }

  // Error state
  if (error) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <Music className="w-16 h-16 text-red-400 mx-auto mb-4" />
          <p className="text-red-600 font-medium">Erro ao carregar instrumentos</p>
          <p className="text-gray-600 text-sm mt-2">{error}</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Biblioteca de Instrumentos</h1>
        <p className="text-gray-600">Explore e aprenda sobre diferentes instrumentos musicais</p>
      </div>

      {/* Search & Filters */}
      <div className="mb-8 space-y-4">
        {/* Search */}
        <div className="relative max-w-md">
          <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
          <input
            type="text"
            placeholder="Buscar instrumento..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
          />
        </div>

        {/* Category Filters */}
        <div className="flex flex-wrap gap-2">
          {categoriasLista.map((categoria) => (
            <button
              key={categoria}
              onClick={() => setSelectedCategoria(categoria)}
              className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                selectedCategoria === categoria
                  ? 'bg-indigo-600 text-white'
                  : 'bg-white text-gray-700 border border-gray-300 hover:bg-gray-50'
              }`}
            >
              {categoria === 'all' ? 'Todos' : categoria}
            </button>
          ))}
        </div>
      </div>

      {/* Instrumentos Grid */}
      {filteredInstrumentos.length > 0 ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {filteredInstrumentos.map((instrumento) => {
            // Gerar slug para URL
            const slug = instrumento.nome.toLowerCase().replace(/\s+/g, '-')

            return (
              <Link
                key={instrumento.id}
                to={ROUTES.ALUNO.INSTRUMENTS.DETAIL(slug)}
                className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden hover:shadow-lg transition-all group"
              >
                {/* Imagem */}
                {instrumento.imagem_url ? (
                  <div className="h-48 overflow-hidden">
                    <img
                      src={instrumento.imagem_url}
                      alt={instrumento.nome}
                      className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                    />
                  </div>
                ) : (
                  <div className="h-48 bg-gradient-to-br from-indigo-500 to-purple-600 flex items-center justify-center">
                    <Music className="w-16 h-16 text-white opacity-50" />
                  </div>
                )}

                {/* Content */}
                <div className="p-6">
                  <div className="flex items-start justify-between mb-2">
                    <h3 className="text-xl font-bold text-gray-900 group-hover:text-indigo-600 transition-colors">
                      {instrumento.nome}
                    </h3>
                    <span className="px-2 py-1 bg-indigo-100 text-indigo-700 text-xs font-medium rounded">
                      {instrumento.categoria?.nome || 'Sem categoria'}
                    </span>
                  </div>

                  <p className="text-gray-600 text-sm mb-3 line-clamp-2">
                    {instrumento.historia || instrumento.origem || 'Instrumento musical'}
                  </p>

                  {instrumento.classificacao && (
                    <p className="text-xs text-gray-500">
                      <span className="font-medium">Classificação:</span> {instrumento.classificacao}
                    </p>
                  )}

                  {instrumento.origem && (
                    <p className="text-xs text-gray-500 mt-1">
                      <span className="font-medium">Origem:</span> {instrumento.origem}
                    </p>
                  )}
                </div>
              </Link>
            )
          })}
        </div>
      ) : (
        // Empty State
        <div className="text-center py-16">
          <Music className="w-16 h-16 text-gray-400 mx-auto mb-4" />
          <h3 className="text-xl font-semibold text-gray-900 mb-2">Nenhum instrumento encontrado</h3>
          <p className="text-gray-600">Tente ajustar os filtros ou buscar por outro termo</p>
        </div>
      )}
    </div>
  )
}
