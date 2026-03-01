'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { Briefcase, ArrowLeft, User, Calendar, Star, MessageSquare } from 'lucide-react'
import Link from 'next/link'
import { RoleView } from '@/components/auth/RoleView'
import type { Tables } from '@/lib/supabase/database.types'

type Portfolio = Tables<'v_portfolios'>

export default function PortfolioDetailPage() {
  const { id } = useParams<{ id: string }>()
  const [portfolio, setPortfolio] = useState<Portfolio | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const { data } = await supabase.from('v_portfolios').select('*').eq('id', id).single()
        if (data) setPortfolio(data as Portfolio)
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  if (loading) return <div className="space-y-6 animate-pulse"><div className="h-48 bg-gray-200 rounded-2xl" /><div className="h-64 bg-gray-200 rounded-2xl" /></div>
  if (!portfolio) return <div className="text-center py-16"><p className="text-gray-500">Portfólio não encontrado.</p><Link href="/portfolio" className="text-teal-600 hover:underline mt-4 inline-block">Voltar</Link></div>

  const statusLabels: Record<string, string> = { draft: 'Rascunho', submitted: 'Enviado', in_review: 'Em Revisão', evaluated: 'Avaliado' }
  const statusColors: Record<string, string> = { draft: 'bg-gray-100 text-gray-600', submitted: 'bg-blue-100 text-blue-700', in_review: 'bg-amber-100 text-amber-700', evaluated: 'bg-green-100 text-green-700' }

  return (
    <div className="space-y-6">
      <Link href="/portfolio" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar ao Portfólio
      </Link>

      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
        <div className="flex items-start justify-between mb-4">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">{portfolio.title}</h1>
            <div className="flex items-center gap-3 mt-2 text-sm text-gray-500">
              <span className="flex items-center gap-1"><User className="w-4 h-4" />{portfolio.student_name}</span>
              <span className="flex items-center gap-1"><Calendar className="w-4 h-4" />{new Date(portfolio.created_at).toLocaleDateString('pt-BR')}</span>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <span className={`px-3 py-1 rounded-full text-xs font-bold ${statusColors[portfolio.status] || 'bg-gray-100'}`}>
              {statusLabels[portfolio.status] || portfolio.status}
            </span>
            {portfolio.grade !== null && (
              <div className="flex items-center gap-1 text-amber-500">
                <Star className="w-5 h-5" />
                <span className="text-lg font-bold">{portfolio.grade}</span>
              </div>
            )}
          </div>
        </div>

        {portfolio.work_type && (
          <span className="inline-block bg-teal-50 text-teal-600 px-2 py-0.5 rounded text-xs font-medium mb-4">{portfolio.work_type}</span>
        )}

        {portfolio.description && (
          <div className="mb-6">
            <h2 className="font-bold text-gray-900 mb-2">Descrição</h2>
            <p className="text-sm text-gray-600 whitespace-pre-wrap">{portfolio.description}</p>
          </div>
        )}

        {portfolio.instrument_name && (
          <div className="mb-6">
            <h2 className="font-bold text-gray-900 mb-2">Instrumento</h2>
            <p className="text-sm text-gray-600">{portfolio.instrument_name}</p>
          </div>
        )}

        {portfolio.feedback && (
          <div className="bg-green-50 rounded-xl p-4 mb-6">
            <div className="flex items-center gap-2 mb-2">
              <MessageSquare className="w-4 h-4 text-green-600" />
              <h2 className="font-bold text-green-800 text-sm">Feedback do Professor</h2>
            </div>
            <p className="text-sm text-green-700">{portfolio.feedback}</p>
            {portfolio.evaluator_name && <p className="text-xs text-green-500 mt-2">— {portfolio.evaluator_name}</p>}
          </div>
        )}

        <RoleView
          teacher={
            portfolio.status !== 'evaluated' ? (
              <div className="bg-gray-50 rounded-xl p-6">
                <h3 className="font-bold text-gray-900 mb-4">Avaliar Trabalho</h3>
                <div className="space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Nota (0-10)</label>
                    <input type="number" min="0" max="10" step="0.5" className="w-32 px-3 py-2 border border-gray-200 rounded-lg text-sm" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Feedback</label>
                    <textarea rows={3} className="w-full px-3 py-2 border border-gray-200 rounded-lg text-sm" placeholder="Escreva seu feedback..." />
                  </div>
                  <button className="px-6 py-2 bg-teal-600 text-white rounded-xl font-bold hover:bg-teal-700 transition-colors">
                    Enviar Avaliação
                  </button>
                </div>
              </div>
            ) : null
          }
        />
      </div>
    </div>
  )
}
