import React, {
  createContext,
  useState,
  useEffect,
  useContext,
  useRef,
  ReactNode
} from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { User, AuthChangeEvent, Session } from '@supabase/supabase-js';
import { supabase } from '../lib/supabase/supabaseClient';
import { getSmartRedirect } from '../services/redirectService';

// ========================================
// TIPOS
// ========================================
interface UserProfile {
  id: string;
  email: string;
  full_name: string;
  nome: string;
  dob: string | null;
  instrument: string;
  tipo_usuario: 'aluno' | 'professor' | 'admin' | 'pastor';
  user_level: string;
  total_points: number;
  current_streak: number;
  best_streak: number;
  lessons_completed: number;
  modules_completed: number;
  theme_preference: string;
  notification_enabled: boolean;
  sound_enabled: boolean;
  has_voted: boolean;
  voted_logo: string | null;
  avatar_url: string | null;
  bio: string | null;
  phone: string | null;
  city: string | null;
  state: string | null;
  church_name: string | null;
  joined_at: string;
  last_active: string;
}

interface SignupData {
  fullName: string;
  dob: string;
  instrument: string;
  tipo_usuario: 'aluno' | 'professor' | 'admin' | 'pastor';
}

interface AuthContextType {
  user: User | null;
  userProfile: UserProfile | null;
  loading: boolean;
  login: (email: string, password: string) => Promise<any>;
  signup: (email: string, password: string, userData: SignupData) => Promise<User>;
  logout: () => Promise<void>;
  recordVote: (logoId: string) => Promise<UserProfile>;
  fetchUserProfile: (userId: string, useCache?: boolean) => Promise<UserProfile | null>;
  updateProfile: (profileData: Partial<UserProfile>) => Promise<UserProfile>;
}

const AuthContext = createContext<AuthContextType | null>(null);

interface AuthProviderProps {
  children: ReactNode;
}

export const AuthProvider: React.FC<AuthProviderProps> = ({ children }) => {
  const navigate = useNavigate();
  const location = useLocation();

  // States
  const [user, setUser] = useState<User | null>(null);
  const [userProfile, setUserProfile] = useState<UserProfile | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [mounted, setMounted] = useState<boolean>(false);

  // Controle
  const isRedirecting = useRef<boolean>(false);
  const profileCache = useRef<{ profile: UserProfile | null; timestamp: number }>({
    profile: null,
    timestamp: 0
  });

  useEffect(() => {
    setMounted(true);
  }, []);

  // ========================================
  // REDIRECIONAMENTO
  // ========================================
  const redirectByVote = (profile: UserProfile | null, force: boolean = false): void => {
    if (isRedirecting.current && !force) {
      console.log('🚫 Redirecionamento já em curso, ignorando...');
      return;
    }
    if (!profile) {
      console.log('🚫 Sem perfil, não redirecionando...');
      return;
    }
    
    // Não redirecionar se já estiver na rota correta
    const userType = profile.tipo_usuario;
    const dashboardPath = userType === 'admin' ? '/admin' : 
                         userType === 'professor' || userType === 'pastor' ? '/teachers' : 
                         '/students';
    
    if (location.pathname.startsWith(dashboardPath) && !force) {
      console.log('✅ Usuário já está na área correta:', location.pathname);
      return;
    }
    
    console.log('� Iniciando redirecionamento para:', profile.tipo_usuario, 'na rota:', location.pathname);
    
    isRedirecting.current = true;
    try {
      const redirectResult = getSmartRedirect(profile, location.pathname, { force });
      console.log('🎯 Resultado do redirecionamento:', redirectResult);
      
      if (redirectResult.shouldRedirect) {
        console.log('➡️ Redirecionando para:', redirectResult.targetPath, 'Motivo:', redirectResult.reason);
        navigate(redirectResult.targetPath, { replace: true });
      } else {
        console.log('✅ Usuário já está na rota correta:', redirectResult.targetPath);
      }
    } catch (error) {
      console.error('❌ Erro no redirecionamento:', error);
    } finally {
      setTimeout(() => {
        isRedirecting.current = false;
        console.log('🔓 Redirecionamento liberado');
      }, 1000); // Aumentei o tempo para evitar conflitos
    }
  };

  // ========================================
  // BUSCAR PERFIL
  // ========================================
  const fetchUserProfile = async (
    userId: string,
    useCache: boolean = true
  ): Promise<UserProfile | null> => {
    if (!userId) return null;

    const cacheAge = Date.now() - profileCache.current.timestamp;
    const cacheValid = cacheAge < 5 * 60 * 1000; // 5 minutos

    if (useCache && profileCache.current.profile && cacheValid) {
      return profileCache.current.profile;
    }

    try {
      const { data, error } = await supabase
        .from('profiles')
        .select('*')
        .eq('id', userId)
        .single();

      if (error) {
        console.error('❌ Erro ao buscar perfil:', error);
        return null;
      }

      const profile = data as UserProfile;
      profileCache.current = { profile, timestamp: Date.now() };
      return profile;
    } catch (error) {
      console.error('❌ Erro inesperado ao buscar perfil:', error);
      return null;
    }
  };

  // ========================================
  // ATUALIZAR PERFIL
  // ========================================
  const updateProfile = async (profileData: Partial<UserProfile>): Promise<UserProfile> => {
    if (!user) throw new Error('Usuário não autenticado');

    try {
      const { data, error } = await supabase
        .from('profiles')
        .update(profileData)
        .eq('id', user.id)
        .select()
        .single();

      if (error) throw error;

      const updatedProfile = data as UserProfile;
      setUserProfile(updatedProfile);
      profileCache.current = { profile: updatedProfile, timestamp: Date.now() };
      
      return updatedProfile;
    } catch (error) {
      console.error('❌ Erro ao atualizar perfil:', error);
      throw error;
    }
  };

  // ========================================
  // LOGIN
  // ========================================
  const login = async (email: string, password: string): Promise<any> => {
    setLoading(true);
    try {
      console.log('🔐 Iniciando login para:', email);

      const { data, error } = await supabase.auth.signInWithPassword({
        email: email.trim(),
        password: password
      });

      if (error) {
        console.error('❌ Erro no login:', error);
        if (error.message === 'Email not confirmed') {
          return {
            success: false,
            needsEmailVerification: true,
            email: email,
            error: 'Por favor, confirme seu email antes de fazer login.'
          };
        }
        return { success: false, error: error.message };
      }

      if (data.user) {
        console.log('✅ Login bem-sucedido:', data.user.email);
        setUser(data.user);

        const profile = await fetchUserProfile(data.user.id, false);
        if (profile) {
          setUserProfile(profile);
          setTimeout(() => redirectByVote(profile), 100);
        }

        return { success: true, user: data.user, profile };
      }

      return { success: false, error: 'Erro desconhecido no login' };
    } catch (error) {
      console.error('❌ Erro inesperado no login:', error);
      return { success: false, error: 'Erro de conexão' };
    } finally {
      setLoading(false);
    }
  };

  // ========================================
  // SIGNUP
  // ========================================
  const signup = async (
    email: string,
    password: string,
    userData: SignupData
  ): Promise<User> => {
    try {
      console.log('📝 Iniciando cadastro para:', email);

      const { data, error } = await supabase.auth.signUp({
        email: email.trim(),
        password: password,
        options: {
          data: {
            full_name: userData.fullName,
            nome: userData.fullName,
            dob: userData.dob,
            instrument: userData.instrument,
            tipo_usuario: userData.tipo_usuario
          }
        }
      });

      if (error) {
        console.error('❌ Erro no cadastro:', error);
        throw error;
      }

      if (!data.user) {
        throw new Error('Erro ao criar usuário');
      }

      console.log('✅ Cadastro realizado:', data.user.email);
      return data.user;
    } catch (error) {
      console.error('❌ Erro no signup:', error);
      throw error;
    }
  };

  // ========================================
  // LOGOUT
  // ========================================
  const logout = async (): Promise<void> => {
    try {
      console.log('🚪 Fazendo logout...');
      
      const { error } = await supabase.auth.signOut();
      if (error) throw error;

      setUser(null);
      setUserProfile(null);
      profileCache.current = { profile: null, timestamp: 0 };
      
      navigate('/login', { replace: true });
      console.log('✅ Logout realizado com sucesso');
    } catch (error) {
      console.error('❌ Erro no logout:', error);
    }
  };

  // ========================================
  // VOTAR EM LOGO
  // ========================================
  const recordVote = async (logoId: string): Promise<UserProfile> => {
    if (!user || !userProfile) {
      throw new Error('Usuário não autenticado');
    }

    try {
      const updatedProfile = await updateProfile({
        has_voted: true,
        voted_logo: logoId
      });

      return updatedProfile;
    } catch (error) {
      console.error('❌ Erro ao registrar voto:', error);
      throw error;
    }
  };

  // ========================================
  // AUTH STATE LISTENER
  // ========================================
  useEffect(() => {
    if (!mounted) return;

    console.log('🔄 Configurando listener de autenticação...');

    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (event: AuthChangeEvent, session: Session | null) => {
        console.log('🔔 Auth state changed:', event, session?.user?.email);

        if (session?.user) {
          setUser(session.user);
          const profile = await fetchUserProfile(session.user.id, false);
          if (profile) {
            setUserProfile(profile);
            
            // Diferentes comportamentos baseados no evento
            if (event === 'SIGNED_IN') {
              // Login real - redireciona
              console.log('👤 Login real detectado - redirecionando...');
              setTimeout(() => redirectByVote(profile, true), 200);
            } else if (event === 'INITIAL_SESSION') {
              // Sessão inicial - só redireciona se estiver em página pública
              console.log('🔄 Sessão inicial - verificando se precisa redirecionar...');
              if (location.pathname === '/login' || location.pathname === '/register' || location.pathname === '/') {
                console.log('📍 Em página pública, redirecionando...');
                setTimeout(() => redirectByVote(profile, false), 200);
              } else {
                console.log('� Já em área restrita, mantendo posição');
              }
            }
          }
        } else if (event === 'SIGNED_OUT') {
          setUser(null);
          setUserProfile(null);
          profileCache.current = { profile: null, timestamp: 0 };
        }

        setLoading(false);
      }
    );

    return () => {
      console.log('🔄 Removendo listener de autenticação...');
      subscription.unsubscribe();
    };
  }, [mounted]); // Removido navigate da dependência

  // ========================================
  // INITIAL SESSION CHECK
  // ========================================
  useEffect(() => {
    if (!mounted) return;

    const checkInitialSession = async () => {
      try {
        console.log('🔍 Verificando sessão inicial...');
        
        const { data: { session }, error } = await supabase.auth.getSession();
        
        if (error) {
          console.error('❌ Erro ao verificar sessão:', error);
          setLoading(false);
          return;
        }

        if (session?.user) {
          setUser(session.user);
          
          // Buscar perfil com retry (como no sistema antigo)
          let profile = null;
          let attempts = 0;
          const maxAttempts = 3;
          
          while (!profile && attempts < maxAttempts) {
            attempts++;
            profile = await fetchUserProfile(session.user.id, false);
            if (!profile && attempts < maxAttempts) {
              await new Promise(resolve => setTimeout(resolve, 1000));
            }
          }
          
          if (profile) {
            setUserProfile(profile);
            
            // Só redireciona se estiver em páginas públicas (igual sistema antigo)
            if (location.pathname === '/' || location.pathname === '/login' || location.pathname === '/register') {
              console.log('📍 Em página pública, redirecionando...');
              setTimeout(() => redirectByVote(profile, true), 200);
            } else {
              console.log('📍 Já em área restrita, mantendo posição');
            }
          }
        } else {
          console.log('ℹ️ Nenhuma sessão ativa');
        }
      } catch (error) {
        console.error('❌ Erro ao verificar sessão inicial:', error);
      } finally {
        setLoading(false);
      }
    };

    checkInitialSession();
  }, [mounted]);

  // ========================================
  // CONTEXT VALUE
  // ========================================
  const contextValue: AuthContextType = {
    user,
    userProfile,
    loading,
    login,
    signup,
    logout,
    recordVote,
    fetchUserProfile,
    updateProfile
  };

  return (
    <AuthContext.Provider value={contextValue}>
      {children}
    </AuthContext.Provider>
  );
};

// ========================================
// HOOK
// ========================================
export const useAuth = (): AuthContextType => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth deve ser usado dentro do AuthProvider');
  }
  return context;
};