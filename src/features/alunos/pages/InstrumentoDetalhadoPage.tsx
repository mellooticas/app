import React, { useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import {
  ArrowLeft,
  Music,
  Sparkles,
  Play,
  Video,
  BookOpen,
  Target,
  Star,
  Brain,
  Link2,
  MapPin,
  Package,
  Loader2,
  AlertCircle,
  Volume2,
  Film,
  Trophy
} from 'lucide-react'
import { useInstrumentoCompleto } from '@/lib/supabase/queries/instrumento-completo'
import type { Curiosidade, Midia, Som, Tecnica, Performance, Quiz } from '@/types/instrumentos.types'

export function InstrumentoDetalhadoPage() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const [tabAtiva, setTabAtiva] = useState<string>('geral')
  const [audioTocando, setAudioTocando] = useState<string | null>(null)

  // Buscar TODOS os dados do instrumento
  const { data: instrumento, isLoading, error } = useInstrumentoCompleto(id)

  if (isLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-50 via-white to-blue-50 flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="w-16 h-16 text-purple-600 animate-spin mx-auto mb-4" />
          <p className="text-xl text-gray-600">Carregando instrumento...</p>
        </div>
      </div>
    )
  }

  if (error || !instrumento) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-50 via-white to-blue-50 flex items-center justify-center">
        <div className="text-center">
          <AlertCircle className="w-16 h-16 text-red-500 mx-auto mb-4" />
          <p className="text-xl text-gray-600">Instrumento não encontrado</p>
          <button
            onClick={() => navigate('/aluno/instrumentos')}
            className="mt-4 px-6 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700"
          >
            Voltar à Biblioteca
          </button>
        </div>
      </div>
    )
  }

  const stats = instrumento.stats || {}
  const categoriaEmoji = getCategoriaEmoji(instrumento.categoria || '')

  const tabs = [
    { id: 'geral', nome: 'Visão Geral', icon: BookOpen, badge: null },
    { id: 'curiosidades', nome: 'Curiosidades', icon: Sparkles, badge: stats.total_curiosidades },
    { id: 'midias', nome: 'Mídias', icon: Film, badge: stats.total_midias },
    { id: 'sons', nome: 'Sons', icon: Volume2, badge: stats.total_sons },
    { id: 'tecnicas', nome: 'Técnicas', icon: Target, badge: stats.total_tecnicas },
    { id: 'performances', nome: 'Performances', icon: Trophy, badge: stats.total_performances },
    { id: 'quiz', nome: 'Quiz', icon: Brain, badge: stats.total_quiz },
    { id: 'relacionados', nome: 'Relacionados', icon: Link2, badge: stats.total_relacionados }
  ]

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-50 via-white to-blue-50">
      {/* HEADER COM BOTÃO VOLTAR */}
      <div className="bg-white border-b border-gray-200 sticky top-0 z-50 shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <button
            onClick={() => navigate('/aluno/instrumentos')}
            className="flex items-center gap-2 text-gray-600 hover:text-purple-600 transition-colors group"
          >
            <ArrowLeft className="w-5 h-5 group-hover:-translate-x-1 transition-transform" />
            <span className="font-medium">Voltar à Biblioteca</span>
          </button>
        </div>
      </div>

      {/* HERO SECTION */}
      <div className="bg-gradient-to-r from-purple-600 via-blue-600 to-indigo-600 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center gap-6">
            <div className="text-8xl">{categoriaEmoji}</div>
            <div className="flex-1">
              <h1 className="text-5xl font-bold mb-2">{instrumento.nome}</h1>
              <p className="text-xl text-purple-100 mb-4">{instrumento.descricao}</p>
              <div className="flex flex-wrap gap-3">
                {instrumento.categoria && (
                  <span className="bg-white/20 backdrop-blur-sm px-4 py-2 rounded-full text-sm font-medium">
                    📂 {instrumento.categoria}
                  </span>
                )}
                {instrumento.dificuldade_aprendizado && (
                  <span className="bg-white/20 backdrop-blur-sm px-4 py-2 rounded-full text-sm font-medium">
                    📊 Nível: {instrumento.dificuldade_aprendizado}
                  </span>
                )}
                {instrumento.origem && (
                  <span className="bg-white/20 backdrop-blur-sm px-4 py-2 rounded-full text-sm font-medium">
                    🌍 {instrumento.origem}
                  </span>
                )}
                {stats.total_fisicos_disponiveis > 0 && (
                  <span className="bg-green-500/30 backdrop-blur-sm px-4 py-2 rounded-full text-sm font-medium flex items-center gap-2">
                    <Package className="w-4 h-4" />
                    {stats.total_fisicos_disponiveis} disponível{stats.total_fisicos_disponiveis > 1 ? 'is' : ''} na escola
                  </span>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* TABS NAVIGATION */}
      <div className="bg-white border-b border-gray-200 sticky top-[73px] z-40 shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex overflow-x-auto gap-1 py-2 scrollbar-hide">
            {tabs.map((tab) => {
              const Icon = tab.icon
              const isActive = tabAtiva === tab.id
              return (
                <button
                  key={tab.id}
                  onClick={() => setTabAtiva(tab.id)}
                  className={`
                    flex items-center gap-2 px-4 py-3 rounded-lg whitespace-nowrap transition-all
                    ${isActive 
                      ? 'bg-purple-600 text-white shadow-lg scale-105' 
                      : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}
                  `}
                >
                  <Icon className="w-4 h-4" />
                  <span className="font-medium">{tab.nome}</span>
                  {tab.badge !== null && tab.badge > 0 && (
                    <span className={`
                      text-xs font-bold px-2 py-1 rounded-full
                      ${isActive ? 'bg-white/20' : 'bg-purple-600 text-white'}
                    `}>
                      {tab.badge}
                    </span>
                  )}
                </button>
              )
            })}
          </div>
        </div>
      </div>

      {/* CONTEÚDO DAS TABS */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {tabAtiva === 'geral' && <VisaoGeralTab instrumento={instrumento} />}
        {tabAtiva === 'curiosidades' && <CuriosidadesTab curiosidades={instrumento.curiosidades} />}
        {tabAtiva === 'midias' && <MidiasTab midias={instrumento.midias} />}
        {tabAtiva === 'sons' && <SonsTab sons={instrumento.sons} audioTocando={audioTocando} setAudioTocando={setAudioTocando} />}
        {tabAtiva === 'tecnicas' && <TecnicasTab tecnicas={instrumento.tecnicas} />}
        {tabAtiva === 'performances' && <PerformancesTab performances={instrumento.performances} />}
        {tabAtiva === 'quiz' && <QuizTab quiz={instrumento.quiz} />}
        {tabAtiva === 'relacionados' && <RelacionadosTab relacionados={instrumento.relacionados} />}
      </div>
    </div>
  )
}

// ============================================
// TAB: VISÃO GERAL
// ============================================

function VisaoGeralTab({ instrumento }: { instrumento: any }) {
  return (
    <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
      {/* Card: Informações Básicas */}
      <div className="bg-white rounded-2xl shadow-lg p-8 border-2 border-purple-100">
        <h2 className="text-2xl font-bold text-gray-800 mb-6 flex items-center gap-2">
          <Music className="w-6 h-6 text-purple-600" />
          Informações Básicas
        </h2>
        <div className="space-y-4">
          {instrumento.familia_instrumental && (
            <InfoRow label="Família" value={instrumento.familia_instrumental} />
          )}
          {instrumento.material_principal && (
            <InfoRow label="Material" value={instrumento.material_principal} />
          )}
          {instrumento.tecnica_producao_som && (
            <InfoRow label="Produção de Som" value={instrumento.tecnica_producao_som} />
          )}
        </div>
      </div>

      {/* Card: História */}
      {instrumento.historia && (
        <div className="bg-gradient-to-br from-amber-50 to-orange-50 rounded-2xl shadow-lg p-8 border-2 border-amber-200">
          <h2 className="text-2xl font-bold text-gray-800 mb-4 flex items-center gap-2">
            <BookOpen className="w-6 h-6 text-amber-600" />
            História
          </h2>
          <p className="text-gray-700 leading-relaxed">{instrumento.historia}</p>
        </div>
      )}

      {/* Card: Disponibilidade */}
      {instrumento.fisicos && instrumento.fisicos.length > 0 && (
        <div className="bg-gradient-to-br from-green-50 to-emerald-50 rounded-2xl shadow-lg p-8 border-2 border-green-200 lg:col-span-2">
          <h2 className="text-2xl font-bold text-gray-800 mb-6 flex items-center gap-2">
            <Package className="w-6 h-6 text-green-600" />
            Disponível na Escola
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {instrumento.fisicos.map((fisico: any) => (
              <div key={fisico.id} className="bg-white rounded-lg p-4 border border-green-200">
                <div className="flex items-start justify-between mb-2">
                  <span className="text-sm font-bold text-green-700">#{fisico.numero_serie || 'S/N'}</span>
                  <span className="px-2 py-1 bg-green-100 text-green-700 text-xs font-bold rounded-full">
                    {fisico.estado || 'Bom'}
                  </span>
                </div>
                {fisico.marca && (
                  <p className="text-sm text-gray-600">📦 {fisico.marca} {fisico.modelo}</p>
                )}
                {fisico.localizacao && (
                  <p className="text-sm text-gray-600 flex items-center gap-1 mt-1">
                    <MapPin className="w-3 h-3" />
                    {fisico.localizacao}
                  </p>
                )}
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}

function InfoRow({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex items-start gap-3">
      <span className="text-sm font-bold text-gray-500 min-w-[120px]">{label}:</span>
      <span className="text-gray-800">{value}</span>
    </div>
  )
}

// ============================================
// TAB: CURIOSIDADES
// ============================================

function CuriosidadesTab({ curiosidades }: { curiosidades: Curiosidade[] }) {
  if (curiosidades.length === 0) {
    return <EmptyState message="Nenhuma curiosidade cadastrada ainda." />
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
      {curiosidades.map((curiosidade, idx) => (
        <div
          key={curiosidade.id}
          className="bg-white rounded-2xl shadow-lg p-6 border-2 border-purple-100 hover:border-purple-300 transition-all hover:scale-105"
        >
          <div className="flex items-start gap-4">
            <div className="text-4xl">{getCuriosidadeIcon(curiosidade.categoria || '')}</div>
            <div className="flex-1">
              <h3 className="text-xl font-bold text-gray-800 mb-2">{curiosidade.titulo}</h3>
              <p className="text-gray-600 leading-relaxed mb-3">{curiosidade.conteudo}</p>
              {curiosidade.fonte && (
                <p className="text-xs text-gray-400 italic">Fonte: {curiosidade.fonte}</p>
              )}
            </div>
          </div>
        </div>
      ))}
    </div>
  )
}

// ============================================
// TAB: MÍDIAS
// ============================================

function MidiasTab({ midias }: { midias: Midia[] }) {
  const [tipoFiltro, setTipoFiltro] = useState<string>('todos')

  const midiasFiltradas = tipoFiltro === 'todos' 
    ? midias 
    : midias.filter(m => m.tipo === tipoFiltro)

  if (midias.length === 0) {
    return <EmptyState message="Nenhuma mídia cadastrada ainda." />
  }

  return (
    <div>
      {/* Filtros */}
      <div className="flex gap-3 mb-6">
        {['todos', 'imagem', 'video', 'audio'].map((tipo) => (
          <button
            key={tipo}
            onClick={() => setTipoFiltro(tipo)}
            className={`px-4 py-2 rounded-lg font-medium transition-all ${
              tipoFiltro === tipo
                ? 'bg-purple-600 text-white shadow-lg'
                : 'bg-white text-gray-600 hover:bg-gray-100'
            }`}
          >
            {tipo === 'todos' ? 'Todas' : tipo.charAt(0).toUpperCase() + tipo.slice(1)}
          </button>
        ))}
      </div>

      {/* Grid de Mídias */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {midiasFiltradas.map((midia) => (
          <div key={midia.id} className="bg-white rounded-xl shadow-lg overflow-hidden border-2 border-gray-100">
            <div className="h-48 bg-gradient-to-br from-gray-100 to-gray-200 flex items-center justify-center">
              {midia.tipo === 'imagem' && <Film className="w-16 h-16 text-gray-400" />}
              {midia.tipo === 'video' && <Video className="w-16 h-16 text-gray-400" />}
              {midia.tipo === 'audio' && <Volume2 className="w-16 h-16 text-gray-400" />}
            </div>
            <div className="p-4">
              <h3 className="font-bold text-gray-800 mb-1">{midia.titulo}</h3>
              {midia.descricao && (
                <p className="text-sm text-gray-600">{midia.descricao}</p>
              )}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

// ============================================
// TAB: SONS
// ============================================

function SonsTab({ sons, audioTocando, setAudioTocando }: { 
  sons: Som[]
  audioTocando: string | null
  setAudioTocando: (id: string | null) => void
}) {
  if (sons.length === 0) {
    return <EmptyState message="Nenhum som cadastrado ainda." />
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
      {sons.map((som) => (
        <div
          key={som.id}
          className="bg-white rounded-xl shadow-lg p-6 border-2 border-blue-100 hover:border-blue-300 transition-all"
        >
          <div className="flex items-center justify-between mb-4">
            <div>
              <h3 className="text-lg font-bold text-gray-800">{som.nota_musical}</h3>
              <p className="text-sm text-gray-600">{som.tecnica}</p>
            </div>
            <button
              onClick={() => setAudioTocando(audioTocando === som.id ? null : som.id)}
              className={`p-4 rounded-full transition-all ${
                audioTocando === som.id
                  ? 'bg-blue-600 text-white scale-110'
                  : 'bg-blue-100 text-blue-600 hover:bg-blue-200'
              }`}
            >
              <Play className="w-6 h-6" />
            </button>
          </div>
          {som.artista_performer && (
            <p className="text-xs text-gray-500">🎤 {som.artista_performer}</p>
          )}
        </div>
      ))}
    </div>
  )
}

// ============================================
// TAB: TÉCNICAS
// ============================================

function TecnicasTab({ tecnicas }: { tecnicas: Tecnica[] }) {
  if (tecnicas.length === 0) {
    return <EmptyState message="Nenhuma técnica cadastrada ainda." />
  }

  const porNivel = {
    iniciante: tecnicas.filter(t => t.nivel === 'iniciante'),
    intermediario: tecnicas.filter(t => t.nivel === 'intermediario'),
    avancado: tecnicas.filter(t => t.nivel === 'avancado')
  }

  return (
    <div className="space-y-8">
      {Object.entries(porNivel).map(([nivel, tecnicasNivel]) => {
        if (tecnicasNivel.length === 0) return null
        
        const nivelConfig = {
          iniciante: { cor: 'green', emoji: '🌱', label: 'Iniciante' },
          intermediario: { cor: 'yellow', emoji: '⭐', label: 'Intermediário' },
          avancado: { cor: 'red', emoji: '🔥', label: 'Avançado' }
        }[nivel] || { cor: 'gray', emoji: '📚', label: nivel }

        return (
          <div key={nivel}>
            <h2 className="text-2xl font-bold text-gray-800 mb-4 flex items-center gap-2">
              <span className="text-3xl">{nivelConfig.emoji}</span>
              {nivelConfig.label}
              <span className="text-sm font-normal text-gray-500">({tecnicasNivel.length})</span>
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
              {tecnicasNivel.map((tecnica) => (
                <div
                  key={tecnica.id}
                  className={`bg-white rounded-xl shadow-lg p-6 border-2 border-${nivelConfig.cor}-200`}
                >
                  <h3 className="font-bold text-gray-800 mb-2">{tecnica.nome}</h3>
                  {tecnica.descricao && (
                    <p className="text-sm text-gray-600 mb-3">{tecnica.descricao}</p>
                  )}
                  {tecnica.tempo_pratica_recomendado && (
                    <p className="text-xs text-gray-500">
                      ⏱️ {tecnica.tempo_pratica_recomendado} min/dia
                    </p>
                  )}
                  {tecnica.video_tutorial && (
                    <button className="mt-3 w-full px-4 py-2 bg-purple-600 text-white rounded-lg text-sm font-medium hover:bg-purple-700 flex items-center justify-center gap-2">
                      <Play className="w-4 h-4" />
                      Ver Tutorial
                    </button>
                  )}
                </div>
              ))}
            </div>
          </div>
        )
      })}
    </div>
  )
}

// ============================================
// TAB: PERFORMANCES
// ============================================

function PerformancesTab({ performances }: { performances: Performance[] }) {
  if (performances.length === 0) {
    return <EmptyState message="Nenhuma performance cadastrada ainda." />
  }

  return (
    <div className="grid grid-cols-1 gap-6">
      {performances.map((perf) => (
        <div
          key={perf.id}
          className="bg-white rounded-2xl shadow-lg p-8 border-2 border-amber-100 hover:border-amber-300 transition-all"
        >
          <div className="flex items-start gap-6">
            <div className="text-6xl">🎭</div>
            <div className="flex-1">
              <h3 className="text-2xl font-bold text-gray-800 mb-2">{perf.titulo}</h3>
              <div className="flex flex-wrap gap-3 mb-4">
                {perf.artista && (
                  <span className="text-sm text-gray-600">🎤 {perf.artista}</span>
                )}
                {perf.compositor && perf.compositor !== perf.artista && (
                  <span className="text-sm text-gray-600">✍️ {perf.compositor}</span>
                )}
                {perf.ano_performance && (
                  <span className="text-sm text-gray-600">📅 {perf.ano_performance}</span>
                )}
                {perf.genero_musical && (
                  <span className="px-3 py-1 bg-amber-100 text-amber-700 rounded-full text-xs font-bold">
                    {perf.genero_musical}
                  </span>
                )}
              </div>
              {perf.descricao_tecnica && (
                <p className="text-gray-700 leading-relaxed mb-4">{perf.descricao_tecnica}</p>
              )}
              {perf.video_url && (
                <button className="px-6 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 flex items-center gap-2">
                  <Play className="w-5 h-5" />
                  Assistir no YouTube
                </button>
              )}
            </div>
          </div>
        </div>
      ))}
    </div>
  )
}

// ============================================
// TAB: QUIZ
// ============================================

function QuizTab({ quiz }: { quiz: Quiz[] }) {
  const [respostas, setRespostas] = useState<Record<string, string>>({})
  const [mostrarResultados, setMostrarResultados] = useState(false)

  if (quiz.length === 0) {
    return <EmptyState message="Nenhum quiz cadastrado ainda." />
  }

  const calcularPontuacao = () => {
    let corretas = 0
    quiz.forEach((q) => {
      const respostaUsuario = respostas[q.id]
      const respostaCorreta = q.respostas_corretas?.[0] || q.resposta_correta
      if (respostaUsuario === respostaCorreta) {
        corretas++
      }
    })
    return corretas
  }

  return (
    <div className="space-y-6">
      {quiz.map((q, idx) => {
        const opcoes = JSON.parse(q.opcoes) as string[]
        const respostaUsuario = respostas[q.id]
        const respostaCorreta = q.respostas_corretas?.[0] || q.resposta_correta
        const acertou = mostrarResultados && respostaUsuario === respostaCorreta

        return (
          <div
            key={q.id}
            className={`bg-white rounded-2xl shadow-lg p-8 border-2 ${
              mostrarResultados 
                ? acertou ? 'border-green-300 bg-green-50' : 'border-red-300 bg-red-50'
                : 'border-purple-100'
            }`}
          >
            <h3 className="text-lg font-bold text-gray-800 mb-4">
              {idx + 1}. {q.pergunta}
            </h3>
            <div className="space-y-3">
              {opcoes.map((opcao) => (
                <button
                  key={opcao}
                  onClick={() => !mostrarResultados && setRespostas({ ...respostas, [q.id]: opcao.charAt(0) })}
                  disabled={mostrarResultados}
                  className={`w-full text-left p-4 rounded-lg border-2 transition-all ${
                    respostaUsuario === opcao.charAt(0)
                      ? 'border-purple-600 bg-purple-50'
                      : 'border-gray-200 hover:border-gray-300'
                  } ${mostrarResultados && opcao.charAt(0) === respostaCorreta ? 'bg-green-100 border-green-500' : ''}`}
                >
                  {opcao}
                </button>
              ))}
            </div>
            {mostrarResultados && q.explicacao && (
              <div className="mt-4 p-4 bg-blue-50 rounded-lg border border-blue-200">
                <p className="text-sm text-blue-800">💡 {q.explicacao}</p>
              </div>
            )}
          </div>
        )
      })}

      <div className="flex gap-4">
        {!mostrarResultados ? (
          <button
            onClick={() => setMostrarResultados(true)}
            disabled={Object.keys(respostas).length !== quiz.length}
            className="px-8 py-4 bg-purple-600 text-white rounded-xl font-bold text-lg hover:bg-purple-700 disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2"
          >
            <Brain className="w-6 h-6" />
            Ver Resultado
          </button>
        ) : (
          <div className="flex-1 bg-gradient-to-r from-purple-600 to-blue-600 text-white rounded-xl p-6 shadow-lg">
            <div className="text-center">
              <p className="text-sm font-medium mb-2">Sua Pontuação</p>
              <p className="text-5xl font-bold">{calcularPontuacao()}/{quiz.length}</p>
              <p className="mt-2 text-purple-100">
                {calcularPontuacao() === quiz.length ? '🎉 Perfeito!' : calcularPontuacao() >= quiz.length * 0.7 ? '👏 Muito bem!' : '💪 Continue praticando!'}
              </p>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}

// ============================================
// TAB: RELACIONADOS
// ============================================

function RelacionadosTab({ relacionados }: { relacionados: any[] }) {
  if (relacionados.length === 0) {
    return <EmptyState message="Nenhum instrumento relacionado cadastrado." />
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      {relacionados.map((rel) => (
        <div
          key={rel.id}
          className="bg-white rounded-xl shadow-lg p-6 border-2 border-purple-100 hover:border-purple-300 transition-all cursor-pointer hover:scale-105"
        >
          <div className="text-5xl mb-4 text-center">{getCategoriaEmoji(rel.relacionado?.categoria || '')}</div>
          <h3 className="font-bold text-gray-800 text-center mb-2">{rel.relacionado?.nome}</h3>
          {rel.tipo_relacao && (
            <p className="text-sm text-center text-purple-600 font-medium mb-2">
              {getTipoRelacaoLabel(rel.tipo_relacao)}
            </p>
          )}
          {rel.descricao_relacao && (
            <p className="text-xs text-gray-600 text-center">{rel.descricao_relacao}</p>
          )}
        </div>
      ))}
    </div>
  )
}

// ============================================
// COMPONENTE: EMPTY STATE
// ============================================

function EmptyState({ message }: { message: string }) {
  return (
    <div className="text-center py-16">
      <div className="text-6xl mb-4">📭</div>
      <p className="text-xl text-gray-500">{message}</p>
    </div>
  )
}

// ============================================
// UTILS
// ============================================

function getCategoriaEmoji(categoria: string): string {
  const map: Record<string, string> = {
    cordas: '🎸',
    sopro: '🎺',
    percussao: '🥁',
    teclado: '🎹',
    teclas: '🎹'
  }
  return map[categoria.toLowerCase()] || '🎵'
}

function getCuriosidadeIcon(categoria: string): string {
  const map: Record<string, string> = {
    cultural: '🌍',
    historia: '📜',
    ciencia: '🔬',
    tecnica: '🎯'
  }
  return map[categoria.toLowerCase()] || '💡'
}

function getTipoRelacaoLabel(tipo: string): string {
  const map: Record<string, string> = {
    mesma_familia: '👨‍👩‍👧‍👦 Mesma Família',
    som_similar: '🔊 Som Similar',
    complementar: '🤝 Complementar'
  }
  return map[tipo] || tipo
}
