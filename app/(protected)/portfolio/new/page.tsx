'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { ArrowLeft, Upload, Briefcase, Loader2 } from 'lucide-react'
import Link from 'next/link'
import { submitPortfolioV2 } from '@/app/actions/portfolio-actions-v2'

export default function NewPortfolioPage() {
  const router = useRouter()
  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const [workType, setWorkType] = useState('performance')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!title.trim()) return
    setLoading(true)
    setError('')

    const result = await submitPortfolioV2({
      title: title.trim(),
      work_type: workType,
      description: description.trim() || undefined,
    })

    if ('error' in result) {
      setError(result.error)
      setLoading(false)
    } else {
      router.push('/portfolio')
    }
  }

  return (
    <div className="space-y-6 max-w-2xl mx-auto">
      <Link href="/portfolio" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar ao Portfólio
      </Link>

      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Briefcase className="w-6 h-6 text-teal-500" />
        Nova Entrada no Portfólio
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
            placeholder="Ex: Minha performance de violão"
            required
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-teal-200 focus:border-teal-400"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Tipo de Trabalho</label>
          <select
            value={workType}
            onChange={e => setWorkType(e.target.value)}
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-teal-200 focus:border-teal-400"
          >
            <option value="performance">Performance</option>
            <option value="composition">Composição</option>
            <option value="arrangement">Arranjo</option>
            <option value="recording">Gravação</option>
            <option value="reflection">Reflexão</option>
            <option value="other">Outro</option>
          </select>
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Descrição</label>
          <textarea
            value={description}
            onChange={e => setDescription(e.target.value)}
            rows={4}
            placeholder="Descreva seu trabalho, o que você aprendeu, desafios enfrentados..."
            className="w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-teal-200 focus:border-teal-400"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Evidências</label>
          <div className="border-2 border-dashed border-gray-200 rounded-xl p-8 text-center hover:border-teal-300 transition-colors cursor-pointer">
            <Upload className="w-8 h-8 text-gray-400 mx-auto mb-2" />
            <p className="text-sm text-gray-500">Upload de arquivos em breve</p>
            <p className="text-xs text-gray-400 mt-1">Vídeo, áudio, imagem ou documento (máx 50MB)</p>
          </div>
        </div>

        <button
          type="submit"
          disabled={!title.trim() || loading}
          className="w-full py-3 bg-teal-600 text-white rounded-xl font-bold hover:bg-teal-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
        >
          {loading ? <Loader2 className="w-5 h-5 animate-spin" /> : null}
          {loading ? 'Enviando...' : 'Enviar ao Portfólio'}
        </button>
      </form>
    </div>
  )
}
