'use client'

import { useEffect, useState } from 'react'
import { useParams, useRouter } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { CheckCircle, ArrowLeft, User, FileText, Loader2 } from 'lucide-react'
import Link from 'next/link'
import { evaluateSubmission } from '@/app/actions/challenge-actions'
import type { Tables } from '@/lib/supabase/database.types'

type Submission = Tables<'v_challenge_submissions'>

export default function EvaluateDetailPage() {
  const { id } = useParams<{ id: string }>()
  const router = useRouter()
  const [submission, setSubmission] = useState<Submission | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [grade, setGrade] = useState('')
  const [feedback, setFeedback] = useState('')
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  useEffect(() => {
    async function load() {
      try {
        const { data } = await supabase.from('v_challenge_submissions').select('*').eq('id', id).single()
        if (data) {
          const sub = data as Submission
          setSubmission(sub)
          if (sub.grade !== null) setGrade(String(sub.grade))
          if (sub.feedback) setFeedback(sub.feedback)
        }
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  async function handleEvaluate(status: 'evaluated' | 'rejected') {
    if (!grade || !feedback.trim()) {
      setError('Preencha a nota e o feedback')
      return
    }
    setSaving(true)
    setError('')

    const result = await evaluateSubmission({
      submission_id: id,
      grade: Number(grade),
      feedback: feedback.trim(),
      status,
    })

    if ('error' in result) {
      setError(result.error)
      setSaving(false)
    } else {
      setSuccess(status === 'evaluated' ? 'Aprovado com sucesso!' : 'Rejeitado.')
      setTimeout(() => router.push('/evaluate'), 1500)
    }
  }

  if (loading) return <div className="space-y-6 animate-pulse"><div className="h-48 bg-gray-200 rounded-2xl" /><div className="h-64 bg-gray-200 rounded-2xl" /></div>
  if (!submission) return <div className="text-center py-16"><p className="text-gray-500">Submissão não encontrada.</p><Link href="/evaluate" className="text-green-600 hover:underline mt-4 inline-block">Voltar</Link></div>

  const statusLabels: Record<string, string> = { pending: 'Pendente', in_review: 'Em Revisão', evaluated: 'Avaliado', rejected: 'Rejeitado' }
  const statusColors: Record<string, string> = { pending: 'bg-yellow-100 text-yellow-700', in_review: 'bg-blue-100 text-blue-700', evaluated: 'bg-green-100 text-green-700', rejected: 'bg-red-100 text-red-700' }

  return (
    <div className="space-y-6 max-w-3xl mx-auto">
      <Link href="/evaluate" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar ao SpeedGrader
      </Link>

      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
        <div className="flex items-start justify-between mb-6">
          <div>
            <h1 className="text-xl font-bold text-gray-900">{submission.challenge_title || 'Submissão'}</h1>
            <div className="flex items-center gap-3 mt-2 text-sm text-gray-500">
              <span className="flex items-center gap-1"><User className="w-4 h-4" />{submission.student_name}</span>
              <span>{new Date(submission.created_at).toLocaleDateString('pt-BR')}</span>
            </div>
          </div>
          <span className={`px-3 py-1 rounded-full text-xs font-bold ${statusColors[submission.status] || 'bg-gray-100'}`}>
            {statusLabels[submission.status] || submission.status}
          </span>
        </div>

        {submission.response && (
          <div className="mb-6">
            <h2 className="font-bold text-gray-900 mb-2">Resposta do Aluno</h2>
            <div className="bg-gray-50 rounded-xl p-4 text-sm text-gray-700 whitespace-pre-wrap">{submission.response}</div>
          </div>
        )}

        {submission.file_url && (
          <div className="mb-6">
            <h2 className="font-bold text-gray-900 mb-2">Arquivo Enviado</h2>
            <a href={submission.file_url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-2 px-4 py-2 bg-gray-100 rounded-xl text-sm text-gray-700 hover:bg-gray-200 transition-colors">
              <FileText className="w-4 h-4" /> Abrir arquivo
            </a>
          </div>
        )}

        <div className="border-t border-gray-100 pt-6">
          <h2 className="font-bold text-gray-900 mb-4 flex items-center gap-2">
            <CheckCircle className="w-5 h-5 text-green-500" />
            Avaliação
          </h2>

          {error && <div className="bg-red-50 text-red-700 border border-red-200 rounded-xl px-4 py-3 text-sm mb-4">{error}</div>}
          {success && <div className="bg-green-50 text-green-700 border border-green-200 rounded-xl px-4 py-3 text-sm mb-4">{success}</div>}

          <div className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Nota (0-10)</label>
              <input
                type="number"
                min="0"
                max="10"
                step="0.5"
                value={grade}
                onChange={e => setGrade(e.target.value)}
                className="w-32 px-4 py-2 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-green-200"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Feedback</label>
              <textarea
                value={feedback}
                onChange={e => setFeedback(e.target.value)}
                rows={4}
                placeholder="Escreva seu feedback para o aluno..."
                className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-green-200"
              />
            </div>

            <div className="flex gap-3">
              <button
                onClick={() => handleEvaluate('evaluated')}
                disabled={saving}
                className="px-6 py-2 bg-green-600 text-white rounded-xl font-bold hover:bg-green-700 transition-colors disabled:opacity-50 flex items-center gap-2"
              >
                {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : null}
                Aprovar e Avaliar
              </button>
              <button
                onClick={() => handleEvaluate('rejected')}
                disabled={saving}
                className="px-6 py-2 bg-red-100 text-red-700 rounded-xl font-bold hover:bg-red-200 transition-colors disabled:opacity-50"
              >
                Rejeitar
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
