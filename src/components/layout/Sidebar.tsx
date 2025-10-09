/**
 * 🗂️ SIDEBAR - Barra Lateral de Navegação
 * 
 * Sidebar para páginas protegidas
 * - Navegação baseada no role do usuário
 * - Responsive (drawer no mobile)
 */

import React from 'react'
import { Link, useLocation } from 'react-router-dom'
import { X, Home, BookOpen, Trophy, Briefcase, Users, Settings, HelpCircle, Music, Calendar, Award, Library } from 'lucide-react'
import { ROUTES } from '../../lib/constants/routes'
import { useAuth } from '../../features/auth/AuthContext'
import clsx from 'clsx'

interface SidebarProps {
  isOpen: boolean
  onClose: () => void
}

export const Sidebar: React.FC<SidebarProps> = ({ isOpen, onClose }) => {
  const location = useLocation()
  const { user } = useAuth()

  // Pegar role do usuário real
  const userRole = (user as any)?.user_metadata?.tipo_usuario || 'aluno'

  const isActive = (path: string) => {
    return location.pathname === path || location.pathname.startsWith(path + '/')
  }

  // Navegação baseada no role
  const getNavigationItems = () => {
    const common = [
      { name: 'Início', path: ROUTES.APP, icon: Home },
      { name: 'Ajuda', path: ROUTES.HELP, icon: HelpCircle },
      { name: 'Configurações', path: ROUTES.SETTINGS, icon: Settings },
    ]

    if (userRole === 'aluno') {
      return [
        { name: 'Dashboard', path: ROUTES.ALUNO.INDEX, icon: Home },
        { name: 'Portfólio', path: ROUTES.ALUNO.PORTFOLIO.INDEX, icon: Briefcase },
        { name: 'Conquistas', path: ROUTES.ALUNO.ACHIEVEMENTS.INDEX, icon: Trophy },
        { name: 'Desafios', path: ROUTES.ALUNO.CHALLENGES.INDEX, icon: Award },
        { name: 'Instrumentos', path: ROUTES.ALUNO.INSTRUMENTS.INDEX, icon: Music },
        { name: 'Minhas Aulas', path: ROUTES.ALUNO.CLASSES, icon: Calendar },
        { name: 'História da Música', path: ROUTES.HISTORIA.INDEX, icon: BookOpen },
        ...common,
      ]
    }

    if (userRole === 'professor') {
      return [
        { name: 'Dashboard', path: ROUTES.PROFESSOR.INDEX, icon: Home },
        { name: 'Turmas', path: ROUTES.PROFESSOR.CLASSES, icon: Users },
        { name: 'Calendário', path: ROUTES.PROFESSOR.CALENDAR, icon: Calendar },
        { name: 'Materiais', path: ROUTES.PROFESSOR.MATERIALS, icon: Library },
        { name: 'Submissões', path: ROUTES.PROFESSOR.SUBMISSIONS, icon: Award },
        ...common,
      ]
    }

    if (userRole === 'admin') {
      return [
        { name: 'Dashboard', path: ROUTES.ADMIN.INDEX, icon: Home },
        { name: 'Usuários', path: ROUTES.ADMIN.USERS, icon: Users },
        { name: 'Instrumentos', path: ROUTES.ADMIN.INSTRUMENTS, icon: Music },
        { name: 'Conquistas', path: ROUTES.ADMIN.ACHIEVEMENTS, icon: Trophy },
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
            <div className="w-8 h-8 bg-gradient-to-br from-[var(--color-sakura)] to-[var(--color-indigo)] rounded-lg flex items-center justify-center">
              <span className="text-white font-bold text-lg">N</span>
            </div>
            <span className="text-xl font-bold text-gray-900">Nipo School</span>
          </Link>
          <button
            onClick={onClose}
            className="lg:hidden p-2 rounded-md text-gray-600 hover:bg-gray-100"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Navigation */}
        <nav className="p-4 space-y-1">
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
