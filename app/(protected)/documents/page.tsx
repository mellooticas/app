'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { FileText, Download, Search, ExternalLink } from 'lucide-react'
import type { Tables } from '@/lib/supabase/database.types'

type Material = Tables<'v_support_materials'>

export default function DocumentsPage() {
  const [docs, setDocs] = useState<Material[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')

  useEffect(() => {
    async function load() {
      try {
        const { data } = await supabase
          .from('v_support_materials')
          .select('*')
          .in('material_type', ['documento', 'pdf', 'planilha', 'template'])
          .order('title')
        if (data) setDocs(data as Material[])
      } catch (error) {
        console.error('Error loading documents:', error)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  const filtered = docs.filter(d =>
    d.title.toLowerCase().includes(search.toLowerCase()) ||
    (d.description || '').toLowerCase().includes(search.toLowerCase())
  )

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <FileText className="w-6 h-6 text-orange-500" />
        Documentos
      </h1>

      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
        <input
          type="text"
          value={search}
          onChange={e => setSearch(e.target.value)}
          placeholder="Buscar documentos..."
          className="w-full pl-10 pr-4 py-3 bg-white border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-orange-200 focus:border-orange-400"
        />
      </div>

      {loading ? (
        <div className="space-y-3">{[1, 2, 3, 4].map(i => <div key={i} className="h-20 bg-gray-200 rounded-xl animate-pulse" />)}</div>
      ) : filtered.length === 0 ? (
        <div className="text-center py-16 bg-white rounded-2xl border border-gray-100">
          <FileText className="w-12 h-12 text-gray-300 mx-auto mb-4" />
          <h3 className="text-lg font-bold text-gray-900 mb-2">Nenhum documento encontrado</h3>
          <p className="text-sm text-gray-500">Documentos pedagógicos serão adicionados em breve.</p>
        </div>
      ) : (
        <div className="space-y-2">
          {filtered.map(d => (
            <div key={d.id} className="bg-white rounded-xl border border-gray-100 p-4 flex items-center gap-4 hover:shadow-sm transition-shadow">
              <FileText className="w-8 h-8 text-orange-400 shrink-0" />
              <div className="flex-1 min-w-0">
                <h3 className="font-bold text-sm text-gray-900 truncate">{d.title}</h3>
                {d.description && <p className="text-xs text-gray-500 truncate">{d.description}</p>}
                <div className="flex items-center gap-3 mt-1 text-xs text-gray-400">
                  <span>{d.material_type}</span>
                  {d.file_size_mb && <span>{d.file_size_mb} MB</span>}
                </div>
              </div>
              {d.file_url && (
                <a href={d.file_url} target="_blank" rel="noopener noreferrer" className="p-2 text-orange-500 hover:bg-orange-50 rounded-lg transition-colors">
                  <Download className="w-5 h-5" />
                </a>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
