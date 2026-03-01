'use client'

import { useEffect, useState } from 'react'
import { useParams, useRouter } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { ArrowLeft, Save, BookOpen, Loader2 } from 'lucide-react'
import Link from 'next/link'
import { updateLesson } from '@/app/actions/lesson-actions'
import type { Tables } from '@/lib/supabase/database.types'

type Lesson = Tables<'v_lessons'>

export default function EditLessonPage() {
  const { id } = useParams<{ id: string }>()
  const router = useRouter()
  const [lesson, setLesson] = useState<Lesson | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const [objectives, setObjectives] = useState('')
  const [status, setStatus] = useState('draft')
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  useEffect(() => {
    async function load() {
      try {
        const { data } = await supabase.from('v_lessons').select('*').eq('id', id).single()
        if (data) {
          const lesson = data as Lesson
          setLesson(lesson)
          setTitle(lesson.title || '')
          setDescription(lesson.description || '')
          setObjectives(lesson.learning_objective || '')
          setStatus(lesson.status || 'draft')
        }
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!title.trim()) return
    setSaving(true)
    setError('')

    const result = await updateLesson({
      lesson_id: id,
      title: title.trim(),
      description: description.trim() || undefined,
      learning_objective: objectives.trim() || undefined,
      status: status as 'draft' | 'scheduled' | 'in_progress' | 'completed' | 'cancelled',
    })

    if ('error' in result) {
      setError(result.error)
      setSaving(false)
    } else {
      setSuccess('Salvo!')
      setTimeout(() => router.push(`/lessons/${id}`), 1000)
    }
  }

  if (loading) return <div className="space-y-6 animate-pulse"><div className="h-48 bg-gray-200 rounded-2xl" /><div className="h-64 bg-gray-200 rounded-2xl" /></div>
  if (!lesson) return <div className="text-center py-16"><p className="text-gray-500">Aula não encontrada.</p></div>

  return (
    <div className="space-y-6 max-w-2xl mx-auto">
      <Link href={`/lessons/${id}`} className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar à Aula
      </Link>

      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <BookOpen className="w-6 h-6 text-blue-500" />
        Editar Aula
      </h1>

      {error && <div className="bg-red-50 text-red-700 border border-red-200 rounded-xl px-4 py-3 text-sm">{error}</div>}
      {success && <div className="bg-green-50 text-green-700 border border-green-200 rounded-xl px-4 py-3 text-sm">{success}</div>}

      <form onSubmit={handleSubmit} className="bg-white rounded-xl border border-gray-100 p-6 space-y-5">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Título</label>
          <input
            type="text"
            value={title}
            onChange={e => setTitle(e.target.value)}
            required
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-blue-200 focus:border-blue-400"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Status</label>
          <select
            value={status}
            onChange={e => setStatus(e.target.value)}
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-blue-200 focus:border-blue-400"
          >
            <option value="draft">Rascunho</option>
            <option value="scheduled">Agendada</option>
            <option value="in_progress">Em Andamento</option>
            <option value="completed">Concluida</option>
            <option value="cancelled">Cancelada</option>
          </select>
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Descrição</label>
          <textarea
            value={description}
            onChange={e => setDescription(e.target.value)}
            rows={4}
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-blue-200 focus:border-blue-400"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Objetivos</label>
          <textarea
            value={objectives}
            onChange={e => setObjectives(e.target.value)}
            rows={3}
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-blue-200 focus:border-blue-400"
          />
        </div>

        <button
          type="submit"
          disabled={!title.trim() || saving}
          className="w-full py-3 bg-blue-600 text-white rounded-xl font-bold hover:bg-blue-700 transition-colors flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {saving ? <Loader2 className="w-5 h-5 animate-spin" /> : <Save className="w-5 h-5" />}
          {saving ? 'Salvando...' : 'Salvar Alterações'}
        </button>
      </form>
    </div>
  )
}
