import React from 'react';
import { useAuth } from '../contexts/working-auth-context';
import { Card, Button } from '../shared/components/base';

/**
 * Página de Acesso Negado
 * 
 * Mostra quando usuário tenta acessar área sem permissão
 */
const UnauthorizedPage = () => {
  const { user, userProfile, logout, redirectUserBasedOnType } = useAuth();

  const handleGoToMyArea = () => {
    if (redirectUserBasedOnType) {
      redirectUserBasedOnType();
    } else {
      // Fallback manual
      const userType = userProfile?.tipo_usuario;
      const typeMapping = {
        'aluno': '/students',
        'professor': '/teachers',
        'admin': '/admin',
        'pastor': '/admin'
      };
      
      const correctPath = typeMapping[userType] || '/dashboard';
      window.location.href = correctPath;
    }
  };

  const handleLogout = async () => {
    try {
      await logout();
      window.location.href = '/login';
    } catch (error) {
      console.error('Erro no logout:', error);
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-8">
      <div className="max-w-md mx-auto">
        <Card className="text-center">
          <div className="p-8">
            {/* Ícone de acesso negado */}
            <div className="w-20 h-20 mx-auto mb-6 bg-red-100 rounded-full flex items-center justify-center">
              <span className="text-4xl">🚫</span>
            </div>
            
            {/* Título */}
            <h1 className="text-2xl font-bold text-gray-900 mb-4">
              Acesso Negado
            </h1>
            
            {/* Mensagem */}
            <p className="text-gray-600 mb-6">
              Você não tem permissão para acessar esta área do sistema.
            </p>
            
            {/* Informações do usuário */}
            {user && userProfile && (
              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-6">
                <div className="flex items-center justify-center space-x-3 mb-2">
                  <div className="w-10 h-10 bg-blue-500 rounded-full flex items-center justify-center text-white font-bold">
                    {user.email?.charAt(0).toUpperCase()}
                  </div>
                  <div className="text-left">
                    <p className="font-medium text-gray-900">{userProfile.full_name}</p>
                    <p className="text-sm text-gray-600">{user.email}</p>
                  </div>
                </div>
                <p className="text-sm text-blue-700">
                  <strong>Seu nível:</strong> {
                    userProfile.tipo_usuario === 'admin' ? '👑 Administrador' :
                    userProfile.tipo_usuario === 'teacher' || userProfile.tipo_usuario === 'professor' ? '👨‍🏫 Professor' :
                    userProfile.tipo_usuario === 'student' || userProfile.tipo_usuario === 'aluno' ? '👨‍🎓 Estudante' :
                    userProfile.tipo_usuario
                  }
                </p>
              </div>
            )}
            
            {/* Botões de ação */}
            <div className="space-y-3">
              <Button 
                onClick={handleGoToMyArea}
                variant="primary"
                className="w-full"
              >
                🏠 Ir para Minha Área
              </Button>
              
              <Button 
                onClick={handleLogout}
                variant="secondary"
                className="w-full"
              >
                🚪 Fazer Logout
              </Button>
            </div>
            
            {/* Informações adicionais */}
            <div className="mt-6 pt-6 border-t border-gray-200">
              <p className="text-xs text-gray-500">
                Se você acredita que deveria ter acesso a esta área, entre em contato com o administrador do sistema.
              </p>
            </div>
          </div>
        </Card>
      </div>
    </div>
  );
};

export default UnauthorizedPage;