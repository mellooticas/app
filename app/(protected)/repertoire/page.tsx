'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { PermissionGate } from '@/components/auth/PermissionGate'
import { Music, Plus, Search, FileMusic } from 'lucide-react'
import Link from 'next/link'
import type { Tables } from '@/lib/supabase/database.types'

type Repertoire = Tables<'v_repertoire'>

export default function RepertoirePage() {
  const [items, setItems] = useState<Repertoire[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')

  useEffect(() => {
    async function load() {
      try {
        const { data } = await supabase
          .from('v_repertoire')
          .select('*')
          .order('title')
        if (data) setItems(data as Repertoire[])
      } catch (error) {
        console.error('Error loading repertoire:', error)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  const filtered = items.filter(i =>
    i.title.toLowerCase().includes(search.toLowerCase()) ||
    (i.composer || '').toLowerCase().includes(search.toLowerCase())
  )

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
          <Music className="w-6 h-6 text-pink-500" />
          Repertório
        </h1>
        <PermissionGate permission="repertoire.create">
          <Link href="/repertoire/new" className="flex items-center gap-2 px-4 py-2 bg-pink-600 text-white rounded-xl font-bold hover:bg-pink-700 transition-colors">
            <Plus className="w-4 h-4" />
            Novo
          </Link>
        </PermissionGate>
      </div>

      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
        <input type="text" value={search} onChange={e => setSearch(e.target.value)} placeholder="Buscar por título, compositor..." className="w-full pl-10 pr-4 py-3 bg-white border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-pink-200" />
      </div>

      {loading ? (
        <div className="space-y-3">{[1, 2, 3].map(i => <div key={i} className="h-16 bg-gray-200 rounded-xl animate-pulse" />)}</div>
      ) : filtered.length === 0 ? (
        <div className="text-center py-16 bg-white rounded-2xl border border-gray-100">
          <FileMusic className="w-12 h-12 text-gray-300 mx-auto mb-4" />
          <h3 className="text-lg font-bold text-gray-900 mb-2">{search ? 'Nenhum resultado' : 'Repertório vazio'}</h3>
        </div>
      ) : (
        <div className="space-y-2">
          {filtered.map(item => (
            <Link key={item.id} href={`/repertoire/${item.id}`} className="block group">
              <div className="bg-white rounded-xl border border-gray-100 p-4 hover:shadow-md hover:border-pink-200 transition-all flex items-center gap-4">
                <div className="w-10 h-10 bg-pink-50 rounded-lg flex items-center justify-center">
                  <Music className="w-5 h-5 text-pink-500" />
                </div>
                <div className="flex-1 min-w-0">
                  <h3 className="font-bold text-sm text-gray-900">{item.title}</h3>
                  <p className="text-xs text-gray-400">{item.composer} {item.category_name && `• ${item.category_name}`}</p>
                </div>
                {item.difficulty_level && (
                  <span className="text-xs bg-gray-100 text-gray-600 px-2 py-1 rounded font-medium capitalize">{item.difficulty_level}</span>
                )}
              </div>
            </Link>
          ))}
        </div>
      )}
    </div>
  )
}
