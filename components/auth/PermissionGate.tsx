'use client'

import { type ReactNode } from 'react'
import { usePermissions } from '@/app/providers/PermissionsProvider'

interface PermissionGateProps {
  /** Permissão única requerida */
  permission?: string
  /** Pelo menos uma dessas permissões */
  anyPermission?: string[]
  /** Todas essas permissões */
  allPermissions?: string[]
  /** Conteúdo exibido quando não tem permissão */
  fallback?: ReactNode
  children: ReactNode
}

/**
 * Renderiza children somente se o usuário tem a permissão.
 *
 * Uso:
 *   <PermissionGate permission="aulas.create">
 *     <Button>Nova Aula</Button>
 *   </PermissionGate>
 *
 *   <PermissionGate anyPermission={['aulas.edit', 'aulas.delete']}>
 *     <ActionsMenu />
 *   </PermissionGate>
 */
export function PermissionGate({
  permission,
  anyPermission,
  allPermissions,
  fallback = null,
  children,
}: PermissionGateProps) {
  const { hasPermission, hasAnyPermission, hasAllPermissions, loading } =
    usePermissions()

  if (loading) return null

  let allowed = false

  if (permission) {
    allowed = hasPermission(permission)
  } else if (anyPermission) {
    allowed = hasAnyPermission(...anyPermission)
  } else if (allPermissions) {
    allowed = hasAllPermissions(...allPermissions)
  } else {
    // Nenhuma permissão especificada = sempre exibe
    allowed = true
  }

  return allowed ? <>{children}</> : <>{fallback}</>
}
