import React, { useEffect } from 'react';
import { useAuth } from '../contexts/working-auth-context';
import { Card, Button } from '../shared/components/base';

/**
 * Smart Dashboard - Redireciona automaticamente baseado no tipo de usuário
 */
const SmartDashboard = () => {
  const { user, userProfile, loading, redirectUserBasedOnType } = useAuth();

  useEffect(() => {
    // Se usuário está logado e tem perfil, redirecionar automaticamente
    if (user && userProfile && redirectUserBasedOnType) {
      console.log('🔄 SmartDashboard: Redirecionando automaticamente...');
      setTimeout(() => {
        redirectUserBasedOnType();
      }, 1000); // Pequeno delay para mostrar a tela
    }
  }, [user, userProfile, redirectUserBasedOnType]);

  // Se está carregando
  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-b-2 border-blue-500 mx-auto mb-4"></div>
          <p className="text-gray-600 text-lg">Carregando...</p>
        </div>
      </div>
    );
  }

  // Se não está logado, mostrar opções de login
  if (!user) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center p-8">
        <div className="max-w-md mx-auto">
          <Card className="text-center">
            <div className="p-8">
              <div className="w-20 h-20 mx-auto mb-6 bg-blue-100 rounded-full flex items-center justify-center">
                <span className="text-4xl">🎓</span>
              </div>
              
              <h1 className="text-3xl font-bold text-gray-900 mb-4">
                Nipo School
              </h1>
              
              <p className="text-gray-600 mb-8">
                Sistema de Ensino Musical
              </p>
              
              <div className="space-y-4">
                <Button 
                  onClick={() => window.location.href = '/login'}
                  variant="primary"
                  className="w-full"
                >
                  🔑 Fazer Login
                </Button>
                
                <Button 
                  onClick={() => window.location.href = '/register'}
                  variant="secondary"
                  className="w-full"
                >
                  📝 Criar Conta
                </Button>
                
                <Button 
                  onClick={() => window.location.href = '/user-testing'}
                  variant="outline"
                  className="w-full"
                >
                  🧪 Página de Testes
                </Button>
              </div>
            </div>
          </Card>
        </div>
      </div>
    );
  }

  // Se está logado mas ainda carregando perfil
  if (user && !userProfile) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-b-2 border-green-500 mx-auto mb-4"></div>
          <p className="text-gray-600 text-lg">Carregando perfil...</p>
          <p className="text-gray-500 text-sm mt-2">{user.email}</p>
        </div>
      </div>
    );
  }

  // Se tem usuário e perfil, mostrar tela de redirecionamento
  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-8">
      <div className="max-w-md mx-auto">
        <Card className="text-center">
          <div className="p-8">
            <div className={`w-20 h-20 mx-auto mb-6 rounded-full flex items-center justify-center text-white font-bold text-2xl ${
              userProfile.tipo_usuario === 'admin' ? 'bg-red-500' :
              userProfile.tipo_usuario === 'teacher' || userProfile.tipo_usuario === 'professor' ? 'bg-blue-500' :
              userProfile.tipo_usuario === 'student' || userProfile.tipo_usuario === 'aluno' ? 'bg-green-500' :
              'bg-gray-500'
            }`}>
              {userProfile.tipo_usuario === 'admin' ? '👑' :
               userProfile.tipo_usuario === 'teacher' || userProfile.tipo_usuario === 'professor' ? '👨‍🏫' :
               userProfile.tipo_usuario === 'student' || userProfile.tipo_usuario === 'aluno' ? '👨‍🎓' : '👤'}
            </div>
            
            <h1 className="text-2xl font-bold text-gray-900 mb-2">
              Bem-vindo(a)!
            </h1>
            
            <p className="text-lg font-medium text-gray-800 mb-1">
              {userProfile.full_name}
            </p>
            
            <p className="text-sm text-gray-600 mb-6">
              {userProfile.tipo_usuario === 'admin' ? '👑 Administrador' :
               userProfile.tipo_usuario === 'teacher' || userProfile.tipo_usuario === 'professor' ? '👨‍🏫 Professor' :
               userProfile.tipo_usuario === 'student' || userProfile.tipo_usuario === 'aluno' ? '👨‍🎓 Estudante' :
               userProfile.tipo_usuario}
            </p>
            
            <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-6">
              <p className="text-sm text-blue-800">
                🔄 Redirecionando para sua área...
              </p>
            </div>
            
            <Button 
              onClick={redirectUserBasedOnType}
              variant="primary"
              className="w-full"
            >
              🚀 Ir para Minha Área
            </Button>
          </div>
        </Card>
      </div>
    </div>
  );
};

export default SmartDashboard;