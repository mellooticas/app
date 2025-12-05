import { jsx as _jsx } from "react/jsx-runtime";
import { createContext, useContext, useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase/client';
// Context
const AuthContext = createContext(undefined);
// Provider
export function AuthProvider({ children }) {
    const [user, setUser] = useState(null);
    const [profile, setProfile] = useState(null);
    const [isLoading, setIsLoading] = useState(true);
    // Carregar sessão existente ao iniciar
    useEffect(() => {
        loadSession();
        // Listener para mudanças de autenticação
        const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
            if (event === 'SIGNED_IN' && session) {
                setUserFromSupabaseUser(session.user);
            }
            else if (event === 'SIGNED_OUT') {
                setUser(null);
            }
            setIsLoading(false);
        });
        return () => subscription.unsubscribe();
    }, []);
    // Carregar sessão do localStorage
    async function loadSession() {
        try {
            const { data: { session } } = await supabase.auth.getSession();
            if (session?.user) {
                setUserFromSupabaseUser(session.user);
            }
        }
        catch (error) {
            console.error('Erro ao carregar sessão:', error);
        }
        finally {
            setIsLoading(false);
        }
    }
    // Converter Supabase User para nosso User
    function setUserFromSupabaseUser(supabaseUser) {
        const userData = {
            id: supabaseUser.id,
            nome: supabaseUser.user_metadata?.full_name || supabaseUser.email?.split('@')[0] || 'Usuário',
            email: supabaseUser.email,
            role: supabaseUser.user_metadata?.tipo_usuario || 'aluno',
            avatar: supabaseUser.user_metadata?.avatar,
        };
        // 🔍 DEBUG: Ver role detectado
        console.log('👤 Usuário autenticado:', {
            email: userData.email,
            role: userData.role,
            tipo_usuario_metadata: supabaseUser.user_metadata?.tipo_usuario
        });
        setUser(userData);
    }
    // Login
    async function signIn(email, password) {
        setIsLoading(true);
        try {
            // 1. Autenticar no Supabase
            const { data, error } = await supabase.auth.signInWithPassword({
                email: email.trim(),
                password,
            });
            if (error)
                throw error;
            if (!data.user)
                throw new Error('Falha na autenticação');
            // 2. Buscar dados corretos da tabela profiles
            const { data: profile, error: profileError } = await supabase
                .from('profiles')
                .select('tipo_usuario, full_name')
                .eq('id', data.user.id)
                .single();
            if (profileError) {
                console.error('Erro ao buscar profile:', profileError);
                throw new Error('Erro ao carregar dados do usuário');
            }
            if (!profile) {
                throw new Error('Perfil não encontrado');
            }
            // 3. Criar objeto User com dados corretos da tabela
            const userData = {
                id: data.user.id,
                nome: profile.full_name || data.user.email?.split('@')[0] || 'Usuário',
                email: data.user.email,
                role: profile.tipo_usuario,
                avatar: undefined, // Avatar não existe na tabela profiles
            };
            console.log('👤 Usuário autenticado (profiles):', {
                email: userData.email,
                role: userData.role,
                nome: userData.nome
            });
            setUser(userData);
        }
        catch (error) {
            console.error('Erro no login:', error);
            throw error;
        }
        finally {
            setIsLoading(false);
        }
    }
    // Registro
    async function signUp(email, password, userData) {
        setIsLoading(true);
        try {
            const { data, error } = await supabase.auth.signUp({
                email,
                password,
            });
            if (error)
                throw error;
            // Se necessário, criar perfil adicional
            if (data.user && userData) {
                const profileData = {
                    id: data.user.id,
                    email: data.user.email,
                    full_name: userData.nome || userData.full_name,
                    tipo_usuario: userData.tipo_usuario || 'aluno',
                    ...userData
                };
                const { error: profileError } = await supabase
                    .from('profiles')
                    .insert(profileData);
                if (profileError) {
                    console.error('Erro ao criar perfil:', profileError);
                    // Não vamos lançar erro aqui para não bloquear o registro
                }
            }
            console.log('✅ Usuário registrado:', data.user?.email);
        }
        catch (error) {
            console.error('Erro no registro:', error);
            throw error;
        }
        finally {
            setIsLoading(false);
        }
    }
    // Logout
    async function signOut() {
        setIsLoading(true);
        try {
            await supabase.auth.signOut();
            setUser(null);
        }
        catch (error) {
            console.error('Erro no logout:', error);
            throw error;
        }
        finally {
            setIsLoading(false);
        }
    }
    const value = {
        user,
        profile,
        isAuthenticated: !!user,
        isLoading,
        loading: isLoading, // Alias para compatibilidade
        signIn,
        signUp,
        signOut,
    };
    return _jsx(AuthContext.Provider, { value: value, children: children });
}
// Hook
export function useAuth() {
    const context = useContext(AuthContext);
    if (context === undefined) {
        throw new Error('useAuth deve ser usado dentro de um AuthProvider');
    }
    return context;
}
