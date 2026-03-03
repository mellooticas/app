/**
 * Client-side feature flag hook.
 * Fetches feature flags from Supabase and caches with React Query.
 */

'use client'

import { useQuery } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase/client'

interface FeatureFlags {
  flags: Record<string, boolean>
  isLoading: boolean
  isEnabled: (key: string) => boolean
}

export function useFeatureFlags(): FeatureFlags {
  const { data: flags = {}, isLoading } = useQuery({
    queryKey: ['feature-flags'],
    queryFn: async () => {
      const { data } = await (supabase as any)
        .from('feature_flags')
        .select('flag_key, is_enabled')

      if (!data) return {}

      const result: Record<string, boolean> = {}
      for (const row of data) {
        result[row.flag_key] = row.is_enabled
      }
      return result
    },
    staleTime: 5 * 60 * 1000, // Cache for 5 minutes
    refetchOnWindowFocus: false,
  })

  return {
    flags,
    isLoading,
    isEnabled: (key: string) => flags[key] === true,
  }
}
