# Sistema de Gamificacao - Nipo School

## Visao Geral

O sistema de gamificacao do Nipo School foi desenvolvido para aumentar o engajamento dos alunos atraves de:

- **Pontos**: Ganhe pontos por completar aulas, submeter evidencias, etc.
- **Niveis**: Progressao atraves de 7 niveis diferentes
- **Achievements (Badges)**: Conquiste badges especiais por marcos importantes
- **Streaks**: Mantenha sequencias de atividades para recompensas extras

O sistema utiliza as tabelas **ja existentes** no banco de dados Supabase. Uma decisao de refatoracao determinou que **nao devem ser criadas novas tabelas** (`gamification_*`), e sim aproveitadas as tabelas nativas do projeto.

---

## Decisao de Arquitetura: Usar Tabelas Existentes

### Contexto

Uma implementacao inicial criou 4 novas tabelas (`gamification_usuarios`, `gamification_pontos`, `gamification_badges`, `gamification_conquistas`). Porem, o banco de dados ja possuia uma estrutura completa de gamificacao.

### Decisao

**Adaptar ao sistema existente**, nao criar tabelas duplicadas.

**Motivos:**

1. **Sem duplicacao** - Dados consistentes em um unico lugar
2. **Ja testado** - Sistema provavelmente em uso por outras partes da aplicacao
3. **Integracao** - Ja integrado com outras tabelas do projeto
4. **Menos codigo** - Aproveitar estrutura existente
5. **Sem conflito de dados** - Evitar dois sistemas de pontos competindo

### Mapeamento: Tabelas Antigas para Existentes

| Tabela Antiga (REMOVIDA)       | Tabela Existente (USAR)  |
|-------------------------------|--------------------------|
| `gamification_usuarios`       | `user_progress`          |
| `gamification_pontos`         | `user_points_log`        |
| `gamification_badges`         | `achievements` + `user_achievements` |
| `gamification_conquistas`     | `achievements` + `user_achievements` |

### Mapeamento de Tipos TypeScript

| Tipo Antigo (REMOVIDO)        | Tipo Atual               |
|-------------------------------|--------------------------|
| `GamificationUsuario`         | `UserProgress`           |
| `GamificationPonto`           | `UserPointsLog`          |
| `GamificationBadge`           | `Achievement`            |
| `GamificationConquista`       | `UserAchievement` (com join de `Achievement`) |

**IMPORTANTE:** O script SQL `database/migrations/create-gamification-system.sql` deve ser **ignorado** pois cria tabelas duplicadas.

---

## Estrutura do Banco de Dados

### Tabela: `user_progress` (Perfil de Progresso)

```sql
- id (uuid)
- user_id (uuid)
- total_points (integer)
- level (integer)
- badges_earned (integer)
- current_streak (integer)
- longest_streak (integer)
- lessons_completed (integer)
- achievements_unlocked (integer)
- updated_at (timestamp)
- created_at (timestamp)
```

### Tabela: `user_points_log` (Historico de Pontos)

```sql
- id (uuid)
- user_id (uuid)
- aula_id (uuid, nullable)
- points (integer)
- reason (text)
- created_at (timestamp)
```

### Tabela: `achievements` (Catalogo de Achievements)

```sql
- id (uuid)
- name (text, unico)
- description (text)
- badge_icon (text) -- emoji ou classe CSS
- badge_color (text) -- hexadecimal
- points_reward (integer)
- category (text)
- requirement_type (text)
- requirement_value (integer)
- is_active (boolean)
- created_at (timestamp)
```

### Tabela: `user_achievements` (Achievements Conquistados)

```sql
- id (uuid)
- user_id (uuid)
- achievement_id (uuid)
- earned_at (timestamp)
```

### Tabela: `achievements_progress` (Progresso de Achievements - Opcional)

```sql
- id (uuid)
- user_id (uuid)
- achievement_id (uuid)
- current_progress (integer)
- target_progress (integer)
- is_completed (boolean)
- completed_at (timestamp, nullable)
- metadata (jsonb)
- created_at (timestamp)
- updated_at (timestamp)
```

### Tabela: `achievements_educacionais` (Conquistas Educacionais)

Tabela adicional existente no banco para conquistas especificas do contexto educacional.

---

## Tipos TypeScript

Arquivo: `src/types/gamification.ts`

```typescript
export interface UserProgress {
  id: string;
  user_id: string;
  total_points: number;
  level: number;
  badges_earned: number;
  current_streak: number;
  longest_streak: number;
  lessons_completed: number;
  achievements_unlocked: number;
  updated_at: string;
  created_at: string;
}

export interface UserPointsLog {
  id: string;
  user_id: string;
  aula_id: string | null;
  points: number;
  reason: string | null;
  created_at: string;
}

export interface Achievement {
  id: string;
  name: string;
  description: string | null;
  badge_icon: string | null;
  badge_color: string | null;
  points_reward: number;
  category: string | null;
  requirement_type: string | null;
  requirement_value: number | null;
  is_active: boolean;
  created_at: string;
}

export interface UserAchievement {
  id: string;
  user_id: string;
  achievement_id: string;
  earned_at: string;
  achievement?: Achievement; // Populado via JOIN
}
```

---

## Sistema de Niveis

7 niveis implementados com cores associadas:

| Nivel | Nome          | Pontos Minimos | Cor       |
|-------|---------------|----------------|-----------|
| 1     | Iniciante     | 0              | `#9CA3AF` (Cinza) |
| 2     | Aprendiz      | 100            | `#84CC16` (Verde Lima) |
| 3     | Praticante    | 250            | `#22D3EE` (Ciano) |
| 4     | Experiente    | 500            | `#A78BFA` (Roxo) |
| 5     | Mestre        | 1000           | `#F59E0B` (Laranja) |
| 6     | Grande Mestre | 2000           | `#EF4444` (Vermelho) |
| 7     | Lenda         | 5000           | `#EC4899` (Rosa) |

```typescript
const NIVEIS = [
  { nivel: 1, nome: 'Iniciante', pontosMinimos: 0, cor: '#9CA3AF' },
  { nivel: 2, nome: 'Aprendiz', pontosMinimos: 100, cor: '#84CC16' },
  { nivel: 3, nome: 'Praticante', pontosMinimos: 250, cor: '#22D3EE' },
  { nivel: 4, nome: 'Experiente', pontosMinimos: 500, cor: '#A78BFA' },
  { nivel: 5, nome: 'Mestre', pontosMinimos: 1000, cor: '#F59E0B' },
  { nivel: 6, nome: 'Grande Mestre', pontosMinimos: 2000, cor: '#EF4444' },
  { nivel: 7, nome: 'Lenda', pontosMinimos: 5000, cor: '#EC4899' },
];
```

---

## Sistema de Pontos

### Pontos por Acao

| Acao                      | Pontos | Fonte/Reason     |
|---------------------------|--------|------------------|
| Completar Aula            | 50     | aula concluida   |
| Submeter Evidencia        | 30     | evidencia        |
| Completar Autoavaliacao   | 20     | autoavaliacao    |
| Completar Portfolio       | 100    | portfolio        |
| Ganhar Achievement/Badge  | 50     | achievement      |

### Conquistas Automaticas por Pontos

O sistema verifica e concede automaticamente estas conquistas:

| Pontos Necessarios | Nome da Conquista    | Bonus        |
|--------------------|-----------------------|-------------|
| 100                | Primeiros Passos      | +10 pts     |
| 500                | Caminhante Dedicado   | +50 pts     |
| 1000               | Mil Pontos de Luz     | +100 pts    |
| 2500               | Estrela Brilhante     | +250 pts    |
| 5000               | Mestre dos Pontos     | +500 pts    |

---

## Queries (Leitura)

Arquivo: `src/lib/supabase/queries/gamificacao-real.ts`

### Funcoes Disponiveis

| Funcao                        | Descricao                                    |
|-------------------------------|----------------------------------------------|
| `getUserProgress()`           | Busca perfil de progresso do usuario          |
| `getUserPointsHistory()`      | Busca historico de pontos                     |
| `getUserAchievements()`       | Busca achievements do usuario (com JOIN)      |
| `getAllAchievements()`        | Busca todos os achievements disponiveis       |
| `getGamificationStats()`     | Retorna estatisticas completas                |
| `calculateNextLevelProgress()`| Calcula progresso para proximo nivel          |

### Exemplo de Uso (Server Component)

```typescript
import {
  getGamificationStats,
  calculateNextLevelProgress
} from '@/src/lib/supabase/queries/gamificacao-real';

// Em um Server Component
const stats = await getGamificationStats();
const progresso = calculateNextLevelProgress(stats.progress?.total_points ?? 0);
```

### Exemplo de Query Direta

```typescript
import { getUserProgress } from '@/src/lib/supabase/queries/gamificacao-real';

const progress = await getUserProgress('uuid-do-usuario');
```

---

## Mutations (Escrita)

Arquivo: `src/lib/supabase/mutations/gamificacao-real.ts`

### Funcoes Disponiveis

| Funcao                            | Descricao                              |
|-----------------------------------|----------------------------------------|
| `createOrGetUserProgress()`       | Cria ou obtem perfil de progresso      |
| `addUserPoints()`                 | Adiciona pontos ao usuario             |
| `grantAchievement()`             | Concede achievement ao usuario         |
| `incrementLessonsCompleted()`     | Incrementa contador de aulas           |
| `pointsForCompletedLesson()`     | Pontos por aula concluida (50 pts)     |
| `pointsForSubmittedEvidence()`   | Pontos por evidencia (30 pts)          |
| `pointsForCompletedSelfAssessment()` | Pontos por autoavaliacao (20 pts) |
| `pointsForCompletedPortfolio()`  | Pontos por portfolio (100 pts)         |

### Exemplo: Adicionar Pontos

```typescript
import { addUserPoints } from '@/src/lib/supabase/mutations/gamificacao-real';

const result = await addUserPoints({
  userId: 'uuid-do-usuario',
  points: 50,
  reason: 'Aula concluida',
  aulaId: 'uuid-da-aula' // opcional
});
```

### Exemplo: Conceder Achievement

```typescript
import { grantAchievement } from '@/src/lib/supabase/mutations/gamificacao-real';

const result = await grantAchievement({
  userId: 'uuid-do-usuario',
  achievementId: 'uuid-do-achievement'
});
```

---

## Server Actions

Arquivo: `app/actions/gamification.ts`

### Actions Disponiveis

| Action                                      | Descricao                    |
|---------------------------------------------|------------------------------|
| `addPointsAction()`                         | Adiciona pontos              |
| `grantAchievementAction()`                  | Concede achievement          |
| `awardPointsForCompletedLessonAction()`     | Pontos por aula concluida    |
| `awardPointsForSubmittedEvidenceAction()`   | Pontos por evidencia         |
| `awardPointsForCompletedSelfAssessmentAction()` | Pontos por autoavaliacao |
| `awardPointsForCompletedPortfolioAction()`  | Pontos por portfolio         |

### Exemplo: Pontuar Aula Concluida

```typescript
import { awardPointsForCompletedLessonAction } from '@/app/actions/gamification';

// Quando aluno completa uma aula
await awardPointsForCompletedLessonAction(aulaId);
```

---

## Hook React (Client-Side)

Arquivo: `src/hooks/useGamification.ts`

```typescript
'use client';

import { useGamification } from '@/src/hooks/useGamification';

function MyComponent() {
  const { progress, pointsHistory, achievements, loading, error, refresh } = useGamification();

  if (loading) return <div>Carregando...</div>;

  return (
    <div>
      <p>Nivel: {progress?.level}</p>
      <p>Pontos: {progress?.total_points}</p>
    </div>
  );
}
```

### Retorno do Hook

| Campo            | Tipo                                                | Descricao                  |
|------------------|-----------------------------------------------------|----------------------------|
| `progress`       | `UserProgress \| null`                              | Perfil de progresso        |
| `pointsHistory`  | `UserPointsLog[]`                                   | Historico de pontos        |
| `achievements`   | `(UserAchievement & { achievement: Achievement })[]`| Achievements conquistados  |
| `loading`        | `boolean`                                           | Estado de carregamento     |
| `error`          | `string \| null`                                    | Mensagem de erro           |
| `refresh`        | `() => void`                                        | Funcao para recarregar     |

---

## Componentes React

### GamificationPanel (Pagina Completa)

Arquivo: `src/components/gamification/GamificationPanel.tsx`

Exibicao completa do perfil de gamificacao, incluindo historico de pontos, achievements conquistados, conquistas recentes e barra de progresso para proximo nivel.

```tsx
import { GamificationPanel } from '@/src/components/gamification/GamificationPanel';

<GamificationPanel
  progress={progress}
  pointsHistory={pointsHistory}
  achievements={achievements}
  nextLevelProgress={{ progress: 0.75, pointsNeeded: 500, pointsRemaining: 125 }}
/>
```

#### Props

| Prop                | Tipo                                                 |
|---------------------|------------------------------------------------------|
| `progress`          | `UserProgress \| null`                               |
| `pointsHistory`     | `UserPointsLog[]`                                    |
| `achievements`      | `(UserAchievement & { achievement: Achievement })[]` |
| `nextLevelProgress` | `{ progress, pointsNeeded, pointsRemaining }` (opcional) |

### GamificationWidget (Dashboard)

Arquivo: `src/components/gamification/GamificationWidget.tsx`

Widget compacto para o dashboard do aluno. Mostra nivel atual com cor, progresso visual, estatisticas rapidas e link para a pagina completa de gamificacao.

```tsx
import { GamificationWidget } from '@/src/components/gamification/GamificationWidget';

<GamificationWidget
  progress={progress}
  nextLevelProgress={{ progress: 0.75, pointsRemaining: 125 }}
/>
```

#### Props

| Prop                | Tipo                                         |
|---------------------|----------------------------------------------|
| `progress`          | `UserProgress \| null`                       |
| `nextLevelProgress` | `{ progress, pointsRemaining }` (opcional)   |

---

## Pagina de Gamificacao

Arquivo: `app/(protected)/alunos/gamificacao/page.tsx`

Rota: `/alunos/gamificacao`

Pagina completa que utiliza `getGamificationStats()` e `calculateNextLevelProgress()` para renderizar o `GamificationPanel`.

```typescript
// app/(protected)/alunos/gamificacao/page.tsx
import { getGamificationStats, calculateNextLevelProgress } from '@/src/lib/supabase/queries/gamificacao-real';
import { GamificationPanel } from '@/src/components/gamification/GamificationPanel';

export default async function GamificacaoPage() {
  const stats = await getGamificationStats();
  const progresso = stats.progress
    ? calculateNextLevelProgress(stats.progress.total_points)
    : undefined;

  return (
    <GamificationPanel
      progress={stats.progress}
      pointsHistory={stats.pointsHistory}
      achievements={stats.achievements}
      nextLevelProgress={progresso}
    />
  );
}
```

---

## Integracao no Dashboard do Aluno

Arquivo a editar: `app/(protected)/alunos/dashboard/page.tsx`

```typescript
import { getGamificationStats, calculateNextLevelProgress } from '@/src/lib/supabase/queries/gamificacao-real';
import { GamificationWidget } from '@/src/components/gamification/GamificationWidget';

export default async function DashboardPage() {
  const stats = await getGamificationStats();
  const progresso = stats.progress
    ? calculateNextLevelProgress(stats.progress.total_points)
    : undefined;

  return (
    <div className="grid gap-6">
      {/* Outros componentes do dashboard */}

      <GamificationWidget
        progress={stats.progress}
        nextLevelProgress={progresso}
      />
    </div>
  );
}
```

---

## Casos de Uso Praticos

### 1. Dar Pontos Quando Aluno Completa Aula

```typescript
// app/(protected)/alunos/aulas/[id]/concluir/route.ts
import { awardPointsForCompletedLessonAction } from '@/app/actions/gamification';

export async function POST(request: Request) {
  const { aulaId } = await request.json();

  // Marcar aula como concluida (seu codigo)
  // ...

  // Adicionar pontos
  await awardPointsForCompletedLessonAction(aulaId);

  return Response.json({ success: true });
}
```

### 2. Botao "Concluir Aula" com Feedback de Pontos

```typescript
'use client';

import { awardPointsForCompletedLessonAction } from '@/app/actions/gamification';
import { Button } from '@/components/ui/button';
import { useRouter } from 'next/navigation';
import { toast } from 'sonner';

export function ConcluirAulaButton({ aulaId }: { aulaId: string }) {
  const router = useRouter();

  async function handleConcluir() {
    const resultado = await awardPointsForCompletedLessonAction(aulaId);

    if (resultado.sucesso) {
      toast.success('Aula concluida! +50 pontos');
      router.refresh();
    } else {
      toast.error('Erro ao concluir aula');
    }
  }

  return (
    <Button onClick={handleConcluir}>
      Concluir Aula
    </Button>
  );
}
```

### 3. Link no Menu de Navegacao do Aluno

```tsx
<Link href="/alunos/gamificacao">
  <Trophy className="w-4 h-4" />
  Gamificacao
</Link>
```

---

## Seguranca (RLS)

Todas as tabelas possuem Row Level Security habilitado:

- Usuarios so veem seus proprios dados (`user_progress`, `user_points_log`, `user_achievements`)
- Achievements sao publicos para leitura (tabela `achievements`)
- Insercoes sao controladas pelo sistema
- Service role pode fazer operacoes completas
- Sem possibilidade de fraude de pontos

---

## Notas Importantes

1. **NAO criar novas tabelas** - Usar sempre as existentes (`user_progress`, `user_points_log`, `achievements`, `user_achievements`)
2. **Achievements vs Badges** - No banco, "achievements" funcionam como "badges". Nao existe tabela separada de badges.
3. **user_achievements** - E a tabela de relacionamento N:N entre usuarios e achievements
4. **points_reward** - Campo em `achievements` define quantos pontos o achievement vale como recompensa
5. **achievements_progress** - Tabela opcional para tracking de progresso de achievements complexos
6. **Script SQL legado** - O arquivo `database/migrations/create-gamification-system.sql` NAO deve ser executado pois cria tabelas duplicadas

---

## Arquivos do Sistema

```
src/
  types/
    gamification.ts                        # Tipos TypeScript (UserProgress, Achievement, etc.)

  lib/supabase/
    queries/
      gamificacao-real.ts                  # Queries de leitura
    mutations/
      gamificacao-real.ts                  # Mutations de escrita

  components/gamification/
    GamificationPanel.tsx                  # Painel completo (pagina)
    GamificationWidget.tsx                 # Widget compacto (dashboard)

  hooks/
    useGamification.ts                     # Hook para Client Components

app/
  actions/
    gamification.ts                        # Server Actions

  (protected)/alunos/
    gamificacao/
      page.tsx                             # Pagina de gamificacao (/alunos/gamificacao)
```

---

## Status da Implementacao

### Concluido

- [x] Tipos TypeScript refatorados para tabelas existentes
- [x] Queries de leitura refatoradas
- [x] Mutations de escrita refatoradas
- [x] Componente GamificationPanel atualizado
- [x] Componente GamificationWidget atualizado
- [x] Hook useGamification refatorado
- [x] Server Actions atualizadas
- [x] Pagina de gamificacao atualizada

### Pendente

- [ ] Popular tabela `achievements` com conquistas padrao
- [ ] Criar triggers para atualizar `user_progress` automaticamente
- [ ] Implementar sistema de badges especiais
- [ ] Adicionar verificacao automatica de achievements
- [ ] Criar dashboard de administracao de achievements
- [ ] Implementar notificacoes de conquistas
- [ ] Adicionar widget no dashboard do aluno
- [ ] Integrar com conclusao de aulas (chamar actions nos fluxos existentes)
- [ ] Integrar com submissao de evidencias
- [ ] Adicionar link no menu de navegacao
- [ ] Testar integracao completa end-to-end
- [ ] Implementar ranking/leaderboard (opcional)

---

## Troubleshooting

### "Tabelas nao encontradas"
Verificar se as tabelas `user_progress`, `user_points_log`, `achievements` e `user_achievements` existem no Supabase. Essas tabelas ja devem existir no banco -- NAO execute o script SQL antigo de migracao.

### "Erro de permissao"
Verificar se o RLS esta configurado corretamente para as tabelas existentes.

### "Pontos nao atualizando"
Verificar se `revalidatePath()` esta sendo chamado nas Server Actions apos mutacoes.

### "Perfil nao criado automaticamente"
Chamar `createOrGetUserProgress(userId)` ao fazer login do usuario para garantir que o registro exista em `user_progress`.

---

Data da ultima consolidacao: 27 de fevereiro de 2026
