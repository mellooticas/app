'use client'

import { type ReactNode } from 'react'
import { usePermissions } from '@/app/providers/PermissionsProvider'
import type { UserRole } from '@/lib/types/rbac'

interface RoleViewProps {
  admin?: ReactNode
  teacher?: ReactNode
  student?: ReactNode
  fallback?: ReactNode
}

/**
 * Renders different UI per role.
 *
 * Usage:
 *   <RoleView
 *     admin={<AdminTable data={data} />}
 *     teacher={<TeacherCards data={data} />}
 *     student={<StudentView data={data} />}
 *   />
 */
export function RoleView({
  admin,
  teacher,
  student,
  fallback = null,
}: RoleViewProps) {
  const { role, loading } = usePermissions()

  if (loading || !role) return <>{fallback}</>

  const views: Record<UserRole, ReactNode | undefined> = {
    admin,
    teacher,
    student,
  }

  return <>{views[role.slug] ?? fallback}</>
}
