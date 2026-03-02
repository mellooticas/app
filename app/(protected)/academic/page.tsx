'use client'

import { BookOpen, Library, GraduationCap, ChevronRight } from 'lucide-react'
import Link from 'next/link'

export default function AcademicPage() {
  return (
    <div className="max-w-3xl mx-auto space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <BookOpen className="w-6 h-6 text-indigo-500" />
        Academico
      </h1>
      <p className="text-sm text-gray-500">
        Acesse o curriculo completo da Nipo School, metodologias de ensino e a biblioteca de materiais pedagogicos.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <Link href="/academic/curriculum" className="group">
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 hover:shadow-md hover:border-indigo-200 transition-all h-full">
            <div className="w-12 h-12 bg-indigo-50 rounded-xl flex items-center justify-center text-indigo-600 mb-4">
              <GraduationCap className="w-6 h-6" />
            </div>
            <h3 className="font-bold text-gray-900 mb-2 group-hover:text-indigo-700 transition-colors flex items-center gap-2">
              Curriculo Completo
              <ChevronRight className="w-4 h-4 text-gray-300 group-hover:text-indigo-500 transition-colors" />
            </h3>
            <p className="text-sm text-gray-500">
              9 metodologias, 4 ciclos de aprendizagem, 8 pilares do Metodo Alpha e todo o referencial pedagogico da escola.
            </p>
            <div className="mt-4 flex gap-2 flex-wrap">
              {['Orff', 'Suzuki', 'Kodaly', 'Berklee', '+5'].map(m => (
                <span key={m} className="px-2 py-0.5 bg-indigo-50 text-indigo-600 text-xs rounded-full font-medium">{m}</span>
              ))}
            </div>
          </div>
        </Link>

        <Link href="/academic/library" className="group">
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 hover:shadow-md hover:border-purple-200 transition-all h-full">
            <div className="w-12 h-12 bg-purple-50 rounded-xl flex items-center justify-center text-purple-600 mb-4">
              <Library className="w-6 h-6" />
            </div>
            <h3 className="font-bold text-gray-900 mb-2 group-hover:text-purple-700 transition-colors flex items-center gap-2">
              Biblioteca Metodologica
              <ChevronRight className="w-4 h-4 text-gray-300 group-hover:text-purple-500 transition-colors" />
            </h3>
            <p className="text-sm text-gray-500">
              Documentos, PDFs, videos, audios e materiais de apoio para professores e alunos.
            </p>
            <div className="mt-4 flex gap-2 flex-wrap">
              {['PDFs', 'Videos', 'Audios', 'Partituras'].map(t => (
                <span key={t} className="px-2 py-0.5 bg-purple-50 text-purple-600 text-xs rounded-full font-medium">{t}</span>
              ))}
            </div>
          </div>
        </Link>
      </div>
    </div>
  )
}
