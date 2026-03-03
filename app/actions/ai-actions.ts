'use server'

import { revalidatePath } from 'next/cache'
import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'
import { generateLessonMaterialsSchema, generateBatchMaterialsSchema } from '@/lib/validations/unified-schemas'
import { successResponse, unauthorizedError, forbiddenError, databaseError, validationError, notFoundError } from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'
import { checkPermission } from '@/lib/auth/check-permission'
import { generateText, generateJSON, type AICallContext } from '@/lib/ai/ai-client'
import { SYSTEM_BASE, LESSON_MATERIAL_PROMPT, EXERCISE_PROMPT } from '@/lib/ai/prompts'
import { buildLessonContext } from '@/lib/ai/curriculum-context'
import { createHash } from 'crypto'

interface AIExercise {
  title: string
  description: string
  difficulty: number
  duration_minutes: number
  tip: string
}

/**
 * Generate AI materials for a single lesson
 * Admin/Teacher only
 */
export async function generateLessonMaterials(rawData: unknown): Promise<ActionResult> {
  try {
    const validation = await validateAction(generateLessonMaterialsSchema, rawData)
    if ('error' in validation) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const canGenerate = await checkPermission('lessons.create')
    if (!canGenerate) return forbiddenError('Permissão lessons.create necessária')

    // Fetch lesson data with activities
    const { data: lessonRaw, error: lessonError } = await ctx.supabase
      .from('v_lessons')
      .select('*')
      .eq('id', validation.data.lesson_id)
      .single()

    if (lessonError || !lessonRaw) return notFoundError('Aula')
    // TODO: regenerate database.types.ts to fix view type resolution (currently resolves to never)
    const lesson = lessonRaw as Record<string, any>

    const { data: activitiesRaw } = await ctx.supabase
      .from('v_lesson_activities')
      .select('*')
      .eq('lesson_id', lesson.id)
      .order('order_index')
    const activities = (activitiesRaw || []) as Record<string, any>[]

    // Build context
    const lessonContext = buildLessonContext({
      title: lesson.title,
      lesson_number: lesson.lesson_number,
      description: lesson.description,
      learning_objective: lesson.learning_objective,
      module_name: lesson.module_name,
    })

    const activitiesText = activities.length
      ? `\nATIVIDADES DA AULA:\n${activities.map(a => `- [${a.activity_type}] ${a.title}: ${a.description || ''}`).join('\n')}`
      : ''

    const fullContext = lessonContext + activitiesText

    // Generate dedup hash
    const promptHash = createHash('md5').update(fullContext + LESSON_MATERIAL_PROMPT).digest('hex')

    // Check if already generated (avoid duplicate cost)
    const { data: existing } = await (ctx.supabase as any)
      .from('ai_generated_content')
      .select('id')
      .eq('lesson_id', lesson.id)
      .eq('content_type', 'material')
      .eq('ai_prompt_hash', promptHash)
      .eq('status', 'active')
      .limit(1)

    if (existing && existing.length > 0) {
      return successResponse({ id: existing[0].id, cached: true }, 'Material já existente')
    }

    // AI call context for usage logging
    const aiCtx: AICallContext = { tenantId: ctx.tenantId, userId: ctx.userId, actionName: 'generateLessonMaterials' }

    // Generate lesson material (markdown)
    const material = await generateText({
      system: SYSTEM_BASE,
      prompt: `${fullContext}\n\n${LESSON_MATERIAL_PROMPT}`,
      model: 'fast',
      maxTokens: 4096,
      temperature: 0.7,
    }, aiCtx)

    // Generate exercises (JSON)
    const exercises = await generateJSON({
      system: SYSTEM_BASE,
      prompt: `${fullContext}\n\n${EXERCISE_PROMPT}`,
      model: 'fast',
      maxTokens: 2048,
    }, aiCtx)

    // Save material
    const { data: savedMaterial, error: saveError } = await (ctx.supabase as any)
      .from('ai_generated_content')
      .insert({
        tenant_id: ctx.tenantId,
        lesson_id: lesson.id,
        content_type: 'material',
        title: `Material de Apoio: ${lesson.title}`,
        content: material,
        metadata: { methodology: lesson.module_name, lesson_number: lesson.lesson_number },
        ai_model: process.env.AI_MODEL_FAST || 'gpt-4o-mini',
        ai_prompt_hash: promptHash,
        status: 'active',
        created_by: ctx.userId,
      })
      .select('id')
      .single()

    if (saveError) return databaseError(saveError.message)

    // Save exercises as separate content
    const exerciseList = exercises?.exercises as AIExercise[] | undefined
    if (exerciseList?.length) {
      await (ctx.supabase as any)
        .from('ai_generated_content')
        .insert({
          tenant_id: ctx.tenantId,
          lesson_id: lesson.id,
          content_type: 'exercise',
          title: `Exercícios: ${lesson.title}`,
          content: exerciseList.map((e, i) =>
            `### Exercício ${i + 1}: ${e.title}\n${e.description}\n\n**Dificuldade:** ${'⭐'.repeat(e.difficulty)}\n**Tempo:** ~${e.duration_minutes} min\n**Dica:** ${e.tip}`
          ).join('\n\n---\n\n'),
          metadata: { exercises: exerciseList, lesson_number: lesson.lesson_number },
          ai_model: process.env.AI_MODEL_FAST || 'gpt-4o-mini',
          ai_prompt_hash: promptHash + '_exercises',
          status: 'active',
          created_by: ctx.userId,
        })
    }

    revalidatePath(`/lessons/${lesson.id}`)
    revalidatePath('/settings/ai-content')
    return successResponse(savedMaterial, 'Material gerado com sucesso')
  } catch (e) {
    console.error('AI generation error:', e)
    return databaseError(e instanceof Error ? e.message : 'Erro ao gerar material')
  }
}

/**
 * Generate materials for multiple lessons in batch
 * Admin only
 */
export async function generateBatchMaterials(rawData: unknown): Promise<ActionResult> {
  try {
    const validation = await validateAction(generateBatchMaterialsSchema, rawData)
    if ('error' in validation) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const canGenerate = await checkPermission('lessons.create')
    if (!canGenerate) return forbiddenError('Permissão lessons.create necessária')

    const results: { lesson_id: string; status: 'success' | 'error' | 'skipped'; message: string }[] = []

    // Process in batches of 3 to avoid rate limits
    const batchSize = 3
    for (let i = 0; i < validation.data.lesson_ids.length; i += batchSize) {
      const batch = validation.data.lesson_ids.slice(i, i + batchSize)

      const batchResults = await Promise.allSettled(
        batch.map(async (lessonId: string) => {
          const result = await generateLessonMaterials({ lesson_id: lessonId })
          return { lesson_id: lessonId, result }
        })
      )

      for (const r of batchResults) {
        if (r.status === 'fulfilled') {
          const { lesson_id, result } = r.value
          results.push({
            lesson_id,
            status: result.success ? 'success' : 'error',
            message: result.success ? (result.message || 'OK') : ('error' in result ? result.error : 'Erro'),
          })
        } else {
          results.push({ lesson_id: 'unknown', status: 'error', message: r.reason?.message || 'Erro' })
        }
      }
    }

    revalidatePath('/settings/ai-content')
    const successCount = results.filter(r => r.status === 'success').length
    return successResponse(results, `${successCount}/${results.length} materiais gerados`)
  } catch (e) {
    return databaseError(e instanceof Error ? e.message : 'Erro no batch')
  }
}

/**
 * Get all AI-generated content for a lesson
 */
export async function getLessonAIContent(lessonId: string): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data, error } = await (ctx.supabase as any)
      .from('v_ai_generated_content')
      .select('*')
      .eq('lesson_id', lessonId)
      .eq('status', 'active')
      .order('created_at', { ascending: false })

    if (error) return databaseError(error.message)
    return successResponse(data || [])
  } catch (e) {
    return databaseError('Erro ao buscar conteúdo AI')
  }
}
