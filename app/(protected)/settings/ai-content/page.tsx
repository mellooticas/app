'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import {
  Sparkles, ChevronLeft, Loader2, Check, Play, FileText,
  Dumbbell, RefreshCw, AlertCircle,
} from 'lucide-react'
import { supabase } from '@/lib/supabase/client'
import { PermissionGate } from '@/components/auth/PermissionGate'
import { generateLessonMaterials, generateBatchMaterials } from '@/app/actions/ai-actions'

interface Lesson {
  id: string
  title: string
  lesson_number: number
  module_name: string | null
  status: string
}

interface AIContent {
  id: string
  lesson_id: string
  content_type: string
  title: string
  status: string
  created_at: string
  ai_model: string | null
}

export default function AIContentPage() {
  const router = useRouter()
  const [lessons, setLessons] = useState<Lesson[]>([])
  const [aiContent, setAiContent] = useState<AIContent[]>([])
  const [loading, setLoading] = useState(true)
  const [generating, setGenerating] = useState<string | null>(null) // lesson_id being generated
  const [batchGenerating, setBatchGenerating] = useState(false)
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)
  const [selectedYear, setSelectedYear] = useState<1 | 2>(2)
  const [previewContent, setPreviewContent] = useState<{ title: string; content: string } | null>(null)

  useEffect(() => {
    loadData()
  }, [])

  async function loadData() {
    setLoading(true)
    const [lessonsRes, contentRes] = await Promise.all([
      supabase.from('v_lessons').select('id, title, lesson_number, module_name, status').order('lesson_number'),
      supabase.from('v_ai_generated_content' as any).select('id, lesson_id, content_type, title, status, created_at, ai_model').eq('status', 'active'),
    ])

    if (lessonsRes.data) setLessons(lessonsRes.data as Lesson[])
    if (contentRes.data) setAiContent(contentRes.data as AIContent[])
    setLoading(false)
  }

  function showMsg(type: 'success' | 'error', text: string) {
    setMessage({ type, text })
    setTimeout(() => setMessage(null), 5000)
  }

  // Map of lesson_id → content items
  const contentMap = new Map<string, AIContent[]>()
  aiContent.forEach(c => {
    const existing = contentMap.get(c.lesson_id) || []
    existing.push(c)
    contentMap.set(c.lesson_id, existing)
  })

  // Filter by year
  const filteredLessons = lessons.filter(l =>
    selectedYear === 1 ? l.lesson_number < 30 : l.lesson_number >= 30
  )

  const totalLessons = filteredLessons.length
  const lessonsWithContent = filteredLessons.filter(l => contentMap.has(l.id)).length

  async function handleGenerate(lessonId: string) {
    setGenerating(lessonId)
    const result = await generateLessonMaterials({ lesson_id: lessonId })
    if ('error' in result) {
      showMsg('error', result.error)
    } else {
      showMsg('success', result.message || 'Material gerado!')
      await loadData()
    }
    setGenerating(null)
  }

  async function handleBatchGenerate() {
    const pendingIds = filteredLessons
      .filter(l => !contentMap.has(l.id))
      .map(l => l.id)

    if (pendingIds.length === 0) {
      showMsg('success', 'Todas as aulas já têm material!')
      return
    }

    setBatchGenerating(true)
    showMsg('success', `Gerando materiais para ${pendingIds.length} aulas... Isso pode levar alguns minutos.`)

    const result = await generateBatchMaterials({ lesson_ids: pendingIds })
    if ('error' in result) {
      showMsg('error', result.error)
    } else {
      showMsg('success', result.message || 'Batch concluído!')
      await loadData()
    }
    setBatchGenerating(false)
  }

  async function handlePreview(contentId: string) {
    const { data } = await supabase
      .from('v_ai_generated_content')
      .select('title, content')
      .eq('id', contentId)
      .single()

    if (data) setPreviewContent(data)
  }

  return (
    <PermissionGate permission="settings.view" fallback={<div className="text-center py-16"><p className="text-gray-500">Sem permissão.</p></div>}>
      <div className="max-w-5xl mx-auto space-y-6">
        {/* Header */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <button onClick={() => router.push('/settings')} className="p-2 hover:bg-gray-100 rounded-lg transition-colors">
              <ChevronLeft className="w-5 h-5 text-gray-500" />
            </button>
            <div>
              <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
                <Sparkles className="w-6 h-6 text-purple-600" />
                Conteúdo AI
              </h1>
              <p className="text-sm text-gray-500 mt-1">
                {lessonsWithContent}/{totalLessons} aulas com material gerado
              </p>
            </div>
          </div>
          <button
            onClick={handleBatchGenerate}
            disabled={batchGenerating || generating !== null}
            className="flex items-center gap-2 px-4 py-2.5 bg-purple-600 text-white rounded-xl font-bold text-sm hover:bg-purple-700 transition-colors shadow-sm disabled:opacity-50"
          >
            {batchGenerating ? (
              <Loader2 className="w-4 h-4 animate-spin" />
            ) : (
              <Sparkles className="w-4 h-4" />
            )}
            Gerar Todos
          </button>
        </div>

        {/* Toast */}
        {message && (
          <div className={`px-4 py-3 rounded-xl text-sm font-medium ${
            message.type === 'success' ? 'bg-green-50 text-green-700 border border-green-200' : 'bg-red-50 text-red-700 border border-red-200'
          }`}>
            {message.text}
          </div>
        )}

        {/* Year Tabs */}
        <div className="flex gap-2">
          {([1, 2] as const).map(year => (
            <button
              key={year}
              onClick={() => setSelectedYear(year)}
              className={`px-4 py-2 rounded-xl text-sm font-bold transition-colors ${
                selectedYear === year
                  ? 'bg-purple-100 text-purple-700'
                  : 'text-gray-500 hover:bg-gray-100'
              }`}
            >
              Ano {year} ({year === 1 ? '30 aulas' : '40 aulas'})
            </button>
          ))}
        </div>

        {/* Progress Bar */}
        <div className="bg-white rounded-xl border border-gray-100 p-4">
          <div className="flex items-center justify-between text-sm mb-2">
            <span className="text-gray-600">Progresso de geração</span>
            <span className="font-bold text-purple-700">
              {totalLessons > 0 ? Math.round((lessonsWithContent / totalLessons) * 100) : 0}%
            </span>
          </div>
          <div className="h-3 bg-gray-100 rounded-full overflow-hidden">
            <div
              className="h-full bg-gradient-to-r from-purple-500 to-pink-500 rounded-full transition-all duration-500"
              style={{ width: `${totalLessons > 0 ? (lessonsWithContent / totalLessons) * 100 : 0}%` }}
            />
          </div>
        </div>

        {/* Lessons List */}
        {loading ? (
          <div className="space-y-3">
            {[...Array(5)].map((_, i) => (
              <div key={i} className="bg-white rounded-xl border border-gray-100 p-5 animate-pulse">
                <div className="flex items-center gap-4">
                  <div className="w-10 h-10 bg-gray-200 rounded-lg" />
                  <div className="flex-1 space-y-2">
                    <div className="h-4 bg-gray-200 rounded w-1/3" />
                    <div className="h-3 bg-gray-100 rounded w-1/2" />
                  </div>
                </div>
              </div>
            ))}
          </div>
        ) : (
          <div className="space-y-2">
            {filteredLessons.map(lesson => {
              const contents = contentMap.get(lesson.id)
              const hasContent = !!contents && contents.length > 0
              const isGenerating = generating === lesson.id

              return (
                <div
                  key={lesson.id}
                  className={`bg-white rounded-xl border shadow-sm p-4 hover:shadow-md transition-all ${
                    hasContent ? 'border-green-200' : 'border-gray-100'
                  }`}
                >
                  <div className="flex items-center gap-4">
                    {/* Number badge */}
                    <div className={`w-10 h-10 rounded-lg flex items-center justify-center text-sm font-bold flex-shrink-0 ${
                      hasContent ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-500'
                    }`}>
                      {lesson.lesson_number}
                    </div>

                    {/* Info */}
                    <div className="flex-1 min-w-0">
                      <h3 className="font-bold text-gray-900 text-sm truncate">{lesson.title}</h3>
                      <div className="flex items-center gap-3 text-xs text-gray-400 mt-1">
                        {lesson.module_name && <span>{lesson.module_name}</span>}
                        {hasContent && (
                          <span className="flex items-center gap-1 text-green-600">
                            <Check className="w-3 h-3" />
                            {contents!.length} item(ns)
                          </span>
                        )}
                      </div>
                    </div>

                    {/* Actions */}
                    <div className="flex items-center gap-2 flex-shrink-0">
                      {hasContent && (
                        <button
                          onClick={() => handlePreview(contents![0].id)}
                          className="p-2 rounded-lg text-gray-400 hover:text-purple-600 hover:bg-purple-50 transition-all"
                          title="Visualizar"
                        >
                          <FileText className="w-4 h-4" />
                        </button>
                      )}
                      <button
                        onClick={() => handleGenerate(lesson.id)}
                        disabled={isGenerating || batchGenerating}
                        className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-bold transition-all ${
                          hasContent
                            ? 'text-gray-500 hover:text-purple-600 hover:bg-purple-50 border border-gray-200'
                            : 'bg-purple-600 text-white hover:bg-purple-700'
                        } disabled:opacity-50`}
                      >
                        {isGenerating ? (
                          <Loader2 className="w-3 h-3 animate-spin" />
                        ) : hasContent ? (
                          <RefreshCw className="w-3 h-3" />
                        ) : (
                          <Sparkles className="w-3 h-3" />
                        )}
                        {hasContent ? 'Regenerar' : 'Gerar'}
                      </button>
                    </div>
                  </div>
                </div>
              )
            })}
          </div>
        )}

        {/* Preview Modal */}
        {previewContent && (
          <div
            className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4"
            onClick={() => setPreviewContent(null)}
          >
            <div
              className="bg-white rounded-2xl shadow-xl w-full max-w-3xl max-h-[80vh] overflow-hidden flex flex-col"
              onClick={e => e.stopPropagation()}
            >
              <div className="flex items-center justify-between px-6 py-4 border-b border-gray-100">
                <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
                  <Sparkles className="w-5 h-5 text-purple-600" />
                  {previewContent.title}
                </h2>
                <button
                  onClick={() => setPreviewContent(null)}
                  className="p-1 hover:bg-gray-100 rounded-lg text-gray-400"
                >
                  &times;
                </button>
              </div>
              <div className="flex-1 overflow-y-auto px-6 py-4">
                <div className="prose prose-sm max-w-none whitespace-pre-wrap text-gray-700 leading-relaxed">
                  {previewContent.content}
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Info box */}
        <div className="bg-purple-50 border border-purple-200 rounded-xl p-4 flex gap-3">
          <AlertCircle className="w-5 h-5 text-purple-600 flex-shrink-0 mt-0.5" />
          <div className="text-sm text-purple-700">
            <p className="font-bold">Como funciona?</p>
            <p className="mt-1">
              A AI gera material de apoio (resumo, exercícios práticos, desafio Alpha) baseado no currículo
              e na metodologia de cada aula. Os materiais ficam disponíveis para os alunos na página da aula.
              Modelo usado: GPT-4o-mini (rápido e econômico) para geração em massa.
            </p>
          </div>
        </div>
      </div>
    </PermissionGate>
  )
}
