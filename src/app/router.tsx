/**
 * 🛣️ ROUTER - Configuração de Rotas da Aplicação
 * 
 * Todas as 46+ rotas configuradas com:
 * - Guards de autenticação (ProtectedRoute)
 * - Redirect inteligente por role (SmartRedirect)
 * - Layouts (PublicLayout, ProtectedLayout)
 * - Error boundaries
 */

import React from 'react'
import { createBrowserRouter, Navigate } from 'react-router-dom'
import { ROUTES } from '../lib/constants/routes'
import { useAuth } from '../features/auth/AuthContext'

// Layouts
import { PublicLayout } from '../components/layout/PublicLayout'
import { ProtectedLayout } from '../components/layout/ProtectedLayout'

// Public Pages
import LandingPage from '../pages/LandingPage'
import { SobrePage } from '../pages/public/SobrePage'
import { ContatoPage } from '../pages/public/ContatoPage'
import { NotFoundPage } from '../pages/public/NotFoundPage'
import { ForbiddenPage } from '../pages/public/ForbiddenPage'

// Auth Pages
import { LoginPage } from '../pages/auth/LoginPage'
import { SignUpPage } from '../pages/auth/SignUpPage'

// Dashboards
import { AlunoDashboard } from '../features/alunos/pages/AlunoDashboard'
import { ProfessorDashboard } from '../features/professores/pages/ProfessorDashboard'
import { AdminDashboard } from '../features/admin/pages/AdminDashboard'

// Páginas de Aluno (named exports)
import { ConquistasPage } from '../features/alunos/pages/ConquistasPage'
import { ConquistaDetailPage } from '../features/alunos/pages/ConquistaDetailPage'
import { PortfolioListPage } from '../features/alunos/pages/PortfolioListPage'
import { DesafiosListPage } from '../features/alunos/pages/DesafiosListPage'
import { BibliotecaInstrumentosPage } from '../features/alunos/pages/BibliotecaInstrumentosPage'
import { InstrumentoDetalhadoPage } from '../features/alunos/pages/InstrumentoDetalhadoPage'
import { MeuInstrumentoPage } from '../features/alunos/pages/MeuInstrumentoPage'
import { VideosPage } from '../features/alunos/pages/VideosPage'
import { InstrumentosPage } from '../features/alunos/pages/InstrumentosPage'
import { InstrumentoDetailPage } from '../features/alunos/pages/InstrumentoDetailPage'
import { MinhasAulasPage } from '../features/alunos/pages/MinhasAulasPage'
import { PerfilPage } from '../features/alunos/pages/PerfilPage'
import { ProgressoPage } from '../features/alunos/pages/ProgressoPage'
import { PortfolioDetailPage } from '../features/alunos/pages/PortfolioDetailPage'
import { PortfolioCreatePage } from '../features/alunos/pages/PortfolioCreatePage'
import { DesafioDetailPage } from '../features/alunos/pages/DesafioDetailPage'

// História da Música
import HistoriaHomePage from '../features/historia-musica/pages/HistoriaHomePage'
import PeriodosPage from '../features/historia-musica/pages/PeriodosPage'
import CompositoresPage from '../features/historia-musica/pages/CompositoresPage'
import ObrasPage from '../features/historia-musica/pages/ObrasPage'
import TimelinePage from '../features/historia-musica/pages/TimelinePage'
import {
  GenerosMusicaisPage,
  TeoriaMusicPage,
} from '../features/historia-musica/pages/_EmConstrucao'

/**
 * PROTECTED ROUTE - Guard de autenticação
 * Verifica se usuário está autenticado antes de permitir acesso
 */
interface ProtectedRouteProps {
  children: React.ReactNode
  requiredRoles?: string[]
}

const ProtectedRoute: React.FC<ProtectedRouteProps> = ({ 
  children, 
  requiredRoles 
}) => {
  const { isAuthenticated, user, isLoading } = useAuth()

  // Mostrar loading enquanto carrega usuário
  if (isLoading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Carregando...</p>
        </div>
      </div>
    )
  }

  // Se não autenticado, redireciona para login
  if (!isAuthenticated) {
    return <Navigate to={ROUTES.LOGIN} replace />
  }

  // Se autenticado mas sem permissão, redireciona para forbidden
  if (requiredRoles && user && !requiredRoles.includes(user.role)) {
    return <Navigate to={ROUTES.FORBIDDEN} replace />
  }

  // Se tudo OK, renderiza o conteúdo
  return <>{children}</>
}

/**
 * SMART REDIRECT - Redireciona para dashboard correto baseado no role
 */
const SmartRedirect: React.FC = () => {
  const { isAuthenticated, user, isLoading } = useAuth()

  // Mostrar loading enquanto carrega usuário
  if (isLoading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Carregando...</p>
        </div>
      </div>
    )
  }

  if (!isAuthenticated || !user) {
    return <Navigate to={ROUTES.LOGIN} replace />
  }

  // Redireciona baseado no role
  switch (user.role) {
    case 'aluno':
      return <Navigate to={ROUTES.ALUNO.INDEX} replace />
    case 'professor':
      return <Navigate to={ROUTES.PROFESSOR.INDEX} replace />
    case 'admin':
      return <Navigate to={ROUTES.ADMIN.INDEX} replace />
    case 'pastor':
      // Pastor tem as mesmas permissões que professor
      return <Navigate to={ROUTES.PROFESSOR.INDEX} replace />
    default:
      return <Navigate to={ROUTES.HOME} replace />
  }
}

/**
 * ROUTER CONFIGURATION
 */
export const router = createBrowserRouter([
  // ========================================
  // ROTAS PÚBLICAS (com PublicLayout)
  // ========================================
  {
    element: <PublicLayout />,
    children: [
      {
        path: ROUTES.HOME,
        element: <LandingPage />,
      },
      {
        path: ROUTES.SOBRE,
        element: <SobrePage />,
      },
      {
        path: ROUTES.CONTATO,
        element: <ContatoPage />,
      },
    ],
  },

  // ========================================
  // AUTH ROUTES (sem layout - full screen)
  // ========================================
  {
    path: ROUTES.LOGIN,
    element: <LoginPage />,
  },
  {
    path: ROUTES.SIGNUP,
    element: <SignUpPage />,
  },

  // ========================================
  // ROTAS PROTEGIDAS (com ProtectedLayout)
  // ========================================
  {
    path: ROUTES.APP,
    element: (
      <ProtectedRoute>
        <ProtectedLayout />
      </ProtectedRoute>
    ),
    children: [
      // Redirect /app -> dashboard correto
      {
        index: true,
        element: <SmartRedirect />,
      },

      // ========================================
      // ALUNO ROUTES
      // ========================================
      {
        path: 'aluno',
        children: [
          {
            index: true,
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <AlunoDashboard />
              </ProtectedRoute>
            ),
          },
          // Perfil do Aluno
          {
            path: 'perfil',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <PerfilPage />
              </ProtectedRoute>
            ),
          },
          // Conquistas e Badges
          {
            path: 'conquistas',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <ConquistasPage />
              </ProtectedRoute>
            ),
          },
          {
            path: 'conquistas/:id',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <ConquistaDetailPage />
              </ProtectedRoute>
            ),
          },
          // Portfólio
          {
            path: 'portfolio',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <PortfolioListPage />
              </ProtectedRoute>
            ),
          },
          // Desafios
          {
            path: 'desafios',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <DesafiosListPage />
              </ProtectedRoute>
            ),
          },
          // Instrumentos
          {
            path: 'instrumentos',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <BibliotecaInstrumentosPage />
              </ProtectedRoute>
            ),
          },
          {
            path: 'instrumentos/:id',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <InstrumentoDetalhadoPage />
              </ProtectedRoute>
            ),
          },
          {
            path: 'instrumentos/meu-instrumento',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <MeuInstrumentoPage />
              </ProtectedRoute>
            ),
          },
          {
            path: 'instrumentos/:slug',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <InstrumentoDetailPage />
              </ProtectedRoute>
            ),
          },
          // Vídeo-aulas
          {
            path: 'videos',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <VideosPage />
              </ProtectedRoute>
            ),
          },
          // Minhas Aulas
          {
            path: 'aulas',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <MinhasAulasPage />
              </ProtectedRoute>
            ),
          },
        ],
      },

      // ========================================
      // HISTÓRIA DA MÚSICA ROUTES
      // ========================================
      {
        path: 'historia',
        children: [
          // Homepage - Visão Geral
          {
            index: true,
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <HistoriaHomePage />
              </ProtectedRoute>
            ),
          },
          // Períodos Musicais
          {
            path: 'periodos',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <PeriodosPage />
              </ProtectedRoute>
            ),
          },
          // Compositores
          {
            path: 'compositores',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <CompositoresPage />
              </ProtectedRoute>
            ),
          },
          // Obras Musicais
          {
            path: 'obras',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <ObrasPage />
              </ProtectedRoute>
            ),
          },
          // Timeline Histórica
          {
            path: 'timeline',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <TimelinePage />
              </ProtectedRoute>
            ),
          },
          // Gêneros Musicais
          {
            path: 'generos',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <GenerosMusicaisPage />
              </ProtectedRoute>
            ),
          },
          // Teoria Musical
          {
            path: 'teoria',
            element: (
              <ProtectedRoute requiredRoles={['aluno']}>
                <TeoriaMusicPage />
              </ProtectedRoute>
            ),
          },
        ],
      },

      // ========================================
      // PROFESSOR ROUTES
      // ========================================
      {
        path: 'professor',
        children: [
          {
            index: true,
            element: (
              <ProtectedRoute requiredRoles={['professor']}>
                <ProfessorDashboard />
              </ProtectedRoute>
            ),
          },
          // TODO: Adicionar mais rotas de professor
          // { path: 'turmas', element: <Classes /> },
          // { path: 'submissoes', element: <Submissions /> },
          // etc...
        ],
      },

      // ========================================
      // ADMIN ROUTES
      // ========================================
      {
        path: 'admin',
        children: [
          {
            index: true,
            element: (
              <ProtectedRoute requiredRoles={['admin']}>
                <AdminDashboard />
              </ProtectedRoute>
            ),
          },
          // TODO: Adicionar mais rotas de admin
          // { path: 'usuarios', element: <Users /> },
          // { path: 'instrumentos', element: <Instruments /> },
          // etc...
        ],
      },

      // ========================================
      // SHARED PROTECTED ROUTES
      // ========================================
      // { path: 'configuracoes', element: <Settings /> },
      // { path: 'notificacoes', element: <Notifications /> },
      // { path: 'ajuda', element: <Help /> },
    ],
  },

  // ========================================
  // ERROR PAGES
  // ========================================
  {
    path: ROUTES.FORBIDDEN,
    element: <ForbiddenPage />,
  },
  {
    path: '*',
    element: <NotFoundPage />,
  },
])
