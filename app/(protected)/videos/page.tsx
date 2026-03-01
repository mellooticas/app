'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { Video, Play, Search } from 'lucide-react'
import type { Tables } from '@/lib/supabase/database.types'

type FeedPost = Tables<'v_feed_posts'>

export default function VideosPage() {
  const [videos, setVideos] = useState<FeedPost[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')

  useEffect(() => {
    async function load() {
      try {
        const { data } = await supabase
          .from('v_feed_posts')
          .select('*')
          .in('content_type', ['video', 'audio'])
          .order('created_at', { ascending: false })
          .limit(30)
        if (data) setVideos(data as FeedPost[])
      } catch (error) {
        console.error('Error loading videos:', error)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  const filtered = videos.filter(v =>
    (v.caption || '').toLowerCase().includes(search.toLowerCase()) ||
    (v.author_name || '').toLowerCase().includes(search.toLowerCase())
  )

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Video className="w-6 h-6 text-red-500" />
        Vídeos
      </h1>

      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
        <input
          type="text"
          value={search}
          onChange={e => setSearch(e.target.value)}
          placeholder="Buscar vídeos..."
          className="w-full pl-10 pr-4 py-3 bg-white border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-red-200 focus:border-red-400"
        />
      </div>

      {loading ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {[1, 2, 3, 4, 5, 6].map(i => <div key={i} className="h-48 bg-gray-200 rounded-xl animate-pulse" />)}
        </div>
      ) : filtered.length === 0 ? (
        <div className="text-center py-16 bg-white rounded-2xl border border-gray-100">
          <Video className="w-12 h-12 text-gray-300 mx-auto mb-4" />
          <h3 className="text-lg font-bold text-gray-900 mb-2">Nenhum vídeo ainda</h3>
          <p className="text-sm text-gray-500">Os vídeos publicados aparecerão aqui.</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {filtered.map(v => (
            <div key={v.id} className="bg-white rounded-xl border border-gray-100 shadow-sm overflow-hidden hover:shadow-md transition-shadow group">
              <div className="aspect-video bg-gradient-to-br from-gray-800 to-gray-900 flex items-center justify-center relative">
                {v.thumbnail_url ? (
                  <img src={v.thumbnail_url} alt={v.caption || ''} className="w-full h-full object-cover" />
                ) : (
                  <Video className="w-10 h-10 text-gray-600" />
                )}
                <div className="absolute inset-0 flex items-center justify-center bg-black/20 opacity-0 group-hover:opacity-100 transition-opacity">
                  <Play className="w-12 h-12 text-white" />
                </div>
              </div>
              <div className="p-3">
                <p className="text-sm font-medium text-gray-900 line-clamp-2">{v.caption || 'Sem título'}</p>
                <div className="flex items-center justify-between mt-2 text-xs text-gray-400">
                  <span>{v.author_name}</span>
                  <span>{v.like_count || 0} curtidas</span>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
