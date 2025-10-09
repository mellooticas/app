import { supabase } from '@/lib/supabase/supabaseClient'
import type { Profile, ProfileFilters } from '@/types'

export const profileService = {
  // Buscar perfil por ID
  async getById(id: string) {
    const { data, error } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', id)
      .single()

    return { data, error }
  },

  // Buscar todos os perfis com filtros
  async getAll(filters?: ProfileFilters) {
    let query = supabase.from('profiles').select('*', { count: 'exact' })

    if (filters?.tipo_usuario) {
      query = query.eq('tipo_usuario', filters.tipo_usuario)
    }

    if (filters?.instrument) {
      query = query.eq('instrument', filters.instrument)
    }

    if (filters?.city) {
      query = query.eq('city', filters.city)
    }

    if (filters?.state) {
      query = query.eq('state', filters.state)
    }

    if (filters?.search) {
      query = query.or(`nome.ilike.%${filters.search}%,full_name.ilike.%${filters.search}%,email.ilike.%${filters.search}%`)
    }

    const { data, error, count } = await query.order('joined_at', { ascending: false })

    return { data: data as Profile[], error, count }
  },

  // Atualizar perfil
  async update(id: string, updates: Partial<Profile>) {
    const { data, error } = await supabase
      .from('profiles')
      .update(updates as any)
      .eq('id', id)
      .select()
      .single()

    return { data, error }
  },

  // Buscar top usuários por pontos
  async getTopUsers(limit = 10) {
    const { data, error } = await supabase
      .from('profiles')
      .select('*')
      .order('total_points', { ascending: false })
      .limit(limit)

    return { data, error }
  },

  // Atualizar pontos do usuário
  async addPoints(userId: string, points: number, description: string) {
    // 1. Atualizar pontos no perfil
    const { data: profile } = await supabase
      .from('profiles')
      .select('total_points')
      .eq('id', userId)
      .single()

    if (!profile) return { error: { message: 'Perfil não encontrado' } }

    const newTotal = (profile.total_points || 0) + points

    const { error: updateError } = await supabase
      .from('profiles')
      .update({ total_points: newTotal })
      .eq('id', userId)

    if (updateError) return { error: updateError }

    // 2. Registrar no log de pontos
    const { error: logError } = await supabase
      .from('user_points_log')
      .insert({
        user_id: userId,
        pontos: points,
        tipo_transacao: points > 0 ? 'ganho' : 'gasto',
        descricao: description,
      })

    return { error: logError }
  },
}
