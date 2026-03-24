'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { Building, MapPin, Users, Loader2 } from 'lucide-react'

type Space = {
  id: string
  name: string
  type: string
  capacity: number
  description: string
  available: boolean
  order_index: number
}

export default function SpacesPage() {
  const [spaces, setSpaces] = useState<Space[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    supabase
      .from('v_spaces')
      .select('*')
      .order('order_index')
      .then(({ data }) => {
        setSpaces((data as Space[]) || [])
        setLoading(false)
      })
  }, [])

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Building className="w-6 h-6 text-violet-500" />
        Espaços Alternativos
      </h1>

      <p className="text-sm text-gray-600">
        Ambientes disponíveis para atividades musicais além da sala de aula tradicional.
      </p>

      {loading ? (
        <div className="flex items-center justify-center py-16">
          <Loader2 className="w-6 h-6 animate-spin text-gray-400" />
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {spaces.map(space => (
            <div
              key={space.id}
              className={`bg-white rounded-xl border p-5 transition-shadow hover:shadow-md ${space.available ? 'border-gray-100' : 'border-gray-200 opacity-60'}`}
            >
              <div className="flex items-start justify-between mb-3">
                <h3 className="font-bold text-gray-900">{space.name}</h3>
                <span className={`text-xs px-2 py-0.5 rounded font-medium shrink-0 ml-2 ${space.available ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                  {space.available ? 'Disponível' : 'Indisponível'}
                </span>
              </div>
              <p className="text-sm text-gray-500 mb-3">{space.description}</p>
              <div className="flex items-center gap-4 text-xs text-gray-400">
                <span className="flex items-center gap-1"><MapPin className="w-3 h-3" />{space.type}</span>
                <span className="flex items-center gap-1"><Users className="w-3 h-3" />{space.capacity} pessoas</span>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
