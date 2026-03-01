'use client'

import { useEffect, useState, useMemo } from 'react'
import { supabase } from '@/lib/supabase/client'
import { GraduationCap, ChevronRight, Calendar, CheckCircle, ArrowLeft, Lock, Music, Sparkles, Timer, Star } from 'lucide-react'
import Link from 'next/link'
import { LESSON_LEVELS_YEAR2, STATUS_LABELS, STATUS_COLORS, LEVEL_COLORS } from '@/lib/lessons/constants'
import type { Tables } from '@/lib/supabase/database.types'

type Lesson = Tables<'v_lessons'>
type LessonProgress = Tables<'v_lesson_progress'>

const LEVEL = LESSON_LEVELS_YEAR2.formatura
const COLORS = LEVEL_COLORS.blue

const FORMATURA_LABELS: Record<number, { tag: string; desc: string }> = {
  66: { tag: 'Ensaio Geral I', desc: 'Primeiro ensaio geral com todo o repertorio do ano' },
  67: { tag: 'Ensaio Geral II', desc: 'Ajustes finais, integracao de grupos e coreografias' },
  68: { tag: 'Passagem de Som', desc: 'Ensaio tecnico no local da apresentacao' },
  69: { tag: 'Formatura', desc: 'Show Final e Cerimonia de Formatura 2026!' },
}

export default function FormaturaPage() {
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

  const isGated = totalCompleted < LEVEL.prerequisite

  // Find the Formatura date (lesson 69)
  const formaturaDate = useMemo(() => {
    const grad = lessons.find(l => l.number === 69)
    return grad?.scheduled_date ? new Date(grad.scheduled_date) : null
  }, [lessons])

  // Countdown
  const countdown = useMemo(() => {
    if (!formaturaDate) return null
    const now = new Date()
    const diff = formaturaDate.getTime() - now.getTime()
    if (diff <= 0) return { days: 0, past: true }
    const days = Math.ceil(diff / (1000 * 60 * 60 * 24))
    return { days, past: false }
  }, [formaturaDate])

  if (loading) return (
    <div className="space-y-4">
      <div className="h-48 bg-gray-200 rounded-2xl animate-pulse" />
      {[1, 2, 3].map(i => <div key={i} className="h-24 bg-gray-200 rounded-xl animate-pulse" />)}
    </div>
  )

  return (
    <div className="space-y-6">
      <Link href="/lessons" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar
      </Link>

      {/* Hero */}
      <div className={`bg-gradient-to-br ${COLORS.gradient} rounded-2xl p-8 text-white shadow-xl relative overflow-hidden`}>
        {/* Decorative elements */}
        <div className="absolute top-4 right-6 opacity-20">
          <Sparkles className="w-16 h-16" />
        </div>
        <div className="absolute bottom-4 left-8 opacity-10">
          <Music className="w-24 h-24" />
        </div>

        <div className="relative z-10">
          <div className="flex items-center gap-4 mb-4">
            <div className="w-14 h-14 bg-white/20 rounded-xl flex items-center justify-center">
              <GraduationCap className="w-7 h-7" />
            </div>
            <div>
              <h1 className="text-2xl font-bold">{LEVEL.emoji} {LEVEL.label}</h1>
              <p className="text-white/80 text-sm">{LEVEL.description}</p>
            </div>
          </div>

          <div className="flex items-center gap-2 mb-4">
            <span className="bg-white/15 px-3 py-1 rounded-full text-xs font-bold">Ano 2 - 2026</span>
          </div>

          {/* Countdown */}
          {countdown && !countdown.past && (
            <div className="bg-white/15 rounded-xl p-4 mt-4 flex items-center gap-4">
              <Timer className="w-8 h-8" />
              <div>
                <p className="text-3xl font-bold">{countdown.days}</p>
                <p className="text-xs text-white/80">dias para a Formatura</p>
              </div>
              {formaturaDate && (
                <div className="ml-auto text-right">
                  <p className="text-sm font-bold">
                    {formaturaDate.toLocaleDateString('pt-BR', { day: '2-digit', month: 'long', year: 'numeric' })}
                  </p>
                  <p className="text-xs text-white/60">Data da Formatura</p>
                </div>
              )}
            </div>
          )}

          {countdown?.past && (
            <div className="bg-white/15 rounded-xl p-4 mt-4 flex items-center gap-3">
              <Sparkles className="w-6 h-6" />
              <p className="font-bold">A Formatura ja aconteceu! Parabens a todos os formandos!</p>
            </div>
          )}

          {isGated && (
            <div className="flex items-center gap-3 bg-white/15 rounded-xl p-4 mt-4">
              <Lock className="w-6 h-6" />
              <div>
                <p className="font-bold text-sm">Nivel bloqueado</p>
                <p className="text-xs text-white/80">Conclua {LEVEL.prerequisite} aulas para desbloquear ({totalCompleted} concluidas)</p>
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Timeline */}
      {isGated ? (
        <div className="text-center py-12 bg-white rounded-2xl border border-gray-100">
          <Lock className="w-10 h-10 text-gray-300 mx-auto mb-3" />
          <p className="text-gray-500 font-medium">Conclua mais aulas para acessar a Formatura</p>
          <Link href="/lessons/projetos" className="text-sm text-blue-600 hover:underline mt-2 inline-block">
            Ir para Projetos
          </Link>
        </div>
      ) : (
        <div className="space-y-4">
          <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
            <Calendar className="w-5 h-5 text-blue-500" />
            Timeline de Preparacao
          </h2>

          <div className="relative">
            {/* Vertical line */}
            <div className="absolute left-6 top-0 bottom-0 w-0.5 bg-blue-200" />

            <div className="space-y-4">
              {lessons.map((lesson, idx) => {
                const isDone = progressMap.get(lesson.id)
                const info = lesson.number !== null ? FORMATURA_LABELS[lesson.number] : null
                const isLast = idx === lessons.length - 1

                return (
                  <Link key={lesson.id} href={`/lessons/${lesson.id}`} className="block group">
                    <div className="flex gap-4 relative">
                      {/* Timeline dot */}
                      <div className={`w-12 h-12 rounded-full flex items-center justify-center z-10 flex-shrink-0 ${
                        isDone ? 'bg-green-500 text-white' : isLast ? 'bg-blue-600 text-white ring-4 ring-blue-200' : 'bg-white border-2 border-blue-300 text-blue-600'
                      }`}>
                        {isDone ? <CheckCircle className="w-6 h-6" /> : isLast ? <GraduationCap className="w-6 h-6" /> : <span className="font-bold text-sm">{lesson.number}</span>}
                      </div>

                      {/* Card */}
                      <div className={`flex-1 bg-white rounded-xl border shadow-sm p-4 hover:shadow-md transition-all ${
                        isLast ? 'border-blue-200 ring-1 ring-blue-100' : isDone ? 'border-green-200' : 'border-gray-100 hover:border-blue-200'
                      }`}>
                        <div className="flex items-center justify-between mb-1">
                          <div className="flex items-center gap-2">
                            <h3 className={`font-bold group-hover:text-blue-700 transition-colors ${isLast ? 'text-blue-700' : 'text-gray-900'}`}>
                              {lesson.title}
                            </h3>
                            {info && (
                              <span className={`px-2 py-0.5 rounded-full text-xs font-bold ${isLast ? 'bg-blue-100 text-blue-700' : 'bg-gray-100 text-gray-600'}`}>
                                {info.tag}
                              </span>
                            )}
                          </div>
                          <ChevronRight className="w-4 h-4 text-gray-300 group-hover:text-blue-500 transition-colors" />
                        </div>
                        {info && <p className="text-xs text-gray-500">{info.desc}</p>}
                        {lesson.scheduled_date && (
                          <p className="text-xs text-gray-400 mt-1 flex items-center gap-1">
                            <Calendar className="w-3 h-3" />
                            {new Date(lesson.scheduled_date).toLocaleDateString('pt-BR', { day: '2-digit', month: 'long' })}
                          </p>
                        )}
                      </div>
                    </div>
                  </Link>
                )
              })}
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
