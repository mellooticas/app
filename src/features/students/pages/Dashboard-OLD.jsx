import React from 'react';
import { Card, Button } from '../../../shared/components/base';

/**
 * Dashboard do Estudante
 * 
 * Página principal para estudantes com visão geral do progresso,
 * próximas aulas e atividades recomendadas.
 */
const StudentDashboard = () => {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white shadow">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-6">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">
                🎓 Meu Painel de Estudos
              </h1>
              <p className="mt-1 text-sm text-gray-600">
                Bem-vindo de volta! Continue seu aprendizado musical
              </p>
            </div>
            <Button variant="primary" size="sm">
              🚀 Nova Lição
            </Button>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Progress Cards */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
          <Card variant="elevated" size="md">
            <div className="text-center">
              <div className="text-4xl mb-2">🎼</div>
              <p className="text-2xl font-bold text-blue-600">Piano</p>
              <p className="text-sm text-gray-600">Meu Instrumento</p>
              <div className="mt-2 bg-blue-100 rounded-full h-2">
                <div className="bg-blue-600 h-2 rounded-full" style={{width: '65%'}}></div>
              </div>
              <p className="text-xs text-gray-500 mt-1">65% do nível atual</p>
            </div>
          </Card>

          <Card variant="elevated" size="md">
            <div className="text-center">
              <div className="text-4xl mb-2">⭐</div>
              <p className="text-2xl font-bold text-yellow-600">1,250</p>
              <p className="text-sm text-gray-600">Pontos XP</p>
              <p className="text-xs text-green-600">+150 esta semana</p>
            </div>
          </Card>

          <Card variant="elevated" size="md">
            <div className="text-center">
              <div className="text-4xl mb-2">🔥</div>
              <p className="text-2xl font-bold text-orange-600">12</p>
              <p className="text-sm text-gray-600">Sequência de Dias</p>
              <p className="text-xs text-gray-500">Continue praticando!</p>
            </div>
          </Card>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Next Lessons */}
          <Card 
            header={{
              title: "Próximas Aulas",
              subtitle: "Suas próximas atividades programadas"
            }}
          >
            <div className="space-y-4">
              {[
                { time: 'Hoje 14:00', lesson: 'Escalas Maiores', teacher: 'Prof. Maria' },
                { time: 'Amanhã 16:30', lesson: 'Teoria Musical', teacher: 'Prof. João' },
                { time: 'Quinta 10:00', lesson: 'Prática de Repertório', teacher: 'Prof. Ana' }
              ].map((item, index) => (
                <div key={index} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                  <div>
                    <p className="font-medium text-gray-900">{item.lesson}</p>
                    <p className="text-sm text-gray-600">{item.teacher} • {item.time}</p>
                  </div>
                  <Button variant="outline" size="xs">
                    Entrar
                  </Button>
                </div>
              ))}
            </div>
          </Card>

          {/* Quick Actions */}
          <Card 
            header={{
              title: "Ações Rápidas",
              subtitle: "Acesso rápido às principais funcionalidades"
            }}
          >
            <div className="grid grid-cols-2 gap-4">
              {[
                { icon: '📚', title: 'Biblioteca', desc: 'Materiais de estudo' },
                { icon: '🎼', title: 'Meu Instrumento', desc: 'Piano clássico' },
                { icon: '📊', title: 'Progresso', desc: 'Ver estatísticas' },
                { icon: '🏆', title: 'Conquistas', desc: 'Medalhas e troféus' }
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
              subtitle: "Seu progresso nas últimas semanas"
            }}
          >
            <div className="text-center py-8">
              <p className="text-gray-600">Página em desenvolvimento...</p>
              <p className="text-sm text-gray-500 mt-2">
                Em breve você verá seu progresso detalhado aqui!
              </p>
            </div>
          </Card>
        </div>
      </div>
    </div>
  );
};

export default StudentDashboard;