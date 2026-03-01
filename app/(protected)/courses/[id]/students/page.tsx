'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { Users, ArrowLeft, User, Plus, Search } from 'lucide-react'
import Link from 'next/link'

export default function CourseStudentsPage() {
  const { id } = useParams<{ id: string }>()
  const [students, setStudents] = useState<any[]>([])
  const [courseName, setCourseName] = useState('')
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')

  useEffect(() => {
    async function load() {
      try {
        const { data: course } = await supabase.from('v_courses').select('name').eq('id', id).single()
        if (course) setCourseName((course as any).name)

        const { data: enrollments } = await supabase.from('v_enrollments').select('*').eq('course_id', id).order('student_name')
        if (enrollments) setStudents(enrollments)
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  const filtered = students.filter(s =>
    (s.student_name || '').toLowerCase().includes(search.toLowerCase())
  )

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <Link href={`/courses/${id}`} className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
          <ArrowLeft className="w-4 h-4" /> Voltar à Turma
        </Link>
        <button className="flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-xl font-bold text-sm hover:bg-blue-700 transition-colors">
          <Plus className="w-4 h-4" /> Matricular Aluno
        </button>
      </div>

      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Users className="w-6 h-6 text-blue-500" />
        Alunos — {courseName}
      </h1>

      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
        <input
          type="text"
          value={search}
          onChange={e => setSearch(e.target.value)}
          placeholder="Buscar aluno..."
          className="w-full pl-10 pr-4 py-3 bg-white border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-blue-200"
        />
      </div>

      {loading ? (
        <div className="space-y-3">{[1, 2, 3].map(i => <div key={i} className="h-16 bg-gray-200 rounded-xl animate-pulse" />)}</div>
      ) : (
        <div className="bg-white rounded-xl border border-gray-100 divide-y divide-gray-50">
          {filtered.map((s: any) => (
            <Link key={s.id} href={`/students/${s.student_id}`} className="p-4 flex items-center gap-4 hover:bg-gray-50 transition-colors">
              <div className="w-10 h-10 bg-blue-50 rounded-full flex items-center justify-center">
                <User className="w-5 h-5 text-blue-400" />
              </div>
              <div className="flex-1">
                <p className="font-bold text-sm text-gray-900">{s.student_name}</p>
                <p className="text-xs text-gray-400">Matriculado em {new Date(s.enrolled_at || s.created_at).toLocaleDateString('pt-BR')}</p>
              </div>
              <span className={`px-2 py-1 rounded text-xs font-bold ${s.status === 'active' ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-600'}`}>
                {s.status === 'active' ? 'Ativo' : s.status}
              </span>
            </Link>
          ))}
        </div>
      )}
    </div>
  )
}
