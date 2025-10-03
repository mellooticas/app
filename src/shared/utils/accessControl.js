// ==========================================
// SISTEMA DE CONTROLE DE ACESSO
// ==========================================

import { useAuth } from '../../contexts/working-auth-context';

/**
 * Definição de permissões por tipo de usuário
 */
export const PERMISSIONS = {
  // ALUNO - Foco na aprendizagem pessoal
  aluno: {
    instrumentos: {
      view: 'own', // Apenas seu instrumento principal
      list: true,  // Ver lista de todos (para escolher)
      progress: 'own', // Apenas seu progresso
      content: 'level', // Conteúdo do seu nível
      ranking: true, // Ver ranking
      activities: 'enrolled' // Apenas atividades que está inscrito
    },
    turmas: {
      view: 'enrolled', // Apenas turmas matriculado
      list: 'available', // Ver turmas disponíveis para matrícula
      enroll: true, // Pode se matricular
      manage: false // Não pode gerenciar
    },
    users: {
      view: 'colleagues', // Ver colegas da turma
      manage: false
    },
    content: {
      view: 'level', // Baseado no nível
      create: false,
      edit: false
    },
    reports: {
      view: 'own' // Apenas seus relatórios
    }
  },

  // PROFESSOR - Foco na gestão de alunos e turmas
  professor: {
    instrumentos: {
      view: 'teaching', // Instrumentos que ensina
      list: true,
      progress: 'students', // Progresso dos seus alunos
      content: 'all', // Todo conteúdo
      ranking: 'students', // Ranking dos seus alunos
      activities: 'teaching' // Atividades que leciona
    },
    turmas: {
      view: 'teaching', // Turmas que leciona
      list: 'teaching',
      enroll: false, // Não se matricula
      manage: 'own' // Gerencia suas turmas
    },
    users: {
      view: 'students', // Seus alunos
      manage: 'students' // Pode gerenciar seus alunos
    },
    content: {
      view: 'all',
      create: true, // Pode criar conteúdo
      edit: 'own' // Edita apenas seu conteúdo
    },
    reports: {
      view: 'teaching' // Relatórios das suas turmas
    }
  },

  // ADMIN - Acesso total
  admin: {
    instrumentos: {
      view: 'all',
      list: true,
      progress: 'all',
      content: 'all',
      ranking: 'all',
      activities: 'all'
    },
    turmas: {
      view: 'all',
      list: 'all',
      enroll: false,
      manage: 'all' // Gerencia todas as turmas
    },
    users: {
      view: 'all',
      manage: 'all' // Gerencia todos os usuários
    },
    content: {
      view: 'all',
      create: true,
      edit: 'all' // Edita qualquer conteúdo
    },
    reports: {
      view: 'all' // Todos os relatórios
    }
  }
};

/**
 * Hook para verificar permissões
 */
export const usePermissions = () => {
  const { userProfile } = useAuth();
  
  const hasPermission = (module, action, context = {}) => {
    const userType = userProfile?.tipo_usuario || 'aluno';
    const permissions = PERMISSIONS[userType];
    
    if (!permissions || !permissions[module]) return false;
    
    const modulePermissions = permissions[module];
    const permission = modulePermissions[action];
    
    // Permissão booleana simples
    if (typeof permission === 'boolean') {
      return permission;
    }
    
    // Permissão contextual
    switch (permission) {
      case 'all':
        return true;
      case 'own':
        return context.isOwn || context.userId === userProfile?.id;
      case 'teaching':
        return context.isTeaching || context.professorId === userProfile?.id;
      case 'students':
        return context.isStudent || context.isMyStudent;
      case 'enrolled':
        return context.isEnrolled;
      case 'available':
        return context.isAvailable;
      case 'level':
        return context.level === userProfile?.user_level;
      case 'colleagues':
        return context.isColleague;
      default:
        return false;
    }
  };
  
  const canViewInstrument = (instrumentoId) => {
    // Aluno: apenas seu instrumento principal
    if (userProfile?.tipo_usuario === 'aluno') {
      return userProfile?.instrument === instrumentoId;
    }
    // Professor/Admin: todos
    return true;
  };
  
  const canManageTurma = (turma) => {
    const userType = userProfile?.tipo_usuario;
    
    if (userType === 'admin') return true;
    if (userType === 'professor') {
      return turma.professor_id === userProfile?.id;
    }
    return false;
  };
  
  const canViewStudentProgress = (alunoId) => {
    const userType = userProfile?.tipo_usuario;
    
    if (userType === 'admin') return true;
    if (userType === 'professor') {
      // Verificar se é aluno do professor (implementar lógica)
      return true; // Por enquanto
    }
    if (userType === 'aluno') {
      return alunoId === userProfile?.id;
    }
    return false;
  };
  
  return {
    hasPermission,
    canViewInstrument,
    canManageTurma,
    canViewStudentProgress,
    userType: userProfile?.tipo_usuario || 'aluno'
  };
};

/**
 * Componente de proteção baseado em permissões
 */
export const PermissionGuard = ({ 
  module, 
  action, 
  context = {}, 
  fallback = null, 
  children 
}) => {
  const { hasPermission } = usePermissions();
  
  if (!hasPermission(module, action, context)) {
    return fallback;
  }
  
  return children;
};

/**
 * Rotas personalizadas por tipo de usuário
 */
export const getUserRoutes = (userType) => {
  const routes = {
    aluno: [
      {
        path: '/dashboard',
        label: '🏠 Minha Área',
        description: 'Progresso pessoal e atividades'
      },
      {
        path: '/meu-instrumento',
        label: '🎵 Meu Instrumento',
        description: 'Página do meu instrumento'
      },
      {
        path: '/minhas-turmas',
        label: '🎓 Minhas Turmas',
        description: 'Turmas em que estou matriculado'
      },
      {
        path: '/instrumentos',
        label: '🎼 Explorar Instrumentos',
        description: 'Descobrir outros instrumentos'
      },
      {
        path: '/conteudo',
        label: '📚 Conteúdo',
        description: 'Materiais de estudo'
      }
    ],
    
    professor: [
      {
        path: '/professores',
        label: '👨‍🏫 Área do Professor',
        description: 'Dashboard principal'
      },
      {
        path: '/minhas-turmas-professor',
        label: '🎓 Minhas Turmas',
        description: 'Turmas que leciono'
      },
      {
        path: '/meus-alunos',
        label: '👥 Meus Alunos',
        description: 'Progresso dos alunos'
      },
      {
        path: '/meus-instrumentos',
        label: '🎵 Meus Instrumentos',
        description: 'Instrumentos que ensino'
      },
      {
        path: '/professores/conteudos',
        label: '📚 Gerenciar Conteúdo',
        description: 'Criar e editar materiais'
      },
      {
        path: '/relatorios-professor',
        label: '📊 Relatórios',
        description: 'Performance das turmas'
      }
    ],
    
    admin: [
      {
        path: '/dashboard',
        label: '⚙️ Dashboard Admin',
        description: 'Visão geral da escola'
      },
      {
        path: '/instrumentos',
        label: '🎵 Gestão de Instrumentos',
        description: 'Todos os instrumentos'
      },
      {
        path: '/turmas-admin',
        label: '🎓 Gestão de Turmas',
        description: 'Todas as turmas'
      },
      {
        path: '/usuarios-admin',
        label: '👥 Gestão de Usuários',
        description: 'Professores e alunos'
      },
      {
        path: '/professores/admin',
        label: '📊 Relatórios Avançados',
        description: 'Toda a escola'
      },
      {
        path: '/configuracoes',
        label: '⚙️ Configurações',
        description: 'Configurações da escola'
      }
    ]
  };
  
  return routes[userType] || routes.aluno;
};

/**
 * Configuração de navegação baseada no usuário
 */
export const getNavigationConfig = (userType) => {
  const configs = {
    aluno: {
      primaryColor: '#3B82F6', // Azul
      icon: '🎓',
      welcomeMessage: 'Continue sua jornada musical!',
      mainSections: ['progresso', 'instrumento', 'turmas', 'conteudo']
    },
    
    professor: {
      primaryColor: '#059669', // Verde
      icon: '👨‍🏫',
      welcomeMessage: 'Gerencie suas turmas e alunos',
      mainSections: ['turmas', 'alunos', 'conteudo', 'relatorios']
    },
    
    admin: {
      primaryColor: '#DC2626', // Vermelho
      icon: '⚙️',
      welcomeMessage: 'Administre toda a escola',
      mainSections: ['overview', 'instrumentos', 'turmas', 'usuarios', 'relatorios']
    }
  };
  
  return configs[userType] || configs.aluno;
};