'use client'

import { useEffect, useState, useMemo } from 'react'
import { supabase } from '@/lib/supabase/client'
import { Leaf, ChevronRight, Calendar, CheckCircle, ArrowLeft, BookOpen, Lock } from 'lucide-react'
import Link from 'next/link'
import { LESSON_LEVELS, STATUS_LABELS, STATUS_COLORS, LEVEL_COLORS } from '@/lib/lessons/constants'
import type { Tables } from '@/lib/supabase/database.types'

type Lesson = Tables<'v_lessons'>
type LessonProgress = Tables<'v_lesson_progress'>

const LEVEL = LESSON_LEVELS.intermediario
const COLORS = LEVEL_COLORS.yellow

export default function IntermediarioPage() {
  const [lessons, setLessons] = useState<Lesson[]>([])
  const [progress, setProgress] = useState<LessonProgress[]>([])
  const [loading, setLoading] = useState(true)
  const [totalCompleted, setTotalCompleted] = useState(0)

  useEffect(() => {
    async function load() {
      try {
        const { data: { user } } = await supabase.auth.getUser()
        const [lessonsRes, progressRes] = await Promise.all([
          supabase.from('v_lessons').select('*').in('number', LEVEL.numbers).order('number'),
          user ? supabase.from('v_lesson_progress').select('*').eq('student_id', user.id) : { data: [] },
        ])
        if (lessonsRes.data) setLessons(lessonsRes.data as Lesson[])
        if (progressRes.data) {
          setProgress(progressRes.data as LessonProgress[])
          setTotalCompleted((progressRes.data as LessonProgress[]).filter(p => p.is_completed).length)
        }
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  const progressMap = useMemo(() => {
    const map = new Map<string, boolean>()
    progress.forEach(p => map.set(p.lesson_id, p.is_completed))
    return map
  }, [progress])

  const completed = lessons.filter(l => progressMap.get(l.id)).length
  const percent = lessons.length > 0 ? Math.round((completed / lessons.length) * 100) : 0
  const isGated = totalCompleted < LEVEL.prerequisite

  if (loading) return (
    <div className="space-y-4">
      <div className="h-40 bg-gray-200 rounded-2xl animate-pulse" />
      {[1, 2, 3].map(i => <div key={i} className="h-20 bg-gray-200 rounded-xl animate-pulse" />)}
    </div>
  )

  return (
    <div className="space-y-6">
      <Link href="/lessons" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar
      </Link>

      {/* Hero */}
      <div className={`bg-gradient-to-br ${COLORS.gradient} rounded-2xl p-8 text-white shadow-xl`}>
        <div className="flex items-center gap-4 mb-4">
          <div className="w-14 h-14 bg-white/20 rounded-xl flex items-center justify-center">
            <Leaf className="w-7 h-7" />
          </div>
          <div>
            <h1 className="text-2xl font-bold">{LEVEL.emoji} {LEVEL.label}</h1>
            <p className="text-white/80 text-sm">{LEVEL.description}</p>
          </div>
        </div>

        {isGated ? (
          <div className="flex items-center gap-3 bg-white/15 rounded-xl p-4 mt-2">
            <Lock className="w-6 h-6" />
            <div>
              <p className="font-bold text-sm">Nivel bloqueado</p>
              <p className="text-xs text-white/80">Conclua {LEVEL.prerequisite} aulas para desbloquear ({totalCompleted} concluidas)</p>
            </div>
          </div>
        ) : (
          <>
            <div className="flex items-center justify-between text-sm text-white/80 mb-2">
              <span>{completed}/{lessons.length} aulas concluidas</span>
              <span className="font-bold">{percent}%</span>
            </div>
            <div className="w-full bg-white/20 rounded-full h-3">
              <div className="bg-white h-3 rounded-full transition-all" style={{ width: `${percent}%` }} />
            </div>
          </>
        )}

        <div className="flex flex-wrap gap-2 mt-4">
          {LEVEL.methodologies.map(m => (
            <span key={m} className="bg-white/15 px-3 py-1 rounded-full text-xs">{m}</span>
          ))}
        </div>
      </div>

      {/* Lesson cards */}
      {isGated ? (
        <div className="text-center py-12 bg-white rounded-2xl border border-gray-100">
          <Lock className="w-10 h-10 text-gray-300 mx-auto mb-3" />
          <p className="text-gray-500 font-medium">Conclua mais aulas para acessar este nivel</p>
          <Link href="/lessons/iniciante" className="text-sm text-blue-600 hover:underline mt-2 inline-block">
            Ir para Iniciante
          </Link>
        </div>
      ) : (
        <div className="space-y-3">
          {lessons.map(lesson => {
            const isDone = progressMap.get(lesson.id)
            return (
              <Link key={lesson.id} href={`/lessons/${lesson.id}`} className="block group">
                <div className={`bg-white rounded-xl border shadow-sm p-4 hover:shadow-md transition-all flex items-center gap-4 ${isDone ? 'border-amber-200' : 'border-gray-100 hover:border-amber-200'}`}>
                  <div className={`w-12 h-12 rounded-xl flex items-center justify-center font-bold ${isDone ? 'bg-green-100 text-green-700' : `${COLORS.bg} ${COLORS.text}`}`}>
                    {isDone ? <CheckCircle className="w-6 h-6" /> : lesson.number}
                  </div>
                  <div className="flex-1 min-w-0">
                    <h3 className="font-bold text-gray-900 group-hover:text-amber-700 transition-colors">{lesson.title}</h3>
                    <div className="flex items-center gap-2 text-xs text-gray-400">
                      {lesson.scheduled_date && (
                        <span className="flex items-center gap-1">
                          <Calendar className="w-3 h-3" />
                          {new Date(lesson.scheduled_date).toLocaleDateString('pt-BR', { day: '2-digit', month: 'short' })}
                        </span>
                      )}
                      {lesson.duration_minutes && <span>{lesson.duration_minutes} min</span>}
                    </div>
                  </div>
                  <span className={`px-2 py-1 rounded text-xs font-bold ${STATUS_COLORS[lesson.status] || 'bg-gray-100 text-gray-600'}`}>
                    {STATUS_LABELS[lesson.status] || lesson.status}
                  </span>
                  <ChevronRight className="w-4 h-4 text-gray-300 group-hover:text-amber-500 transition-colors" />
                </div>
              </Link>
            )
          })}
        </div>
      )}
    </div>
  )
}
