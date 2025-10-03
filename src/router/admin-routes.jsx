import React from 'react';
import { Routes, Route } from 'react-router-dom';

// 🛡️ Componente de proteção para rotas administrativas
import { SimpleProtectedRoute } from '../components/auth/working-protected-route';

// 📋 Páginas administrativas simplificadas (serão criadas)
const AdminDashboard = React.lazy(() => import('../features/admin/pages/Dashboard'));
const AdminStudents = React.lazy(() => import('../features/admin/pages/Students'));
const AdminTeachers = React.lazy(() => import('../features/admin/pages/Teachers'));
const AdminInstruments = React.lazy(() => import('../features/admin/pages/Instruments'));
const AdminCurriculum = React.lazy(() => import('../features/admin/pages/Curriculum'));
const AdminSettings = React.lazy(() => import('../features/admin/pages/Settings'));

/**
 * Componente de rota específica para administradores
 * Adiciona validação de permissões administrativas
 */
const AdminRoute = ({ children }) => {
  return (
    <SimpleProtectedRoute>
      <React.Suspense fallback={
        <div className="flex items-center justify-center min-h-screen">
          <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-primary-600"></div>
        </div>
      }>
        {children}
      </React.Suspense>
    </SimpleProtectedRoute>
  );
};

/**
 * AdminRoutes - Sistema de rotas da área administrativa
 * 
 * Estrutura organizada:
 * - Dashboard principal
 * - Gestão de usuários (alunos/professores)
 * - Gestão de conteúdo (instrumentos/curriculum)
 * - Configurações do sistema
 */
const AdminRoutes = () => {
  return (
    <Routes>
      {/* 📊 Dashboard Principal */}
      <Route 
        index
        element={
          <AdminRoute>
            <AdminDashboard />
          </AdminRoute>
        } 
      />

      {/* 👥 Gestão de Usuários */}
      <Route 
        path="students/*" 
        element={
          <AdminRoute>
            <AdminStudents />
          </AdminRoute>
        } 
      />

      <Route 
        path="teachers/*" 
        element={
          <AdminRoute>
            <AdminTeachers />
          </AdminRoute>
        } 
      />

      {/* 🎼 Gestão de Conteúdo */}
      <Route 
        path="instruments/*" 
        element={
          <AdminRoute>
            <AdminInstruments />
          </AdminRoute>
        } 
      />

      <Route 
        path="curriculum/*" 
        element={
          <AdminRoute>
            <AdminCurriculum />
          </AdminRoute>
        } 
      />

      {/* ⚙️ Configurações */}
      <Route 
        path="settings/*" 
        element={
          <AdminRoute>
            <AdminSettings />
          </AdminRoute>
        } 
      />

      {/* 404 para rotas admin não encontradas */}
      <Route 
        path="*" 
        element={
          <div className="min-h-screen flex items-center justify-center">
            <div className="text-center">
              <h1 className="text-4xl font-bold text-gray-900 mb-4">404</h1>
              <p className="text-gray-600">Página administrativa não encontrada</p>
            </div>
          </div>
        } 
      />
    </Routes>
  );
};

export default AdminRoutes;
export { AdminRoute };