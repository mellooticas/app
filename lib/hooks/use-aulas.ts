import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { createClient } from '@/lib/supabase/client'
import { 
  concluirAula, 
  marcarAulaFavorita, 
  removerAulaFavorita 
} from '@/app/actions/aluno-actions'

/**
 * Hook para buscar todas as aulas
 */
export function useAulas() {
  return useQuery({
    queryKey: ['aulas'],
    queryFn: async () => {
      const supabase = createClient()
      const { data, error } = await supabase
        .from('aulas')
        .select('*')
        .order('numero', { ascending: true })

      if (error) throw error
      return data
    },
  })
}

/**
 * Hook para buscar aula específica
 */
export function useAula(aulaId: string | undefined) {
  return useQuery({
    queryKey: ['aulas', aulaId],
    queryFn: async () => {
      if (!aulaId) return null
      
      const supabase = createClient()
      const { data, error } = await supabase
        .from('aulas')
        .select('*')
        .eq('id', aulaId)
        .single()

      if (error) throw error
      return data
    },
    enabled: !!aulaId,
  })
}

/**
 * Hook para buscar progresso das aulas do aluno
 */
export function useAulasProgresso() {
  return useQuery({
    queryKey: ['aulas-progresso'],
    queryFn: async () => {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) throw new Error('Não autenticado')

      const { data, error } = await supabase
        .from('aula_progresso')
        .select('*')
        .eq('aluno_id', user.id)

      if (error) throw error
      return data
    },
  })
}

/**
 * Hook para buscar aulas favoritas
 */
export function useAulasFavoritas() {
  return useQuery({
    queryKey: ['aulas-favoritas'],
    queryFn: async () => {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) throw new Error('Não autenticado')

      const { data, error } = await supabase
        .from('aulas_favoritas')
        .select('*, aula:aulas(*)')
        .eq('aluno_id', user.id)

      if (error) throw error
      return data
    },
  })
}

/**
 * Mutation para concluir aula
 */
export function useConcluirAula() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: ({ aulaId, tempoEstudo }: { aulaId: string; tempoEstudo?: number }) =>
      concluirAula(aulaId, tempoEstudo),
    
    onSuccess: () => {
      // Invalidar cache de aulas e progresso
      queryClient.invalidateQueries({ queryKey: ['aulas'] })
      queryClient.invalidateQueries({ queryKey: ['aulas-progresso'] })
      queryClient.invalidateQueries({ queryKey: ['user-points'] })
    },
  })
}

/**
 * Mutation para marcar/desmarcar favorito
 */
export function useToggleFavorito() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: async ({ aulaId, isFavorito }: { aulaId: string; isFavorito: boolean }) => {
      if (isFavorito) {
        return await removerAulaFavorita(aulaId)
      } else {
        return await marcarAulaFavorita(aulaId)
      }
    },
    
    // Optimistic update
    onMutate: async ({ aulaId, isFavorito }) => {
      await queryClient.cancelQueries({ queryKey: ['aulas-favoritas'] })
      
      const previous = queryClient.getQueryData(['aulas-favoritas'])
      
      // Se está removendo, filtrar; se está adicionando, adicionar
      queryClient.setQueryData(['aulas-favoritas'], (old: any[]) => {
        if (isFavorito) {
          return old.filter((fav: any) => fav.aula_id !== aulaId)
        } else {
          return [...old, { aula_id: aulaId }]
        }
      })
      
      return { previous }
    },
    
    // Rollback em erro
    onError: (err, variables, context) => {
      if (context?.previous) {
        queryClient.setQueryData(['aulas-favoritas'], context.previous)
      }
    },
    
    // Revalidar em sucesso
    onSettled: () => {
      queryClient.invalidateQueries({ queryKey: ['aulas-favoritas'] })
    },
  })
}
