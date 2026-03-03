'use server'

import { revalidatePath } from 'next/cache'
import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'
import {
  createLearningPathSchema,
  updateLearningPathSchema,
  addPathStepSchema,
  startPathSchema,
  completeStepSchema,
} from '@/lib/validations/unified-schemas'
import { successResponse, unauthorizedError, databaseError, validationError, notFoundError } from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'

// ============================================
// Admin/Teacher: manage paths
// ============================================

export async function createLearningPath(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(createLearningPathSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data, error } = await (ctx.supabase as any)
      .from('learning_paths')
      .insert({
        tenant_id: ctx.tenantId,
        title: validation.data.title,
        description: validation.data.description,
        cycle: validation.data.cycle,
        methodology_id: validation.data.methodology_id,
        instrument_id: validation.data.instrument_id,
        difficulty_min: validation.data.difficulty_min,
        difficulty_max: validation.data.difficulty_max,
      })
      .select('id')
      .single()

    if (error) return databaseError(error.message)

    revalidatePath('/paths')
    return successResponse(data, 'Trilha criada com sucesso')
  } catch (e) {
    return databaseError('Erro ao criar trilha')
  }
}

export async function updateLearningPath(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(updateLearningPathSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { path_id, ...updates } = validation.data
    const cleanUpdates = Object.fromEntries(
      Object.entries(updates).filter(([, v]) => v !== undefined)
    )

    if (Object.keys(cleanUpdates).length === 0) {
      return validationError('Nenhum campo para atualizar')
    }

    const { error } = await (ctx.supabase as any)
      .from('learning_paths')
      .update({ ...cleanUpdates, updated_at: new Date().toISOString() })
      .eq('id', path_id)

    if (error) return databaseError(error.message)

    revalidatePath('/paths')
    revalidatePath(`/paths/${path_id}`)
    return successResponse(null, 'Trilha atualizada')
  } catch (e) {
    return databaseError('Erro ao atualizar trilha')
  }
}

export async function addPathStep(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(addPathStepSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data, error } = await (ctx.supabase as any)
      .from('learning_path_steps')
      .insert({
        path_id: validation.data.path_id,
        step_order: validation.data.step_order,
        step_type: validation.data.step_type,
        reference_id: validation.data.reference_id,
        title: validation.data.title,
        description: validation.data.description,
        is_optional: validation.data.is_optional,
        unlock_after: validation.data.unlock_after,
        points_reward: validation.data.points_reward,
      })
      .select('id')
      .single()

    if (error) return databaseError(error.message)

    // Update total_steps count
    const { count } = await (ctx.supabase as any)
      .from('learning_path_steps')
      .select('*', { count: 'exact', head: true })
      .eq('path_id', validation.data.path_id)

    if (count !== null) {
      await (ctx.supabase as any)
        .from('learning_paths')
        .update({ total_steps: count, updated_at: new Date().toISOString() })
        .eq('id', validation.data.path_id)
    }

    revalidatePath(`/paths/${validation.data.path_id}`)
    return successResponse(data, 'Step adicionado')
  } catch (e) {
    return databaseError('Erro ao adicionar step')
  }
}

export async function deletePathStep(stepId: string, pathId: string): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { error } = await (ctx.supabase as any)
      .from('learning_path_steps')
      .delete()
      .eq('id', stepId)

    if (error) return databaseError(error.message)

    // Update total_steps count
    const { count } = await (ctx.supabase as any)
      .from('learning_path_steps')
      .select('*', { count: 'exact', head: true })
      .eq('path_id', pathId)

    if (count !== null) {
      await (ctx.supabase as any)
        .from('learning_paths')
        .update({ total_steps: count, updated_at: new Date().toISOString() })
        .eq('id', pathId)
    }

    revalidatePath(`/paths/${pathId}`)
    return successResponse(null, 'Step removido')
  } catch (e) {
    return databaseError('Erro ao remover step')
  }
}

// ============================================
// Student: progress
// ============================================

export async function startPath(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(startPathSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    // Check if already started
    const { data: existing } = await (ctx.supabase as any)
      .from('user_path_progress')
      .select('id, status')
      .eq('user_id', ctx.userId)
      .eq('path_id', validation.data.path_id)
      .maybeSingle()

    if (existing) {
      if (existing.status === 'paused') {
        // Resume
        await (ctx.supabase as any)
          .from('user_path_progress')
          .update({ status: 'active' })
          .eq('id', existing.id)
        revalidatePath('/paths')
        return successResponse(existing, 'Trilha retomada')
      }
      return successResponse(existing, 'Trilha já iniciada')
    }

    const { data, error } = await (ctx.supabase as any)
      .from('user_path_progress')
      .insert({
        tenant_id: ctx.tenantId,
        user_id: ctx.userId,
        path_id: validation.data.path_id,
        current_step: 0,
        status: 'active',
      })
      .select('id')
      .single()

    if (error) return databaseError(error.message)

    // Gamification: award points for starting a path
    ;(ctx.supabase as any).rpc('rpc_award_points', {
      p_user_id: ctx.userId,
      p_points: 10,
      p_source: 'path',
      p_action: 'start',
      p_description: 'Trilha iniciada',
      p_reference_type: 'learning_path',
      p_reference_id: validation.data.path_id,
    }).then(() => (ctx.supabase as any).rpc('rpc_check_achievements', { p_user_id: ctx.userId }))

    revalidatePath('/paths')
    revalidatePath(`/paths/${validation.data.path_id}`)
    return successResponse(data, 'Trilha iniciada!')
  } catch (e) {
    return databaseError('Erro ao iniciar trilha')
  }
}

export async function completeStep(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(completeStepSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { step_id, path_id } = validation.data

    // Get the step details
    const { data: step } = await (ctx.supabase as any)
      .from('learning_path_steps')
      .select('step_order, points_reward, unlock_after')
      .eq('id', step_id)
      .single()

    if (!step) return notFoundError('Step')

    // Check if unlock_after is completed (if required)
    if (step.unlock_after) {
      const { data: prereq } = await (ctx.supabase as any)
        .from('user_step_completions')
        .select('id')
        .eq('user_id', ctx.userId)
        .eq('step_id', step.unlock_after)
        .maybeSingle()

      if (!prereq) return validationError('Complete o step anterior primeiro')
    }

    // Record step completion
    const { error: compError } = await (ctx.supabase as any)
      .from('user_step_completions')
      .insert({
        tenant_id: ctx.tenantId,
        user_id: ctx.userId,
        step_id,
        path_id,
      })
      .select('id')
      .single()

    if (compError) {
      // Unique violation = already completed
      if (compError.code === '23505') return successResponse(null, 'Step já completado')
      return databaseError(compError.message)
    }

    // Update path progress
    const { count: completedCount } = await (ctx.supabase as any)
      .from('user_step_completions')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', ctx.userId)
      .eq('path_id', path_id)

    const { data: pathData } = await (ctx.supabase as any)
      .from('learning_paths')
      .select('total_steps')
      .eq('id', path_id)
      .single()

    const totalSteps = pathData?.total_steps || 0
    const isCompleted = completedCount !== null && completedCount >= totalSteps && totalSteps > 0

    await (ctx.supabase as any)
      .from('user_path_progress')
      .update({
        current_step: step.step_order,
        status: isCompleted ? 'completed' : 'active',
        completed_at: isCompleted ? new Date().toISOString() : null,
      })
      .eq('user_id', ctx.userId)
      .eq('path_id', path_id)

    // Gamification
    const points = step.points_reward || 10
    ;(ctx.supabase as any).rpc('rpc_award_points', {
      p_user_id: ctx.userId,
      p_points: points,
      p_source: 'path',
      p_action: 'complete_step',
      p_description: 'Step da trilha completado',
      p_reference_type: 'learning_path_step',
      p_reference_id: step_id,
    }).then(() => (ctx.supabase as any).rpc('rpc_check_achievements', { p_user_id: ctx.userId }))

    // Bonus for completing the entire path
    if (isCompleted) {
      ;(ctx.supabase as any).rpc('rpc_award_points', {
        p_user_id: ctx.userId,
        p_points: 50,
        p_source: 'path',
        p_action: 'complete_path',
        p_description: 'Trilha completa!',
        p_reference_type: 'learning_path',
        p_reference_id: path_id,
      }).then(() => (ctx.supabase as any).rpc('rpc_check_achievements', { p_user_id: ctx.userId }))
    }

    revalidatePath('/paths')
    revalidatePath(`/paths/${path_id}`)
    revalidatePath('/progress')
    revalidatePath('/achievements')
    return successResponse(
      { completed: true, pathCompleted: isCompleted },
      isCompleted ? 'Trilha completa! Parabéns!' : 'Step completado!'
    )
  } catch (e) {
    return databaseError('Erro ao completar step')
  }
}
