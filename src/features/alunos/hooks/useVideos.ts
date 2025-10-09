/**
 * 🎬 HOOKS PARA BIBLIOTECA DE VÍDEOS
 * 
 * React Query hooks para gerenciar vídeos educacionais
 */

import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import {
  getCategoriasVideos,
  getVideos,
  getVideosPorCategoria,
  getVideosPorInstrumento,
  getVideosPorNivel,
  getVideosPorModulo,
  getVideoPorId,
  buscarVideos,
  incrementarVisualizacoes,
  getVideosPublicos,
  getEstatisticasVideos
} from '@/lib/supabase/queries/videos'

// ============================================
// CATEGORIAS
// ============================================

export function useCategoriasVideos() {
  return useQuery({
    queryKey: ['categorias-videos'],
    queryFn: getCategoriasVideos,
    staleTime: 1000 * 60 * 30, // 30 minutos
    gcTime: 1000 * 60 * 60 // 1 hora
  })
}

// ============================================
// VÍDEOS
// ============================================

export function useVideos() {
  return useQuery({
    queryKey: ['videos'],
    queryFn: getVideos,
    staleTime: 1000 * 60 * 10, // 10 minutos
    gcTime: 1000 * 60 * 30 // 30 minutos
  })
}

export function useVideosPorCategoria(categoriaId: string | null) {
  return useQuery({
    queryKey: ['videos-categoria', categoriaId],
    queryFn: () => getVideosPorCategoria(categoriaId!),
    enabled: !!categoriaId,
    staleTime: 1000 * 60 * 10
  })
}

export function useVideosPorInstrumento(instrumentoNome: string | null) {
  return useQuery({
    queryKey: ['videos-instrumento', instrumentoNome],
    queryFn: () => getVideosPorInstrumento(instrumentoNome!),
    enabled: !!instrumentoNome,
    staleTime: 1000 * 60 * 10
  })
}

export function useVideosPorNivel(nivel: 'iniciante' | 'intermediário' | 'avançado' | null) {
  return useQuery({
    queryKey: ['videos-nivel', nivel],
    queryFn: () => getVideosPorNivel(nivel!),
    enabled: !!nivel,
    staleTime: 1000 * 60 * 10
  })
}

export function useVideosPorModulo(modulo: string | null) {
  return useQuery({
    queryKey: ['videos-modulo', modulo],
    queryFn: () => getVideosPorModulo(modulo!),
    enabled: !!modulo,
    staleTime: 1000 * 60 * 10
  })
}

export function useVideo(id: string | null) {
  return useQuery({
    queryKey: ['video', id],
    queryFn: () => getVideoPorId(id!),
    enabled: !!id,
    staleTime: 1000 * 60 * 15 // 15 minutos
  })
}

export function useBuscarVideos(termo: string) {
  return useQuery({
    queryKey: ['videos-busca', termo],
    queryFn: () => buscarVideos(termo),
    enabled: termo.length >= 2,
    staleTime: 1000 * 60 * 5 // 5 minutos
  })
}

export function useVideosPublicos() {
  return useQuery({
    queryKey: ['videos-publicos'],
    queryFn: getVideosPublicos,
    staleTime: 1000 * 60 * 15 // 15 minutos
  })
}

export function useEstatisticasVideos() {
  return useQuery({
    queryKey: ['videos-estatisticas'],
    queryFn: getEstatisticasVideos,
    staleTime: 1000 * 60 * 15 // 15 minutos
  })
}

// ============================================
// MUTATIONS
// ============================================

export function useIncrementarVisualizacoes() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: incrementarVisualizacoes,
    onSuccess: () => {
      // Invalidar cache de vídeos e estatísticas
      queryClient.invalidateQueries({ queryKey: ['videos'] })
      queryClient.invalidateQueries({ queryKey: ['videos-estatisticas'] })
    }
  })
}
