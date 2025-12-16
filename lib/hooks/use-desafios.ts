import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { createClient } from '@/lib/supabase/client'
import {
  participarDesafio,
  submeterDesafio,
  cancelarParticipacaoDesafio,
} from '@/app/actions/aluno-actions'

/**
 * Hook para buscar todos os desafios ativos
 */
export function useDesafios() {
  return useQuery({
    queryKey: ['desafios'],
    queryFn: async () => {
      const supabase = createClient()
      const { data, error } = await supabase
        .from('alpha_desafios')
        .select('*')
        .eq('ativo', true)
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

/**
 * Hook para buscar um desafio específico
 */
export function useDesafio(desafioId: string | undefined) {
  return useQuery({
    queryKey: ['desafios', desafioId],
    queryFn: async () => {
      if (!desafioId) return null
      
      const supabase = createClient()
      const { data, error } = await supabase
        .from('alpha_desafios')
        .select('*')
        .eq('id', desafioId)
        .single()

      if (error) throw error
      return data
    },
    enabled: !!desafioId,
  })
}

/**
 * Hook para buscar submissões do aluno
 */
export function useMinhasSubmissoes() {
  return useQuery({
    queryKey: ['minhas-submissoes'],
    queryFn: async () => {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) throw new Error('Não autenticado')

      const { data, error } = await supabase
        .from('alpha_submissoes')
        .select('*, desafio:alpha_desafios(*)')
        .eq('aluno_id', user.id)
        .is('deleted_at', null)
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

/**
 * Mutation para participar de desafio
 */
export function useParticiparDesafio() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: (desafioId: string) => participarDesafio(desafioId),
    
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['minhas-submissoes'] })
      queryClient.invalidateQueries({ queryKey: ['desafios'] })
    },
  })
}

/**
 * Mutation para submeter desafio
 */
export function useSubmeterDesafio() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: ({ desafioId, formData }: { desafioId: string; formData: FormData }) =>
      submeterDesafio(desafioId, formData),
    
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['minhas-submissoes'] })
      queryClient.invalidateQueries({ queryKey: ['user-points'] })
    },
  })
}

/**
 * Mutation para cancelar participação
 */
export function useCancelarParticipacao() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: (desafioId: string) => cancelarParticipacaoDesafio(desafioId),
    
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['minhas-submissoes'] })
    },
  })
}
