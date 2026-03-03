/**
 * Feature Flags — Server-side check for tenant feature access.
 * Uses the feature_flags table (core.feature_flags) to control
 * which modules are enabled per tenant during the pilot.
 */

import { createClient } from '@/lib/supabase/server'

/**
 * Check if a feature flag is enabled for the current tenant.
 * Returns false if the flag doesn't exist or tenant is not resolved.
 */
export async function isFeatureEnabled(flagKey: string): Promise<boolean> {
  try {
    const supabase = await createClient()
    const { data } = await (supabase as any)
      .from('feature_flags')
      .select('is_enabled')
      .eq('flag_key', flagKey)
      .single()

    return data?.is_enabled === true
  } catch {
    return false
  }
}

/**
 * Get all feature flags for the current tenant as a Record.
 * Useful for passing to the client in a single query.
 */
export async function getFeatureFlags(): Promise<Record<string, boolean>> {
  try {
    const supabase = await createClient()
    const { data } = await (supabase as any)
      .from('feature_flags')
      .select('flag_key, is_enabled')

    if (!data) return {}

    const flags: Record<string, boolean> = {}
    for (const row of data) {
      flags[row.flag_key] = row.is_enabled
    }
    return flags
  } catch {
    return {}
  }
}
