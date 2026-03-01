# Rotas e Navegacao - Nipo School

**Ultima atualizacao:** Fevereiro 2026
**Framework:** Next.js 14 (App Router)
**Autenticacao:** Supabase Auth + Middleware

---

## Indice

1. [Visao Geral da Arquitetura](#1-visao-geral-da-arquitetura)
2. [Rotas Publicas](#2-rotas-publicas)
3. [Rotas do Aluno](#3-rotas-do-aluno)
4. [Rotas do Professor](#4-rotas-do-professor)
5. [Rotas do Administrador](#5-rotas-do-administrador)
6. [Rotas Compartilhadas](#6-rotas-compartilhadas)
7. [Estrutura da Sidebar](#7-estrutura-da-sidebar)
8. [Protecao de Rotas e Guards](#8-protecao-de-rotas-e-guards)
9. [Sistema de Redirecionamento](#9-sistema-de-redirecionamento)
10. [Layout e Componentes de Navegacao](#10-layout-e-componentes-de-navegacao)
11. [Boas Praticas](#11-boas-praticas)

---

## 1. Visao Geral da Arquitetura

O projeto migrou de Vite + React Router para **Next.js 14 com App Router**. As rotas sao definidas pela estrutura de pastas dentro de `app/`. A protecao de rotas e feita pelo **middleware do Next.js** (`middleware.ts`) que intercepta todas as requisicoes antes de chegarem as paginas.

### Estrutura de Diretorios de Rotas

```
app/
├── (auth)/                     # Grupo de rotas de autenticacao
│   ├── layout.tsx              # Layout das paginas de auth
│   ├── login/page.tsx
│   └── register/page.tsx
│
├── (protected)/                # Grupo de rotas protegidas
│   ├── alunos/                 # Area do aluno (role: aluno)
│   │   ├── layout.tsx          # OrientalDashboardLayout role="aluno"
│   │   ├── page.tsx            # Dashboard
│   │   └── .../
│   ├── professores/            # Area do professor (role: professor)
│   │   ├── layout.tsx          # OrientalDashboardLayout role="professor"
│   │   ├── page.tsx            # Dashboard
│   │   └── .../
│   ├── admin/                  # Area admin (role: admin)
│   │   ├── layout.tsx          # OrientalDashboardLayout role="admin"
│   │   ├── page.tsx            # Dashboard
│   │   └── .../
│   └── em-construcao/page.tsx  # Pagina placeholder para funcionalidades futuras
│
└── middleware.ts               # Protecao de rotas no servidor
```

### Roles do Sistema

| Role | Prefixo de Rota | Area |
|------|-----------------|------|
| `aluno` | `/alunos/*` | Area do Estudante |
| `professor` | `/professores/*` | Area do Professor |
| `admin` | `/admin/*` | Painel Administrativo |

---

## 2. Rotas Publicas

Rotas acessiveis sem autenticacao. Definidas no array `publicRoutes` do middleware.

| Rota | Diretorio | Descricao |
|------|-----------|-----------|
| `/` | `app/page.tsx` | Landing Page |
| `/login` | `app/(auth)/login/page.tsx` | Pagina de Login |
| `/register` | `app/(auth)/register/page.tsx` | Pagina de Cadastro |
| `/esqueci-senha` | - | Recuperacao de senha |
| `/auth/callback` | - | Callback do Supabase Auth |

**Layout de Auth:** As paginas de login e registro usam o layout `app/(auth)/layout.tsx` com gradiente decorativo e centralizacao do conteudo.

---

## 3. Rotas do Aluno

Todas sob o prefixo `/alunos`. Protegidas para `role: aluno`.

### 3.1 Paginas Principais (na Sidebar)

| Rota | Descricao | Status |
|------|-----------|--------|
| `/alunos` | Dashboard principal | Implementado |
| `/alunos/aulas` | Minhas Aulas - calendario e lista | Implementado |
| `/alunos/progresso` | Acompanhamento de progresso e graficos | Implementado |
| `/alunos/portfolio` | Lista de portfolios do aluno | Implementado |
| `/alunos/show-final` | Show Final | Implementado |
| `/alunos/repertorio` | Repertorio musical | Implementado |
| `/alunos/instrumentos` | Catalogo de instrumentos | Implementado |
| `/alunos/videos` | Videos educativos | Implementado |
| `/alunos/desafios` | Lista de desafios | Implementado |
| `/alunos/historia` | Historia da Musica | Implementado |
| `/alunos/conquistas` | Badges e conquistas | Implementado |
| `/alunos/gamificacao` | Sistema de gamificacao e XP | Implementado |
| `/alunos/perfil` | Perfil do aluno | Implementado |

### 3.2 Paginas de Detalhe (sem Sidebar)

| Rota | Descricao |
|------|-----------|
| `/alunos/aulas/[numero]` | Detalhe de uma aula especifica |
| `/alunos/aulas/iniciante` | Aulas nivel iniciante |
| `/alunos/aulas/intermediario` | Aulas nivel intermediario |
| `/alunos/aulas/avancado` | Aulas nivel avancado |
| `/alunos/conquistas/:id` | Detalhe de conquista |
| `/alunos/portfolio/[id]` | Detalhe de portfolio |
| `/alunos/desafios/[id]` | Detalhe de desafio |
| `/alunos/instrumentos/[id]` | Detalhe de instrumento |
| `/alunos/historia/[periodo]` | Detalhe de periodo historico |

---

## 4. Rotas do Professor

Todas sob o prefixo `/professores`. Protegidas para `role: professor`.

### 4.1 Grupo: Ensino

| Rota | Descricao | Status |
|------|-----------|--------|
| `/professores` | Dashboard do Professor | Implementado |
| `/professores/agenda` | Agenda Semanal | Implementado |
| `/professores/turmas` | Minhas Turmas - lista | Implementado |
| `/professores/aulas/nova` | Criar nova aula | Implementado |
| `/professores/correcoes` | Correcoes e SpeedGrader | Implementado |

### 4.2 Grupo: Formacao

| Rota | Descricao | Status |
|------|-----------|--------|
| `/professores/formacao` | Formacao Docente | Implementado |
| `/professores/experiencias` | Experiencias BR | Implementado |
| `/professores/referenciais` | Referenciais Internacionais | Implementado |

### 4.3 Grupo: Conteudo

| Rota | Descricao | Status |
|------|-----------|--------|
| `/professores/repertorio` | Repertorio musical | Implementado |
| `/professores/instrumentos` | Instrumentos | Implementado |
| `/professores/historia` | Historia da Musica | Implementado |
| `/professores/documentos` | Documentos | Implementado |
| `/professores/espacos` | Espacos Alternativos | Implementado |

### 4.4 Grupo: Engajamento

| Rota | Descricao | Status |
|------|-----------|--------|
| `/professores/gamificacao` | Gamificacao e XP | Implementado |
| `/professores/estrategias` | Estrategias pedagogicas | Implementado |
| `/professores/forum` | Forum de discussao | Implementado |
| `/professores/show` | Show Final | Implementado |

### 4.5 Grupo: Sistema

| Rota | Descricao | Status |
|------|-----------|--------|
| `/professores/configuracoes` | Configuracoes | Implementado |
| `/professores/ajuda` | Ajuda | Implementado |

### 4.6 Paginas de Detalhe (sem Sidebar)

| Rota | Descricao |
|------|-----------|
| `/professores/turmas/[id]` | Detalhe da turma |
| `/professores/turmas/[id]/alunos` | Alunos da turma |
| `/professores/turmas/[id]/frequencia` | Frequencia da turma |
| `/professores/turmas/[id]/notas` | Notas da turma |
| `/professores/correcoes/[id]` | SpeedGrader - correcao individual |
| `/professores/repertorio/[id]` | Detalhe de peca do repertorio |
| `/professores/repertorio/[id]/editar` | Editar peca do repertorio |
| `/professores/repertorio/novo` | Nova peca no repertorio |
| `/professores/aulas/page` | Lista de aulas |

---

## 5. Rotas do Administrador

Todas sob o prefixo `/admin`. Protegidas para `role: admin`.

### 5.1 Grupo: Gestao Escolar

| Rota | Descricao | Status |
|------|-----------|--------|
| `/admin` | Dashboard administrativo | Implementado |
| `/admin/alunos` | Gestao de alunos | Implementado |
| `/admin/alunos/[id]` | Detalhe do aluno | Implementado |
| `/admin/professores` | Gestao de professores | Implementado |
| `/admin/professores/[id]` | Detalhe do professor | Implementado |
| `/admin/professores/novo` | Convidar professor | Implementado |
| `/admin/turmas` | Turmas e matriculas | Implementado |
| `/admin/turmas/[id]` | Detalhe da turma | Implementado |
| `/admin/turmas/nova` | Criar turma | Implementado |
| `/admin/turmas/editar/[id]` | Editar turma | Implementado |

### 5.2 Grupo: Academico e Conteudo

| Rota | Descricao | Status |
|------|-----------|--------|
| `/admin/aulas` | Gestao de aulas | Implementado |
| `/admin/aulas/[id]` | Detalhe da aula | Implementado |
| `/admin/aulas/nova` | Criar aula | Implementado |
| `/admin/aulas/editar/[id]` | Editar aula | Implementado |
| `/admin/aulas/lista` | Lista de aulas | Implementado |
| `/admin/instrumentos` | Gestao de instrumentos | Implementado |
| `/admin/instrumentos/[id]` | Detalhe do instrumento | Implementado |
| `/admin/instrumentos/novo` | Criar instrumento | Implementado |
| `/admin/repertorio` | Gestao de repertorio | Implementado |
| `/admin/repertorio/[id]` | Detalhe da peca | Implementado |
| `/admin/repertorio/nova` | Nova peca | Implementado |
| `/admin/repertorio/editar/[id]` | Editar peca | Implementado |
| `/admin/historia` | Historia da Musica | Implementado |
| `/admin/historia/novo-periodo` | Novo periodo historico | Implementado |
| `/admin/historia/periodos/[id]` | Detalhe de periodo | Implementado |

### 5.3 Grupo: Engajamento

| Rota | Descricao | Status |
|------|-----------|--------|
| `/admin/gamificacao` | Gamificacao e XP | Implementado |
| `/admin/gamificacao/[id]` | Detalhe de conquista | Implementado |
| `/admin/gamificacao/nova` | Nova conquista | Implementado |
| `/admin/gamificacao/editar/[id]` | Editar conquista | Implementado |

### 5.4 Grupo: Sistema

| Rota | Descricao | Status |
|------|-----------|--------|
| `/admin/qr/gerenciar` | Gestao de QR Codes | Implementado |
| `/admin/qr/display/[id]` | Exibir QR Code | Implementado |
| `/admin/diagnostico` | Diagnostico do sistema | Implementado |
| `/admin/configuracoes` | Configuracoes | Implementado |
| `/admin/ajuda` | Ajuda | Implementado |
| `/admin/database` | Administracao do banco de dados | Implementado |

---

## 6. Rotas Compartilhadas

| Rota | Descricao | Acesso |
|------|-----------|--------|
| `/em-construcao` | Placeholder para paginas futuras | Todos autenticados |

---

## 7. Estrutura da Sidebar

A sidebar e controlada pelo componente `OrientalDashboardLayout` (`components/layouts/OrientalDashboardLayout.tsx`). Cada role tem sua propria configuracao de navegacao e tema visual.

### 7.1 Sidebar do Aluno

Configurada como lista simples (`navItems`). Tema vermelho (Sakura).

```
Dashboard           -> /alunos
Minhas Aulas        -> /alunos/aulas
Progresso           -> /alunos/progresso
Portfolio           -> /alunos/portfolio
Show Final          -> /alunos/show-final
Repertorio          -> /alunos/repertorio
Instrumentos        -> /alunos/instrumentos
Videos              -> /alunos/videos
Desafios            -> /alunos/desafios
Historia            -> /alunos/historia
Conquistas          -> /alunos/conquistas
Gamificacao         -> /alunos/gamificacao
Meu Perfil          -> /alunos/perfil
```

**Tema visual:**
- Kanji: 生徒 (Seito)
- Cor primaria: Vermelho (`text-red-600`)
- Gradiente: `from-red-600 to-orange-600`
- Pattern: Asanoha

### 7.2 Sidebar do Professor

Configurada em grupos colapsaveis (`groups`). Tema azul (Seigaiha).

```
ENSINO
  Inicio             -> /professores
  Agenda Semanal     -> /professores/agenda
  Minhas Turmas      -> /professores/turmas
  Nova Aula          -> /professores/aulas/nova
  Correcoes          -> /professores/correcoes

FORMACAO
  Formacao Docente   -> /professores/formacao
  Experiencias BR    -> /professores/experiencias
  Referenciais Int.  -> /professores/referenciais

CONTEUDO
  Repertorio         -> /professores/repertorio
  Instrumentos       -> /professores/instrumentos
  Historia da Musica -> /professores/historia
  Documentos         -> /professores/documentos
  Espacos Altern.    -> /professores/espacos

ENGAJAMENTO
  Gamificacao        -> /professores/gamificacao
  Estrategias        -> /professores/estrategias
  Forum              -> /professores/forum
  Show Final         -> /professores/show

SISTEMA
  Configuracoes      -> /professores/configuracoes
  Ajuda              -> /professores/ajuda
```

**Tema visual:**
- Kanji: 先生 (Sensei)
- Cor primaria: Azul (`text-blue-600`)
- Gradiente: `from-blue-600 to-cyan-600`
- Pattern: Seigaiha

### 7.3 Sidebar do Administrador

Configurada em grupos colapsaveis (`groups`). Tema roxo (Sayagata).

```
GESTAO ESCOLAR
  Dashboard          -> /admin
  Alunos             -> /admin/alunos
  Professores        -> /admin/professores
  Turmas & Matric.   -> /admin/turmas

ACADEMICO & CONTEUDO
  Aulas              -> /admin/aulas
  Instrumentos       -> /admin/instrumentos
  Repertorio         -> /admin/repertorio
  Historia da Musica -> /admin/historia

ENGAJAMENTO
  Gamificacao & XP   -> /admin/gamificacao

SISTEMA
  QR Codes           -> /admin/qr/gerenciar
  Diagnostico        -> /admin/diagnostico
  Configuracoes      -> /admin/configuracoes
  Ajuda              -> /admin/ajuda
```

**Tema visual:**
- Kanji: 管理 (Kanri)
- Cor primaria: Roxo (`text-purple-600`)
- Gradiente: `from-purple-600 to-indigo-600`
- Pattern: Sayagata

### 7.4 Funcionalidades da Sidebar

- **Colapsavel:** Botao de toggle que reduz a sidebar a `w-20` no desktop
- **Persistencia:** Estado de colapsado salvo em `localStorage`
- **Grupos colapsaveis:** Para professor e admin, os grupos podem ser expandidos/recolhidos
- **Sidebar colapsada:** Mostra as 2 primeiras letras do label como abreviacao
- **Mobile:** Menu lateral que abre a direita com overlay escurecido
- **Indicador ativo:** Item ativo com gradiente colorido e seta `ChevronRight`

---

## 8. Protecao de Rotas e Guards

### 8.1 Middleware (Server-side)

**Arquivo:** `middleware.ts`

O middleware do Next.js e a primeira camada de protecao. Ele intercepta todas as requisicoes HTTP antes de chegarem a pagina.

**Fluxo de verificacao:**

1. Cria cliente Supabase com cookies do request
2. Obtem a sessao do usuario
3. Se **nao tem sessao** e a rota nao e publica: redireciona para `/login`
4. Se **tem sessao**:
   - Busca `tipo_usuario` da tabela `profiles`
   - Normaliza o role (ex: `teacher` -> `professor`, `student` -> `aluno`)
   - Se esta em `/login` ou `/`: redireciona para a area correta do role
   - Se esta tentando acessar area de outro role: redireciona para sua propria area
   - Redireciona rotas legadas do Vite (`/admin/dashboard` -> `/admin`, etc.)

**Rotas publicas configuradas:**

```typescript
const publicRoutes = ['/', '/login', '/register', '/esqueci-senha', '/auth/callback']
```

**Mapeamento role -> area:**

```typescript
const roleToArea = {
  admin: '/admin',
  professor: '/professores',
  aluno: '/alunos'
}
```

**Matcher do middleware** (exclui assets estaticos):

```typescript
matcher: ['/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)']
```

### 8.2 Regras de Acesso por Role

| Rota | Aluno | Professor | Admin | Publico |
|------|-------|-----------|-------|---------|
| `/`, `/login`, `/register` | Redireciona | Redireciona | Redireciona | Permitido |
| `/alunos/*` | Permitido | Bloqueado | Bloqueado | Bloqueado |
| `/professores/*` | Bloqueado | Permitido | Bloqueado | Bloqueado |
| `/admin/*` | Bloqueado | Bloqueado | Permitido | Bloqueado |
| `/em-construcao` | Permitido | Permitido | Permitido | Bloqueado |

### 8.3 Cenarios de Bloqueio

**Aluno tentando acessar `/admin`:**
1. Middleware detecta `role = 'aluno'`
2. Verifica que `/admin` comeca com `/admin` e role nao e `admin`
3. Redireciona para `/alunos`

**Professor tentando acessar `/alunos/conquistas`:**
1. Middleware detecta `role = 'professor'`
2. Verifica que `/alunos/conquistas` comeca com `/alunos` e role nao e `aluno`
3. Redireciona para `/professores`

**Usuario nao autenticado tentando acessar `/professores/turmas`:**
1. Middleware detecta ausencia de sessao
2. Rota nao esta na lista de rotas publicas
3. Redireciona para `/login`

---

## 9. Sistema de Redirecionamento

### 9.1 Redirecionamento Pos-Login

```
Usuario faz login
  -> Supabase Auth valida credenciais
  -> Sessao JWT criada nos cookies
  -> Proximo request: middleware detecta sessao
  -> Busca tipo_usuario na tabela profiles
  -> Redireciona para area correta:
     admin     -> /admin
     professor -> /professores
     aluno     -> /alunos
```

### 9.2 Redirecionamento de Rotas Legadas

O middleware converte automaticamente rotas do sistema anterior (Vite):

| Rota Antiga | Rota Nova |
|-------------|-----------|
| `/admin/dashboard` | `/admin` |
| `/professores/dashboard` | `/professores` |
| `/alunos/dashboard` | `/alunos` |

### 9.3 Normalizacao de Roles

O middleware normaliza aliases de roles vindos do banco:

| Valor no Banco | Role Normalizado |
|----------------|------------------|
| `teacher` | `professor` |
| `student` | `aluno` |
| `administrator` | `admin` |
| (qualquer outro) | `aluno` (fallback) |

---

## 10. Layout e Componentes de Navegacao

### 10.1 OrientalDashboardLayout

**Arquivo:** `components/layouts/OrientalDashboardLayout.tsx`

Componente principal de layout para todas as areas protegidas. Recebe o `role` como prop e renderiza o tema e sidebar correspondentes.

**Responsabilidades:**
- Renderizar a sidebar com navegacao do role
- Gerenciar estado de colapsamento da sidebar (desktop)
- Gerenciar menu mobile (hamburguer)
- Aplicar tema visual (cores, gradiente, kanji, pattern)
- Exibir informacoes do usuario logado
- Botao de logout

**Uso nos layouts de cada area:**

```tsx
// app/(protected)/alunos/layout.tsx
export default function AlunoLayout({ children }) {
  return (
    <OrientalDashboardLayout role="aluno">
      {children}
    </OrientalDashboardLayout>
  )
}
```

### 10.2 Sidebars Especificas (Legado)

Existem componentes de sidebar especificos que foram usados anteriormente e ainda existem no codigo:

- `app/(protected)/admin/components/AdminSidebar.tsx` - Sidebar dedicada do admin
- `app/(protected)/professores/components/ProfessorSidebar.tsx` - Sidebar dedicada do professor

Estes componentes nao sao mais usados nos layouts principais (substituidos pelo `OrientalDashboardLayout`), mas podem servir de referencia ou ser usados em contextos especificos.

### 10.3 Layout de Autenticacao

**Arquivo:** `app/(auth)/layout.tsx`

Layout simples com fundo gradiente e centralizacao, usado nas paginas de login e registro.

### 10.4 AdminHeader

**Arquivo:** `app/(protected)/admin/_components/AdminHeader.tsx`

Header adicional renderizado dentro do layout do admin, antes do conteudo principal.

---

## 11. Boas Praticas

### 11.1 Convencoes de Nomenclatura

**Paginas:**
- Usar `page.tsx` (obrigatorio pelo Next.js App Router)
- Componentes client extraidos em pasta `_components/` ou `components/`
- Sufixo `Client` para componentes com `'use client'` (ex: `ConquistasClient.tsx`)

**Layouts:**
- `layout.tsx` para layouts de rota (Next.js App Router)
- Componentes de layout compartilhados em `components/layouts/`

**Hooks:** camelCase com prefixo `use` (ex: `useGamification.ts`)

### 11.2 Estrutura de Parametros

Rotas com parametros dinamicos usam a convencao do Next.js:

```
[id]       -> Parametro obrigatorio (ex: /admin/alunos/[id])
[numero]   -> Parametro semantico (ex: /alunos/aulas/[numero])
[periodo]  -> Parametro semantico (ex: /alunos/historia/[periodo])
```

### 11.3 Protecao em Camadas

A protecao acontece em multiplas camadas:

1. **Middleware (server-side):** Primeira barreira, intercepta antes da pagina carregar
2. **Layout com role:** Cada area tem seu layout que passa o role para o `OrientalDashboardLayout`
3. **AuthProvider (client-side):** Contexto de autenticacao disponivel em toda a aplicacao

### 11.4 Organizacao de Rotas do Admin

O admin usa uma estrutura CRUD consistente para cada recurso:

```
/admin/[recurso]              -> Lista (index)
/admin/[recurso]/[id]         -> Detalhe/visualizacao
/admin/[recurso]/novo         -> Criar novo
/admin/[recurso]/editar/[id]  -> Editar existente
```

### 11.5 Componentes Client vs Server

No Next.js App Router:
- `page.tsx` pode ser Server Component (melhor performance)
- Interatividade extraida para componentes `_components/*Client.tsx`
- Dados podem ser buscados no server e passados como props

### 11.6 Pagina "Em Construcao"

Funcionalidades futuras devem apontar para `/em-construcao` na sidebar ate estarem prontas. Isso oferece uma experiencia melhor do que links quebrados ou paginas 404.

### 11.7 Adicionar Nova Rota - Checklist

1. Criar pasta e `page.tsx` dentro de `app/(protected)/[role]/[nova-rota]/`
2. Se tiver interatividade, criar componente Client em `_components/`
3. Adicionar item de navegacao no `OrientalDashboardLayout` (array `navItems` ou `groups` do role correspondente)
4. Se for rota com parametro dinamico, criar pasta `[param]/page.tsx`
5. Verificar que o middleware nao bloqueia indevidamente (rotas ja protegidas por prefixo)
6. Testar acesso com o role correto e verificar redirecionamento com roles incorretos

---

## Estatisticas

### Contagem de Rotas por Area

| Area | Paginas na Sidebar | Paginas de Detalhe | Total |
|------|--------------------|--------------------|-------|
| Publicas | - | - | 5 |
| Aluno | 13 | 9 | 22 |
| Professor | 20 | 8 | 28 |
| Admin | 15 | 17 | 32 |
| Compartilhadas | - | - | 1 |
| **Total** | **48** | **34** | **88** |

### Arquivos-Chave

| Arquivo | Funcao |
|---------|--------|
| `middleware.ts` | Protecao de rotas server-side |
| `components/layouts/OrientalDashboardLayout.tsx` | Layout unificado com sidebar e temas |
| `app/providers/AuthProvider.tsx` | Contexto de autenticacao client-side |
| `app/(auth)/layout.tsx` | Layout das paginas de autenticacao |
| `app/(protected)/alunos/layout.tsx` | Layout do aluno |
| `app/(protected)/professores/layout.tsx` | Layout do professor |
| `app/(protected)/admin/layout.tsx` | Layout do admin |
