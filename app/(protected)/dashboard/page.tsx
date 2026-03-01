'use client'

import { RoleView } from '@/components/auth/RoleView'
import { AdminDashboard } from '@/components/dashboard/AdminDashboard'
import { TeacherDashboard } from '@/components/dashboard/TeacherDashboard'
import { StudentDashboard } from '@/components/dashboard/StudentDashboard'

export default function DashboardPage() {
  return (
    <RoleView
      admin={<AdminDashboard />}
      teacher={<TeacherDashboard />}
      student={<StudentDashboard />}
    />
  )
}
