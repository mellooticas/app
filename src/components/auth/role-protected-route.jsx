import React from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import { useAuth } from '../../contexts/working-auth-context';

/**
 * RoleProtectedRoute - Proteção baseada no tipo de usuário
 * 
 * Regras de acesso:
 * - admin: Acesso total (admin, teachers, students)
 * - teacher: Apenas teachers 
 * - student: Apenas students
 */
export const RoleProtectedRoute = ({ 
  children, 
  allowedRoles = [], 
  redirectTo = '/unauthorized',
  autoRedirect = true 
}) => {
  const { user, userProfile, loading } = useAuth();
  const location = useLocation();

  console.log('🛡️ RoleProtectedRoute:', { 
    userType: userProfile?.tipo_usuario,
    allowedRoles,
    currentPath: location.pathname,
    autoRedirect
  });

  // Mostrar loading enquanto carrega
  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-red-500 mx-auto mb-4"></div>
          <p className="text-gray-600">Verificando permissões...</p>
        </div>
      </div>
    );
  }

  // Se não tem usuário, redirecionar para login
  if (!user) {
    console.log('🚫 Usuário não encontrado, redirecionando para login');
    return <Navigate to="/login" state={{ from: location }} replace />;
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

  // Verificar permissões se especificadas
  if (allowedRoles.length > 0 && userProfile) {
    const userType = userProfile.tipo_usuario;
    
    // Mapeamento de tipos (compatibilidade)
    const typeMapping = {
      'aluno': 'student',
      'professor': 'teacher',
      'admin': 'admin',
      'pastor': 'admin' // Pastores são tratados como admin
    };
    
    const normalizedUserType = typeMapping[userType] || userType;
    
    // Verificar se o tipo do usuário está nas roles permitidas
    const hasAccess = allowedRoles.includes(normalizedUserType) || allowedRoles.includes(userType);
    
    if (!hasAccess) {
      console.log('❌ Acesso negado:', { userType, normalizedUserType, allowedRoles });
      
      if (autoRedirect) {
        // Redirecionar automaticamente para a área correta do usuário
        const correctPath = getCorrectPathForUser(normalizedUserType);
        console.log('🔄 Redirecionando para área correta:', correctPath);
        return <Navigate to={correctPath} replace />;
      } else {
        // Mostrar página de acesso negado
        return <Navigate to={redirectTo} replace />;
      }
    }
  }

  console.log('✅ Acesso autorizado');
  return children;
};

/**
 * Determina o caminho correto baseado no tipo de usuário
 */
const getCorrectPathForUser = (userType) => {
  switch (userType) {
    case 'admin':
      return '/admin';
    case 'teacher':
      return '/teachers';
    case 'student':
      return '/students';
    default:
      return '/dashboard';
  }
};

export default RoleProtectedRoute;