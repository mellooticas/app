/**
 * 🚧 PÁGINA EM CONSTRUÇÃO
 */

import React from 'react'
import { Construction } from 'lucide-react'

export const ConquistaDetailPage: React.FC = () => {
  return (
    <div className="flex flex-col items-center justify-center h-screen">
      <Construction className="w-24 h-24 text-yellow-500 mb-4" />
      <h1 className="text-3xl font-bold text-gray-900 mb-2">
        Página em Construção
      </h1>
      <p className="text-gray-600">
        Esta página está sendo reconstruída com dados reais do banco.
      </p>
    </div>
  )
}
