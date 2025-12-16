import { useQuery } from '@tanstack/react-query'
import { createClient } from '@/lib/supabase/client'

/**
 * Hook para buscar comentários de uma aula
 */
export function useComentariosAula(aulaId: string | undefined) {
  return useQuery({
    queryKey: ['comentarios', aulaId],
    queryFn: async () => {
      if (!aulaId) return []
      
      const supabase = createClient()
      const { data, error } = await supabase
        .from('aulas_comentarios')
        .select('*, user:profiles(nome, avatar_url)')
        .eq('aula_id', aulaId)
        .is('deleted_at', null)
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
    enabled: !!aulaId,
  })
}

/**
 * Hook para buscar curtidas de um comentário
 */
export function useCurtidasComentario(comentarioId: string | undefined) {
  return useQuery({
    queryKey: ['curtidas', comentarioId],
    queryFn: async () => {
      if (!comentarioId) return []
      
      const supabase = createClient()
      const { data, error } = await supabase
        .from('comentarios_curtidas')
        .select('*')
        .eq('comentario_id', comentarioId)

      if (error) throw error
      return data
    },
    enabled: !!comentarioId,
  })
}

/**
 * Hook para verificar se usuário curtiu um comentário
 */
export function useUserCurtiu(comentarioId: string | undefined) {
  return useQuery({
    queryKey: ['user-curtiu', comentarioId],
    queryFn: async () => {
      if (!comentarioId) return false
      
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) return false

      const { data, error } = await supabase
        .from('comentarios_curtidas')
        .select('id')
        .eq('comentario_id', comentarioId)
        .eq('user_id', user.id)
        .maybeSingle()

      if (error) return false
      return !!data
    },
    enabled: !!comentarioId,
  })
}
