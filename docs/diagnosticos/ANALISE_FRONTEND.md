# Analise Frontend - Nipo School

**Ultima atualizacao:** 08/01/2025 (consolida analises de 05/10/2025 e 08/01/2025)

---

## 1. Resumo Executivo

O frontend do Nipo School possui uma arquitetura bem documentada com estrutura feature-first (alunos/, professores/, admin/), sistema de autenticacao completo e banco de dados robusto. Porem, a auditoria revelou que parte significativa dos hooks e paginas ainda utiliza dados mockados ou padroes desatualizados (useState/useEffect em vez de React Query).

**Numeros-chave:**

| Metrica | Valor |
|---------|-------|
| Rotas mapeadas | 46 unicas (8 publicas + 38 autenticadas) |
| Componentes planejados | ~150 (paginas + componentes + hooks) |
| Tabelas no banco | 68 funcionais (117 tipadas) |
| RLS Policies ativas | 29 |
| Usuarios reais cadastrados | 29 (1 admin, 24 alunos, 4 professores) |
| Functions PL/pgSQL | 50+ |
| Triggers ativos | 17 |

---

## 2. Estado Atual - O Que Ja Esta Implementado

### 2.1 Autenticacao (100% completo)

```
src/features/auth/
  ├── AuthContext.tsx       (Context provider funcional)
  ├── ProtectedRoute.tsx    (Guard com role validation)
  └── hooks/
      └── useAuth.ts
```

Funcionalidades operacionais:
- Login com email/senha
- Cadastro de usuarios
- Logout
- Smart redirect por role (aluno/professor/admin)
- Session persistence
- Profile loading automatico

### 2.2 Configuracao Base (100% completo)

```
src/
  ├── main.tsx
  ├── lib/supabase/
  │   ├── supabaseClient.ts    (Client configurado)
  │   └── database.types.ts    (117 tabelas tipadas)
  └── types/database.ts
```

### 2.3 Hooks Auditados

**Hooks corretos (4/7 - 57%):**

| Hook | Status | Observacoes |
|------|--------|-------------|
| useGamification.ts | Correto | React Query, tabelas achievements/user_achievements/achievements_progress/user_points_log |
| useTurmas.ts | Correto | React Query, colunas corrigidas (data_programada, detalhes_aula jsonb) |
| useInstrumentos.ts | Correto | React Query, 16 colunas mapeadas |
| useDashboardAluno.ts | Correto | React Query, usa view_dashboard_aluno com 12 metricas agregadas |

**Hooks com problemas (3/7 - 43%):**

| Hook | Problema | Acao Necessaria |
|------|----------|-----------------|
| usePortfolio.ts | Usa useState/useEffect em vez de React Query. Interface de evidencias incompleta (faltam: tags, reflexao, contexto, competencias, metodologia, feedback_professor, nota, is_destaque, data_criacao) | Converter para React Query + adicionar colunas faltantes |
| useDesafios.ts | Usa useState/useEffect. Nomes de colunas divergem do banco (objetivos vs objetivo, recursos_necessarios vs materiais_necessarios, faltam codigo, nivel_serie, exemplos_url, ordem_exibicao) | Converter para React Query + corrigir nomes |

---

## 3. Paginas com Dados Mockados

Quatro paginas (31% do total de 13) usam dados ficticios em vez de dados reais:

### 3.1 AlunoDashboard.tsx
- **Problema:** Mock data hardcoded (stats, proximasAulas)
- **Solucao:** Usar `useDashboardAluno()` que ja existe e retorna total_points, current_streak, best_streak, lessons_completed, modules_completed, total_achievements, etc.

### 3.2 ProgressoPage.tsx
- **Problema:** Mock data com comentario "substituir por hook useAlunoStats()"
- **Solucao:** Usar `useDashboardAluno()` + queries especificas

### 3.3 PortfolioDetailPage.tsx
- **Problema:** Mock data com comentario "substituir por hook usePortfolio(id)"
- **Solucao:** Hook ja existe, precisa ser chamado corretamente

### 3.4 DesafioDetailPage.tsx
- **Problema:** Mock data com comentario "substituir por hook useDesafio(id)"
- **Solucao:** Hook ja existe, precisa ser chamado corretamente

---

## 4. Estrutura de Pastas - O Que Falta Criar

```
src/
├── app/
│   ├── App.tsx                    (existe, precisa atualizar router)
│   └── router.tsx                 (CRIAR - 46 rotas)
│
├── pages/                         (CRIAR - paginas publicas)
│   ├── LandingPage.tsx
│   ├── SobrePage.tsx
│   ├── ContatoPage.tsx
│   ├── ConfiguracoesPage.tsx
│   ├── NotificacoesPage.tsx
│   ├── AjudaPage.tsx
│   ├── PerfilPage.tsx
│   ├── NotFoundPage.tsx
│   └── ForbiddenPage.tsx
│
├── features/                      (parcial)
│   ├── auth/                      (completo)
│   ├── alunos/                    (CRIAR - 12 paginas, 9+ componentes, 4 hooks)
│   ├── professores/               (CRIAR - 8 paginas, 5+ componentes, 3 hooks)
│   ├── admin/                     (CRIAR - 10 paginas, 4+ componentes, 2 hooks)
│   ├── gamificacao/               (CRIAR - 4 componentes, 1 hook)
│   └── instrumentos/              (CRIAR - 4 componentes, 1 hook)
│
├── components/                    (parcial)
│   ├── auth/                      (ProtectedRoute, SmartRedirect - OK)
│   ├── layout/                    (CRIAR - PublicLayout, ProtectedLayout, Navbar, Sidebar, Footer, Breadcrumbs)
│   ├── shared/                    (CRIAR - NipoCard, NipoButton, NipoInput, NipoModal, NipoTable, Skeleton, EmptyState)
│   └── forms/                     (CRIAR - FormField, FormError, FormLabel)
│
├── hooks/                         (parcial)
│   ├── useAuth.ts                 (OK)
│   ├── useSupabase.ts             (CRIAR)
│   ├── useLocalStorage.ts         (CRIAR)
│   ├── useDebounce.ts             (CRIAR)
│   ├── useMediaQuery.ts           (CRIAR)
│   └── useKeyPress.ts             (CRIAR)
│
├── lib/
│   ├── constants/                 (CRIAR - routes.ts, roles.ts, achievements.ts)
│   └── utils/                     (CRIAR - navigation.ts, formatters.ts, validators.ts, slugify.ts, breadcrumbs.ts, storage.ts)
│
└── styles/
    ├── globals.css                (OK)
    └── nipo-tokens.css            (CRIAR - design tokens)
```

---

## 5. Arquitetura de Rotas

### 5.1 Rotas Publicas (8)

| Rota | Pagina | Status |
|------|--------|--------|
| / | LandingPage | Criar |
| /sobre | SobrePage | Criar |
| /contato | ContatoPage | Criar |
| /entrar | LoginPage | Implementado |
| /cadastrar | SignUpPage | Criar |
| /recuperar-senha | PasswordResetPage | Criar |
| /403 | ForbiddenPage | Criar |
| /404 (*) | NotFoundPage | Criar |

### 5.2 Rotas Autenticadas - Aluno (13)

| Rota | Pagina |
|------|--------|
| /app/aluno | AlunoDashboard |
| /app/aluno/perfil | PerfilPage |
| /app/aluno/conquistas | ConquistasPage |
| /app/aluno/conquistas/:id | ConquistaDetailPage |
| /app/aluno/portfolio | PortfolioListPage |
| /app/aluno/portfolio/novo | PortfolioCreatePage |
| /app/aluno/portfolio/:slug | PortfolioDetailPage |
| /app/aluno/desafios | DesafiosListPage |
| /app/aluno/desafios/:codigo | DesafioDetailPage |
| /app/aluno/instrumentos | InstrumentosPage |
| /app/aluno/instrumentos/:slug | InstrumentoDetailPage |
| /app/aluno/aulas | MinhasAulasPage |
| /app/aluno/progresso | ProgressoPage |

### 5.3 Rotas Autenticadas - Professor (9)

| Rota | Pagina |
|------|--------|
| /app/professor | ProfessorDashboard |
| /app/professor/perfil | PerfilPage |
| /app/professor/turmas | TurmasListPage |
| /app/professor/turmas/:id | TurmaDetailPage |
| /app/professor/submissoes | SubmissoesListPage |
| /app/professor/submissoes/:id | AvaliarSubmissaoPage |
| /app/professor/calendario | CalendarioPage |
| /app/professor/materiais | MateriaisPage |
| /app/professor/relatorios | RelatoriosProfessorPage |

### 5.4 Rotas Autenticadas - Admin (10)

| Rota | Pagina |
|------|--------|
| /app/admin | AdminDashboard |
| /app/admin/usuarios | UsuariosListPage |
| /app/admin/usuarios/novo | UsuarioCreatePage |
| /app/admin/usuarios/:id | UsuarioEditPage |
| /app/admin/turmas | AdminTurmasPage |
| /app/admin/instrumentos | AdminInstrumentosPage |
| /app/admin/conquistas | AdminConquistasPage |
| /app/admin/desafios | AdminDesafiosPage |
| /app/admin/relatorios | AdminRelatoriosPage |
| /app/admin/auditoria | AuditoriaPage |

### 5.5 Rotas Compartilhadas (3)

| Rota | Pagina |
|------|--------|
| /app/configuracoes | ConfiguracoesPage |
| /app/notificacoes | NotificacoesPage |
| /app/ajuda | AjudaPage |

---

## 6. Design System

### 6.1 Componentes Base Prioritarios

**NipoButton (alta prioridade):**
```typescript
interface NipoButtonProps {
  variant: 'primary' | 'secondary' | 'danger' | 'ghost'
  size: 'sm' | 'md' | 'lg'
  isLoading?: boolean
  leftIcon?: ReactNode
  rightIcon?: ReactNode
}
```

**NipoInput (alta prioridade):**
```typescript
interface NipoInputProps {
  label: string
  error?: string
  type: 'text' | 'email' | 'password' | 'number' | 'date'
  leftIcon?: ReactNode
  rightIcon?: ReactNode
}
```

**NipoCard (alta prioridade):**
```typescript
interface NipoCardProps {
  title?: string
  subtitle?: string
  footer?: ReactNode
  hoverable?: boolean
  bordered?: boolean
}
```

**NipoModal (media prioridade):**
```typescript
interface NipoModalProps {
  isOpen: boolean
  onClose: () => void
  title: string
  size: 'sm' | 'md' | 'lg' | 'xl'
}
```

---

## 7. Dependencias a Instalar

```bash
# Producao
npm install react-router-dom react-hook-form zod lucide-react date-fns

# Desenvolvimento
npm install -D @types/react-router-dom
```

Nota: @tanstack/react-query ja esta instalado.

---

## 8. Priorizacao (MoSCoW)

### MUST HAVE (Sprints 0-2, ~6 semanas)
- Sistema de rotas completo (router.tsx com 46 rotas)
- Layouts (PublicLayout, ProtectedLayout)
- Design system base (Button, Input, Card)
- Landing page
- 3 Dashboards basicos (aluno, professor, admin)
- Navegacao funcional
- Remocao de dados mockados das 4 paginas criticas

### SHOULD HAVE (Sprints 3-5, ~6 semanas)
- Sistema de conquistas/gamificacao (com dados reais)
- Portfolio digital (CRUD + upload)
- Desafios Alpha (submissoes + avaliacao)

### COULD HAVE (Sprints 6-8, ~6 semanas)
- Gestao de turmas e matriculas
- Biblioteca de instrumentos interativa
- Calendario de aulas
- Relatorios

### WON'T HAVE (futuro)
- App mobile nativo
- Notificacoes em tempo real (WebSocket)
- PWA offline completo
- Visualizacao 3D de instrumentos

---

## 9. Plano de Acao Imediato

### Fase 1: Corrigir Dashboard do Aluno (~30 min)
- Substituir mock data em AlunoDashboard.tsx por useDashboardAluno()
- Testar no navegador

### Fase 2: Converter Hooks para React Query (~1h)
- Converter usePortfolio.ts (adicionar colunas faltantes de evidencias)
- Converter useDesafios.ts (corrigir nomes de colunas)

### Fase 3: Atualizar Paginas com Mock (~1h)
- ProgressoPage.tsx
- PortfolioDetailPage.tsx
- DesafioDetailPage.tsx

### Fase 4: Setup Estrutural (Sprint 0, ~1 semana)
- Criar estrutura completa de pastas
- Instalar dependencias faltantes
- Criar src/app/router.tsx com 46 rotas
- Criar src/lib/constants/routes.ts (constantes tipo-seguras)
- Criar design tokens (src/styles/nipo-tokens.css)
- Criar layouts base (PublicLayout, ProtectedLayout)

---

## 10. Criterios de Conclusao (Definition of Done)

Apos Sprint 0:
- `npm run dev` funciona sem erros
- Navegacao entre rotas publicas funciona
- Login redireciona para dashboard correto por role
- Aluno nao consegue acessar /admin (guard funcional)
- Componentes base renderizam corretamente
- 0 erros TypeScript
- 0 warnings ESLint criticos
- Todas as 4 paginas mockadas usando dados reais do banco

---

## 11. Boas Praticas Extraidas

**Fazer:**
1. Seguir estrutura feature-first (cada modulo isolado)
2. Usar constantes tipo-seguras para rotas (evitar strings magicas)
3. Implementar guards robustos (ProtectedRoute com allowedRoles)
4. Criar design system antes das paginas
5. Validar formularios com Zod
6. Usar React Query para cache e mutations
7. Sempre confiar no backend (RLS), nao no frontend

**Nao fazer:**
1. Criar componentes excessivamente genericos
2. Duplicar logica de rotas
3. Pular validacao de inputs
4. Criar queries inline (usar hooks customizados)
5. Manter dados mockados em producao
