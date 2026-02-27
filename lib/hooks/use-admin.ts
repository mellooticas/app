import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { toast } from 'sonner'
import {
  createUser,
  updateUserRole,
  toggleUserStatus,
  createInstrumento,
  createPeriodoHistoria,
  createAchievement,
} from '@/app/actions/admin-actions'
import type {
  CreateUserInput,
  UpdateUserRoleInput,
  ToggleUserStatusInput,
  CreateInstrumentoInput,
  CreatePeriodoHistoriaInput,
  CreateAchievementInput,
} from '@/lib/validations/admin-schemas'

// ========================================
// USUÁRIOS
// ========================================

export function useAllUsers() {
  return useQuery({
    queryKey: ['admin', 'users'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('profiles')
        .select('id, nome_completo, email, tipo_usuario, ativo, created_at')
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

export function useUsersByRole(role: 'admin' | 'professor' | 'aluno') {
  return useQuery({
    queryKey: ['admin', 'users', 'role', role],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('profiles')
        .select('id, nome_completo, email, ativo, created_at')
        .eq('tipo_usuario', role)
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

export function useCreateUser() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: CreateUserInput) => {
      const result = await createUser(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao criar usuário')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['admin', 'users'] })
      toast.success('Usuário criado com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao criar usuário')
    },
  })
}

export function useUpdateUserRole() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: UpdateUserRoleInput) => {
      const result = await updateUserRole(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao atualizar role')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['admin', 'users'] })
      toast.success('Role atualizada com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao atualizar role')
    },
  })
}

export function useToggleUserStatus() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: ToggleUserStatusInput) => {
      const result = await toggleUserStatus(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao atualizar status')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['admin', 'users'] })
      toast.success('Status atualizado com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao atualizar status')
    },
  })
}

// ========================================
// TURMAS (GESTÃO GLOBAL)
// ========================================

export function useAllTurmas() {
  return useQuery({
    queryKey: ['admin', 'turmas'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('turmas')
        .select(`
          *,
          professor:profiles!turmas_professor_id_fkey(
            nome_completo,
            email
          ),
          matriculas(count)
        `)
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

export function useTurmaById(turmaId: string) {
  return useQuery({
    queryKey: ['admin', 'turma', turmaId],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('turmas')
        .select(`
          *,
          professor:profiles!turmas_professor_id_fkey(
            nome_completo,
            email
          ),
          matriculas(
            id,
            status,
            created_at,
            aluno:profiles!matriculas_aluno_id_fkey(
              id,
              nome_completo,
              email
            )
          )
        `)
        .eq('id', turmaId)
        .single()

      if (error) throw error
      return data
    },
    enabled: !!turmaId,
  })
}

// ========================================
// PROFESSORES
// ========================================

export function useAllProfessores() {
  return useQuery({
    queryKey: ['admin', 'professores'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('profiles')
        .select(`
          id,
          nome_completo,
          email,
          ativo,
          created_at,
          turmas:turmas(count)
        `)
        .eq('tipo_usuario', 'professor')
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

export function useProfessorTurmas(professorId: string) {
  return useQuery({
    queryKey: ['admin', 'professor', professorId, 'turmas'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('turmas')
        .select(`
          *,
          matriculas(count)
        `)
        .eq('professor_id', professorId)
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
    enabled: !!professorId,
  })
}

// ========================================
// INSTRUMENTOS
// ========================================

export function useAllInstrumentos() {
  return useQuery({
    queryKey: ['admin', 'instrumentos'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('instrumentos')
        .select('*')
        .order('nome', { ascending: true })

      if (error) throw error
      return data
    },
  })
}

export function useCreateInstrumento() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: CreateInstrumentoInput) => {
      const result = await createInstrumento(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao criar instrumento')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['admin', 'instrumentos'] })
      toast.success('Instrumento criado com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao criar instrumento')
    },
  })
}

// ========================================
// HISTÓRIA DA MÚSICA
// ========================================

export function useCreatePeriodoHistoria() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: CreatePeriodoHistoriaInput) => {
      const result = await createPeriodoHistoria(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao criar período')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['periodos'] })
      toast.success('Período histórico criado com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao criar período')
    },
  })
}

// ========================================
// GAMIFICAÇÃO
// ========================================

export function useAllAchievementsAdmin() {
  return useQuery({
    queryKey: ['admin', 'achievements'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('achievements')
        .select('*')
        .order('xp_requerido', { ascending: true })

      if (error) throw error
      return data
    },
  })
}

export function useCreateAchievement() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: CreateAchievementInput) => {
      const result = await createAchievement(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao criar conquista')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['admin', 'achievements'] })
      queryClient.invalidateQueries({ queryKey: ['achievements'] })
      toast.success('Conquista criada com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao criar conquista')
    },
  })
}

// ========================================
// RELATÓRIOS E ANALYTICS
// ========================================

export function useRelatorioGeral() {
  return useQuery({
    queryKey: ['admin', 'relatorio', 'geral'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      // Contar usuários por tipo
      const { data: usuarios } = await supabase
        .from('profiles')
        .select('tipo_usuario')

      const totalAlunos = usuarios?.filter(u => u.tipo_usuario === 'aluno').length || 0
      const totalProfessores = usuarios?.filter(u => u.tipo_usuario === 'professor').length || 0
      const totalAdmins = usuarios?.filter(u => u.tipo_usuario === 'admin').length || 0

      // Contar turmas
      const { count: totalTurmas } = await supabase
        .from('turmas')
        .select('*', { count: 'exact', head: true })
        .eq('ativo', true)

      // Contar aulas
      const { count: totalAulas } = await supabase
        .from('aulas')
        .select('*', { count: 'exact', head: true })
        .is('deleted_at', null)

      return {
        totalAlunos,
        totalProfessores,
        totalAdmins,
        totalTurmas: totalTurmas || 0,
        totalAulas: totalAulas || 0,
        totalUsuarios: (usuarios?.length || 0),
      }
    },
  })
}

export function useRelatorioAlunos() {
  return useQuery({
    queryKey: ['admin', 'relatorio', 'alunos'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('profiles')
        .select(`
          id,
          nome_completo,
          email,
          created_at,
          user_points(pontos_totais),
          progresso_aulas(count)
        `)
        .eq('tipo_usuario', 'aluno')
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}
