/**
 * ��� AUTH CONTEXT - Gerenciamento de Autenticação com Supabase
 */

import { createContext, useContext, useEffect, useState, type ReactNode } from 'react'
import { supabase } from '../../lib/supabase/supabaseClient'

export type UserRole = 'aluno' | 'professor' | 'admin' | 'pastor'

export interface User {
  id: string
  nome: string
  email: string
  role: UserRole
  avatar?: string
}

interface ProfileData {
  tipo_usuario: string
  full_name: string | null
  avatar: string | null
}

interface AuthContextType {
  user: User | null
  isAuthenticated: boolean
  isLoading: boolean
  signIn: (email: string, password: string) => Promise<void>
  signOut: () => void
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    const loadSession = async () => {
      try {
        const { data: { session } } = await supabase.auth.getSession()
        
        if (session?.user) {
          const { data: profile } = await supabase
            .from('profiles')
            .select('tipo_usuario, full_name, avatar')
            .eq('id', session.user.id)
            .single<ProfileData>()

          if (profile) {
            setUser({
              id: session.user.id,
              nome: profile.full_name || 'Usuário',
              email: session.user.email || '',
              role: profile.tipo_usuario as UserRole,
              avatar: profile.avatar || undefined,
            })
          }
        }
      } catch (error) {
        console.error('Erro ao carregar sessão:', error)
      } finally {
        setIsLoading(false)
      }
    }

    loadSession()

    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (_event, session) => {
      if (session?.user) {
        const { data: profile } = await supabase
          .from('profiles')
          .select('tipo_usuario, full_name, avatar')
          .eq('id', session.user.id)
          .single<ProfileData>()

        if (profile) {
          setUser({
            id: session.user.id,
            nome: profile.full_name || 'Usuário',
            email: session.user.email || '',
            role: profile.tipo_usuario as UserRole,
            avatar: profile.avatar || undefined,
          })
        }
      } else {
        setUser(null)
      }
    })

    return () => subscription.unsubscribe()
  }, [])

  const signIn = async (email: string, password: string) => {
    console.log('🟢 AuthContext - signIn iniciado', { email })
    setIsLoading(true)
    try {
      console.log('🟢 AuthContext - Chamando supabase.auth.signInWithPassword...')
      
      // Timeout de 5 segundos
      const controller = new AbortController()
      const timeoutId = setTimeout(() => controller.abort(), 5000)

      try {
        const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
          email: email.trim(),
          password,
        })

        clearTimeout(timeoutId)
        console.log('🟢 AuthContext - Resposta recebida:', authData)

        if (authError) {
          console.error('❌ AuthContext - Erro no Supabase Auth:', authError)
          throw new Error(authError.message)
        }
        if (!authData.user) {
          console.error('❌ AuthContext - authData.user é null')
          throw new Error('Falha na autenticação')
        }

        console.log('✅ AuthContext - Autenticação OK! User ID:', authData.user.id)

        // 🎯 PEGAR DADOS DO USER_METADATA (não precisa query na tabela!)
        const tipoUsuario = authData.user.user_metadata?.tipo_usuario || 'aluno'
        const fullName = authData.user.user_metadata?.full_name || authData.user.email?.split('@')[0] || 'Usuário'
        const avatar = authData.user.user_metadata?.avatar || undefined

        console.log('✅ AuthContext - Dados do user_metadata:', { tipoUsuario, fullName, avatar })

        const userData: User = {
          id: authData.user.id,
          nome: fullName,
          email: authData.user.email!,
          role: tipoUsuario as UserRole,
          avatar,
        }

        console.log('✅ AuthContext - setUser com dados:', userData)
        setUser(userData)
        console.log('✅ AuthContext - signIn completo!')
      } catch (abortError) {
        if (abortError instanceof Error && abortError.name === 'AbortError') {
          throw new Error('Timeout: Supabase não respondeu em 5 segundos')
        }
        throw abortError
      }

    } catch (error) {
      console.error('❌ AuthContext - Erro no login:', error)
      throw error
    } finally {
      console.log('🟢 AuthContext - Finalizando (isLoading = false)')
      setIsLoading(false)
    }
  }

  const signOut = async () => {
    await supabase.auth.signOut()
    setUser(null)
  }

  const value: AuthContextType = {
    user,
    isAuthenticated: !!user,
    isLoading,
    signIn,
    signOut,
  }

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export const useAuth = () => {
  const context = useContext(AuthContext)
  if (context === undefined) {
    throw new Error('useAuth deve ser usado dentro de um AuthProvider')
  }
  return context
}
