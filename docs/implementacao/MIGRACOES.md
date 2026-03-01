# Migracoes - Nipo School

**Ultima atualizacao:** Janeiro 2025
**Consolidado de:** Plano de migracoes de banco + Migracao de arquitetura frontend

Este documento cobre dois tipos de migracao realizados no projeto:
1. **Migracoes de Banco de Dados** - Scripts SQL para seguranca, validacao e performance
2. **Migracao de Arquitetura Frontend** - Reorganizacao de `features/` para `areas/`

---

## Parte 1: Migracoes de Banco de Dados

### 1.1 Resumo dos Problemas Identificados

| Categoria | Quantidade | Prioridade |
|-----------|-----------|------------|
| RLS Desabilitado | 37 tabelas | Critico |
| Indices Faltantes (FK) | 56 | Alto |
| Campos sem Validacao (email) | 5 | Alto |
| Status sem ENUM | 22 tabelas | Alto |
| Tabelas sem Timestamps | 31 tabelas | Alto |
| Campos sem Limites | 4 campos | Medio |
| Soft Delete Faltante | 1 tabela | Medio |
| **Total de problemas** | **171** | |

### 1.2 Scripts de Migracao Criados

#### Fase 1 - Seguranca (Critico) - 5 migracoes

| # | Arquivo | Descricao | Impacto |
|---|---------|-----------|---------|
| 01 | `01_habilitar_rls_tabelas_criticas.sql` | Habilita RLS em 37 tabelas | 37 tabelas |
| 02 | `02_criar_politicas_rls_gamificacao.sql` | Politicas para Alpha/Gamificacao | 13 tabelas |
| 03 | `03_criar_politicas_rls_forum.sql` | Politicas para forum | 4 tabelas |
| 04 | `04_criar_politicas_rls_instrumentos.sql` | Politicas para instrumentos | 3 tabelas |
| 05 | `05_criar_politicas_rls_avaliacoes.sql` | Politicas para avaliacoes | 17 tabelas |

**Total:** ~60 politicas RLS criadas

**ATENCAO:** Apos executar a migracao 01, todas as queries podem falhar ate que as politicas RLS sejam criadas. Execute as 5 migracoes sem interrupcao.

#### Fase 2 - Validacao (Alto) - 3 migracoes

| # | Arquivo | Descricao | Impacto |
|---|---------|-----------|---------|
| 06 | `06_adicionar_validacao_emails.sql` | CHECK constraints para emails | 5 campos |
| 07 | `07_criar_enums_status.sql` | 10 tipos ENUM para status | 22+ tabelas |
| 08 | `08_adicionar_validacao_numeros.sql` | CHECK para notas e anos | 4 campos |

#### Fase 3 - Auditoria (Alto) - 3 migracoes

| # | Arquivo | Descricao | Impacto |
|---|---------|-----------|---------|
| 09 | `09_adicionar_timestamps_parte1.sql` | created_at/updated_at | 15 tabelas |
| 10 | `10_adicionar_timestamps_parte2.sql` | created_at/updated_at | 16 tabelas |
| 11 | `11_adicionar_soft_delete.sql` | deleted_at + funcoes auxiliares | 5 tabelas |

#### Fase 4 - Performance (Alto) - 4 migracoes (pendentes)

| # | Arquivo | Descricao | Impacto |
|---|---------|-----------|---------|
| 12 | `12_criar_indices_fk_parte1.sql` | Indices em 28 FKs | 50% das FKs |
| 13 | `13_criar_indices_fk_parte2.sql` | Indices em 28 FKs | 50% das FKs |
| 14 | `14_criar_indices_busca_parte1.sql` | Indices em nome/email | 29 campos |
| 15 | `15_criar_indices_busca_parte2.sql` | Indices em titulo/slug | 29 campos |

**Beneficio esperado:** Reducao de 60-80% no tempo de queries JOIN

#### Fase 5 - Triggers (Medio) - 2 migracoes (pendentes)

| # | Arquivo | Descricao |
|---|---------|-----------|
| 16 | `16_criar_triggers_updated_at.sql` | Triggers automaticos complementares |
| 17 | `17_criar_triggers_auditoria.sql` | Triggers para audit_activities |

### 1.3 Status de Execucao

| Categoria | Total | Scripts Criados | Executado | % |
|-----------|-------|----------------|-----------|---|
| Seguranca (RLS) | 37 tabelas | 5 scripts | Pendente | Scripts prontos |
| Validacao Email | 5 campos | 1 script | Pendente | Script pronto |
| ENUMs Status | 22 tabelas | 1 script | Pendente | Script pronto |
| Validacao Numerica | 4 campos | 1 script | Pendente | Script pronto |
| Timestamps | 31 tabelas | 2 scripts | Pendente | Scripts prontos |
| Soft Delete | 5 tabelas | 1 script | Pendente | Script pronto |
| Indices FK | 56 FKs | 0 | Pendente | Nao criado |
| Indices Busca | 58 campos | 0 | Pendente | Nao criado |

**Resumo:** 11 de 17 scripts criados (65%). Fases 1-3 prontas para execucao. Fases 4-5 pendentes de criacao.

### 1.4 Ordem de Execucao

```bash
# PRE-REQUISITO: Backup obrigatorio
pg_dump -h localhost -U postgres -d nipo_school -F c -f backup_pre_migracoes.dump

# Fase 1 - Seguranca (executar TODAS em sequencia)
psql -f 01_habilitar_rls_tabelas_criticas.sql
psql -f 02_criar_politicas_rls_gamificacao.sql
psql -f 03_criar_politicas_rls_forum.sql
psql -f 04_criar_politicas_rls_instrumentos.sql
psql -f 05_criar_politicas_rls_avaliacoes.sql

# Fase 2 - Validacao
psql -f 06_adicionar_validacao_emails.sql
psql -f 07_criar_enums_status.sql
psql -f 08_adicionar_validacao_numeros.sql

# Fase 3 - Auditoria
psql -f 09_adicionar_timestamps_parte1.sql
psql -f 10_adicionar_timestamps_parte2.sql
psql -f 11_adicionar_soft_delete.sql

# Fase 4 - Performance (quando scripts forem criados)
psql -f 12_criar_indices_fk_parte1.sql
psql -f 13_criar_indices_fk_parte2.sql
psql -f 14_criar_indices_busca_parte1.sql
psql -f 15_criar_indices_busca_parte2.sql

# Fase 5 - Triggers (quando scripts forem criados)
psql -f 16_criar_triggers_updated_at.sql
psql -f 17_criar_triggers_auditoria.sql
```

### 1.5 Cuidados Importantes

**Antes de executar:**
- Fazer backup completo do banco
- Executar primeiro em ambiente de desenvolvimento
- Testar a aplicacao completamente apos cada fase

**Riscos conhecidos:**
- Migracao 06 pode falhar se houver emails invalidos no banco
- Migracao 07 requer padronizacao de valores de status existentes
- Migracao 08 pode falhar se houver notas/anos fora do range
- RLS pode impactar performance inicial das queries

**Rollback:**
```bash
# Restauracao completa
pg_restore -h localhost -U postgres -d nipo_school --clean --if-exists backup_pre_migracoes.dump
```

### 1.6 Verificacao Pos-Migracao

```sql
-- Verificar RLS habilitado
SELECT COUNT(*) FROM pg_tables WHERE schemaname = 'public' AND rowsecurity = false;
-- Esperado: 0

-- Verificar politicas criadas
SELECT COUNT(DISTINCT tablename) FROM pg_policies WHERE schemaname = 'public';

-- Verificar timestamps
SELECT COUNT(DISTINCT table_name) FROM information_schema.columns
WHERE table_schema = 'public' AND column_name = 'created_at';

-- Verificar ENUMs
SELECT typname FROM pg_type
WHERE typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public')
AND typtype = 'e';
```

---

## Parte 2: Migracao de Arquitetura Frontend

### 2.1 Visao Geral

A estrutura do frontend foi reorganizada de `features/` para `areas/`, adotando o modelo de areas isoladas com protecao por AreaGuard.

**Data:** Dezembro 2025
**Total migrado:** 47 arquivos (31 paginas + 9 componentes + 7 hooks)

### 2.2 Paginas Migradas

#### Admin (11 paginas)

| Origem | Destino |
|--------|---------|
| `features/admin/pages/AdminDashboard.tsx` | `areas/admin/dashboard/page.tsx` |
| `features/admin/pages/AulasKanbanPage.tsx` | `areas/admin/aulas/page.tsx` |
| `features/admin/pages/ProfessoresListPage.tsx` | `areas/admin/professores/page.tsx` |
| `features/admin/pages/AlunosListPage.tsx` | `areas/admin/alunos/page.tsx` |
| `features/admin/pages/QRManagerPage.tsx` | `areas/admin/qr/page.tsx` |
| + 6 paginas adicionais (lista, detail, edit, etc.) | Respectivos modulos |

#### Professores (7 paginas)

| Origem | Destino |
|--------|---------|
| `features/professores/pages/ProfessorDashboard.tsx` | `areas/professores/dashboard/page.tsx` |
| `features/professores/pages/TurmasPage.tsx` | `areas/professores/aulas/page.tsx` |
| `features/professores/pages/ConteudosPage.tsx` | `areas/professores/alunos/page.tsx` |
| + 4 paginas adicionais | Respectivos modulos |

#### Alunos (13 paginas)

| Origem | Destino |
|--------|---------|
| `features/alunos/pages/AlunoDashboard.tsx` | `areas/alunos/dashboard/page.tsx` |
| `features/alunos/pages/PortfolioListPage.tsx` | `areas/alunos/portfolio/page.tsx` |
| `features/alunos/pages/MinhasAulasPage.tsx` | `areas/alunos/aulas/page.tsx` |
| + 10 paginas adicionais | Respectivos modulos |

### 2.3 Componentes Migrados (9)

| Componente | Destino |
|-----------|---------|
| AchievementGrid.tsx | `areas/alunos/conquistas/components/` |
| AchievementCard.tsx | `areas/alunos/conquistas/components/` |
| PortfolioCard.tsx | `areas/alunos/portfolio/components/` |
| SubmissaoForm.tsx | `areas/alunos/portfolio/components/` |
| EvidenceUpload.tsx | `areas/alunos/portfolio/components/` |
| DesafioCard.tsx | `areas/alunos/desafios/components/` |
| InstrumentoCard.tsx | `areas/alunos/instrumentos/components/` |
| StreakCounter.tsx | `shared/components/` |
| ProgressBar.tsx | `shared/components/` |

### 2.4 Hooks Migrados (7)

Todos em `src/areas/alunos/hooks/`:
- useDesafios.ts
- useInstrumentos.ts
- useVideos.ts
- useAlunoStats.ts
- useDashboard.ts
- useDashboardAluno.ts
- index.ts

### 2.5 Rotas Configuradas

```
# Admin (11 rotas)
/admin                    -> Redirect para /admin/dashboard
/admin/dashboard          -> AdminDashboard
/admin/aulas              -> AulasKanbanPage
/admin/aulas/lista        -> Lista de aulas
/admin/aulas/:id          -> Detalhe de aula
/admin/aulas/:id/edit     -> Editar aula
/admin/professores        -> ProfessoresListPage
/admin/alunos             -> AlunosListPage
/admin/qr                 -> QRManagerPage
/admin/database           -> DatabaseAdminPage
/admin/diagnostic         -> SystemDiagnosticPage

# Professores (7 rotas)
/professores              -> Redirect para /professores/dashboard
/professores/dashboard    -> ProfessorDashboard
/professores/aulas        -> TurmasPage
/professores/alunos       -> ConteudosPage
/professores/conteudos/novo -> NovoConteudoPage
/professores/avaliacoes   -> AvaliacoesPage
/professores/estatisticas -> EstatisticasPage

# Alunos (13 rotas)
/alunos                   -> Redirect para /alunos/dashboard
/alunos/dashboard         -> AlunoDashboard
/alunos/aulas             -> MinhasAulasPage
/alunos/portfolio         -> PortfolioListPage
/alunos/portfolio/novo    -> PortfolioCreatePage
/alunos/portfolio/:id     -> PortfolioDetailPage
/alunos/conquistas        -> ConquistasPage
/alunos/conquistas/:id    -> ConquistaDetailPage
/alunos/desafios          -> DesafiosListPage
/alunos/desafios/:id      -> DesafioDetailPage
/alunos/instrumentos/:id  -> InstrumentoDetailPage
/alunos/progresso         -> ProgressoPage
/alunos/perfil            -> PerfilPage
```

### 2.6 Protecao com AreaGuard

```typescript
<Route path="/admin" element={<AreaGuard allowedRole="admin" />}>
  {/* Sub-rotas protegidas */}
</Route>

<Route path="/professores" element={<AreaGuard allowedRole="professor" />}>
  {/* Sub-rotas protegidas */}
</Route>

<Route path="/alunos" element={<AreaGuard allowedRole="aluno" />}>
  {/* Sub-rotas protegidas */}
</Route>
```

Fluxo: usuario tenta acessar area -> AreaGuard verifica `profile.tipo_usuario` -> permite ou redireciona para area correta.

### 2.7 Limpeza Pendente

Apos validacao completa de todas as paginas na nova estrutura:

```bash
# 1. Criar backup
cp -r src/features src/features_BACKUP

# 2. Deletar pasta antiga (SO APOS VALIDACAO)
rm -rf src/features/admin/pages
rm -rf src/features/professores/pages
rm -rf src/features/alunos/pages
rm -rf src/features/alunos/components
rm -rf src/features/alunos/hooks

# 3. Manter: features/shared (paginas e componentes compartilhados)
```

### 2.8 Beneficios da Nova Arquitetura

1. **Isolamento total** - cada area e independente
2. **Seguranca** - AreaGuard protege areas inteiras, nao rotas individuais
3. **Manutenibilidade** - estrutura clara e intuitiva
4. **Escalabilidade** - cada area pode crescer independentemente

---

## Checklist Geral de Migracoes

### Banco de Dados
- [ ] Backup completo realizado
- [ ] Fase 1 (RLS) executada e testada
- [ ] Aplicacao funcionando apos RLS
- [ ] Fase 2 (Validacao) executada
- [ ] Fase 3 (Auditoria) executada
- [ ] Scripts de Fase 4 (Indices) criados e executados
- [ ] Scripts de Fase 5 (Triggers) criados e executados
- [ ] Verificacao final 100%

### Frontend
- [ ] Todas as 31 paginas carregam sem erro
- [ ] Navegacao entre areas funciona
- [ ] AreaGuard impede acesso nao autorizado
- [ ] Componentes renderizam corretamente
- [ ] Hooks carregam dados das APIs
- [ ] Sidebar atualizado com novos paths
- [ ] Pasta features/ removida apos validacao
