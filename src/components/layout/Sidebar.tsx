/**
 * 🗂️ SIDEBAR - Barra Lateral de Navegação
 * 
 * Sidebar para páginas protegidas
 * - Navegação baseada no role do usuário
 * - Responsive (drawer no mobile)
 */

import React from 'react'
import { Link, useLocation } from 'react-router-dom'
import { X, Home, BookOpen, Trophy, Briefcase, Users, Settings, HelpCircle, Music, Calendar, Award, Library, TrendingUp } from 'lucide-react'
import { ROUTES } from '../../lib/constants/routes'
import { useAuth } from '../../contexts/AuthContext'
import clsx from 'clsx'

interface SidebarProps {
  isOpen: boolean
  onClose: () => void
}

export const Sidebar: React.FC<SidebarProps> = ({ isOpen, onClose }) => {
  const location = useLocation()
  const { user } = useAuth()

  // 🔧 CORRIGIDO: Usar role do contexto AuthContext
  const userRole = user?.role || 'aluno'
  
  console.log('🗂️ Sidebar - Papel do usuário:', userRole, user)

  const isActive = (path: string) => {
    return location.pathname === path || location.pathname.startsWith(path + '/')
  }

  // Navegação baseada no role
  const getNavigationItems = () => {
    const common = [
      { name: 'Ajuda', path: '/ajuda', icon: HelpCircle },
      { name: 'Configurações', path: '/configuracoes', icon: Settings },
    ]

    if (userRole === 'aluno') {
      return [
        { name: 'Dashboard', path: '/alunos', icon: Home },
        { name: 'Portfólio', path: '/alunos/portfolio', icon: Briefcase },
        { name: 'Conquistas', path: '/alunos/conquistas', icon: Trophy },
        { name: 'Desafios', path: '/alunos/desafios', icon: Award },
        { name: 'Instrumentos', path: '/alunos/instrumentos', icon: Music },
        { name: 'Minhas Aulas', path: '/alunos/aulas', icon: Calendar },
        { name: 'Progresso', path: '/alunos/progresso', icon: TrendingUp },
        { name: 'História da Música', path: '/historia-musica', icon: BookOpen },
        ...common,
      ]
    }

    if (userRole === 'professor') {
      return [
        { name: 'Dashboard', path: '/professores', icon: Home },
        { name: 'Turmas', path: '/professores/turmas', icon: Users },
        { name: 'Conteúdos', path: '/professores/conteudos', icon: Library },
        { name: 'Avaliações', path: '/professores/avaliacoes', icon: Award },
        ...common,
      ]
    }

    if (userRole === 'admin') {
      return [
        { name: 'Dashboard', path: '/admin', icon: Home },
        { name: 'Banco de Dados', path: '/admin/database', icon: Users },
        { name: 'Diagnóstico', path: '/admin/diagnostic', icon: Music },
        ...common,
      ]
    }

    return common
  }

  const navigationItems = getNavigationItems()

  return (
    <>
      {/* Sidebar */}
      <aside
        className={clsx(
          'fixed inset-y-0 left-0 z-30 w-64 bg-white shadow-lg transform transition-transform duration-300 ease-in-out',
          'lg:translate-x-0',
          isOpen ? 'translate-x-0' : '-translate-x-full'
        )}
      >
        {/* Header */}
        <div className="flex items-center justify-between px-6 py-4 border-b">
          <Link to={ROUTES.HOME} className="flex items-center gap-2">
            <div className="w-8 h-8 bg-gradient-to-br from-sakura-500 to-cherry-500 rounded-xl flex items-center justify-center shadow-lg">
              <span className="text-white font-bold text-lg">音</span>
            </div>
            <span className="text-xl font-zen font-bold text-gray-900">Nipo School</span>
          </Link>
          <button
            onClick={onClose}
            className="lg:hidden p-2 rounded-md text-gray-600 hover:bg-gray-100 transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Navigation */}
        <nav className="p-4 space-y-1">
          {/* Debug Info - Apenas para desenvolvimento */}
          {process.env.NODE_ENV === 'development' && (
            <div className="mb-4 p-3 bg-blue-50 rounded-lg border border-blue-200">
              <p className="text-xs text-blue-700 font-medium">Debug Info:</p>
              <p className="text-xs text-blue-600">Role: {userRole}</p>
              <p className="text-xs text-blue-600">Email: {user?.email}</p>
              <p className="text-xs text-blue-600">Items: {navigationItems.length}</p>
            </div>
          )}
          
          {navigationItems.map((item) => {
            const Icon = item.icon
            const active = isActive(item.path)

            return (
              <Link
                key={item.path}
                to={item.path}
                onClick={onClose}
                className={clsx(
                  'flex items-center gap-3 px-4 py-3 rounded-lg transition-colors',
                  active
                    ? 'bg-[var(--color-indigo)] text-white'
                    : 'text-gray-700 hover:bg-gray-100'
                )}
              >
                <Icon className="w-5 h-5" />
                <span className="font-medium">{item.name}</span>
              </Link>
            )
          })}
        </nav>
      </aside>
    </>
  )
}
