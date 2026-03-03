# Pilot Readiness Checklist — Nipo School 2026

## Go / No-Go Criteria

Cada item deve ser marcado como OK antes do lançamento do piloto.

---

### 1. Infraestrutura

- [ ] Supabase project configurado (produção)
- [ ] Todas as variáveis de ambiente definidas (`SUPABASE_URL`, `ANON_KEY`, `SERVICE_ROLE_KEY`, `OPENAI_API_KEY`, `SITE_URL`)
- [ ] Vercel deploy ativo com domínio customizado
- [ ] HTTPS habilitado
- [ ] Supabase backups automáticos configurados
- [ ] `.env` file não versionado no git

### 2. Banco de Dados

- [ ] Todas as migrations aplicadas (001-063)
- [ ] Seed data correto (tenant, unit, roles, permissions, navigation)
- [ ] RLS habilitado em todas as tabelas
- [ ] Custom access token hook ativo no Supabase Dashboard
- [ ] Constraints de qualidade aplicados (migration 057)
- [ ] Quotas IA configuradas (migration 059)

### 3. Autenticação & Segurança

- [ ] Access token hook habilitado em Authentication → Hooks
- [ ] Conta de admin criada e testada
- [ ] Contas de professor criadas
- [ ] Contas de aluno criadas
- [ ] Fluxo de reset de senha funcional
- [ ] Fluxo de convite por email funcional
- [ ] `SUPABASE_SERVICE_ROLE_KEY` sem prefixo `NEXT_PUBLIC_`

### 4. RBAC & Navegação

- [ ] Navigation items configurados para cada role (student, teacher, admin)
- [ ] Permissões atribuídas corretamente por role
- [ ] Sidebar exibe apenas itens autorizados
- [ ] Settings pages acessíveis apenas por admin
- [ ] Feature flags configurados para o tenant piloto

### 5. Conteúdo Pedagógico

- [ ] 24 capítulos de currículo carregados na biblioteca
- [ ] Aulas criadas por módulo (mínimo 10 por módulo ativo)
- [ ] Materiais de apoio IA gerados para aulas existentes
- [ ] Desafios criados e testados
- [ ] Trilhas de aprendizagem (learning paths) configuradas

### 6. IA & Custos

- [ ] API key OpenAI válida e com créditos
- [ ] Quotas diárias/mensais configuradas em `ai_quotas`
- [ ] AI usage logging funcional (`ai_usage_log`)
- [ ] Custo diário estimado dentro do orçamento
- [ ] Rate limiting testado (soft block funcional)

### 7. Testes & CI

- [ ] CI pipeline ativo (GitHub Actions)
- [ ] `npm run lint` sem erros
- [ ] `npm run type-check` sem erros
- [ ] `npm run test` — todos os testes passam (45+)
- [ ] Build (`npm run build`) sem erros

### 8. Monitoramento

- [ ] Superadmin dashboard acessível em `/settings/superadmin`
- [ ] Data quality dashboard em `/settings/data-quality`
- [ ] AI cost tracking exibindo dados reais
- [ ] Alertas visuais funcionais (pico de custo, erros)

### 9. Onboarding

- [ ] Guia do administrador revisado (`docs/onboarding/ADMIN_GUIDE.md`)
- [ ] Guia do professor revisado (`docs/onboarding/TEACHER_GUIDE.md`)
- [ ] Guia do aluno revisado (`docs/onboarding/STUDENT_GUIDE.md`)
- [ ] Guia da família revisado (`docs/onboarding/FAMILY_GUIDE.md`)
- [ ] Treinamento presencial agendado

### 10. Legal & Compliance

- [ ] Política de privacidade de dados publicada
- [ ] Termos de uso revisados
- [ ] Consentimento dos pais/responsáveis para menores
- [ ] LGPD: dados pessoais mapeados e com base legal
- [ ] Plano de exclusão de dados ao término do piloto

---

## Critérios de Decisão

| Status | Significado |
|--------|-------------|
| **GO** | Todos os itens obrigatórios marcados. Riscos residuais documentados. |
| **NO-GO** | 1+ item crítico pendente. Corrigir antes de prosseguir. |
| **GO com ressalvas** | Itens de baixo risco pendentes, mas fluxos críticos funcionam. |

## Data Alvo do Piloto

- **Início:** ___/___/2026
- **Duração:** 12 meses
- **Escola:** ___________________
- **Revisão intermediária:** 6 meses

## Responsáveis

| Área | Responsável |
|------|-------------|
| Infraestrutura/Deploy | Junior |
| Banco de Dados | Junior |
| Conteúdo Pedagógico | TBD |
| Treinamento | TBD |
| Legal | TBD |
