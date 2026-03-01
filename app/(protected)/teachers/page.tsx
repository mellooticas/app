'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { PermissionGate } from '@/components/auth/PermissionGate'
import { GraduationCap, Search, ChevronRight } from 'lucide-react'
import Link from 'next/link'
import type { Tables } from '@/lib/supabase/database.types'

type Profile = Tables<'v_profiles'>

export default function TeachersPage() {
  const [teachers, setTeachers] = useState<Profile[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')

  useEffect(() => {
    async function load() {
      try {
        const { data } = await supabase
          .from('v_profiles')
          .select('*')
          .order('full_name')
        if (data) {
          const teacherProfiles = data.filter((p: any) => {
            const roles = p.roles as any[]
            return roles?.some((r: any) => r.slug === 'teacher')
          })
          setTeachers(teacherProfiles as Profile[])
        }
      } catch (error) {
        console.error('Error loading teachers:', error)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  const filtered = teachers.filter(t =>
    (t.full_name || '').toLowerCase().includes(search.toLowerCase())
  )

  return (
    <PermissionGate permission="teachers.manage" fallback={<div className="text-center py-16"><p className="text-gray-500">Sem permissão para ver professores.</p></div>}>
      <div className="space-y-6">
        <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
          <GraduationCap className="w-6 h-6 text-blue-500" />
          Professores
        </h1>

        <div className="relative">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
          <input
            type="text"
            value={search}
            onChange={e => setSearch(e.target.value)}
            placeholder="Buscar professores..."
            className="w-full pl-10 pr-4 py-3 bg-white border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-blue-200"
          />
        </div>

        {loading ? (
          <div className="space-y-2">
            {[1, 2, 3].map(i => (
              <div key={i} className="h-14 bg-gray-200 rounded-xl animate-pulse" />
            ))}
          </div>
        ) : (
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm overflow-hidden">
            {filtered.map(teacher => (
              <Link
                key={teacher.id}
                href={`/teachers/${teacher.user_id}`}
                className="flex items-center gap-4 px-4 py-3 hover:bg-gray-50 transition-colors border-b border-gray-50 last:border-0 group"
              >
                <div className="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600 font-bold flex-shrink-0">
                  {teacher.avatar_url ? (
                    <img src={teacher.avatar_url} alt="" className="w-10 h-10 rounded-full object-cover" />
                  ) : (
                    teacher.full_name?.[0] || '?'
                  )}
                </div>
                <div className="flex-1 min-w-0">
                  <p className="font-bold text-sm text-gray-900">{teacher.full_name}</p>
                  <p className="text-xs text-gray-400">{teacher.unit_name || 'Sem unidade'}</p>
                </div>
                <ChevronRight className="w-4 h-4 text-gray-300 group-hover:text-blue-500 transition-colors" />
              </Link>
            ))}
            {filtered.length === 0 && (
              <div className="p-8 text-center text-sm text-gray-500">Nenhum professor encontrado.</div>
            )}
          </div>
        )}
      </div>
    </PermissionGate>
  )
}
