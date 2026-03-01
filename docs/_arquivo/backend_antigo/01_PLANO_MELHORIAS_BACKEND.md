# 🚀 PLANO DE MELHORIAS BACKEND - BOM → EXTRAORDINÁRIO

**Projeto:** Nipo School  
**Data:** Dezembro 2025  
**Branch:** migration/nextjs-14  
**Objetivo:** Melhorar backend funcional existente

---

## 📋 CONTEXTO

### O que JÁ TEMOS (funcional)
✅ Next.js 14 + Supabase funcionando  
✅ 30 usuários autenticados  
✅ 117 tabelas, 153 RLS policies, 295 índices  
✅ 12 server actions (aluno) + 6 (gamificação)  
✅ Middleware com routing por role  
✅ 3 dashboards (admin/professor/aluno)  
✅ 9 API routes  
✅ Migrações 01-11 aplicadas  

**📄 Leia:** [00_AUDITORIA_APP_ATUAL.md](00_AUDITORIA_APP_ATUAL.md)

### O que VAMOS MELHORAR

| Área | Problema Atual | Solução |
|------|----------------|---------|
| **Validação** | Sem validação de inputs | Zod schemas + middleware |
| **Errors** | Try/catch repetitivo | Error handling padronizado |
| **Cache** | Sem cache de queries | React Query |
| **Performance** | Índices pendentes | Aplicar migrações 12-17 |
| **Observability** | Logs básicos | Logging estruturado |
| **Testing** | 0% cobertura | Unit + Integration tests |
| **Transactions** | Queries isoladas | Transações em operações críticas |

---

## 🗓️ PLANO DE 5 SEMANAS

### SEMANA 1: VALIDAÇÃO E ERROR HANDLING
**Objetivo:** Tornar o backend robusto e previsível

#### 1.1 Schemas Zod para Server Actions
```typescript
// lib/validations/aluno-schemas.ts
import { z } from 'zod'

export const submitPortfolioSchema = z.object({
  titulo: z.string().min(3).max(100),
  descricao: z.string().min(10).max(500),
  tipo_obra: z.enum(['composicao', 'interpretacao', 'improvisacao']),
  arquivo_url: z.string().url(),
  // ... outros campos
})

export const concluirAulaSchema = z.object({
  aulaId: z.string().uuid(),
  tempoEstudo: z.number().int().positive().optional()
})
```

#### 1.2 Helper de Validação
```typescript
// lib/validations/validate-action.ts
import { ZodSchema } from 'zod'

export async function validateAction<T>(
  schema: ZodSchema<T>,
  data: unknown
): Promise<{ success: true; data: T } | { success: false; error: string }> {
  try {
    const validated = await schema.parseAsync(data)
    return { success: true, data: validated }
  } catch (error) {
    if (error instanceof ZodError) {
      return { success: false, error: error.errors[0].message }
    }
    return { success: false, error: 'Validação falhou' }
  }
}
```

#### 1.3 Padronização de Respostas
```typescript
// lib/types/action-result.ts
export type ActionResult<T = any> = 
  | { success: true; data: T; message?: string }
  | { success: false; error: string; code?: string }

// lib/utils/action-response.ts
export function successResponse<T>(data: T, message?: string): ActionResult<T> {
  return { success: true, data, message }
}

export function errorResponse(error: string, code?: string): ActionResult {
  return { success: false, error, code }
}
```

#### 1.4 Aplicar em Server Actions Existentes
```typescript
// app/actions/aluno-actions.ts (ATUALIZADO)
import { validateAction } from '@/lib/validations/validate-action'
import { submitPortfolioSchema } from '@/lib/validations/aluno-schemas'
import { successResponse, errorResponse } from '@/lib/utils/action-response'

export async function submitPortfolio(formData: FormData): Promise<ActionResult> {
  try {
    // 1. Validação
    const rawData = Object.fromEntries(formData)
    const validation = await validateAction(submitPortfolioSchema, rawData)
    if (!validation.success) {
      return errorResponse(validation.error, 'VALIDATION_ERROR')
    }

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      return errorResponse('Usuário não autenticado', 'UNAUTHORIZED')
    }

    // 3. Business logic
    const { data, error } = await supabase
      .from('portfolios')
      .insert({
        aluno_id: user.id,
        ...validation.data
      })
      .select()
      .single()

    if (error) {
      console.error('Erro ao criar portfólio:', error)
      return errorResponse('Erro ao salvar portfólio', 'DATABASE_ERROR')
    }

    // 4. Success
    return successResponse(data, 'Portfólio enviado com sucesso!')

  } catch (error) {
    console.error('Erro inesperado:', error)
    return errorResponse('Erro inesperado', 'INTERNAL_ERROR')
  }
}
```

**Entregáveis Semana 1:**
- [ ] `lib/validations/` com 5 arquivos de schemas
- [ ] `lib/types/action-result.ts` (tipo padronizado)
- [ ] `lib/utils/action-response.ts` (helpers)
- [ ] Atualizar 18 server actions (12 aluno + 6 gamificação)
- [ ] Criar `docs/backend/VALIDACAO_PADRONIZADA.md`

---

### SEMANA 2: CACHE E PERFORMANCE
**Objetivo:** Reduzir latência e carga no banco

#### 2.1 Setup React Query
```bash
npm install @tanstack/react-query @tanstack/react-query-devtools
```

```typescript
// app/providers/QueryProvider.tsx
'use client'

import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { ReactQueryDevtools } from '@tanstack/react-query-devtools'
import { useState } from 'react'

export function QueryProvider({ children }: { children: React.ReactNode }) {
  const [queryClient] = useState(() => new QueryClient({
    defaultOptions: {
      queries: {
        staleTime: 1000 * 60, // 1 minuto
        gcTime: 1000 * 60 * 5, // 5 minutos
        retry: 1,
        refetchOnWindowFocus: false,
      },
    },
  }))

  return (
    <QueryClientProvider client={queryClient}>
      {children}
      <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  )
}
```

#### 2.2 Custom Hooks para Queries
```typescript
// lib/hooks/use-aulas.ts
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { getTodasAulas, marcarAulaConcluida } from '@/lib/supabase/queries/aulas'

export function useAulas() {
  return useQuery({
    queryKey: ['aulas'],
    queryFn: getTodasAulas,
  })
}

export function useConcluirAula() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: ({ aulaId, tempoEstudo }: { aulaId: string; tempoEstudo?: number }) => 
      marcarAulaConcluida(aulaId, tempoEstudo),
    onSuccess: () => {
      // Invalidar cache de aulas e progresso
      queryClient.invalidateQueries({ queryKey: ['aulas'] })
      queryClient.invalidateQueries({ queryKey: ['progresso'] })
    },
  })
}
```

#### 2.3 Optimistic Updates
```typescript
// lib/hooks/use-portfolio.ts
export function useUpdatePortfolio() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: ({ id, data }: { id: string; data: PortfolioUpdate }) =>
      updatePortfolioItem(id, data),
    
    // Optimistic update
    onMutate: async ({ id, data }) => {
      await queryClient.cancelQueries({ queryKey: ['portfolio', id] })
      
      const previous = queryClient.getQueryData(['portfolio', id])
      
      queryClient.setQueryData(['portfolio', id], (old: Portfolio) => ({
        ...old,
        ...data
      }))
      
      return { previous }
    },
    
    // Rollback em erro
    onError: (err, variables, context) => {
      if (context?.previous) {
        queryClient.setQueryData(['portfolio', variables.id], context.previous)
      }
    },
    
    // Revalidar em sucesso
    onSettled: (data, error, variables) => {
      queryClient.invalidateQueries({ queryKey: ['portfolio', variables.id] })
    },
  })
}
```

#### 2.4 Aplicar Índices Pendentes (Migrações 12-17)
```sql
-- docs/migrations/12_adicionar_indices_parte1.sql
-- Índices para queries mais comuns

-- Perfis por tipo de usuário (usado no middleware)
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_profiles_tipo_usuario 
ON profiles(tipo_usuario) WHERE tipo_usuario IS NOT NULL;

-- Aulas por data programada (dashboard admin)
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_aulas_data_programada 
ON aulas(data_programada) WHERE data_programada IS NOT NULL;

-- Portfolio por aluno
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_portfolios_aluno_id 
ON portfolios(aluno_id) WHERE deleted_at IS NULL;

-- Achievements por usuário
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_user_achievements_user_id 
ON user_achievements(user_id) WHERE is_unlocked = true;

-- Pontos por categoria
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_user_points_log_category 
ON user_points_log(user_id, category, created_at DESC);
```

**Entregáveis Semana 2:**
- [ ] React Query configurado
- [ ] 10 custom hooks criados (`use-aulas`, `use-portfolio`, etc.)
- [ ] Optimistic updates em 5 mutations críticas
- [ ] Migrações 12-17 aplicadas (índices)
- [ ] `docs/backend/PERFORMANCE_OPTIMIZATION.md`

---

### SEMANA 3: OBSERVABILITY E LOGGING
**Objetivo:** Entender o que acontece em produção

#### 3.1 Logger Estruturado
```typescript
// lib/logger/index.ts
export enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3,
}

interface LogContext {
  userId?: string
  action?: string
  [key: string]: any
}

class Logger {
  private level: LogLevel

  constructor() {
    this.level = process.env.NODE_ENV === 'production' 
      ? LogLevel.INFO 
      : LogLevel.DEBUG
  }

  private log(level: LogLevel, message: string, context?: LogContext) {
    if (level < this.level) return

    const entry = {
      timestamp: new Date().toISOString(),
      level: LogLevel[level],
      message,
      ...context,
    }

    // Em produção, enviar para serviço de logging (Sentry, Logtail, etc.)
    if (process.env.NODE_ENV === 'production') {
      // TODO: Integrar com serviço externo
      console.log(JSON.stringify(entry))
    } else {
      console.log(`[${entry.level}]`, message, context)
    }
  }

  debug(message: string, context?: LogContext) {
    this.log(LogLevel.DEBUG, message, context)
  }

  info(message: string, context?: LogContext) {
    this.log(LogLevel.INFO, message, context)
  }

  warn(message: string, context?: LogContext) {
    this.log(LogLevel.WARN, message, context)
  }

  error(message: string, error?: Error, context?: LogContext) {
    this.log(LogLevel.ERROR, message, {
      ...context,
      error: error?.message,
      stack: error?.stack,
    })
  }
}

export const logger = new Logger()
```

#### 3.2 Aplicar Logger em Server Actions
```typescript
// app/actions/aluno-actions.ts
import { logger } from '@/lib/logger'

export async function submitPortfolio(formData: FormData): Promise<ActionResult> {
  const startTime = Date.now()
  
  try {
    logger.info('Iniciando submissão de portfólio', { action: 'submitPortfolio' })

    // ... validação e lógica ...

    const duration = Date.now() - startTime
    logger.info('Portfólio submetido com sucesso', {
      action: 'submitPortfolio',
      userId: user.id,
      duration,
    })

    return successResponse(data)

  } catch (error) {
    logger.error('Erro ao submeter portfólio', error as Error, {
      action: 'submitPortfolio',
      duration: Date.now() - startTime,
    })
    return errorResponse('Erro inesperado')
  }
}
```

#### 3.3 Middleware de Monitoramento
```typescript
// middleware.ts (ADICIONAR)
import { logger } from '@/lib/logger'

export async function middleware(request: NextRequest) {
  const startTime = Date.now()
  const path = request.nextUrl.pathname

  // ... lógica existente ...

  const duration = Date.now() - startTime
  logger.info('Request processado', {
    path,
    duration,
    hasSession: !!session,
    role: profile?.tipo_usuario,
  })

  return response
}
```

**Entregáveis Semana 3:**
- [ ] Logger estruturado implementado
- [ ] 18 server actions com logging
- [ ] Middleware com métricas de requisições
- [ ] `docs/backend/OBSERVABILITY.md`

---

### SEMANA 4: TESTES E QUALIDADE
**Objetivo:** Garantir confiabilidade do código

#### 4.1 Setup de Testes
```bash
npm install -D vitest @testing-library/react @testing-library/jest-dom
npm install -D @vitejs/plugin-react jsdom
```

```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'
import path from 'path'

export default defineConfig({
  plugins: [react()],
  test: {
    environment: 'jsdom',
    globals: true,
    setupFiles: './tests/setup.ts',
  },
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './'),
    },
  },
})
```

#### 4.2 Testes de Validação
```typescript
// tests/validations/aluno-schemas.test.ts
import { describe, it, expect } from 'vitest'
import { submitPortfolioSchema } from '@/lib/validations/aluno-schemas'

describe('submitPortfolioSchema', () => {
  it('aceita dados válidos', () => {
    const valid = {
      titulo: 'Minha Composição',
      descricao: 'Uma bela peça de piano',
      tipo_obra: 'composicao',
      arquivo_url: 'https://example.com/audio.mp3',
    }

    expect(() => submitPortfolioSchema.parse(valid)).not.toThrow()
  })

  it('rejeita título muito curto', () => {
    const invalid = {
      titulo: 'AB',
      descricao: 'Descrição válida aqui',
      tipo_obra: 'composicao',
      arquivo_url: 'https://example.com/audio.mp3',
    }

    expect(() => submitPortfolioSchema.parse(invalid)).toThrow()
  })

  it('rejeita tipo_obra inválido', () => {
    const invalid = {
      titulo: 'Título válido',
      descricao: 'Descrição válida',
      tipo_obra: 'tipo_invalido',
      arquivo_url: 'https://example.com/audio.mp3',
    }

    expect(() => submitPortfolioSchema.parse(invalid)).toThrow()
  })
})
```

#### 4.3 Testes de Server Actions
```typescript
// tests/actions/aluno-actions.test.ts
import { describe, it, expect, vi, beforeEach } from 'vitest'
import { submitPortfolio } from '@/app/actions/aluno-actions'

// Mock do Supabase
vi.mock('@/lib/supabase/server', () => ({
  createClient: () => ({
    auth: {
      getUser: vi.fn(() => ({
        data: { user: { id: 'test-user-id' } },
        error: null,
      })),
    },
    from: vi.fn(() => ({
      insert: vi.fn(() => ({
        select: vi.fn(() => ({
          single: vi.fn(() => ({
            data: { id: 'portfolio-123' },
            error: null,
          })),
        })),
      })),
    })),
  }),
}))

describe('submitPortfolio', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  it('retorna sucesso com dados válidos', async () => {
    const formData = new FormData()
    formData.append('titulo', 'Minha Composição')
    formData.append('descricao', 'Descrição válida')
    formData.append('tipo_obra', 'composicao')
    formData.append('arquivo_url', 'https://example.com/audio.mp3')

    const result = await submitPortfolio(formData)

    expect(result.success).toBe(true)
    expect(result.data).toHaveProperty('id')
  })

  it('retorna erro com dados inválidos', async () => {
    const formData = new FormData()
    formData.append('titulo', 'AB') // muito curto

    const result = await submitPortfolio(formData)

    expect(result.success).toBe(false)
    expect(result.error).toBeDefined()
  })
})
```

#### 4.4 Testes de Hooks
```typescript
// tests/hooks/use-aulas.test.tsx
import { describe, it, expect, vi } from 'vitest'
import { renderHook, waitFor } from '@testing-library/react'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { useAulas } from '@/lib/hooks/use-aulas'

const createWrapper = () => {
  const queryClient = new QueryClient({
    defaultOptions: { queries: { retry: false } },
  })
  return ({ children }: { children: React.ReactNode }) => (
    <QueryClientProvider client={queryClient}>
      {children}
    </QueryClientProvider>
  )
}

describe('useAulas', () => {
  it('carrega aulas com sucesso', async () => {
    const { result } = renderHook(() => useAulas(), {
      wrapper: createWrapper(),
    })

    await waitFor(() => expect(result.current.isSuccess).toBe(true))
    
    expect(result.current.data).toBeDefined()
    expect(Array.isArray(result.current.data)).toBe(true)
  })
})
```

**Entregáveis Semana 4:**
- [ ] Vitest configurado
- [ ] 15 testes de validação
- [ ] 10 testes de server actions
- [ ] 5 testes de hooks
- [ ] Coverage report > 60%
- [ ] `docs/backend/TESTING_STRATEGY.md`

---

### SEMANA 5: TRANSACTIONS E INTEGRAÇÃO
**Objetivo:** Garantir consistência de dados

#### 5.1 Helper de Transactions
```typescript
// lib/database/transaction.ts
import { createClient } from '@/lib/supabase/server'

export async function executeTransaction<T>(
  operations: (client: SupabaseClient) => Promise<T>
): Promise<{ success: true; data: T } | { success: false; error: string }> {
  const supabase = await createClient()

  try {
    // Supabase não tem transação nativa, então usamos RPC
    const { data, error } = await supabase.rpc('execute_transaction', {
      operations: operations.toString(),
    })

    if (error) throw error

    return { success: true, data: data as T }
  } catch (error) {
    console.error('Transaction failed:', error)
    return { success: false, error: 'Transação falhou' }
  }
}
```

#### 5.2 Aplicar em Operações Críticas
```typescript
// app/actions/aluno-actions.ts
export async function concluirAula(aulaId: string, tempoEstudo?: number) {
  try {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return errorResponse('Não autenticado', 'UNAUTHORIZED')

    // Operação com múltiplas writes - usar transaction
    const { data, error } = await supabase.rpc('concluir_aula_transaction', {
      p_user_id: user.id,
      p_aula_id: aulaId,
      p_tempo_estudo: tempoEstudo || 0,
    })

    if (error) {
      logger.error('Erro ao concluir aula', error, { userId: user.id, aulaId })
      return errorResponse('Erro ao concluir aula', 'DATABASE_ERROR')
    }

    return successResponse(data, 'Aula concluída! Você ganhou pontos.')
  } catch (error) {
    logger.error('Erro inesperado ao concluir aula', error as Error)
    return errorResponse('Erro inesperado', 'INTERNAL_ERROR')
  }
}
```

```sql
-- database/functions/concluir_aula_transaction.sql
CREATE OR REPLACE FUNCTION concluir_aula_transaction(
  p_user_id UUID,
  p_aula_id UUID,
  p_tempo_estudo INTEGER
)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_progresso_id UUID;
  v_pontos INTEGER := 50;
BEGIN
  -- 1. Marcar aula como concluída
  INSERT INTO aula_progresso (aluno_id, aula_id, concluida, tempo_estudo_minutos)
  VALUES (p_user_id, p_aula_id, true, p_tempo_estudo)
  ON CONFLICT (aluno_id, aula_id) 
  DO UPDATE SET 
    concluida = true,
    tempo_estudo_minutos = EXCLUDED.tempo_estudo_minutos,
    updated_at = now()
  RETURNING id INTO v_progresso_id;

  -- 2. Adicionar pontos
  INSERT INTO user_points_log (user_id, points, category, description)
  VALUES (p_user_id, v_pontos, 'aula_concluida', 'Aula concluída com sucesso');

  -- 3. Atualizar total de pontos do perfil
  UPDATE profiles
  SET total_points = total_points + v_pontos
  WHERE id = p_user_id;

  -- 4. Verificar achievements
  -- (lógica de achievements aqui)

  RETURN json_build_object(
    'progresso_id', v_progresso_id,
    'pontos_ganhos', v_pontos
  );
EXCEPTION
  WHEN OTHERS THEN
    RAISE EXCEPTION 'Erro na transação: %', SQLERRM;
END;
$$;
```

#### 5.3 Testes de Integração
```typescript
// tests/integration/concluir-aula.test.ts
import { describe, it, expect, beforeAll, afterAll } from 'vitest'
import { createClient } from '@supabase/supabase-js'
import { concluirAula } from '@/app/actions/aluno-actions'

describe('Concluir Aula (Integration)', () => {
  let supabase: SupabaseClient
  let testUserId: string
  let testAulaId: string

  beforeAll(async () => {
    // Setup: criar usuário e aula de teste
    supabase = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.SUPABASE_SERVICE_ROLE_KEY!
    )

    const { data: user } = await supabase.auth.admin.createUser({
      email: 'test@example.com',
      password: 'test123',
    })
    testUserId = user!.user!.id

    const { data: aula } = await supabase
      .from('aulas')
      .insert({ titulo: 'Aula Teste' })
      .select()
      .single()
    testAulaId = aula!.id
  })

  afterAll(async () => {
    // Cleanup: deletar dados de teste
    await supabase.auth.admin.deleteUser(testUserId)
    await supabase.from('aulas').delete().eq('id', testAulaId)
  })

  it('deve concluir aula e adicionar pontos', async () => {
    // 1. Pegar pontos antes
    const { data: before } = await supabase
      .from('profiles')
      .select('total_points')
      .eq('id', testUserId)
      .single()

    const pontosBefore = before!.total_points || 0

    // 2. Concluir aula
    const result = await concluirAula(testAulaId, 30)

    // 3. Verificar resultado
    expect(result.success).toBe(true)

    // 4. Verificar pontos depois
    const { data: after } = await supabase
      .from('profiles')
      .select('total_points')
      .eq('id', testUserId)
      .single()

    expect(after!.total_points).toBe(pontosBefore + 50)

    // 5. Verificar progresso
    const { data: progresso } = await supabase
      .from('aula_progresso')
      .select('*')
      .eq('aluno_id', testUserId)
      .eq('aula_id', testAulaId)
      .single()

    expect(progresso!.concluida).toBe(true)
    expect(progresso!.tempo_estudo_minutos).toBe(30)
  })
})
```

**Entregáveis Semana 5:**
- [ ] 5 database functions para transactions
- [ ] Aplicar transactions em 8 operações críticas
- [ ] 10 testes de integração
- [ ] `docs/backend/TRANSACTIONS_GUIDE.md`

---

## 📊 RESUMO DAS ENTREGAS

| Semana | Área | Arquivos Novos | Arquivos Atualizados | Testes |
|--------|------|----------------|----------------------|--------|
| 1 | Validação | 8 | 18 | 0 |
| 2 | Performance | 15 | 10 | 0 |
| 3 | Observability | 3 | 20 | 0 |
| 4 | Testing | 30 | 0 | 30 |
| 5 | Transactions | 8 | 10 | 10 |
| **Total** | **-** | **64** | **58** | **40** |

---

## 🎯 MÉTRICAS DE SUCESSO

### Antes (BOM)
- ❌ Validação de inputs: 0%
- ❌ Error handling padronizado: 0%
- ❌ Cache de queries: 0%
- ❌ Testes: 0%
- ❌ Logging estruturado: 0%
- ⚠️ Performance: Média (sem índices otimizados)

### Depois (EXTRAORDINÁRIO)
- ✅ Validação de inputs: 100%
- ✅ Error handling padronizado: 100%
- ✅ Cache de queries: 100%
- ✅ Testes: >60% coverage
- ✅ Logging estruturado: 100%
- ✅ Performance: Ótima (com 40+ índices novos)

---

## 📝 PRÓXIMOS PASSOS

1. **Ler auditoria:** [00_AUDITORIA_APP_ATUAL.md](00_AUDITORIA_APP_ATUAL.md)
2. **Começar Semana 1:** Criar esquemas Zod
3. **Acompanhar progresso:** Atualizar este documento semanalmente

---

**Status:** 📋 Planejado e pronto para execução  
**Complexidade:** Moderada (melhorias incrementais)  
**Risco:** Baixo (não quebra código existente)
