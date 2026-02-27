'use server'

import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'
import { createActionLogger } from '@/lib/logger'
import { validateAction } from '@/lib/validations/validate-action'
import {
  createUserSchema,
  updateUserRoleSchema,
  createInstrumentoSchema,
  createAchievementSchema,
  toggleUserStatusSchema,
  createPeriodoHistoriaSchema,
} from '@/lib/validations/admin-schemas'
import {
  successResponse,
  errorResponse,
  validationError,
  unauthorizedError,
  databaseError,
  notFoundError,
} from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'

/**
 * Verifica se o usuário é admin
 */
async function checkAdminAccess(userId: string) {
  const supabase = await createClient()
  const { data: profile } = await supabase
    .from('profiles')
    .select('tipo_usuario')
    .eq('id', userId)
    .single()

  return profile?.tipo_usuario === 'admin'
}

// ========================================
// GESTÃO DE USUÁRIOS
// ========================================

export async function createUser(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('createUser')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(createUserSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      logger.endTimer(timer, false)
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { email: validation.data.email })

    // 2. Auth check - apenas admin
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }

    const isAdmin = await checkAdminAccess(user.id)
    if (!isAdmin) {
      logger.error('Acesso negado - não é admin')
      logger.endTimer(timer, false)
      return errorResponse('Apenas administradores podem criar usuários', 'FORBIDDEN')
    }
    
    logger.setContext({ userId: user.id, userType: 'admin' })

    // 3. Criar usuário via Supabase Auth (via função RPC ou API)
    // Nota: Isso requer uma função no Supabase ou uso da Admin API
    // Por ora, vamos criar apenas o profile
    const { data: newProfile, error } = await supabase
      .from('profiles')
      .insert({
        email: validation.data.email,
        nome_completo: validation.data.nome_completo,
        tipo_usuario: validation.data.tipo_usuario,
      })
      .select()
      .single()

    if (error) {
      logger.error('Erro ao criar usuário', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao criar usuário')
    }

    logger.info('Usuário criado com sucesso', { userId: newProfile.id })

    // 4. Revalidate
    revalidatePath('/admin/usuarios')

    logger.endTimer(timer, true)
    return successResponse(newProfile, 'Usuário criado com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function updateUserRole(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('updateUserRole')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(updateUserRoleSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      logger.endTimer(timer, false)
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { userId: validation.data.userId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }

    const isAdmin = await checkAdminAccess(user.id)
    if (!isAdmin) {
      logger.error('Acesso negado - não é admin')
      logger.endTimer(timer, false)
      return errorResponse('Apenas administradores podem alterar roles', 'FORBIDDEN')
    }
    
    logger.setContext({ userId: user.id })

    // 3. Atualizar role
    const { data, error } = await supabase
      .from('profiles')
      .update({ tipo_usuario: validation.data.novoTipo })
      .eq('id', validation.data.userId)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao atualizar role', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao atualizar role')
    }

    logger.info('Role atualizada com sucesso', { 
      userId: validation.data.userId,
      novoTipo: validation.data.novoTipo
    })

    // 4. Revalidate
    revalidatePath('/admin/usuarios')

    logger.endTimer(timer, true)
    return successResponse(data, 'Role atualizada com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function toggleUserStatus(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('toggleUserStatus')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(toggleUserStatusSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      logger.endTimer(timer, false)
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { userId: validation.data.userId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }

    const isAdmin = await checkAdminAccess(user.id)
    if (!isAdmin) {
      logger.error('Acesso negado - não é admin')
      logger.endTimer(timer, false)
      return errorResponse('Apenas administradores podem ativar/desativar usuários', 'FORBIDDEN')
    }
    
    logger.setContext({ userId: user.id })

    // 3. Atualizar status
    const { data, error } = await supabase
      .from('profiles')
      .update({ ativo: validation.data.ativo })
      .eq('id', validation.data.userId)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao atualizar status', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao atualizar status')
    }

    const statusText = validation.data.ativo ? 'ativado' : 'desativado'
    logger.info(`Usuário ${statusText}`, { userId: validation.data.userId })

    // 4. Revalidate
    revalidatePath('/admin/usuarios')

    logger.endTimer(timer, true)
    return successResponse(data, `Usuário ${statusText} com sucesso!`)

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

// ========================================
// GESTÃO DE CONTEÚDO
// ========================================

export async function createInstrumento(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('createInstrumento')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(createInstrumentoSchema, rawData)
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

    const isAdmin = await checkAdminAccess(user.id)
    if (!isAdmin) {
      logger.error('Acesso negado - não é admin')
      logger.endTimer(timer, false)
      return errorResponse('Apenas administradores podem criar instrumentos', 'FORBIDDEN')
    }
    
    logger.setContext({ userId: user.id })

    // 3. Criar instrumento
    const { data, error } = await supabase
      .from('instrumentos')
      .insert(validation.data)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao criar instrumento', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao criar instrumento')
    }

    logger.info('Instrumento criado com sucesso', { instrumentoId: data.id })

    // 4. Revalidate
    revalidatePath('/admin/instrumentos')

    logger.endTimer(timer, true)
    return successResponse(data, 'Instrumento criado com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function createPeriodoHistoria(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('createPeriodoHistoria')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(createPeriodoHistoriaSchema, rawData)
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

    const isAdmin = await checkAdminAccess(user.id)
    if (!isAdmin) {
      logger.error('Acesso negado - não é admin')
      logger.endTimer(timer, false)
      return errorResponse('Apenas administradores podem criar períodos', 'FORBIDDEN')
    }
    
    logger.setContext({ userId: user.id })

    // 3. Criar período
    const { data, error } = await supabase
      .from('centro_estudos_periodos')
      .insert(validation.data)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao criar período', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao criar período histórico')
    }

    logger.info('Período criado com sucesso', { periodoId: data.id })

    // 4. Revalidate
    revalidatePath('/admin/historia')
    revalidatePath('/alunos/historia')

    logger.endTimer(timer, true)
    return successResponse(data, 'Período histórico criado com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

// ========================================
// GAMIFICAÇÃO
// ========================================

export async function createAchievement(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('createAchievement')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(createAchievementSchema, rawData)
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

    const isAdmin = await checkAdminAccess(user.id)
    if (!isAdmin) {
      logger.error('Acesso negado - não é admin')
      logger.endTimer(timer, false)
      return errorResponse('Apenas administradores podem criar conquistas', 'FORBIDDEN')
    }
    
    logger.setContext({ userId: user.id })

    // 3. Criar conquista
    const { data, error } = await supabase
      .from('achievements')
      .insert(validation.data)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao criar conquista', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao criar conquista')
    }

    logger.info('Conquista criada com sucesso', { achievementId: data.id })

    // 4. Revalidate
    revalidatePath('/admin/gamificacao')
    revalidatePath('/alunos/gamificacao')

    logger.endTimer(timer, true)
    return successResponse(data, 'Conquista criada com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}
