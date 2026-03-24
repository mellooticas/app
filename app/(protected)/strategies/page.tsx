'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { Lightbulb, BookOpen, Users, Music, Loader2, type LucideIcon } from 'lucide-react'

type Strategy = {
  id: string
  title: string
  description: string
  subcategory: string  // icon name
  order_index: number
}

type Methodology = {
  id: string
  title: string
  description: string
  tags: string[]  // tags[0] = philosophy
  order_index: number
}

const ICON_MAP: Record<string, LucideIcon> = {
  Users,
  Music,
  Lightbulb,
  BookOpen,
}

export default function StrategiesPage() {
  const [strategies, setStrategies] = useState<Strategy[]>([])
  const [methodologies, setMethodologies] = useState<Methodology[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    Promise.all([
      supabase
        .from('v_library_items')
        .select('id, title, description, subcategory, order_index')
        .eq('category', 'strategy')
        .order('order_index'),
      supabase
        .from('v_library_items')
        .select('id, title, description, tags, order_index')
        .eq('category', 'methodology')
        .order('order_index'),
    ]).then(([s, m]) => {
      setStrategies((s.data as Strategy[]) || [])
      setMethodologies((m.data as Methodology[]) || [])
      setLoading(false)
    })
  }, [])

  if (loading) {
    return (
      <div className="flex items-center justify-center py-24">
        <Loader2 className="w-6 h-6 animate-spin text-gray-400" />
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Lightbulb className="w-6 h-6 text-yellow-500" />
        Estratégias Pedagógicas
      </h1>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {strategies.map(s => {
          const Icon: LucideIcon = ICON_MAP[s.subcategory] ?? Lightbulb
          return (
            <div key={s.id} className="bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-shadow">
              <div className="flex items-center gap-3 mb-3">
                <div className="w-10 h-10 bg-yellow-50 rounded-xl flex items-center justify-center">
                  <Icon className="w-5 h-5 text-yellow-600" />
                </div>
                <h3 className="font-bold text-gray-900">{s.title}</h3>
              </div>
              <p className="text-sm text-gray-500">{s.description}</p>
            </div>
          )
        })}
      </div>

      <h2 className="text-lg font-bold text-gray-900 mt-8">Metodologias Ativas</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {methodologies.map(m => (
          <div key={m.id} className="bg-white rounded-xl border border-gray-100 p-5">
            <h3 className="font-bold text-gray-900 mb-1">{m.title}</h3>
            {m.tags?.[0] && (
              <p className="text-xs text-gray-400 italic mb-2">{m.tags[0]}</p>
            )}
            <p className="text-sm text-gray-500">{m.description}</p>
          </div>
        ))}
      </div>
    </div>
  )
}
