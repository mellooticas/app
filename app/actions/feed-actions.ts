'use server'

import { revalidatePath } from 'next/cache'
import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'
import { createPostSchema, commentSchema } from '@/lib/validations/unified-schemas'
import { successResponse, unauthorizedError, databaseError, validationError } from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'

export async function createPost(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(createPostSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data, error } = await ctx.supabase
      .from('feed_posts')
      .insert({ ...validation.data, tenant_id: ctx.tenantId, author_id: ctx.userId })
      .select('id')
      .single()

    if (error) return databaseError(error.message)

    revalidatePath('/feed')
    return successResponse(data, 'Post criado com sucesso')
  } catch (e) {
    return databaseError('Erro ao criar post')
  }
}

export async function likePost(postId: string): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    // Check if already liked
    const { data: existing } = await ctx.supabase
      .from('feed_likes')
      .select('id')
      .eq('user_id', ctx.userId)
      .eq('post_id', postId)
      .single()

    if (existing) {
      // Unlike
      await ctx.supabase.from('feed_likes').delete().eq('id', existing.id)
      revalidatePath('/feed')
      return successResponse({ liked: false }, 'Like removido')
    } else {
      // Like
      await ctx.supabase.from('feed_likes').insert({ tenant_id: ctx.tenantId, user_id: ctx.userId, post_id: postId })
      revalidatePath('/feed')
      return successResponse({ liked: true }, 'Post curtido')
    }
  } catch (e) {
    return databaseError('Erro ao curtir post')
  }
}

export async function commentOnPost(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(commentSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data, error } = await ctx.supabase
      .from('feed_comments')
      .insert({ ...validation.data, tenant_id: ctx.tenantId, author_id: ctx.userId })
      .select('id')
      .single()

    if (error) return databaseError(error.message)

    revalidatePath('/feed')
    return successResponse(data, 'Comentário adicionado')
  } catch (e) {
    return databaseError('Erro ao comentar')
  }
}

export async function deletePost(postId: string): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { error } = await ctx.supabase
      .from('feed_posts')
      .update({ deleted_at: new Date().toISOString() })
      .eq('id', postId)
      .eq('author_id', ctx.userId)

    if (error) return databaseError(error.message)

    revalidatePath('/feed')
    return successResponse(null, 'Post excluído')
  } catch (e) {
    return databaseError('Erro ao excluir post')
  }
}
