'use client'

import { Lightbulb, BookOpen, Users, Music, Zap, Heart, Headphones, Ear } from 'lucide-react'

const strategies = [
  { title: 'Aprendizagem Colaborativa', icon: Users, description: 'Formação de conjuntos e bandas onde alunos aprendem uns com os outros.' },
  { title: 'Repertório Personalizado', icon: Music, description: 'Alunos escolhem músicas de seu interesse, aumentando motivação e engajamento.' },
  { title: 'Gamificação', icon: Lightbulb, description: 'Uso de desafios, pontos e conquistas para tornar o aprendizado mais envolvente.' },
  { title: 'Diário de Prática', icon: BookOpen, description: 'Registro reflexivo das sessões de estudo para autoavaliação e acompanhamento.' },
]

const methodologies = [
  { name: 'Orff-Schulwerk', philosophy: 'Aprender brincando e improvisando', description: 'Educação musical elementar através do corpo, voz e movimento.' },
  { name: 'Musical Futures', philosophy: 'Protagonismo do aluno', description: 'Repertório escolhido pelo aluno e aprendizagem colaborativa em banda.' },
  { name: 'Suzuki', philosophy: 'Imersão como língua materna', description: 'Progressão gradual com ênfase em escuta e envolvimento familiar.' },
  { name: 'Kodály', philosophy: 'Canto como base', description: 'Ênfase vocal e alfabetização musical através da tradição folclórica.' },
  { name: 'Gordon', philosophy: 'Compreender antes de executar', description: 'Sequência baseada em audiação: ouvir, falar, ler, criar.' },
  { name: 'Willems', philosophy: 'Escuta profunda', description: 'Audição, ritmo e movimento como fundamentos da expressão musical.' },
  { name: 'Alpha Principles', philosophy: 'Maestria progressiva', description: 'Desafios semanais integrando ferramentas digitais e inovação pedagógica.' },
  { name: 'Berklee/Internacional', philosophy: 'Educação musical profissional', description: 'Técnicas avançadas, produção e práticas musicais contemporâneas.' },
]

export default function StrategiesPage() {
  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Lightbulb className="w-6 h-6 text-yellow-500" />
        Estratégias Pedagógicas
      </h1>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {strategies.map(s => (
          <div key={s.title} className="bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-shadow">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-10 h-10 bg-yellow-50 rounded-xl flex items-center justify-center">
                <s.icon className="w-5 h-5 text-yellow-600" />
              </div>
              <h3 className="font-bold text-gray-900">{s.title}</h3>
            </div>
            <p className="text-sm text-gray-500">{s.description}</p>
          </div>
        ))}
      </div>

      <h2 className="text-lg font-bold text-gray-900 mt-8">Metodologias Ativas</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {methodologies.map(m => (
          <div key={m.name} className="bg-white rounded-xl border border-gray-100 p-5">
            <h3 className="font-bold text-gray-900 mb-1">{m.name}</h3>
            <p className="text-xs text-gray-400 italic mb-2">{m.philosophy}</p>
            <p className="text-sm text-gray-500">{m.description}</p>
          </div>
        ))}
      </div>
    </div>
  )
}
