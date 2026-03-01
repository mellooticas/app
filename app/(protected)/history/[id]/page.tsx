'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { Scroll, ArrowLeft, User, Music, Calendar } from 'lucide-react'
import Link from 'next/link'
import type { Tables } from '@/lib/supabase/database.types'

type Period = Tables<'v_history_periods'>
type Composer = Tables<'v_history_composers'>
type Work = Tables<'v_history_works'>

export default function HistoryDetailPage() {
  const { id } = useParams<{ id: string }>()
  const [period, setPeriod] = useState<Period | null>(null)
  const [composers, setComposers] = useState<Composer[]>([])
  const [works, setWorks] = useState<Work[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const { data: p } = await supabase.from('v_history_periods').select('*').eq('id', id).single()
        if (p) {
          setPeriod(p as Period)
          const { data: c } = await supabase.from('v_history_composers').select('*').eq('period_id', id).order('full_name')
          if (c) setComposers(c as Composer[])
          const { data: w } = await supabase.from('v_history_works').select('*').eq('period_id', id).order('title')
          if (w) setWorks(w as Work[])
        }
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  if (loading) return <div className="space-y-6 animate-pulse"><div className="h-48 bg-gray-200 rounded-2xl" /><div className="h-64 bg-gray-200 rounded-2xl" /></div>
  if (!period) return <div className="text-center py-16"><p className="text-gray-500">Período não encontrado.</p><Link href="/history" className="text-amber-600 hover:underline mt-4 inline-block">Voltar</Link></div>

  return (
    <div className="space-y-6">
      <Link href="/history" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar à História
      </Link>

      <div className="rounded-2xl overflow-hidden shadow-sm" style={{ backgroundColor: period.theme_color || '#F59E0B' }}>
        <div className="p-8 text-white">
          <div className="flex items-center gap-2 mb-2 text-sm opacity-80">
            <Calendar className="w-4 h-4" />
            {period.start_year} — {period.end_year}
          </div>
          <h1 className="text-3xl font-bold">{period.name}</h1>
          <div className="flex items-center gap-4 mt-4 text-sm opacity-80">
            <span>{period.composer_count || 0} compositores</span>
            <span>{period.work_count || 0} obras</span>
          </div>
        </div>
      </div>

      {period.description && (
        <div className="bg-white rounded-xl border border-gray-100 p-6">
          <h2 className="font-bold text-gray-900 mb-3">Sobre o Período</h2>
          <p className="text-sm text-gray-600 whitespace-pre-wrap">{period.description}</p>
        </div>
      )}

      {composers.length > 0 && (
        <div>
          <h2 className="text-lg font-bold text-gray-900 mb-4">Compositores ({composers.length})</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {composers.map(c => (
              <div key={c.id} className="bg-white rounded-xl border border-gray-100 p-4 flex items-start gap-3">
                <div className="w-12 h-12 rounded-full bg-amber-50 flex items-center justify-center shrink-0">
                  {c.photo_url ? (
                    <img src={c.photo_url} alt={c.full_name} className="w-full h-full rounded-full object-cover" />
                  ) : (
                    <User className="w-6 h-6 text-amber-400" />
                  )}
                </div>
                <div className="min-w-0">
                  <h3 className="font-bold text-sm text-gray-900">{c.full_name}</h3>
                  {c.birth_date && <p className="text-xs text-gray-400">{new Date(c.birth_date).getFullYear()} — {c.death_date ? new Date(c.death_date).getFullYear() : 'presente'}</p>}
                  {c.birth_country && <p className="text-xs text-gray-500">{c.birth_country}</p>}
                  <span className="text-xs text-amber-600">{c.work_count || 0} obras</span>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {works.length > 0 && (
        <div>
          <h2 className="text-lg font-bold text-gray-900 mb-4">Obras ({works.length})</h2>
          <div className="space-y-2">
            {works.map(w => (
              <div key={w.id} className="bg-white rounded-xl border border-gray-100 p-4 flex items-center gap-4">
                <Music className="w-5 h-5 text-amber-400 shrink-0" />
                <div className="flex-1 min-w-0">
                  <h3 className="font-bold text-sm text-gray-900 truncate">{w.title}</h3>
                  <p className="text-xs text-gray-400">{w.composer_name}</p>
                </div>
                {w.audio_url && <audio controls className="h-8" src={w.audio_url} />}
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}
