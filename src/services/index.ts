import { supabase } from '@/lib/supabase/supabaseClient'

export const achievementService = {
  async getAll() {
    const { data, error } = await supabase
      .from('achievements')
      .select('*')
      .eq('visivel', true)
      .order('raridade', { ascending: false })

    return { data, error }
  },

  async getUserAchievements(userId: string) {
    const { data, error } = await supabase
      .from('user_achievements')
      .select('*, achievements(*)')
      .eq('user_id', userId)

    return { data, error }
  },

  async getUserProgress(userId: string) {
    const { data, error } = await supabase
      .from('achievements_progress')
      .select('*, achievements(*)')
      .eq('user_id', userId)

    return { data, error }
  },
}

export const portfolioService = {
  async getUserPortfolios(userId: string) {
    const { data, error } = await supabase
      .from('portfolios')
      .select('*, portfolio_evidencias(*)')
      .eq('user_id', userId)
      .order('created_at', { ascending: false })

    return { data, error }
  },

  async create(portfolio: any) {
    const { data, error } = await supabase
      .from('portfolios')
      .insert(portfolio as any)
      .select()
      .single()

    return { data, error }
  },
}

export const instrumentService = {
  async getAll() {
    const { data, error } = await supabase
      .from('instrumentos')
      .select('*')
      .eq('ativo', true)
      .order('nome')

    return { data, error }
  },

  async getAvailable() {
    const { data, error } = await supabase
      .from('instrumentos_fisicos')
      .select('*, instrumentos(*)')
      .eq('status', 'disponivel')

    return { data, error }
  },
}

export const turmaService = {
  async getAll() {
    const { data, error } = await supabase
      .from('turmas')
      .select('*')
      .eq('ativo', true)
      .order('created_at', { ascending: false })

    return { data, error }
  },

  async getMatriculas(turmaId: string) {
    const { data, error } = await supabase
      .from('matriculas')
      .select('*, profiles(*)')
      .eq('turma_id', turmaId)
      .eq('status', 'ativa')

    return { data, error }
  },
}
