'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { useAuth } from '@/app/providers/AuthProvider'
import {
  Zap, Target, Lightbulb, RefreshCw, Play,
  CheckCircle, ChevronRight, Loader2, Sparkles,
} from 'lucide-react'
import Link from 'next/link'
import { completeAlphaItem, generateNextSteps, generateDailyChallenge } from '@/app/actions/alpha-engine-actions'

interface AlphaItem {
  id: string
  item_type: string
  title: string
  description: string | null
  points_reward: number
  difficulty: number
  priority: number
}

const TYPE_ICONS: Record<string, typeof Zap> = {
  exercise: Target,
  micro_challenge: Zap,
  practice_tip: Lightbulb,
  review: RefreshCw,
  next_lesson: Play,
}

const TYPE_COLORS: Record<string, string> = {
  exercise: 'from-blue-500 to-cyan-500',
  micro_challenge: 'from-amber-500 to-orange-500',
  practice_tip: 'from-green-500 to-emerald-500',
  review: 'from-purple-500 to-violet-500',
  next_lesson: 'from-indigo-500 to-blue-500',
}

const TYPE_LABELS: Record<string, string> = {
  exercise: 'Exercicio',
  micro_challenge: 'Micro-Desafio',
  practice_tip: 'Dica',
  review: 'Revisao',
  next_lesson: 'Proxima Aula',
}

export function AlphaNextStep() {
  const { user } = useAuth()
  const [items, setItems] = useState<AlphaItem[]>([])
  const [loading, setLoading] = useState(true)
  const [completing, setCompleting] = useState(false)
  const [generating, setGenerating] = useState(false)

  async function loadQueue() {
    if (!user) return
    try {
      const { data } = await (supabase as any)
        .from('v_alpha_queue')
        .select('id, item_type, title, description, points_reward, difficulty, priority')
        .eq('user_id', user.id)
        .in('status', ['pending', 'in_progress'])
        .order('priority', { ascending: false })
        .order('created_at', { ascending: true })
        .limit(3)
      if (data) setItems(data)
    } catch {
      // Silently fail for widget
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadQueue()
  }, [user])

  // Auto-generate if empty
  useEffect(() => {
    if (!loading && items.length === 0 && !generating && user) {
      handleGenerate()
    }
  }, [loading]) // eslint-disable-line react-hooks/exhaustive-deps

  async function handleComplete(itemId: string) {
    setCompleting(true)
    const result = await completeAlphaItem({ item_id: itemId })
    if (result.success) {
      setItems(prev => prev.filter(i => i.id !== itemId))
      // Reload to get next items
      await loadQueue()
    }
    setCompleting(false)
  }

  async function handleGenerate() {
    setGenerating(true)
    await generateNextSteps()
    await generateDailyChallenge()
    await loadQueue()
    setGenerating(false)
  }

  if (loading) {
    return (
      <div className="bg-white rounded-2xl border border-gray-100 p-6 animate-pulse">
        <div className="h-5 w-40 bg-gray-200 rounded mb-4" />
        <div className="h-16 bg-gray-200 rounded-xl" />
      </div>
    )
  }

  const next = items[0]

  if (!next && !generating) {
    return (
      <div className="bg-gradient-to-r from-emerald-50 to-teal-50 rounded-2xl border border-emerald-200 p-6">
        <div className="flex items-center gap-3">
          <CheckCircle className="w-8 h-8 text-emerald-500" />
          <div className="flex-1">
            <h3 className="font-bold text-emerald-900">Tudo em dia!</h3>
            <p className="text-sm text-emerald-700">Gerando novas atividades...</p>
          </div>
          <button
            onClick={handleGenerate}
            className="px-3 py-1.5 bg-emerald-500 text-white text-sm font-bold rounded-lg hover:bg-emerald-600 transition-colors"
          >
            Gerar
          </button>
        </div>
      </div>
    )
  }

  if (generating && !next) {
    return (
      <div className="bg-white rounded-2xl border border-purple-100 p-6 text-center">
        <Loader2 className="w-6 h-6 text-purple-500 mx-auto mb-2 animate-spin" />
        <p className="text-sm text-purple-600 font-medium">Gerando atividades personalizadas...</p>
      </div>
    )
  }

  if (!next) return null

  const Icon = TYPE_ICONS[next.item_type] || Target
  const gradient = TYPE_COLORS[next.item_type] || 'from-gray-500 to-gray-600'
  const label = TYPE_LABELS[next.item_type] || next.item_type

  return (
    <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
      <div className="p-5">
        <div className="flex items-center gap-2 mb-3">
          <Sparkles className="w-4 h-4 text-purple-500" />
          <span className="text-xs font-bold text-gray-500 uppercase tracking-wider">Proximo Passo</span>
          <span className="ml-auto text-xs font-bold text-amber-600">+{next.points_reward} pts</span>
        </div>

        <div className="flex items-start gap-4">
          <div className={`w-12 h-12 rounded-xl bg-gradient-to-br ${gradient} flex items-center justify-center flex-shrink-0`}>
            <Icon className="w-6 h-6 text-white" />
          </div>
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 mb-1">
              <span className="px-2 py-0.5 rounded text-[10px] font-bold bg-gray-100 text-gray-500">{label}</span>
            </div>
            <h3 className="font-bold text-gray-900 text-sm">{next.title}</h3>
            {next.description && (
              <p className="text-xs text-gray-500 mt-1 line-clamp-2">{next.description}</p>
            )}
          </div>
        </div>

        <div className="flex items-center gap-2 mt-4">
          <button
            onClick={() => handleComplete(next.id)}
            disabled={completing}
            className={`flex-1 flex items-center justify-center gap-2 py-2.5 bg-gradient-to-r ${gradient} text-white rounded-xl font-bold text-sm hover:opacity-90 transition-all disabled:opacity-50`}
          >
            {completing ? (
              <Loader2 className="w-4 h-4 animate-spin" />
            ) : (
              <CheckCircle className="w-4 h-4" />
            )}
            {completing ? 'Completando...' : 'Completar'}
          </button>
          <Link
            href="/lessons/alpha"
            className="flex items-center gap-1 px-3 py-2.5 bg-gray-100 text-gray-600 rounded-xl text-sm font-bold hover:bg-gray-200 transition-colors"
          >
            Ver Todos
            <ChevronRight className="w-3.5 h-3.5" />
          </Link>
        </div>
      </div>

      {/* Additional items peek */}
      {items.length > 1 && (
        <div className="bg-gray-50 border-t border-gray-100 px-5 py-3">
          <p className="text-xs text-gray-500">
            +{items.length - 1} {items.length - 1 === 1 ? 'atividade' : 'atividades'} na fila
          </p>
        </div>
      )}
    </div>
  )
}
