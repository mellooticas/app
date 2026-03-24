'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { HelpCircle, BookOpen, MessageCircle, Mail, Loader2 } from 'lucide-react'

type Faq = {
  id: string
  title: string    // question
  content: string  // answer
  order_index: number
}

export default function HelpPage() {
  const [faqs, setFaqs] = useState<Faq[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    supabase
      .from('v_library_items')
      .select('id, title, content, order_index')
      .eq('category', 'faq')
      .order('order_index')
      .then(({ data }) => {
        setFaqs((data as Faq[]) || [])
        setLoading(false)
      })
  }, [])

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <HelpCircle className="w-6 h-6 text-teal-500" />
        Central de Ajuda
      </h1>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div className="bg-white rounded-xl border border-gray-100 p-5 text-center hover:shadow-md transition-shadow">
          <BookOpen className="w-8 h-8 text-teal-500 mx-auto mb-3" />
          <h3 className="font-bold text-gray-900 mb-1">Guia do Aluno</h3>
          <p className="text-xs text-gray-500">Aprenda a usar todas as funcionalidades</p>
        </div>
        <div className="bg-white rounded-xl border border-gray-100 p-5 text-center hover:shadow-md transition-shadow">
          <MessageCircle className="w-8 h-8 text-blue-500 mx-auto mb-3" />
          <h3 className="font-bold text-gray-900 mb-1">Fórum</h3>
          <p className="text-xs text-gray-500">Tire dúvidas com a comunidade</p>
        </div>
        <div className="bg-white rounded-xl border border-gray-100 p-5 text-center hover:shadow-md transition-shadow">
          <Mail className="w-8 h-8 text-purple-500 mx-auto mb-3" />
          <h3 className="font-bold text-gray-900 mb-1">Contato</h3>
          <p className="text-xs text-gray-500">Fale diretamente com a equipe</p>
        </div>
      </div>

      <div>
        <h2 className="text-lg font-bold text-gray-900 mb-4">Perguntas Frequentes</h2>

        {loading ? (
          <div className="flex items-center justify-center py-8">
            <Loader2 className="w-6 h-6 animate-spin text-gray-400" />
          </div>
        ) : (
          <div className="space-y-3">
            {faqs.map(faq => (
              <details key={faq.id} className="bg-white rounded-xl border border-gray-100 group">
                <summary className="p-4 cursor-pointer font-bold text-sm text-gray-900 flex items-center justify-between hover:text-teal-700 transition-colors">
                  {faq.title}
                  <span className="text-gray-400 group-open:rotate-180 transition-transform">&#9660;</span>
                </summary>
                <div className="px-4 pb-4 text-sm text-gray-600 border-t border-gray-50 pt-3">
                  {faq.content}
                </div>
              </details>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}
