import React from 'react';
import { BrowserRouter } from 'react-router-dom';

// ✅ NOVA ESTRUTURA - Contexts e Router
import { AuthProvider } from './contexts/working-auth-context';
import AppRouterNew from './router/app-router.jsx';

// ✅ NOVA ESTRUTURA - Estilos
import './styles/globals.css';

/**
 * AppNew - Aplicação principal da nova estrutura
 * Migrado de: src/app/App.jsx
 * Nova localização: src_new/app.jsx
 */
function AppNew() {
  return (
    <BrowserRouter future={{
      v7_startTransition: true,
      v7_relativeSplatPath: true
    }}>
      <AuthProvider>
        <AppRouterNew />
      </AuthProvider>
    </BrowserRouter> 
  );
}

export default AppNew;