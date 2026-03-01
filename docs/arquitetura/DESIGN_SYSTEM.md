# Design System - Nipo School

> Sistema de design unificado baseado na filosofia japonesa, com componentes que refletem os valores de Kaizen, Wabi-Sabi e Zen aplicados a uma plataforma de ensino musical.

---

## Sumario

1. [Filosofia de Design](#1-filosofia-de-design)
2. [Sistema de Cores](#2-sistema-de-cores)
3. [Tipografia](#3-tipografia)
4. [Espacamento e Grid](#4-espacamento-e-grid)
5. [Componentes Base](#5-componentes-base)
6. [Componentes Nipo](#6-componentes-nipo)
7. [Sistema Oriental Unificado](#7-sistema-oriental-unificado)
8. [Hierarquia de Roles](#8-hierarquia-de-roles)
9. [Admin Executivo](#9-admin-executivo)
10. [Layout e Navegacao](#10-layout-e-navegacao)
11. [Responsividade](#11-responsividade)
12. [Dark Mode e Temas](#12-dark-mode-e-temas)
13. [Animacoes e Micro-Interacoes](#13-animacoes-e-micro-interacoes)
14. [Gamificacao Visual](#14-gamificacao-visual)
15. [Internacionalizacao](#15-internacionalizacao)
16. [Performance e Otimizacao](#16-performance-e-otimizacao)
17. [Acessibilidade](#17-acessibilidade)
18. [Estrutura de Arquivos](#18-estrutura-de-arquivos)

---

## 1. Filosofia de Design

O Nipo School implementa um sistema de design baseado em cinco pilares da filosofia japonesa:

### Kaizen (改善) - Melhoria Continua
Cada interacao deve gerar melhoria. Progress tracking presente em toda a aplicacao. Pequenas melhorias incrementais guiam a evolucao do sistema.

### Wabi-Sabi (侘寂) - Beleza na Imperfeicao
Transparencias sutis (`bg-white/90`), bordas organicas ao inves de elementos duros, variacoes naturais na opacidade dos elementos flutuantes. Imperfeicoes propositais que humanizam a interface.

### Zen - Simplicidade Elegante
Foco no essencial, apenas informacoes necessarias. Hierarquia clara atraves de tamanhos e cores. Simplicidade elegante em cada interacao.

### Ma (間) - Espaco Negativo
Espacamentos generosos entre componentes. Respiracao visual atraves de gaps consistentes. Layout limpo sem sobrecarga visual.

### Omotenashi - Hospitalidade na UX
Cada elemento deve acolher o usuario. Feedback visual imediato. Transicoes suaves que guiam a experiencia.

---

## 2. Sistema de Cores

### 2.1 Paleta por Role

#### Sakura (Alunos) - Motivacao e Crescimento
```typescript
sakura: {
  50: '#fef7f7',
  100: '#feeaea',
  200: '#fcd9da',
  300: '#f8b9bd',
  400: '#f18c93',
  500: '#e6646b',  // Primary
  600: '#d04650',
  700: '#ae353f',
  800: '#922f39',
  900: '#7d2c36'
}
```

#### Matcha (Professores) - Sabedoria e Ensino
```typescript
matcha: {
  50: '#f6fdf6',
  100: '#e8fae8',
  200: '#d2f4d2',
  300: '#abe8ab',
  400: '#7dd67d',
  500: '#52c052',  // Primary
  600: '#3da13d',
  700: '#338033',
  800: '#2d652d',
  900: '#275427'
}
```

#### Indigo (Admin) - Controle e Gestao
```typescript
indigo: {
  50: '#f0f4ff',
  100: '#e1e8ff',
  200: '#c7d5fe',
  300: '#a5b6fc',
  400: '#818cf8',
  500: '#6366f1',  // Primary
  600: '#4f46e5',
  700: '#4338ca',
  800: '#3730a3',
  900: '#312e81'
}
```

### 2.2 Paleta Admin Executiva (Purple)
```css
--admin-primary: #7c3aed;      /* Purple-600 - Principal */
--admin-dark: #6d28d9;         /* Purple-700 - Hover/Active */
--admin-darker: #5b21b6;       /* Purple-800 - Gradientes */
--admin-darkest: #4c1d95;      /* Purple-900 - Headers escuros */
--admin-light: #a78bfa;        /* Purple-400 - Scrollbars */
--admin-lighter: #c4b5fd;      /* Purple-300 - Fundos claros */
--admin-bg: #faf5ff;           /* Purple-50 - Background */
--admin-accent: #818cf8;       /* Indigo-400 - Acento */
```

### 2.3 Cores Semanticas
```css
Success: #10b981          /* Verde para conquistas */
Warning: #f59e0b          /* Amarelo para atencao */
Error: #ef4444            /* Vermelho para erros */
Info: #3b82f6             /* Azul para informacoes */
```

### 2.4 Dark Mode
```css
bg-primary: #1a1a1a       /* Background principal */
bg-secondary: #2a2a2a     /* Cards e containers */
bg-accent: #3a3a3a        /* Elementos interativos */
text-primary: #ffffff      /* Texto principal */
text-secondary: #a3a3a3   /* Texto secundario */
text-muted: #737373        /* Texto terciario */
```

### 2.5 Gradientes Orientais
```css
/* Backgrounds por role */
.bg-oriental-aluno { background: linear-gradient(to bottom right, #fff7ed, #fef2f2, #fdf2f8); }
.bg-oriental-admin { background: linear-gradient(to bottom right, #f8fafc, #ede9fe, #dbeafe); }
.bg-oriental-professor { background: linear-gradient(to bottom right, #f0fdf4, #ecfdf5, #e6fffa); }

/* Gradientes de acao */
primary: from-orange-500 to-red-500
secondary: from-red-500 to-pink-500
accent: from-pink-500 to-orange-500

/* Cards translucidos */
.card-oriental { background: rgba(255, 255, 255, 0.9); backdrop-filter: blur(12px); }
```

---

## 3. Tipografia

### 3.1 Familias de Fontes
```css
Primary: 'Inter', system-ui, sans-serif
Japanese: 'Noto Sans JP', 'Hiragino Sans', sans-serif
Display: 'Noto Sans JP', 'Inter', sans-serif
```

### 3.2 Escala Tipografica
```css
Text XS: 12px / 1.4       /* Labels pequenos */
Text SM: 14px / 1.5       /* Body text secundario */
Text Base: 16px / 1.6     /* Body text principal */
Text LG: 18px / 1.6       /* Subtitulos */
Text XL: 20px / 1.5       /* Titulos secao */
Text 2XL: 24px / 1.4      /* Titulos pagina */
Text 3XL: 32px / 1.3      /* Hero titles */
Text 4XL: 48px / 1.2      /* Landing titles */
```

### 3.3 Tipografia Executiva (Admin)
```tsx
// Titulos
className="text-2xl font-semibold text-slate-900 tracking-tight"

// Subtitulos
className="text-sm text-slate-500 leading-relaxed"

// Labels
className="text-xs font-semibold uppercase tracking-wider text-slate-400"

// Corpo de texto
className="text-sm text-slate-700"
```

---

## 4. Espacamento e Grid

### 4.1 Sistema de Espacamento (Base 8px)
```css
Space 1: 4px              /* Micro espacamentos */
Space 2: 8px              /* Pequenos elementos */
Space 3: 12px             /* Text spacing */
Space 4: 16px             /* Base unit */
Space 6: 24px             /* Medium spacing */
Space 8: 32px             /* Large spacing */
Space 12: 48px            /* Section spacing */
Space 16: 64px            /* Hero spacing */
```

### 4.2 Breakpoints
```css
xs: '375px'    /* Mobile pequeno */
sm: '640px'    /* Mobile grande */
md: '768px'    /* Tablet */
lg: '1024px'   /* Desktop pequeno */
xl: '1280px'   /* Desktop grande */
2xl: '1536px'  /* Desktop extra */
```

### 4.3 Grid por Densidade de Role
| Role | Colunas Desktop | Gaps | Densidade |
|------|----------------|------|-----------|
| Aluno | 1-2 colunas | Grandes | Minima |
| Professor | 2-3 colunas | Medios | Media |
| Admin | 3-4 colunas | Pequenos | Alta |

---

## 5. Componentes Base

### 5.1 Cards
```tsx
import { Card } from '@/components/ui'

// Variantes
<Card variant="default" />      // Padrao zen
<Card variant="elevated" />     // Sombra elevada
<Card variant="outlined" />     // Apenas bordas
<Card variant="glass" />        // Efeito vidro
<Card variant="zen" />          // Minimalista extremo

// Filosofias aplicaveis
<Card philosophy="kaizen" />    // Melhoria continua
<Card philosophy="wabi-sabi" /> // Imperfeicoes belas
<Card philosophy="zen" />       // Simplicidade pura
```

### 5.2 Botoes
```tsx
import { Button } from '@/components/ui'

// Variantes
<Button variant="primary" />    // Acao principal
<Button variant="secondary" />  // Acao secundaria
<Button variant="outline" />    // Contorno apenas
<Button variant="ghost" />      // Transparente
<Button variant="danger" />     // Acoes criticas

// Tamanhos
<Button size="sm" />           // Pequeno
<Button size="md" />           // Medio
<Button size="lg" />           // Grande
```

### 5.3 Inputs
```tsx
import { Input } from '@/components/ui'

<Input
  variant="default"            // default | zen | outlined | filled
  validation="success"         // success | error | warning
  role="student"               // student | professor | admin
  placeholder="Digite aqui..."
/>
```

### 5.4 Modals e Overlays
```tsx
// Modal Principal
// Backdrop blur, slide-up animation
// Tamanhos: SM, MD, LG, XL, Fullscreen
// Header com X, footer com buttons

// Toast Notifications
// Posicao: Top-right, stack vertical
// Tipos: Success, Error, Warning, Info
// Auto-dismiss: 4s default, persist on error

// Tooltips
// Trigger: Hover/Focus, mobile: tap
// Posicao: Auto-positioning
// Estilo: Dark background, white text
```

---

## 6. Componentes Nipo

### 6.1 NipoLogo
```tsx
import { NipoLogo } from '@/components/nipo'

<NipoLogo
  variant="full"        // full | icon | text
  size="md"             // sm | md | lg | xl
  theme="auto"          // auto | light | dark
/>
```

### 6.2 ProgressCircle
```tsx
import { ProgressCircle } from '@/components/nipo'

<ProgressCircle
  value={75}
  philosophy="zen"      // kaizen | wabi-sabi | zen
  role="student"        // student | professor | admin
  showPercentage={true}
  size="lg"
/>
```

### 6.3 AchievementCard
```tsx
import { AchievementCard } from '@/components/nipo'

<AchievementCard
  type="musical"        // musical | learning | social | creative | special
  unlocked={true}
  title="Primeiro Solo"
  description="Executou sua primeira performance solo"
  icon="..."
  points={150}
/>
```

### 6.4 StatsCard
```tsx
import { StatsCard } from '@/components/nipo'

<StatsCard
  label="Total de Pontos"
  value="1,250"
  trend="up"            // up | down | stable
  trendValue="+12%"
  role="student"
  gradient={true}
/>
```

### 6.5 PhilosophyQuote
```tsx
import { PhilosophyQuote } from '@/components/nipo'

<PhilosophyQuote
  philosophy="kaizen"   // kaizen | wabi-sabi | zen
  variant="card"        // card | banner | minimal
  showJapanese={true}
  autoRotate={true}
/>
```

### 6.6 QRPresenceSystem
```tsx
import { QRPresenceSystem } from '@/components/nipo'

// Vista do Professor (gerador)
<QRPresenceSystem
  aulaId="aula-123"
  professorId="prof-456"
  isStudent={false}
/>

// Vista do Aluno (scanner)
<QRPresenceSystem
  aulaId="aula-123"
  isStudent={true}
/>
```

### 6.7 ThemeToggle
```tsx
import { ThemeToggle } from '@/components/nipo'

<ThemeToggle
  variant="zen"         // zen | minimal | standard
  size="lg"
  showLabel={true}
/>
```

---

## 7. Sistema Oriental Unificado

### 7.1 Componentes Orientais Compartilhados

#### OrientalContainer
```tsx
<OrientalContainer level="student|teacher|admin">
  // Background sakura consistente
  // Elementos flutuantes personalizados por nivel
</OrientalContainer>
```

#### OrientalNavigation
```tsx
<OrientalNavigation level="student|teacher|admin">
  // Icones: 学 (aluno), 先 (professor), 管 (admin)
  // Subtitulos adaptados ao contexto
</OrientalNavigation>
```

#### OrientalStatCard
```tsx
<OrientalStatCard level="student|teacher|admin">
  // Tamanhos: Grande (aluno) -> Medio (professor) -> Pequeno (admin)
  // Detalhes: Minimo -> Medio -> Maximo
</OrientalStatCard>
```

#### OrientalGrid
```tsx
<OrientalGrid level="student|teacher|admin">
  // Densidade: 1-2 cols -> 2-3 cols -> 3-4 cols
  // Gaps: Grandes -> Medios -> Pequenos
</OrientalGrid>
```

### 7.2 Caracteres Japoneses Contextuais
| Contexto | Kanji | Leitura | Significado |
|----------|-------|---------|-------------|
| Admin | 管 | Kan | Gestao/Administracao |
| Professor | 先 | Sen | Professor/Mestre |
| Aluno | 学 | Gaku | Aprender/Estudar |
| Musica | 音 | On | Som/Musica |
| Logo | 鳥 | Tori | Passaro |
| Melhoria | 改 | Kai | Melhoria/Mudanca |
| Instrumento | 楽 | Gaku | Musica/Alegria |

### 7.3 Saudacoes Japonesas por Contexto
```typescript
const greetings = {
  morning: 'おはようございます',    // Bom dia (formal)
  general: 'こんにちは',            // Ola
  evening: 'こんばんは',            // Boa noite
  welcome: 'いらっしゃいませ',       // Bem-vindo
  return: 'おかえりなさい',          // Bem-vindo de volta
  goodbye: 'またね'                 // Ate logo
}
```

### 7.4 Paleta Oriental Base
```css
/* Background unificado sakura */
background: from-orange-50 via-red-50 to-pink-50

/* Bordas por densidade de role */
light: border-orange-100    /* Aluno */
medium: border-orange-200   /* Professor */
strong: border-orange-300   /* Admin */
```

### 7.5 CSS Classes Orientais
```css
/* Gradientes de botao */
.btn-oriental-red { background: linear-gradient(to bottom right, #ef4444, #dc2626); }
.btn-oriental-gold { background: linear-gradient(to bottom right, #f59e0b, #d97706); }
.btn-oriental-zen { background: linear-gradient(to bottom right, #3b82f6, #2563eb); }
```

### 7.6 Padrao Oriental Sayagata
Para fundos sutis na area admin, o padrao sayagata representa estrutura e nobreza:
```tsx
className="bg-pattern-sayagata"
```

---

## 8. Hierarquia de Roles

### 8.1 Aluno - Experiencia Ultra-Leve e Gamificada
- **Foco**: Motivacao, simplicidade, diversao
- **Densidade**: Minima (cards grandes, poucos elementos)
- **Elementos**: Level/XP, conquistas, streaks, proximas aulas
- **Grid**: 1-2 colunas em desktop
- **Cores**: Tons suaves do gradiente sakura, verdes para conquistas
- **Interacoes**: Grandes, ludicas, com animacoes
- **Tom visual**: Divertido, gamificado

```
+-------------------------------------+
|  Level 2    ========--  85%         |
|                                     |
|  [ Proxima Aula - 20min ]          |
|  [ 5 Conquistas ]                  |
|                                     |
|  [ CONTINUAR APRENDENDO ]          |
+-------------------------------------+
```

### 8.2 Professor - Funcional e Pedagogico
- **Foco**: Ensino, gestao de turmas, criacao de conteudo
- **Densidade**: Media (equilibrio entre funcao e elegancia)
- **Elementos**: Turmas, progresso alunos, conteudos
- **Grid**: 2-3 colunas em desktop
- **Cores**: Gradiente sakura padrao, azuis para destaque
- **Interacoes**: Funcionais, claras, orientadas a tarefa
- **Tom visual**: Educativo, organizado

```
+---------------+---------------+---------------+
| 21 Alunos     | 3 Turmas      | 8 Conteudos   |
+---------------+---------------+---------------+
| Turma A: 8    | Progress: 85% | Criar Material|
| Turma B: 7    | Atividade     | Biblioteca    |
| Turma C: 6    | [+ Acoes]     | Avaliar       |
+---------------+---------------+---------------+
```

### 8.3 Admin - Poder Completo e Executivo
- **Foco**: Gestao total, metricas, controle do sistema
- **Densidade**: Alta (maxima informacao organizada)
- **Elementos**: Todas as metricas, acoes de sistema, relatorios, KPIs
- **Grid**: 3-4 colunas em desktop
- **Cores**: Gradiente roxo executivo com acentos fortes
- **Interacoes**: Precisas, informativas, orientadas a dados
- **Tom visual**: Executivo, profissional, corporativo

```
+--------+--------+--------+--------+--------+
| 21     | 4      | 30     | 24     | 24     |
| Alunos | Profs  | Aulas  | Instru | Awards |
+--------+--------+--------+--------+--------+
| Sistema Status   | Metrics   | Actions       |
| DB: OK           | +12%      | [Backup]      |
| Users: 25        | Response  | [Report]      |
+-----------------+-----------+---------------+
```

### 8.4 Tabela Comparativa de Roles

| Caracteristica | Aluno (Sakura) | Professor (Matcha) | Admin (Purple) |
|---------------|----------------|-------------------|----------------|
| **Tom** | Divertido, gamificado | Educativo, organizado | Executivo, profissional |
| **Cores** | Vibrantes, suaves | Calmas, confiaveis | Sobrias, autoritarias |
| **Animacoes** | Abundantes, ludicas | Moderadas, suaves | Minimas, discretas |
| **Elementos** | Badges, conquistas | Recursos didaticos | KPIs, metricas |
| **Linguagem** | Informal, motivadora | Tecnica, clara | Corporativa, objetiva |
| **Densidade** | Minima | Media | Alta |

---

## 9. Admin Executivo

A area administrativa possui uma identidade visual propria, projetada para gestao corporativa.

### 9.1 Conceito
Design executivo e profissional, usando roxo/purpura como cor principal, transmitindo autoridade, sofisticacao, confiabilidade e profissionalismo.

### 9.2 Classes Utilitarias Admin

#### Cards Executivos
```tsx
className="admin-card"
// bg-white rounded-xl shadow-sm border border-slate-200/80
// hover:shadow-lg hover:border-purple-200
```

#### Gradiente Executivo
```tsx
className="admin-gradient"
// bg-gradient-to-br from-purple-950 via-purple-900 to-indigo-950
```

#### Badges/Tags
```tsx
className="admin-badge"
// px-3 py-1.5 rounded-lg bg-purple-500/10 border border-purple-400/20 text-purple-200
```

#### Botoes Admin
```tsx
// Primario
className="admin-btn-primary"
// px-5 py-2.5 bg-purple-600 text-white rounded-xl shadow-lg

// Secundario
className="admin-btn-secondary"
// px-5 py-2.5 bg-white text-purple-900 rounded-xl shadow-lg
```

#### Inputs e Tabelas
```tsx
className="admin-input"       // Input profissional com foco roxo
className="admin-table"       // Tabela executiva
className="admin-scrollbar"   // Scrollbar com thumb roxo
```

### 9.3 Componentes React Admin

#### AdminPageLayout
```tsx
import AdminPageLayout from '../_components/AdminPageLayout';
import { Users } from 'lucide-react';

<AdminPageLayout
  title="Gestao de Alunos"
  subtitle="Visualize e gerencie todos os estudantes"
  icon={Users}
  badge="125 ativos"
  actions={
    <button className="admin-btn-primary">Nova Acao</button>
  }
>
  {/* Conteudo */}
</AdminPageLayout>
```

#### AdminCard
```tsx
import { AdminCard } from '../_components/AdminPageLayout';

<AdminCard>
  <h3>Titulo do Card</h3>
  <p>Conteudo...</p>
</AdminCard>
```

#### AdminSectionHeader
```tsx
import { AdminSectionHeader } from '../_components/AdminPageLayout';
import { BarChart } from 'lucide-react';

<AdminSectionHeader
  icon={BarChart}
  title="Estatisticas"
  action={<button>Ver Mais</button>}
/>
```

#### AdminGrid
```tsx
import { AdminGrid } from '../_components/AdminPageLayout';

<AdminGrid cols={3}>
  <AdminCard>Card 1</AdminCard>
  <AdminCard>Card 2</AdminCard>
  <AdminCard>Card 3</AdminCard>
</AdminGrid>
```

#### AdminEmptyState
```tsx
import { AdminEmptyState } from '../_components/AdminPageLayout';
import { Users } from 'lucide-react';

<AdminEmptyState
  icon={Users}
  title="Nenhum aluno encontrado"
  description="Comece adicionando seu primeiro aluno"
  action={<button className="admin-btn-primary">Adicionar</button>}
/>
```

### 9.4 Card de Metrica KPI
```tsx
<div className="admin-kpi-card">
  <div className="flex items-start justify-between mb-4">
    <div className="p-2.5 bg-purple-50 rounded-lg text-purple-600">
      <Icon className="w-5 h-5" strokeWidth={2} />
    </div>
    <span className="text-xs font-medium text-emerald-600 bg-emerald-50 px-2 py-1 rounded-md">
      +5%
    </span>
  </div>
  <h3 className="text-3xl font-bold text-slate-900 mb-1">125</h3>
  <p className="text-xs font-medium text-slate-500 uppercase tracking-wider">
    Total de Alunos
  </p>
</div>
```

### 9.5 Diretrizes do Design Admin
- Sem animacoes excessivas - apenas transicoes suaves e discretas
- Sem icones desnecessarios - apenas funcionais
- Sem cores chamativas - paleta sobria e profissional
- Icones com `strokeWidth={2}` para clareza
- Tamanhos de icone: `w-4 h-4` (pequeno), `w-5 h-5` (medio), `w-6 h-6` (grande)
- Cores neutras por padrao: `text-slate-400` ou `text-slate-600`
- Espacamento: padding `p-5` ou `p-6`, gap `gap-5` ou `gap-6`
- Bordas com opacidade: `border-slate-200/80`
- Sombras discretas: `shadow-sm` com `hover:shadow-lg`
- Priorizar clareza sobre estetica
- Pensar no que um CEO precisa ver

### 9.6 Checklist de Nova Pagina Admin
- Usa `AdminPageLayout` para estrutura
- Cores roxas da paleta executiva
- Classes utilitarias `admin-*` quando aplicavel
- Tipografia profissional (semibold, nao bold)
- Icones com `strokeWidth={2}`
- Espacamentos consistentes (5 ou 6)
- Bordas com opacidade (`border-slate-200/80`)
- Sem elementos desnecessarios
- Transicoes suaves (`transition-all`, `duration-300`)
- Status indicators limpos e discretos

---

## 10. Layout e Navegacao

### 10.1 Header Principal
```tsx
// Layout: Logo, Menu central, Profile/Actions
// Mobile: Hamburger menu, search toggle
// Estados: Scroll (background blur), Fixed position
// Logo circular com caractere japones
// Backdrop-blur para modernidade
```

### 10.2 Sidebar Inteligente
```tsx
// Visual: Collapsed/Expanded, role-based
// Navegacao: Active states, breadcrumbs
// Mobile: Overlay com backdrop
// Gradientes por role:
//   Admin: linear-gradient(to bottom, #8b5cf6, #7c3aed)
//   Professor: linear-gradient(to bottom, #0ea5e9, #0284c7)
//   Student: linear-gradient(to bottom, #10b981, #059669)
```

### 10.3 Breadcrumbs
```tsx
// Visual: Separadores japoneses, texto sutil
// Interacao: Hover highlight, click navigation
```

### 10.4 Estrutura Visual Padrao por Dashboard
1. **Header** com logo + caractere japones contextual
2. **Circulo central** de estatistica principal (aluno)
3. **Grid responsivo** para metricas (2x2 mobile, adaptavel desktop)
4. **Cards de acao** com gradientes unicos
5. **Footer** com filosofia integrada (opcional)

---

## 11. Responsividade

Abordagem mobile-first em todas as decisoes de layout.

### 11.1 Mobile (320px - 640px)
- Layout: Coluna unica, largura total
- Navegacao: Bottom tab bar + hamburger
- Cards: Largura total com padding reduzido
- Texto: Tamanhos otimizados para touch
- Espacamento: Reduzido mas respiravel

### 11.2 Tablet (641px - 1024px)
- Layout: 2 colunas em alguns casos
- Navegacao: Sidebar collapsed + top bar
- Cards: Grid 2x2 ou 3x1
- Conteudo: Aproveita espaco horizontal

### 11.3 Desktop (1025px+)
- Layout: Full sidebar + main content
- Navegacao: Expansao completa
- Cards: Grid flexivel baseado em conteudo
- Hover: Todos os estados ativos

### 11.4 Padroes Responsivos
```tsx
// Stack em mobile, grid em desktop
<div className="flex flex-col lg:grid lg:grid-cols-3 gap-6">
  {/* Conteudo */}
</div>

// Texto responsivo com japones
<h1 className="text-lg sm:text-xl lg:text-2xl font-zen">
  <span className="block sm:hidden">こんにちは</span>
  <span className="hidden sm:block">こんにちは、{name}さん！</span>
</h1>
```

---

## 12. Dark Mode e Temas

### 12.1 ThemeContext
```tsx
import { useTheme } from '@/contexts/ThemeContext'

const {
  isDark,
  currentRole,
  zenMode,
  toggleDark,
  setRole,
  toggleZen,
  getRoleColors
} = useTheme()

const colors = getRoleColors(currentRole)
```

### 12.2 Implementacao
- **Auto-detect**: System preference
- **Toggle**: Header switch elegante
- **Persistencia**: LocalStorage + cookie
- **Transicao**: Smooth color interpolation

### 12.3 Personalizacao por Role
```css
/* Admin Theme */
accent-color: #8b5cf6
sidebar-gradient: linear-gradient(to bottom, #8b5cf6, #7c3aed)
dashboard-style: executive

/* Professor Theme */
accent-color: #0ea5e9
sidebar-gradient: linear-gradient(to bottom, #0ea5e9, #0284c7)
dashboard-style: educational

/* Student Theme */
accent-color: #10b981
sidebar-gradient: linear-gradient(to bottom, #10b981, #059669)
dashboard-style: gamified
```

---

## 13. Animacoes e Micro-Interacoes

### 13.1 Animacoes Zen CSS
```css
/* Respiracao zen */
.animate-zen-breath {
  animation: zenBreath 4s ease-in-out infinite;
}

/* Flutuar como sakura */
.animate-sakura-float {
  animation: sakuraFloat 6s ease-in-out infinite;
}

/* Bounce lento */
.animate-bounce-slow {
  animation: bounce 2s infinite;
}

/* Fade in suave */
.animate-fade-in {
  animation: fadeIn 0.5s ease-in-out;
}
```

### 13.2 Interacoes de Botao
```css
/* Hover: Scale 1.02, shadow increase */
/* Active: Scale 0.98, brief */
/* Loading: Spinner + disabled state */
/* Success: Checkmark animation */
```

### 13.3 Animacoes de Card
```css
/* Hover: translateY(-4px), shadow increase */
/* Click: Scale(0.95) entao bounce back */
/* Load: Stagger animation (0.1s delay each) */
```

### 13.4 Transicoes de Pagina
```css
/* Route change: Fade out -> Fade in */
/* Modal: Backdrop fade + modal slide up */
/* Mobile nav: Slide from left */
```

### 13.5 Feedback Visual
```css
/* Success: Green checkmark + bounce */
/* Error: Red X + shake */
/* Loading: Skeleton loaders */
/* Progress: Smooth bar fills */
```

### 13.6 Animacoes Consistentes por Role
| Tipo | Aluno | Professor | Admin |
|------|-------|-----------|-------|
| Hover | -translate-y-1, scale-110 | -translate-y-0.5, scale-105 | shadow-lg apenas |
| Elementos | Bounce com delays | Fade suave | Transicao minima |
| Feedback | Particulas, celebracoes | Visual confirmacao | Indicador discreto |

### 13.7 Performance de Animacoes
- Hardware acceleration com `transform3d`
- Respeitar `prefers-reduced-motion`
- Target de 60fps em todas as animacoes
- Animacoes cancelaveis quando necessario

---

## 14. Gamificacao Visual

### 14.1 Zen Circle Progress
```tsx
// Circulo com gradiente, percentual central
// Animacao smooth fill
// Cores baseadas no progresso (0-100%)
```

### 14.2 Level Bar
```tsx
// XP atual / proximo level
// Animacao de fill + celebracao level up
// Badge do level atual, barra de progresso, proximo level
```

### 14.3 Streak Counter
```tsx
// Numero de dias consecutivos
// Estados: Active streak, broken streak
// Mensagens encorajadoras
```

### 14.4 Achievement Badge
```tsx
// Icone + titulo + descricao
// Estados: Locked (grayscale), Unlocked (colorido)
// Animacao: Unlock particle effect
```

### 14.5 Points Display
```tsx
// Contador animado de pontos (CountUp)
// Pulse on increment
// Mostrar ganhos recentes
```

### 14.6 Cores por Categoria de Stats
- Pontos: `amber` (dourado)
- Streak: `red` (vermelho tradicional)
- Aulas: `blue` (azul zen)
- Conquistas: `emerald` (verde harmonia)

---

## 15. Internacionalizacao

### 15.1 Uso Basico
```tsx
import { useTranslation } from '@/hooks/useTranslation'

const { t, currentLang, switchLanguage } = useTranslation()

<h1>{t('dashboard.welcome')}</h1>

<button onClick={() => switchLanguage('ja')}>
  {currentLang === 'ja' ? '日本語' : 'Portugues'}
</button>
```

### 15.2 Titulos por Role em Japones
```typescript
const roleTitles = {
  student: '学生',     // Gakusei
  professor: '先生',   // Sensei
  admin: '管理者'      // Kanrisha
}
```

---

## 16. Performance e Otimizacao

### 16.1 Lazy Loading
```tsx
import { Suspense } from 'react'

<Suspense fallback={<SkeletonLoader />}>
  <ComponentePesado />
</Suspense>
```

### 16.2 Code Splitting
Componentes pesados carregados sob demanda:
- QRPresenceSystem
- RealTimeCollaboration
- ComponentShowcase
- Dashboards especificos

### 16.3 Imagens e Assets
- Lazy loading para imagens nao criticas
- Formatos WebP/AVIF otimizados
- Placeholders blur ate carregar
- Sprite icons para icones frequentes

### 16.4 Bundle Optimization
- Code splitting por rota e componente
- Lazy imports para componentes grandes
- Tree shaking para remover codigo nao usado
- Preloading de recursos criticos

### 16.5 Metricas Alvo
- **Time to Interactive**: < 2 segundos
- **First Meaningful Paint**: < 1.5 segundos
- **Lighthouse Mobile**: 90+
- **Task Success Rate**: 95%+

---

## 17. Acessibilidade

### 17.1 Principios
- WCAG AA compliance como alvo
- Labels e ARIA em todos os elementos interativos
- Contraste adequado em light e dark mode
- Navegacao completa por teclado

### 17.2 Exemplos
```tsx
<Button
  aria-label="Confirmar presenca na aula"
  onClick={handleConfirm}
>
  確認 Confirmar
</Button>

// Contraste para dark mode
className={`${isDark ? 'text-white' : 'text-gray-900'}`}
```

### 17.3 States e Feedback
- **Loading**: Skeleton loaders para listas/cards, spinners para acoes rapidas
- **Empty**: Ilustracao zen + mensagem + call-to-action + primeiros passos
- **Error**: Mensagem clara, sugestao de solucao, botao retry, fallback graceful
- **Success**: Confirmacao visual imediata, mensagem positiva, proximos passos

---

## 18. Estrutura de Arquivos

```
src/
├── components/
│   ├── ui/                        # Componentes base (Card, Button, Input)
│   └── nipo/                      # Componentes Nipo (Logo, Progress, Achievement)
├── shared/components/oriental/
│   ├── OrientalComponents.jsx     # Componentes orientais base
│   ├── OrientalTheme.js           # Paletas e constantes
│   └── OrientalAnimations.css     # Animacoes unificadas
├── contexts/
│   └── ThemeContext.tsx            # Contexto de tema
├── hooks/
│   └── useTranslation.ts          # Hook de internacionalizacao
├── styles/
│   └── nipo-tokens.css            # Design tokens
├── locales/                       # Arquivos i18n
├── features/
│   ├── alunos/pages/              # Dashboard aluno
│   ├── professores/pages/         # Dashboard professor
│   └── admin/
│       ├── pages/                 # Dashboard admin
│       └── _components/
│           ├── AdminPageLayout.tsx # Layout padrao admin
│           └── AdminHeader.tsx    # Header global admin
└── test-utils/                    # Utilitarios de teste
```

### Recursos de Referencia
- **ComponentShowcase**: `/showcase` - Demonstracao completa de componentes
- **Design Tokens**: `src/styles/nipo-tokens.css`
- **Dashboard Admin**: `app/(protected)/admin/page.tsx`
- **Lista Alunos Admin**: `app/(protected)/admin/alunos/page.tsx`
- **Header Admin**: `app/(protected)/admin/_components/AdminHeader.tsx`
