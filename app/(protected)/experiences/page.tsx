'use client'

import { MapPin, Music, ExternalLink } from 'lucide-react'

const experiences = [
  { title: 'Projeto Guri', description: 'Maior programa sociocultural do Brasil, oferecendo cursos de música gratuitos para crianças e adolescentes.', location: 'São Paulo', url: 'https://projetoguri.org.br' },
  { title: 'NEOJIBA', description: 'Núcleos Estaduais de Orquestras Juvenis e Infantis da Bahia, transformando vidas através da prática musical coletiva.', location: 'Bahia', url: 'https://neojiba.org' },
  { title: 'El Sistema Brasil', description: 'Inspirado no modelo venezuelano, promove inclusão social através de orquestras e corais.', location: 'Nacional', url: null },
  { title: 'Fundação Baccarelli', description: 'Ensino musical gratuito na comunidade de Heliópolis, formando músicos profissionais.', location: 'São Paulo', url: null },
  { title: 'AfroReggae', description: 'Utiliza a música como ferramenta de transformação social em comunidades do Rio de Janeiro.', location: 'Rio de Janeiro', url: null },
  { title: 'Música nas Escolas', description: 'Lei 11.769/2008 que torna a música conteúdo obrigatório na educação básica brasileira.', location: 'Nacional', url: null },
]

export default function ExperiencesPage() {
  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <MapPin className="w-6 h-6 text-green-500" />
        Experiências Musicais BR
      </h1>

      <p className="text-sm text-gray-600">
        Projetos e experiências inspiradoras de educação musical no Brasil.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {experiences.map(exp => (
          <div key={exp.title} className="bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-shadow">
            <div className="flex items-start justify-between mb-3">
              <div className="flex items-center gap-2">
                <Music className="w-5 h-5 text-green-500" />
                <h3 className="font-bold text-gray-900">{exp.title}</h3>
              </div>
              <span className="text-xs bg-green-50 text-green-600 px-2 py-0.5 rounded font-medium flex items-center gap-1">
                <MapPin className="w-3 h-3" />{exp.location}
              </span>
            </div>
            <p className="text-sm text-gray-500">{exp.description}</p>
            {exp.url && (
              <a href={exp.url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 mt-3 text-xs text-green-600 hover:underline font-medium">
                Visitar site <ExternalLink className="w-3 h-3" />
              </a>
            )}
          </div>
        ))}
      </div>
    </div>
  )
}
