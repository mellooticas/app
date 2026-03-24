'use client'

import { useEffect, useState, useCallback } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { Calendar, ArrowLeft, Check, X, User, Loader2, CheckCircle } from 'lucide-react'
import Link from 'next/link'
import { recordAttendance } from '@/app/actions/course-actions'

export default function AttendancePage() {
  const { id } = useParams<{ id: string }>()
  const [students, setStudents] = useState<any[]>([])
  const [courseName, setCourseName] = useState('')
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [saved, setSaved] = useState(false)
  const [selectedDate, setSelectedDate] = useState(new Date().toISOString().split('T')[0])

  const loadAttendance = useCallback(async (date: string) => {
    if (!id) return
    setLoading(true)
    try {
      const [courseRes, enrollmentsRes, attendanceRes] = await Promise.all([
        supabase.from('v_courses').select('name').eq('id', id).single(),
        supabase.from('v_enrollments').select('*').eq('course_id', id).eq('status', 'active').order('student_name'),
        supabase.from('attendance').select('student_id, is_present').eq('course_id', id).eq('date', date),
      ])

      if (courseRes.data) setCourseName((courseRes.data as any).name)

      if (enrollmentsRes.data) {
        const existingMap = new Map((attendanceRes.data || []).map((a: any) => [a.student_id, a.is_present]))
        setStudents(enrollmentsRes.data.map((s: any) => ({
          ...s,
          present: existingMap.has(s.student_id) ? existingMap.get(s.student_id) : false,
        })))
      }
    } catch (error) {
      console.error('Error:', error)
    } finally {
      setLoading(false)
    }
  }, [id])

  useEffect(() => {
    loadAttendance(selectedDate)
    setSaved(false)
  }, [loadAttendance, selectedDate])

  const togglePresence = (studentId: string) => {
    setSaved(false)
    setStudents(prev => prev.map(s =>
      s.student_id === studentId ? { ...s, present: !s.present } : s
    ))
  }

  const handleSave = async () => {
    setSaving(true)
    const result = await recordAttendance({
      course_id: id,
      date: selectedDate,
      records: students.map(s => ({
        student_id: s.student_id,
        is_present: s.present,
      })),
    })
    setSaving(false)
    if (!('error' in result)) {
      setSaved(true)
      setTimeout(() => setSaved(false), 3000)
    }
  }

  const presentCount = students.filter(s => s.present).length

  return (
    <div className="space-y-6">
      <Link href={`/courses/${id}`} className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar à Turma
      </Link>

      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
          <Calendar className="w-6 h-6 text-green-500" />
          Frequência — {courseName}
        </h1>
        <input
          type="date"
          value={selectedDate}
          onChange={e => setSelectedDate(e.target.value)}
          className="px-4 py-2 border border-gray-200 rounded-xl text-sm"
        />
      </div>

      <div className="flex items-center gap-4 text-sm text-gray-500">
        <span className="flex items-center gap-1"><Check className="w-4 h-4 text-green-500" /> Presentes: {presentCount}</span>
        <span className="flex items-center gap-1"><X className="w-4 h-4 text-red-500" /> Ausentes: {students.length - presentCount}</span>
      </div>

      {loading ? (
        <div className="space-y-3">{[1, 2, 3].map(i => <div key={i} className="h-16 bg-gray-200 rounded-xl animate-pulse" />)}</div>
      ) : (
        <>
          <div className="bg-white rounded-xl border border-gray-100 divide-y divide-gray-50">
            {students.map((s: any) => (
              <button
                key={s.student_id}
                onClick={() => togglePresence(s.student_id)}
                className="w-full p-4 flex items-center gap-4 hover:bg-gray-50 transition-colors text-left"
              >
                <div className={`w-10 h-10 rounded-full flex items-center justify-center transition-colors ${s.present ? 'bg-green-100' : 'bg-gray-100'}`}>
                  {s.present ? <Check className="w-5 h-5 text-green-600" /> : <User className="w-5 h-5 text-gray-400" />}
                </div>
                <p className="font-bold text-sm text-gray-900 flex-1">{s.student_name}</p>
                <span className={`px-3 py-1 rounded-full text-xs font-bold ${s.present ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                  {s.present ? 'Presente' : 'Ausente'}
                </span>
              </button>
            ))}
          </div>

          <button
            onClick={handleSave}
            disabled={saving || saved}
            className={`w-full py-3 rounded-xl font-bold transition-colors flex items-center justify-center gap-2 ${
              saved
                ? 'bg-green-100 text-green-700'
                : 'bg-green-600 text-white hover:bg-green-700'
            }`}
          >
            {saving ? (
              <><Loader2 className="w-4 h-4 animate-spin" /> Salvando...</>
            ) : saved ? (
              <><CheckCircle className="w-4 h-4" /> Frequência Salva!</>
            ) : (
              'Salvar Frequência'
            )}
          </button>
        </>
      )}
    </div>
  )
}
