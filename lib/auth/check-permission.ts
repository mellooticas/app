/**
 * Server-side permission checks
 *
 * Usage in server components and server actions:
 *   await requirePermission('lessons.create')
 *   const canEdit = await checkPermission('lessons.edit')
 *   const role = await getUserRole()
 */

import { createClient } from '@/lib/supabase/server'
import type { UserRole } from '@/lib/types/rbac'

/**
 * Check if the current user has a specific permission.
 * Uses rpc_get_user_rbac() which reads from JWT claims.
 */
export async function checkPermission(permissionSlug: string): Promise<boolean> {
  try {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return false

    const { data } = await supabase.rpc('rpc_get_user_rbac')
    if (!data?.permissions) return false

    const permissions = data.permissions as string[]
    return permissions.includes(permissionSlug)
  } catch {
    return false
  }
}

/**
 * Require a permission - throws if not authorized.
 * Replaces checkAdminAccess() with granularity.
 */
export async function requirePermission(permissionSlug: string): Promise<void> {
  const allowed = await checkPermission(permissionSlug)
  if (!allowed) {
    throw new Error(`Permission required: ${permissionSlug}`)
  }
}

/**
 * Returns the role slug of the current user from JWT claims.
 */
export async function getUserRole(): Promise<UserRole | null> {
  try {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return null

    const { data } = await supabase.rpc('rpc_get_user_rbac')
    if (!data?.role) return null

    return (data.role as { slug: string }).slug as UserRole
  } catch {
    return null
  }
}
