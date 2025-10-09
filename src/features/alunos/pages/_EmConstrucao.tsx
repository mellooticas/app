/**
 * 🚧 PÁGINAS EM CONSTRUÇÃO
 * Componente genérico para páginas sendo reconstruídas
 */

import React from 'react'
import { Construction } from 'lucide-react'

interface EmConstrucaoProps {
  titulo?: string
  mensagem?: string
}

export const EmConstrucao: React.FC<EmConstrucaoProps> = ({
  titulo = 'Página em Construção',
  mensagem = 'Esta página está sendo reconstruída com dados reais do banco.'
}) => {
  return (
    <div className="flex flex-col items-center justify-center h-screen px-4">
      <Construction className="w-24 h-24 text-yellow-500 mb-4 animate-pulse" />
      <h1 className="text-3xl font-bold text-gray-900 mb-2 text-center">
        {titulo}
      </h1>
      <p className="text-gray-600 text-center max-w-md">
        {mensagem}
      </p>
      <p className="text-sm text-gray-500 mt-4">
        Por enquanto, use o Dashboard principal
      </p>
    </div>
  )
}

// Export individual pages
export const PortfolioListPage = () => <EmConstrucao titulo="Portfólio" />
export const PortfolioDetailPage = () => <EmConstrucao titulo="Detalhes do Portfólio" />
export const PortfolioCreatePage = () => <EmConstrucao titulo="Criar Portfólio" />
export const InstrumentosPage = () => <EmConstrucao titulo="Biblioteca de Instrumentos" />
export const InstrumentoDetailPage = () => <EmConstrucao titulo="Detalhes do Instrumento" />
export const DesafiosListPage = () => <EmConstrucao titulo="Desafios Alpha" />
export const DesafioDetailPage = () => <EmConstrucao titulo="Detalhes do Desafio" />
export const MinhasAulasPage = () => <EmConstrucao titulo="Minhas Aulas" />
export const ProgressoPage = () => <EmConstrucao titulo="Meu Progresso" />
