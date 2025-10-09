/**
 * 📚 HOOKS - HISTÓRIA DA MÚSICA
 */

import { useQuery } from '@tanstack/react-query'
import {
  getHistoriaPeriodos,
  getPeriodoDetalhes,
  getCompositores,
  getCompositorDetalhes,
  getObras,
  getObraDetalhes,
  getTimelineEventos,
  getProgressoUsuario,
} from '../../../lib/supabase/queries/historia-musica'

// ============================================
// PERÍODOS HISTÓRICOS
// ============================================
export function useHistoriaPeriodos() {
  return useQuery({
    queryKey: ['historia-periodos'],
    queryFn: getHistoriaPeriodos,
  })
}

export function usePeriodoDetalhes(periodoId: string) {
  return useQuery({
    queryKey: ['historia-periodo', periodoId],
    queryFn: () => getPeriodoDetalhes(periodoId),
    enabled: !!periodoId,
  })
}

// ============================================
// COMPOSITORES
// ============================================
export function useCompositores(filters?: {
  periodoId?: string
  paisNascimento?: string
  limit?: number
}) {
  return useQuery({
    queryKey: ['historia-compositores', filters],
    queryFn: () => getCompositores(filters),
  })
}

export function useCompositorDetalhes(compositorId: string) {
  return useQuery({
    queryKey: ['historia-compositor', compositorId],
    queryFn: () => getCompositorDetalhes(compositorId),
    enabled: !!compositorId,
  })
}

// ============================================
// OBRAS
// ============================================
export function useObras(filters?: {
  compositorId?: string
  periodoId?: string
  genero?: string
  limit?: number
}) {
  return useQuery({
    queryKey: ['historia-obras', filters],
    queryFn: () => getObras(filters),
  })
}

export function useObraDetalhes(obraId: string) {
  return useQuery({
    queryKey: ['historia-obra', obraId],
    queryFn: () => getObraDetalhes(obraId),
    enabled: !!obraId,
  })
}

// ============================================
// TIMELINE
// ============================================
export function useTimelineEventos(filtros?: {
  anoInicio?: number
  anoFim?: number
  categoria?: string
  importanciaMinima?: number
}) {
  return useQuery({
    queryKey: ['historia-timeline', filtros],
    queryFn: () => getTimelineEventos(filtros),
  })
}

// ============================================
// PROGRESSO DO USUÁRIO
// ============================================
export function useHistoriaProgresso(userId?: string) {
  return useQuery({
    queryKey: ['historia-progresso', userId],
    queryFn: () => getProgressoUsuario(userId!),
    enabled: !!userId,
  })
}
