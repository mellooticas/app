'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { Users, ArrowLeft, BookOpen, Calendar, User, Settings } from 'lucide-react'
import Link from 'next/link'
import { RoleView } from '@/components/auth/RoleView'
import type { Tables } from '@/lib/supabase/database.types'

type Course = Tables<'v_courses'>

export default function CourseDetailPage() {
  const { id } = useParams<{ id: string }>()
  const [course, setCourse] = useState<Course | null>(null)
  const [students, setStudents] = useState<any[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const { data: c } = await supabase.from('v_courses').select('*').eq('id', id).single()
        if (c) setCourse(c as Course)

        const { data: enrollments } = await supabase.from('v_enrollments').select('*').eq('course_id', id)
        if (enrollments) setStudents(enrollments)
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  if (loading) return <div className="space-y-6 animate-pulse"><div className="h-48 bg-gray-200 rounded-2xl" /><div className="h-64 bg-gray-200 rounded-2xl" /></div>
  if (!course) return <div className="text-center py-16"><p className="text-gray-500">Turma não encontrada.</p><Link href="/courses" className="text-blue-600 hover:underline mt-4 inline-block">Voltar</Link></div>

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <Link href="/courses" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
          <ArrowLeft className="w-4 h-4" /> Voltar às Turmas
        </Link>
        <div className="flex gap-2">
          <Link href={`/courses/${id}/students`} className="px-4 py-2 bg-blue-600 text-white rounded-xl font-bold text-sm hover:bg-blue-700 transition-colors flex items-center gap-2">
            <Users className="w-4 h-4" /> Alunos
          </Link>
          <Link href={`/courses/${id}/attendance`} className="px-4 py-2 bg-green-600 text-white rounded-xl font-bold text-sm hover:bg-green-700 transition-colors flex items-center gap-2">
            <Calendar className="w-4 h-4" /> Frequência
          </Link>
        </div>
      </div>

      <div className="bg-gradient-to-r from-blue-500 to-indigo-600 rounded-2xl p-8 text-white shadow-xl">
        <h1 className="text-2xl font-bold">{course.name}</h1>
        <div className="flex items-center gap-4 mt-3 text-blue-100 text-sm">
          {course.teacher_name && <span className="flex items-center gap-1"><User className="w-4 h-4" />{course.teacher_name}</span>}
          {course.instrument_name && <span className="flex items-center gap-1"><BookOpen className="w-4 h-4" />{course.instrument_name}</span>}
          {course.level && <span className="bg-white/20 px-3 py-1 rounded-full text-xs font-bold">{course.level}</span>}
        </div>
        <div className="mt-4">
          <span className="text-2xl font-bold">{course.active_students || 0}</span>
          <span className="text-blue-200 ml-2">alunos matriculados</span>
        </div>
      </div>

      {students.length > 0 && (
        <div>
          <h2 className="text-lg font-bold text-gray-900 mb-4">Alunos da Turma</h2>
          <div className="bg-white rounded-xl border border-gray-100 divide-y divide-gray-50">
            {students.map((s: any) => (
              <Link key={s.id} href={`/students/${s.student_id}`} className="p-4 flex items-center gap-4 hover:bg-gray-50 transition-colors">
                <div className="w-10 h-10 bg-blue-50 rounded-full flex items-center justify-center">
                  <User className="w-5 h-5 text-blue-400" />
                </div>
                <div className="flex-1">
                  <p className="font-bold text-sm text-gray-900">{s.student_name}</p>
                  <p className="text-xs text-gray-400">{s.status === 'active' ? 'Ativo' : s.status}</p>
                </div>
              </Link>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}
