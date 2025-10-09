import React, { useState, useMemo } from 'react'
import {
  Play,
  Pause,
  Volume2,
  Video,
  BookOpen,
  Star,
  TrendingUp,
  Target,
  ArrowLeft,
  Headphones,
  Download,
  CheckCircle,
  Trophy,
  Clock,
  Calendar,
  Loader2,
  AlertCircle,
  Music
} from 'lucide-react'
import { Link } from 'react-router-dom'
import { useInstrumentoPrincipal, useProgressoInstrumento } from '../hooks/useInstrumentos'
import { useAuth } from '../../auth/AuthContext'
import type { InstrumentoComCategoria, ProgressoInstrumento } from '@/lib/supabase/queries/instrumentos'

// Tipo para o retorno de getInstrumentoPrincipal
type InstrumentoPrincipalData = ProgressoInstrumento & {
  instrumento: InstrumentoComCategoria
}

export function MeuInstrumentoPage() {
  const { user } = useAuth()
  const [audioTocando, setAudioTocando] = useState<string | null>(null)
  const [tecnicaSelecionada, setTecnicaSelecionada] = useState<string | null>(null)

  // Buscar dados reais do banco
  const { data: instrumentoPrincipalData, isLoading: loadingInstrumento, error: errorInstrumento } = useInstrumentoPrincipal(user?.id || '')
  
  // Cast para o tipo correto (getInstrumentoPrincipal retorna progresso + instrumento aninhado)
  const instrumentoPrincipal = instrumentoPrincipalData as InstrumentoPrincipalData | null
  
  // Só busca progresso se tiver instrumento principal
  const { data: progressoData, isLoading: loadingProgresso, error: errorProgresso } = useProgressoInstrumento(
    user?.id || '',
    instrumentoPrincipal?.referencia_id || ''
  )

  const isLoading = loadingInstrumento || (instrumentoPrincipal && loadingProgresso)
  const error = errorInstrumento || errorProgresso

  // Mapear dados do banco para o formato esperado
  const meuInstrumento = useMemo(() => {
    if (!instrumentoPrincipal) return null

    // instrumentoPrincipal tem a estrutura { ...ProgressoInstrumento, instrumento: InstrumentoComCategoria }
    const progresso = progressoData || instrumentoPrincipal
    const instrumento = instrumentoPrincipal.instrumento

    return {
      id: progresso.referencia_id,
      nome: instrumento?.nome || 'Meu Instrumento',
      emoji: instrumento?.categoria?.icone || '🎵',
      nivel_atual: progresso.nivel_atual || 'iniciante',
      progresso_geral: progresso.progresso_porcentagem || 0,
      tempo_pratica_total: Math.round((progresso.tempo_pratica_minutos || 0) / 60), // converter para horas
      dias_consecutivos: 0, // TODO: calcular streak de prática
      tecnicas_dominadas: progresso.tecnicas_dominadas?.length || 0,
      tecnicas_totais: 15, // TODO: buscar do banco
      proxima_meta: progresso.observacoes || 'Continue praticando!',
      instrumento_completo: instrumento
    }
  }, [instrumentoPrincipal, progressoData])

  // Loading state
  if (isLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-50 via-indigo-50 to-blue-50 flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="w-12 h-12 text-purple-600 animate-spin mx-auto mb-4" />
          <p className="text-gray-600 text-lg">Carregando seu instrumento...</p>
        </div>
      </div>
    )
  }

  // Error state
  if (error) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-50 via-indigo-50 to-blue-50 flex items-center justify-center p-4">
        <div className="bg-white rounded-xl shadow-lg p-8 max-w-md w-full text-center">
          <AlertCircle className="w-16 h-16 text-red-500 mx-auto mb-4" />
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Erro ao carregar</h2>
          <p className="text-gray-600 mb-6">{error.message}</p>
          <Link
            to="/aluno/instrumentos"
            className="inline-flex items-center gap-2 bg-purple-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-purple-700 transition-colors"
          >
            <ArrowLeft className="w-4 h-4" />
            Voltar à Biblioteca
          </Link>
        </div>
      </div>
    )
  }

  // Se não tem instrumento principal
  if (!meuInstrumento || !instrumentoPrincipal) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-50 via-indigo-50 to-blue-50 flex items-center justify-center p-4">
        <div className="bg-white rounded-xl shadow-lg p-8 max-w-md w-full text-center">
          <Music className="w-16 h-16 text-gray-400 mx-auto mb-4" />
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Nenhum instrumento selecionado</h2>
          <p className="text-gray-600 mb-6">
            Você ainda não escolheu seu instrumento principal. Visite a biblioteca para começar sua jornada musical!
          </p>
          <Link
            to="/aluno/instrumentos"
            className="inline-flex items-center gap-2 bg-purple-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-purple-700 transition-colors"
          >
            Explorar Biblioteca
          </Link>
        </div>
      </div>
    )
  }

  // Estatísticas baseadas nos dados reais
  const estatisticas = [
    { label: 'Horas de Prática', valor: meuInstrumento.tempo_pratica_total, icone: Clock, cor: 'purple' },
    { label: 'Sequência', valor: meuInstrumento.dias_consecutivos > 0 ? `${meuInstrumento.dias_consecutivos} dias` : 'Comece hoje!', icone: Calendar, cor: 'orange' },
    { label: 'Técnicas', valor: `${meuInstrumento.tecnicas_dominadas}/${meuInstrumento.tecnicas_totais}`, icone: Target, cor: 'blue' },
    { label: 'Nível', valor: meuInstrumento.nivel_atual === 'iniciante' ? 'Iniciante' : meuInstrumento.nivel_atual === 'intermediario' ? 'Intermediário' : 'Avançado', icone: TrendingUp, cor: 'green' }
  ]

  // TODO: Buscar técnicas reais do banco de dados
  const tecnicas = [
    {
      id: '1',
      nome: 'Escalas Maiores',
      descricao: 'Domínio de todas as escalas maiores',
      progresso: 100,
      dominada: true,
      total_exercicios: 12,
      exercicios_concluidos: 12
    },
    {
      id: '2',
      nome: 'Acordes Básicos',
      descricao: 'Tríades maiores, menores, aumentadas e diminutas',
      progresso: 100,
      dominada: true,
      total_exercicios: 8,
      exercicios_concluidos: 8
    },
    {
      id: '3',
      nome: 'Arpejos',
      descricao: 'Arpejos em todas as inversões',
      progresso: 75,
      dominada: false,
      total_exercicios: 15,
      exercicios_concluidos: 11
    },
    {
      id: '4',
      nome: 'Escalas Menores Harmônicas',
      descricao: 'Padrões de escalas menores harmônicas',
      progresso: 40,
      dominada: false,
      total_exercicios: 12,
      exercicios_concluidos: 5
    },
    {
      id: '5',
      nome: 'Acordes de Sétima',
      descricao: 'Tétrades e suas inversões',
      progresso: 20,
      dominada: false,
      total_exercicios: 10,
      exercicios_concluidos: 2
    }
  ]

  const videosAulas = [
    {
      id: '1',
      titulo: 'Postura e Técnica Básica',
      duracao: '12:34',
      assistido: true,
      thumbnail: '/videos/thumb1.jpg'
    },
    {
      id: '2',
      titulo: 'Escalas Maiores - Parte 1',
      duracao: '18:45',
      assistido: true,
      thumbnail: '/videos/thumb2.jpg'
    },
    {
      id: '3',
      titulo: 'Arpejos Avançados',
      duracao: '22:10',
      assistido: false,
      thumbnail: '/videos/thumb3.jpg'
    }
  ]

  const sonsDisponiveis = [
    { id: '1', nome: 'Dó Central (C4)', tipo: 'nota', duracao: '2s' },
    { id: '2', nome: 'Escala de Dó Maior', tipo: 'escala', duracao: '8s' },
    { id: '3', nome: 'Acorde Dó Maior', tipo: 'acorde', duracao: '3s' },
    { id: '4', nome: 'Arpejo Dó Maior', tipo: 'arpejo', duracao: '5s' },
    { id: '5', nome: 'Progressão I-IV-V', tipo: 'progressão', duracao: '12s' }
  ]

  const handlePlaySound = (soundId: string) => {
    if (audioTocando === soundId) {
      setAudioTocando(null)
    } else {
      setAudioTocando(soundId)
      // TODO: Implementar reprodução de áudio real
      setTimeout(() => setAudioTocando(null), 3000)
    }
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-50 via-indigo-50 to-blue-50">
      <div className="max-w-7xl mx-auto px-4 py-8 space-y-8">
        {/* Header */}
        <div>
          <Link
            to="/aluno/instrumentos"
            className="inline-flex items-center gap-2 text-gray-600 hover:text-gray-900 mb-4 transition-colors"
          >
            <ArrowLeft className="w-4 h-4" />
            Voltar à Biblioteca
          </Link>

          <div className="bg-gradient-to-r from-purple-600 via-indigo-600 to-blue-600 rounded-2xl shadow-2xl p-8 text-white">
            <div className="flex items-center gap-6 mb-6">
              <div className="w-24 h-24 bg-white/20 backdrop-blur-sm rounded-2xl flex items-center justify-center text-5xl">
                {meuInstrumento.emoji}
              </div>
              <div>
                <div className="flex items-center gap-3 mb-2">
                  <h1 className="text-4xl font-bold">Meu {meuInstrumento.nome}</h1>
                  <span className="bg-yellow-400 text-yellow-900 px-3 py-1 rounded-full text-sm font-bold flex items-center gap-1">
                    <Star className="w-4 h-4 fill-yellow-900" />
                    MEU INSTRUMENTO
                  </span>
                </div>
                <p className="text-purple-100 text-lg mb-3">
                  Seu progresso e jornada no {meuInstrumento.nome}
                </p>
                <div className="flex items-center gap-4">
                  <div className="flex items-center gap-2">
                    <Trophy className="w-5 h-5 text-yellow-300" />
                    <span className="font-semibold">{meuInstrumento.progresso_geral}% completo</span>
                  </div>
                  <div className="w-px h-6 bg-white/30" />
                  <p className="text-purple-100">Próxima meta: {meuInstrumento.proxima_meta}</p>
                </div>
              </div>
            </div>

            {/* Barra de Progresso Geral */}
            <div>
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm text-purple-100">Progresso Geral</span>
                <span className="text-sm font-bold">{meuInstrumento.progresso_geral}%</span>
              </div>
              <div className="w-full bg-white/20 rounded-full h-3 overflow-hidden">
                <div
                  className="bg-gradient-to-r from-yellow-300 to-yellow-500 h-full rounded-full transition-all duration-500"
                  style={{ width: `${meuInstrumento.progresso_geral}%` }}
                />
              </div>
            </div>
          </div>
        </div>

        {/* Estatísticas */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {estatisticas.map((stat, index) => {
            const Icon = stat.icone
            const coresConfig = {
              purple: 'from-purple-500 to-indigo-500',
              orange: 'from-orange-500 to-red-500',
              blue: 'from-blue-500 to-cyan-500',
              green: 'from-green-500 to-emerald-500'
            }
            return (
              <div key={index} className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
                <div className={`w-12 h-12 bg-gradient-to-br ${coresConfig[stat.cor as keyof typeof coresConfig]} rounded-xl flex items-center justify-center mb-3`}>
                  <Icon className="w-6 h-6 text-white" />
                </div>
                <p className="text-sm text-gray-600 mb-1">{stat.label}</p>
                <p className="text-2xl font-bold text-gray-900">{stat.valor}</p>
              </div>
            )
          })}
        </div>

        {/* Técnicas e Habilidades */}
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
          <div className="flex items-center gap-2 mb-6">
            <Target className="w-6 h-6 text-purple-600" />
            <h2 className="text-2xl font-bold text-gray-900">Técnicas e Habilidades</h2>
          </div>

          <div className="space-y-4">
            {tecnicas.map((tecnica) => (
              <div
                key={tecnica.id}
                className={`p-5 rounded-xl border-2 transition-all cursor-pointer ${
                  tecnicaSelecionada === tecnica.id
                    ? 'border-purple-400 bg-purple-50'
                    : 'border-gray-200 hover:border-purple-200 bg-white'
                }`}
                onClick={() => setTecnicaSelecionada(tecnica.id)}
              >
                <div className="flex items-start justify-between mb-3">
                  <div className="flex-1">
                    <div className="flex items-center gap-3 mb-2">
                      <h3 className="text-lg font-bold text-gray-900">{tecnica.nome}</h3>
                      {tecnica.dominada && (
                        <span className="bg-green-100 text-green-700 px-3 py-1 rounded-full text-xs font-bold flex items-center gap-1">
                          <CheckCircle className="w-3 h-3" />
                          DOMINADA
                        </span>
                      )}
                    </div>
                    <p className="text-sm text-gray-600 mb-3">{tecnica.descricao}</p>
                  </div>
                </div>

                {/* Barra de Progresso */}
                <div className="mb-3">
                  <div className="flex items-center justify-between text-sm mb-1">
                    <span className="text-gray-600">Progresso</span>
                    <span className="font-bold text-gray-900">{tecnica.progresso}%</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-2 overflow-hidden">
                    <div
                      className={`h-full rounded-full transition-all duration-500 ${
                        tecnica.dominada
                          ? 'bg-gradient-to-r from-green-500 to-emerald-500'
                          : 'bg-gradient-to-r from-purple-500 to-indigo-500'
                      }`}
                      style={{ width: `${tecnica.progresso}%` }}
                    />
                  </div>
                </div>

                {/* Exercícios */}
                <div className="flex items-center justify-between text-sm">
                  <div className="flex items-center gap-2 text-gray-600">
                    <BookOpen className="w-4 h-4" />
                    <span>
                      {tecnica.exercicios_concluidos}/{tecnica.total_exercicios} exercícios
                    </span>
                  </div>
                  <button className="text-purple-600 font-semibold hover:text-purple-700 transition-colors">
                    Ver Exercícios →
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Sons e Samples */}
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
          <div className="flex items-center gap-2 mb-6">
            <Headphones className="w-6 h-6 text-purple-600" />
            <h2 className="text-2xl font-bold text-gray-900">Sons e Samples</h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {sonsDisponiveis.map((som) => (
              <div
                key={som.id}
                className="bg-gradient-to-br from-purple-50 to-indigo-50 rounded-xl p-4 border border-purple-200 hover:border-purple-400 transition-all"
              >
                <div className="flex items-center justify-between mb-3">
                  <div>
                    <h4 className="font-semibold text-gray-900">{som.nome}</h4>
                    <p className="text-xs text-gray-600 capitalize">{som.tipo} • {som.duracao}</p>
                  </div>
                  <button
                    className="bg-purple-600 hover:bg-purple-700 text-white p-3 rounded-full transition-colors"
                    onClick={() => handlePlaySound(som.id)}
                  >
                    {audioTocando === som.id ? (
                      <Pause className="w-4 h-4" />
                    ) : (
                      <Play className="w-4 h-4 fill-white" />
                    )}
                  </button>
                </div>
                <div className="flex gap-2">
                  <button className="flex-1 bg-white hover:bg-gray-50 text-gray-700 py-2 px-3 rounded-lg text-sm font-medium transition-colors flex items-center justify-center gap-1">
                    <Download className="w-3 h-3" />
                    Baixar
                  </button>
                  <button className="bg-white hover:bg-gray-50 text-gray-700 py-2 px-3 rounded-lg transition-colors">
                    <Volume2 className="w-4 h-4" />
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Vídeo-aulas */}
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
          <div className="flex items-center gap-2 mb-6">
            <Video className="w-6 h-6 text-purple-600" />
            <h2 className="text-2xl font-bold text-gray-900">Vídeo-aulas do {meuInstrumento.nome}</h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {videosAulas.map((video) => (
              <div
                key={video.id}
                className="bg-gradient-to-br from-gray-50 to-gray-100 rounded-xl overflow-hidden border border-gray-200 hover:border-purple-300 transition-all group cursor-pointer"
              >
                {/* Thumbnail */}
                <div className="relative h-40 bg-gradient-to-br from-purple-200 to-indigo-300 flex items-center justify-center">
                  <div className="text-6xl opacity-50">🎬</div>
                  {video.assistido && (
                    <div className="absolute top-3 right-3 bg-green-500 text-white p-1.5 rounded-full">
                      <CheckCircle className="w-4 h-4" />
                    </div>
                  )}
                  <div className="absolute bottom-3 right-3 bg-black/70 text-white px-2 py-1 rounded text-xs font-medium">
                    {video.duracao}
                  </div>
                  <button className="absolute inset-0 bg-black/0 group-hover:bg-black/20 transition-colors flex items-center justify-center">
                    <div className="bg-white/90 backdrop-blur-sm p-4 rounded-full group-hover:scale-110 transition-transform">
                      <Play className="w-6 h-6 text-purple-600 fill-purple-600" />
                    </div>
                  </button>
                </div>

                {/* Info */}
                <div className="p-4">
                  <h4 className="font-semibold text-gray-900 mb-1">{video.titulo}</h4>
                  <p className="text-xs text-gray-600">
                    {video.assistido ? 'Assistido' : 'Não assistido'}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* CTA para praticar */}
        <div className="bg-gradient-to-r from-purple-600 to-indigo-600 rounded-2xl p-8 text-center text-white shadow-xl">
          <Trophy className="w-16 h-16 mx-auto mb-4 text-yellow-300" />
          <h2 className="text-3xl font-bold mb-2">Continue Praticando!</h2>
          <p className="text-purple-100 mb-6 text-lg">
            Você está no caminho certo. Pratique 30 minutos por dia para manter sua sequência!
          </p>
          <div className="flex gap-4 justify-center">
            <button className="bg-white text-purple-600 px-8 py-3 rounded-lg font-bold hover:shadow-lg transition-all">
              Iniciar Prática
            </button>
            <button className="bg-white/10 backdrop-blur-sm border-2 border-white/30 text-white px-8 py-3 rounded-lg font-bold hover:bg-white/20 transition-all">
              Ver Exercícios
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
