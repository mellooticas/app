/**
 * 📚 QUERIES - HISTÓRIA DA MÚSICA
 * 
 * Todas as queries para o módulo de História da Música
 * Baseado nas tabelas: historia_periodos, historia_compositores, historia_obras, etc.
 */

import { supabase } from '../supabaseClient'

// ============================================
// TIPOS
// ============================================
export type HistoriaPeriodo = {
  id: string
  nome: string
  periodo_inicio: number
  periodo_fim: number
  descricao_curta: string
  descricao_completa: string
  contexto_historico: string
  caracteristicas_principais: string[]
  imagem_capa_url: string | null
  cor_tematica: string
  ordem_cronologica: number
  ativo: boolean
  created_at: string
}

export type HistoriaCompositor = {
  id: string
  nome_completo: string
  nome_artistico: string | null
  data_nascimento: string
  data_falecimento: string | null
  pais_nascimento: string
  cidade_nascimento: string | null
  periodo_id: string
  biografia_curta: string
  biografia_completa: string
  principais_obras: string[]
  estilo_musical: string
  instrumentos_tocados: string[]
  curiosidades: any
  foto_url: string | null
  audio_assinatura_url: string | null
  nivel_importancia: number
  tags: string[]
  ativo: boolean
  created_at: string
}

export type HistoriaObra = {
  id: string
  titulo: string
  titulo_original: string | null
  compositor_id: string
  periodo_id: string
  ano_composicao: number | null
  tipo_obra: string
  genero: string
  duracao_minutos: number | null
  instrumentacao: string[]
  tonalidade: string | null
  opus_numero: string | null
  descricao: string
  contexto_criacao: string
  estrutura_formal: any
  analise_musical: string
  significado_historico: string
  audio_url: string | null
  partitura_url: string | null
  video_performance_url: string | null
  nivel_dificuldade: number
  popularidade: number
  tags: string[]
  ativo: boolean
  created_at: string
}

export type HistoriaEventoTimeline = {
  id: string
  ano: number
  mes: number | null
  dia: number | null
  titulo: string
  tipo_evento: string
  categoria: string
  descricao: string
  compositor_id: string | null
  obra_id: string | null
  periodo_id: string | null
  imagem_url: string | null
  importancia: number
  ativo: boolean
  created_at: string
}

// ============================================
// PERÍODOS HISTÓRICOS
// ============================================
export const getHistoriaPeriodos = async () => {
  const { data, error } = await supabase
    .from('historia_periodos')
    .select('*')
    .eq('ativo', true)
    .order('ordem_cronologica')

  if (error) throw error
  return data as HistoriaPeriodo[]
}

export const getPeriodoDetalhes = async (periodoId: string) => {
  const { data, error } = await supabase
    .from('historia_periodos')
    .select('*')
    .eq('id', periodoId)
    .single()

  if (error) throw error
  return data as HistoriaPeriodo
}

// ============================================
// COMPOSITORES
// ============================================
export const getCompositores = async (filters?: {
  periodoId?: string
  paisNascimento?: string
  limit?: number
}) => {
  let query = supabase
    .from('historia_compositores')
    .select('*')
    .eq('ativo', true)

  if (filters?.periodoId) {
    query = query.eq('periodo_id', filters.periodoId)
  }

  if (filters?.paisNascimento) {
    query = query.eq('pais_nascimento', filters.paisNascimento)
  }

  query = query
    .order('nivel_importancia', { ascending: false })
    .order('data_nascimento')

  if (filters?.limit) {
    query = query.limit(filters.limit)
  }

  const { data, error } = await query

  if (error) throw error
  return data as HistoriaCompositor[]
}

export const getCompositorDetalhes = async (compositorId: string) => {
  const { data, error } = await supabase
    .from('historia_compositores')
    .select('*')
    .eq('id', compositorId)
    .single()

  if (error) throw error
  return data as HistoriaCompositor
}

// ============================================
// OBRAS
// ============================================
export const getObras = async (filters?: {
  compositorId?: string
  periodoId?: string
  genero?: string
  limit?: number
}) => {
  let query = supabase
    .from('historia_obras')
    .select('*')
    .eq('ativo', true)

  if (filters?.compositorId) {
    query = query.eq('compositor_id', filters.compositorId)
  }

  if (filters?.periodoId) {
    query = query.eq('periodo_id', filters.periodoId)
  }

  if (filters?.genero) {
    query = query.eq('genero', filters.genero)
  }

  query = query.order('popularidade', { ascending: false })

  if (filters?.limit) {
    query = query.limit(filters.limit)
  }

  const { data, error } = await query

  if (error) throw error
  return data as HistoriaObra[]
}

export const getObraDetalhes = async (obraId: string) => {
  const { data, error } = await supabase
    .from('historia_obras')
    .select('*')
    .eq('id', obraId)
    .single()

  if (error) throw error
  return data as HistoriaObra
}

// ============================================
// TIMELINE INTERATIVA
// ============================================
export const getTimelineEventos = async (filtros?: {
  anoInicio?: number
  anoFim?: number
  categoria?: string
  importanciaMinima?: number
}) => {
  let query = supabase
    .from('historia_eventos_timeline')
    .select('*')
    .eq('ativo', true)

  if (filtros?.anoInicio) {
    query = query.gte('ano', filtros.anoInicio)
  }

  if (filtros?.anoFim) {
    query = query.lte('ano', filtros.anoFim)
  }

  if (filtros?.categoria) {
    query = query.eq('categoria', filtros.categoria)
  }

  if (filtros?.importanciaMinima) {
    query = query.gte('importancia', filtros.importanciaMinima)
  }

  query = query.order('ano').order('mes').order('dia')

  const { data, error } = await query

  if (error) throw error
  return data as HistoriaEventoTimeline[]
}

// ============================================
// PROGRESSO DO USUÁRIO
// ============================================
export const getProgressoUsuario = async (userId: string) => {
  const { data, error } = await supabase
    .from('historia_progresso_usuario')
    .select('*')
    .eq('user_id', userId)

  if (error) throw error
  return data
}

export const marcarConteudoConcluido = async (
  userId: string,
  tipoConteudo: string,
  conteudoId: string
) => {
  const { data, error } = await supabase
    .from('historia_progresso_usuario')
    .upsert({
      user_id: userId,
      tipo_conteudo: tipoConteudo,
      conteudo_id: conteudoId,
      progresso: 100,
      concluido: true,
      data_conclusao: new Date().toISOString(),
    })
    .select()
    .single()

  if (error) throw error
  return data
}

export const registrarTempoEstudo = async (
  userId: string,
  tipoConteudo: string,
  conteudoId: string,
  minutosEstudados: number
) => {
  const { data: progressoAtual } = await supabase
    .from('historia_progresso_usuario')
    .select('tempo_estudado_minutos')
    .eq('user_id', userId)
    .eq('tipo_conteudo', tipoConteudo)
    .eq('conteudo_id', conteudoId)
    .single()

  const tempoTotal = (progressoAtual?.tempo_estudado_minutos || 0) + minutosEstudados

  const { data, error } = await supabase
    .from('historia_progresso_usuario')
    .upsert({
      user_id: userId,
      tipo_conteudo: tipoConteudo,
      conteudo_id: conteudoId,
      tempo_estudado_minutos: tempoTotal,
      updated_at: new Date().toISOString(),
    })
    .select()
    .single()

  if (error) throw error
  return data
}
