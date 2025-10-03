import React from 'react';
import { Routes, Route } from 'react-router-dom';

// 🛡️ Componente de proteção para rotas de professores
import { SimpleProtectedRoute } from '../components/auth/working-protected-route';

// 👨‍🏫 Páginas principais dos professores (serão criadas de forma organizada)
const TeacherDashboard = React.lazy(() => import('../features/teachers/pages/Dashboard'));
const TeacherContent = React.lazy(() => import('../features/teachers/pages/Others'));
const TeacherClasses = React.lazy(() => import('../features/teachers/pages/Others'));
const TeacherStudents = React.lazy(() => import('../features/teachers/pages/Others'));
const TeacherReports = React.lazy(() => import('../features/teachers/pages/Others'));
const TeacherProfile = React.lazy(() => import('../features/teachers/pages/Others'));

/**
 * Componente de rota específica para professores
 * Adiciona validação de permissões de professor
 */
const TeacherRoute = ({ children }) => {
  return (
    <SimpleProtectedRoute>
      <React.Suspense fallback={
        <div className="flex items-center justify-center min-h-screen">
          <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-blue-600"></div>
        </div>
      }>
        {children}
      </React.Suspense>
    </SimpleProtectedRoute>
  );
};

/**
 * TeacherRoutes - Sistema de rotas da área dos professores
 * 
 * Estrutura organizada e focada:
 * - Dashboard com visão geral das turmas
 * - Gestão de conteúdos
 * - Gestão de turmas/aulas
 * - Acompanhamento de alunos
 * - Relatórios e estatísticas
 * - Perfil e configurações
 */
const TeacherRoutes = () => {
  return (
    <Routes>
      {/* 📊 Dashboard Principal */}
      <Route 
        index
        element={
          <TeacherRoute>
            <TeacherDashboard />
          </TeacherRoute>
        } 
      />

      {/* 📚 Gestão de Conteúdos */}
      <Route 
        path="content/*" 
        element={
          <TeacherRoute>
            <TeacherContent />
          </TeacherRoute>
        } 
      />

      {/* 🎯 Gestão de Turmas e Aulas */}
      <Route 
        path="classes/*" 
        element={
          <TeacherRoute>
            <TeacherClasses />
          </TeacherRoute>
        } 
      />

      {/* 👥 Acompanhamento de Alunos */}
      <Route 
        path="students/*" 
        element={
          <TeacherRoute>
            <TeacherStudents />
          </TeacherRoute>
        } 
      />

      {/* 📈 Relatórios e Estatísticas */}
      <Route 
        path="reports/*" 
        element={
          <TeacherRoute>
            <TeacherReports />
          </TeacherRoute>
        } 
      />

      {/* 👤 Perfil e Configurações */}
      <Route 
        path="profile/*" 
        element={
          <TeacherRoute>
            <TeacherProfile />
          </TeacherRoute>
        } 
      />

      {/* 404 para rotas de professores não encontradas */}
      <Route 
        path="*" 
        element={
          <div className="min-h-screen flex items-center justify-center">
            <div className="text-center">
              <h1 className="text-4xl font-bold text-gray-900 mb-4">404</h1>
              <p className="text-gray-600">Página não encontrada</p>
            </div>
          </div>
        } 
      />
    </Routes>
  );
};

export default TeacherRoutes;
export { TeacherRoute };