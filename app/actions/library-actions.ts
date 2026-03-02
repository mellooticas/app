'use server'

import { revalidatePath } from 'next/cache'
import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'
import { createLibraryItemSchema, updateLibraryItemSchema } from '@/lib/validations/unified-schemas'
import { successResponse, unauthorizedError, forbiddenError, databaseError, validationError, notFoundError } from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'
import { checkPermission } from '@/lib/auth/check-permission'

export async function createLibraryItem(rawData: unknown): Promise<ActionResult> {
  try {
    const validation = await validateAction(createLibraryItemSchema, rawData)
    if ('error' in validation) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const canCreate = await checkPermission('lessons.create')
    if (!canCreate) return forbiddenError('Permissão lessons.create necessária')

    const { data, error } = await (ctx.supabase as any)
      .from('library_items')
      .insert({
        ...validation.data,
        tenant_id: ctx.tenantId,
        uploaded_by: ctx.userId,
      })
      .select('id')
      .single()

    if (error) return databaseError(error.message)

    revalidatePath('/academic/library')
    return successResponse(data, 'Item adicionado a biblioteca')
  } catch (e) {
    return databaseError('Erro ao criar item')
  }
}

export async function updateLibraryItem(rawData: unknown): Promise<ActionResult> {
  try {
    const validation = await validateAction(updateLibraryItemSchema, rawData)
    if ('error' in validation) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const canEdit = await checkPermission('lessons.edit')
    if (!canEdit) return forbiddenError('Permissão lessons.edit necessária')

    const { id, ...updates } = validation.data
    const { error } = await (ctx.supabase as any)
      .from('library_items')
      .update({ ...updates, updated_at: new Date().toISOString() })
      .eq('id', id)

    if (error) return databaseError(error.message)

    revalidatePath('/academic/library')
    return successResponse(null, 'Item atualizado')
  } catch (e) {
    return databaseError('Erro ao atualizar item')
  }
}

export async function deleteLibraryItem(id: string): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const canDelete = await checkPermission('lessons.create')
    if (!canDelete) return forbiddenError('Permissão lessons.create necessária')

    const { error } = await (ctx.supabase as any)
      .from('library_items')
      .delete()
      .eq('id', id)

    if (error) return databaseError(error.message)

    revalidatePath('/academic/library')
    return successResponse(null, 'Item removido')
  } catch (e) {
    return databaseError('Erro ao remover item')
  }
}
