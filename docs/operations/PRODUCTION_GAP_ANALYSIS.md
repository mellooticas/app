# Analise de Gaps para Producao

Atualizado em: 2026-03-06
Escopo: piloto real em escola de musica e preparacao para producao controlada

## Resumo executivo

O app esta consistente como plataforma de operacao pedagogica para escola de musica. A base atual passa em `type-check` e `build`, mas ainda ha gaps de produto, operacao e readiness que impedem considerar o sistema "producao completa" sem ressalvas.

## Evidencias verificadas em 2026-03-06

- `npm run -s type-check`: OK
- `npm run -s build`: OK
- `npm run test`: bloqueado no ambiente atual por `spawn EPERM` ao carregar `vitest.config.ts` e inicializar `esbuild`

Observacao: a falha de testes observada aqui nao prova erro funcional do app. Ela deve ser revalidada fora do sandbox ou na CI.

## Leitura da situacao atual

### Pronto ou bem encaminhado

- App Router com rotas protegidas e proxy de autenticacao
- multi-tenant com `tenant_id` nas actions
- RBAC e navegacao dinamica
- modulos centrais de aulas, cursos, desafios, avaliacao, portfolio, pratica, trilhas e biblioteca
- controle de custo de IA, auditoria, feature flags e dashboards administrativos
- runbook, onboarding e checklist de piloto ja existentes

### Ainda nao pronto para rollout mais amplo

- fluxos administrativos esperados pelo mercado ainda incompletos
- lacunas na experiencia de familia e operacao escolar
- dependencia de configuracao externa para validar piloto real
- parte da documentacao do repositorio ainda esta historica ou contraditoria

## Gaps prioritarios

### P0 - Bloqueia producao operacional

1. Configuracao real de ambiente de producao
   - O checklist de piloto ainda depende de Supabase, Vercel, backups, hooks, contas, quotas e variaveis de ambiente configuradas.
   - Fonte: `PILOT_READINESS.md`
   - Acao: executar checklist item por item e registrar responsavel/data.

2. Validacao ponta a ponta do fluxo de recuperacao de senha
   - A rota `/forgot-password` foi implementada e redireciona para `/set-password` via callback de auth.
   - O ponto pendente agora e validar o envio de email e a expiracao do link no ambiente real.
   - Acao: executar smoke test completo com usuario real de homologacao.

3. Validacao de testes automatizados fora do sandbox
   - O projeto documenta testes automatizados, mas a execucao local observada nesta sessao ficou bloqueada por `spawn EPERM`.
   - Impacto: nao ha evidencia recente nesta maquina de suite verde ponta a ponta.
   - Acao: validar em CI e registrar resultado em documento oficial.

### P1 - Necessario para piloto robusto

1. Relatorios para familia/responsavel
   - O guia da familia fala em acompanhamento via professor, mas nao ha evidencia de relatorio dedicado para responsaveis.
   - Fonte: `docs/onboarding/FAMILY_GUIDE.md`
   - Fonte adicional: gap ja listado em `docs/arquitetura/ESTADO_ATUAL.md`
   - Acao: definir relatorio minimo com frequencia, pratica, progresso e feedback.

2. Pagamentos e matriculas financeiras
   - O proprio estado atual marca integracao com pagamento como pendente.
   - Fonte: `docs/arquitetura/ESTADO_ATUAL.md`
   - Impacto: piloto pode rodar sem isso, mas operacao comercial ampla fica incompleta.
   - Acao: decidir entre integracao nativa ou operacao manual temporaria.

3. Notificacoes em tempo real
   - Gap listado como futuro no estado atual.
   - Impacto: reduz adesao de alunos, professores e familias.
   - Acao: comecar por notificacoes transacionais simples por email/in-app.

4. Validacao operacional de upload em portfolio e feed
   - A UI de upload e os buckets de storage ja existem no codigo e nas migrations.
   - O ponto pendente e validar buckets/policies aplicados no ambiente real e o fluxo ponta a ponta.
   - Acao: executar smoke test com upload autenticado em `portfolios` e `feed` no ambiente alvo.

5. QR scanner funcional
   - O sistema tem paginas/gestao de QR, mas o scanner ainda aparece como pendente na documentacao consolidada.
   - Impacto: presenca e check-in perdem automacao.
   - Acao: fechar leitura via camera e janela de validacao em producao.

### P2 - Importante para qualidade de rollout

1. Normalizacao de encoding UTF-8 na documentacao
   - Varios arquivos exibem caracteres corrompidos.
   - Impacto: documentacao e onboarding perdem confiabilidade.
   - Acao: converter documentos canonicos para UTF-8 e revisar acentos.

2. PWA/mobile e i18n
   - Ainda pendentes no estado atual.
   - Impacto: nao bloqueia piloto controlado, mas reduz aderencia de uso diario.

3. Monitoramento externo
   - Sentry/Datadog ainda nao integrados.
   - Impacto: observabilidade depende de dashboards internos e provedores.

4. Strict mode incremental
   - Ainda pendente.
   - Impacto: nao bloqueia deploy, mas aumenta risco de regressao futura.

## Gaps documentais

1. Ha documentos historicos na raiz e em `docs/_arquivo/` que conflitam com a arquitetura atual.
2. `DIAGNOSTICO_RAPIDO.md` e `RELATORIO_STATUS_DESENVOLVIMENTO.md` nao devem ser usados como fonte principal de estado atual.
3. Ate esta revisao, faltava um indice canonico em `docs/README.md`.

## Sequencia recomendada para ir a producao

1. Fechar P0
   - checklist real de infra
   - validacao real de forgot-password
   - validacao dos testes em CI ou ambiente sem bloqueio
2. Fechar P1 minimo
   - relatorio para familia
   - upload em portfolio/feed
   - notificacoes basicas
   - definicao de operacao de pagamento
3. Rodada final de readiness
   - build
   - type-check
   - testes
   - validacao de auth
   - validacao de RLS
   - smoke test por perfil: admin, professor, aluno, familia

## Definicao pratica de "pronto para producao"

### GO para piloto controlado

- checklist de piloto executado
- reset de senha funcionando
- build e type-check verdes
- testes validados em CI
- fluxos criticos por perfil funcionando
- operacao manual aceitavel para itens ainda nao automatizados

### Nao GO para rollout comercial pleno

- ausencia de pagamentos
- ausencia de relatorio dedicado para familia
- notificacoes ainda pendentes
- validacao de upload em portfolio/feed ainda pendente no ambiente real

## Proximo documento a manter

Ao fechar cada gap, atualizar:

- `docs/implementacao/STATUS_GERAL.md`
- `docs/arquitetura/ESTADO_ATUAL.md`
- este arquivo




