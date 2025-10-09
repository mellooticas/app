import { useQuery } from '@tanstack/react-query'
import { supabase } from '../../../lib/supabase/supabaseClient'
import { useAuth } from '../../auth/AuthContext'
import type { Database } from '../../../types/supabase'

// Type da VIEW (pré-calculado pelo banco)
type DashboardAluno = Database['public']['Views']['view_dashboard_aluno']['Row']

export function useDashboardAluno() {
  const { user } = useAuth()

  // Query: Dashboard do aluno (VIEW pré-calculada)
  const {
    data: dashboard,
    isLoading,
    error,
  } = useQuery({
    queryKey: ['view_dashboard_aluno', user?.id],
    queryFn: async () => {
      if (!user?.id) return null

      const { data, error } = await supabase
        .from('view_dashboard_aluno')
        .select('*')
        .eq('id', user.id)
        .single()

      if (error) throw error
      return data as DashboardAluno
    },
    enabled: !!user?.id,
    staleTime: 1000 * 60 * 5, // Cache por 5 minutos (VIEW é pré-calculada)
  })

  return {
    dashboard,
    isLoading,
    error,

    // Helpers para acessar dados
    stats: dashboard
      ? {
          totalPoints: dashboard.total_points || 0,
          currentStreak: dashboard.current_streak || 0,
          bestStreak: dashboard.best_streak || 0,
          lessonsCompleted: dashboard.lessons_completed || 0,
          modulesCompleted: dashboard.modules_completed || 0,
          totalAchievements: Number(dashboard.total_achievements) || 0,
          achievementsLastWeek: Number(dashboard.achievements_last_week) || 0,
          totalPortfolios: Number(dashboard.total_portfolios) || 0,
          totalSubmissoes: Number(dashboard.total_submissoes) || 0,
          submissoesAvaliadas: Number(dashboard.submissoes_avaliadas) || 0,
        }
      : null,
  }
}
