'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { useAuth } from '@/app/providers/AuthProvider'
import {
  Route, ArrowLeft, BookOpen, Zap, Briefcase, Dumbbell, Sparkles,
  Check, Lock, ChevronRight, Loader2, Trophy, Play,
} from 'lucide-react'
import Link from 'next/link'
import { startPath, completeStep } from '@/app/actions/learning-path-actions'

type PathDetail = {
  id: string
  title: string
  description: string | null
  cycle: string | null
  methodology_name: string | null
  instrument_name: string | null
  difficulty_min: number
  difficulty_max: number
  total_steps: number
  step_count: number
  is_active: boolean
}

type PathStep = {
  id: string
  path_id: string
  step_order: number
  step_type: string
  reference_id: string | null
  title: string
  description: string | null
  is_optional: boolean
  unlock_after: string | null
  points_reward: number
  lesson_title: string | null
  challenge_title: string | null
}

type UserProgress = {
  path_id: string
  current_step: number
  status: string
  completed_steps: number
}

const cycleLabels: Record<string, string> = {
  initial: 'Iniciacao',
  fundamental: 'Fundamental',
  intermediate: 'Intermediario',
  advanced: 'Avancado',
}

const stepTypeConfig: Record<string, { icon: typeof BookOpen; color: string; label: string; href?: string }> = {
  lesson: { icon: BookOpen, color: 'text-blue-500 bg-blue-50 border-blue-200', label: 'Aula', href: '/lessons' },
  challenge: { icon: Zap, color: 'text-amber-500 bg-amber-50 border-amber-200', label: 'Desafio', href: '/challenges' },
  portfolio: { icon: Briefcase, color: 'text-teal-500 bg-teal-50 border-teal-200', label: 'Portfolio' },
  practice: { icon: Dumbbell, color: 'text-pink-500 bg-pink-50 border-pink-200', label: 'Pratica' },
  ai_content: { icon: Sparkles, color: 'text-purple-500 bg-purple-50 border-purple-200', label: 'AI' },
}

export default function PathDetailPage() {
  const { id } = useParams<{ id: string }>()
  const { user } = useAuth()
  const [path, setPath] = useState<PathDetail | null>(null)
  const [steps, setSteps] = useState<PathStep[]>([])
  const [progress, setProgress] = useState<UserProgress | null>(null)
  const [completedStepIds, setCompletedStepIds] = useState<Set<string>>(new Set())
  const [loading, setLoading] = useState(true)
  const [starting, setStarting] = useState(false)
  const [completing, setCompleting] = useState<string | null>(null)

  async function loadAll() {
    try {
      const { data: pathData } = await (supabase as any)
        .from('v_learning_paths')
        .select('*')
        .eq('id', id)
        .single()
      if (pathData) setPath(pathData)

      const { data: stepsData } = await (supabase as any)
        .from('v_learning_path_steps')
        .select('*')
        .eq('path_id', id)
        .order('step_order', { ascending: true })
      if (stepsData) setSteps(stepsData)

      if (user) {
        const { data: progData } = await (supabase as any)
          .from('v_user_path_progress')
          .select('*')
          .eq('user_id', user.id)
          .eq('path_id', id)
          .maybeSingle()
        if (progData) setProgress(progData)

        const { data: completions } = await (supabase as any)
          .from('user_step_completions')
          .select('step_id')
          .eq('user_id', user.id)
          .eq('path_id', id)
        if (completions) {
          setCompletedStepIds(new Set(completions.map((c: any) => c.step_id)))
        }
      }
    } catch (error) {
      console.error('Error loading path:', error)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    if (id) loadAll()
  }, [id, user])

  async function handleStart() {
    setStarting(true)
    await startPath({ path_id: id })
    await loadAll()
    setStarting(false)
  }

  async function handleCompleteStep(stepId: string) {
    setCompleting(stepId)
    const result = await completeStep({ step_id: stepId, path_id: id })
    if (!('error' in result)) {
      await loadAll()
    }
    setCompleting(null)
  }

  function isStepUnlocked(step: PathStep): boolean {
    if (!step.unlock_after) return true
    return completedStepIds.has(step.unlock_after)
  }

  function getStepLink(step: PathStep): string | null {
    if (!step.reference_id) return null
    const config = stepTypeConfig[step.step_type]
    if (!config?.href) return null
    return `${config.href}/${step.reference_id}`
  }

  if (loading) {
    return (
      <div className="space-y-6">
        <div className="h-10 w-40 bg-gray-200 rounded animate-pulse" />
        <div className="h-48 bg-gray-200 rounded-2xl animate-pulse" />
        <div className="space-y-3">
          {[1, 2, 3, 4].map(i => <div key={i} className="h-20 bg-gray-200 rounded-xl animate-pulse" />)}
        </div>
      </div>
    )
  }

  if (!path) {
    return (
      <div className="text-center py-16">
        <p className="text-gray-500">Trilha nao encontrada.</p>
        <Link href="/paths" className="text-emerald-600 hover:underline mt-4 inline-block">Voltar</Link>
      </div>
    )
  }

  const pct = progress && path.total_steps > 0
    ? Math.round((progress.completed_steps / path.total_steps) * 100)
    : 0

  return (
    <div className="space-y-6 max-w-3xl mx-auto">
      <Link href="/paths" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar as Trilhas
      </Link>

      {/* Header */}
      <div className="bg-gradient-to-br from-emerald-500 to-teal-600 rounded-2xl p-8 text-white shadow-xl">
        <div className="flex items-start justify-between">
          <div>
            <div className="flex items-center gap-3 mb-3">
              <Route className="w-6 h-6" />
              {path.cycle && (
                <span className="bg-white/20 px-3 py-1 rounded-full text-xs font-bold">
                  {cycleLabels[path.cycle] || path.cycle}
                </span>
              )}
            </div>
            <h1 className="text-2xl font-bold mb-2">{path.title}</h1>
            <div className="flex flex-wrap gap-2">
              {path.methodology_name && (
                <span className="bg-white/20 px-2 py-0.5 rounded text-xs">{path.methodology_name}</span>
              )}
              {path.instrument_name && (
                <span className="bg-white/20 px-2 py-0.5 rounded text-xs">{path.instrument_name}</span>
              )}
            </div>
          </div>
          <div className="text-right">
            <div className="flex items-center gap-2">
              <BookOpen className="w-5 h-5" />
              <span className="text-2xl font-bold">{path.step_count}</span>
            </div>
            <p className="text-xs text-emerald-100">steps</p>
          </div>
        </div>

        {/* Progress bar */}
        {progress && (
          <div className="mt-6">
            <div className="flex items-center justify-between mb-2">
              <span className="text-sm font-medium">Progresso</span>
              <span className="text-sm font-bold">{pct}%</span>
            </div>
            <div className="w-full bg-white/20 rounded-full h-2.5">
              <div className="bg-white h-2.5 rounded-full transition-all" style={{ width: `${pct}%` }} />
            </div>
            <p className="text-xs text-emerald-100 mt-1">
              {progress.completed_steps} de {path.total_steps} steps completados
            </p>
          </div>
        )}
      </div>

      {path.description && (
        <div className="bg-white rounded-xl border border-gray-100 p-6">
          <h2 className="font-bold text-gray-900 mb-2">Sobre esta trilha</h2>
          <p className="text-sm text-gray-600 whitespace-pre-wrap">{path.description}</p>
        </div>
      )}

      {/* Start button if not started */}
      {!progress && (
        <div className="bg-white rounded-xl border border-gray-100 p-6 text-center">
          <Route className="w-10 h-10 text-emerald-400 mx-auto mb-3" />
          <h3 className="font-bold text-gray-900 mb-2">Pronto para comecar?</h3>
          <p className="text-sm text-gray-500 mb-4">Inicie esta trilha para acompanhar seu progresso.</p>
          <button
            onClick={handleStart}
            disabled={starting}
            className="px-8 py-3 bg-emerald-500 text-white rounded-xl font-bold hover:bg-emerald-600 transition-colors disabled:opacity-50 inline-flex items-center gap-2"
          >
            {starting ? <Loader2 className="w-5 h-5 animate-spin" /> : <Play className="w-5 h-5" />}
            {starting ? 'Iniciando...' : 'Comecar Trilha'}
          </button>
        </div>
      )}

      {/* Completed banner */}
      {progress?.status === 'completed' && (
        <div className="bg-gradient-to-r from-amber-400 to-yellow-500 rounded-xl p-6 text-center text-white">
          <Trophy className="w-10 h-10 mx-auto mb-2" />
          <h3 className="text-lg font-bold">Trilha Concluida!</h3>
          <p className="text-sm text-amber-100 mt-1">Parabens! Voce completou todos os steps desta trilha.</p>
        </div>
      )}

      {/* Timeline */}
      {steps.length > 0 && (
        <div>
          <h2 className="text-lg font-bold text-gray-900 mb-4">Steps da Trilha</h2>
          <div className="relative">
            {/* Vertical line */}
            <div className="absolute left-6 top-0 bottom-0 w-0.5 bg-gray-200" />

            <div className="space-y-3">
              {steps.map((step, i) => {
                const isCompleted = completedStepIds.has(step.id)
                const unlocked = isStepUnlocked(step)
                const config = stepTypeConfig[step.step_type] || stepTypeConfig.practice
                const Icon = config.icon
                const stepLink = getStepLink(step)
                const isNext = progress && !isCompleted && unlocked &&
                  !steps.slice(0, i).some(s => !completedStepIds.has(s.id) && isStepUnlocked(s) && !s.is_optional)

                return (
                  <div key={step.id} className="relative flex items-start gap-4 pl-1">
                    {/* Timeline dot */}
                    <div className={`relative z-10 w-11 h-11 rounded-full flex items-center justify-center border-2 flex-shrink-0 transition-all ${
                      isCompleted
                        ? 'bg-emerald-500 border-emerald-500 text-white'
                        : unlocked
                        ? `border-gray-300 ${config.color}`
                        : 'bg-gray-100 border-gray-200 text-gray-400'
                    }`}>
                      {isCompleted ? (
                        <Check className="w-5 h-5" />
                      ) : !unlocked ? (
                        <Lock className="w-4 h-4" />
                      ) : (
                        <Icon className="w-5 h-5" />
                      )}
                    </div>

                    {/* Content */}
                    <div className={`flex-1 bg-white rounded-xl border p-4 transition-all ${
                      isCompleted
                        ? 'border-emerald-100 bg-emerald-50/30'
                        : isNext
                        ? 'border-emerald-300 shadow-md ring-2 ring-emerald-100'
                        : !unlocked
                        ? 'border-gray-100 opacity-60'
                        : 'border-gray-100 hover:shadow-sm'
                    }`}>
                      <div className="flex items-start justify-between">
                        <div className="flex-1">
                          <div className="flex items-center gap-2 mb-1">
                            <span className={`px-2 py-0.5 rounded text-xs font-bold border ${config.color}`}>
                              {config.label}
                            </span>
                            {step.is_optional && (
                              <span className="px-2 py-0.5 rounded text-xs font-medium bg-gray-100 text-gray-500">Opcional</span>
                            )}
                            <span className="text-xs text-gray-400">+{step.points_reward} pts</span>
                          </div>
                          <h3 className={`font-bold text-sm ${isCompleted ? 'text-emerald-700' : 'text-gray-900'}`}>
                            {step.title}
                          </h3>
                          {step.description && (
                            <p className="text-xs text-gray-500 mt-1 line-clamp-2">{step.description}</p>
                          )}
                        </div>

                        <div className="flex items-center gap-2 ml-3">
                          {/* Link to the referenced content */}
                          {stepLink && unlocked && (
                            <Link
                              href={stepLink}
                              className="p-2 rounded-lg bg-gray-50 text-gray-400 hover:bg-gray-100 hover:text-gray-600 transition-colors"
                              title="Abrir conteudo"
                            >
                              <ChevronRight className="w-4 h-4" />
                            </Link>
                          )}

                          {/* Complete button */}
                          {progress && !isCompleted && unlocked && (
                            <button
                              onClick={() => handleCompleteStep(step.id)}
                              disabled={completing === step.id}
                              className={`px-3 py-1.5 rounded-lg text-xs font-bold transition-colors ${
                                isNext
                                  ? 'bg-emerald-500 text-white hover:bg-emerald-600'
                                  : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                              } disabled:opacity-50`}
                            >
                              {completing === step.id ? (
                                <Loader2 className="w-3.5 h-3.5 animate-spin" />
                              ) : (
                                <Check className="w-3.5 h-3.5" />
                              )}
                            </button>
                          )}

                          {/* Completed indicator */}
                          {isCompleted && (
                            <span className="text-xs font-bold text-emerald-600">Feito</span>
                          )}
                        </div>
                      </div>
                    </div>
                  </div>
                )
              })}
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
