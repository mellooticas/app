# Nova Estrutura Backend - Supabase Pure

## 🎯 Arquitetura Implementada

### Fase 1: Supabase Pure ✅
Backend 100% no Supabase - Zero servidores custom

## 📁 Estrutura de Arquivos

```
src/
├── lib/
│   └── supabase/
│       ├── client.ts                    # Cliente Supabase centralizado
│       ├── database.types.ts            # TypeScript types do schema
│       └── queries/
│           ├── profiles.ts              # Queries de perfis (7 funções)
│           ├── achievements.ts          # Queries de conquistas (4 funções)
│           ├── alpha-desafios.ts        # Queries de desafios (6 funções)
│           ├── portfolios.ts            # Queries de portfólio (7 funções)
│           └── index.ts                 # Barrel exports
│
├── hooks/
│   ├── useAuth.ts                       # 8 hooks de autenticação
│   ├── useAchievements.ts               # 6 hooks de gamificação
│   ├── useAlphaDesafios.ts              # 8 hooks de desafios
│   ├── usePortfolio.ts                  # 8 hooks de portfólio
│   └── index.ts                         # Barrel exports
│
├── providers/
│   └── QueryProvider.tsx                # Provider do React Query
│
└── utils/
    ├── error-handler.ts                 # Sistema de erros centralizado
    └── supabase-helpers.ts              # Utilitários genéricos
```

## 🔑 Componentes Principais

### 1. Cliente Supabase (`client.ts`)
```typescript
// Features:
✅ Auto-refresh de tokens JWT
✅ Persistência de sessão
✅ Helper functions: getCurrentUser(), getCurrentSession(), signOut()
✅ Configuração centralizada
```

### 2. Queries por Domínio

#### **Profiles** (7 funções)
- `getProfileById()` - Buscar por ID
- `getProfileByEmail()` - Buscar por email
- `getCurrentProfile()` - Perfil do usuário logado
- `updateProfile()` - Atualizar perfil
- `createProfile()` - Criar novo perfil
- `deleteProfile()` - Deletar perfil
- `listProfilesByType()` - Listar por tipo (aluno/professor/admin)

#### **Achievements** (4 funções)
- `getUserAchievements()` - Listar conquistas do usuário
- `addAchievement()` - Adicionar nova conquista
- `getUserTotalPoints()` - Calcular total de pontos
- `getAchievementsByType()` - Filtrar por tipo (badge/trophy/certificate)

#### **Alpha Desafios** (6 funções)
- `getActiveDesafios()` - Listar desafios ativos
- `getDesafioById()` - Buscar desafio específico
- `getDesafiosByNivel()` - Filtrar por nível
- `createDesafio()` - Criar novo desafio
- `updateDesafio()` - Atualizar desafio
- `deactivateDesafio()` - Desativar desafio

#### **Portfolios** (7 funções)
- `getUserPortfolios()` - Listar portfólios do usuário
- `getPortfolioById()` - Buscar portfólio específico
- `createPortfolio()` - Criar novo item
- `updatePortfolio()` - Atualizar portfólio
- `deletePortfolio()` - Deletar portfólio
- `getPublicPortfolios()` - Feed público
- `getPortfoliosByType()` - Filtrar por tipo

### 3. React Query Hooks

#### **useAuth** (8 hooks)
```typescript
useCurrentUser()          // Usuário autenticado
useCurrentSession()       // Sessão atual
useSignIn()              // Login
useSignUp()              // Registro
useSignOut()             // Logout
useCurrentProfile()      // Perfil do usuário
useUpdateProfile()       // Atualizar perfil
useIsAuthenticated()     // Verificar autenticação
```

#### **useAchievements** (6 hooks)
```typescript
useUserAchievements()     // Conquistas do usuário
useUserPoints()           // Total de pontos
useAchievementsByType()   // Filtrar por tipo
useAddAchievement()       // Adicionar conquista
useHasAchievement()       // Verificar conquista específica
useGamificationStats()    // Estatísticas gerais
```

#### **useAlphaDesafios** (8 hooks)
```typescript
useActiveDesafios()       // Desafios ativos
useDesafio()             // Desafio específico
useDesafiosByNivel()     // Filtrar por nível
useCreateDesafio()       // Criar desafio (Admin)
useUpdateDesafio()       // Atualizar desafio
useDeactivateDesafio()   // Desativar desafio
useDesafiosByDifficulty() // Agrupar por dificuldade
useDesafiosStats()       // Estatísticas
```

#### **usePortfolio** (8 hooks)
```typescript
useUserPortfolios()      // Portfólios do usuário
usePortfolio()          // Portfólio específico
usePublicPortfolios()   // Feed público
usePortfoliosByType()   // Filtrar por tipo
useCreatePortfolio()    // Criar portfólio
useUpdatePortfolio()    // Atualizar (com optimistic update)
useDeletePortfolio()    // Deletar portfólio
usePortfolioStats()     // Estatísticas
```

### 4. Utilitários

#### **Error Handler** (`error-handler.ts`)
```typescript
// Features:
✅ Classe AppError customizada
✅ handleError() - Handler global
✅ withErrorHandling() - Wrapper para async functions
✅ showErrorToast() - Integração com toast
✅ CommonErrors - Erros pré-definidos
```

#### **Supabase Helpers** (`supabase-helpers.ts`)
```typescript
// Features:
✅ formatSupabaseError() - Formatar erros
✅ uploadFile() - Upload para Storage
✅ deleteFile() - Deletar arquivo
✅ listFiles() - Listar arquivos
✅ getPaginationRange() - Paginação
```

## 🚀 Como Usar

### 1. Importar Hooks
```typescript
import { useCurrentUser, useSignIn, useSignOut } from '@/hooks';
```

### 2. Usar no Componente
```typescript
function MyComponent() {
  const { data: user, isLoading } = useCurrentUser();
  const signIn = useSignIn();

  if (isLoading) return <Loading />;
  if (!user) return <LoginForm onSubmit={signIn.mutate} />;

  return <Dashboard user={user} />;
}
```

### 3. Mutations com React Query
```typescript
const addAchievement = useAddAchievement();

const handleComplete = () => {
  addAchievement.mutate({
    achievement_type: 'badge_first_lesson',
    points: 100,
    metadata: { lesson_id: '123' }
  });
};
```

## ⚡ Performance

### Caching Estratégico
- **Auth queries**: 5 minutos de stale time
- **Data queries**: 2-5 minutos de stale time
- **Garbage collection**: 5 minutos
- **Retry**: 1 tentativa (queries) / 0 (mutations)

### Optimistic Updates
- `useUpdatePortfolio()` usa optimistic updates
- Revert automático em caso de erro
- UI instantânea para melhor UX

## 🔐 Segurança

### Row Level Security (RLS)
- 100% das queries passam pelo RLS do Supabase
- Zero lógica de segurança no frontend
- Políticas definidas no banco de dados

### Autenticação
- JWT automático via Supabase Auth
- Auto-refresh de tokens
- Persistência de sessão no localStorage

## 📦 Dependências Instaladas

```json
{
  "@tanstack/react-query": "5.17.0",
  "react-hook-form": "7.49.0",
  "zod": "3.22.4"
}
```

## 🔄 Próximos Passos

### Fase 1.5: Realtime ⏳
```typescript
// TODO: Adicionar subscriptions
useRealtimeAchievements()
useRealtimePortfolios()
useRealtimeDesafios()
```

### Fase 2: Edge Functions ⏳
```typescript
// TODO: Functions serverless
- Cálculo de rankings
- Processamento de vídeos
- Notificações
```

## 📝 Exemplos de Uso

### Exemplo 1: Login
```typescript
function LoginPage() {
  const signIn = useSignIn();

  const handleSubmit = async (data) => {
    signIn.mutate(data, {
      onSuccess: () => navigate('/dashboard'),
      onError: (error) => toast.error(error.message)
    });
  };

  return <LoginForm onSubmit={handleSubmit} />;
}
```

### Exemplo 2: Listar Desafios
```typescript
function DesafiosPage() {
  const { data: desafios, isLoading } = useActiveDesafios();
  const { data: stats } = useDesafiosStats();

  if (isLoading) return <Skeleton />;

  return (
    <div>
      <Stats {...stats} />
      <DesafiosList desafios={desafios} />
    </div>
  );
}
```

### Exemplo 3: Criar Portfólio
```typescript
function NewPortfolio() {
  const createPortfolio = useCreatePortfolio();

  const handleSubmit = (data) => {
    createPortfolio.mutate(data, {
      onSuccess: (portfolio) => {
        toast.success('Portfólio criado!');
        navigate(`/portfolio/${portfolio.id}`);
      }
    });
  };

  return <PortfolioForm onSubmit={handleSubmit} />;
}
```

## ✅ Status

- [x] Cliente Supabase
- [x] Database Types
- [x] Queries (4 domínios)
- [x] React Query Hooks (30 hooks)
- [x] Error Handler
- [x] Supabase Helpers
- [x] QueryProvider
- [x] Dependências instaladas
- [ ] Migrar AuthContext (próximo)
- [ ] Testes
- [ ] Realtime subscriptions

## 📊 Métricas

- **Total de Queries**: 24 funções
- **Total de Hooks**: 30 hooks customizados
- **Linhas de Código**: ~2000 LOC
- **Tempo de Setup**: <30 minutos
- **Target Performance**: <500ms por request

---

**Última atualização**: Janeiro 2025  
**Arquitetura**: Supabase Pure (Fase 1)  
**Status**: ✅ Completo e Funcional
