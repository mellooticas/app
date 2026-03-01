'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { Music, ArrowLeft, Globe, Layers, Volume2, Video } from 'lucide-react'
import Link from 'next/link'
import type { Tables } from '@/lib/supabase/database.types'

type Instrument = Tables<'v_instruments'>

export default function InstrumentDetailPage() {
  const { id } = useParams<{ id: string }>()
  const [instrument, setInstrument] = useState<Instrument | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const { data } = await supabase.from('v_instruments').select('*').eq('id', id).single()
        if (data) setInstrument(data as Instrument)
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  if (loading) return <div className="space-y-6 animate-pulse"><div className="h-64 bg-gray-200 rounded-2xl" /><div className="h-48 bg-gray-200 rounded-2xl" /></div>
  if (!instrument) return <div className="text-center py-16"><p className="text-gray-500">Instrumento não encontrado.</p><Link href="/instruments" className="text-purple-600 hover:underline mt-4 inline-block">Voltar</Link></div>

  return (
    <div className="space-y-6">
      <Link href="/instruments" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar aos Instrumentos
      </Link>

      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
        <div className="aspect-[3/1] bg-gradient-to-br from-purple-100 to-indigo-100 flex items-center justify-center relative">
          {instrument.image_url ? (
            <img src={instrument.image_url} alt={instrument.name} className="w-full h-full object-cover" />
          ) : (
            <Music className="w-20 h-20 text-purple-300" />
          )}
        </div>

        <div className="p-6 space-y-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">{instrument.name}</h1>
            <div className="flex items-center gap-3 mt-2 text-sm text-gray-500">
              {instrument.family && <span className="flex items-center gap-1"><Layers className="w-4 h-4" />{instrument.family}</span>}
              {instrument.origin && <span className="flex items-center gap-1"><Globe className="w-4 h-4" />{instrument.origin}</span>}
              {instrument.category && <span className="bg-purple-50 text-purple-600 px-2 py-0.5 rounded text-xs font-medium">{instrument.category}</span>}
            </div>
          </div>

          {instrument.description && (
            <div>
              <h2 className="font-bold text-gray-900 mb-2">Sobre</h2>
              <p className="text-sm text-gray-600 whitespace-pre-wrap">{instrument.description}</p>
            </div>
          )}

          {instrument.detailed_description && (
            <div>
              <h2 className="font-bold text-gray-900 mb-2">Detalhes</h2>
              <p className="text-sm text-gray-600 whitespace-pre-wrap">{instrument.detailed_description}</p>
            </div>
          )}

          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {instrument.difficulty_level && (
              <div className="bg-gray-50 rounded-xl p-4 text-center">
                <p className="text-xs text-gray-500">Dificuldade</p>
                <p className="text-lg font-bold text-gray-900">{instrument.difficulty_level}/5</p>
              </div>
            )}
            {instrument.sounds_count > 0 && (
              <div className="bg-purple-50 rounded-xl p-4 text-center">
                <Volume2 className="w-5 h-5 text-purple-500 mx-auto mb-1" />
                <p className="text-lg font-bold text-gray-900">{instrument.sounds_count}</p>
                <p className="text-xs text-gray-500">Sons</p>
              </div>
            )}
            {instrument.media_count > 0 && (
              <div className="bg-blue-50 rounded-xl p-4 text-center">
                <Video className="w-5 h-5 text-blue-500 mx-auto mb-1" />
                <p className="text-lg font-bold text-gray-900">{instrument.media_count}</p>
                <p className="text-xs text-gray-500">Mídias</p>
              </div>
            )}
          </div>

          {instrument.audio_url && (
            <div>
              <h2 className="font-bold text-gray-900 mb-2">Áudio</h2>
              <audio controls className="w-full" src={instrument.audio_url} />
            </div>
          )}

          {instrument.video_url && (
            <div>
              <h2 className="font-bold text-gray-900 mb-2">Vídeo</h2>
              <video controls className="w-full rounded-xl" src={instrument.video_url} />
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
