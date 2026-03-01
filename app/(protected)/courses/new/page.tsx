'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { ArrowLeft, Plus, Users, Loader2 } from 'lucide-react'
import Link from 'next/link'
import { createCourse } from '@/app/actions/course-actions'

export default function NewCoursePage() {
  const router = useRouter()
  const [name, setName] = useState('')
  const [level, setLevel] = useState('beginner')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!name.trim()) return
    setLoading(true)
    setError('')

    const result = await createCourse({
      name: name.trim(),
      level: level as 'beginner' | 'intermediate' | 'advanced',
    })

    if ('error' in result) {
      setError(result.error)
      setLoading(false)
    } else {
      router.push('/courses')
    }
  }

  return (
    <div className="space-y-6 max-w-2xl mx-auto">
      <Link href="/courses" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar às Turmas
      </Link>

      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Users className="w-6 h-6 text-blue-500" />
        Nova Turma
      </h1>

      {error && (
        <div className="bg-red-50 text-red-700 border border-red-200 rounded-xl px-4 py-3 text-sm">{error}</div>
      )}

      <form onSubmit={handleSubmit} className="bg-white rounded-xl border border-gray-100 p-6 space-y-5">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Nome da Turma *</label>
          <input
            type="text"
            value={name}
            onChange={e => setName(e.target.value)}
            placeholder="Ex: Violão Iniciante - Manhã"
            required
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-blue-200 focus:border-blue-400"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Nível</label>
          <select
            value={level}
            onChange={e => setLevel(e.target.value)}
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-blue-200 focus:border-blue-400"
          >
            <option value="beginner">Iniciante</option>
            <option value="intermediate">Intermediário</option>
            <option value="advanced">Avançado</option>
          </select>
        </div>

        <button
          type="submit"
          disabled={!name.trim() || loading}
          className="w-full py-3 bg-blue-600 text-white rounded-xl font-bold hover:bg-blue-700 transition-colors flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {loading ? <Loader2 className="w-5 h-5 animate-spin" /> : <Plus className="w-5 h-5" />}
          {loading ? 'Criando...' : 'Criar Turma'}
        </button>
      </form>
    </div>
  )
}
