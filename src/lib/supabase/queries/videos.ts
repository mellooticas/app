/**
 * 🎬 QUERIES PARA BIBLIOTECA DE VÍDEOS
 * 
 * Funções para buscar vídeos educacionais dos professores
 */

import { supabase } from '../supabaseClient'

// ============================================
// TYPES
// ============================================

export type CategoriaVideo = {
  id: string
  nome: string
  descricao: string | null
  icone: string | null
  cor_tema: string | null
}

export type VideoProfessor = {
  id: string
  titulo: string
  categoria_id: string
  professor_id: string
  descricao: string | null
  duracao: number | null // em segundos
  video_url: string
  thumbnail_url: string | null
  modulo: string | null
  aula_relacionada_id: string | null
  instrumento_foco: string | null
  nivel_dificuldade: 'iniciante' | 'intermediário' | 'avançado' | null
  publico: boolean
  requer_autenticacao: boolean
  liberado_para_nivel: string | null
  transcricao: string | null
  materiais_complementares: any | null // JSONB
  tags: any | null // JSONB
  visualizacoes: number
  ativo: boolean
  criado_em: string
}

export type VideoComCategoria = VideoProfessor & {
  categoria: CategoriaVideo | null
}

// ============================================
// CATEGORIAS
// ============================================

/**
 * Busca todas as categorias de vídeos
 */
export async function getCategoriasVideos() {
  const { data, error } = await supabase
    .from('categorias_videos')
    .select('*')
    .order('nome', { ascending: true })

  if (error) {
    console.error('Erro ao buscar categorias de vídeos:', error)
    throw error
  }

  return data as CategoriaVideo[]
}

// ============================================
// VÍDEOS
// ============================================

/**
 * Busca todos os vídeos ativos com categoria
 */
export async function getVideos() {
  const { data, error } = await supabase
    .from('videos_professores')
    .select(`
      *,
      categoria:categorias_videos(*)
    `)
    .eq('ativo', true)
    .order('criado_em', { ascending: false })

  if (error) {
    console.error('Erro ao buscar vídeos:', error)
    throw error
  }

  return data as VideoComCategoria[]
}

/**
 * Busca vídeos por categoria
 */
export async function getVideosPorCategoria(categoriaId: string) {
  const { data, error } = await supabase
    .from('videos_professores')
    .select(`
      *,
      categoria:categorias_videos(*)
    `)
    .eq('categoria_id', categoriaId)
    .eq('ativo', true)
    .order('criado_em', { ascending: false })

  if (error) {
    console.error('Erro ao buscar vídeos por categoria:', error)
    throw error
  }

  return data as VideoComCategoria[]
}

/**
 * Busca vídeos por instrumento
 */
export async function getVideosPorInstrumento(instrumentoNome: string) {
  const { data, error } = await supabase
    .from('videos_professores')
    .select(`
      *,
      categoria:categorias_videos(*)
    `)
    .eq('instrumento_foco', instrumentoNome)
    .eq('ativo', true)
    .order('modulo', { ascending: true, nullsFirst: false })
    .order('nivel_dificuldade', { ascending: true })

  if (error) {
    console.error('Erro ao buscar vídeos por instrumento:', error)
    throw error
  }

  return data as VideoComCategoria[]
}

/**
 * Busca vídeos por nível de dificuldade
 */
export async function getVideosPorNivel(nivel: 'iniciante' | 'intermediário' | 'avançado') {
  const { data, error } = await supabase
    .from('videos_professores')
    .select(`
      *,
      categoria:categorias_videos(*)
    `)
    .eq('nivel_dificuldade', nivel)
    .eq('ativo', true)
    .order('criado_em', { ascending: false })

  if (error) {
    console.error('Erro ao buscar vídeos por nível:', error)
    throw error
  }

  return data as VideoComCategoria[]
}

/**
 * Busca vídeos por módulo
 */
export async function getVideosPorModulo(modulo: string) {
  const { data, error } = await supabase
    .from('videos_professores')
    .select(`
      *,
      categoria:categorias_videos(*)
    `)
    .eq('modulo', modulo)
    .eq('ativo', true)
    .order('criado_em', { ascending: false })

  if (error) {
    console.error('Erro ao buscar vídeos por módulo:', error)
    throw error
  }

  return data as VideoComCategoria[]
}

/**
 * Busca um vídeo específico por ID
 */
export async function getVideoPorId(id: string) {
  const { data, error } = await supabase
    .from('videos_professores')
    .select(`
      *,
      categoria:categorias_videos(*)
    `)
    .eq('id', id)
    .single()

  if (error) {
    console.error('Erro ao buscar vídeo:', error)
    throw error
  }

  return data as VideoComCategoria
}

/**
 * Busca por texto (título ou descrição)
 */
export async function buscarVideos(termo: string) {
  const { data, error } = await supabase
    .from('videos_professores')
    .select(`
      *,
      categoria:categorias_videos(*)
    `)
    .or(`titulo.ilike.%${termo}%,descricao.ilike.%${termo}%`)
    .eq('ativo', true)
    .order('visualizacoes', { ascending: false })

  if (error) {
    console.error('Erro ao buscar vídeos:', error)
    throw error
  }

  return data as VideoComCategoria[]
}

/**
 * Incrementa o contador de visualizações
 */
export async function incrementarVisualizacoes(videoId: string) {
  const { error } = await supabase.rpc('increment_video_views', {
    video_id: videoId
  })

  if (error) {
    // Se a função RPC não existir, usar update tradicional
    const { data: video, error: fetchError } = await supabase
      .from('videos_professores')
      .select('visualizacoes')
      .eq('id', videoId)
      .single()

    if (fetchError || !video) {
      console.error('Erro ao buscar visualizações:', fetchError)
      return
    }

    const { error: updateError } = await supabase
      .from('videos_professores')
      .update({ visualizacoes: (video.visualizacoes || 0) + 1 })
      .eq('id', videoId)

    if (updateError) {
      console.error('Erro ao incrementar visualizações:', updateError)
    }
  }
}

/**
 * Busca vídeos públicos (sem autenticação)
 */
export async function getVideosPublicos() {
  const { data, error } = await supabase
    .from('videos_professores')
    .select(`
      *,
      categoria:categorias_videos(*)
    `)
    .eq('publico', true)
    .eq('ativo', true)
    .order('visualizacoes', { ascending: false })

  if (error) {
    console.error('Erro ao buscar vídeos públicos:', error)
    throw error
  }

  return data as VideoComCategoria[]
}

/**
 * Busca estatísticas da biblioteca de vídeos
 */
export async function getEstatisticasVideos() {
  const { count: total, error: errorTotal } = await supabase
    .from('videos_professores')
    .select('*', { count: 'exact', head: true })
    .eq('ativo', true)

  const { count: publicos, error: errorPublicos } = await supabase
    .from('videos_professores')
    .select('*', { count: 'exact', head: true })
    .eq('ativo', true)
    .eq('publico', true)

  const { data: duracao, error: errorDuracao } = await supabase
    .from('videos_professores')
    .select('duracao')
    .eq('ativo', true)

  if (errorTotal || errorPublicos || errorDuracao) {
    console.error('Erro ao buscar estatísticas:', errorTotal || errorPublicos || errorDuracao)
    throw errorTotal || errorPublicos || errorDuracao
  }

  const duracaoTotal = duracao?.reduce((acc, v) => acc + (v.duracao || 0), 0) || 0

  return {
    total: total || 0,
    publicos: publicos || 0,
    privados: (total || 0) - (publicos || 0),
    duracao_total_minutos: Math.round(duracaoTotal / 60),
    duracao_total_horas: Math.round(duracaoTotal / 3600)
  }
}
