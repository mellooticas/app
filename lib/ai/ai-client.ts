import OpenAI from 'openai'

// =============================================
// Provider-agnostic AI client
// Swap implementation here to change providers
// =============================================

const MODEL_FAST = process.env.AI_MODEL_FAST || 'gpt-4o-mini'
const MODEL_SMART = process.env.AI_MODEL_SMART || 'gpt-4o'

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

/**
 * Generate text completion from AI
 */
export async function generateText(opts: GenerateTextOptions): Promise<string> {
  const client = getClient()
  const modelId = opts.model === 'smart' ? MODEL_SMART : MODEL_FAST

  const response = await client.chat.completions.create({
    model: modelId,
    messages: [
      { role: 'system', content: opts.system },
      { role: 'user', content: opts.prompt },
    ],
    max_tokens: opts.maxTokens ?? 4096,
    temperature: opts.temperature ?? 0.7,
  })

  return response.choices[0]?.message?.content ?? ''
}

/**
 * Generate structured JSON from AI
 */
export async function generateJSON<T = any>(opts: GenerateJSONOptions<T>): Promise<T> {
  const client = getClient()
  const modelId = opts.model === 'smart' ? MODEL_SMART : MODEL_FAST

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
  return JSON.parse(raw) as T
}
