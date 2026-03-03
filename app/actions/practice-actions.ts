'use server'

import { revalidatePath } from 'next/cache'
import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'
import { logPracticeSchema } from '@/lib/validations/unified-schemas'
import { successResponse, unauthorizedError, databaseError, validationError } from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'
import { onPracticeLog } from '@/app/actions/alpha-engine-actions'

export async function logPracticeSession(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(logPracticeSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data, error } = await ctx.supabase
      .from('practice_sessions')
      .insert({
        ...validation.data,
        tenant_id: ctx.tenantId,
        student_id: ctx.userId,
        session_date: validation.data.session_date || new Date().toISOString().split('T')[0],
      })
      .select('id')
      .single()

    if (error) return databaseError(error.message)

    // Gamification: award points for practice (fire-and-forget)
    ;(ctx.supabase as any).rpc('rpc_award_points', {
      p_user_id: ctx.userId,
      p_points: 5,
      p_source: 'practice',
      p_action: 'log_session',
      p_description: `Pratica: ${validation.data.duration_minutes} min`,
      p_reference_type: 'practice_session',
      p_reference_id: data.id,
    }).then(() => (ctx.supabase as any).rpc('rpc_check_achievements', { p_user_id: ctx.userId }))

    // Alpha Engine: bonus micro-challenge if 30+ min (fire-and-forget)
    onPracticeLog(validation.data.duration_minutes).catch(() => {})

    revalidatePath('/practice')
    revalidatePath('/progress')
    revalidatePath('/achievements')
    return successResponse(data, 'Sessao de pratica registrada (+5 pts)')
  } catch (e) {
    return databaseError('Erro ao registrar prática')
  }
}

export async function deletePracticeSession(sessionId: string): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { error } = await ctx.supabase
      .from('practice_sessions')
      .delete()
      .eq('id', sessionId)
      .eq('student_id', ctx.userId)

    if (error) return databaseError(error.message)

    revalidatePath('/practice')
    return successResponse(null, 'Sessão excluída')
  } catch (e) {
    return databaseError('Erro ao excluir sessão')
  }
}
