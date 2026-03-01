import { createClient } from '@/lib/supabase/server'

export interface ActionContext {
  supabase: Awaited<ReturnType<typeof createClient>>
  userId: string
  tenantId: string
}

/**
 * Get authenticated user context with tenant_id from JWT.
 * Returns null if not authenticated or tenant_id missing.
 *
 * Usage in server actions:
 *   const ctx = await getActionContext()
 *   if (!ctx) return unauthorizedError()
 *   const { supabase, userId, tenantId } = ctx
 */
export async function getActionContext(): Promise<ActionContext | null> {
  const supabase = await createClient()
  const { data: { user }, error } = await supabase.auth.getUser()
  if (error || !user) return null

  const { data: { session } } = await supabase.auth.getSession()
  if (!session?.access_token) return null

  const claims = JSON.parse(atob(session.access_token.split('.')[1]))
  const tenantId: string | null = claims.tenant_id || null

  if (!tenantId) return null

  return { supabase, userId: user.id, tenantId }
}
