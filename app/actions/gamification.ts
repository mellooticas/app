'use server'

import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'
import { createActionLogger } from '@/lib/logger'
import { validateAction } from '@/lib/validations/validate-action'
import {
  addPointsSchema,
  grantAchievementSchema,
  aulaConcluidaPointsSchema,
  evidenciaEnviadaPointsSchema,
  portfolioCompletoPointsSchema,
} from '@/lib/validations/gamification-schemas'
import {
  successResponse,
  errorResponse,
  validationError,
  unauthorizedError,
  databaseError,
} from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'

/**
 * Action para adicionar pontos a um usuário
 */
export async function addPointsAction(params: {
  userId: string
  points: number
  category: string
  description: string
}): Promise<ActionResult> {
  const logger = createActionLogger('addPointsAction')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(addPointsSchema, params)
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { userId: params.userId, points: params.points })

    // 2. Auth check (admin ou professor pode adicionar pontos para outros)
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar se usuário alvo existe
    const { data: targetUser, error: userError } = await supabase
      .from('profiles')
      .select('id, tipo_usuario')
      .eq('id', validation.data.userId)
      .single()

    if (userError || !targetUser) {
      return errorResponse('Usuário não encontrado', 'NOT_FOUND')
    }

    // 4. Adicionar pontos no log
    const { data: logEntry, error: logError } = await supabase
      .from('user_points_log')
      .insert({
        user_id: validation.data.userId,
        points: validation.data.points,
        category: validation.data.category,
        description: validation.data.description,
        awarded_by: user.id,
      })
      .select()
      .single()

    if (logError) {
      logger.error('Erro ao adicionar pontos no log', { error: logError.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao registrar pontos')
    }

    logger.info('Pontos registrados no log', { logEntryId: logEntry.id })

    // 5. Atualizar total de pontos no perfil
    const { error: updateError } = await supabase.rpc('increment_user_points', {
      user_id: validation.data.userId,
      points_to_add: validation.data.points,
    })

    if (updateError) {
      logger.error('Erro ao atualizar total de pontos, fazendo rollback', { error: updateError.message })
      // Tentar rollback do log
      await supabase
        .from('user_points_log')
        .delete()
        .eq('id', logEntry.id)
      
      logger.endTimer(timer, false)
      return databaseError('Erro ao atualizar pontos do usuário')
    }

    logger.info('Total de pontos atualizado com sucesso', { userId: validation.data.userId, points: validation.data.points })

    // 6. Revalidate
    revalidatePath('/alunos/gamificacao')
    revalidatePath('/alunos/progresso')

    logger.endTimer(timer, true)
    return successResponse(
      logEntry,
      `${validation.data.points} pontos adicionados com sucesso!`
    )

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

/**
 * Action para conceder achievement a um usuário
 */
export async function grantAchievementAction(params: {
  userId: string
  achievementId: string
}): Promise<ActionResult> {
  const logger = createActionLogger('grantAchievementAction')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(grantAchievementSchema, params)
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { userId: params.userId, achievementId: params.achievementId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar se achievement existe
    const { data: achievement, error: achievementError } = await supabase
      .from('achievements')
      .select('*')
      .eq('id', validation.data.achievementId)
      .single()

    if (achievementError || !achievement) {
      return errorResponse('Conquista não encontrada', 'NOT_FOUND')
    }

    // 4. Verificar se usuário já tem essa achievement
    const { data: existing } = await supabase
      .from('user_achievements')
      .select('id')
      .eq('user_id', validation.data.userId)
      .eq('achievement_id', validation.data.achievementId)
      .maybeSingle()

    if (existing) {
      return errorResponse('Usuário já possui esta conquista', 'DUPLICATE_ENTRY')
    }

    // 5. Conceder achievement
    const { data, error } = await supabase
      .from('user_achievements')
      .insert({
        user_id: validation.data.userId,
        achievement_id: validation.data.achievementId,
        is_unlocked: true,
        unlocked_at: new Date().toISOString(),
      })
      .select()
      .single()

    if (error) {
      logger.error('Erro ao conceder achievement no banco', { error: error.message, achievementId: validation.data.achievementId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao conceder conquista')
    }

    logger.info('Achievement concedido com sucesso', { achievementId: validation.data.achievementId, userId: validation.data.userId })

    // 6. Adicionar pontos da achievement (se houver)
    if (achievement.points && achievement.points > 0) {
      logger.info('Adicionando pontos da achievement', { points: achievement.points })
      await addPointsAction({
        userId: validation.data.userId,
        points: achievement.points,
        category: 'conquista',
        description: `Conquista desbloqueada: ${achievement.nome}`,
      })
    }

    // 7. Revalidate
    revalidatePath('/alunos/conquistas')
    revalidatePath('/alunos/gamificacao')

    logger.endTimer(timer, true)
    return successResponse(
      data,
      `Conquista "${achievement.nome}" desbloqueada!`
    )

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

/**
 * Action para dar pontos quando aluno conclui uma aula
 */
export async function awardPointsForCompletedLessonAction(aulaId: string): Promise<ActionResult> {
  const logger = createActionLogger('awardPointsForCompletedLessonAction')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(aulaConcluidaPointsSchema, { aulaId })
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { aulaId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar se aula existe e pegar informações
    const { data: aula, error: aulaError } = await supabase
      .from('aulas')
      .select('id, titulo, xp_ganho')
      .eq('id', validation.data.aulaId)
      .single()

    if (aulaError || !aula) {
      return errorResponse('Aula não encontrada', 'NOT_FOUND')
    }

    // 4. Verificar se já ganhou pontos por essa aula
    const { data: existing } = await supabase
      .from('user_points_log')
      .select('id')
      .eq('user_id', user.id)
      .eq('category', 'aula_concluida')
      .eq('reference_id', validation.data.aulaId)
      .maybeSingle()

    if (existing) {
      return successResponse(
        { alreadyAwarded: true },
        'Pontos já foram concedidos para esta aula'
      )
    }

    // 5. Calcular pontos (usar xp_ganho da aula ou padrão de 50)
    const points = aula.xp_ganho || 50

    logger.info('Calculando pontos para aula', { points, aulaId })

    // 6. Adicionar pontos
    const result = await addPointsAction({
      userId: user.id,
      points,
      category: 'aula_concluida',
      description: `Aula concluída: ${aula.titulo}`,
    })

    if (!result.success) {
      logger.error('Falha ao adicionar pontos', { error: result.error })
      return result
    }

    // 7. Atualizar reference_id no log
    if (result.data && result.data.id) {
      await supabase
        .from('user_points_log')
        .update({ reference_id: validation.data.aulaId })
        .eq('id', result.data.id)
    }

    logger.info('Pontos concedidos por aula concluída', { points, aulaId })

    // 8. Revalidate
    revalidatePath('/alunos/aulas')
    revalidatePath('/alunos/gamificacao')

    logger.endTimer(timer, true)
    return successResponse(
      { ...result.data, points },
      `Parabéns! Você ganhou ${points} XP!`
    )

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

/**
 * Action para dar pontos quando aluno submete evidência
 */
export async function awardPointsForSubmittedEvidenceAction(evidenciaId: string): Promise<ActionResult> {
  const logger = createActionLogger('awardPointsForSubmittedEvidenceAction')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(evidenciaEnviadaPointsSchema, { evidenciaId })
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { evidenciaId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar se evidência existe e pertence ao usuário
    const { data: evidencia, error: evidenciaError } = await supabase
      .from('portfolio_evidencias')
      .select('id, aluno_id, titulo')
      .eq('id', validation.data.evidenciaId)
      .single()

    if (evidenciaError || !evidencia) {
      return errorResponse('Evidência não encontrada', 'NOT_FOUND')
    }

    if (evidencia.aluno_id !== user.id) {
      return errorResponse('Esta evidência não pertence a você', 'FORBIDDEN')
    }

    // 4. Verificar se já ganhou pontos
    const { data: existing } = await supabase
      .from('user_points_log')
      .select('id')
      .eq('user_id', user.id)
      .eq('category', 'evidencia_enviada')
      .eq('reference_id', validation.data.evidenciaId)
      .maybeSingle()

    if (existing) {
      return successResponse(
        { alreadyAwarded: true },
        'Pontos já foram concedidos para esta evidência'
      )
    }

    // 5. Adicionar pontos (padrão: 30 pontos)
    const points = 30
    logger.info('Adicionando pontos por evidência enviada', { points, evidenciaId })
    
    const result = await addPointsAction({
      userId: user.id,
      points,
      category: 'evidencia_enviada',
      description: `Evidência enviada: ${evidencia.titulo}`,
    })

    if (!result.success) {
      logger.error('Falha ao adicionar pontos', { error: result.error })
      return result
    }

    // 6. Atualizar reference_id
    if (result.data && result.data.id) {
      await supabase
        .from('user_points_log')
        .update({ reference_id: validation.data.evidenciaId })
        .eq('id', result.data.id)
    }

    logger.info('Pontos concedidos por evidência enviada', { points, evidenciaId })

    // 7. Revalidate
    revalidatePath('/alunos/portfolio')
    revalidatePath('/alunos/gamificacao')

    logger.endTimer(timer, true)
    return successResponse(
      { ...result.data, points },
      `Você ganhou ${points} XP por enviar evidência!`
    )

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

/**
 * Action para dar pontos quando aluno completa autoavaliação
 */
export async function awardPointsForCompletedSelfAssessmentAction(): Promise<ActionResult> {
  const logger = createActionLogger('awardPointsForCompletedSelfAssessmentAction')
  const timer = logger.startTimer()
  
  try {
    // 1. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 2. Adicionar pontos (padrão: 20 pontos)
    const points = 20
    logger.info('Adicionando pontos por autoavaliação', { points })
    
    const result = await addPointsAction({
      userId: user.id,
      points,
      category: 'autoavaliacao',
      description: 'Autoavaliação completada',
    })

    if (!result.success) {
      logger.error('Falha ao adicionar pontos', { error: result.error })
      return result
    }

    logger.info('Pontos concedidos por autoavaliação', { points })

    // 3. Revalidate
    revalidatePath('/alunos/portfolio')
    revalidatePath('/alunos/gamificacao')

    logger.endTimer(timer, true)
    return successResponse(
      { ...result.data, points },
      `Você ganhou ${points} XP por completar a autoavaliação!`
    )

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

/**
 * Action para dar pontos quando aluno completa portfólio
 */
export async function awardPointsForCompletedPortfolioAction(portfolioId: string): Promise<ActionResult> {
  const logger = createActionLogger('awardPointsForCompletedPortfolioAction')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(portfolioCompletoPointsSchema, { portfolioId })
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { portfolioId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar se portfólio existe e pertence ao usuário
    const { data: portfolio, error: portfolioError } = await supabase
      .from('portfolios')
      .select('id, aluno_id, titulo')
      .eq('id', validation.data.portfolioId)
      .single()

    if (portfolioError || !portfolio) {
      return errorResponse('Portfólio não encontrado', 'NOT_FOUND')
    }

    if (portfolio.aluno_id !== user.id) {
      return errorResponse('Este portfólio não pertence a você', 'FORBIDDEN')
    }

    // 4. Verificar se já ganhou pontos
    const { data: existing } = await supabase
      .from('user_points_log')
      .select('id')
      .eq('user_id', user.id)
      .eq('category', 'portfolio_completo')
      .eq('reference_id', validation.data.portfolioId)
      .maybeSingle()

    if (existing) {
      return successResponse(
        { alreadyAwarded: true },
        'Pontos já foram concedidos para este portfólio'
      )
    }

    // 5. Adicionar pontos (padrão: 100 pontos)
    const points = 100
    logger.info('Adicionando pontos por portfólio completo', { points, portfolioId })
    
    const result = await addPointsAction({
      userId: user.id,
      points,
      category: 'portfolio_completo',
      description: `Portfólio completo: ${portfolio.titulo}`,
    })

    if (!result.success) {
      logger.error('Falha ao adicionar pontos', { error: result.error })
      return result
    }

    // 6. Atualizar reference_id
    if (result.data && result.data.id) {
      await supabase
        .from('user_points_log')
        .update({ reference_id: validation.data.portfolioId })
        .eq('id', result.data.id)
    }

    logger.info('Pontos concedidos por portfólio completo', { points, portfolioId })

    // 7. Revalidate
    revalidatePath('/alunos/portfolio')
    revalidatePath('/alunos/gamificacao')

    logger.endTimer(timer, true)
    return successResponse(
      { ...result.data, points },
      `Parabéns! Você ganhou ${points} XP por completar o portfólio!`
    )

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}
