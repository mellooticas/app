# Guia de Migração: AuthContext para Novos Hooks

## 🎯 Objetivo
Migrar o `AuthContext.jsx` atual para usar a nova estrutura com:
- `@tanstack/react-query` para estado
- Hooks customizados (`useAuth.ts`)
- Cliente Supabase centralizado

## 📋 Passo a Passo

### 1. Substituir Imports

#### ❌ Antigo
```jsx
import { createContext, useContext, useState, useEffect } from 'react';
import { supabase } from '../lib/supabase/client';
```

#### ✅ Novo
```jsx
import { createContext, useContext } from 'react';
import { useCurrentUser, useSignIn, useSignOut } from '../hooks';
```

### 2. Remover Estado Local

#### ❌ Antigo
```jsx
const [user, setUser] = useState(null);
const [session, setSession] = useState(null);
const [loading, setLoading] = useState(true);

useEffect(() => {
  // Buscar sessão
  // Listener de auth
}, []);
```

#### ✅ Novo
```jsx
// React Query gerencia tudo automaticamente
const { data: user, isLoading } = useCurrentUser();
const signIn = useSignIn();
const signOut = useSignOut();
```

### 3. Simplificar Funções

#### ❌ Antigo
```jsx
const signIn = async (email, password) => {
  setLoading(true);
  try {
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password
    });
    if (error) throw error;
    setUser(data.user);
    return data;
  } catch (error) {
    console.error(error);
    throw error;
  } finally {
    setLoading(false);
  }
};
```

#### ✅ Novo
```jsx
// Já está implementado no hook!
const signIn = useSignIn();

// Uso:
signIn.mutate({ email, password });
```

### 4. Novo AuthContext Completo

```jsx
// src/contexts/AuthContext.jsx
import { createContext, useContext } from 'react';
import {
  useCurrentUser,
  useCurrentSession,
  useSignIn,
  useSignUp,
  useSignOut,
  useCurrentProfile,
  useIsAuthenticated
} from '../hooks';

const AuthContext = createContext({});

export const AuthProvider = ({ children }) => {
  // Hooks do React Query (já com cache e loading states)
  const { data: user, isLoading: userLoading } = useCurrentUser();
  const { data: session } = useCurrentSession();
  const { data: profile, isLoading: profileLoading } = useCurrentProfile();
  const { isAuthenticated } = useIsAuthenticated();

  // Mutations
  const signIn = useSignIn();
  const signUp = useSignUp();
  const signOut = useSignOut();

  const value = {
    // Estado
    user,
    session,
    profile,
    isAuthenticated,
    loading: userLoading || profileLoading,
    
    // Mutations (já com isLoading, error, etc)
    signIn: signIn.mutate,
    signInAsync: signIn.mutateAsync,
    signInLoading: signIn.isPending,
    signInError: signIn.error,
    
    signUp: signUp.mutate,
    signUpAsync: signUp.mutateAsync,
    signUpLoading: signUp.isPending,
    signUpError: signUp.error,
    
    signOut: signOut.mutate,
    signOutAsync: signOut.mutateAsync,
    signOutLoading: signOut.isPending,
  };

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};
```

### 5. Atualizar App.jsx

```jsx
// src/app.jsx
import { QueryProvider } from './providers/QueryProvider';
import { AuthProvider } from './contexts/AuthContext';

function App() {
  return (
    <QueryProvider>
      <AuthProvider>
        <Routes />
      </AuthProvider>
    </QueryProvider>
  );
}
```

## 🎁 Benefícios da Migração

### Antes ❌
- 100+ linhas de código
- Estado manual (useState)
- Loading states manuais
- Refetch manual
- Cache manual
- Error handling manual
- Cleanup manual (useEffect)

### Depois ✅
- ~50 linhas de código
- Estado automático (React Query)
- Loading states automáticos
- Refetch automático
- Cache inteligente (5min)
- Error handling centralizado
- Cleanup automático
- Invalidação de queries
- Optimistic updates

## 📊 Comparação de Código

### Uso em Componente - Antes
```jsx
function LoginPage() {
  const { user, loading, signIn } = useAuth();
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState(null);

  const handleSubmit = async (data) => {
    setSubmitting(true);
    setError(null);
    try {
      await signIn(data.email, data.password);
      navigate('/dashboard');
    } catch (err) {
      setError(err.message);
    } finally {
      setSubmitting(false);
    }
  };

  if (loading) return <Loading />;
  if (user) return <Navigate to="/dashboard" />;

  return (
    <div>
      {error && <Alert>{error}</Alert>}
      <LoginForm onSubmit={handleSubmit} disabled={submitting} />
    </div>
  );
}
```

### Uso em Componente - Depois
```jsx
function LoginPage() {
  const { user, loading, signIn, signInLoading, signInError } = useAuth();

  const handleSubmit = (data) => {
    signIn(data); // React Query gerencia tudo!
  };

  if (loading) return <Loading />;
  if (user) return <Navigate to="/dashboard" />;

  return (
    <div>
      {signInError && <Alert>{signInError.message}</Alert>}
      <LoginForm onSubmit={handleSubmit} disabled={signInLoading} />
    </div>
  );
}
```

## 🚀 Vantagens Técnicas

1. **Cache Inteligente**
   - User fica em cache por 5 minutos
   - Revalida apenas quando necessário
   - Compartilhado entre componentes

2. **Loading States**
   - `isLoading` - Carregamento inicial
   - `isPending` - Mutation em andamento
   - `isFetching` - Revalidação em background

3. **Error Handling**
   - Erros tipados
   - Retry automático (1x)
   - Reset de erros automático

4. **DevTools**
   - React Query DevTools
   - Visualizar cache
   - Debug de queries
   - Timeline de mutations

## 📝 Checklist de Migração

- [ ] Instalar dependências
- [ ] Criar novo AuthContext com hooks
- [ ] Atualizar App.jsx com QueryProvider
- [ ] Testar login
- [ ] Testar registro
- [ ] Testar logout
- [ ] Verificar persistência de sessão
- [ ] Remover AuthContext antigo
- [ ] Atualizar todos os componentes que usam auth
- [ ] Adicionar React Query DevTools (dev)

## 🎯 Próximos Passos

Após migração do AuthContext:
1. Migrar rotas protegidas
2. Adicionar interceptors para refresh token
3. Implementar loading global
4. Adicionar toast notifications
5. Configurar Sentry para errors

---

**Status**: ⏳ Pendente  
**Complexidade**: Média  
**Tempo Estimado**: 30-60 minutos  
**Breaking Changes**: Sim (API do context muda)
