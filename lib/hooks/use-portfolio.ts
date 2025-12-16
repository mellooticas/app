import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { createClient } from '@/lib/supabase/client'
import {
  submitPortfolio,
  deletePortfolioItem,
  updatePortfolioItem,
} from '@/app/actions/aluno-actions'

/**
 * Hook para buscar todo o portfólio do aluno
 */
export function usePortfolio() {
  return useQuery({
    queryKey: ['portfolio'],
    queryFn: async () => {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) throw new Error('Não autenticado')

      const { data, error } = await supabase
        .from('portfolios')
        .select('*')
        .eq('aluno_id', user.id)
        .is('deleted_at', null)
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

/**
 * Hook para buscar uma obra específica
 */
export function usePortfolioItem(obraId: string | undefined) {
  return useQuery({
    queryKey: ['portfolio', obraId],
    queryFn: async () => {
      if (!obraId) return null
      
      const supabase = createClient()
      const { data, error } = await supabase
        .from('portfolios')
        .select('*')
        .eq('id', obraId)
        .single()

      if (error) throw error
      return data
    },
    enabled: !!obraId,
  })
}

/**
 * Mutation para adicionar obra ao portfólio
 */
export function useSubmitPortfolio() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: (formData: FormData) => submitPortfolio(formData),
    
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['portfolio'] })
      queryClient.invalidateQueries({ queryKey: ['user-points'] })
    },
  })
}

/**
 * Mutation para deletar obra
 */
export function useDeletePortfolioItem() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: (obraId: string) => deletePortfolioItem(obraId),
    
    // Optimistic update
    onMutate: async (obraId) => {
      await queryClient.cancelQueries({ queryKey: ['portfolio'] })
      
      const previous = queryClient.getQueryData(['portfolio'])
      
      queryClient.setQueryData(['portfolio'], (old: any[]) =>
        old.filter((obra: any) => obra.id !== obraId)
      )
      
      return { previous }
    },
    
    onError: (err, variables, context) => {
      if (context?.previous) {
        queryClient.setQueryData(['portfolio'], context.previous)
      }
    },
    
    onSettled: () => {
      queryClient.invalidateQueries({ queryKey: ['portfolio'] })
    },
  })
}

/**
 * Mutation para atualizar obra
 */
export function useUpdatePortfolioItem() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: ({ id, data }: { id: string; data: any }) =>
      updatePortfolioItem(id, data),
    
    // Optimistic update
    onMutate: async ({ id, data }) => {
      await queryClient.cancelQueries({ queryKey: ['portfolio', id] })
      
      const previous = queryClient.getQueryData(['portfolio', id])
      
      queryClient.setQueryData(['portfolio', id], (old: any) => ({
        ...old,
        ...data
      }))
      
      return { previous }
    },
    
    onError: (err, variables, context) => {
      if (context?.previous) {
        queryClient.setQueryData(['portfolio', variables.id], context.previous)
      }
    },
    
    onSettled: (data, error, variables) => {
      queryClient.invalidateQueries({ queryKey: ['portfolio', variables.id] })
      queryClient.invalidateQueries({ queryKey: ['portfolio'] })
    },
  })
}
