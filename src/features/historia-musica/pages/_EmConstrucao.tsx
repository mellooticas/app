/**
 * 🚧 PÁGINAS EM CONSTRUÇÃO - HISTÓRIA DA MÚSICA
 */

import React from 'react'
import { Construction, ArrowLeft } from 'lucide-react'
import { Link } from 'react-router-dom'

interface EmConstrucaoHistoriaProps {
  titulo?: string
  mensagem?: string
}

export function EmConstrucaoHistoria({ titulo, mensagem }: EmConstrucaoHistoriaProps) {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen px-4 bg-gradient-to-b from-indigo-50 to-white">
      <Construction className="w-24 h-24 text-yellow-500 mb-4 animate-pulse" />
      <h1 className="text-3xl font-bold text-gray-900 mb-2 text-center">
        {titulo || 'Página em Construção'}
      </h1>
      <p className="text-gray-600 text-center max-w-md mb-6">
        {mensagem || 'Esta página está sendo desenvolvida e estará disponível em breve.'}
      </p>
      <Link
        to="/historia"
        className="inline-flex items-center gap-2 px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition-colors"
      >
        <ArrowLeft className="w-4 h-4" />
        Voltar para História da Música
      </Link>
    </div>
  )
}

// Export páginas individuais (apenas as que ainda não foram implementadas)
export const GenerosMusicaisPage = () => (
  <EmConstrucaoHistoria titulo="Gêneros Musicais" mensagem="Estilos e suas origens" />
)

export const TeoriaMusicPage = () => (
  <EmConstrucaoHistoria titulo="Teoria Musical" mensagem="Conceitos e fundamentos" />
)
