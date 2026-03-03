/**
 * AI Rate Limiter & Quota Check
 *
 * Checks tenant and user quotas before making AI API calls.
 * Uses rpc_check_ai_quota for server-side enforcement.
 */

import { createClient } from '@/lib/supabase/server'

export interface QuotaCheckResult {
  allowed: boolean
  reason?: string
  current?: number
  limit?: number
}

/**
 * Check if an AI call is allowed for the given tenant/user.
 * Returns { allowed: true } if quotas are not exceeded.
 */
export async function checkAIQuota(
  tenantId: string,
  userId: string
): Promise<QuotaCheckResult> {
  try {
    const supabase = await createClient()
    const { data, error } = await (supabase as any).rpc('rpc_check_ai_quota', {
      p_tenant_id: tenantId,
      p_user_id: userId,
    })

    if (error) {
      // On error, allow the call (fail-open) — log issue but don't block
      console.error('Quota check error:', error.message)
      return { allowed: true }
    }

    return data as QuotaCheckResult
  } catch (e) {
    console.error('Quota check exception:', e)
    return { allowed: true }
  }
}

/**
 * Quota reason messages in Portuguese
 */
export function getQuotaMessage(reason: string): string {
  const messages: Record<string, string> = {
    daily_token_limit: 'Limite diário de tokens IA atingido para o tenant',
    monthly_token_limit: 'Limite mensal de tokens IA atingido para o tenant',
    daily_request_limit: 'Limite diário de requisições IA atingido',
    monthly_request_limit: 'Limite mensal de requisições IA atingido',
    user_daily_limit: 'Seu limite diário de requisições IA foi atingido',
    no_quota_configured: '',
  }
  return messages[reason] || 'Limite de uso IA atingido'
}
