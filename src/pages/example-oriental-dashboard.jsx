import React from 'react';
import {
  OrientalContainer,
  OrientalNavigation,
  OrientalGrid,
  OrientalStatsGrid,
  OrientalMainLayout,
  StatCard,
  ActionCard,
  Button,
  Card,
  useOrientalTheme
} from '../shared/components';

import {
  User,
  BookOpen,
  Award,
  TrendingUp,
  Music,
  Target,
  Calendar,
  Clock,
  Play,
  Users,
  BarChart3,
  Settings
} from 'lucide-react';

/**
 * 🎌 Exemplo de Dashboard Oriental - Demonstração do Sistema de Componentes
 * Este arquivo serve como exemplo de como usar os componentes padronizados
 */
const ExampleOrientalDashboard = ({ userType = 'student', user, onLogout }) => {
  // Usar tema automático baseado no tipo de usuário
  const theme = useOrientalTheme(userType);

  // Dados de exemplo para demonstração
  const statsData = {
    student: [
      { icon: <Target />, value: '1,247', label: 'Pontos XP', color: 'amber', trend: 'up', trendValue: '+12%' },
      { icon: <TrendingUp />, value: '7', label: 'Sequência', color: 'red', trend: 'up', trendValue: 'dias' },
      { icon: <BookOpen />, value: '23', label: 'Aulas Completas', color: 'blue' },
      { icon: <Award />, value: '8', label: 'Conquistas', color: 'emerald' }
    ],
    teacher: [
      { icon: <Users />, value: '45', label: 'Alunos Ativos', color: 'blue' },
      { icon: <BookOpen />, value: '12', label: 'Aulas Criadas', color: 'amber' },
      { icon: <BarChart3 />, value: '87%', label: 'Taxa Conclusão', color: 'emerald', trend: 'up', trendValue: '+5%' },
      { icon: <Clock />, value: '2.5h', label: 'Tempo Médio', color: 'red' }
    ],
    admin: [
      { icon: <Users />, value: '234', label: 'Total Usuários', color: 'blue' },
      { icon: <TrendingUp />, value: '89%', label: 'Engajamento', color: 'emerald', trend: 'up', trendValue: '+3%' },
      { icon: <BookOpen />, value: '156', label: 'Total Aulas', color: 'amber' },
      { icon: <BarChart3 />, value: '12', label: 'Relatórios', color: 'red' }
    ]
  };

  const actionsData = {
    student: [
      { icon: <Play />, title: 'Continuar Estudando', description: 'Próxima aula: Escalas Básicas', color: 'red' },
      { icon: <Music />, title: 'Biblioteca', description: 'Explorar instrumentos', color: 'blue' },
      { icon: <Award />, title: 'Conquistas', description: 'Ver progresso', color: 'emerald' },
      { icon: <Calendar />, title: 'Agenda', description: 'Próximas aulas', color: 'orange' }
    ],
    teacher: [
      { icon: <Plus />, title: 'Nova Aula', description: 'Criar conteúdo', color: 'red' },
      { icon: <Users />, title: 'Gerenciar Alunos', description: 'Ver progresso', color: 'blue' },
      { icon: <BarChart3 />, title: 'Relatórios', description: 'Análise de desempenho', color: 'emerald' },
      { icon: <Settings />, title: 'Configurações', description: 'Preferências', color: 'orange' }
    ],
    admin: [
      { icon: <Users />, title: 'Usuários', description: 'Gerenciar sistema', color: 'red' },
      { icon: <BarChart3 />, title: 'Analytics', description: 'Métricas gerais', color: 'blue' },
      { icon: <Settings />, title: 'Sistema', description: 'Configurações', color: 'emerald' },
      { icon: <BookOpen />, title: 'Conteúdo', description: 'Biblioteca geral', color: 'orange' }
    ]
  };

  const currentStats = statsData[userType] || statsData.student;
  const currentActions = actionsData[userType] || actionsData.student;

  const handleActionClick = (action) => {
    console.log(`Ação clicada: ${action.title}`);
    // Aqui você implementaria a navegação real
  };

  const getTitleByUserType = () => {
    const titles = {
      student: 'Minha Jornada Musical',
      teacher: 'Área do Professor',
      admin: 'Painel Administrativo'
    };
    return titles[userType] || titles.student;
  };

  return (
    <OrientalContainer {...theme.container}>
      {/* Navegação oriental */}
      <OrientalNavigation
        title={getTitleByUserType()}
        user={user}
        onLogout={onLogout}
        {...theme.navigation}
      />

      {/* Conteúdo principal */}
      <OrientalMainLayout>
        {/* Seção de boas-vindas */}
        <div className="mb-8">
          <Card variant="oriental" className="text-center">
            <div className="py-6">
              <h2 className="text-2xl font-light text-gray-900 mb-2">
                Bem-vindo ao Nipo School! 🎌
              </h2>
              <p className="text-gray-600">
                {userType === 'student' && 'Continue sua jornada musical oriental'}
                {userType === 'teacher' && 'Gerencie suas aulas e alunos'}
                {userType === 'admin' && 'Monitore todo o sistema educacional'}
              </p>
            </div>
          </Card>
        </div>

        {/* Grid de estatísticas */}
        <div className="mb-8">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">
            📊 Estatísticas
          </h3>
          
          <OrientalStatsGrid layout="dashboard">
            {currentStats.map((stat, index) => (
              <StatCard
                key={index}
                icon={stat.icon}
                value={stat.value}
                label={stat.label}
                color={stat.color}
                trend={stat.trend}
                trendValue={stat.trendValue}
              />
            ))}
          </OrientalStatsGrid>
        </div>

        {/* Grid de ações rápidas */}
        <div className="mb-8">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">
            ⚡ Ações Rápidas
          </h3>
          
          <OrientalGrid columns="auto-fit" gap="lg">
            {currentActions.map((action, index) => (
              <ActionCard
                key={index}
                icon={action.icon}
                title={action.title}
                description={action.description}
                color={action.color}
                onClick={() => handleActionClick(action)}
              />
            ))}
          </OrientalGrid>
        </div>

        {/* Seção extra baseada no tipo de usuário */}
        <div className="mb-8">
          {userType === 'student' && (
            <Card variant="oriental">
              <div className="p-6">
                <h3 className="text-lg font-semibold text-gray-900 mb-3">
                  🎵 Próxima Aula
                </h3>
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium text-gray-900">Escalas Básicas no Violino</p>
                    <p className="text-sm text-gray-600">15 minutos • Nível Iniciante</p>
                  </div>
                  <Button variant="oriental" size="sm">
                    Começar Agora
                  </Button>
                </div>
              </div>
            </Card>
          )}

          {userType === 'teacher' && (
            <Card variant="oriental">
              <div className="p-6">
                <h3 className="text-lg font-semibold text-gray-900 mb-3">
                  👥 Alunos Recentes
                </h3>
                <div className="space-y-3">
                  {['Maria Silva', 'João Santos', 'Ana Costa'].map((name, index) => (
                    <div key={index} className="flex items-center justify-between">
                      <p className="text-gray-900">{name}</p>
                      <span className="text-xs text-emerald-600 bg-emerald-50 px-2 py-1 rounded">
                        Ativo
                      </span>
                    </div>
                  ))}
                </div>
              </div>
            </Card>
          )}

          {userType === 'admin' && (
            <OrientalGrid columns={2} gap="lg">
              <Card variant="oriental">
                <div className="p-6">
                  <h3 className="text-lg font-semibold text-gray-900 mb-3">
                    📈 Crescimento Mensal
                  </h3>
                  <div className="text-center">
                    <p className="text-3xl font-bold text-emerald-600">+23%</p>
                    <p className="text-sm text-gray-600">Novos usuários este mês</p>
                  </div>
                </div>
              </Card>
              
              <Card variant="oriental">
                <div className="p-6">
                  <h3 className="text-lg font-semibold text-gray-900 mb-3">
                    ⚠️ Atenção Necessária
                  </h3>
                  <div className="space-y-2">
                    <p className="text-sm text-amber-600">• 3 relatórios pendentes</p>
                    <p className="text-sm text-red-600">• 1 erro no sistema</p>
                    <p className="text-sm text-blue-600">• 5 feedbacks novos</p>
                  </div>
                </div>
              </Card>
            </OrientalGrid>
          )}
        </div>

        {/* Footer com informações do sistema */}
        <div className="text-center py-8">
          <p className="text-sm text-gray-500">
            🎌 Nipo School - Sistema de Ensino Musical Oriental
          </p>
          <p className="text-xs text-gray-400 mt-1">
            Componentes padronizados em uso: OrientalContainer, OrientalNavigation, StatCard, ActionCard
          </p>
        </div>
      </OrientalMainLayout>
    </OrientalContainer>
  );
};

export default ExampleOrientalDashboard;