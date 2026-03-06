# Documentacao Canonica - Nipo School

Atualizado em: 2026-03-06

Este arquivo define quais documentos devem ser usados como fonte principal para operar, validar e colocar o app em producao.

## Objetivo

A pasta `docs/` contem material atual, historico e rascunhos antigos. Para evitar contradicoes, use primeiro os documentos abaixo.

## Documentos oficiais atuais

### Produto e arquitetura

- `docs/arquitetura/ESTADO_ATUAL.md`
- `docs/arquitetura/ROTAS_E_NAVEGACAO.md`
- `docs/arquitetura/BANCO_DE_DADOS.md`
- `docs/arquitetura/AUTH_E_SEGURANCA.md`

### Implementacao e readiness

- `docs/implementacao/STATUS_GERAL.md`
- `docs/implementacao/MIGRACOES.md`
- `PILOT_READINESS.md`
- `docs/operations/RUNBOOK.md`
- `docs/operations/PRODUCTION_GAP_ANALYSIS.md`

### Operacao por perfil

- `docs/onboarding/ADMIN_GUIDE.md`
- `docs/onboarding/TEACHER_GUIDE.md`
- `docs/onboarding/STUDENT_GUIDE.md`
- `docs/onboarding/FAMILY_GUIDE.md`

### Base pedagogica

- `docs/pedagogia/ESSENCIA_PEDAGOGICA.md`
- `docs/pedagogia/LOGICA_APP.md`
- `docs/curriculum/`

## Status da documentacao

### Confiavel para decisao imediata

- `README.md`
- `PILOT_READINESS.md`
- `docs/arquitetura/*`
- `docs/implementacao/*`
- `docs/onboarding/*`
- `docs/operations/RUNBOOK.md`
- `docs/operations/PRODUCTION_GAP_ANALYSIS.md`

### Historica ou de apoio

- `docs/_arquivo/`
- `DIAGNOSTICO_RAPIDO.md`
- `RELATORIO_STATUS_DESENVOLVIMENTO.md`
- documentos antigos que citam React Router, `middleware.ts` como arquitetura principal, rotas `/admin|/professores|/alunos` como estrutura vigente, ou banco com contagem antiga de tabelas

## Regras para manutencao

1. Qualquer mudanca de arquitetura, readiness ou operacao deve atualizar:
   - `docs/arquitetura/ESTADO_ATUAL.md`
   - `docs/implementacao/STATUS_GERAL.md`
   - `docs/operations/PRODUCTION_GAP_ANALYSIS.md` se afetar producao
2. Documento novo so entra como referencia oficial se estiver listado aqui.
3. Documento superado deve ser movido para `docs/_arquivo/` ou marcado explicitamente como historico.
4. Validacoes de build, type-check, testes e deploy devem registrar data e resultado no documento de gaps de producao.

## Situacao atual

Em 2026-03-06, a base documental indica que o app esta tecnicamente proximo de producao para piloto, mas ainda depende de fechamento de gaps operacionais e funcionais antes de um rollout comercial completo.
