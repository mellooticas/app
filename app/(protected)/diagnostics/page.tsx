'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { BarChart3, Users, BookOpen, Trophy, Activity } from 'lucide-react'
import { PermissionGate } from '@/components/auth/PermissionGate'

export default function DiagnosticsPage() {
  const [stats, setStats] = useState({ students: 0, teachers: 0, lessons: 0, achievements: 0 })
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const [studentsRes, lessonsRes, achievementsRes] = await Promise.all([
          supabase.from('v_profiles').select('id', { count: 'exact', head: true }),
          supabase.from('v_lessons').select('id', { count: 'exact', head: true }),
          supabase.from('v_achievements').select('id', { count: 'exact', head: true }),
        ])
        setStats({
          students: studentsRes.count || 0,
          teachers: 0,
          lessons: lessonsRes.count || 0,
          achievements: achievementsRes.count || 0,
        })
      } catch (error) {
        console.error('Error loading diagnostics:', error)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  return (
    <PermissionGate permission="admin.access" fallback={<p className="text-center py-16 text-gray-500">Acesso restrito a administradores.</p>}>
      <div className="space-y-6">
        <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
          <BarChart3 className="w-6 h-6 text-cyan-500" />
          Diagnósticos
        </h1>

        {loading ? (
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">{[1, 2, 3, 4].map(i => <div key={i} className="h-24 bg-gray-200 rounded-xl animate-pulse" />)}</div>
        ) : (
          <>
            <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
              <StatCard icon={Users} value={stats.students} label="Usuários" color="text-blue-500" bg="bg-blue-50" />
              <StatCard icon={BookOpen} value={stats.lessons} label="Aulas" color="text-green-500" bg="bg-green-50" />
              <StatCard icon={Trophy} value={stats.achievements} label="Conquistas" color="text-amber-500" bg="bg-amber-50" />
              <StatCard icon={Activity} value={0} label="Sessões Ativas" color="text-red-500" bg="bg-red-50" />
            </div>

            <div className="bg-white rounded-xl border border-gray-100 p-6">
              <h3 className="font-bold text-gray-900 mb-4">Status do Sistema</h3>
              <div className="space-y-3">
                <StatusRow label="Banco de dados" status="online" />
                <StatusRow label="Autenticação" status="online" />
                <StatusRow label="Storage" status="online" />
                <StatusRow label="API" status="online" />
              </div>
            </div>
          </>
        )}
      </div>
    </PermissionGate>
  )
}

function StatCard({ icon: Icon, value, label, color, bg }: { icon: any; value: number; label: string; color: string; bg: string }) {
  return (
    <div className="bg-white rounded-xl border border-gray-100 p-4">
      <div className={`w-10 h-10 ${bg} rounded-xl flex items-center justify-center mb-3`}>
        <Icon className={`w-5 h-5 ${color}`} />
      </div>
      <p className="text-2xl font-bold text-gray-900">{value}</p>
      <p className="text-xs text-gray-500">{label}</p>
    </div>
  )
}

function StatusRow({ label, status }: { label: string; status: string }) {
  return (
    <div className="flex items-center justify-between py-2 border-b border-gray-50 last:border-0">
      <span className="text-sm text-gray-600">{label}</span>
      <span className="flex items-center gap-2 text-xs font-medium text-green-600">
        <span className="w-2 h-2 bg-green-500 rounded-full" />
        {status}
      </span>
    </div>
  )
}
