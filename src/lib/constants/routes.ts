/**
 * 🗺️ CONSTANTES DE ROTAS - NIPO SCHOOL
 * 
 * Todas as rotas da aplicação em um único lugar
 * Tipo-seguras com TypeScript
 * 
 * Total: 46 rotas únicas + módulo História da Música
 */

// ========================================
// ROTAS PÚBLICAS
// ========================================
export const ROUTES = {
  HOME: '/',
  SOBRE: '/sobre',
  CONTATO: '/contato',
  LOGIN: '/login',
  SIGNUP: '/signup',
  PASSWORD_RESET: '/password-reset',

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
    ACHIEVEMENTS: {
      INDEX: '/app/aluno/conquistas',
      DETAIL: (id: string) => `/app/aluno/conquistas/${id}`,
    },
    
    // Portfólio
    PORTFOLIO: {
      INDEX: '/app/aluno/portfolio',
      CREATE: '/app/aluno/portfolio/novo',
      DETAIL: (id: string) => `/app/aluno/portfolio/${id}`,
      EDIT: (id: string) => `/app/aluno/portfolio/${id}/editar`,
    },
    
    // Desafios Alpha
    CHALLENGES: {
      INDEX: '/app/aluno/desafios',
      DETAIL: (id: string) => `/app/aluno/desafios/${id}`,
    },
    
    // Biblioteca de Instrumentos
    INSTRUMENTS: {
      INDEX: '/app/aluno/instrumentos',
      DETAIL: (slug: string) => `/app/aluno/instrumentos/${slug}`,
    },
    
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
  // HISTÓRIA DA MÚSICA
  // ========================================
  HISTORIA: {
    INDEX: '/app/historia',
    PERIODOS: '/app/historia/periodos',
    PERIODO_DETAIL: (id: string) => `/app/historia/periodos/${id}`,
    COMPOSITORES: '/app/historia/compositores',
    COMPOSITOR_DETAIL: (id: string) => `/app/historia/compositores/${id}`,
    OBRAS: '/app/historia/obras',
    OBRA_DETAIL: (id: string) => `/app/historia/obras/${id}`,
    TIMELINE: '/app/historia/timeline',
    GENEROS: '/app/historia/generos',
    QUIZ: '/app/historia/quiz',
    BIBLIOTECA: '/app/historia/biblioteca',
  },

  // ========================================
  // PÁGINAS DE ERRO
  // ========================================
  FORBIDDEN: '/403',
  NOT_FOUND: '/404',
} as const

// ========================================
// HELPERS
// ========================================
export const getDashboardRoute = (tipoUsuario: string): string => {
  const map: Record<string, string> = {
    aluno: ROUTES.ALUNO.INDEX,
    professor: ROUTES.PROFESSOR.INDEX,
    admin: ROUTES.ADMIN.INDEX,
    pastor: ROUTES.ALUNO.INDEX,
  }
  return map[tipoUsuario] || ROUTES.HOME
}

export const isPublicRoute = (pathname: string): boolean => {
  const publicRoutes: string[] = [
    ROUTES.HOME,
    ROUTES.SOBRE,
    ROUTES.CONTATO,
    ROUTES.LOGIN,
    ROUTES.SIGNUP,
    ROUTES.PASSWORD_RESET,
  ]
  return publicRoutes.includes(pathname)
}

export const isProtectedRoute = (pathname: string): boolean => {
  return pathname.startsWith('/app')
}

// ========================================
// TIPOS
// ========================================
export type RouteType = typeof ROUTES
export type RoleType = 'aluno' | 'professor' | 'admin' | 'pastor'
