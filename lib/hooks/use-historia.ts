import { useQuery } from '@tanstack/react-query'
import { 
  getPeriodosHistoria, 
  getPeriodoById, 
  getCompositoresByPeriodo 
} from '@/lib/supabase/queries/historia'

/**
 * Hook para buscar todos os períodos da história da música
 */
export function usePeriodosHistoria() {
  return useQuery({
    queryKey: ['historia-periodos'],
    queryFn: getPeriodosHistoria,
    staleTime: 1000 * 60 * 10, // 10 minutos (dados raramente mudam)
  })
}

/**
 * Hook para buscar um período específico
 */
export function usePeriodo(periodoId: string | undefined) {
  return useQuery({
    queryKey: ['historia-periodos', periodoId],
    queryFn: () => periodoId ? getPeriodoById(periodoId) : null,
    enabled: !!periodoId,
    staleTime: 1000 * 60 * 10,
  })
}

/**
 * Hook para buscar compositores de um período
 */
export function useCompositoresPorPeriodo(periodoId: string | undefined) {
  return useQuery({
    queryKey: ['historia-compositores', periodoId],
    queryFn: () => periodoId ? getCompositoresByPeriodo(periodoId) : [],
    enabled: !!periodoId,
    staleTime: 1000 * 60 * 10,
  })
}
