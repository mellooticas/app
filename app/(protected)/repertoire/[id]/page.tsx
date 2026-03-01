'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { BookOpen, ArrowLeft, Music, Headphones, Video, FileText } from 'lucide-react'
import Link from 'next/link'
import type { Tables } from '@/lib/supabase/database.types'

type Repertoire = Tables<'v_repertoire'>

export default function RepertoireDetailPage() {
  const { id } = useParams<{ id: string }>()
  const [item, setItem] = useState<Repertoire | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const { data } = await supabase.from('v_repertoire').select('*').eq('id', id).single()
        if (data) setItem(data as Repertoire)
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  if (loading) return <div className="space-y-6 animate-pulse"><div className="h-48 bg-gray-200 rounded-2xl" /><div className="h-64 bg-gray-200 rounded-2xl" /></div>
  if (!item) return <div className="text-center py-16"><p className="text-gray-500">Repertório não encontrado.</p><Link href="/repertoire" className="text-emerald-600 hover:underline mt-4 inline-block">Voltar</Link></div>

  return (
    <div className="space-y-6">
      <Link href="/repertoire" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar ao Repertório
      </Link>

      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
        <div className="bg-gradient-to-r from-emerald-500 to-teal-500 p-8 text-white">
          <h1 className="text-2xl font-bold">{item.title}</h1>
          {item.composer && <p className="text-emerald-100 mt-1">{item.composer}</p>}
          <div className="flex items-center gap-3 mt-3">
            {item.category_name && <span className="bg-white/20 px-3 py-1 rounded-full text-xs font-bold">{item.category_name}</span>}
            {item.difficulty_level && <span className="bg-white/20 px-3 py-1 rounded-full text-xs font-bold">Nível {item.difficulty_level}</span>}
          </div>
        </div>

        <div className="p-6 space-y-6">
          {item.notes && (
            <div>
              <h2 className="font-bold text-gray-900 mb-2">Observações</h2>
              <p className="text-sm text-gray-600 whitespace-pre-wrap">{item.notes}</p>
            </div>
          )}

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            {item.sheet_music_url && (
              <a href={item.sheet_music_url} target="_blank" rel="noopener noreferrer" className="bg-gray-50 rounded-xl p-4 flex items-center gap-3 hover:bg-gray-100 transition-colors">
                <FileText className="w-8 h-8 text-emerald-500" />
                <div>
                  <p className="font-bold text-sm text-gray-900">Partitura</p>
                  <p className="text-xs text-gray-500">Abrir PDF</p>
                </div>
              </a>
            )}
            {item.playback_url && (
              <div className="bg-gray-50 rounded-xl p-4">
                <div className="flex items-center gap-3 mb-2">
                  <Headphones className="w-8 h-8 text-blue-500" />
                  <div>
                    <p className="font-bold text-sm text-gray-900">Playback</p>
                    <p className="text-xs text-gray-500">Acompanhamento</p>
                  </div>
                </div>
                <audio controls className="w-full mt-2" src={item.playback_url} />
              </div>
            )}
            {item.tutorial_video_url && (
              <a href={item.tutorial_video_url} target="_blank" rel="noopener noreferrer" className="bg-gray-50 rounded-xl p-4 flex items-center gap-3 hover:bg-gray-100 transition-colors">
                <Video className="w-8 h-8 text-red-500" />
                <div>
                  <p className="font-bold text-sm text-gray-900">Tutorial</p>
                  <p className="text-xs text-gray-500">Assistir vídeo</p>
                </div>
              </a>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
