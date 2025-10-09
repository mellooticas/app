/**
 * 🎯 APP - Componente Principal da Aplicação
 * 
 * Configuração com:
 * - RouterProvider do React Router v6
 * - Error Boundaries
 * - Providers globais (Auth, Query, etc)
 * - Estilos globais
 */

import { RouterProvider } from 'react-router-dom'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { router } from './router'
import { AuthProvider } from '../features/auth/AuthContext'

// Estilos globais
import '../styles/globals.css'

// Criar QueryClient
const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 5 * 60 * 1000, // 5 minutos
      retry: 1,
      refetchOnWindowFocus: false,
    },
  },
})

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <AuthProvider>
        <RouterProvider router={router} />
      </AuthProvider>
    </QueryClientProvider>
  )
}

export default App
