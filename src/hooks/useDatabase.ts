import { useQuery } from '@tanstack/react-query'
import { achievementService, portfolioService, instrumentService, turmaService } from '@/services'
import { supabase } from '@/lib/supabase/supabaseClient'

// Hook para buscar perfil por ID
export function useProfile(userId: string | undefined) {
  return useQuery({
    queryKey: ['profile', userId],
    queryFn: async () => {
      if (!userId) return null
      const { data, error } = await supabase
        .from('profiles')
        .select('*')
        .eq('id', userId)
        .single()
      if (error) throw error
      return data
    },
    enabled: !!userId,
  })
}

// Hook para buscar top usuários
export function useTopUsers(limit = 10) {
  return useQuery({
    queryKey: ['topUsers', limit],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('profiles')
        .select('*')
        .order('total_points', { ascending: false })
        .limit(limit)
      if (error) throw error
      return data
    },
  })
}

// Hook para buscar achievements
export function useAchievements() {
  return useQuery({
    queryKey: ['achievements'],
    queryFn: () => achievementService.getAll(),
  })
}

// Hook para buscar achievements do usuário
export function useUserAchievements(userId: string | undefined) {
  return useQuery({
    queryKey: ['userAchievements', userId],
    queryFn: () => userId ? achievementService.getUserAchievements(userId) : null,
    enabled: !!userId,
  })
}

// Hook para buscar progresso de achievements
export function useAchievementProgress(userId: string | undefined) {
  return useQuery({
    queryKey: ['achievementProgress', userId],
    queryFn: () => userId ? achievementService.getUserProgress(userId) : null,
    enabled: !!userId,
  })
}

// Hook para buscar portfólios do usuário
export function useUserPortfolios(userId: string | undefined) {
  return useQuery({
    queryKey: ['userPortfolios', userId],
    queryFn: () => userId ? portfolioService.getUserPortfolios(userId) : null,
    enabled: !!userId,
  })
}

// Hook para buscar instrumentos
export function useInstruments() {
  return useQuery({
    queryKey: ['instruments'],
    queryFn: () => instrumentService.getAll(),
  })
}

// Hook para buscar instrumentos disponíveis
export function useAvailableInstruments() {
  return useQuery({
    queryKey: ['availableInstruments'],
    queryFn: () => instrumentService.getAvailable(),
  })
}

// Hook para buscar turmas
export function useTurmas() {
  return useQuery({
    queryKey: ['turmas'],
    queryFn: () => turmaService.getAll(),
  })
}

// Hook para buscar matrículas de uma turma
export function useTurmaMatriculas(turmaId: string | undefined) {
  return useQuery({
    queryKey: ['turmaMatriculas', turmaId],
    queryFn: () => turmaId ? turmaService.getMatriculas(turmaId) : null,
    enabled: !!turmaId,
  })
}
