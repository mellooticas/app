'use client'

import { useEffect, useState, useMemo } from 'react'
import { supabase } from '@/lib/supabase/client'
import { Zap, ArrowLeft, Calendar, Play, CheckCircle, ChevronRight, Video, Clock, Trophy } from 'lucide-react'
import Link from 'next/link'
import type { Tables } from '@/lib/supabase/database.types'

type LessonActivity = Tables<'v_lesson_activities'>
type LessonProgress = Tables<'v_lesson_progress'>

export default function AlphaPage() {
  const [alphaActivities, setAlphaActivities] = useState<LessonActivity[]>([])
  const [progress, setProgress] = useState<LessonProgress[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const { data: { user } } = await supabase.auth.getUser()

        const [activitiesRes, progressRes] = await Promise.all([
          supabase
            .from('v_lesson_activities')
            .select('*')
            .eq('activity_type', 'alpha')
            .order('lesson_number', { ascending: true }),
          user ? supabase.from('v_lesson_progress').select('*').eq('student_id', user.id) : { data: [] },
        ])

        if (activitiesRes.data) setAlphaActivities(activitiesRes.data as LessonActivity[])
        if (progressRes.data) setProgress(progressRes.data as LessonProgress[])
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

  // Find current week's Alpha (closest to today by lesson_number)
  const currentAlpha = useMemo(() => {
    if (alphaActivities.length === 0) return null
    // Find the first alpha whose lesson is not yet completed, or the last one if all done
    const notDone = alphaActivities.find(a => !progressMap.get(a.lesson_id))
    return notDone || alphaActivities[alphaActivities.length - 1]
  }, [alphaActivities, progressMap])

  const completedCount = alphaActivities.filter(a => progressMap.get(a.lesson_id)).length
  const totalCount = alphaActivities.length

  if (loading) return (
    <div className="space-y-4">
      <div className="h-48 bg-gray-200 rounded-2xl animate-pulse" />
      {[1, 2, 3].map(i => <div key={i} className="h-20 bg-gray-200 rounded-xl animate-pulse" />)}
    </div>
  )

  return (
    <div className="space-y-6">
      <Link href="/lessons" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar
      </Link>

      {/* Hero */}
      <div className="bg-gradient-to-br from-amber-500 to-orange-600 rounded-2xl p-8 text-white shadow-xl relative overflow-hidden">
        <div className="absolute top-4 right-6 opacity-20">
          <Video className="w-20 h-20" />
        </div>
        <div className="relative z-10">
          <div className="flex items-center gap-4 mb-4">
            <div className="w-14 h-14 bg-white/20 rounded-xl flex items-center justify-center">
              <Zap className="w-7 h-7" />
            </div>
            <div>
              <h1 className="text-2xl font-bold">Desafio Alpha</h1>
              <p className="text-white/80 text-sm">Seu desafio semanal de video musical</p>
            </div>
          </div>

          <p className="text-sm text-white/90 mb-4">
            Toda semana, grave um video curto praticando o que aprendeu na aula.
            Mostre sua evolucao e ganhe pontos!
          </p>

          {/* Stats */}
          <div className="grid grid-cols-3 gap-3">
            <div className="bg-white/15 rounded-xl p-3 text-center">
              <p className="text-2xl font-bold">{completedCount}</p>
              <p className="text-xs text-white/70">Concluidos</p>
            </div>
            <div className="bg-white/15 rounded-xl p-3 text-center">
              <p className="text-2xl font-bold">{totalCount}</p>
              <p className="text-xs text-white/70">Total</p>
            </div>
            <div className="bg-white/15 rounded-xl p-3 text-center">
              <p className="text-2xl font-bold">{totalCount > 0 ? Math.round((completedCount / totalCount) * 100) : 0}%</p>
              <p className="text-xs text-white/70">Progresso</p>
            </div>
          </div>
        </div>
      </div>

      {/* Current Alpha Challenge */}
      {currentAlpha && (
        <div className="bg-white rounded-2xl border-2 border-amber-200 shadow-lg overflow-hidden">
          <div className="bg-amber-50 px-6 py-3 flex items-center gap-2 border-b border-amber-100">
            <Zap className="w-4 h-4 text-amber-600" />
            <span className="text-sm font-bold text-amber-700">Desafio da Semana</span>
            <span className="text-xs text-amber-500 ml-auto">Aula {currentAlpha.lesson_number}</span>
          </div>
          <div className="p-6">
            <h2 className="text-xl font-bold text-gray-900 mb-2">{currentAlpha.title}</h2>
            {currentAlpha.description && (
              <p className="text-gray-600 text-sm mb-4 leading-relaxed">{currentAlpha.description}</p>
            )}
            <div className="flex items-center gap-3">
              <Link
                href={`/lessons/${currentAlpha.lesson_id}`}
                className="flex items-center gap-2 px-5 py-2.5 bg-amber-600 text-white rounded-xl font-bold hover:bg-amber-700 transition-colors"
              >
                <Play className="w-4 h-4" />
                Ver Aula Completa
              </Link>
              {currentAlpha.duration_minutes && (
                <span className="flex items-center gap-1 text-sm text-gray-400">
                  <Clock className="w-4 h-4" />
                  {currentAlpha.duration_minutes} min
                </span>
              )}
            </div>
          </div>
        </div>
      )}

      {/* Timeline of all Alpha challenges */}
      <div className="space-y-2">
        <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
          <Trophy className="w-5 h-5 text-amber-500" />
          Todos os Desafios Alpha
        </h2>

        <div className="space-y-2">
          {alphaActivities.map(activity => {
            const isDone = progressMap.get(activity.lesson_id)
            const isCurrent = currentAlpha?.id === activity.id

            return (
              <Link key={activity.id} href={`/lessons/${activity.lesson_id}`} className="block group">
                <div className={`bg-white rounded-xl border shadow-sm p-4 hover:shadow-md transition-all flex items-center gap-4 ${
                  isCurrent ? 'border-amber-300 ring-1 ring-amber-100' : isDone ? 'border-green-200' : 'border-gray-100 hover:border-amber-200'
                }`}>
                  <div className={`w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0 ${
                    isDone ? 'bg-green-100 text-green-600' : isCurrent ? 'bg-amber-100 text-amber-600' : 'bg-gray-100 text-gray-400'
                  }`}>
                    {isDone ? <CheckCircle className="w-5 h-5" /> : <Zap className="w-5 h-5" />}
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <h3 className="font-bold text-gray-900 text-sm group-hover:text-amber-700 transition-colors truncate">
                        {activity.title}
                      </h3>
                      {isCurrent && (
                        <span className="px-2 py-0.5 rounded-full text-xs font-bold bg-amber-100 text-amber-700 flex-shrink-0">
                          Atual
                        </span>
                      )}
                    </div>
                    <p className="text-xs text-gray-400">Aula {activity.lesson_number}</p>
                  </div>
                  <ChevronRight className="w-4 h-4 text-gray-300 group-hover:text-amber-500 transition-colors flex-shrink-0" />
                </div>
              </Link>
            )
          })}
        </div>
      </div>

      {alphaActivities.length === 0 && (
        <div className="text-center py-12 bg-white rounded-2xl border border-gray-100">
          <Zap className="w-10 h-10 text-gray-300 mx-auto mb-3" />
          <p className="text-sm text-gray-400">Nenhum Desafio Alpha disponivel ainda.</p>
        </div>
      )}
    </div>
  )
}
