'use client'

import { Globe, ExternalLink, BookOpen } from 'lucide-react'

const references = [
  { title: 'Orff-Schulwerk', country: 'Áustria', description: 'Abordagem pedagógica que integra música, movimento e fala, desenvolvida por Carl Orff.', category: 'Metodologia' },
  { title: 'Kodály Method', country: 'Hungria', description: 'Filosofia centrada no canto como base da musicalidade, usando repertório folclórico.', category: 'Metodologia' },
  { title: 'Suzuki Method', country: 'Japão', description: 'Aprendizagem por imersão inspirada na aquisição da língua materna.', category: 'Metodologia' },
  { title: 'Musical Futures', country: 'Reino Unido', description: 'Aprendizagem informal com foco no repertório escolhido pelos alunos.', category: 'Programa' },
  { title: 'El Sistema', country: 'Venezuela', description: 'Programa de orquestras juvenis que transformou a educação musical na América Latina.', category: 'Programa' },
  { title: 'Berklee Online', country: 'EUA', description: 'Referência em educação musical contemporânea, produção e tecnologia musical.', category: 'Instituição' },
  { title: 'Dalcroze Eurhythmics', country: 'Suíça', description: 'Método que ensina música através do movimento corporal e da expressão rítmica.', category: 'Metodologia' },
  { title: 'Gordon Music Learning Theory', country: 'EUA', description: 'Teoria baseada em audiação: compreender a música internamente antes de executar.', category: 'Metodologia' },
]

export default function ReferencesPage() {
  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Globe className="w-6 h-6 text-blue-500" />
        Referências Internacionais
      </h1>

      <p className="text-sm text-gray-600">
        Metodologias e programas internacionais que inspiram o Nipo School.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {references.map(ref => (
          <div key={ref.title} className="bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-shadow">
            <div className="flex items-start justify-between mb-2">
              <h3 className="font-bold text-gray-900">{ref.title}</h3>
              <span className="text-xs bg-blue-50 text-blue-600 px-2 py-0.5 rounded font-medium shrink-0 ml-2">{ref.category}</span>
            </div>
            <div className="flex items-center gap-1 text-xs text-gray-400 mb-2">
              <Globe className="w-3 h-3" /> {ref.country}
            </div>
            <p className="text-sm text-gray-500">{ref.description}</p>
          </div>
        ))}
      </div>
    </div>
  )
}
