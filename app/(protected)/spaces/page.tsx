'use client'

import { Building, MapPin, Users } from 'lucide-react'

const spaces = [
  { name: 'Sala Multiuso', type: 'Interno', capacity: 30, description: 'Espaço flexível para aulas de movimento, rodas musicais e ensaios de conjunto.', available: true },
  { name: 'Laboratório de Música', type: 'Interno', capacity: 15, description: 'Equipado com instrumentos digitais, computadores e software de produção musical.', available: true },
  { name: 'Auditório', type: 'Interno', capacity: 100, description: 'Para apresentações, recitais e eventos musicais da escola.', available: true },
  { name: 'Pátio Coberto', type: 'Externo', capacity: 50, description: 'Área ao ar livre para atividades musicais com movimento e percussão corporal.', available: true },
  { name: 'Sala de Prática Individual', type: 'Interno', capacity: 2, description: 'Cabines acústicas para estudo individual e aulas particulares.', available: true },
  { name: 'Estúdio de Gravação', type: 'Interno', capacity: 5, description: 'Espaço para gravação de áudio e vídeo das produções dos alunos.', available: false },
]

export default function SpacesPage() {
  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Building className="w-6 h-6 text-violet-500" />
        Espaços Alternativos
      </h1>

      <p className="text-sm text-gray-600">
        Ambientes disponíveis para atividades musicais além da sala de aula tradicional.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {spaces.map(space => (
          <div key={space.name} className={`bg-white rounded-xl border p-5 transition-shadow hover:shadow-md ${space.available ? 'border-gray-100' : 'border-gray-200 opacity-60'}`}>
            <div className="flex items-start justify-between mb-3">
              <h3 className="font-bold text-gray-900">{space.name}</h3>
              <span className={`text-xs px-2 py-0.5 rounded font-medium ${space.available ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
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
    </div>
  )
}
