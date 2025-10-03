import React from 'react';
import { Routes, Route } from 'react-router-dom';

// 🛡️ Componente de proteção para rotas de estudantes
import { SimpleProtectedRoute } from '../components/auth/working-protected-route';

// 📚 Páginas principais dos estudantes (serão criadas de forma organizada)
const StudentDashboard = React.lazy(() => import('../features/students/pages/Dashboard'));
const StudentLibrary = React.lazy(() => import('../features/students/pages/Library'));
const StudentInstruments = React.lazy(() => import('../features/students/pages/Instruments'));
const StudentProgress = React.lazy(() => import('../features/students/pages/Progress'));
const StudentStudyCenter = React.lazy(() => import('../features/students/pages/StudyCenter'));
const StudentAchievements = React.lazy(() => import('../features/students/pages/Achievements'));
const StudentSupport = React.lazy(() => import('../features/students/pages/Support'));

// 🎌 Páginas Orientais Extraordinárias
const CentroEstudosOrientalExtraordinario = React.lazy(() => import('../features/students/pages/CentroEstudosOrientalExtraordinario'));
const InstrumentoOrientalDetalhes = React.lazy(() => import('../features/students/pages/InstrumentoOrientalDetalhes'));

/**
 * Componente de rota específica para estudantes
 * Adiciona validação de permissões de estudante
 */
const StudentRoute = ({ children }) => {
  return (
    <SimpleProtectedRoute>
      <React.Suspense fallback={
        <div className="flex items-center justify-center min-h-screen">
          <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-green-600"></div>
        </div>
      }>
        {children}
      </React.Suspense>
    </SimpleProtectedRoute>
  );
};

/**
 * StudentRoutes - Sistema de rotas da área dos estudantes
 * 
 * Estrutura organizada e simplificada:
 * - Dashboard principal com visão geral
 * - Biblioteca (instrumentos, repertório, vídeos)
 * - Centro de estudos
 * - Progresso e conquistas
 * - Sistema de suporte/dúvidas
 */
const StudentRoutes = () => {
  return (
    <Routes>
      {/* 📊 Dashboard Principal */}
      <Route 
        index
        element={
          <StudentRoute>
            <StudentDashboard />
          </StudentRoute>
        } 
      />

      {/* 📚 Biblioteca de Conteúdos */}
      <Route 
        path="library/*" 
        element={
          <StudentRoute>
            <StudentLibrary />
          </StudentRoute>
        } 
      />

      {/* 🎼 Instrumentos */}
      <Route 
        path="instruments/*" 
        element={
          <StudentRoute>
            <StudentInstruments />
          </StudentRoute>
        } 
      />

      {/* 📖 Centro de Estudos */}
      <Route 
        path="study/*" 
        element={
          <StudentRoute>
            <StudentStudyCenter />
          </StudentRoute>
        } 
      />

      {/* 🎌 Centro de Estudos Oriental Extraordinário */}
      <Route 
        path="study-center" 
        element={
          <StudentRoute>
            <CentroEstudosOrientalExtraordinario />
          </StudentRoute>
        } 
      />

      {/* 🎻 Detalhes do Instrumento Oriental */}
      <Route 
        path="study-center/instrument/:instrumentId" 
        element={
          <StudentRoute>
            <InstrumentoOrientalDetalhes />
          </StudentRoute>
        } 
      />

      {/* 📈 Progresso */}
      <Route 
        path="progress/*" 
        element={
          <StudentRoute>
            <StudentProgress />
          </StudentRoute>
        } 
      />

      {/* 🏆 Conquistas */}
      <Route 
        path="achievements/*" 
        element={
          <StudentRoute>
            <StudentAchievements />
          </StudentRoute>
        } 
      />

      {/* 🆘 Suporte e Dúvidas */}
      <Route 
        path="support/*" 
        element={
          <StudentRoute>
            <StudentSupport />
          </StudentRoute>
        } 
      />

      {/* 404 para rotas de estudantes não encontradas */}
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

export default StudentRoutes;
export { StudentRoute };