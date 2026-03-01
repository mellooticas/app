'use server'

import { revalidatePath } from 'next/cache'
import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'
import { updateProfileSchema } from '@/lib/validations/unified-schemas'
import { successResponse, unauthorizedError, databaseError, validationError } from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'

export async function updateProfile(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(updateProfileSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const updateData: Record<string, any> = {}
    if (validation.data.full_name !== undefined) updateData.full_name = validation.data.full_name
    if (validation.data.display_name !== undefined) updateData.display_name = validation.data.display_name
    if (validation.data.phone !== undefined) updateData.phone = validation.data.phone
    if (validation.data.birth_date !== undefined) updateData.birth_date = validation.data.birth_date || null

    const { error } = await ctx.supabase
      .from('profiles')
      .update(updateData)
      .eq('user_id', ctx.userId)

    if (error) return databaseError(error.message)

    revalidatePath('/profile')
    return successResponse(null, 'Perfil atualizado com sucesso')
  } catch (e) {
    return databaseError('Erro ao atualizar perfil')
  }
}
