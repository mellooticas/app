'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { MapPin, Music, ExternalLink, Loader2 } from 'lucide-react'

type Experience = {
  id: string
  title: string
  description: string
  subcategory: string  // location
  file_url: string | null
  order_index: number
}

export default function ExperiencesPage() {
  const [experiences, setExperiences] = useState<Experience[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    supabase
      .from('v_library_items')
      .select('id, title, description, subcategory, file_url, order_index')
      .eq('category', 'experience')
      .order('order_index')
      .then(({ data }) => {
        setExperiences((data as Experience[]) || [])
        setLoading(false)
      })
  }, [])

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <MapPin className="w-6 h-6 text-green-500" />
        Experiências Musicais BR
      </h1>

      <p className="text-sm text-gray-600">
        Projetos e experiências inspiradoras de educação musical no Brasil.
      </p>

      {loading ? (
        <div className="flex items-center justify-center py-16">
          <Loader2 className="w-6 h-6 animate-spin text-gray-400" />
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {experiences.map(exp => (
            <div key={exp.id} className="bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-shadow">
              <div className="flex items-start justify-between mb-3">
                <div className="flex items-center gap-2">
                  <Music className="w-5 h-5 text-green-500" />
                  <h3 className="font-bold text-gray-900">{exp.title}</h3>
                </div>
                {exp.subcategory && (
                  <span className="text-xs bg-green-50 text-green-600 px-2 py-0.5 rounded font-medium flex items-center gap-1 shrink-0 ml-2">
                    <MapPin className="w-3 h-3" />{exp.subcategory}
                  </span>
                )}
              </div>
              <p className="text-sm text-gray-500">{exp.description}</p>
              {exp.file_url && (
                <a href={exp.file_url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 mt-3 text-xs text-green-600 hover:underline font-medium">
                  Visitar site <ExternalLink className="w-3 h-3" />
                </a>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
