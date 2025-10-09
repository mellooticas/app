import { Navigate, useLocation } from 'react-router-dom'
import { useAuth } from './AuthContext'
import type { TipoUsuario } from '@/types'

interface ProtectedRouteProps {
  children: React.ReactNode
  allowedRoles?: TipoUsuario[]
  requiredRole?: TipoUsuario
}

export function ProtectedRoute({ children, allowedRoles, requiredRole }: ProtectedRouteProps) {
  const { user, profile, loading } = useAuth()
  const location = useLocation()

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
          <p className="mt-4 text-gray-600">Carregando...</p>
        </div>
      </div>
    )
  }

  if (!user || !profile) {
    return <Navigate to="/login" state={{ from: location }} replace />
  }

  // Verificar role único
  if (requiredRole && profile.tipo_usuario !== requiredRole) {
    return <Navigate to="/acesso-negado" replace />
  }

  // Verificar múltiplos roles
  if (allowedRoles && allowedRoles.length > 0) {
    const userRole = profile.tipo_usuario as TipoUsuario
    if (!allowedRoles.includes(userRole)) {
      return <Navigate to="/acesso-negado" replace />
    }
  }

  return <>{children}</>
}
