/**
 * Hooks para navegação dinâmica baseada no role do usuário.
 * Dados vêm do banco via PermissionsProvider.
 */

import { usePermissions } from '@/app/providers/PermissionsProvider'
import type { NavigationItem, NavigationGroup } from '@/lib/types/rbac'

/** Retorna itens de navegação flat do role atual */
export function useNavigation(): NavigationItem[] {
  const { navigation } = usePermissions()
  return navigation
}

/** Retorna navegação agrupada do role atual */
export function useNavigationGroups(): NavigationGroup[] {
  const { navigationGroups } = usePermissions()
  return navigationGroups
}
