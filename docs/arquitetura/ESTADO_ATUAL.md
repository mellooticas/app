# Estado Atual do App — Nipo School

> Atualizado em: 2026-02-28 (v2 — pos fix tenant_id)

## Arquitetura de Dados

```
┌─────────────┐     ┌──────────────────┐     ┌─────────────────┐
│   PÁGINAS   │     │  SERVER ACTIONS   │     │   SUPABASE DB   │
│  (React)    │     │  (Next.js)        │     │  (PostgreSQL)   │
│             │     │                   │     │                 │
│ READ:       │────>│                   │     │ v_* views       │
│ v_* views   │     │                   │     │ (enriched,      │
│ via client  │     │                   │     │  42 views)      │
│             │     │                   │     │                 │
│ WRITE:      │────>│ getActionContext()│────>│ passthrough      │
│ call action │     │ → tenant_id JWT  │     │ views (30+6)    │
│             │     │ → userId         │     │ → iam.* tables  │
│             │     │                   │     │ → core.* tables │
│             │     │ lesson-actions    │     │                 │
│             │     │ course-actions    │     │ 8 RPCs          │
│             │     │ challenge-actions │     │ (rpc_*)         │
│             │     │ portfolio-actions │     │                 │
│             │     │ feed-actions      │     │                 │
│             │     │ community-actions │     │                 │
│             │     │ practice-actions  │     │                 │
│             │     │ profile-actions   │     │                 │
│             │     │ repertoire-actions│     │                 │
│             │     │ rbac-admin-actions│     │                 │
└─────────────┘     └──────────────────┘     └─────────────────┘
```

- **Leitura**: Páginas usam `supabase.from('v_*')` diretamente (client-side)
- **Escrita**: Páginas chamam server actions → actions usam passthrough views → RLS aplica
- **Segurança**: Apenas schema `public` exposto. Views com `security_invoker = true`
- **Tenant isolation**: Todas as actions usam `getActionContext()` que extrai `tenant_id` do JWT e inclui em todo INSERT

### Fluxo de Autenticação nas Actions

```
getActionContext() → lib/utils/action-context.ts
  1. createClient() (server-side supabase)
  2. getUser() → userId
  3. getSession() → access_token
  4. decode JWT → claims.tenant_id
  5. return { supabase, userId, tenantId }
```

Todas as 9 actions de escrita usam esse helper. O `rbac-admin-actions.ts` tem seu próprio `getAuthContext()` com verificação de role admin.

---

## Páginas Funcionais (47 total)

### Dashboard
| Rota | Status | Dados |
|---|---|---|
| `/dashboard` | FUNCIONAL | `v_dashboard_student` / `v_dashboard_teacher` / `v_dashboard_admin` |

### Aulas & Turmas (Teacher/Admin)
| Rota | Status | Action |
|---|---|---|
| `/lessons` | FUNCIONAL | Lista via `v_lessons` |
| `/lessons/new` | FUNCIONAL | `createLesson()` → `lesson-actions` |
| `/lessons/[id]` | FUNCIONAL | Detalhes + `completeLesson()` |
| `/lessons/[id]/edit` | FUNCIONAL | `updateLesson()` → `lesson-actions` |
| `/courses` | FUNCIONAL | Lista via `v_courses` |
| `/courses/new` | FUNCIONAL | `createCourse()` → `course-actions` |
| `/courses/[id]` | FUNCIONAL | Detalhes + alunos |
| `/courses/[id]/students` | FUNCIONAL | Lista alunos matriculados |
| `/courses/[id]/attendance` | FUNCIONAL | `recordAttendance()` → `course-actions` |

### Desafios & Avaliação
| Rota | Status | Action |
|---|---|---|
| `/challenges` | FUNCIONAL | Lista via `v_challenges` |
| `/challenges/[id]` | FUNCIONAL | `submitChallenge()` → aluno envia resposta |
| `/evaluate` | FUNCIONAL | SpeedGrader: lista pendentes |
| `/evaluate/[id]` | FUNCIONAL | `evaluateSubmission()` → professor avalia |

### Portfólio
| Rota | Status | Action |
|---|---|---|
| `/portfolio` | FUNCIONAL | Lista via `v_portfolios` |
| `/portfolio/new` | FUNCIONAL | `submitPortfolioV2()` → aluno envia |
| `/portfolio/[id]` | FUNCIONAL | Detalhes do trabalho |

### Progresso & Gamificação
| Rota | Status | Dados |
|---|---|---|
| `/progress` | FUNCIONAL | `v_user_progress` + `v_user_achievements` |
| `/achievements` | FUNCIONAL | `v_achievements` + `v_user_achievements` |
| `/practice` | FUNCIONAL | `logPracticeSession()` + `deletePracticeSession()` |

### Social
| Rota | Status | Action |
|---|---|---|
| `/feed` | FUNCIONAL | `createPost()`, `likePost()`, `commentOnPost()` |
| `/feed/[id]` | FUNCIONAL | Detalhe do post + comentários (`v_feed_comments`) |
| `/community` | FUNCIONAL | `createTopic()` → forum |
| `/community/[id]` | FUNCIONAL | `replyToTopic()`, `likeTopic()` |

### Conteúdo Educacional
| Rota | Status | Dados |
|---|---|---|
| `/instruments` | FUNCIONAL | `v_instruments` |
| `/instruments/[id]` | FUNCIONAL | Detalhes instrumento |
| `/history` | FUNCIONAL | `v_history_periods` |
| `/history/[id]` | FUNCIONAL | Detalhes período |
| `/repertoire` | FUNCIONAL | `v_repertoire` |
| `/repertoire/new` | FUNCIONAL | `createRepertoire()` |
| `/repertoire/[id]` | FUNCIONAL | Detalhes peça |
| `/videos` | FUNCIONAL | Feed filtrado por vídeo/áudio |

### Gerenciamento (Admin)
| Rota | Status | Action |
|---|---|---|
| `/students` | FUNCIONAL | Lista via `v_profiles` (role filter) |
| `/students/[id]` | FUNCIONAL | Detalhes aluno |
| `/teachers` | FUNCIONAL | Lista via `v_profiles` (role filter) |
| `/teachers/[id]` | FUNCIONAL | Detalhes professor |
| `/settings` | FUNCIONAL | Hub de navegação |
| `/settings/users` | FUNCIONAL | `listUsers()`, `inviteUser()`, RBAC |
| `/settings/roles` | FUNCIONAL | Permissions + Navigation config |
| `/diagnostics` | FUNCIONAL | Stats do sistema |

### Perfil & Outros
| Rota | Status | Action |
|---|---|---|
| `/profile` | FUNCIONAL | `updateProfile()` com modo edição |
| `/schedule` | FUNCIONAL | Agenda via `v_lessons` |
| `/documents` | FUNCIONAL | `v_support_materials` |
| `/training` | FUNCIONAL | Materiais de formação |
| `/show-final` | ESTÁTICO | Info sobre show final |
| `/help` | ESTÁTICO | FAQ |
| `/references` | ESTÁTICO | Links externos |
| `/experiences` | ESTÁTICO | Projetos BR |
| `/strategies` | ESTÁTICO | Metodologias |
| `/spaces` | ESTÁTICO | Espaços da escola |

---

## Server Actions (11 arquivos)

### Helper compartilhado
| Arquivo | Descrição |
|---|---|
| `lib/utils/action-context.ts` | `getActionContext()` → extrai `userId` + `tenant_id` do JWT. Usado por TODAS as actions abaixo. |

### Actions de escrita (9 arquivos — todos com tenant_id)

| Arquivo | Funções | Tabelas/RPCs |
|---|---|---|
| `lesson-actions.ts` | createLesson, updateLesson, completeLesson | lessons, rpc_complete_lesson, rpc_award_points, rpc_check_achievements |
| `course-actions.ts` | createCourse, enrollStudent, recordAttendance | courses, enrollments, attendance |
| `challenge-actions.ts` | submitChallenge, evaluateSubmission | challenge_submissions, rpc_award_points, rpc_check_achievements |
| `portfolio-actions-v2.ts` | submitPortfolioV2, evaluatePortfolioV2 | portfolios, rpc_award_points, rpc_check_achievements |
| `feed-actions.ts` | createPost, likePost, commentOnPost, deletePost | feed_posts, feed_likes, feed_comments |
| `community-actions.ts` | createTopic, replyToTopic, likeTopic | forum_topics, forum_replies, forum_likes |
| `practice-actions.ts` | logPracticeSession, deletePracticeSession | practice_sessions |
| `profile-actions.ts` | updateProfile | profiles |
| `repertoire-actions.ts` | createRepertoire, updateRepertoire | repertoire |

### Actions de RBAC (2 arquivos — admin com tenant_id próprio)

| Arquivo | Funções | Tabelas |
|---|---|---|
| `rbac-admin-actions.ts` | listUsers, inviteUser, assignRole, +10 mais | user_roles, role_permissions, etc. |
| `rbac-actions.ts` | loadUserRBAC | rpc_get_user_rbac |

### Gamificação (fire-and-forget)

Pontos são atribuídos automaticamente após sucesso nas actions:

| Action | Evento | Pontos |
|---|---|---|
| `completeLesson()` | Aula concluída | +10 |
| `submitChallenge()` | Desafio submetido | +15 |
| `submitPortfolioV2()` | Portfólio submetido | +20 |

Padrão: `rpc_award_points()` → then → `rpc_check_achievements()` (não awaited)

---

## RPCs no Banco (8)

| RPC | Chamado por | Status |
|---|---|---|
| `rpc_get_user_rbac()` | rbac-actions.ts | ATIVO |
| `rpc_complete_lesson()` | lesson-actions.ts | ATIVO |
| `rpc_award_points()` | lesson/challenge/portfolio-actions | ATIVO |
| `rpc_check_achievements()` | lesson/challenge/portfolio-actions | ATIVO |
| `rpc_submit_portfolio()` | (disponível, não usado — usamos INSERT direto) | RESERVA |
| `rpc_evaluate_portfolio()` | (disponível, não usado) | RESERVA |
| `rpc_submit_challenge()` | (disponível, não usado) | RESERVA |
| `rpc_evaluate_challenge()` | (disponível, não usado) | RESERVA |

---

## Migrations (039)

| # | Arquivo | Status |
|---|---|---|
| 001-035 | Schema base + seed data | APLICADO |
| 036 | RBAC permissions patch | APLICADO |
| 037 | Fix manage-teachers href | APLICADO |
| 038 | 24 passthrough views | APLICADO |
| 039 | Extra passthrough views (challenges, repertoire, instruments, etc.) | APLICADO |

---

## Fixes Aplicados

| Data | Fix | Causa | Arquivos |
|---|---|---|---|
| 2026-02-28 | tenant_id em todas as actions | RLS exige `tenant_id = fn_tenant_id()` do JWT, actions não enviavam | 9 action files + action-context.ts |
| 2026-02-28 | Deletar 4 actions legadas | Referenciavam tabelas antigas inexistentes (`aulas`, `turmas`, etc.) | aluno/professor/admin/gamification-actions |
| 2026-02-28 | Conectar 12 páginas às actions | Forms tinham UI mas botões sem handler | 12 page files |
| 2026-02-28 | Gamification wiring | RPCs existiam mas não eram chamados | lesson/challenge/portfolio-actions |

---

## O que Falta (Futuro)

- [ ] Upload de arquivos (portfolio, feed) via Supabase Storage
- [ ] Testes automatizados (Vitest)
- [ ] Timeline interativa de história da música
- [ ] Quiz nos instrumentos
- [ ] Notificações em tempo real
- [ ] QR Scanner funcional
- [ ] CI/CD pipeline
- [ ] i18n (português/japonês)
- [ ] PWA / mobile app
