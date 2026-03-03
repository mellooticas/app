import OpenAI from 'openai'

// =============================================
// Provider-agnostic AI client with usage logging
// Swap implementation here to change providers
// =============================================

const MODEL_FAST = process.env.AI_MODEL_FAST || 'gpt-4o-mini'
const MODEL_SMART = process.env.AI_MODEL_SMART || 'gpt-4o'

// Cost per 1M tokens (USD)
const COST_TABLE: Record<string, { input: number; output: number }> = {
  'gpt-4o-mini': { input: 0.15, output: 0.60 },
  'gpt-4o': { input: 2.50, output: 10.00 },
}

let _client: OpenAI | null = null

function getClient(): OpenAI {
  if (!_client) {
    const apiKey = process.env.OPENAI_API_KEY
    if (!apiKey) throw new Error('OPENAI_API_KEY not set')
    _client = new OpenAI({ apiKey })
  }
  return _client
}

export type AIModel = 'fast' | 'smart'

interface GenerateTextOptions {
  system: string
  prompt: string
  model?: AIModel
  maxTokens?: number
  temperature?: number
}

interface GenerateJSONOptions<T> extends GenerateTextOptions {
  schema?: { name: string; description: string }
}

/** Context for logging AI usage — passed from server actions */
export interface AICallContext {
  tenantId: string
  userId: string
  actionName: string
}

function estimateCost(modelId: string, promptTokens: number, completionTokens: number): number {
  const costs = COST_TABLE[modelId] || COST_TABLE['gpt-4o-mini']
  return (promptTokens * costs.input + completionTokens * costs.output) / 1_000_000
}

async function logAIUsage(params: {
  tenantId: string; userId: string; actionName: string; aiModel: string
  promptTokens: number; completionTokens: number; totalTokens: number
  estimatedCostUsd: number; durationMs: number
  status: 'success' | 'error' | 'rate_limited'; errorMessage?: string
}): Promise<void> {
  try {
    const { adminSupabase } = await import('@/lib/supabase/admin-client')
    await (adminSupabase as any).from('core.ai_usage_log').insert({
      tenant_id: params.tenantId, user_id: params.userId,
      action_name: params.actionName, ai_model: params.aiModel,
      prompt_tokens: params.promptTokens, completion_tokens: params.completionTokens,
      total_tokens: params.totalTokens, estimated_cost_usd: params.estimatedCostUsd,
      duration_ms: params.durationMs, status: params.status,
      error_message: params.errorMessage || null,
    })
  } catch (e) {
    console.error('Failed to log AI usage:', e)
  }
}

/**
 * Generate text completion from AI
 * @param ctx - Optional context for usage logging and quota enforcement
 */
export async function generateText(opts: GenerateTextOptions, ctx?: AICallContext): Promise<string> {
  const client = getClient()
  const modelId = opts.model === 'smart' ? MODEL_SMART : MODEL_FAST
  const startTime = Date.now()

  try {
    if (ctx) {
      const { checkAIQuota, getQuotaMessage } = await import('@/lib/ai/rate-limiter')
      const quota = await checkAIQuota(ctx.tenantId, ctx.userId)
      if (!quota.allowed) {
        const reason = getQuotaMessage(quota.reason || '')
        logAIUsage({ ...ctx, aiModel: modelId, promptTokens: 0, completionTokens: 0,
          totalTokens: 0, estimatedCostUsd: 0, durationMs: Date.now() - startTime,
          status: 'rate_limited', errorMessage: reason }).catch(() => {})
        throw new Error(`RATE_LIMITED: ${reason}`)
      }
    }

    const response = await client.chat.completions.create({
      model: modelId,
      messages: [
        { role: 'system', content: opts.system },
        { role: 'user', content: opts.prompt },
      ],
      max_tokens: opts.maxTokens ?? 4096,
      temperature: opts.temperature ?? 0.7,
    })

    const content = response.choices[0]?.message?.content ?? ''
    if (ctx && response.usage) {
      const u = response.usage
      logAIUsage({ ...ctx, aiModel: modelId, promptTokens: u.prompt_tokens,
        completionTokens: u.completion_tokens, totalTokens: u.total_tokens,
        estimatedCostUsd: estimateCost(modelId, u.prompt_tokens, u.completion_tokens),
        durationMs: Date.now() - startTime, status: 'success' }).catch(() => {})
    }
    return content
  } catch (e) {
    if (ctx && !(e instanceof Error && e.message.startsWith('RATE_LIMITED'))) {
      logAIUsage({ ...ctx, aiModel: modelId, promptTokens: 0, completionTokens: 0,
        totalTokens: 0, estimatedCostUsd: 0, durationMs: Date.now() - startTime,
        status: 'error', errorMessage: e instanceof Error ? e.message : 'Unknown' }).catch(() => {})
    }
    throw e
  }
}

/**
 * Generate structured JSON from AI
 * @param ctx - Optional context for usage logging and quota enforcement
 */
export async function generateJSON<T = any>(opts: GenerateJSONOptions<T>, ctx?: AICallContext): Promise<T> {
  const client = getClient()
  const modelId = opts.model === 'smart' ? MODEL_SMART : MODEL_FAST
  const startTime = Date.now()

  try {
    if (ctx) {
      const { checkAIQuota, getQuotaMessage } = await import('@/lib/ai/rate-limiter')
      const quota = await checkAIQuota(ctx.tenantId, ctx.userId)
      if (!quota.allowed) {
        const reason = getQuotaMessage(quota.reason || '')
        logAIUsage({ ...ctx, aiModel: modelId, promptTokens: 0, completionTokens: 0,
          totalTokens: 0, estimatedCostUsd: 0, durationMs: Date.now() - startTime,
          status: 'rate_limited', errorMessage: reason }).catch(() => {})
        throw new Error(`RATE_LIMITED: ${reason}`)
      }
    }

    const response = await client.chat.completions.create({
      model: modelId,
      messages: [
        { role: 'system', content: opts.system + '\n\nResponda SOMENTE em JSON válido, sem markdown ou texto extra.' },
        { role: 'user', content: opts.prompt },
      ],
      max_tokens: opts.maxTokens ?? 4096,
      temperature: opts.temperature ?? 0.5,
      response_format: { type: 'json_object' },
    })

    const raw = response.choices[0]?.message?.content ?? '{}'
    if (ctx && response.usage) {
      const u = response.usage
      logAIUsage({ ...ctx, aiModel: modelId, promptTokens: u.prompt_tokens,
        completionTokens: u.completion_tokens, totalTokens: u.total_tokens,
        estimatedCostUsd: estimateCost(modelId, u.prompt_tokens, u.completion_tokens),
        durationMs: Date.now() - startTime, status: 'success' }).catch(() => {})
    }
    return JSON.parse(raw) as T
  } catch (e) {
    if (ctx && !(e instanceof Error && e.message.startsWith('RATE_LIMITED'))) {
      logAIUsage({ ...ctx, aiModel: modelId, promptTokens: 0, completionTokens: 0,
        totalTokens: 0, estimatedCostUsd: 0, durationMs: Date.now() - startTime,
        status: 'error', errorMessage: e instanceof Error ? e.message : 'Unknown' }).catch(() => {})
    }
    throw e
  }
}
