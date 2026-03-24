'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { Globe, Loader2 } from 'lucide-react'

type Reference = {
  id: string
  title: string
  description: string
  subcategory: string  // country
  tags: string[]       // tags[0] = category (Metodologia / Programa / Instituição)
  order_index: number
}

export default function ReferencesPage() {
  const [references, setReferences] = useState<Reference[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    supabase
      .from('v_library_items')
      .select('id, title, description, subcategory, tags, order_index')
      .eq('category', 'reference')
      .order('order_index')
      .then(({ data }) => {
        setReferences((data as Reference[]) || [])
        setLoading(false)
      })
  }, [])

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Globe className="w-6 h-6 text-blue-500" />
        Referências Internacionais
      </h1>

      <p className="text-sm text-gray-600">
        Metodologias e programas internacionais que inspiram o Nipo School.
      </p>

      {loading ? (
        <div className="flex items-center justify-center py-16">
          <Loader2 className="w-6 h-6 animate-spin text-gray-400" />
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {references.map(ref => (
            <div key={ref.id} className="bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-shadow">
              <div className="flex items-start justify-between mb-2">
                <h3 className="font-bold text-gray-900">{ref.title}</h3>
                {ref.tags?.[0] && (
                  <span className="text-xs bg-blue-50 text-blue-600 px-2 py-0.5 rounded font-medium shrink-0 ml-2">
                    {ref.tags[0]}
                  </span>
                )}
              </div>
              {ref.subcategory && (
                <div className="flex items-center gap-1 text-xs text-gray-400 mb-2">
                  <Globe className="w-3 h-3" /> {ref.subcategory}
                </div>
              )}
              <p className="text-sm text-gray-500">{ref.description}</p>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
