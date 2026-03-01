'use server'

import { revalidatePath } from 'next/cache'
import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'
import { createTopicSchema, replyToTopicSchema } from '@/lib/validations/unified-schemas'
import { successResponse, unauthorizedError, databaseError, validationError } from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'

export async function createTopic(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(createTopicSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data, error } = await ctx.supabase
      .from('forum_topics')
      .insert({ ...validation.data, tenant_id: ctx.tenantId, author_id: ctx.userId })
      .select('id')
      .single()

    if (error) return databaseError(error.message)

    revalidatePath('/community')
    return successResponse(data, 'Tópico criado com sucesso')
  } catch (e) {
    return databaseError('Erro ao criar tópico')
  }
}

export async function replyToTopic(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(replyToTopicSchema, rawData)
    if (!validation.success) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data, error } = await ctx.supabase
      .from('forum_replies')
      .insert({ ...validation.data, tenant_id: ctx.tenantId, author_id: ctx.userId })
      .select('id')
      .single()

    if (error) return databaseError(error.message)

    revalidatePath(`/community/${validation.data.topic_id}`)
    revalidatePath('/community')
    return successResponse(data, 'Resposta publicada')
  } catch (e) {
    return databaseError('Erro ao responder')
  }
}

export async function likeTopic(topicId: string): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data: existing } = await ctx.supabase
      .from('forum_likes')
      .select('id')
      .eq('user_id', ctx.userId)
      .eq('topic_id', topicId)
      .single()

    if (existing) {
      await ctx.supabase.from('forum_likes').delete().eq('id', existing.id)
      revalidatePath('/community')
      return successResponse({ liked: false }, 'Like removido')
    } else {
      await ctx.supabase.from('forum_likes').insert({ tenant_id: ctx.tenantId, user_id: ctx.userId, topic_id: topicId })
      revalidatePath('/community')
      return successResponse({ liked: true }, 'Tópico curtido')
    }
  } catch (e) {
    return databaseError('Erro ao curtir tópico')
  }
}
