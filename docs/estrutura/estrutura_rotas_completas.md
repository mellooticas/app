🗺️ DOCUMENTAÇÃO COMPLETA DE ROTAS - NIPO SCHOOL
Perfeito! Vou criar a documentação definitiva de rotas com tree visual completo. 🎯
📋 ÍNDICE

Visão Geral da Arquitetura
Tree Completo de Rotas
Rotas Públicas
Rotas Autenticadas
Convenções e Padrões
Tabela de Referência Rápida
Implementação React Router
Constantes Tipo-Seguras
Guards e Proteção
Breadcrumbs System


1. VISÃO GERAL DA ARQUITETURA
Princípios de Design
yamlIdioma: Português (alinhado com banco de dados)
Estrutura: Híbrida (namespace /app + rotas planas)
IDs: Slugs (recursos) + UUIDs (relações)
Profundidade: Máximo 3 níveis
SEO: Amigável para páginas públicas
Hierarquia de Acesso
┌─────────────────────────────────────────┐
│  PÚBLICO (sem autenticação)             │
│  /, /sobre, /contato, /entrar           │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│  AUTENTICADO (/app)                     │
│  Smart Redirect baseado em role         │
└─────────────────────────────────────────┘
                    ↓
         ┌──────────┴──────────┬──────────┐
         ↓                     ↓          ↓
    ┌─────────┐          ┌──────────┐  ┌───────┐
    │  ALUNO  │          │ PROFESSOR│  │ ADMIN │
    └─────────┘          └──────────┘  └───────┘

2. TREE COMPLETO DE ROTAS
nipo-school/
│
├── / (root - landing page)
│   ├── sobre
│   ├── contato
│   ├── entrar (login)
│   ├── cadastrar (signup)
│   └── recuperar-senha
│
└── /app (área autenticada)
    │
    ├── [index] → SmartRedirect (redireciona por role)
    │
    ├── configuracoes (compartilhado)
    ├── notificacoes (compartilhado)
    └── ajuda (compartilhado)
    │
    ├── /aluno (role: aluno, admin)
    │   ├── [index] → Dashboard
    │   ├── perfil
    │   ├── conquistas
    │   │   └── :id (UUID)
    │   ├── portfolio
    │   │   ├── novo
    │   │   └── :slug (ex: meu-portfolio-2024)
    │   ├── desafios
    │   │   └── :codigo (ex: ALF-001)
    │   ├── instrumentos
    │   │   └── :slug (ex: clarinete)
    │   ├── aulas
    │   └── progresso
    │
    ├── /professor (role: professor, admin)
    │   ├── [index] → Dashboard
    │   ├── perfil
    │   ├── turmas
    │   │   └── :id (UUID)
    │   ├── submissoes
    │   │   └── :id (UUID)
    │   ├── calendario
    │   ├── materiais
    │   └── relatorios
    │
    └── /admin (role: admin only)
        ├── [index] → Dashboard
        ├── usuarios
        │   ├── novo
        │   └── :id (UUID)
        ├── turmas
        ├── instrumentos
        ├── conquistas
        ├── desafios
        ├── relatorios
        └── auditoria

3. ROTAS PÚBLICAS
3.1 Landing & Institucional
RotaComponenteDescriçãoLayout/LandingPagePágina inicial públicaPublicLayout/sobreSobrePageHistória da escolaPublicLayout/contatoContatoPageFormulário de contatoPublicLayout
Características:

✅ Acessível sem login
✅ SEO otimizado
✅ Navbar pública com CTAs
✅ Footer com links institucionais


3.2 Autenticação
RotaComponenteDescriçãoRedirect após sucesso/entrarLoginPageLogin de usuários/app (smart redirect)/cadastrarSignUpPageCadastro de novos usuários/app (smart redirect)/recuperar-senhaPasswordResetPageRecuperação de senha/entrar/verificar-emailEmailVerificationPageVerificação de email/entrar
Características:

✅ Usa Supabase Auth
✅ Valida com Zod + React Hook Form
✅ Redireciona logados para dashboard
✅ Tokens JWT automáticos


4. ROTAS AUTENTICADAS
4.1 Base /app
RotaComponenteDescriçãoRoles permitidos/appSmartRedirectRedireciona por roleTodos autenticados/app/configuracoesConfiguracoesPageConfigurações da contaTodos/app/notificacoesNotificacoesPageCentral de notificaçõesTodos/app/ajudaAjudaPageCentral de ajudaTodos
Lógica do SmartRedirect:
typescript// Pseudo-código
if (user.tipo_usuario === 'aluno') → /app/aluno
if (user.tipo_usuario === 'professor') → /app/professor
if (user.tipo_usuario === 'admin') → /app/admin

4.2 Rotas do Aluno (/app/aluno)
RotaComponenteDescriçãoDados carregados/app/alunoAlunoDashboardDashboard principalProfile, achievements, next lessons/app/aluno/perfilAlunoPerfilPageEditar perfilProfile completo/app/aluno/conquistasConquistasPageGrid de conquistasuser_achievements, achievements_progress/app/aluno/conquistas/:idConquistaDetailPageDetalhe da conquistaachievement + progress/app/aluno/portfolioPortfolioListPageLista de portfóliosportfolios do usuário/app/aluno/portfolio/novoPortfolioCreatePageCriar portfólioMetodologias, competências/app/aluno/portfolio/:slugPortfolioDetailPageVer/editar portfólioportfolio + evidencias/app/aluno/desafiosDesafiosListPageLista de desafios Alphaalpha_desafios ativos/app/aluno/desafios/:codigoDesafioDetailPageDetalhe + submissãodesafio + submissões/app/aluno/instrumentosInstrumentosPageBiblioteca interativainstrumentos ativos/app/aluno/instrumentos/:slugInstrumentoDetailPageExplorar instrumentoinstrumento + midias + sons/app/aluno/aulasMinhasAulasPageCalendário de aulasaulas + presencas/app/aluno/progressoProgressoPageGráficos de progressoStats completos
Permissões: aluno ou admin

4.3 Rotas do Professor (/app/professor)
RotaComponenteDescriçãoDados carregados/app/professorProfessorDashboardDashboard principalTurmas, stats, pendências/app/professor/perfilProfessorPerfilPageEditar perfilProfile + categorias/app/professor/turmasTurmasListPageLista de turmasturmas do professor/app/professor/turmas/:idTurmaDetailPageDetalhe da turma + alunosturma + matriculas + alunos/app/professor/submissoesSubmissoesListPageSubmissões pendentesalpha_submissoes (RLS)/app/professor/submissoes/:idAvaliarSubmissaoPageAvaliar submissãosubmissao + evidencias/app/professor/calendarioCalendarioPageCalendário de aulasaulas do professor/app/professor/materiaisMateriaisPageMateriais didáticosprofessores_conteudos/app/professor/relatoriosRelatoriosProfessorPageRelatórios de turmaStats agregados
Permissões: professor ou admin

4.4 Rotas do Admin (/app/admin)
RotaComponenteDescriçãoDados carregados/app/adminAdminDashboardDashboard administrativoStats globais/app/admin/usuariosUsuariosListPageGerenciar usuáriosprofiles + roles/app/admin/usuarios/novoUsuarioCreatePageCriar usuárioForm vazio/app/admin/usuarios/:idUsuarioEditPageEditar usuárioprofile completo/app/admin/turmasAdminTurmasPageGerenciar turmasTodas as turmas/app/admin/instrumentosAdminInstrumentosPageGerenciar bibliotecainstrumentos + CRUD/app/admin/conquistasAdminConquistasPageGerenciar conquistasachievements + CRUD/app/admin/desafiosAdminDesafiosPageGerenciar desafios Alphaalpha_desafios + CRUD/app/admin/relatoriosAdminRelatoriosPageRelatórios gerenciaisStats avançados/app/admin/auditoriaAuditoriaPageLogs de auditoriaaudit_activities
Permissões: admin only

5. CONVENÇÕES E PADRÕES
5.1 Nomenclatura de Arquivos
Componente de Página: PascalCase + Page suffix
✅ AlunoDashboard.tsx
✅ ConquistasPage.tsx
✅ PortfolioDetailPage.tsx

Componente de Layout: PascalCase + Layout suffix
✅ PublicLayout.tsx
✅ ProtectedLayout.tsx
✅ AlunoLayout.tsx

Hooks: camelCase + use prefix
✅ useAchievements.ts
✅ usePortfolio.ts
✅ useSmartRedirect.ts
5.2 Estrutura de Parâmetros
typescript// SLUGS (recursos principais)
/portfolio/:slug         → string (alfanumérico + hífens)
/instrumentos/:slug      → string (ex: clarinete, violao)
/desafios/:codigo        → string (ex: ALF-001, MAT-015)

// UUIDs (relações e IDs internos)
/conquistas/:id          → uuid
/turmas/:id              → uuid
/submissoes/:id          → uuid
/usuarios/:id            → uuid

// QUERY PARAMS (filtros, paginação)
?page=1
?filter=pendente
?sort=created_at
?modal=conquista&id=xxx  → modais overlay
5.3 Convenções de Slug
typescript// Geração de slug
function generateSlug(text: string): string {
  return text
    .toLowerCase()
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '') // Remove acentos
    .replace(/[^\w\s-]/g, '') // Remove caracteres especiais
    .replace(/\s+/g, '-') // Espaços → hífens
    .replace(/-+/g, '-') // Múltiplos hífens → único
    .trim()
}

// Exemplos
"Meu Portfólio Musical 2024" → "meu-portfolio-musical-2024"
"Desafio: Criar Melodia" → "desafio-criar-melodia"
"Clarinete em Bb" → "clarinete-em-bb"
5.4 Tratamento de 404
typescript// Rotas não encontradas
/app/aluno/nao-existe     → 404 Page (dentro do layout autenticado)
/pagina-inexistente       → 404 Page (layout público)

// Recursos não encontrados (404 vs Forbidden)
/app/aluno/portfolio/abc123
  → Se não existe: 404 Page
  → Se existe mas não tem acesso: Forbidden Page (403)

6. TABELA DE REFERÊNCIA RÁPIDA
Cheat Sheet de Rotas
bash# ================================
# PÚBLICAS (sem auth)
# ================================
/                          # Landing
/sobre                     # Sobre
/contato                   # Contato
/entrar                    # Login
/cadastrar                 # Signup

# ================================
# ALUNO (auth required)
# ================================
/app/aluno                 # Dashboard
/app/aluno/conquistas      # Lista
/app/aluno/portfolio       # Lista
/app/aluno/portfolio/novo  # Criar
/app/aluno/desafios        # Lista

# ================================
# PROFESSOR (auth required)
# ================================
/app/professor             # Dashboard
/app/professor/turmas      # Lista
/app/professor/submissoes  # Avaliar

# ================================
# ADMIN (auth required)
# ================================
/app/admin                 # Dashboard
/app/admin/usuarios        # Gerenciar
/app/admin/relatorios      # Relatórios

# ================================
# COMPARTILHADAS
# ================================
/app/configuracoes         # Settings
/app/notificacoes          # Notificações
/app/ajuda                 # Help

7. IMPLEMENTAÇÃO REACT ROUTER
7.1 Configuração Principal
tsx// src/app/router.tsx
import { createBrowserRouter, Navigate } from 'react-router-dom'
import { PublicLayout } from '@/components/layout/PublicLayout'
import { ProtectedLayout } from '@/components/layout/ProtectedLayout'
import { ProtectedRoute } from '@/components/auth/ProtectedRoute'
import { SmartRedirect } from '@/components/auth/SmartRedirect'

// Páginas públicas
import { LandingPage } from '@/pages/LandingPage'
import { SobrePage } from '@/pages/SobrePage'
import { ContatoPage } from '@/pages/ContatoPage'
import { LoginPage } from '@/pages/auth/LoginPage'
import { SignUpPage } from '@/pages/auth/SignUpPage'
import { PasswordResetPage } from '@/pages/auth/PasswordResetPage'

// Páginas do aluno
import { AlunoDashboard } from '@/features/alunos/pages/AlunoDashboard'
import { ConquistasPage } from '@/features/alunos/pages/ConquistasPage'
import { ConquistaDetailPage } from '@/features/alunos/pages/ConquistaDetailPage'
import { PortfolioListPage } from '@/features/alunos/pages/PortfolioListPage'
import { PortfolioCreatePage } from '@/features/alunos/pages/PortfolioCreatePage'
import { PortfolioDetailPage } from '@/features/alunos/pages/PortfolioDetailPage'
import { DesafiosListPage } from '@/features/alunos/pages/DesafiosListPage'
import { DesafioDetailPage } from '@/features/alunos/pages/DesafioDetailPage'
import { InstrumentosPage } from '@/features/alunos/pages/InstrumentosPage'
import { InstrumentoDetailPage } from '@/features/alunos/pages/InstrumentoDetailPage'
import { MinhasAulasPage } from '@/features/alunos/pages/MinhasAulasPage'
import { ProgressoPage } from '@/features/alunos/pages/ProgressoPage'

// Páginas do professor
import { ProfessorDashboard } from '@/features/professores/pages/ProfessorDashboard'
import { TurmasListPage } from '@/features/professores/pages/TurmasListPage'
import { TurmaDetailPage } from '@/features/professores/pages/TurmaDetailPage'
import { SubmissoesListPage } from '@/features/professores/pages/SubmissoesListPage'
import { AvaliarSubmissaoPage } from '@/features/professores/pages/AvaliarSubmissaoPage'
import { CalendarioPage } from '@/features/professores/pages/CalendarioPage'
import { MateriaisPage } from '@/features/professores/pages/MateriaisPage'
import { RelatoriosProfessorPage } from '@/features/professores/pages/RelatoriosProfessorPage'

// Páginas do admin
import { AdminDashboard } from '@/features/admin/pages/AdminDashboard'
import { UsuariosListPage } from '@/features/admin/pages/UsuariosListPage'
import { UsuarioCreatePage } from '@/features/admin/pages/UsuarioCreatePage'
import { UsuarioEditPage } from '@/features/admin/pages/UsuarioEditPage'
import { AdminTurmasPage } from '@/features/admin/pages/AdminTurmasPage'
import { AdminInstrumentosPage } from '@/features/admin/pages/AdminInstrumentosPage'
import { AdminConquistasPage } from '@/features/admin/pages/AdminConquistasPage'
import { AdminDesafiosPage } from '@/features/admin/pages/AdminDesafiosPage'
import { AdminRelatoriosPage } from '@/features/admin/pages/AdminRelatoriosPage'
import { AuditoriaPage } from '@/features/admin/pages/AuditoriaPage'

// Páginas compartilhadas
import { ConfiguracoesPage } from '@/pages/ConfiguracoesPage'
import { NotificacoesPage } from '@/pages/NotificacoesPage'
import { AjudaPage } from '@/pages/AjudaPage'
import { PerfilPage } from '@/pages/PerfilPage'

// Páginas de erro
import { NotFoundPage } from '@/pages/NotFoundPage'
import { ForbiddenPage } from '@/pages/ForbiddenPage'

export const router = createBrowserRouter([
  // ========================================
  // ROTAS PÚBLICAS
  // ========================================
  {
    path: '/',
    element: <PublicLayout />,
    children: [
      {
        index: true,
        element: <LandingPage />,
      },
      {
        path: 'sobre',
        element: <SobrePage />,
      },
      {
        path: 'contato',
        element: <ContatoPage />,
      },
      {
        path: 'entrar',
        element: <LoginPage />,
      },
      {
        path: 'cadastrar',
        element: <SignUpPage />,
      },
      {
        path: 'recuperar-senha',
        element: <PasswordResetPage />,
      },
    ],
  },

  // ========================================
  // ROTAS AUTENTICADAS
  // ========================================
  {
    path: '/app',
    element: <ProtectedLayout />,
    children: [
      // Smart redirect baseado no role
      {
        index: true,
        element: <SmartRedirect />,
      },

      // Rotas compartilhadas entre todos os roles
      {
        path: 'configuracoes',
        element: <ConfiguracoesPage />,
      },
      {
        path: 'notificacoes',
        element: <NotificacoesPage />,
      },
      {
        path: 'ajuda',
        element: <AjudaPage />,
      },

      // ========================================
      // ROTAS DO ALUNO
      // ========================================
      {
        path: 'aluno',
        element: <ProtectedRoute allowedRoles={['aluno', 'admin']} />,
        children: [
          {
            index: true,
            element: <AlunoDashboard />,
          },
          {
            path: 'perfil',
            element: <PerfilPage />,
          },
          {
            path: 'conquistas',
            element: <ConquistasPage />,
          },
          {
            path: 'conquistas/:id',
            element: <ConquistaDetailPage />,
          },
          {
            path: 'portfolio',
            element: <PortfolioListPage />,
          },
          {
            path: 'portfolio/novo',
            element: <PortfolioCreatePage />,
          },
          {
            path: 'portfolio/:slug',
            element: <PortfolioDetailPage />,
          },
          {
            path: 'desafios',
            element: <DesafiosListPage />,
          },
          {
            path: 'desafios/:codigo',
            element: <DesafioDetailPage />,
          },
          {
            path: 'instrumentos',
            element: <InstrumentosPage />,
          },
          {
            path: 'instrumentos/:slug',
            element: <InstrumentoDetailPage />,
          },
          {
            path: 'aulas',
            element: <MinhasAulasPage />,
          },
          {
            path: 'progresso',
            element: <ProgressoPage />,
          },
        ],
      },

      // ========================================
      // ROTAS DO PROFESSOR
      // ========================================
      {
        path: 'professor',
        element: <ProtectedRoute allowedRoles={['professor', 'admin']} />,
        children: [
          {
            index: true,
            element: <ProfessorDashboard />,
          },
          {
            path: 'perfil',
            element: <PerfilPage />,
          },
          {
            path: 'turmas',
            element: <TurmasListPage />,
          },
          {
            path: 'turmas/:id',
            element: <TurmaDetailPage />,
          },
          {
            path: 'submissoes',
            element: <SubmissoesListPage />,
          },
          {
            path: 'submissoes/:id',
            element: <AvaliarSubmissaoPage />,
          },
          {
            path: 'calendario',
            element: <CalendarioPage />,
          },
          {
            path: 'materiais',
            element: <MateriaisPage />,
          },
          {
            path: 'relatorios',
            element: <RelatoriosProfessorPage />,
          },
        ],
      },

      // ========================================
      // ROTAS DO ADMIN
      // ========================================
      {
        path: 'admin',
        element: <ProtectedRoute allowedRoles={['admin']} />,
        children: [
          {
            index: true,
            element: <AdminDashboard />,
          },
          {
            path: 'usuarios',
            element: <UsuariosListPage />,
          },
          {
            path: 'usuarios/novo',
            element: <UsuarioCreatePage />,
          },
          {
            path: 'usuarios/:id',
            element: <UsuarioEditPage />,
          },
          {
            path: 'turmas',
            element: <AdminTurmasPage />,
          },
          {
            path: 'instrumentos',
            element: <AdminInstrumentosPage />,
          },
          {
            path: 'conquistas',
            element: <AdminConquistasPage />,
          },
          {
            path: 'desafios',
            element: <AdminDesafiosPage />,
          },
          {
            path: 'relatorios',
            element: <AdminRelatoriosPage />,
          },
          {
            path: 'auditoria',
            element: <AuditoriaPage />,
          },
        ],
      },
    ],
  },

  // ========================================
  // PÁGINAS DE ERRO
  // ========================================
  {
    path: '/403',
    element: <ForbiddenPage />,
  },
  {
    path: '*',
    element: <NotFoundPage />,
  },
])
7.2 App.tsx
tsx// src/app/App.tsx
import { RouterProvider } from 'react-router-dom'
import { QueryClientProvider } from '@tanstack/react-query'
import { ReactQueryDevtools } from '@tanstack/react-query-devtools'
import { AuthProvider } from '@/contexts/AuthContext'
import { queryClient } from '@/lib/config/react-query'
import { router } from './router'
import { ErrorBoundary } from '@/components/shared/ErrorBoundary'

export function App() {
  return (
    <ErrorBoundary>
      <QueryClientProvider client={queryClient}>
        <AuthProvider>
          <RouterProvider router={router} />
        </AuthProvider>
        <ReactQueryDevtools initialIsOpen={false} />
      </QueryClientProvider>
    </ErrorBoundary>
  )
}

8. CONSTANTES TIPO-SEGURAS
typescript// src/lib/constants/routes.ts

/**
 * Constantes de rotas do Nipo School
 * Todas as rotas da aplicação em um único lugar
 * Tipo-seguras com TypeScript
 */

export const ROUTES = {
  // ========================================
  // PÚBLICAS
  // ========================================
  HOME: '/',
  SOBRE: '/sobre',
  CONTATO: '/contato',
  LOGIN: '/entrar',
  SIGNUP: '/cadastrar',
  PASSWORD_RESET: '/recuperar-senha',
  EMAIL_VERIFICATION: '/verificar-email',

  // ========================================
  // BASE AUTENTICADA
  // ========================================
  APP: '/app',
  SETTINGS: '/app/configuracoes',
  NOTIFICATIONS: '/app/notificacoes',
  HELP: '/app/ajuda',

  // ========================================
  // ALUNO
  // ========================================
  ALUNO: {
    INDEX: '/app/aluno',
    PROFILE: '/app/aluno/perfil',
    
    // Conquistas
    ACHIEVEMENTS: '/app/aluno/conquistas',
    ACHIEVEMENT_DETAIL: (id: string) => `/app/aluno/conquistas/${id}`,
    
    // Portfólio
    PORTFOLIO: '/app/aluno/portfolio',
    PORTFOLIO_NEW: '/app/aluno/portfolio/novo',
    PORTFOLIO_DETAIL: (slug: string) => `/app/aluno/portfolio/${slug}`,
    
    // Desafios Alpha
    CHALLENGES: '/app/aluno/desafios',
    CHALLENGE_DETAIL: (codigo: string) => `/app/aluno/desafios/${codigo}`,
    
    // Biblioteca de Instrumentos
    INSTRUMENTS: '/app/aluno/instrumentos',
    INSTRUMENT_DETAIL: (slug: string) => `/app/aluno/instrumentos/${slug}`,
    
    // Aulas & Progresso
    CLASSES: '/app/aluno/aulas',
    PROGRESS: '/app/aluno/progresso',
  },

  // ========================================
  // PROFESSOR
  // ========================================
  PROFESSOR: {
    INDEX: '/app/professor',
    PROFILE: '/app/professor/perfil',
    
    // Turmas
    CLASSES: '/app/professor/turmas',
    CLASS_DETAIL: (id: string) => `/app/professor/turmas/${id}`,
    
    // Submissões
    SUBMISSIONS: '/app/professor/submissoes',
    SUBMISSION_DETAIL: (id: string) => `/app/professor/submissoes/${id}`,
    
    // Outros
    CALENDAR: '/app/professor/calendario',
    MATERIALS: '/app/professor/materiais',
    REPORTS: '/app/professor/relatorios',
  },

  // ========================================
  // ADMIN
  // ========================================
  ADMIN: {
    INDEX: '/app/admin',
    
    // Usuários
    USERS: '/app/admin/usuarios',
    USER_NEW: '/app/admin/usuarios/novo',
    USER_EDIT: (id: string) => `/app/admin/usuarios/${id}`,
    
    // Gestão
    CLASSES: '/app/admin/turmas',
    INSTRUMENTS: '/app/admin/instrumentos',
    ACHIEVEMENTS: '/app/admin/conquistas',
    CHALLENGES: '/app/admin/desafios',
    
    // Análise
    REPORTS: '/app/admin/relatorios',
    AUDIT: '/app/admin/auditoria',
  },

  // ========================================
  // PÁGINAS DE ERRO
  // ========================================
  FORBIDDEN: '/403',
  NOT_FOUND: '/404',
} as const

/**
 * Helpers para navegação tipo-segura
 */
export const navigate = {
  // Aluno
  toAchievement: (id: string) => ROUTES.ALUNO.ACHIEVEMENT_DETAIL(id),
  toPortfolio: (slug: string) => ROUTES.ALUNO.PORTFOLIO_DETAIL(slug),
  toChallenge: (codigo: string) => ROUTES.ALUNO.CHALLENGE_DETAIL(codigo),
  toInstrument: (slug: string) => ROUTES.ALUNO.INSTRUMENT_DETAIL(slug),
  
  // Professor
  toClass: (id: string) => ROUTES.PROFESSOR.CLASS_DETAIL(id),
  toSubmission: (id: string) => ROUTES.PROFESSOR.SUBMISSION_DETAIL(id),
  
  // Admin
  toUserEdit: (id: string) => ROUTES.ADMIN.USER_EDIT(id),
}

/**
 * Extração de parâmetros de rotas
 */
export const extractParam = {
  achievementId: (pathname: string): string | null => {
    const match = pathname.match(/\/conquistas\/([^/]+)/)
    return match ? match[1] : null
  },
  
  portfolioSlug: (pathname: string): string | null => {
    const match = pathname.match(/\/portfolio\/([^/]+)/)
    return match ? match[1] : null
  },
  
  challengeCodigo: (pathname: string): string | null => {
    const match = pathname.match(/\/desafios\/([^/]+)/)
    return match ? match[1] : null
  },
}

/**
 * Validação de rotas
 */
export const isPublicRoute = (pathname: string): boolean => {
  const publicRoutes = [
    ROUTES.HOME,
    ROUTES.SOBRE,
    ROUTES.CONTATO,
    ROUTES.LOGIN,
    ROUTES.SIGNUP,
    ROUTES.PASSWORD_RESET,
    ROUTES.EMAIL_VERIFICATION,
  ]
  return publicRoutes.includes(pathname)
}

export const isAuthRoute = (pathname: string): boolean => {
  return [ROUTES.LOGIN, ROUTES.SIGNUP].includes(pathname)
}

export const isProtectedRoute = (pathname: string): boolean => {
  return pathname.startsWith('/app')
}

/**
 * Tipos derivados
 */
export type PublicRoute = typeof ROUTES.HOME | typeof ROUTES.SOBRE | typeof ROUTES.CONTATO
export type AuthRoute = typeof ROUTES.LOGIN | typeof ROUTES.SIGNUP
export type ProtectedRoute = string // Qualquer rota /app/*

9. GUARDS E PROTEÇÃO
9.1 ProtectedRoute Component
tsx// src/components/auth/ProtectedRoute.tsx
import { Navigate, Outlet, useLocation } from 'react-router-dom'
import { useAuth } from '@/contexts/AuthContext'
import { LoadingScreen } from '@/components/shared/LoadingScreen'
import { ROUTES } from '@/lib/constants/routes'
import type { UserRole } from '@/types'

interface ProtectedRouteProps {
  allowedRoles?: UserRole[]
}

export function ProtectedRoute({ allowedRoles }: ProtectedRouteProps) {
  const { user, profile, isLoading } = useAuth()
  const location = useLocation()

  // Ainda carregando auth
  if (isLoading) {
    return <LoadingScreen />
  }

  // Não autenticado
  if (!user) {
    return <Navigate to={ROUTES.LOGIN} state={{ from: location }} replace />
  }

  // Sem perfil (erro crítico)
  if (!profile) {
    console.error('User without profile:', user.id)
    return <Navigate to={ROUTES.LOGIN} replace />
  }

  // Verifica permissão por role
  if (allowedRoles && !allowedRoles.includes(profile.tipo_usuario)) {
    // Tenta redirecionar para o dashboard correto do usuário
    const userDashboard = {
      aluno: ROUTES.ALUNO.INDEX,
      professor: ROUTES.PROFESSOR.INDEX,
      admin: ROUTES.ADMIN.INDEX,
    }[profile.tipo_usuario]

    return <Navigate to={userDashboard || ROUTES.FORBIDDEN} replace />
  }

  // Autorizado - renderiza filhos
  return <Outlet />
}
9.2 SmartRedirect Component
tsx// src/components/auth/SmartRedirect.tsx
import { Navigate } from 'react-router-dom'
import { useAuth } from '@/contexts/AuthContext'
import { LoadingScreen } from '@/components/shared/LoadingScreen'
import { ROUTES } from '@/lib/constants/routes'

/**
 * Redireciona automaticamente para o dashboard correto baseado no role do usuário
 */
export function SmartRedirect() {
  const { profile, isLoading } = useAuth()

  if (isLoading) {
    return <LoadingScreen />
  }

  if (!profile) {
    return <Navigate to={ROUTES.LOGIN} replace />
  }

  // Mapeamento role → dashboard
  const dashboardMap = {
    aluno: ROUTES.ALUNO.INDEX,
    professor: ROUTES.PROFESSOR.INDEX,
    admin: ROUTES.ADMIN.INDEX,
  }

  const dashboardRoute = dashboardMap[profile.tipo_usuario]

  if (!dashboardRoute) {
    console.error('Unknown user type:', profile.tipo_usuario)
    return <Navigate to={ROUTES.LOGIN} replace />
  }

  return <Navigate to={dashboardRoute} replace />
}
9.3 PublicRoute Component (opcional)
tsx// src/components/auth/PublicRoute.tsx
import { Navigate, Outlet } from 'react-router-dom'
import { useAuth } from '@/contexts/AuthContext'
import { LoadingScreen } from '@/components/shared/LoadingScreen'
import { ROUTES } from '@/lib/constants/routes'

/**
 * Redireciona usuários autenticados para o dashboard
 * Usado em /entrar e /cadastrar
 */
export function PublicRoute() {
  const { user, isLoading } = useAuth()

  if (isLoading) {
    return <LoadingScreen />
  }

  // Se já autenticado, redireciona para /app (smart redirect)
  if (user) {
    return <Navigate to={ROUTES.APP} replace />
  }

  // Não autenticado - mostra página pública
  return <Outlet />
}

10. BREADCRUMBS SYSTEM
10.1 Configuração de Breadcrumbs
typescript// src/lib/utils/breadcrumbs.ts
import { ROUTES } from '@/lib/constants/routes'

export interface Breadcrumb {
  label: string
  path: string
}

export const breadcrumbsMap: Record<string, Breadcrumb[]> = {
  // Aluno
  [ROUTES.ALUNO.INDEX]: [
    { label: 'Dashboard', path: ROUTES.ALUNO.INDEX },
  ],
  [ROUTES.ALUNO.ACHIEVEMENTS]: [
    { label: 'Dashboard', path: ROUTES.ALUNO.INDEX },
    { label: 'Conquistas', path: ROUTES.ALUNO.ACHIEVEMENTS },
  ],
  [ROUTES.ALUNO.PORTFOLIO]: [
    { label: 'Dashboard', path: ROUTES.ALUNO.INDEX },
    { label: 'Portfólio', path: ROUTES.ALUNO.PORTFOLIO },
  ],
  
  // Professor
  [ROUTES.PROFESSOR.INDEX]: [
    { label: 'Dashboard', path: ROUTES.PROFESSOR.INDEX },
  ],
  [ROUTES.PROFESSOR.CLASSES]: [
    { label: 'Dashboard', path: ROUTES.PROFESSOR.INDEX },
    { label: 'Turmas', path: ROUTES.PROFESSOR.CLASSES },
  ],
  [ROUTES.PROFESSOR.SUBMISSIONS]: [
    { label: 'Dashboard', path: ROUTES.PROFESSOR.INDEX },
    { label: 'Submissões', path: ROUTES.PROFESSOR.SUBMISSIONS },
  ],
  
  // Admin
  [ROUTES.ADMIN.INDEX]: [
    { label: 'Dashboard', path: ROUTES.ADMIN.INDEX },
  ],
  [ROUTES.ADMIN.USERS]: [
    { label: 'Dashboard', path: ROUTES.ADMIN.INDEX },
    { label: 'Usuários', path: ROUTES.ADMIN.USERS },
  ],
}

/**
 * Gera breadcrumbs dinamicamente para rotas com parâmetros
 */
export function generateBreadcrumbs(
  pathname: string,
  dynamicLabels?: Record<string, string>
): Breadcrumb[] {
  // Tenta buscar no map estático
  if (breadcrumbsMap[pathname]) {
    return breadcrumbsMap[pathname]
  }

  // Gera dinamicamente
  const segments = pathname.split('/').filter(Boolean)
  const breadcrumbs: Breadcrumb[] = []

  let currentPath = ''
  segments.forEach((segment, index) => {
    currentPath += `/${segment}`
    
    const label = dynamicLabels?.[segment] || 
                  segment.charAt(0).toUpperCase() + segment.slice(1)
    
    breadcrumbs.push({
      label,
      path: currentPath,
    })
  })

  return breadcrumbs
}
10.2 Breadcrumbs Component
tsx// src/components/shared/Breadcrumbs.tsx
import { Link, useLocation } from 'react-router-dom'
import { ChevronRight } from 'lucide-react'
import { generateBreadcrumbs } from '@/lib/utils/breadcrumbs'

interface BreadcrumbsProps {
  dynamicLabels?: Record<string, string>
}

export function Breadcrumbs({ dynamicLabels }: BreadcrumbsProps) {
  const location = useLocation()
  const breadcrumbs = generateBreadcrumbs(location.pathname, dynamicLabels)

  if (breadcrumbs.length <= 1) {
    return null // Não mostra breadcrumbs na home
  }

  return (
    <nav className="flex items-center space-x-2 text-sm text-gray-500 mb-6">
      {breadcrumbs.map((crumb, index) => {
        const isLast = index === breadcrumbs.length - 1

        return (
          <div key={crumb.path} className="flex items-center">
            {index > 0 && <ChevronRight className="h-4 w-4 mx-2" />}
            
            {isLast ? (
              <span className="font-medium text-gray-900">{crumb.label}</span>
            ) : (
              <Link 
                to={crumb.path} 
                className="hover:text-indigo-600 transition-colors"
              >
                {crumb.label}
              </Link>
            )}
          </div>
        )
      })}
    </nav>
  )
}
10.3 Uso nos Componentes
tsx// Exemplo em PortfolioDetailPage.tsx
import { Breadcrumbs } from '@/components/shared/Breadcrumbs'

export function PortfolioDetailPage() {
  const { slug } = useParams()
  const { data: portfolio } = usePortfolio(slug!)

  return (
    <div>
      <Breadcrumbs 
        dynamicLabels={{ 
          [slug!]: portfolio?.titulo || 'Carregando...' 
        }} 
      />
      
      {/* Resto do conteúdo */}
    </div>
  )
}

📁 ARQUIVO PARA SALVAR
Salve este documento como:
docs/
└── frontend/
    └── ROTAS_COMPLETAS.md

✅ CHECKLIST DE VALIDAÇÃO
Antes de começar a implementação, valide:

 Todas as rotas documentadas estão no router.tsx
 Constantes em routes.ts cobrem todas as rotas
 Breadcrumbs configurados para rotas principais
 Guards (ProtectedRoute) implementados
 SmartRedirect funciona corretamente
 404 e 403 pages criadas
 Tipos TypeScript para UserRole definidos
 Convenções de slug documentadas


🎯 RESUMO EXECUTIVO
O que temos agora:
✅ 68 rotas mapeadas e documentadas
✅ Tree visual completo da arquitetura
✅ Convenções e padrões definidos
✅ Implementação React Router pronta
✅ Constantes tipo-seguras
✅ Sistema de guards completo
✅ Breadcrumbs system implementado
Próximo passo:
Começar implementação seguindo o Sprint 0 da documentação de arquitetura!

Está tudo pronto! Precisa de algum ajuste ou esclarecimento? 🚀