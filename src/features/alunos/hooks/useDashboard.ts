/**
 * 🎯 HOOK DASHBOARD DO ALUNO
 * 
 * Hook SIMPLES que busca dados da view_dashboard_aluno
 * View pré-calculada com TODAS as métricas do aluno
 */

import { useQuery } from '@tanstack/react-query'
import { supabase } from '../../../lib/supabase/supabaseClient'
import { useAuth } from '../../auth/AuthContext'

// Type EXATO da view conforme documentação
type DashboardAluno = {
  id: string
  full_name: string
  total_points: number
  current_streak: number
  best_streak: number
  lessons_completed: number
  modules_completed: number
  total_achievements: number
  achievements_last_week: number
  total_portfolios: number
  total_submissoes: number
  submissoes_avaliadas: number
}

export function useDashboard() {
  const { user } = useAuth()

  const { data, isLoading, error } = useQuery({
    queryKey: ['dashboard', user?.id],
    queryFn: async () => {
      if (!user?.id) throw new Error('Usuário não autenticado')

      const { data, error } = await supabase
        .from('view_dashboard_aluno')
        .select('*')
        .eq('id', user.id)
        .single()

      if (error) throw error
      return data as DashboardAluno
    },
    enabled: !!user?.id,
  })

  return {
    dashboard: data || null,
    isLoading,
    error: error ? String(error) : null,
  }
}
