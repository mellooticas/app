import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { toast } from 'sonner'
import {
  createAula,
  updateAula,
  deleteAula,
  avaliarPortfolio,
  avaliarDesafio,
  createTurma,
  matricularAluno,
} from '@/app/actions/professor-actions'
import type {
  CreateAulaInput,
  UpdateAulaInput,
  AvaliarPortfolioInput,
  AvaliarDesafioInput,
  CreateTurmaInput,
  MatricularAlunoInput,
} from '@/lib/validations/professor-schemas'

// ========================================
// AULAS
// ========================================

export function useMinhasAulas() {
  return useQuery({
    queryKey: ['professor', 'aulas'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      
      if (!user) throw new Error('Não autenticado')

      const { data, error } = await supabase
        .from('aulas')
        .select('*')
        .eq('responsavel_id', user.id)
        .is('deleted_at', null)
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

export function useCreateAula() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: CreateAulaInput) => {
      const result = await createAula(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao criar aula')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['professor', 'aulas'] })
      toast.success('Aula criada com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao criar aula')
    },
  })
}

export function useUpdateAula() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: UpdateAulaInput) => {
      const result = await updateAula(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao atualizar aula')
      }
      return result.data
    },
    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({ queryKey: ['professor', 'aulas'] })
      queryClient.invalidateQueries({ queryKey: ['aula', variables.aulaId] })
      toast.success('Aula atualizada com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao atualizar aula')
    },
  })
}

export function useDeleteAula() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (aulaId: string) => {
      const result = await deleteAula(aulaId)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao deletar aula')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['professor', 'aulas'] })
      toast.success('Aula deletada com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao deletar aula')
    },
  })
}

// ========================================
// TURMAS
// ========================================

export function useMinhasTurmas() {
  return useQuery({
    queryKey: ['professor', 'turmas'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      
      if (!user) throw new Error('Não autenticado')

      const { data, error } = await supabase
        .from('turmas')
        .select(`
          *,
          matriculas(count)
        `)
        .eq('professor_id', user.id)
        .eq('ativo', true)
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
  })
}

export function useCreateTurma() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: CreateTurmaInput) => {
      const result = await createTurma(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao criar turma')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['professor', 'turmas'] })
      toast.success('Turma criada com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao criar turma')
    },
  })
}

export function useMatricularAluno() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: MatricularAlunoInput) => {
      const result = await matricularAluno(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao matricular aluno')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['professor', 'turmas'] })
      toast.success('Aluno matriculado com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao matricular aluno')
    },
  })
}

export function useAlunosTurma(turmaId: string) {
  return useQuery({
    queryKey: ['turma', turmaId, 'alunos'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('matriculas')
        .select(`
          id,
          status,
          created_at,
          aluno:profiles!matriculas_aluno_id_fkey(
            id,
            nome_completo,
            email,
            avatar_url
          )
        `)
        .eq('turma_id', turmaId)
        .eq('status', 'ativo')
        .order('created_at', { ascending: false })

      if (error) throw error
      return data
    },
    enabled: !!turmaId,
  })
}

// ========================================
// AVALIAÇÕES
// ========================================

export function usePortfoliosPendentes() {
  return useQuery({
    queryKey: ['professor', 'portfolios', 'pendentes'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('portfolios')
        .select(`
          *,
          aluno:user_id(
            nome_completo,
            email
          )
        `)
        .eq('status', 'submetido')
        .order('created_at', { ascending: true })

      if (error) throw error
      return data
    },
  })
}

export function useDesafiosPendentes() {
  return useQuery({
    queryKey: ['professor', 'desafios', 'pendentes'],
    queryFn: async () => {
      const { createClient } = await import('@/lib/supabase/client')
      const supabase = createClient()

      const { data, error } = await supabase
        .from('alpha_submissoes')
        .select(`
          *,
          aluno:user_id(
            nome_completo,
            email
          ),
          desafio:alpha_desafios(
            titulo,
            tipo
          )
        `)
        .eq('status', 'submetido')
        .order('created_at', { ascending: true })

      if (error) throw error
      return data
    },
  })
}

export function useAvaliarPortfolio() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: AvaliarPortfolioInput) => {
      const result = await avaliarPortfolio(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao avaliar portfólio')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['professor', 'portfolios', 'pendentes'] })
      toast.success('Portfólio avaliado com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao avaliar portfólio')
    },
  })
}

export function useAvaliarDesafio() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: AvaliarDesafioInput) => {
      const result = await avaliarDesafio(data)
      if (!result.success) {
        throw new Error(result.error || 'Erro ao avaliar desafio')
      }
      return result.data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['professor', 'desafios', 'pendentes'] })
      toast.success('Desafio avaliado com sucesso!')
    },
    onError: (error: Error) => {
      toast.error(error.message || 'Erro ao avaliar desafio')
    },
  })
}
