'use client'

import { HelpCircle, BookOpen, MessageCircle, Mail, ExternalLink } from 'lucide-react'

const faqs = [
  { q: 'Como faço para registrar minha prática?', a: 'Acesse o menu "Diário de Prática" e clique em "Nova Sessão". Registre o instrumento, duração e suas observações.' },
  { q: 'Como funciona o sistema de pontos?', a: 'Você ganha pontos completando aulas, enviando desafios e mantendo uma sequência diária de prática. Os pontos acumulados desbloqueiam conquistas e novos níveis.' },
  { q: 'Como participar de um desafio?', a: 'Vá em "Desafios", escolha um desafio disponível e envie sua submissão em vídeo, áudio ou texto. O professor avaliará e você receberá pontos.' },
  { q: 'Como enviar um trabalho ao portfólio?', a: 'Acesse "Portfólio" e clique em "Nova Entrada". Você pode enviar gravações, fotos de partituras ou textos reflexivos.' },
  { q: 'O que é o Feed Musical?', a: 'É o espaço para compartilhar suas produções musicais com a comunidade. Poste vídeos, áudios e interaja com outros músicos.' },
]

export default function HelpPage() {
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
        <div className="space-y-3">
          {faqs.map((faq, i) => (
            <details key={i} className="bg-white rounded-xl border border-gray-100 group">
              <summary className="p-4 cursor-pointer font-bold text-sm text-gray-900 flex items-center justify-between hover:text-teal-700 transition-colors">
                {faq.q}
                <span className="text-gray-400 group-open:rotate-180 transition-transform">&#9660;</span>
              </summary>
              <div className="px-4 pb-4 text-sm text-gray-600 border-t border-gray-50 pt-3">
                {faq.a}
              </div>
            </details>
          ))}
        </div>
      </div>
    </div>
  )
}
