'use server'

import { revalidatePath } from 'next/cache'
import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'
import { createRepertoireSchema, updateRepertoireSchema } from '@/lib/validations/unified-schemas'
import { successResponse, unauthorizedError, databaseError, validationError } from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'

export async function createRepertoire(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(createRepertoireSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data, error } = await ctx.supabase
      .from('repertoire')
      .insert({
        tenant_id: ctx.tenantId,
        title: validation.data.title.trim(),
        composer: validation.data.composer?.trim() || null,
        arranger: validation.data.arranger?.trim() || null,
        difficulty_level: validation.data.difficulty_level || null,
        key_signature: validation.data.key_signature?.trim() || null,
        notes: validation.data.notes?.trim() || null,
      })
      .select('id')
      .single()

    if (error) return databaseError(error.message)

    revalidatePath('/repertoire')
    return successResponse(data, 'Repertório criado com sucesso')
  } catch (e) {
    return databaseError('Erro ao criar repertório')
  }
}

export async function updateRepertoire(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(updateRepertoireSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { id, ...fields } = validation.data

    const updateData: Record<string, any> = {}
    for (const [key, value] of Object.entries(fields)) {
      if (value !== undefined) {
        updateData[key] = typeof value === 'string' ? value.trim() || null : value
      }
    }

    const { error } = await ctx.supabase
      .from('repertoire')
      .update(updateData)
      .eq('id', id)

    if (error) return databaseError(error.message)

    revalidatePath('/repertoire')
    revalidatePath(`/repertoire/${id}`)
    return successResponse(null, 'Repertório atualizado com sucesso')
  } catch (e) {
    return databaseError('Erro ao atualizar repertório')
  }
}
