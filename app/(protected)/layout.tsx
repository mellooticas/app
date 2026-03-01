'use client'

import { PermissionsProvider } from '@/app/providers/PermissionsProvider'
import OrientalDashboardLayout from '@/components/layouts/OrientalDashboardLayout'

export default function ProtectedLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <PermissionsProvider>
      <OrientalDashboardLayout>
        {children}
      </OrientalDashboardLayout>
    </PermissionsProvider>
  )
}
