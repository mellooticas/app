import { useQuery } from '@tanstack/react-query'
import { createClient } from '@/lib/supabase/client'

/**
 * Hook para buscar pontos do usuário
 */
export function useUserPoints() {
  return useQuery({
    queryKey: ['user-points'],
    queryFn: async () => {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) throw new Error('Não autenticado')

      const { data, error } = await supabase
        .from('profiles')
        .select('total_points, nivel, xp_atual')
        .eq('id', user.id)
        .single()

      if (error) throw error
      return data
    },
  })
}

/**
 * Hook para buscar histórico de pontos
 */
export function usePointsLog() {
  return useQuery({
    queryKey: ['points-log'],
    queryFn: async () => {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) throw new Error('Não autenticado')

      const { data, error } = await supabase
        .from('user_points_log')
        .select('*')
        .eq('user_id', user.id)
        .order('created_at', { ascending: false })
        .limit(50)

      if (error) throw error
      return data
    },
  })
}

/**
 * Hook para buscar conquistas do usuário
 */
export function useUserAchievements() {
  return useQuery({
    queryKey: ['user-achievements'],
    queryFn: async () => {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) throw new Error('Não autenticado')

      const { data, error } = await supabase
        .from('user_achievements')
        .select('*, achievement:achievements(*)')
        .eq('user_id', user.id)
        .order('unlocked_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

/**
 * Hook para buscar todas as conquistas disponíveis
 */
export function useAllAchievements() {
  return useQuery({
    queryKey: ['achievements'],
    queryFn: async () => {
      const supabase = createClient()
      const { data, error } = await supabase
        .from('achievements')
        .select('*')
        .eq('ativo', true)
        .order('nivel_importancia', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

/**
 * Hook para buscar progresso do usuário
 */
export function useUserProgress() {
  return useQuery({
    queryKey: ['user-progress'],
    queryFn: async () => {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) throw new Error('Não autenticado')

      // Buscar vários dados em paralelo
      const [points, achievements, aulaProgress] = await Promise.all([
        supabase
          .from('profiles')
          .select('total_points, nivel, xp_atual')
          .eq('id', user.id)
          .single(),
        supabase
          .from('user_achievements')
          .select('id')
          .eq('user_id', user.id)
          .eq('is_unlocked', true),
        supabase
          .from('aula_progresso')
          .select('id')
          .eq('aluno_id', user.id)
          .eq('concluida', true),
      ])

      return {
        points: points.data,
        achievementsCount: achievements.data?.length || 0,
        lessonsCompleted: aulaProgress.data?.length || 0,
      }
    },
  })
}
