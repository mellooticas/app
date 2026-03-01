'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { ArrowLeft, Plus, Music } from 'lucide-react'
import Link from 'next/link'
import { createRepertoire } from '@/app/actions/repertoire-actions'

export default function NewRepertoirePage() {
  const router = useRouter()
  const [title, setTitle] = useState('')
  const [composer, setComposer] = useState('')
  const [arranger, setArranger] = useState('')
  const [difficulty, setDifficulty] = useState('1')
  const [keySignature, setKeySignature] = useState('')
  const [notes, setNotes] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!title.trim()) return
    setLoading(true)
    setError('')

    const result = await createRepertoire({
      title,
      composer: composer || undefined,
      arranger: arranger || undefined,
      difficulty_level: Number(difficulty),
      key_signature: keySignature || undefined,
      notes: notes || undefined,
    })

    if ('error' in result) {
      setError(result.error)
      setLoading(false)
    } else {
      router.push('/repertoire')
    }
  }

  return (
    <div className="space-y-6 max-w-2xl mx-auto">
      <Link href="/repertoire" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar ao Repertório
      </Link>

      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Music className="w-6 h-6 text-amber-500" />
        Novo Repertório
      </h1>

      {error && (
        <div className="bg-red-50 text-red-700 border border-red-200 rounded-xl px-4 py-3 text-sm">{error}</div>
      )}

      <form onSubmit={handleSubmit} className="bg-white rounded-xl border border-gray-100 p-6 space-y-5">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Título *</label>
          <input
            type="text"
            value={title}
            onChange={e => setTitle(e.target.value)}
            placeholder="Ex: Asa Branca"
            required
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-amber-200 focus:border-amber-400"
          />
        </div>

        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Compositor</label>
            <input
              type="text"
              value={composer}
              onChange={e => setComposer(e.target.value)}
              placeholder="Ex: Luiz Gonzaga"
              className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-amber-200 focus:border-amber-400"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Arranjador</label>
            <input
              type="text"
              value={arranger}
              onChange={e => setArranger(e.target.value)}
              placeholder="Ex: Nome do arranjador"
              className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-amber-200 focus:border-amber-400"
            />
          </div>
        </div>

        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Dificuldade</label>
            <select
              value={difficulty}
              onChange={e => setDifficulty(e.target.value)}
              className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-amber-200 focus:border-amber-400"
            >
              <option value="1">Fácil</option>
              <option value="2">Médio</option>
              <option value="3">Difícil</option>
              <option value="4">Expert</option>
              <option value="5">Lendário</option>
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Tonalidade</label>
            <input
              type="text"
              value={keySignature}
              onChange={e => setKeySignature(e.target.value)}
              placeholder="Ex: Dó Maior"
              className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-amber-200 focus:border-amber-400"
            />
          </div>
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Observações</label>
          <textarea
            value={notes}
            onChange={e => setNotes(e.target.value)}
            rows={3}
            placeholder="Notas adicionais sobre a peça..."
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-amber-200 focus:border-amber-400"
          />
        </div>

        <button
          type="submit"
          disabled={!title.trim() || loading}
          className="w-full py-3 bg-amber-600 text-white rounded-xl font-bold hover:bg-amber-700 transition-colors flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {loading ? 'Salvando...' : <><Plus className="w-5 h-5" /> Criar Repertório</>}
        </button>
      </form>
    </div>
  )
}
