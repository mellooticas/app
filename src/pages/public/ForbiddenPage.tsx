/**
 * 🔒 403 - Acesso Negado
 */

import React from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { ShieldOff, Home, ArrowLeft } from 'lucide-react'
import { ROUTES } from '../../lib/constants/routes'
import { NipoButton } from '../../components/shared/NipoButton'

export const ForbiddenPage: React.FC = () => {
  const navigate = useNavigate()

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
      <div className="text-center max-w-lg">
        {/* 403 Illustration */}
        <div className="mb-8">
          <div className="inline-flex items-center justify-center w-32 h-32 rounded-full bg-gradient-to-br from-red-400 to-red-600 mb-6">
            <ShieldOff className="w-16 h-16 text-white" />
          </div>
          <h1 className="text-6xl font-bold text-gray-900 mb-4">403</h1>
          <h2 className="text-2xl font-semibold text-gray-700 mb-2">
            Acesso Negado
          </h2>
          <p className="text-gray-600 mb-8">
            Você não tem permissão para acessar esta página. 
            Entre em contato com o administrador se acha que isso é um erro.
          </p>
        </div>

        {/* Actions */}
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <NipoButton
            onClick={() => navigate(-1)}
            leftIcon={<ArrowLeft className="w-4 h-4" />}
            variant="outline"
          >
            Voltar
          </NipoButton>
          <Link to={ROUTES.HOME}>
            <NipoButton leftIcon={<Home className="w-4 h-4" />}>
              Ir ao Início
            </NipoButton>
          </Link>
        </div>

        {/* Help text */}
        <div className="mt-12 pt-8 border-t border-gray-200">
          <p className="text-sm text-gray-500 mb-2">
            Precisa de ajuda?
          </p>
          <Link to={ROUTES.CONTATO} className="text-sm text-[var(--color-indigo)] hover:underline">
            Entre em contato com o suporte
          </Link>
        </div>
      </div>
    </div>
  )
}
