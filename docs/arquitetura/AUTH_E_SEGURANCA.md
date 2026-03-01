# Autenticacao e Seguranca - Nipo School

**Ultima atualizacao:** Dezembro 2025
**Status:** Sistema de autenticacao funcional; niveis professor e admin com backend pendente

---

## Indice

1. [Visao Geral](#1-visao-geral)
2. [Arquitetura de Autenticacao](#2-arquitetura-de-autenticacao)
3. [Niveis de Acesso (Roles)](#3-niveis-de-acesso-roles)
4. [Row Level Security (RLS)](#4-row-level-security-rls)
5. [Protecao de Rotas no Frontend](#5-protecao-de-rotas-no-frontend)
6. [Validacao de Sessao e Tokens](#6-validacao-de-sessao-e-tokens)
7. [Triggers e Funcoes de Seguranca](#7-triggers-e-funcoes-de-seguranca)
8. [Checklist de Seguranca por Tabela](#8-checklist-de-seguranca-por-tabela)
9. [Testes de Seguranca](#9-testes-de-seguranca)
10. [Problemas Comuns e Solucoes](#10-problemas-comuns-e-solucoes)
11. [Boas Praticas](#11-boas-praticas)
12. [Status de Implementacao por Role](#12-status-de-implementacao-por-role)

---

## 1. Visao Geral

O Nipo School utiliza **Supabase Auth** como provedor de autenticacao. O sistema combina:

- **Supabase Auth** para login, signup e gestao de sessoes (JWT)
- **Row Level Security (RLS)** no PostgreSQL para controle de acesso a nivel de linha
- **ProtectedRoute** no React para protecao de rotas no frontend
- **Redirecionamento inteligente** baseado no `role` do usuario
- **React Query** para cache e estado de autenticacao
- **TypeScript** com tipagem completa (117 tabelas tipadas)

### Roles definidas no banco

```sql
role VARCHAR(20) DEFAULT 'aluno'
CHECK (role IN ('admin', 'professor', 'aluno'))
```

> **Nota:** O role `pastor` existia em versoes anteriores mas foi removido da constraint do banco.
> O redirecionamento no frontend ainda o suporta por compatibilidade.

---

## 2. Arquitetura de Autenticacao

### Estrutura de arquivos

```
src/
 features/
    auth/
       AuthContext.tsx          # Context principal de autenticacao
       ProtectedRoute.tsx       # Protecao de rotas por role
 pages/
    auth/
       LoginPage.tsx            # Pagina de login
       SignUpPage.tsx            # Pagina de cadastro
 components/
    auth/
       SmartRedirect.tsx        # Redirect inteligente por tipo
 lib/
    supabase/
       supabaseClient.ts        # Cliente Supabase tipado
       database.types.ts        # Tipos do banco (117 tabelas)
       index.ts                 # Barrel export
 hooks/
     useAuth.ts                 # Hooks React Query para auth
```

### AuthContext - Funcionalidades

| Metodo | Descricao |
|--------|-----------|
| `signIn(email, password)` | Login com email/senha |
| `signUp(email, password, fullName, tipoUsuario)` | Cadastro completo |
| `signOut()` | Logout |
| `updateProfile(updates)` | Atualizar perfil |
| `loadProfile(userId)` | Carregar perfil do banco |

Comportamentos automaticos:

- Auto-carregamento de perfil apos login
- Listener de mudancas via `onAuthStateChange`
- Auto-refresh de token JWT

---

## 3. Niveis de Acesso (Roles)

### 3.1 Aluno - 100% implementado

**Server Actions** (`app/actions/aluno-actions.ts`) - 14 actions com logger:

| Grupo | Actions |
|-------|---------|
| Portfolio | `submitPortfolio`, `deletePortfolioItem`, `updatePortfolioItem` |
| Desafios | `participarDesafio`, `submeterDesafio`, `cancelarParticipacaoDesafio` |
| Aulas | `marcarAulaFavorita`, `removerAulaFavorita`, `concluirAula` |
| Comentarios | `enviarComentario`, `deletarComentario`, `curtirComentario` |
| Perfil | `atualizarPerfil`, `atualizarAvatar` |

**React Query Hooks** - 6 arquivos com optimistic updates:

- `use-aulas.ts` (6 hooks) - aulas, progresso, favoritas
- `use-portfolio.ts` (5 hooks) - obras do portfolio
- `use-desafios.ts` (5 hooks) - desafios e submissoes
- `use-gamification.ts` (5 hooks) - pontos, conquistas, progresso
- `use-historia.ts` (3 hooks) - periodos e compositores
- `use-comentarios.ts` (3 hooks) - comentarios e curtidas

**Schemas Zod** (`lib/validations/aluno-schemas.ts`) - 7 schemas de validacao

**Rotas** (`app/(protected)/alunos/`): Dashboard, Aulas, Portfolio, Desafios, Historia da Musica, Cultura Japonesa, Conquistas, Perfil

### 3.2 Professor - 25% implementado (rotas UI prontas, backend pendente)

**Rotas existentes** (`app/(protected)/professores/`): Agenda, Aulas, Turmas, Correcoes, Gamificacao, Historia, Formacao, Estrategias, Documentos, Experiencias, Forum, Show, Espacos, Referenciais, Repertorio, Instrumentos

**Backend pendente** - arquivos a criar:

- `app/actions/professor-actions.ts` - 18 actions (aulas, turmas, avaliacoes, comunicacao)
- `lib/hooks/use-professor.ts` - 12 hooks com React Query
- `lib/validations/professor-schemas.ts` - 5 schemas (createAula, createTurma, avaliarPortfolio, avaliarDesafio, registrarPresenca)

**Actions planejadas:**

| Grupo | Quantidade | Exemplos |
|-------|-----------|----------|
| Gestao de Aulas | 6 | createAula, updateAula, deleteAula, publicarAula, agendarAula, duplicarAula |
| Gestao de Turmas | 5 | createTurma, updateTurma, deleteTurma, adicionarAlunoTurma, removerAlunoTurma |
| Avaliacoes | 4 | avaliarPortfolio, avaliarDesafio, registrarPresenca, lancarNota |
| Comunicacao | 3 | enviarMensagemTurma, criarAnuncio, responderComentario |

### 3.3 Admin - 25% implementado (rotas UI prontas, backend pendente)

**Rotas existentes** (`app/(protected)/admin/`): Dashboard, Alunos, Professores, Aulas, Turmas, Historia, Gamificacao, Instrumentos, Repertorio, Database, Diagnostico, QR, Configuracoes

**Backend pendente** - arquivos a criar:

- `app/actions/admin-actions.ts` - 25 actions
- `lib/hooks/use-admin.ts` - 15+ hooks com React Query
- `lib/validations/admin-schemas.ts` - 6 schemas

**Actions planejadas:**

| Grupo | Quantidade | Exemplos |
|-------|-----------|----------|
| Gestao de Usuarios | 6 | createUser, updateUserRole, deleteUser, resetUserPassword, toggleUserStatus, getUsersList |
| Gestao de Professores | 3 | assignProfessorToTurma, removeProfessorFromTurma, getProfessoresList |
| Gestao Global de Turmas | 4 | createTurmaGlobal, updateTurmaGlobal, deleteTurmaGlobal, transferAlunoTurma |
| Gestao de Conteudo | 5 | createInstrumento, updateInstrumento, deleteInstrumento, createPeriodoHistoria, createCompositor |
| Gamificacao Global | 3 | createAchievement, updateAchievement, deleteAchievement |
| Relatorios e Analytics | 4 | getRelatorioGeral, getRelatorioAlunos, getRelatorioProfessores, exportDataCSV |

---

## 4. Row Level Security (RLS)

### 4.1 Politicas da tabela profiles (implementadas)

```sql
-- Usuarios leem apenas proprio perfil
CREATE POLICY "select_own_profile"
ON profiles FOR SELECT TO authenticated
USING (auth.uid() = id);

-- Usuarios atualizam apenas proprio perfil
CREATE POLICY "update_own_profile"
ON profiles FOR UPDATE TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

-- Permitir criacao de perfil apos signup
CREATE POLICY "insert_own_profile"
ON profiles FOR INSERT TO authenticated
WITH CHECK (auth.uid() = id);
```

### 4.2 Politicas recomendadas por tabela

#### achievements (Conquistas)

```sql
-- Todos autenticados podem ver conquistas disponiveis
SELECT TO authenticated USING (true)
```

#### user_achievements (Conquistas do Usuario)

```sql
-- Usuario ve apenas suas conquistas
SELECT USING (user_id = auth.uid())
-- Sistema pode adicionar conquistas
INSERT TO authenticated WITH CHECK (user_id = auth.uid())
```

#### portfolios

```sql
-- Usuario ve seus portfolios
SELECT USING (user_id = auth.uid())
-- Todos veem portfolios publicos
SELECT USING (visibilidade = 'publico')
-- Usuario cria proprio portfolio
INSERT WITH CHECK (user_id = auth.uid())
-- Usuario edita seus portfolios
UPDATE USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid())
-- Usuario deleta seus portfolios
DELETE USING (user_id = auth.uid())
```

#### lessons (Aulas)

```sql
-- Todos autenticados veem aulas
SELECT TO authenticated USING (true)
-- Apenas professores e admins modificam
INSERT/UPDATE/DELETE USING (
  EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid()
    AND tipo_usuario IN ('professor', 'admin')
  )
)
```

#### lesson_progress (Progresso das Aulas)

```sql
-- Usuario ve apenas seu progresso
SELECT USING (user_id = auth.uid())
-- Usuario atualiza apenas seu progresso
INSERT/UPDATE WITH CHECK (user_id = auth.uid())
```

#### instruments (Instrumentos)

```sql
-- Todos autenticados veem instrumentos
SELECT TO authenticated USING (true)
```

#### user_instruments (Instrumentos do Usuario)

```sql
-- Usuario ve apenas seus instrumentos
SELECT USING (user_id = auth.uid())
-- Usuario gerencia apenas seus instrumentos
INSERT/UPDATE/DELETE WITH CHECK (user_id = auth.uid())
```

#### turmas

```sql
-- Professores veem turmas que criaram
SELECT USING (teacher_id = auth.uid())
-- Alunos veem turmas em que estao matriculados
SELECT USING (
  EXISTS (
    SELECT 1 FROM turma_students
    WHERE turma_id = turmas.id
    AND student_id = auth.uid()
  )
)
```

### 4.3 O que NAO deve existir em politicas RLS

- Politica com `USING (true)` em tabelas com dados sensiveis (permite acesso a tudo)
- Politica para role `public` em dados sensiveis (permite acesso sem login)
- Politicas duplicadas ou conflitantes na mesma tabela

---

## 5. Protecao de Rotas no Frontend

### ProtectedRoute (`src/features/auth/ProtectedRoute.tsx`)

| Funcionalidade | Descricao |
|----------------|-----------|
| Autenticacao obrigatoria | Redirect para `/login` se nao autenticado |
| Validacao por `requiredRole` | Aceita uma role unica |
| Validacao por `allowedRoles` | Aceita multiplas roles |
| Acesso negado | Redirect para `/acesso-negado` se sem permissao |
| Loading | Tela de carregamento durante verificacao |

### SmartRedirect (`src/components/auth/SmartRedirect.tsx`)

Redireciona automaticamente para o dashboard correto apos login:

| Role | Destino |
|------|---------|
| `admin` | `/admin` |
| `professor` | `/professor` |
| `aluno` | `/aluno` |
| `pastor` | `/pastor` |

---

## 6. Validacao de Sessao e Tokens

- Token JWT validado em cada requisicao pelo Supabase
- Auto-refresh de token configurado
- Persistencia de sessao no `localStorage`
- Deteccao de sessao na URL (para magic links)

### Variaveis de ambiente

```env
VITE_SUPABASE_URL=https://[project-id].supabase.co
VITE_SUPABASE_ANON_KEY=[chave anon]
```

### Dicas para desenvolvimento

- Usar **modo anonimo** (Ctrl+Shift+N) para testes de login
- Ou limpar localStorage antes de testar (F12 > Application > Clear)
- Ou usar Hard Refresh (Ctrl+Shift+R)

---

## 7. Triggers e Funcoes de Seguranca

### Triggers automaticos

| Trigger | Tabela | Funcao | Descricao |
|---------|--------|--------|-----------|
| `on_auth_user_created` | `auth.users` | `handle_new_user()` | Cria profile automaticamente apos signup |
| `on_achievement_earned` | `user_achievements` | `update_user_points()` | Atualiza pontos ao ganhar conquista |

### Funcoes customizadas

| Funcao | Descricao |
|--------|-----------|
| `auth.uid()` | Retorna ID do usuario autenticado (base de todas as politicas) |
| `handle_new_user()` | Cria registro em profiles apos signup |
| `update_user_points()` | Atualiza pontos do usuario |
| `check_admin_role()` | Verifica se usuario e admin |

---

## 8. Checklist de Seguranca por Tabela

### Verificacao geral

Para cada tabela critica, verificar:

- [ ] RLS habilitado (`ALTER TABLE [tabela] ENABLE ROW LEVEL SECURITY`)
- [ ] Politicas de SELECT restritivas (nao usar `USING (true)` em dados sensiveis)
- [ ] Politicas de INSERT/UPDATE/DELETE com `WITH CHECK`
- [ ] Nenhuma politica para role `public` em dados sensiveis
- [ ] Sem politicas duplicadas ou conflitantes

### Estado esperado - tabela profiles

- 3 politicas: `select_own_profile`, `update_own_profile`, `insert_own_profile`
- RLS habilitado
- Todas usando `auth.uid() = id`

### Tabelas que precisam de RLS

| Tabela | RLS | Politicas |
|--------|-----|-----------|
| profiles | Obrigatorio | select, update, insert own |
| achievements | Obrigatorio | select all authenticated |
| user_achievements | Obrigatorio | select/insert own |
| portfolios | Obrigatorio | select own + publicos, CRUD own |
| lessons | Obrigatorio | select all, write professor/admin |
| lesson_progress | Obrigatorio | select/write own |
| instruments | Obrigatorio | select all authenticated |
| user_instruments | Obrigatorio | select/CRUD own |
| turmas | Obrigatorio | select teacher/enrolled student |

---

## 9. Testes de Seguranca

### Teste 1: Usuario autenticado ve apenas proprio perfil

```sql
-- Como usuario logado, deve retornar apenas 1
SELECT COUNT(*) FROM profiles;
-- Esperado: 1
```

### Teste 2: Usuario nao autenticado nao ve nada

```sql
-- Sem login, nenhum resultado
SELECT COUNT(*) FROM profiles;
-- Esperado: 0
```

### Teste 3: Nao consegue ler perfis de outros

```sql
SELECT * FROM profiles WHERE id != auth.uid();
-- Esperado: 0 resultados
```

### Teste 4: Nao consegue atualizar perfil de outro

```sql
UPDATE profiles
SET nome = 'Hacker'
WHERE id != auth.uid();
-- Esperado: 0 linhas afetadas
```

### Script de verificacao

Executar `VERIFICAR_SEGURANCA_COMPLETA.sql` para validar:

- Quais tabelas tem RLS habilitado
- Quais politicas estao ativas
- Se as 3 politicas essenciais de profiles existem
- Quantos triggers estao configurados
- Total de politicas no banco

---

## 10. Problemas Comuns e Solucoes

| Problema | Sintoma | Solucao |
|----------|---------|---------|
| RLS desabilitado | Todos veem todos os dados | `ALTER TABLE [tabela] ENABLE ROW LEVEL SECURITY` |
| Politica com `USING (true)` | Acesso irrestrito a tabela | Adicionar condicao `auth.uid() = [coluna]` |
| Politica para role `public` | Dados acessiveis sem login | Mudar para `TO authenticated` |
| `auth.uid()` retorna NULL | Logado mas sem acesso | Verificar se token JWT esta sendo enviado |
| Politicas conflitantes | Comportamento imprevisivel | Remover politicas antigas, manter apenas as necessarias |
| Cache do navegador | Login funciona via Node.js mas nao no browser | Limpar localStorage ou usar modo anonimo |
| Imports duplicados (migracao JS > TS) | Sistema antigo e novo rodando simultaneamente | Remover arquivos antigos de `src/contexts/` |

---

## 11. Boas Praticas

1. **Principio do menor privilegio** - Usuarios so acessam o minimo necessario. Sempre usar `auth.uid() = user_id` como base.

2. **Sempre usar `TO authenticated`** - Nunca usar `TO public` em dados sensiveis. Role `public` apenas para dados genuinamente publicos.

3. **Separar leitura e escrita** - Politicas de SELECT podem ser mais permissivas. Politicas de INSERT/UPDATE/DELETE devem ser mais restritas.

4. **Usar `WITH CHECK` em operacoes de escrita** - Valida dados antes de inserir/atualizar. Previne criacao de dados incorretos ou nao autorizados.

5. **Validacao com Zod no frontend** - Usar schemas Zod para validar dados antes de enviar ao backend. Seguir padrao de `aluno-schemas.ts` para novas roles.

6. **Logger em todas as actions** - Aplicar `createActionLogger` em todas as server actions para auditoria.

7. **Testar sempre com diferentes roles** - Testar como usuario autenticado, nao autenticado, e com diferentes roles (admin, professor, aluno).

---

## 12. Status de Implementacao por Role

### Resumo geral

| Nivel | Server Actions | Hooks | Schemas | Rotas | Completude |
|-------|---------------|-------|---------|-------|------------|
| **Aluno** | 14 actions | 6 hooks | 2 schemas | /alunos/* | **100%** |
| **Professor** | 0 actions | 0 hooks | 0 schemas | /professores/* | **25%** |
| **Admin** | 0 actions | 0 hooks | 0 schemas | /admin/* | **25%** |
| **Gamificacao** | 6 actions | 1 hook | 1 schema | Compartilhado | **100%** |

### Infraestrutura reutilizavel (pronta)

- **Logger System** - Pronto para ser aplicado em novas actions
- **Validation System** - `validateAction()`, `validateFormData()`, `ActionResult<T>`
- **React Query Setup** - QueryProvider, padrao de hooks, optimistic updates
- **Database Schema** - Tabelas criadas, RLS policies, indices otimizados (migrations 12-18)
- **UI Components** - Layouts por role, navegacao, design system

### Estimativa para completar backend por role

| Tarefa | Actions | Hooks | Schemas | Tempo Estimado |
|--------|---------|-------|---------|----------------|
| Professor | 18 | 12 | 5 | 2-4 dias |
| Admin | 25 | 15 | 6 | 2-4 dias |
| Testing | - | - | - | 2-3 dias |
| **Total** | **43** | **27** | **11** | **6-11 dias** |

---

## Estatisticas do Banco

- **Tabelas:** 117
- **Funcoes:** 56
- **Politicas RLS:** 153
- **Indices:** 295

---

*Documento consolidado a partir de: SISTEMA_AUTH_COMPLETO.md (Out/2025), CHECKLIST_SEGURANCA_BANCO.md, 05_ANALISE_NIVEIS_ACESSO.md (Dez/2025)*
