/**
 * Hooks de conveniência para o sistema RBAC.
 * Re-exporta usePermissions do Provider + hooks utilitários.
 */

export { usePermissions } from '@/app/providers/PermissionsProvider'

import { usePermissions } from '@/app/providers/PermissionsProvider'
import type { RoleConfig } from '@/lib/types/rbac'

/** Retorna true se o usuário tem a permissão */
export function useHasPermission(slug: string): boolean {
  const { hasPermission, loading } = usePermissions()
  if (loading) return false
  return hasPermission(slug)
}

/** Retorna o RoleConfig do usuário atual */
export function useRole(): RoleConfig | null {
  const { role } = usePermissions()
  return role
}

/** Retorna true se o role do usuário é o slug especificado */
export function useIsRole(slug: string): boolean {
  const { role } = usePermissions()
  return role?.slug === slug
}
