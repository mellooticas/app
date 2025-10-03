import React from 'react';
import { Card, Button } from '../../../shared/components/base';

/**
 * Dashboard do Professor
 * 
 * Página principal para professores com visão geral das turmas,
 * próximas aulas e ferramentas de ensino.
 */
const TeacherDashboard = () => {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white shadow">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-6">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">
                👨‍🏫 Painel do Professor
              </h1>
              <p className="mt-1 text-sm text-gray-600">
                Gerencie suas turmas e acompanhe o progresso dos alunos
              </p>
            </div>
            <Button variant="primary" size="sm">
              📅 Nova Aula
            </Button>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <Card variant="elevated" size="md">
            <div className="text-center">
              <div className="text-4xl mb-2">👥</div>
              <p className="text-2xl font-bold text-blue-600">48</p>
              <p className="text-sm text-gray-600">Alunos Ativos</p>
            </div>
          </Card>

          <Card variant="elevated" size="md">
            <div className="text-center">
              <div className="text-4xl mb-2">📚</div>
              <p className="text-2xl font-bold text-green-600">12</p>
              <p className="text-sm text-gray-600">Turmas</p>
            </div>
          </Card>

          <Card variant="elevated" size="md">
            <div className="text-center">
              <div className="text-4xl mb-2">🎓</div>
              <p className="text-2xl font-bold text-purple-600">8</p>
              <p className="text-sm text-gray-600">Aulas Hoje</p>
            </div>
          </Card>

          <Card variant="elevated" size="md">
            <div className="text-center">
              <div className="text-4xl mb-2">⭐</div>
              <p className="text-2xl font-bold text-yellow-600">4.8</p>
              <p className="text-sm text-gray-600">Avaliação Média</p>
            </div>
          </Card>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Today's Classes */}
          <Card 
            header={{
              title: "Aulas de Hoje",
              subtitle: "Sua agenda para hoje"
            }}
          >
            <div className="space-y-4">
              {[
                { time: '09:00', class: 'Piano Iniciante A', students: 8, room: 'Sala 1' },
                { time: '14:00', class: 'Piano Intermediário', students: 6, room: 'Sala 2' },
                { time: '16:00', class: 'Teoria Musical', students: 12, room: 'Sala 3' }
              ].map((item, index) => (
                <div key={index} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                  <div>
                    <p className="font-medium text-gray-900">{item.class}</p>
                    <p className="text-sm text-gray-600">
                      {item.time} • {item.students} alunos • {item.room}
                    </p>
                  </div>
                  <Button variant="outline" size="xs">
                    Iniciar
                  </Button>
                </div>
              ))}
            </div>
          </Card>

          {/* Quick Actions */}
          <Card 
            header={{
              title: "Ações Rápidas",
              subtitle: "Ferramentas do dia a dia"
            }}
          >
            <div className="grid grid-cols-2 gap-4">
              {[
                { icon: '📝', title: 'Criar Conteúdo', desc: 'Materiais de aula' },
                { icon: '👥', title: 'Minhas Turmas', desc: 'Gerenciar turmas' },
                { icon: '📊', title: 'Relatórios', desc: 'Progresso dos alunos' },
                { icon: '⚙️', title: 'Configurações', desc: 'Perfil e preferências' }
              ].map((action, index) => (
                <div 
                  key={index}
                  className="p-4 border border-gray-200 rounded-lg hover:shadow-md transition-shadow cursor-pointer text-center"
                >
                  <div className="text-2xl mb-2">{action.icon}</div>
                  <h3 className="font-medium text-gray-900 mb-1">{action.title}</h3>
                  <p className="text-xs text-gray-600">{action.desc}</p>
                </div>
              ))}
            </div>
          </Card>
        </div>

        {/* Recent Activity */}
        <div className="mt-8">
          <Card 
            header={{
              title: "Atividade Recente",
              subtitle: "Últimas ações dos seus alunos"
            }}
          >
            <div className="text-center py-8">
              <p className="text-gray-600">Página em desenvolvimento...</p>
              <p className="text-sm text-gray-500 mt-2">
                Em breve você verá as atividades dos seus alunos aqui!
              </p>
            </div>
          </Card>
        </div>
      </div>
    </div>
  );
};

export default TeacherDashboard;