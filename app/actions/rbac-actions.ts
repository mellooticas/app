'use server'

import { createClient } from '@/lib/supabase/server'
import {
  successResponse,
  unauthorizedError,
  databaseError,
} from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'
import type { UserRBAC, RoleConfig, NavigationItem } from '@/lib/types/rbac'

/**
 * Loads role config, permissions and navigation for the current user.
 * A single RPC call returns everything needed for the PermissionsProvider.
 * The RPC reads tenant_id and user_id from the JWT - no params needed.
 */
export async function loadUserRBAC(): Promise<ActionResult<UserRBAC>> {
  try {
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()

    if (authError || !user) {
      return unauthorizedError()
    }

    const { data, error } = await supabase.rpc('rpc_get_user_rbac')

    if (error) {
      return databaseError(`Failed to load permissions: ${error.message}`)
    }

    if (!data?.role) {
      return databaseError('No role found for this user')
    }

    return successResponse({
      role: data.role as RoleConfig,
      permissions: (data.permissions || []) as string[],
      navigation: (data.navigation || []) as NavigationItem[],
    })
  } catch (err) {
    const message = err instanceof Error ? err.message : 'Unexpected error'
    return databaseError(message)
  }
}
