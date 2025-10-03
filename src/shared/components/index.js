// 🎌 SISTEMA DE COMPONENTES ORIENTAIS - NIPO SCHOOL
// Exportação centralizada de todos os componentes reutilizáveis

// ═══════════════════════════════════════════════════════════════
// 🎨 DESIGN TOKENS
// ═══════════════════════════════════════════════════════════════
export { 
  default as DesignTokens,
  getColor,
  getSpacing,
  getRadius,
  getShadow,
  CompiledClasses
} from '../styles/design-tokens';

// ═══════════════════════════════════════════════════════════════
// 🧩 COMPONENTES BASE PADRONIZADOS
// ═══════════════════════════════════════════════════════════════
export { default as Button } from './base/Button';
export { 
  default as Card,
  StatCard,
  ActionCard
} from './base/Card';
export { default as Input } from './base/Input';
export { default as Modal } from './base/Modal';

// ═══════════════════════════════════════════════════════════════
// 🎌 COMPONENTES ORIENTAIS
// ═══════════════════════════════════════════════════════════════

// Containers e Layout
export { 
  default as OrientalContainer,
  OrientalSection,
  OrientalWrapper
} from './oriental/OrientalContainer';

// Navegação
export { 
  default as OrientalNavigation,
  OrientalBreadcrumb
} from './oriental/OrientalNavigation';

// Sistema de Grid e Layout
export { 
  default as OrientalGrid,
  OrientalStatsGrid,
  OrientalFlex,
  OrientalStack,
  OrientalCenter,
  OrientalMainLayout
} from './layout/OrientalGrid';

// ═══════════════════════════════════════════════════════════════
// 🎯 COMPONENTES LEGACY (Compatibilidade)
// ═══════════════════════════════════════════════════════════════

// Navigation components
export { NavigationBar } from './navigation/NavigationBar';

// Layout components
export { AlunoPageLayout } from './layout';

// UI components
export { default as NipoHeader } from './UI/NipoHeader';
export { NipoHeaderLogo } from './UI/NipoLogo';
export { default as LogoVencedorDestaque } from './UI/LogoVencedorDestaque';

// ═══════════════════════════════════════════════════════════════
// 🎪 KITS DE COMPONENTES PRÉ-MONTADOS
// ═══════════════════════════════════════════════════════════════

// Importar componentes para os kits
import OrientalContainer from './oriental/OrientalContainer';
import OrientalNavigation from './oriental/OrientalNavigation';
import OrientalGrid, { OrientalStatsGrid, OrientalFlex, OrientalMainLayout } from './layout/OrientalGrid';
import { StatCard, ActionCard } from './base/Card';
import Button from './base/Button';
import Card from './base/Card';

/**
 * 🎓 Kit Dashboard do Aluno
 */
export const StudentDashboardKit = {
  Container: OrientalContainer,
  Navigation: OrientalNavigation,
  StatsGrid: OrientalStatsGrid,
  StatCard,
  ActionCard,
  MainLayout: OrientalMainLayout
};

/**
 * 👨‍🏫 Kit Dashboard do Professor
 */
export const TeacherDashboardKit = {
  Container: OrientalContainer,
  Navigation: OrientalNavigation,
  Grid: OrientalGrid,
  Flex: OrientalFlex,
  Card,
  Button,
  StatsGrid: OrientalStatsGrid,
  StatCard,
  ActionCard,
  MainLayout: OrientalMainLayout
};

/**
 * 👑 Kit Dashboard do Admin
 */
export const AdminDashboardKit = {
  Container: OrientalContainer,
  Navigation: OrientalNavigation,
  Grid: OrientalGrid,
  StatsGrid: OrientalStatsGrid,
  StatCard,
  ActionCard,
  Card,
  Button,
  MainLayout: OrientalMainLayout
};

// ═══════════════════════════════════════════════════════════════
// 🎨 TEMAS PRÉ-DEFINIDOS
// ═══════════════════════════════════════════════════════════════

export const OrientalThemes = {
  // Tema Estudante (mais leve)
  student: {
    container: { theme: 'sakura', userLevel: 'student' },
    navigation: { userType: 'student', logoChar: '学' },
    colors: 'from-orange-100 to-red-100'
  },
  
  // Tema Professor (funcional)
  teacher: {
    container: { theme: 'teacher', userLevel: 'teacher' },
    navigation: { userType: 'teacher', logoChar: '先' },
    colors: 'from-orange-200 to-red-200'
  },
  
  // Tema Admin (completo)
  admin: {
    container: { theme: 'admin', userLevel: 'admin' },
    navigation: { userType: 'admin', logoChar: '師' },
    colors: 'from-red-300 to-pink-300'
  }
};

// ═══════════════════════════════════════════════════════════════
// 🚀 HELPERS E UTILITÁRIOS
// ═══════════════════════════════════════════════════════════════

/**
 * Hook para obter configuração de tema por tipo de usuário
 */
export const useOrientalTheme = (userType = 'student') => {
  return OrientalThemes[userType] || OrientalThemes.student;
};

/**
 * EXEMPLOS DE USO:
 * 
 * // Dashboard básico
 * import { OrientalContainer, OrientalNavigation, OrientalGrid, StatCard } from '@/shared/components';
 * 
 * const Dashboard = () => (
 *   <OrientalContainer theme="sakura" userLevel="student">
 *     <OrientalNavigation title="Meu Dashboard" userType="student" />
 *     <OrientalGrid columns="auto-fit" gap="lg">
 *       <StatCard icon={<Icon />} value="123" label="Pontos" />
 *     </OrientalGrid>
 *   </OrientalContainer>
 * );
 * 
 * // Usando kit pré-montado
 * import { StudentDashboardKit } from '@/shared/components';
 * 
 * const { Container, Navigation, StatsGrid, StatCard } = StudentDashboardKit;
 * 
 * // Usando tema automático
 * import { useOrientalTheme } from '@/shared/components';
 * 
 * const theme = useOrientalTheme('student');
 * <OrientalContainer {...theme.container} />
 */