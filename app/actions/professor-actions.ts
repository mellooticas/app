'use server'

import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'
import { createActionLogger } from '@/lib/logger'
import { validateAction } from '@/lib/validations/validate-action'
import {
  createAulaSchema,
  updateAulaSchema,
  avaliarPortfolioSchema,
  avaliarDesafioSchema,
  createTurmaSchema,
  matricularAlunoSchema,
} from '@/lib/validations/professor-schemas'
import {
  successResponse,
  errorResponse,
  validationError,
  unauthorizedError,
  databaseError,
  notFoundError,
} from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'

// ========================================
// GESTÃO DE AULAS
// ========================================

export async function createAula(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('createAula')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(createAulaSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { errors: validation.error })
      logger.endTimer(timer, false)
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { titulo: validation.data.titulo })

    // 2. Auth check (apenas professor ou admin)
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }

    // 3. Verificar se é professor ou admin
    const { data: profile } = await supabase
      .from('profiles')
      .select('tipo_usuario')
      .eq('id', user.id)
      .single()

    if (!profile || !['professor', 'admin'].includes(profile.tipo_usuario as string)) {
      logger.error('Usuário não autorizado', { tipo: profile?.tipo_usuario })
      logger.endTimer(timer, false)
      return errorResponse('Apenas professores podem criar aulas', 'FORBIDDEN')
    }
    
    logger.setContext({ userId: user.id })

    // 4. Criar aula
    const { data, error } = await supabase
      .from('aulas')
      .insert({
        ...validation.data,
        responsavel_id: user.id,
        status: 'rascunho',
      })
      .select()
      .single()

    if (error) {
      logger.error('Erro ao criar aula no banco', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao criar aula')
    }

    logger.info('Aula criada com sucesso', { aulaId: data.id })

    // 5. Revalidate
    revalidatePath('/professores/aulas')
    revalidatePath('/admin/aulas')

    logger.endTimer(timer, true)
    return successResponse(data, 'Aula criada com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function updateAula(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('updateAula')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(updateAulaSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { errors: validation.error })
      logger.endTimer(timer, false)
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { aulaId: validation.data.aulaId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar ownership ou admin
    const { data: aula } = await supabase
      .from('aulas')
      .select('id, responsavel_id')
      .eq('id', validation.data.aulaId)
      .single()

    if (!aula) {
      logger.error('Aula não encontrada', { aulaId: validation.data.aulaId })
      logger.endTimer(timer, false)
      return notFoundError('Aula')
    }

    const { data: profile } = await supabase
      .from('profiles')
      .select('tipo_usuario')
      .eq('id', user.id)
      .single()

    const isOwner = aula.responsavel_id === user.id
    const isAdmin = profile?.tipo_usuario === 'admin'

    if (!isOwner && !isAdmin) {
      logger.error('Usuário não autorizado', { isOwner, isAdmin })
      logger.endTimer(timer, false)
      return errorResponse('Você não pode editar esta aula', 'FORBIDDEN')
    }

    // 4. Atualizar
    const { aulaId, ...updateData } = validation.data
    const { data, error } = await supabase
      .from('aulas')
      .update(updateData)
      .eq('id', aulaId)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao atualizar aula', { error: error.message, aulaId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao atualizar aula')
    }

    logger.info('Aula atualizada com sucesso', { aulaId })

    // 5. Revalidate
    revalidatePath('/professores/aulas')
    revalidatePath('/admin/aulas')
    revalidatePath('/alunos/aulas')
    revalidatePath(`/alunos/aulas/${aulaId}`)

    logger.endTimer(timer, true)
    return successResponse(data, 'Aula atualizada com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function deleteAula(aulaId: string): Promise<ActionResult> {
  const logger = createActionLogger('deleteAula')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação básica
    if (!aulaId || aulaId.length === 0) {
      logger.warn('Validação falhou: ID ausente')
      logger.endTimer(timer, false)
      return validationError('ID da aula é obrigatório')
    }
    logger.info('Validação concluída', { aulaId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar ownership ou admin
    const { data: aula } = await supabase
      .from('aulas')
      .select('id, responsavel_id')
      .eq('id', aulaId)
      .single()

    if (!aula) {
      logger.error('Aula não encontrada', { aulaId })
      logger.endTimer(timer, false)
      return notFoundError('Aula')
    }

    const { data: profile } = await supabase
      .from('profiles')
      .select('tipo_usuario')
      .eq('id', user.id)
      .single()

    const isOwner = (aula as any).responsavel_id === user.id
    const isAdmin = profile?.tipo_usuario === 'admin'

    if (!isOwner && !isAdmin) {
      logger.error('Usuário não autorizado')
      logger.endTimer(timer, false)
      return errorResponse('Você não pode deletar esta aula', 'FORBIDDEN')
    }

    // 4. Soft delete
    const { error } = await supabase
      .from('aulas')
      .update({ 
        deleted_at: new Date().toISOString(),
        status: 'arquivada'
      })
      .eq('id', aulaId)

    if (error) {
      logger.error('Erro ao deletar aula', { error: error.message, aulaId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao deletar aula')
    }

    logger.info('Aula deletada com sucesso', { aulaId })

    // 5. Revalidate
    revalidatePath('/professores/aulas')
    revalidatePath('/admin/aulas')
    revalidatePath('/alunos/aulas')

    logger.endTimer(timer, true)
    return successResponse({ id: aulaId }, 'Aula deletada com sucesso')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

// ========================================
// AVALIAÇÕES
// ========================================

export async function avaliarPortfolio(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('avaliarPortfolio')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(avaliarPortfolioSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { errors: validation.error })
      logger.endTimer(timer, false)
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { portfolioId: validation.data.portfolioId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }

    // 3. Verificar se é professor ou admin
    const { data: profile } = await supabase
      .from('profiles')
      .select('tipo_usuario')
      .eq('id', user.id)
      .single()

    if (!profile || !['professor', 'admin'].includes(profile.tipo_usuario)) {
      logger.error('Usuário não autorizado', { tipo: profile?.tipo_usuario })
      logger.endTimer(timer, false)
      return errorResponse('Apenas professores podem avaliar', 'FORBIDDEN')
    }
    
    logger.setContext({ userId: user.id, userType: profile.tipo_usuario })

    // 4. Atualizar portfólio com avaliação
    const { data, error } = await supabase
      .from('portfolios')
      .update({
        nota: validation.data.nota,
        feedback: validation.data.feedback,
        status: validation.data.status,
        avaliado_por: user.id,
        avaliado_em: new Date().toISOString(),
      })
      .eq('id', validation.data.portfolioId)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao avaliar portfólio', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao avaliar portfólio')
    }

    logger.info('Portfólio avaliado com sucesso', { 
      portfolioId: validation.data.portfolioId, 
      nota: validation.data.nota 
    })

    // 5. Revalidate
    revalidatePath('/professores/correcoes')
    revalidatePath('/alunos/portfolio')

    logger.endTimer(timer, true)
    return successResponse(data, 'Portfólio avaliado com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function avaliarDesafio(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('avaliarDesafio')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(avaliarDesafioSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      logger.endTimer(timer, false)
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { submissaoId: validation.data.submissaoId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }

    // 3. Verificar se é professor ou admin
    const { data: profile } = await supabase
      .from('profiles')
      .select('tipo_usuario')
      .eq('id', user.id)
      .single()

    if (!profile || !['professor', 'admin'].includes(profile.tipo_usuario)) {
      logger.error('Usuário não autorizado', { tipo: profile?.tipo_usuario })
      logger.endTimer(timer, false)
      return errorResponse('Apenas professores podem avaliar', 'FORBIDDEN')
    }
    
    logger.setContext({ userId: user.id, userType: profile.tipo_usuario })

    // 4. Atualizar submissão com avaliação
    const status = validation.data.aprovado ? 'aprovado' : 'reprovado'
    
    const { data, error } = await supabase
      .from('alpha_submissoes')
      .update({
        nota: validation.data.nota,
        feedback: validation.data.feedback,
        status,
        avaliado_por: user.id,
        avaliado_em: new Date().toISOString(),
      })
      .eq('id', validation.data.submissaoId)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao avaliar desafio', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao avaliar desafio')
    }

    logger.info('Desafio avaliado com sucesso', { 
      submissaoId: validation.data.submissaoId, 
      nota: validation.data.nota,
      aprovado: validation.data.aprovado
    })

    // 5. Revalidate
    revalidatePath('/professores/correcoes')
    revalidatePath('/alunos/desafios')

    logger.endTimer(timer, true)
    return successResponse(data, `Desafio ${status}!`)

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

// ========================================
// GESTÃO DE TURMAS
// ========================================

export async function createTurma(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('createTurma')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(createTurmaSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      logger.endTimer(timer, false)
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { nome: validation.data.nome })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }

    // 3. Verificar se é professor ou admin
    const { data: profile } = await supabase
      .from('profiles')
      .select('tipo_usuario')
      .eq('id', user.id)
      .single()

    if (!profile || !['professor', 'admin'].includes(profile.tipo_usuario)) {
      logger.error('Usuário não autorizado', { tipo: profile?.tipo_usuario })
      logger.endTimer(timer, false)
      return errorResponse('Apenas professores podem criar turmas', 'FORBIDDEN')
    }
    
    logger.setContext({ userId: user.id, userType: profile.tipo_usuario })

    // 4. Criar turma
    const { data, error } = await supabase
      .from('turmas')
      .insert({
        ...validation.data,
        professor_id: user.id,
        ativo: true,
      })
      .select()
      .single()

    if (error) {
      logger.error('Erro ao criar turma', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao criar turma')
    }

    logger.info('Turma criada com sucesso', { turmaId: data.id })

    // 5. Revalidate
    revalidatePath('/professores/turmas')
    revalidatePath('/admin/turmas')

    logger.endTimer(timer, true)
    return successResponse(data, 'Turma criada com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function matricularAluno(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('matricularAluno')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(matricularAlunoSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      logger.endTimer(timer, false)
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { 
      turmaId: validation.data.turmaId,
      alunoId: validation.data.alunoId 
    })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar capacidade da turma
    const { data: turma } = await supabase
      .from('turmas')
      .select('id, capacidade_maxima')
      .eq('id', validation.data.turmaId)
      .single()

    if (!turma) {
      logger.error('Turma não encontrada', { turmaId: validation.data.turmaId })
      logger.endTimer(timer, false)
      return notFoundError('Turma')
    }

    const { count } = await supabase
      .from('matriculas')
      .select('*', { count: 'exact', head: true })
      .eq('turma_id', validation.data.turmaId)
      .eq('status', 'ativo')

    if (count && count >= turma.capacidade_maxima) {
      logger.warn('Turma cheia', { count, capacidade: turma.capacidade_maxima })
      logger.endTimer(timer, false)
      return errorResponse('Turma está cheia', 'TURMA_CHEIA')
    }

    // 4. Matricular
    const { data, error } = await supabase
      .from('matriculas')
      .insert({
        turma_id: validation.data.turmaId,
        aluno_id: validation.data.alunoId,
        status: 'ativo',
      })
      .select()
      .single()

    if (error) {
      if (error.code === '23505') { // Unique violation
        logger.warn('Aluno já matriculado', { turmaId: validation.data.turmaId })
        logger.endTimer(timer, false)
        return errorResponse('Aluno já está matriculado nesta turma', 'JA_MATRICULADO')
      }
      logger.error('Erro ao matricular aluno', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao matricular aluno')
    }

    logger.info('Aluno matriculado com sucesso', { 
      matriculaId: data.id,
      turmaId: validation.data.turmaId,
      alunoId: validation.data.alunoId
    })

    // 5. Revalidate
    revalidatePath('/professores/turmas')
    revalidatePath('/admin/turmas')

    logger.endTimer(timer, true)
    return successResponse(data, 'Aluno matriculado com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}
