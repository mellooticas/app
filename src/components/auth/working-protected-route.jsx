import React from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import { useAuth } from '../../contexts/working-auth-context';

/**
 * SimpleProtectedRoute - Proteção de rota simplificada
 * Funciona com o working-auth-context existente
 */
export const SimpleProtectedRoute = ({ children, redirectTo = '/login' }) => {
  const { user, userProfile, loading } = useAuth();
  const location = useLocation();

  console.log('🛡️ SimpleProtectedRoute Check:', { 
    user: user?.email, 
    userProfile: userProfile?.tipo_usuario, 
    loading,
    currentPath: location.pathname
  });

  // Mostrar loading enquanto carrega
  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-red-500 mx-auto mb-4"></div>
          <p className="text-gray-600">Carregando...</p>
        </div>
      </div>
    );
  }

  // Se não tem usuário, redirecionar para login
  if (!user) {
    console.log('🚫 Usuário não encontrado, redirecionando para login');
    return <Navigate to={redirectTo} state={{ from: location }} replace />;
  }

  // Se tem usuário mas ainda não carregou o perfil, mostrar loading
  if (user && !userProfile) {
    console.log('⏳ Usuário encontrado mas perfil ainda carregando');
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mx-auto mb-4"></div>
          <p className="text-gray-600">Carregando perfil...</p>
        </div>
      </div>
    );
  }

  console.log('✅ Acesso autorizado');
  // Usuário logado com perfil - permitir acesso
  return children;
};

export default SimpleProtectedRoute;