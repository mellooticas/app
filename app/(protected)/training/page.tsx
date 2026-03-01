'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { GraduationCap, BookOpen, ExternalLink } from 'lucide-react'
import type { Tables } from '@/lib/supabase/database.types'

type Material = Tables<'v_support_materials'>

export default function TrainingPage() {
  const [materials, setMaterials] = useState<Material[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const { data } = await supabase
          .from('v_support_materials')
          .select('*')
          .eq('category', 'formacao')
          .order('created_at', { ascending: false })
        if (data) setMaterials(data as Material[])
      } catch (error) {
        console.error('Error loading training:', error)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <GraduationCap className="w-6 h-6 text-indigo-500" />
        Formação Docente
      </h1>

      <p className="text-sm text-gray-600">
        Recursos e materiais para desenvolvimento profissional e formação continuada.
      </p>

      {loading ? (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">{[1, 2, 3, 4].map(i => <div key={i} className="h-32 bg-gray-200 rounded-xl animate-pulse" />)}</div>
      ) : materials.length === 0 ? (
        <div className="text-center py-16 bg-white rounded-2xl border border-gray-100">
          <GraduationCap className="w-12 h-12 text-gray-300 mx-auto mb-4" />
          <h3 className="text-lg font-bold text-gray-900 mb-2">Conteúdo em preparação</h3>
          <p className="text-sm text-gray-500">Materiais de formação docente serão adicionados em breve.</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {materials.map(m => (
            <div key={m.id} className="bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-shadow">
              <div className="flex items-start gap-3">
                <BookOpen className="w-5 h-5 text-indigo-500 mt-1 shrink-0" />
                <div className="flex-1">
                  <h3 className="font-bold text-sm text-gray-900">{m.title}</h3>
                  {m.description && <p className="text-xs text-gray-500 mt-1 line-clamp-2">{m.description}</p>}
                  <div className="flex items-center gap-2 mt-3">
                    <span className="text-xs bg-indigo-50 text-indigo-600 px-2 py-0.5 rounded font-medium">{m.material_type}</span>
                    {m.file_url && (
                      <a href={m.file_url} target="_blank" rel="noopener noreferrer" className="text-xs text-indigo-600 flex items-center gap-1 hover:underline">
                        Abrir <ExternalLink className="w-3 h-3" />
                      </a>
                    )}
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
