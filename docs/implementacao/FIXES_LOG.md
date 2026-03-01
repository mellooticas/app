# Log de Correcoes - Nipo School

**Ultima atualizacao:** Janeiro 2025
**Total de correcoes documentadas:** 9

Este documento serve como referencia rapida de todos os bugs corrigidos, suas causas e solucoes aplicadas.

---

## Indice

1. [Erro ao Buscar Perfis](#1-erro-ao-buscar-perfis)
2. [AuthProvider Error](#2-authprovider-error)
3. [Erros de Hidratacao (SSR/Client)](#3-erros-de-hidratacao-ssrclient)
4. [Middleware e Build Errors](#4-middleware-e-build-errors)
5. [ChunkLoadError](#5-chunkloaderror)
6. [Permissoes e Acesso](#6-permissoes-e-acesso)
7. [Erros de Console (Final)](#7-erros-de-console-final)
8. [SSR Dynamic Import](#8-ssr-dynamic-import)
9. [Cache e Bloqueio de Usuarios](#9-cache-e-bloqueio-de-usuarios)

---

## 1. Erro ao Buscar Perfis

**Problema:** `Erro ao buscar perfis: {}` - a tabela `profiles` nao existe ou RLS bloqueia acesso.

**Causa:** Tabela `profiles` inexistente ou RLS (Row Level Security) sem politicas adequadas para leitura.

**Solucao:**
- Criado script `sql_scripts/FIX_PROFILES_TABLE.sql` que verifica/cria a tabela, configura RLS e adiciona politicas
- Adicionado tratamento de erros detalhado em `getProfiles()` e `getAdminStats()`
- Pagina `/admin/alunos` exibe mensagem informativa em caso de falha

**Arquivos alterados:**
- `sql_scripts/FIX_PROFILES_TABLE.sql` (novo)
- Servico de profiles (logs e try-catch)
- Pagina de alunos admin (mensagem de erro)

**Codigos de erro comuns:**
| Codigo | Significado | Solucao |
|--------|-------------|---------|
| 42P01 | Tabela nao existe | Executar FIX_PROFILES_TABLE.sql |
| 42501 | Permissao negada (RLS) | Verificar politicas RLS |
| PGRST116 | Nenhum dado encontrado | Criar usuarios/perfis |
| {} (vazio) | Erro de conexao | Verificar env vars |

---

## 2. AuthProvider Error

**Problema:** Arquivo `authprovider-error-fix.md` vazio/sem conteudo documentado.

**Nota:** A correcao do AuthProvider esta coberta pelos itens 5 (ChunkLoadError), 8 (SSR) e 9 (Cache), que abordam os problemas de carregamento e inicializacao do provider de autenticacao.

---

## 3. Erros de Hidratacao (SSR/Client)

**Problema:** `A tree hydrated but some attributes of the server rendered HTML didn't match the client properties`

**Causa:** Extensoes do navegador (ex: Firefox com atributo `foxified=""`) modificam o DOM antes do React carregar. Alem disso, uso de `localStorage` na inicializacao de `useState` causa divergencia entre servidor e cliente.

**Solucao:**
- `suppressHydrationWarning` adicionado em `<html>` e `<body>` no `layout.tsx`
- Filtragem seletiva de `console.error` para warnings de extensoes
- Padrao de inicializacao segura: sempre usar valor padrao no `useState`, carregar `localStorage` via `useEffect` apos mount
- Componente `NoSSR` criado para casos que precisam ser 100% client-side

**Arquivos alterados:**
- `src/app/layout.tsx` (suppressHydrationWarning + filtragem console)
- `DashboardShell.tsx` (inicializacao segura com mounted state)
- `Tabs.tsx` (hook persistente corrigido)
- Componente `NoSSR` (novo)

**Padroes estabelecidos:**
```typescript
// CORRETO: inicializar com valor padrao
const [valor, setValor] = useState(valorPadrao);
const [mounted, setMounted] = useState(false);

useEffect(() => {
  setMounted(true);
  const saved = localStorage.getItem('chave');
  if (saved) setValor(JSON.parse(saved));
}, []);
```

---

## 4. Middleware e Build Errors

**Problema:** Erros de sintaxe no middleware e arquivo `page.tsx` corrompido impedindo build.
```
Return statement is not allowed here
Expression expected
Declaracao ou instrucao esperada
```

**Causa:** Codigo duplicado no middleware.ts e mistura de codigo antigo com novo em page.tsx.

**Solucao:**
- Middleware.ts reescrito: removido codigo duplicado, corrigida estrutura da funcao, simplificada logica de roteamento
- page.tsx recriado limpo com landing page institucional
- Backup do arquivo antigo salvo como page_old.tsx

**Arquivos alterados:**
- `src/middleware.ts` (reescrito)
- `src/app/page.tsx` (recriado)
- `src/app/page_old.tsx` (backup)

---

## 5. ChunkLoadError

**Problema:** `Runtime ChunkLoadError - Loading chunk app/layout failed (timeout)`

**Causa:** Falha no carregamento assincrono de chunks do webpack, agravada por cache corrompido e extensoes de navegador.

**Solucao:**
- **SafeAuthWrapper** criado como Error Boundary inteligente: detecta ChunkLoadError e recarrega automaticamente, com fallback UI durante carregamento
- **Dynamic imports** configurados com `ssr: false` para componentes client-side
- **Webpack otimizado** no next.config: splitChunks, vendor chunks, cache groups
- **Limpeza de cache** sistematica: `.next/`, `node_modules/.cache`, `tsconfig.tsbuildinfo`

**Arquivos alterados:**
- `SafeAuthWrapper` (novo) - Error Boundary
- `next.config.js` (webpack splitChunks)
- `clean-cache.sh` (novo) - script de limpeza

**Fluxo de carregamento:**
```
Layout.tsx -> SafeAuthWrapper (error boundary) -> DynamicAuthProvider -> OptimizedAuthProvider -> Children
```

**Resolucao definitiva:**
```bash
rm -rf .next node_modules/.cache tsconfig.tsbuildinfo
npm install
npm run dev
```

---

## 6. Permissoes e Acesso

**Problema:** `No user ID provided for permission check` e `Usuario sem permissao para visualizar usuarios`

**Causa:** `usePermissions()` era chamado sem passar o `userId`, pois `useUsers` nao obtinha o usuario autenticado antes de verificar permissoes.

**Solucao:**
```typescript
// ANTES (problematico)
const { hasPermission } = usePermissions(); // Sem userId

// DEPOIS (corrigido)
const { user } = useAuth();
const { hasPermission } = usePermissions(user?.id); // Com userId
```

**Arquivos alterados:**
- `src/shared/hooks/users/useUsers.ts` (adicionado useAuth + passagem de userId)
- `src/shared/hooks/auth/usePermissions.ts` (ja aceitava userId, sem alteracao)
- `src/shared/hooks/auth/useAuth.ts` (ja fornecia contexto, sem alteracao)

**Hierarquia de permissoes:**
- admin (nivel 4): acesso total
- professor_admin (nivel 3): acesso amplo
- professor (nivel 2): acesso moderado
- aluno (nivel 1): acesso basico

---

## 7. Erros de Console (Final)

**Problema:** Multiplos erros no console: metadata Next.js 15, erros 406/401 do cache Supabase, ruido de extensoes do navegador.

**Causa:**
- Next.js 15 mudou a API de viewport/themeColor (nao mais no metadata export)
- Tabela `hook_cache` nao existe no Supabase, gerando 406/401
- Extensoes (MetaMask, inpage.js) injetam erros no console

**Solucao:**

1. **Metadata Next.js 15:** Criado `src/app/viewport.ts` com a nova API; removido viewport/themeColor do metadata em layout.tsx
2. **Cache Supabase:** Desabilitado cache via banco (`skipDatabase: true` forcado); mantido cache em memoria e localStorage
3. **Extensoes:** Sistema de supressao multicamadas com padroes para chrome-extension, moz-extension, MetaMask, inpage.js, postMessage

**Arquivos alterados:**
- `src/app/viewport.ts` (novo)
- `src/app/layout.tsx` (metadata corrigido + padroes de supressao expandidos)
- `src/shared/hooks/utils/useCache.ts` (cache database desabilitado)

---

## 8. SSR Dynamic Import

**Problema:** `ssr: false is not allowed with next/dynamic in Server Components`

**Causa:** `DevCacheManager` importado com `dynamic(..., { ssr: false })` diretamente em `layout.tsx`, que e Server Component no Next.js 13+.

**Solucao:** Criado Client Component wrapper `ClientDevTools.tsx` com a diretiva `'use client'`, movendo o dynamic import para dentro dele.

```typescript
// src/app/ClientDevTools.tsx
'use client';
import dynamic from 'next/dynamic';

const DevCacheManager = dynamic(
  () => import('../shared/components/dev/DevCacheManager'),
  { ssr: false } // Permitido em Client Component
);

export default function ClientDevTools() {
  if (process.env.NODE_ENV !== 'development') return null;
  return <DevCacheManager />;
}
```

**Arquivos alterados:**
- `src/app/ClientDevTools.tsx` (novo)
- `src/app/layout.tsx` (import simplificado do wrapper)

**Regra:** `ssr: false` com `next/dynamic` so e permitido em Client Components (marcados com `'use client'`).

---

## 9. Cache e Bloqueio de Usuarios

**Problema:** Cache persistente bloqueia usuarios mesmo apos logout, causando falhas de permissao.

**Causa:** Dados de autenticacao e permissoes ficam em localStorage/sessionStorage/cookies e nao sao limpos adequadamente no logout.

**Solucao:**
- Criado utilitario `src/shared/utils/clearAuthCache.ts` com funcoes: `clearAuthCache()`, `forceLogoutAndClear()`, `debugCacheContents()`
- Adicionado `clearCompleteCache()` ao hook `useAuth`
- Criado componente visual `DevCacheManager` (canto inferior direito em dev) com botoes de limpeza

**Arquivos alterados:**
- `src/shared/utils/clearAuthCache.ts` (novo)
- `src/shared/hooks/auth/useAuth.ts` (clearCompleteCache adicionado)
- `src/shared/components/dev/DevCacheManager.tsx` (novo)

**Itens de cache limpos:**
- localStorage: `nipo_cache_*`, `auth_*`, `user_*`, `permission*`, `supabase*`
- sessionStorage: `nipo_*`, `auth_*`, `supabase*`
- Cookies: `supabase*`, `auth*`, `session*`

**Resolucao rapida via console:**
```javascript
localStorage.clear();
sessionStorage.clear();
location.reload();
```

---

## Resumo de Todos os Arquivos Afetados

| Arquivo | Correcoes Relacionadas |
|---------|----------------------|
| `src/app/layout.tsx` | 3 (hidratacao), 7 (console), 8 (SSR) |
| `src/app/ClientDevTools.tsx` | 8 (SSR) |
| `src/app/viewport.ts` | 7 (console) |
| `src/app/page.tsx` | 4 (middleware/build) |
| `src/middleware.ts` | 4 (middleware/build) |
| `src/shared/hooks/users/useUsers.ts` | 6 (permissoes) |
| `src/shared/hooks/utils/useCache.ts` | 7 (console) |
| `src/shared/hooks/auth/useAuth.ts` | 9 (cache) |
| `src/shared/utils/clearAuthCache.ts` | 9 (cache) |
| `src/shared/components/dev/DevCacheManager.tsx` | 9 (cache) |
| `SafeAuthWrapper` | 5 (ChunkLoadError) |
| `DashboardShell.tsx` | 3 (hidratacao) |
| `Tabs.tsx` | 3 (hidratacao) |
| `next.config.js` | 5 (ChunkLoadError) |
| `sql_scripts/FIX_PROFILES_TABLE.sql` | 1 (perfis) |
| `clean-cache.sh` | 5 (ChunkLoadError) |

---

## Padroes Estabelecidos

1. **Inicializacao de estado:** Sempre usar valor padrao no `useState`; carregar localStorage via `useEffect` apos mount
2. **Server vs Client Components:** `ssr: false` so em Client Components; usar wrappers com `'use client'`
3. **Permissoes:** Sempre passar `userId` do `useAuth()` para `usePermissions()`
4. **Cache:** Limpar cache completo no logout; DevCacheManager disponivel em desenvolvimento
5. **Error Boundaries:** SafeAuthWrapper com auto-reload para ChunkLoadError
6. **Console limpo:** Supressao seletiva de erros de extensoes; viewport separado do metadata
