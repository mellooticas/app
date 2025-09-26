// AdminNavigationPanel.jsx - Painel de navegação rápida para admin
import React from 'react';
import { useNavigate } from 'react-router-dom';
import { 
  BarChart3, Users, Music, BookOpen, Award, Settings,
  Activity, Calendar, MessageSquare, FileText, Database,
  Zap, Crown, Eye, TrendingUp, Heart
} from 'lucide-react';

const AdminNavigationPanel = () => {
  const navigate = useNavigate();

  const adminSections = [
    {
      title: 'Dashboards',
      icon: BarChart3,
      color: 'blue',
      items: [
        { label: 'Dashboard Principal', path: '/admin', description: 'Visão geral tradicional' },
        { label: 'Dashboard Completo', path: '/admin/dashboard-completo', description: 'Todos os dados do banco' },
        { label: 'Relatórios', path: '/admin/relatorios', description: 'Relatórios detalhados' }
      ]
    },
    {
      title: 'Gestão de Pessoas',
      icon: Users,
      color: 'green',
      items: [
        { label: 'Alunos', path: '/admin/alunos', description: 'Gerenciar estudantes' },
        { label: 'Professores', path: '/admin/professores', description: 'Gerenciar educadores' },
        { label: 'Turmas', path: '/admin/turmas', description: 'Organizar turmas' }
      ]
    },
    {
      title: 'Sistema de Ensino',
      icon: Music,
      color: 'purple',
      items: [
        { label: 'Instrumentos', path: '/admin/instruments', description: 'Catálogo completo' },
        { label: 'Curriculum', path: '/admin/curriculum', description: 'Metodologias de ensino' },
        { label: 'Kanban de Aulas', path: '/admin/kanban', description: 'Organização de conteúdo' }
      ]
    },
    {
      title: 'Ferramentas',
      icon: Settings,
      color: 'orange',
      items: [
        { label: 'QR Manager', path: '/admin/qr-manager', description: 'Gerador de QR Codes' },
        { label: 'Configurações', path: '/admin/configuracoes', description: 'Configurações do sistema' }
      ]
    }
  ];

  const getColorClasses = (color) => {
    const colors = {
      blue: { bg: 'bg-blue-50', hover: 'hover:bg-blue-100', text: 'text-blue-700', icon: 'text-blue-600' },
      green: { bg: 'bg-green-50', hover: 'hover:bg-green-100', text: 'text-green-700', icon: 'text-green-600' },
      purple: { bg: 'bg-purple-50', hover: 'hover:bg-purple-100', text: 'text-purple-700', icon: 'text-purple-600' },
      orange: { bg: 'bg-orange-50', hover: 'hover:bg-orange-100', text: 'text-orange-700', icon: 'text-orange-600' }
    };
    return colors[color] || colors.blue;
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-orange-50 via-red-50 to-pink-50">
      <div className="max-w-6xl mx-auto p-6">
        
        {/* Header */}
        <div className="text-center mb-8">
          <div className="flex items-center justify-center space-x-3 mb-4">
            <div className="w-12 h-12 bg-gradient-to-br from-red-500 to-orange-500 rounded-xl flex items-center justify-center">
              <Crown className="h-6 w-6 text-white" />
            </div>
            <h1 className="text-3xl font-bold text-gray-900">Painel Administrativo</h1>
          </div>
          <p className="text-gray-600 text-lg">Centro de controle do Nipo School</p>
        </div>

        {/* Navegação por seções */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {adminSections.map((section, sectionIndex) => {
            const colors = getColorClasses(section.color);
            const IconComponent = section.icon;

            return (
              <div key={sectionIndex} className="bg-white rounded-2xl shadow-lg p-6">
                
                {/* Título da seção */}
                <div className="flex items-center space-x-3 mb-6">
                  <div className={`w-10 h-10 ${colors.bg} rounded-xl flex items-center justify-center`}>
                    <IconComponent className={`h-6 w-6 ${colors.icon}`} />
                  </div>
                  <h2 className="text-xl font-bold text-gray-900">{section.title}</h2>
                </div>

                {/* Items da seção */}
                <div className="space-y-3">
                  {section.items.map((item, itemIndex) => (
                    <button
                      key={itemIndex}
                      onClick={() => navigate(item.path)}
                      className={`w-full text-left p-4 ${colors.bg} ${colors.hover} rounded-xl transition-all duration-200 group`}
                    >
                      <div className="flex items-center justify-between">
                        <div>
                          <h3 className={`font-semibold ${colors.text} group-hover:${colors.text.replace('700', '800')}`}>
                            {item.label}
                          </h3>
                          <p className="text-gray-600 text-sm mt-1">
                            {item.description}
                          </p>
                        </div>
                        <Eye className={`h-5 w-5 ${colors.icon} opacity-0 group-hover:opacity-100 transition-opacity`} />
                      </div>
                    </button>
                  ))}
                </div>
              </div>
            );
          })}
        </div>

        {/* Estatísticas rápidas */}
        <div className="mt-8 bg-white rounded-2xl shadow-lg p-6">
          <h3 className="text-xl font-bold text-gray-900 mb-6">Acesso Rápido</h3>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            
            <button
              onClick={() => navigate('/admin/dashboard-completo')}
              className="p-4 bg-gradient-to-br from-blue-500 to-blue-600 text-white rounded-xl hover:from-blue-600 hover:to-blue-700 transition-all group"
            >
              <Database className="h-8 w-8 mb-2 mx-auto group-hover:scale-110 transition-transform" />
              <p className="font-semibold">Dados Completos</p>
            </button>

            <button
              onClick={() => navigate('/admin/instruments')}
              className="p-4 bg-gradient-to-br from-purple-500 to-purple-600 text-white rounded-xl hover:from-purple-600 hover:to-purple-700 transition-all group"
            >
              <Music className="h-8 w-8 mb-2 mx-auto group-hover:scale-110 transition-transform" />
              <p className="font-semibold">Instrumentos</p>
            </button>

            <button
              onClick={() => navigate('/admin/alunos')}
              className="p-4 bg-gradient-to-br from-green-500 to-green-600 text-white rounded-xl hover:from-green-600 hover:to-green-700 transition-all group"
            >
              <Users className="h-8 w-8 mb-2 mx-auto group-hover:scale-110 transition-transform" />
              <p className="font-semibold">Alunos</p>
            </button>

            <button
              onClick={() => navigate('/admin/professores')}
              className="p-4 bg-gradient-to-br from-orange-500 to-orange-600 text-white rounded-xl hover:from-orange-600 hover:to-orange-700 transition-all group"
            >
              <Award className="h-8 w-8 mb-2 mx-auto group-hover:scale-110 transition-transform" />
              <p className="font-semibold">Professores</p>
            </button>

          </div>
        </div>

        {/* Footer */}
        <div className="mt-8 text-center text-gray-500">
          <p>Sistema de administração completo • Nipo School</p>
          <div className="flex items-center justify-center space-x-2 mt-2">
            <Heart className="h-4 w-4 text-red-500" />
            <span className="text-sm">Feito com dedicação para educação musical</span>
          </div>
        </div>

      </div>
    </div>
  );
};

export default AdminNavigationPanel;