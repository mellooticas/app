# 🚀 PLANO BACKEND EXTRAORDINÁRIO - NIPO SCHOOL

**Data:** 15/12/2025  
**Status:** 🟢 Iniciando Fase de Excelência  
**Objetivo:** Elevar o backend de BOM para EXTRAORDINÁRIO

---

## 📊 SITUAÇÃO ATUAL

### ✅ O que já temos (BOM)
- ✅ RLS habilitado em 37 tabelas críticas
- ✅ ~60 políticas de segurança implementadas
- ✅ Validações de dados (emails, números)
- ✅ Timestamps e auditoria em 31 tabelas
- ✅ Soft delete em 5 tabelas principais
- ✅ Middleware básico de autenticação
- ✅ Algumas server actions (`aluno-actions.ts`, `gamification.ts`)
- ✅ Queries básicas para admin e história

### 🎯 O que falta para EXTRAORDINÁRIO

#### 1. **Camada de Serviços Completa** (Service Layer)
```
lib/
  services/
    admin/
      user-service.ts          # Gestão de usuários
      turma-service.ts         # Gestão de turmas
      aula-service.ts          # Gestão de aulas
      relatorio-service.ts     # Relatórios e analytics
    professor/
      aula-service.ts          # CRUD de aulas
      avaliacao-service.ts     # Avaliações e notas
      presenca-service.ts      # Controle de presença
      material-service.ts      # Materiais pedagógicos
      instrumento-service.ts   # Gestão de instrumentos
    aluno/
      aula-service.ts          # Visualizar aulas
      progresso-service.ts     # Progresso do aluno
      gamificacao-service.ts   # Badges, XP, ranking
      forum-service.ts         # Perguntas e respostas
      portfolio-service.ts     # Portfolio do aluno
    shared/
      auth-service.ts          # Autenticação centralizada
      profile-service.ts       # Perfil do usuário
      notificacao-service.ts   # Sistema de notificações
```

#### 2. **Server Actions Organizadas por Contexto**
```
app/
  actions/
    admin/
      usuarios.ts              # Gestão de usuários
      turmas.ts                # Gestão de turmas
      relatorios.ts            # Relatórios administrativos
    professor/
      aulas.ts                 # CRUD de aulas
      avaliacoes.ts            # Lançamento de notas
      presencas.ts             # Registro de presença
      materiais.ts             # Upload de materiais
    aluno/
      forum.ts                 # Perguntas e respostas
      portfolio.ts             # Evidências de aprendizado
      gamificacao.ts           # Já existe, melhorar
    shared/
      auth.ts                  # Login, logout, registro
      profile.ts               # Atualizar perfil
      notificacoes.ts          # Marcar como lida
```

#### 3. **Hooks Personalizados por Funcionalidade**
```
hooks/
  admin/
    use-usuarios.ts
    use-turmas.ts
    use-relatorios.ts
  professor/
    use-minhas-aulas.ts
    use-avaliacoes.ts
    use-presencas.ts
    use-materiais.ts
  aluno/
    use-minhas-aulas.ts
    use-progresso.ts
    use-gamificacao.ts
    use-forum.ts
    use-portfolio.ts
  shared/
    use-auth.ts
    use-profile.ts
    use-notificacoes.ts
```

#### 4. **API Routes para Integrações Externas**
```
app/
  api/
    admin/
      analytics/route.ts       # Estatísticas gerais
      export/route.ts          # Exportação de dados
    professor/
      relatorio-turma/route.ts # Relatório de turma
    public/
      instrumentos/route.ts    # Catálogo público
    webhooks/
      supabase/route.ts        # Webhooks do Supabase
```

#### 5. **Context Providers para Estado Global**
```
app/
  providers/
    auth-provider.tsx          # Contexto de autenticação
    role-provider.tsx          # Contexto de permissões
    notification-provider.tsx  # Notificações em tempo real
    gamification-provider.tsx  # Estado de gamificação
```

#### 6. **Validação e Tipos TypeScript**
```
lib/
  validations/
    admin/
      usuario-schema.ts        # Zod schemas para usuários
      turma-schema.ts          # Zod schemas para turmas
    professor/
      aula-schema.ts           # Zod schemas para aulas
      avaliacao-schema.ts      # Zod schemas para avaliações
    aluno/
      forum-schema.ts          # Zod schemas para forum
      portfolio-schema.ts      # Zod schemas para portfolio
  types/
    admin.ts                   # Types específicos de admin
    professor.ts               # Types específicos de professor
    aluno.ts                   # Types específicos de aluno
    shared.ts                  # Types compartilhados
```

#### 7. **Tratamento de Erros Centralizado**
```
lib/
  errors/
    app-error.ts               # Classe de erro customizada
    error-handler.ts           # Handler centralizado
    error-messages.ts          # Mensagens de erro i18n
```

#### 8. **Testes Automatizados**
```
__tests__/
  services/
    admin/
      user-service.test.ts
    professor/
      aula-service.test.ts
    aluno/
      gamificacao-service.test.ts
  actions/
    admin/
      usuarios.test.ts
    professor/
      aulas.test.ts
```

---

## 🎯 FUNCIONALIDADES POR NÍVEL

### 👑 ADMIN

**Gestão de Usuários**
- ✅ Listar todos os usuários (alunos, professores, admins)
- ✅ Criar novos usuários
- ✅ Editar perfis
- ✅ Desativar/reativar usuários
- ✅ Resetar senhas
- ✅ Atribuir roles e permissões

**Gestão de Turmas**
- ✅ Criar turmas
- ✅ Editar turmas
- ✅ Adicionar/remover alunos
- ✅ Atribuir professores
- ✅ Arquivar turmas antigas

**Gestão de Aulas**
- ✅ Visualizar todas as aulas
- ✅ Aprovar/reprovar conteúdos
- ✅ Editar qualquer aula

**Relatórios e Analytics**
- ✅ Dashboard geral do sistema
- ✅ Estatísticas de uso
- ✅ Relatórios de frequência
- ✅ Relatórios de desempenho
- ✅ Exportar dados (CSV, PDF)

**Configurações**
- ✅ Configurar sistema de gamificação
- ✅ Gerenciar badges e conquistas
- ✅ Configurar níveis e XP
- ✅ Gerenciar instrumentos
- ✅ Configurar materiais pedagógicos

---

### 👨‍🏫 PROFESSOR

**Minhas Aulas**
- ✅ Criar planejamento de aula
- ✅ Editar minhas aulas
- ✅ Adicionar materiais (PDF, vídeo, áudio)
- ✅ Definir atividades
- ✅ Criar checklists
- ✅ Vincular desafios Alpha

**Avaliações**
- ✅ Criar critérios de avaliação
- ✅ Lançar notas dos alunos
- ✅ Editar notas lançadas
- ✅ Visualizar histórico de notas
- ✅ Gerar relatório de desempenho

**Presença**
- ✅ Registrar presença por aula
- ✅ Justificar faltas
- ✅ Visualizar frequência da turma
- ✅ Exportar lista de presença

**Materiais Pedagógicos**
- ✅ Upload de arquivos
- ✅ Organizar por categoria
- ✅ Compartilhar com turmas
- ✅ Visualizar downloads

**Instrumentos**
- ✅ Emprestar instrumentos
- ✅ Registrar devolução
- ✅ Reportar manutenção
- ✅ Visualizar histórico

**Turmas**
- ✅ Visualizar minhas turmas
- ✅ Lista de alunos
- ✅ Progresso individual
- ✅ Comunicação com alunos

---

### 🎓 ALUNO

**Minhas Aulas**
- ✅ Visualizar aulas matriculadas
- ✅ Baixar materiais
- ✅ Ver atividades
- ✅ Marcar aula como concluída

**Meu Progresso**
- ✅ Visualizar notas
- ✅ Histórico de frequência
- ✅ Progresso por disciplina
- ✅ Certificados conquistados

**Gamificação**
- ✅ Visualizar minhas badges
- ✅ Ver ranking da turma
- ✅ Acompanhar XP
- ✅ Desafios disponíveis
- ✅ Submeter desafios
- ✅ Celebrações de conquistas

**Fórum**
- ✅ Fazer perguntas
- ✅ Responder perguntas
- ✅ Dar likes
- ✅ Marcar melhor resposta

**Portfolio**
- ✅ Adicionar evidências
- ✅ Upload de fotos/vídeos
- ✅ Organizar por categoria
- ✅ Compartilhar com professor

**Instrumentos**
- ✅ Ver catálogo
- ✅ Solicitar empréstimo
- ✅ Meus instrumentos emprestados
- ✅ Histórico de empréstimos

---

## 📝 ESTRUTURA DE DOCUMENTAÇÃO

Cada funcionalidade terá sua documentação em:
```
docs/backend/
  01_PLANO_BACKEND_EXTRAORDINARIO.md        # Este arquivo
  02_ARQUITETURA_BACKEND.md                 # Arquitetura geral
  03_GUIA_RLS_POLICIES.md                   # Como RLS funciona
  
  admin/
    01_GESTAO_USUARIOS.md
    02_GESTAO_TURMAS.md
    03_GESTAO_AULAS.md
    04_RELATORIOS_ANALYTICS.md
    05_CONFIGURACOES.md
  
  professor/
    01_MINHAS_AULAS.md
    02_AVALIACOES.md
    03_PRESENCA.md
    04_MATERIAIS.md
    05_INSTRUMENTOS.md
    06_TURMAS.md
  
  aluno/
    01_MINHAS_AULAS.md
    02_MEU_PROGRESSO.md
    03_GAMIFICACAO.md
    04_FORUM.md
    05_PORTFOLIO.md
    06_INSTRUMENTOS.md
  
  shared/
    01_AUTENTICACAO.md
    02_PERFIL.md
    03_NOTIFICACOES.md
    04_TRATAMENTO_ERROS.md
  
  api/
    01_PADRAO_API_ROUTES.md
    02_WEBHOOKS.md
    03_INTEGRACAO_EXTERNA.md
```

---

## 🔄 FLUXO DE DESENVOLVIMENTO

### Fase 1: Fundação (Semana 1)
**Prioridade: CRÍTICA**

1. **Criar estrutura base de pastas**
   - [ ] `lib/services/`
   - [ ] `lib/validations/`
   - [ ] `lib/types/`
   - [ ] `lib/errors/`
   - [ ] `hooks/`
   - [ ] Reorganizar `app/actions/`

2. **Implementar camada de erro**
   - [ ] `AppError` class
   - [ ] Error handler centralizado
   - [ ] Mensagens de erro padronizadas

3. **Criar tipos e schemas base**
   - [ ] Types compartilhados
   - [ ] Zod schemas básicos
   - [ ] Atualizar `database.types.ts`

4. **Documentar arquitetura**
   - [ ] Criar `02_ARQUITETURA_BACKEND.md`
   - [ ] Documentar padrões de código
   - [ ] Fluxo de dados

### Fase 2: Admin (Semana 2)
**Prioridade: ALTA**

1. **Gestão de Usuários**
   - [ ] Service layer completo
   - [ ] Server actions
   - [ ] Hooks personalizados
   - [ ] Validações Zod
   - [ ] Testes unitários
   - [ ] Documentação

2. **Gestão de Turmas**
   - [ ] Service layer completo
   - [ ] Server actions
   - [ ] Hooks personalizados
   - [ ] Validações Zod
   - [ ] Testes unitários
   - [ ] Documentação

3. **Relatórios e Analytics**
   - [ ] Service layer completo
   - [ ] API routes para export
   - [ ] Hooks de dashboard
   - [ ] Documentação

### Fase 3: Professor (Semana 3)
**Prioridade: ALTA**

1. **Minhas Aulas**
   - [ ] Service layer completo
   - [ ] Server actions (CRUD)
   - [ ] Hooks personalizados
   - [ ] Validações Zod
   - [ ] Upload de materiais
   - [ ] Testes unitários
   - [ ] Documentação

2. **Avaliações e Presença**
   - [ ] Service layer completo
   - [ ] Server actions
   - [ ] Hooks personalizados
   - [ ] Validações Zod
   - [ ] Testes unitários
   - [ ] Documentação

3. **Instrumentos**
   - [ ] Service layer completo
   - [ ] Server actions
   - [ ] Hooks personalizados
   - [ ] Documentação

### Fase 4: Aluno (Semana 4)
**Prioridade: ALTA**

1. **Gamificação Completa**
   - [ ] Service layer completo
   - [ ] Server actions
   - [ ] Hooks personalizados
   - [ ] Realtime badges
   - [ ] Context provider
   - [ ] Testes unitários
   - [ ] Documentação

2. **Fórum**
   - [ ] Service layer completo
   - [ ] Server actions
   - [ ] Hooks personalizados
   - [ ] Validações Zod
   - [ ] Notificações em tempo real
   - [ ] Testes unitários
   - [ ] Documentação

3. **Portfolio**
   - [ ] Service layer completo
   - [ ] Server actions
   - [ ] Upload de evidências
   - [ ] Hooks personalizados
   - [ ] Documentação

### Fase 5: Shared & Polimento (Semana 5)
**Prioridade: MÉDIA**

1. **Autenticação**
   - [ ] Auth service completo
   - [ ] Context provider robusto
   - [ ] Hooks de autenticação
   - [ ] Refresh token automático
   - [ ] Documentação

2. **Notificações**
   - [ ] Service layer
   - [ ] Realtime subscriptions
   - [ ] Context provider
   - [ ] Hooks personalizados
   - [ ] Documentação

3. **Testes e CI/CD**
   - [ ] Configurar Jest
   - [ ] Testes de integração
   - [ ] GitHub Actions
   - [ ] Code coverage

---

## 🎯 PADRÕES DE CÓDIGO

### Service Layer
```typescript
// lib/services/professor/aula-service.ts
import { supabase } from '@/lib/supabase/client'
import { AulaSchema } from '@/lib/validations/professor/aula-schema'
import { AppError } from '@/lib/errors/app-error'

export class AulaService {
  async criarAula(data: unknown) {
    // 1. Validar dados
    const validData = AulaSchema.parse(data)
    
    // 2. Verificar permissões (RLS faz isso automaticamente)
    
    // 3. Executar operação
    const { data: aula, error } = await supabase
      .from('aulas')
      .insert(validData)
      .select()
      .single()
    
    // 4. Tratar erro
    if (error) {
      throw new AppError('Erro ao criar aula', 'DATABASE_ERROR', error)
    }
    
    // 5. Retornar resultado
    return aula
  }
  
  async listarMinhasAulas(professorId: string) {
    // RLS garante que só vê suas aulas
    const { data, error } = await supabase
      .from('aulas')
      .select('*')
      .eq('responsavel_id', professorId)
      .order('created_at', { ascending: false })
    
    if (error) {
      throw new AppError('Erro ao listar aulas', 'DATABASE_ERROR', error)
    }
    
    return data
  }
}

export const aulaService = new AulaService()
```

### Server Actions
```typescript
// app/actions/professor/aulas.ts
'use server'

import { revalidatePath } from 'next/cache'
import { aulaService } from '@/lib/services/professor/aula-service'
import { getCurrentUser } from '@/lib/supabase/server'

export async function criarAulaAction(formData: FormData) {
  try {
    // 1. Verificar autenticação
    const user = await getCurrentUser()
    if (!user || user.role !== 'professor') {
      return { error: 'Não autorizado' }
    }
    
    // 2. Extrair dados do form
    const data = {
      titulo: formData.get('titulo'),
      descricao: formData.get('descricao'),
      responsavel_id: user.id,
      // ... outros campos
    }
    
    // 3. Executar service
    const aula = await aulaService.criarAula(data)
    
    // 4. Revalidar cache
    revalidatePath('/professores/aulas')
    
    // 5. Retornar sucesso
    return { success: true, data: aula }
    
  } catch (error) {
    console.error('Erro ao criar aula:', error)
    return { error: error.message }
  }
}
```

### Custom Hooks
```typescript
// hooks/professor/use-minhas-aulas.ts
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { aulaService } from '@/lib/services/professor/aula-service'
import { criarAulaAction } from '@/app/actions/professor/aulas'

export function useMinhasAulas(professorId: string) {
  const queryClient = useQueryClient()
  
  // Query para listar
  const { data: aulas, isLoading } = useQuery({
    queryKey: ['minhas-aulas', professorId],
    queryFn: () => aulaService.listarMinhasAulas(professorId),
  })
  
  // Mutation para criar
  const criarAula = useMutation({
    mutationFn: (data: FormData) => criarAulaAction(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['minhas-aulas'] })
    },
  })
  
  return {
    aulas,
    isLoading,
    criarAula: criarAula.mutate,
    isCriando: criarAula.isPending,
  }
}
```

---

## 🔒 SEGURANÇA E RLS

**Como RLS funciona com o backend:**

1. **Service Layer** → Apenas queries ao Supabase
2. **RLS Policies** → Filtram automaticamente os dados
3. **Sem verificação manual** → O banco garante segurança

**Exemplo:**
```typescript
// Professor tenta listar todas as aulas
const { data } = await supabase.from('aulas').select('*')

// RLS filtra automaticamente:
// - Se professor: apenas suas aulas (WHERE responsavel_id = auth.uid())
// - Se admin: todas as aulas
// - Se aluno: nenhuma aula (sem permissão)
```

---

## 📊 MÉTRICAS DE SUCESSO

- ✅ **100% das funcionalidades** documentadas
- ✅ **80%+ de cobertura** de testes
- ✅ **Zero warnings** no TypeScript
- ✅ **Tempos de resposta** < 200ms
- ✅ **Zero vulnerabilidades** de segurança
- ✅ **Código limpo** com ESLint/Prettier

---

## 🎯 PRÓXIMA AÇÃO

**AGORA:** Começar Fase 1 - Fundação

1. Criar estrutura de pastas
2. Implementar camada de erros
3. Criar tipos e schemas base
4. Documentar arquitetura

**Está pronto para começar?** 🚀
