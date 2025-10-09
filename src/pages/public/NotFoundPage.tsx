/**
 * 🚫 404 - Página Não Encontrada
 */

import React from 'react'
import { Link } from 'react-router-dom'
import { Home, Search } from 'lucide-react'
import { ROUTES } from '../../lib/constants/routes'
import { NipoButton } from '../../components/shared/NipoButton'

export const NotFoundPage: React.FC = () => {
  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
      <div className="text-center max-w-lg">
        {/* 404 Illustration */}
        <div className="mb-8">
          <div className="inline-flex items-center justify-center w-32 h-32 rounded-full bg-gradient-to-br from-[var(--color-sakura)] to-[var(--color-indigo)] mb-6">
            <Search className="w-16 h-16 text-white" />
          </div>
          <h1 className="text-6xl font-bold text-gray-900 mb-4">404</h1>
          <h2 className="text-2xl font-semibold text-gray-700 mb-2">
            Página Não Encontrada
          </h2>
          <p className="text-gray-600 mb-8">
            Oops! A página que você está procurando não existe ou foi movida.
          </p>
        </div>

        {/* Actions */}
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Link to={ROUTES.HOME}>
            <NipoButton leftIcon={<Home className="w-4 h-4" />}>
              Voltar ao Início
            </NipoButton>
          </Link>
          <Link to={ROUTES.CONTATO}>
            <NipoButton variant="outline">
              Reportar Problema
            </NipoButton>
          </Link>
        </div>

        {/* Helpful links */}
        <div className="mt-12 pt-8 border-t border-gray-200">
          <p className="text-sm text-gray-500 mb-4">Talvez você esteja procurando por:</p>
          <div className="flex flex-wrap gap-2 justify-center">
            <Link to={ROUTES.SOBRE} className="text-sm text-[var(--color-indigo)] hover:underline">
              Sobre
            </Link>
            <span className="text-gray-300">•</span>
            <Link to={ROUTES.CONTATO} className="text-sm text-[var(--color-indigo)] hover:underline">
              Contato
            </Link>
            <span className="text-gray-300">•</span>
            <Link to={ROUTES.LOGIN} className="text-sm text-[var(--color-indigo)] hover:underline">
              Login
            </Link>
            <span className="text-gray-300">•</span>
            <Link to={ROUTES.SIGNUP} className="text-sm text-[var(--color-indigo)] hover:underline">
              Cadastro
            </Link>
          </div>
        </div>
      </div>
    </div>
  )
}
