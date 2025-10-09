import React, { useState, useMemo } from 'react'
import {
  Music,
  Play,
  Pause,
  Volume2,
  Video,
  Star,
  Heart,
  Search,
  Filter,
  ArrowLeft,
  Headphones,
  Share2,
  Loader2,
  AlertCircle,
  Sparkles
} from 'lucide-react'
import { Link, useNavigate } from 'react-router-dom'
import { useInstrumentos, useInstrumentoPrincipal } from '../hooks/useInstrumentos'
import { useAuth } from '../../auth/AuthContext'
import type { Instrumento } from '@/lib/supabase/queries/instrumentos'

export function BibliotecaInstrumentosPage() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [busca, setBusca] = useState('')
  const [filtroCategoria, setFiltroCategoria] = useState<string>('todas')
  const [filtroNivel, setFiltroNivel] = useState<string>('todos')
  const [audioTocando, setAudioTocando] = useState<string | null>(null)

  // Buscar dados do banco
  const { data: instrumentos = [], isLoading, error } = useInstrumentos()
  const { data: _instrumentoPrincipal } = useInstrumentoPrincipal(user?.id || '')

  // Filtrar instrumentos
  const instrumentosFiltrados = useMemo(() => {
    return instrumentos.filter((inst) => {
      const matchBusca =
        busca === '' ||
        inst.nome.toLowerCase().includes(busca.toLowerCase()) ||
        inst.origem?.toLowerCase().includes(busca.toLowerCase()) ||
        inst.categoria?.toLowerCase().includes(busca.toLowerCase())

      const matchCategoria =
        filtroCategoria === 'todas' || inst.categoria === filtroCategoria

      const matchNivel =
        filtroNivel === 'todos' || inst.dificuldade_aprendizado === filtroNivel

      return matchBusca && matchCategoria && matchNivel
    })
  }, [instrumentos, busca, filtroCategoria, filtroNivel])

  // Estatísticas - calculadas dinamicamente dos instrumentos
  const _stats = useMemo(() => {
    return {
      total: instrumentos.length,
      disponiveis: 0, // TODO: conectar com instrumentos_fisicos
      comAudio: 0, // TODO: conectar com instrumento_sons
      comVideo: 0 // TODO: conectar com instrumento_midias
    }
  }, [instrumentos])

  const handlePlaySound = (instrumentoId: string) => {
    if (audioTocando === instrumentoId) {
      setAudioTocando(null)
    } else {
      setAudioTocando(instrumentoId)
      // Reproduz o audio_exemplo_url do instrumento
      const instrumento = instrumentos.find(i => i.id === instrumentoId)
      if (instrumento?.audio_exemplo_url) {
        // TODO: Implementar player de áudio real
        // console.log('Tocando áudio:', instrumento.audio_exemplo_url)
      }
      setTimeout(() => setAudioTocando(null), 3000)
    }
  }

  // Loading state
  if (isLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-indigo-50 via-purple-50 to-pink-50 flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="w-12 h-12 text-purple-600 animate-spin mx-auto mb-4" />
          <p className="text-lg text-gray-600">Carregando instrumentos...</p>
        </div>
      </div>
    )
  }

  // Error state
  if (error) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-indigo-50 via-purple-50 to-pink-50 flex items-center justify-center">
        <div className="text-center">
          <AlertCircle className="w-12 h-12 text-red-600 mx-auto mb-4" />
          <p className="text-lg text-gray-900 font-semibold mb-2">Erro ao carregar instrumentos</p>
          <p className="text-gray-600">{error.message}</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-indigo-50 via-purple-50 to-pink-50">
      <div className="max-w-7xl mx-auto px-4 py-8 space-y-8">
        {/* Header */}
        <div>
          <Link
            to="/aluno"
            className="inline-flex items-center gap-2 text-gray-600 hover:text-gray-900 mb-4 transition-colors"
          >
            <ArrowLeft className="w-4 h-4" />
            Voltar ao Dashboard
          </Link>

          <div className="bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 rounded-2xl shadow-2xl p-8 text-white">
            <div className="flex items-center gap-4 mb-6">
              <div className="w-20 h-20 bg-white/20 backdrop-blur-sm rounded-2xl flex items-center justify-center">
                <Music className="w-10 h-10" />
              </div>
              <div>
                <h1 className="text-4xl font-bold mb-2">Biblioteca de Instrumentos</h1>
                <p className="text-purple-100 text-lg">
                  Explore, aprenda e domine diferentes instrumentos musicais
                </p>
              </div>
            </div>

            {/* Stats */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 border border-white/20">
                <p className="text-sm text-purple-100 mb-1">Total de Instrumentos</p>
                <p className="text-3xl font-bold">{instrumentos.length}</p>
              </div>
              <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 border border-white/20">
                <p className="text-sm text-purple-100 mb-1">Disponíveis na Escola</p>
                <p className="text-3xl font-bold">
                  {instrumentos.filter(i => i.disponivel_escola).length}
                </p>
              </div>
              <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 border border-white/20">
                <p className="text-sm text-purple-100 mb-1">Com Áudio</p>
                <p className="text-3xl font-bold">
                  {instrumentos.filter(i => i.audio_exemplo_url).length}
                </p>
              </div>
              <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 border border-white/20">
                <p className="text-sm text-purple-100 mb-1">Com Vídeo</p>
                <p className="text-3xl font-bold">
                  {instrumentos.filter(i => i.video_demonstracao_url).length}
                </p>
              </div>
            </div>
          </div>
        </div>

        {/* Filtros */}
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
          <div className="flex items-center gap-2 mb-4">
            <Filter className="w-5 h-5 text-gray-600" />
            <h2 className="text-lg font-semibold text-gray-900">Filtros e Busca</h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
              <input
                type="text"
                placeholder="Buscar instrumento..."
                value={busca}
                onChange={(e) => setBusca(e.target.value)}
                className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-400 focus:border-purple-400 outline-none"
              />
            </div>

            <select
              value={filtroCategoria}
              onChange={(e) => setFiltroCategoria(e.target.value)}
              className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-400 focus:border-purple-400 outline-none cursor-pointer"
            >
              <option value="todas">Todas as categorias</option>
              <option value="cordas">🎸 Cordas</option>
              <option value="sopro">🎺 Sopro</option>
              <option value="percussao">🥁 Percussão</option>
              <option value="teclas">🎹 Teclas</option>
              <option value="eletronicos">🎛️ Eletrônicos</option>
            </select>

            <select
              value={filtroNivel}
              onChange={(e) => setFiltroNivel(e.target.value)}
              className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-400 focus:border-purple-400 outline-none cursor-pointer"
            >
              <option value="todos">Todos os níveis</option>
              <option value="iniciante">Iniciante</option>
              <option value="intermediario">Intermediário</option>
              <option value="avancado">Avançado</option>
            </select>
          </div>
        </div>

        {/* Grid de Instrumentos */}
        {instrumentosFiltrados.length > 0 ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {instrumentosFiltrados.map((instrumento) => (
              <InstrumentoCard
                key={instrumento.id}
                instrumento={instrumento}
                onPlay={handlePlaySound}
                isPlaying={audioTocando === instrumento.id}
                onSelect={() => navigate(`/aluno/instrumentos/${instrumento.id}`)}
              />
            ))}
          </div>
        ) : (
          <div className="bg-white rounded-xl shadow-sm p-12 text-center border border-gray-100">
            <Music className="w-16 h-16 text-gray-400 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-gray-900 mb-2">
              Nenhum instrumento encontrado
            </h3>
            <p className="text-gray-600">Tente ajustar os filtros ou limpar a busca</p>
          </div>
        )}
      </div>

      {/* Modal removido - agora abre página dedicada */}
    </div>
  )
}

// Card de Instrumento
// Helper function para mapear nome da categoria para chave do config
function getCategoriaKey(categoriaNome: string): string {
  const map: Record<string, string> = {
    'Cordas': 'cordas',
    'Sopro': 'sopro',
    'Percussão': 'percussao',
    'Teclados': 'teclas',
    'Eletrônicos': 'eletronicos'
  }
  return map[categoriaNome] || 'cordas'
}

function InstrumentoCard({
  instrumento,
  onPlay,
  isPlaying,
  onSelect
}: {
  instrumento: Instrumento
  onPlay: (id: string) => void
  isPlaying: boolean
  onSelect: (inst: Instrumento) => void
}) {
  const categoriaConfig = {
    cordas: { emoji: '🎸', cor: 'from-amber-400 to-orange-500', bg: 'bg-amber-50' },
    sopro: { emoji: '🎺', cor: 'from-blue-400 to-cyan-500', bg: 'bg-blue-50' },
    percussao: { emoji: '🥁', cor: 'from-red-400 to-pink-500', bg: 'bg-red-50' },
    teclas: { emoji: '🎹', cor: 'from-purple-400 to-indigo-500', bg: 'bg-purple-50' },
    eletronicos: { emoji: '🎛️', cor: 'from-green-400 to-emerald-500', bg: 'bg-green-50' }
  }

  const categoriaKey = getCategoriaKey(instrumento.categoria || '')
  const config = categoriaConfig[categoriaKey as keyof typeof categoriaConfig]

  return (
    <div
      className={`bg-white rounded-xl shadow-md hover:shadow-2xl transition-all duration-300 overflow-hidden border-2 border-transparent hover:border-purple-300 cursor-pointer group`}
      onClick={() => onSelect(instrumento)}
    >
      {/* Imagem com badges */}
      <div className="relative h-48 bg-gradient-to-br from-gray-100 to-gray-200">
        <div className="absolute inset-0 flex items-center justify-center text-6xl">
          {config.emoji}
        </div>

        {/* Badges */}
        <div className="absolute top-3 left-3 flex gap-2">
          {instrumento.meu_instrumento && (
            <span className="bg-gradient-to-r from-yellow-400 to-orange-500 text-white text-xs font-bold px-3 py-1 rounded-full shadow-lg flex items-center gap-1">
              <Star className="w-3 h-3 fill-white" />
              MEU
            </span>
          )}
          {instrumento.favorito && (
            <button
              className="bg-white/90 backdrop-blur-sm text-red-500 p-2 rounded-full shadow-lg hover:scale-110 transition-transform"
              onClick={(e) => {
                e.stopPropagation()
                // TODO: Toggle favorito
              }}
            >
              <Heart className="w-4 h-4 fill-red-500" />
            </button>
          )}
        </div>

        {/* Badge de categoria */}
        <div className="absolute top-3 right-3">
          <span className={`bg-gradient-to-r ${config.cor} text-white text-xs font-bold px-3 py-1 rounded-full shadow-lg`}>
            {instrumento.categoria || 'Outros'}
          </span>
        </div>

        {/* Play button */}
        <button
          className="absolute bottom-3 right-3 bg-white/90 backdrop-blur-sm text-purple-600 p-3 rounded-full shadow-lg hover:scale-110 transition-transform"
          onClick={(e) => {
            e.stopPropagation()
            onPlay(instrumento.id)
          }}
        >
          {isPlaying ? (
            <Pause className="w-5 h-5 fill-purple-600" />
          ) : (
            <Play className="w-5 h-5 fill-purple-600" />
          )}
        </button>
      </div>

      {/* Conteúdo */}
      <div className="p-5">
        <h3 className="text-xl font-bold text-gray-900 mb-1">{instrumento.nome}</h3>
        <p className="text-sm text-gray-500 mb-3">{instrumento.origem || 'Origem diversa'}</p>
        <p className="text-sm text-gray-700 mb-4 line-clamp-2">
          {instrumento.historia ? instrumento.historia.substring(0, 150) + '...' : 'Sem descrição disponível'}
        </p>

        {/* Stats - Removidos campos que não existem no banco */}
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-2">
            {instrumento.audio_exemplo_url && (
              <span className="text-xs bg-purple-100 text-purple-700 px-2 py-1 rounded-full flex items-center gap-1">
                <Volume2 className="w-3 h-3" />
                Áudio
              </span>
            )}
            {instrumento.video_demonstracao_url && (
              <span className="text-xs bg-blue-100 text-blue-700 px-2 py-1 rounded-full flex items-center gap-1">
                <Video className="w-3 h-3" />
                Vídeo
              </span>
            )}
          </div>
          {instrumento.disponivel_escola && (
            <span className="text-xs bg-green-100 text-green-700 px-2 py-1 rounded-full font-medium">
              Disponível
            </span>
          )}
        </div>

        {/* Nível */}
        <div className="flex items-center justify-between">
          <span className="text-xs font-medium text-gray-600">
            Nível: <span className="text-purple-600 font-bold capitalize">{instrumento.dificuldade_aprendizado}</span>
          </span>
        </div>
      </div>
    </div>
  )
}

// Modal de Detalhes do Instrumento
function InstrumentoModal({
  instrumento,
  onClose
}: {
  instrumento: Instrumento
  onClose: () => void
}) {
  const categoriaConfig = {
    cordas: { emoji: '🎸', cor: 'from-amber-400 to-orange-500' },
    sopro: { emoji: '🎺', cor: 'from-blue-400 to-cyan-500' },
    percussao: { emoji: '🥁', cor: 'from-red-400 to-pink-500' },
    teclas: { emoji: '🎹', cor: 'from-purple-400 to-indigo-500' },
    eletronicos: { emoji: '🎛️', cor: 'from-green-400 to-emerald-500' }
  }

  const categoriaKey = getCategoriaKey(instrumento.categoria || '')
  const config = categoriaConfig[categoriaKey as keyof typeof categoriaConfig]

  return (
    <div
      className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-2xl max-w-3xl w-full max-h-[90vh] overflow-y-auto"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className={`bg-gradient-to-r ${config.cor} p-8 text-white`}>
          <div className="flex items-start justify-between mb-4">
            <div className="flex items-center gap-4">
              <div className="text-6xl">{config.emoji}</div>
              <div>
                <h2 className="text-3xl font-bold mb-1">{instrumento.nome}</h2>
                <p className="text-white/80">{instrumento.origem || 'Origem diversa'}</p>
              </div>
            </div>
            <button
              onClick={onClose}
              className="bg-white/20 hover:bg-white/30 backdrop-blur-sm p-2 rounded-full transition-colors"
            >
              <ArrowLeft className="w-5 h-5" />
            </button>
          </div>
        </div>

        {/* Conteúdo */}
        <div className="p-8 space-y-6">
          {/* Descrição */}
          <div>
            <h3 className="text-xl font-bold text-gray-900 mb-3">Sobre o Instrumento</h3>
            <p className="text-gray-700 leading-relaxed">{instrumento.historia || 'Descrição não disponível.'}</p>
          </div>

          {/* Informações Adicionais */}
          {(instrumento.curiosidades || instrumento.uso_tradicional || instrumento.uso_moderno) && (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {instrumento.curiosidades && (
                <div className="bg-purple-50 rounded-xl p-4">
                  <h4 className="font-bold text-gray-900 mb-2 flex items-center gap-2">
                    <Sparkles className="w-4 h-4 text-purple-600" />
                    Curiosidades
                  </h4>
                  <p className="text-sm text-gray-700">{instrumento.curiosidades}</p>
                </div>
              )}
              {instrumento.uso_tradicional && (
                <div className="bg-amber-50 rounded-xl p-4">
                  <h4 className="font-bold text-gray-900 mb-2">Uso Tradicional</h4>
                  <p className="text-sm text-gray-700">{instrumento.uso_tradicional}</p>
                </div>
              )}
            </div>
          )}

          {/* Recursos - Apenas mostrar os que existem */}
          {(instrumento.audio_exemplo_url || instrumento.video_demonstracao_url) && (
            <div>
              <h3 className="text-xl font-bold text-gray-900 mb-4">Recursos Disponíveis</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {instrumento.audio_exemplo_url && (
                  <div className="bg-purple-50 rounded-xl p-4 text-center">
                    <Volume2 className="w-8 h-8 text-purple-600 mx-auto mb-2" />
                    <p className="text-lg font-bold text-gray-900">Áudio</p>
                    <p className="text-sm text-gray-600">Exemplo disponível</p>
                  </div>
                )}
                {instrumento.video_demonstracao_url && (
                  <div className="bg-blue-50 rounded-xl p-4 text-center">
                    <Video className="w-8 h-8 text-blue-600 mx-auto mb-2" />
                    <p className="text-lg font-bold text-gray-900">Vídeo</p>
                    <p className="text-sm text-gray-600">Demonstração disponível</p>
                  </div>
                )}
              </div>
            </div>
          )}

          {/* Ações */}
          <div className="flex gap-3">
            <Link
              to={`/aluno/instrumentos/${instrumento.id}`}
              className="flex-1 bg-gradient-to-r from-purple-600 to-indigo-600 text-white py-3 px-6 rounded-lg font-semibold hover:shadow-lg transition-all flex items-center justify-center gap-2"
            >
              <Headphones className="w-5 h-5" />
              Explorar Instrumento
            </Link>
            <button className="bg-gray-100 hover:bg-gray-200 text-gray-700 p-3 rounded-lg transition-colors">
              <Share2 className="w-5 h-5" />
            </button>
            <button className="bg-gray-100 hover:bg-gray-200 text-gray-700 p-3 rounded-lg transition-colors">
              <Heart className="w-5 h-5" />
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
