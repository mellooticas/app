'use server'

import { revalidatePath } from 'next/cache'
import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'
import { completeAlphaItemSchema, skipAlphaItemSchema } from '@/lib/validations/unified-schemas'
import { successResponse, unauthorizedError, databaseError, validationError, notFoundError } from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'
import { generateJSON } from '@/lib/ai/ai-client'
import { SYSTEM_BASE, NEXT_STEP_PROMPT, MICRO_CHALLENGE_PROMPT } from '@/lib/ai/prompts'
import { buildLessonContext, buildStudentContext } from '@/lib/ai/curriculum-context'

/**
 * Get the student's Alpha queue (pending + in_progress items)
 */
export async function getAlphaQueue(): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { data, error } = await (ctx.supabase as any)
      .from('v_alpha_queue')
      .select('*')
      .eq('user_id', ctx.userId)
      .in('status', ['pending', 'in_progress'])
      .order('priority', { ascending: false })
      .order('created_at', { ascending: true })
      .limit(10)

    if (error) return databaseError(error.message)
    return successResponse(data || [])
  } catch (e) {
    return databaseError('Erro ao buscar fila Alpha')
  }
}

/**
 * Complete an Alpha queue item — awards points
 */
export async function completeAlphaItem(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(completeAlphaItemSchema, rawData)
    if ('error' in validation) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    // Fetch the item to get points_reward
    const { data: itemRaw, error: fetchError } = await (ctx.supabase as any)
      .from('alpha_queue')
      .select('id, points_reward, status')
      .eq('id', validation.data.item_id)
      .eq('user_id', ctx.userId)
      .single()

    if (fetchError || !itemRaw) return notFoundError('Item Alpha')
    const item = itemRaw as any
    if (item.status === 'completed') return successResponse(item, 'Item já concluído')

    // Mark as completed
    const { error: updateError } = await (ctx.supabase as any)
      .from('alpha_queue')
      .update({
        status: 'completed',
        completed_at: new Date().toISOString(),
      })
      .eq('id', item.id)

    if (updateError) return databaseError(updateError.message)

    // Gamification: award points
    ;(ctx.supabase as any).rpc('rpc_award_points', {
      p_user_id: ctx.userId,
      p_points: item.points_reward || 5,
      p_source: 'alpha',
      p_action: 'complete',
      p_description: 'Atividade Alpha concluída',
      p_reference_type: 'alpha_queue',
      p_reference_id: item.id,
    }).then(() => (ctx.supabase as any).rpc('rpc_check_achievements', { p_user_id: ctx.userId }))

    // Adaptive difficulty: check every 3 completions (fire-and-forget)
    const { count } = await (ctx.supabase as any)
      .from('alpha_queue')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', ctx.userId)
      .eq('status', 'completed')
    if (count && count % 3 === 0) {
      adjustDifficulty().catch(() => {})
    }

    revalidatePath('/lessons/alpha')
    revalidatePath('/progress')
    revalidatePath('/achievements')
    return successResponse({ id: item.id }, 'Atividade concluída! Pontos adicionados.')
  } catch (e) {
    return databaseError('Erro ao completar atividade')
  }
}

/**
 * Skip an Alpha queue item
 */
export async function skipAlphaItem(rawData: any): Promise<ActionResult> {
  try {
    const validation = await validateAction(skipAlphaItemSchema, rawData)
    if ('error' in validation) return validationError(validation.error)

    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    const { error } = await (ctx.supabase as any)
      .from('alpha_queue')
      .update({ status: 'skipped' })
      .eq('id', validation.data.item_id)
      .eq('user_id', ctx.userId)

    if (error) return databaseError(error.message)

    revalidatePath('/lessons/alpha')
    return successResponse(null, 'Atividade pulada')
  } catch (e) {
    return databaseError('Erro ao pular atividade')
  }
}

/**
 * Generate next steps for the Alpha continuous engine
 * Called when queue is empty or has < 3 pending items
 */
export async function generateNextSteps(): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    // Check current queue size
    const { data: currentQueue } = await (ctx.supabase as any)
      .from('alpha_queue')
      .select('id')
      .eq('user_id', ctx.userId)
      .eq('status', 'pending')

    if (currentQueue && (currentQueue as any[]).length >= 5) {
      return successResponse({ generated: 0 }, 'Fila já tem atividades suficientes')
    }

    // Fetch student progress
    const { data: progressRaw } = await ctx.supabase
      .from('v_user_progress')
      .select('*')
      .eq('user_id', ctx.userId)
      .single()
    const progress = progressRaw as any

    // Fetch learning profile if exists
    const { data: profileRaw } = await (ctx.supabase as any)
      .from('student_learning_profiles')
      .select('*')
      .eq('user_id', ctx.userId)
      .single()
    const profile = profileRaw as any

    // Find current week's lesson (closest uncompleted or most recent)
    const { data: lessonProgressRaw } = await ctx.supabase
      .from('v_lesson_progress')
      .select('*')
      .eq('student_id', ctx.userId)
      .order('created_at', { ascending: false })
      .limit(5)
    const lessonProgress = (lessonProgressRaw || []) as any[]

    const completedLessonIds = lessonProgress.filter((lp: any) => lp.is_completed).map((lp: any) => lp.lesson_id)

    // Get current/next lesson
    const { data: currentLessonRaw } = await ctx.supabase
      .from('v_lessons')
      .select('*')
      .order('lesson_number', { ascending: true })
      .limit(1)
      .not('id', 'in', completedLessonIds.length > 0 ? `(${completedLessonIds.join(',')})` : '(00000000-0000-0000-0000-000000000000)')

    const lesson = (currentLessonRaw as any)?.[0]

    // Build AI context
    const studentCtx = buildStudentContext({
      level: progress?.level || 1,
      total_points: progress?.total_points || 0,
      lessons_completed: progress?.lessons_completed || 0,
      current_streak: progress?.current_streak || 0,
      preferred_difficulty: profile?.preferred_difficulty || 3,
      preferred_style: profile?.preferred_style || 'mixed',
      strengths: profile?.strengths || [],
      areas_for_growth: profile?.areas_for_growth || [],
    })

    const lessonCtx = lesson
      ? buildLessonContext({
          title: lesson.title,
          lesson_number: lesson.lesson_number ?? lesson.number,
          description: lesson.description,
          learning_objective: lesson.learning_objective,
          module_name: lesson.module_name,
        })
      : 'Aula atual: Nenhuma aula específica — gere atividades genéricas de prática musical.'

    // Generate next steps via AI
    const result = await generateJSON<{ items: any[] }>({
      system: SYSTEM_BASE,
      prompt: `${studentCtx}\n\n${lessonCtx}\n\n${NEXT_STEP_PROMPT}`,
      model: 'fast',
      maxTokens: 3000,
    })

    if (!result?.items?.length) {
      return successResponse({ generated: 0 }, 'AI não gerou itens')
    }

    // Insert into alpha_queue
    const insertItems = result.items.map((item: any, idx: number) => ({
      tenant_id: ctx.tenantId,
      user_id: ctx.userId,
      source_type: lesson ? 'lesson' : 'ai_generated',
      source_id: lesson?.id || null,
      item_type: item.type || 'exercise',
      title: item.title,
      description: item.description,
      content: item.content,
      difficulty: Math.min(5, Math.max(1, item.difficulty || 3)),
      points_reward: Math.min(20, Math.max(3, item.points || 5)),
      priority: result.items.length - idx, // first item = highest priority
      status: 'pending',
    }))

    const { error: insertError } = await (ctx.supabase as any)
      .from('alpha_queue')
      .insert(insertItems)

    if (insertError) return databaseError(insertError.message)

    revalidatePath('/lessons/alpha')
    return successResponse({ generated: insertItems.length }, `${insertItems.length} atividades geradas`)
  } catch (e: any) {
    console.error('Alpha engine error:', e)
    return databaseError(e.message || 'Erro ao gerar próximos passos')
  }
}

// ============================================
// Auto-triggers: called after key student events
// ============================================

/**
 * Called after a student completes a lesson.
 * Generates 3 reinforcement exercises + suggests next step.
 * Fire-and-forget: caller should not await this.
 */
export async function onLessonComplete(lessonId: string): Promise<void> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return

    // Get lesson info
    const { data: lessonRaw } = await ctx.supabase
      .from('v_lessons')
      .select('*')
      .eq('id', lessonId)
      .single()
    const lesson = lessonRaw as any
    if (!lesson) return

    // Get student profile
    const { data: profileRaw } = await (ctx.supabase as any)
      .from('student_learning_profiles')
      .select('preferred_difficulty, preferred_style')
      .eq('user_id', ctx.userId)
      .maybeSingle()
    const profile = profileRaw as any

    const difficulty = profile?.preferred_difficulty || 3

    // Generate reinforcement items via AI
    const lessonCtx = buildLessonContext({
      title: lesson.title,
      lesson_number: lesson.lesson_number || lesson.number,
      description: lesson.description,
      learning_objective: lesson.learning_objective,
      module_name: lesson.module_name,
    })

    const result = await generateJSON<{ items: any[] }>({
      system: SYSTEM_BASE,
      prompt: `${lessonCtx}\n\nO aluno ACABOU DE COMPLETAR esta aula. Dificuldade preferida: ${difficulty}/5.\n\nGere exatamente 3 atividades de reforço:\n1. Um exercício prático relacionado ao tema da aula\n2. Uma dica de prática para melhorar o que foi aprendido\n3. Uma sugestão de próximo passo (pode ser outra aula ou desafio)\n\nRetorne JSON: { "items": [{ "type": "exercise"|"practice_tip"|"next_lesson", "title": "...", "description": "...", "content": "...", "difficulty": 1-5, "points": 3-15 }] }`,
      model: 'fast',
      maxTokens: 2000,
    })

    if (!result?.items?.length) return

    const insertItems = result.items.map((item: any, idx: number) => ({
      tenant_id: ctx.tenantId,
      user_id: ctx.userId,
      source_type: 'lesson' as const,
      source_id: lessonId,
      item_type: item.type || 'exercise',
      title: item.title,
      description: item.description,
      content: item.content,
      difficulty: Math.min(5, Math.max(1, item.difficulty || difficulty)),
      points_reward: Math.min(15, Math.max(3, item.points || 5)),
      priority: 10 + (result.items.length - idx),
      status: 'pending' as const,
    }))

    await (ctx.supabase as any).from('alpha_queue').insert(insertItems)

    // Auto-create/update learning profile if not exists
    await ensureLearningProfile(ctx)

    revalidatePath('/lessons/alpha')
  } catch (e) {
    console.error('onLessonComplete trigger error:', e)
  }
}

/**
 * Called after a student submits a challenge.
 * Adjusts difficulty and generates a related practice exercise.
 */
export async function onChallengeComplete(challengeId: string): Promise<void> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return

    // Get challenge info
    const { data: challengeRaw } = await (ctx.supabase as any)
      .from('v_challenges')
      .select('*')
      .eq('id', challengeId)
      .single()
    const challenge = challengeRaw as any
    if (!challenge) return

    const result = await generateJSON<{ items: any[] }>({
      system: SYSTEM_BASE,
      prompt: `O aluno acabou de submeter o desafio "${challenge.title}" (dificuldade ${challenge.difficulty}/5, ${challenge.base_points} pts).\nDescrição: ${challenge.description || 'N/A'}\n\nGere 1-2 atividades de reforço:\n1. Um exercício prático relacionado ao desafio\n2. (Opcional) Uma revisão se o desafio era difícil (nível >= 4)\n\nRetorne JSON: { "items": [{ "type": "exercise"|"review", "title": "...", "description": "...", "content": "...", "difficulty": 1-5, "points": 3-10 }] }`,
      model: 'fast',
      maxTokens: 1500,
    })

    if (!result?.items?.length) return

    const insertItems = result.items.map((item: any, idx: number) => ({
      tenant_id: ctx.tenantId,
      user_id: ctx.userId,
      source_type: 'challenge' as const,
      source_id: challengeId,
      item_type: item.type || 'exercise',
      title: item.title,
      description: item.description,
      content: item.content,
      difficulty: Math.min(5, Math.max(1, item.difficulty || challenge.difficulty)),
      points_reward: Math.min(10, Math.max(3, item.points || 5)),
      priority: 8 + (result.items.length - idx),
      status: 'pending' as const,
    }))

    await (ctx.supabase as any).from('alpha_queue').insert(insertItems)

    revalidatePath('/lessons/alpha')
  } catch (e) {
    console.error('onChallengeComplete trigger error:', e)
  }
}

/**
 * Called after a student logs a practice session.
 * If practice >= 30min, generates a bonus micro-challenge.
 */
export async function onPracticeLog(durationMinutes: number): Promise<void> {
  try {
    if (durationMinutes < 30) return // Only trigger for substantial practice

    const ctx = await getActionContext()
    if (!ctx) return

    // Check if already have a bonus challenge today
    const today = new Date().toISOString().split('T')[0]
    const { data: existingRaw } = await (ctx.supabase as any)
      .from('alpha_queue')
      .select('id')
      .eq('user_id', ctx.userId)
      .eq('item_type', 'micro_challenge')
      .eq('source_type', 'practice')
      .gte('created_at', today)
      .limit(1)

    if ((existingRaw || []).length > 0) return // Already have one

    const result = await generateJSON<{
      title: string
      description: string
      content: string
      difficulty: number
      points: number
    }>({
      system: SYSTEM_BASE,
      prompt: `O aluno praticou ${durationMinutes} minutos hoje — parabéns! Gere um MICRO-DESAFIO BÔNUS divertido como recompensa.\nDeve ser algo rápido (5-10 min) e motivador.\n\nRetorne JSON: { "title": "...", "description": "...", "content": "...", "difficulty": 1-5, "points": 5-15 }`,
      model: 'fast',
      maxTokens: 1000,
    })

    if (!result?.title) return

    await (ctx.supabase as any).from('alpha_queue').insert({
      tenant_id: ctx.tenantId,
      user_id: ctx.userId,
      source_type: 'practice',
      source_id: null,
      item_type: 'micro_challenge',
      title: `Bonus: ${result.title}`,
      description: result.description,
      content: result.content,
      difficulty: Math.min(5, Math.max(1, result.difficulty || 2)),
      points_reward: Math.min(15, Math.max(5, result.points || 10)),
      priority: 50, // High priority bonus
      status: 'pending',
      expires_at: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString(),
    })

    // Update learning profile
    await ensureLearningProfile(ctx)

    revalidatePath('/lessons/alpha')
  } catch (e) {
    console.error('onPracticeLog trigger error:', e)
  }
}

/**
 * Auto-create learning profile if it doesn't exist yet
 */
async function ensureLearningProfile(ctx: { supabase: any; userId: string; tenantId: string }) {
  try {
    const { data: existing } = await (ctx.supabase as any)
      .from('student_learning_profiles')
      .select('id')
      .eq('user_id', ctx.userId)
      .maybeSingle()

    if (!existing) {
      await (ctx.supabase as any).from('student_learning_profiles').insert({
        tenant_id: ctx.tenantId,
        user_id: ctx.userId,
        preferred_style: 'mixed',
        preferred_difficulty: 2,
        weekly_goal_minutes: 60,
        current_focus_areas: [],
        strengths: [],
        areas_for_growth: [],
      })
    }
  } catch {
    // Non-critical, ignore
  }
}

/**
 * Adaptive difficulty algorithm.
 * Analyzes recent Alpha queue completions to adjust preferred_difficulty.
 *
 * Rules:
 * - If last 3 items completed quickly (< 2min avg) → increase difficulty
 * - If last 3 items skipped or none completed recently → decrease difficulty
 * - Otherwise → keep current level
 *
 * Called periodically (e.g., after every 3 completions).
 */
export async function adjustDifficulty(): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    // Get last 5 completed/skipped items
    const { data: recentRaw } = await (ctx.supabase as any)
      .from('alpha_queue')
      .select('id, status, difficulty, created_at, completed_at')
      .eq('user_id', ctx.userId)
      .in('status', ['completed', 'skipped'])
      .order('completed_at', { ascending: false })
      .limit(5)

    const recent = (recentRaw || []) as any[]
    if (recent.length < 3) {
      return successResponse({ adjusted: false }, 'Poucos dados para ajustar')
    }

    // Get current profile
    const { data: profileRaw } = await (ctx.supabase as any)
      .from('student_learning_profiles')
      .select('id, preferred_difficulty')
      .eq('user_id', ctx.userId)
      .maybeSingle()
    const profile = profileRaw as any

    if (!profile) {
      await ensureLearningProfile(ctx)
      return successResponse({ adjusted: false }, 'Perfil criado')
    }

    const currentDifficulty = profile.preferred_difficulty || 3

    // Count completed vs skipped in last 5
    const completed = recent.filter((r: any) => r.status === 'completed')
    const skipped = recent.filter((r: any) => r.status === 'skipped')

    let newDifficulty = currentDifficulty

    if (skipped.length >= 3) {
      // Too many skips → decrease difficulty
      newDifficulty = Math.max(1, currentDifficulty - 1)
    } else if (completed.length >= 3) {
      // Check completion speed
      const completionTimes = completed
        .filter((c: any) => c.completed_at && c.created_at)
        .map((c: any) => {
          const created = new Date(c.created_at).getTime()
          const done = new Date(c.completed_at).getTime()
          return (done - created) / 60000 // minutes
        })
        .filter((t: number) => t > 0 && t < 1440) // reasonable range (< 24h)

      if (completionTimes.length >= 3) {
        const avgMinutes = completionTimes.reduce((a: number, b: number) => a + b, 0) / completionTimes.length
        if (avgMinutes < 2) {
          // Very quick completions → increase difficulty
          newDifficulty = Math.min(5, currentDifficulty + 1)
        } else if (avgMinutes > 30) {
          // Very slow → maybe decrease
          newDifficulty = Math.max(1, currentDifficulty - 1)
        }
      } else {
        // All completed, but no timing data → slightly increase
        newDifficulty = Math.min(5, currentDifficulty + 1)
      }
    }

    if (newDifficulty !== currentDifficulty) {
      await (ctx.supabase as any)
        .from('student_learning_profiles')
        .update({
          preferred_difficulty: newDifficulty,
          updated_at: new Date().toISOString(),
        })
        .eq('id', profile.id)

      return successResponse(
        { previous: currentDifficulty, new: newDifficulty },
        `Dificuldade ajustada: ${currentDifficulty} → ${newDifficulty}`
      )
    }

    return successResponse({ adjusted: false, current: currentDifficulty }, 'Dificuldade mantida')
  } catch (e) {
    return databaseError('Erro ao ajustar dificuldade')
  }
}

/**
 * Generate a daily micro-challenge based on current lesson
 */
export async function generateDailyChallenge(): Promise<ActionResult> {
  try {
    const ctx = await getActionContext()
    if (!ctx) return unauthorizedError()

    // Check if already has a micro_challenge from today
    const today = new Date().toISOString().split('T')[0]
    const { data: existingRaw } = await (ctx.supabase as any)
      .from('alpha_queue')
      .select('id')
      .eq('user_id', ctx.userId)
      .eq('item_type', 'micro_challenge')
      .gte('created_at', today)
      .limit(1)
    const existing = (existingRaw || []) as any[]

    if (existing.length > 0) {
      return successResponse({ id: existing[0].id, cached: true }, 'Desafio do dia já existe')
    }

    // Get current lesson context
    const { data: lessonsRaw } = await ctx.supabase
      .from('v_lessons')
      .select('*')
      .lte('scheduled_date', new Date().toISOString())
      .order('scheduled_date', { ascending: false })
      .limit(1)

    const lesson = (lessonsRaw as any)?.[0]
    const lessonCtx = lesson
      ? buildLessonContext({
          title: lesson.title,
          lesson_number: lesson.lesson_number ?? lesson.number,
          description: lesson.description,
          learning_objective: lesson.learning_objective,
          module_name: lesson.module_name,
        })
      : 'Tema geral: prática musical livre.'

    const result = await generateJSON<{
      title: string
      description: string
      content: string
      difficulty: number
      points: number
      fun_fact: string
    }>({
      system: SYSTEM_BASE,
      prompt: `${lessonCtx}\n\n${MICRO_CHALLENGE_PROMPT}`,
      model: 'fast',
      maxTokens: 1500,
    })

    const { data: inserted, error: insertError } = await (ctx.supabase as any)
      .from('alpha_queue')
      .insert({
        tenant_id: ctx.tenantId,
        user_id: ctx.userId,
        source_type: lesson ? 'lesson' : 'ai_generated',
        source_id: lesson?.id || null,
        item_type: 'micro_challenge',
        title: result.title || 'Desafio do Dia',
        description: result.description,
        content: result.content + (result.fun_fact ? `\n\n**Curiosidade:** ${result.fun_fact}` : ''),
        difficulty: Math.min(5, Math.max(1, result.difficulty || 3)),
        points_reward: Math.min(15, Math.max(5, result.points || 10)),
        priority: 100, // Daily challenge gets high priority
        status: 'pending',
        expires_at: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString(), // expires in 24h
      })
      .select('id')
      .single()

    if (insertError) return databaseError(insertError.message)

    revalidatePath('/lessons/alpha')
    return successResponse(inserted, 'Desafio do dia gerado!')
  } catch (e: any) {
    console.error('Daily challenge error:', e)
    return databaseError(e.message || 'Erro ao gerar desafio diário')
  }
}
