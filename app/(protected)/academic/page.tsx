'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { BookOpen, Library, GraduationCap, ChevronRight, Loader2 } from 'lucide-react'
import Link from 'next/link'

export default function AcademicPage() {
  const [methodologyCount, setMethodologyCount] = useState<number | null>(null)
  const [libraryCount, setLibraryCount] = useState<number | null>(null)
  const [methodologyNames, setMethodologyNames] = useState<string[]>([])

  useEffect(() => {
    Promise.all([
      supabase
        .from('v_library_items')
        .select('title', { count: 'exact', head: false })
        .eq('category', 'methodology'),
      supabase
        .from('v_library_items')
        .select('*', { count: 'exact', head: true })
        .not('category', 'in', '(faq,experience,reference,strategy)'),
    ]).then(([methodRes, libRes]) => {
      if (methodRes.data) {
        setMethodologyCount(methodRes.data.length)
        // Show first 4 names + "+N" remaining badge
        const names = (methodRes.data as { title: string }[]).map(m => m.title.split(' ')[0])
        setMethodologyNames(names)
      }
      if (libRes.count !== null) setLibraryCount(libRes.count)
    })
  }, [])

  const methodBadges = methodologyNames.slice(0, 4)
  const extra = (methodologyCount ?? 0) - methodBadges.length

  return (
    <div className="max-w-3xl mx-auto space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <BookOpen className="w-6 h-6 text-indigo-500" />
        Acadêmico
      </h1>
      <p className="text-sm text-gray-500">
        Acesse o currículo completo da Nipo School, metodologias de ensino e a biblioteca de materiais pedagógicos.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {/* Curriculum card */}
        <Link href="/academic/curriculum" className="group">
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 hover:shadow-md hover:border-indigo-200 transition-all h-full">
            <div className="w-12 h-12 bg-indigo-50 rounded-xl flex items-center justify-center text-indigo-600 mb-4">
              <GraduationCap className="w-6 h-6" />
            </div>
            <h3 className="font-bold text-gray-900 mb-2 group-hover:text-indigo-700 transition-colors flex items-center gap-2">
              Currículo Completo
              <ChevronRight className="w-4 h-4 text-gray-300 group-hover:text-indigo-500 transition-colors" />
            </h3>
            <p className="text-sm text-gray-500 mb-4">
              {methodologyCount !== null
                ? `${methodologyCount} metodologias ativas — 4 ciclos de aprendizagem e referencial pedagógico da escola.`
                : 'Metodologias, ciclos de aprendizagem e referencial pedagógico da escola.'}
            </p>
            <div className="flex gap-2 flex-wrap">
              {methodologyNames.length > 0 ? (
                <>
                  {methodBadges.map(m => (
                    <span key={m} className="px-2 py-0.5 bg-indigo-50 text-indigo-600 text-xs rounded-full font-medium">{m}</span>
                  ))}
                  {extra > 0 && (
                    <span className="px-2 py-0.5 bg-indigo-50 text-indigo-600 text-xs rounded-full font-medium">+{extra}</span>
                  )}
                </>
              ) : (
                <Loader2 className="w-4 h-4 text-indigo-300 animate-spin" />
              )}
            </div>
          </div>
        </Link>

        {/* Library card */}
        <Link href="/academic/library" className="group">
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 hover:shadow-md hover:border-purple-200 transition-all h-full">
            <div className="w-12 h-12 bg-purple-50 rounded-xl flex items-center justify-center text-purple-600 mb-4">
              <Library className="w-6 h-6" />
            </div>
            <h3 className="font-bold text-gray-900 mb-2 group-hover:text-purple-700 transition-colors flex items-center gap-2">
              Biblioteca Metodológica
              <ChevronRight className="w-4 h-4 text-gray-300 group-hover:text-purple-500 transition-colors" />
            </h3>
            <p className="text-sm text-gray-500 mb-4">
              {libraryCount !== null
                ? `${libraryCount} materiais disponíveis — artigos, guias, teoria musical e história.`
                : 'Documentos, PDFs, vídeos, áudios e materiais de apoio para professores e alunos.'}
            </p>
            <div className="flex gap-2 flex-wrap">
              {['Teoria', 'História', 'Guias', 'Artigos'].map(t => (
                <span key={t} className="px-2 py-0.5 bg-purple-50 text-purple-600 text-xs rounded-full font-medium">{t}</span>
              ))}
            </div>
          </div>
        </Link>
      </div>
    </div>
  )
}
