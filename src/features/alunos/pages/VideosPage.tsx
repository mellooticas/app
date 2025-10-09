import React, { useState, useMemo } from 'react'
import {
  Play,
  Search,
  Filter,
  Clock,
  Eye,
  BookOpen,
  TrendingUp,
  Loader2,
  AlertCircle,
  Video as VideoIcon,
  Download,
  Share2,
  ChevronDown
} from 'lucide-react'
import { useVideos, useCategoriasVideos, useEstatisticasVideos, useIncrementarVisualizacoes } from '../hooks/useVideos'
import type { VideoComCategoria } from '@/lib/supabase/queries/videos'

export function VideosPage() {
  const [busca, setBusca] = useState('')
  const [filtroCategoria, setFiltroCategoria] = useState<string>('todas')
  const [filtroNivel, setFiltroNivel] = useState<string>('todos')
  const [filtroInstrumento, setFiltroInstrumento] = useState<string>('todos')
  const [videoSelecionado, setVideoSelecionado] = useState<VideoComCategoria | null>(null)

  // Buscar dados do banco
  const { data: videos = [], isLoading, error } = useVideos()
  const { data: categorias = [] } = useCategoriasVideos()
  const { data: stats } = useEstatisticasVideos()
  const incrementarVisualizacoes = useIncrementarVisualizacoes()

  // Extrair instrumentos únicos dos vídeos
  const instrumentosDisponiveis = useMemo(() => {
    const instrumentos = new Set(
      videos
        .map(v => v.instrumento_foco)
        .filter(Boolean)
    )
    return Array.from(instrumentos).sort()
  }, [videos])

  // Filtrar vídeos
  const videosFiltrados = useMemo(() => {
    return videos.filter((video) => {
      const matchBusca =
        busca === '' ||
        video.titulo.toLowerCase().includes(busca.toLowerCase()) ||
        video.descricao?.toLowerCase().includes(busca.toLowerCase()) ||
        video.instrumento_foco?.toLowerCase().includes(busca.toLowerCase())

      const matchCategoria =
        filtroCategoria === 'todas' || video.categoria?.nome === filtroCategoria

      const matchNivel =
        filtroNivel === 'todos' || video.nivel_dificuldade === filtroNivel

      const matchInstrumento =
        filtroInstrumento === 'todos' || video.instrumento_foco === filtroInstrumento

      return matchBusca && matchCategoria && matchNivel && matchInstrumento
    })
  }, [videos, busca, filtroCategoria, filtroNivel, filtroInstrumento])

  const handlePlayVideo = (video: VideoComCategoria) => {
    setVideoSelecionado(video)
    incrementarVisualizacoes.mutate(video.id)
  }

  const formatarDuracao = (segundos: number | null) => {
    if (!segundos) return '0:00'
    const minutos = Math.floor(segundos / 60)
    const segs = segundos % 60
    return `${minutos}:${segs.toString().padStart(2, '0')}`
  }

  // Loading state
  if (isLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50 flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="w-12 h-12 text-blue-600 animate-spin mx-auto mb-4" />
          <p className="text-gray-600 text-lg">Carregando vídeo-aulas...</p>
        </div>
      </div>
    )
  }

  // Error state
  if (error) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50 flex items-center justify-center p-4">
        <div className="bg-white rounded-xl shadow-lg p-8 max-w-md w-full text-center">
          <AlertCircle className="w-16 h-16 text-red-500 mx-auto mb-4" />
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Erro ao carregar</h2>
          <p className="text-gray-600">{error.message}</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50">
      <div className="max-w-7xl mx-auto px-4 py-8 space-y-8">
        {/* Hero Header */}
        <div className="bg-gradient-to-r from-blue-600 via-indigo-600 to-purple-600 rounded-2xl shadow-2xl p-8 text-white">
          <div className="flex items-center gap-4 mb-6">
            <div className="w-16 h-16 bg-white/20 backdrop-blur-sm rounded-2xl flex items-center justify-center">
              <VideoIcon className="w-8 h-8" />
            </div>
            <div>
              <h1 className="text-4xl font-bold mb-2">Vídeo-aulas</h1>
              <p className="text-blue-100 text-lg">
                Aprenda com os melhores professores do Nipo School
              </p>
            </div>
          </div>

          {/* Stats */}
          {stats && (
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4">
                <VideoIcon className="w-6 h-6 mb-2" />
                <p className="text-2xl font-bold">{stats.total}</p>
                <p className="text-sm text-blue-100">Total de Vídeos</p>
              </div>
              <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4">
                <Clock className="w-6 h-6 mb-2" />
                <p className="text-2xl font-bold">{stats.duracao_total_horas}h</p>
                <p className="text-sm text-blue-100">Conteúdo</p>
              </div>
              <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4">
                <Eye className="w-6 h-6 mb-2" />
                <p className="text-2xl font-bold">{stats.publicos}</p>
                <p className="text-sm text-blue-100">Públicos</p>
              </div>
              <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4">
                <TrendingUp className="w-6 h-6 mb-2" />
                <p className="text-2xl font-bold">{videosFiltrados.length}</p>
                <p className="text-sm text-blue-100">Disponíveis</p>
              </div>
            </div>
          )}
        </div>

        {/* Busca e Filtros */}
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
            {/* Busca */}
            <div className="relative">
              <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
              <input
                type="text"
                placeholder="Buscar vídeos..."
                value={busca}
                onChange={(e) => setBusca(e.target.value)}
                className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
            </div>

            {/* Filtro Categoria */}
            <div className="relative">
              <Filter className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
              <select
                value={filtroCategoria}
                onChange={(e) => setFiltroCategoria(e.target.value)}
                className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent appearance-none"
              >
                <option value="todas">Todas Categorias</option>
                {categorias.map((cat) => (
                  <option key={cat.id} value={cat.nome}>
                    {cat.nome}
                  </option>
                ))}
              </select>
              <ChevronDown className="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5 pointer-events-none" />
            </div>

            {/* Filtro Nível */}
            <select
              value={filtroNivel}
              onChange={(e) => setFiltroNivel(e.target.value)}
              className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
              <option value="todos">Todos os Níveis</option>
              <option value="iniciante">Iniciante</option>
              <option value="intermediário">Intermediário</option>
              <option value="avançado">Avançado</option>
            </select>

            {/* Filtro Instrumento */}
            <select
              value={filtroInstrumento}
              onChange={(e) => setFiltroInstrumento(e.target.value)}
              className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
              <option value="todos">Todos Instrumentos</option>
              {instrumentosDisponiveis.map((inst) => (
                <option key={inst} value={inst}>
                  {inst}
                </option>
              ))}
            </select>
          </div>
        </div>

        {/* Grid de Vídeos */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {videosFiltrados.map((video) => (
            <VideoCard
              key={video.id}
              video={video}
              onPlay={handlePlayVideo}
              formatarDuracao={formatarDuracao}
            />
          ))}
        </div>

        {/* Empty State */}
        {videosFiltrados.length === 0 && (
          <div className="text-center py-12">
            <VideoIcon className="w-16 h-16 text-gray-300 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-gray-700 mb-2">
              Nenhum vídeo encontrado
            </h3>
            <p className="text-gray-500">
              Tente ajustar os filtros ou buscar por outro termo
            </p>
          </div>
        )}
      </div>

      {/* Modal de Vídeo */}
      {videoSelecionado && (
        <VideoModal
          video={videoSelecionado}
          onClose={() => setVideoSelecionado(null)}
          formatarDuracao={formatarDuracao}
        />
      )}
    </div>
  )
}

// Componente de Card de Vídeo
function VideoCard({
  video,
  onPlay,
  formatarDuracao
}: {
  video: VideoComCategoria
  onPlay: (video: VideoComCategoria) => void
  formatarDuracao: (segundos: number | null) => string
}) {
  const getNivelColor = (nivel: string | null) => {
    switch (nivel) {
      case 'iniciante':
        return 'bg-green-100 text-green-700'
      case 'intermediário':
        return 'bg-yellow-100 text-yellow-700'
      case 'avançado':
        return 'bg-red-100 text-red-700'
      default:
        return 'bg-gray-100 text-gray-700'
    }
  }

  return (
    <div
      className="bg-white rounded-xl shadow-md hover:shadow-2xl transition-all duration-300 overflow-hidden border-2 border-transparent hover:border-blue-300 cursor-pointer group"
      onClick={() => onPlay(video)}
    >
      {/* Thumbnail */}
      <div className="relative h-48 bg-gradient-to-br from-gray-100 to-gray-200">
        {video.thumbnail_url ? (
          <img
            src={video.thumbnail_url}
            alt={video.titulo}
            className="w-full h-full object-cover"
          />
        ) : (
          <div className="absolute inset-0 flex items-center justify-center text-6xl text-gray-300">
            <VideoIcon className="w-20 h-20" />
          </div>
        )}

        {/* Play Button Overlay */}
        <div className="absolute inset-0 bg-black/30 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
          <div className="w-16 h-16 bg-white/90 rounded-full flex items-center justify-center">
            <Play className="w-8 h-8 text-blue-600 ml-1" />
          </div>
        </div>

        {/* Badges */}
        <div className="absolute top-3 left-3 flex gap-2">
          {video.publico && (
            <span className="bg-green-500 text-white text-xs font-bold px-3 py-1 rounded-full shadow-lg">
              PÚBLICO
            </span>
          )}
          {video.nivel_dificuldade && (
            <span className={`${getNivelColor(video.nivel_dificuldade)} text-xs font-bold px-3 py-1 rounded-full shadow-lg capitalize`}>
              {video.nivel_dificuldade}
            </span>
          )}
        </div>

        {/* Duração */}
        <div className="absolute bottom-3 right-3">
          <span className="bg-black/70 text-white text-xs font-bold px-2 py-1 rounded flex items-center gap-1">
            <Clock className="w-3 h-3" />
            {formatarDuracao(video.duracao)}
          </span>
        </div>
      </div>

      {/* Conteúdo */}
      <div className="p-5">
        <h3 className="text-lg font-bold text-gray-900 mb-2 line-clamp-2">
          {video.titulo}
        </h3>
        
        {video.instrumento_foco && (
          <p className="text-sm text-blue-600 font-semibold mb-2">
            🎵 {video.instrumento_foco}
          </p>
        )}

        {video.descricao && (
          <p className="text-sm text-gray-600 mb-4 line-clamp-2">
            {video.descricao}
          </p>
        )}

        {/* Stats */}
        <div className="flex items-center justify-between text-xs text-gray-500">
          <div className="flex items-center gap-1">
            <Eye className="w-4 h-4" />
            {video.visualizacoes} visualizações
          </div>
          {video.modulo && (
            <div className="flex items-center gap-1">
              <BookOpen className="w-4 h-4" />
              {video.modulo}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

// Modal de Vídeo
function VideoModal({
  video,
  onClose,
  formatarDuracao
}: {
  video: VideoComCategoria
  onClose: () => void
  formatarDuracao: (segundos: number | null) => string
}) {
  return (
    <div
      className="fixed inset-0 bg-black/70 backdrop-blur-sm z-50 flex items-center justify-center p-4"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-2xl max-w-5xl w-full max-h-[90vh] overflow-y-auto"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Vídeo Player */}
        <div className="relative bg-black aspect-video">
          <video
            src={video.video_url}
            controls
            autoPlay
            className="w-full h-full"
          >
            Seu navegador não suporta o elemento de vídeo.
          </video>
        </div>

        {/* Informações */}
        <div className="p-8">
          <div className="flex items-start justify-between mb-6">
            <div className="flex-1">
              <h2 className="text-3xl font-bold text-gray-900 mb-2">
                {video.titulo}
              </h2>
              <div className="flex items-center gap-4 text-sm text-gray-600">
                <span className="flex items-center gap-1">
                  <Clock className="w-4 h-4" />
                  {formatarDuracao(video.duracao)}
                </span>
                <span className="flex items-center gap-1">
                  <Eye className="w-4 h-4" />
                  {video.visualizacoes} visualizações
                </span>
                {video.nivel_dificuldade && (
                  <span className="capitalize">
                    Nível: {video.nivel_dificuldade}
                  </span>
                )}
              </div>
            </div>
            
            <div className="flex gap-2">
              <button className="bg-gray-100 hover:bg-gray-200 text-gray-700 p-3 rounded-lg transition-colors">
                <Download className="w-5 h-5" />
              </button>
              <button className="bg-gray-100 hover:bg-gray-200 text-gray-700 p-3 rounded-lg transition-colors">
                <Share2 className="w-5 h-5" />
              </button>
            </div>
          </div>

          {/* Descrição */}
          {video.descricao && (
            <div className="mb-6">
              <h3 className="text-xl font-bold text-gray-900 mb-3">Sobre este vídeo</h3>
              <p className="text-gray-700 leading-relaxed">{video.descricao}</p>
            </div>
          )}

          {/* Informações Adicionais */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {video.instrumento_foco && (
              <div className="bg-blue-50 rounded-xl p-4">
                <p className="text-sm text-gray-600 mb-1">Instrumento</p>
                <p className="font-bold text-gray-900">{video.instrumento_foco}</p>
              </div>
            )}
            {video.modulo && (
              <div className="bg-purple-50 rounded-xl p-4">
                <p className="text-sm text-gray-600 mb-1">Módulo</p>
                <p className="font-bold text-gray-900">{video.modulo}</p>
              </div>
            )}
            {video.categoria && (
              <div className="bg-green-50 rounded-xl p-4">
                <p className="text-sm text-gray-600 mb-1">Categoria</p>
                <p className="font-bold text-gray-900">{video.categoria.nome}</p>
              </div>
            )}
          </div>

          {/* Transcrição */}
          {video.transcricao && (
            <div className="mt-6">
              <h3 className="text-xl font-bold text-gray-900 mb-3">Transcrição</h3>
              <div className="bg-gray-50 rounded-xl p-4 text-sm text-gray-700 max-h-64 overflow-y-auto">
                {video.transcricao}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
