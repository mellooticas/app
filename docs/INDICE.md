# Indice da Documentacao - Nipo School

> Ultima reorganizacao: 28/02/2026
> ~150 arquivos consolidados em ~50 arquivos organizados por competencia

---

## Estrutura de Pastas

```
docs/
  arquitetura/      # Verdade tecnica unica (stack, banco, auth, design, rotas)
  pedagogia/        # Filosofia educacional, gamificacao, historia da musica
  aulas/            # Sistema de aulas, curadoria, kanban, materiais
  backend/          # Planos, progresso e checklists do backend
  design/           # Tokens de referencia (constants, tailwind, utils)
  diagnosticos/     # Analises, auditorias, gaps identificados
  implementacao/    # Status geral, migracoes, log de correcoes
  planejamento/     # Planos futuros e estrategia
  tutoriais/        # Guias rapidos para novos devs
  portfolio/        # Sistema de portfolio do aluno
  materiais-estudo/ # PDFs educacionais de referencia
  curriculum/       # Capitulos do curriculo pedagogico (NAO MEXER)
  _arquivo/         # Documentos originais arquivados (referencia historica)
```

---

## Por Onde Comecar

| Objetivo | Documento |
|----------|-----------|
| Entender o projeto | [arquitetura/DOCUMENTACAO_COMPLETA.md](arquitetura/DOCUMENTACAO_COMPLETA.md) |
| Filosofia educacional | [pedagogia/ESSENCIA_PEDAGOGICA.md](pedagogia/ESSENCIA_PEDAGOGICA.md) |
| Regras de negocio | [pedagogia/LOGICA_APP.md](pedagogia/LOGICA_APP.md) |
| Banco de dados | [arquitetura/BANCO_DE_DADOS.md](arquitetura/BANCO_DE_DADOS.md) |
| Rodar o projeto | [tutoriais/INICIO_RAPIDO.md](tutoriais/INICIO_RAPIDO.md) |
| Status atual | [implementacao/STATUS_GERAL.md](implementacao/STATUS_GERAL.md) |

---

## Detalhamento por Pasta

### arquitetura/ - Fonte Unica de Verdade Tecnica

| Arquivo | Conteudo |
|---------|----------|
| [DOCUMENTACAO_COMPLETA.md](arquitetura/DOCUMENTACAO_COMPLETA.md) | Stack completa, estrutura, componentes, modulos, integracao |
| [BANCO_DE_DADOS.md](arquitetura/BANCO_DE_DADOS.md) | 117 tabelas, schema, RLS, views, functions, queries, interfaces TS |
| [AUTH_E_SEGURANCA.md](arquitetura/AUTH_E_SEGURANCA.md) | Sistema auth Supabase, niveis de acesso, RLS, checklist seguranca |
| [DESIGN_SYSTEM.md](arquitetura/DESIGN_SYSTEM.md) | Filosofia visual, cores, tipografia, componentes, sistema oriental, admin executivo |
| [ROTAS_E_NAVEGACAO.md](arquitetura/ROTAS_E_NAVEGACAO.md) | Todas as rotas, sidebar, protecao, middleware, boas praticas |
| [ESTADO_ATUAL.md](arquitetura/ESTADO_ATUAL.md) | 47 paginas, 11 actions, 8 RPCs, fluxo de dados completo |

### pedagogia/ - Fundacao Educacional

| Arquivo | Conteudo |
|---------|----------|
| [ESSENCIA_PEDAGOGICA.md](pedagogia/ESSENCIA_PEDAGOGICA.md) | 8 metodologias, ciclos, desafios Alpha, valores nipo-brasileiros |
| [LOGICA_APP.md](pedagogia/LOGICA_APP.md) | Fluxos de negocio, atores, regras, metricas, KPIs |
| [GAMIFICACAO.md](pedagogia/GAMIFICACAO.md) | 7 niveis, pontuacao, 24 conquistas, tabelas, queries, componentes |
| [HISTORIA_MUSICA.md](pedagogia/HISTORIA_MUSICA.md) | 23 periodos, 40 compositores, experiencia interativa, foco oriental |

### aulas/ - Sistema de Aulas

| Arquivo | Conteudo |
|---------|----------|
| [todas_aulas.md](aulas/todas_aulas.md) | Lista das 30 aulas com datas e objetivos |
| [ANALISE_AULAS_POR_NIVEL.md](aulas/ANALISE_AULAS_POR_NIVEL.md) | 30 aulas em 9 blocos por nivel |
| [curadoria_aulas.md](aulas/curadoria_aulas.md) | Processo de curadoria em 7 passos |
| [curadoria_material_de_apoio.md](aulas/curadoria_material_de_apoio.md) | Mapeamento de materiais por aula |
| [estrutura_do_banco_para_aulas.md](aulas/estrutura_do_banco_para_aulas.md) | 8 tabelas do banco para aulas |
| [insersao_das_aulas_no_banco.md](aulas/insersao_das_aulas_no_banco.md) | Exemplo detalhado da Aula 1 |
| [IMPLEMENTACAO_SISTEMA_AULAS_COMPLETO.md](aulas/IMPLEMENTACAO_SISTEMA_AULAS_COMPLETO.md) | 14 arquivos criados, 5 paginas, 6 componentes |
| [EXEMPLOS_CODIGO_AULAS.md](aulas/EXEMPLOS_CODIGO_AULAS.md) | Exemplos de codigo React/TS |
| [criacao_kanban.md](aulas/criacao_kanban.md) | Especificacao do Kanban pedagogico |
| [kanban_admin_implemetacao.md](aulas/kanban_admin_implemetacao.md) | 7 arquivos criados para Kanban admin |

### backend/ - Backend Extraordinario

| Arquivo | Conteudo |
|---------|----------|
| [PLANO_BACKEND.md](backend/PLANO_BACKEND.md) | Plano 5 semanas: Zod, React Query, Logger, Testes, Transacoes |
| [PROGRESSO_BACKEND.md](backend/PROGRESSO_BACKEND.md) | Relatorio final: 75% completo, 35 arquivos, 5200 linhas |
| [CHECKLIST_VALIDACAO.md](backend/CHECKLIST_VALIDACAO.md) | Checklist: 117 tabelas, 56 functions, 153 RLS validados |
| [PROFESSOR_ADMIN_CORE.md](backend/PROFESSOR_ADMIN_CORE.md) | Core completo: 33 actions, 59 hooks, 20 schemas |
| [03_EXEMPLO_LOGGER_SERVER_ACTIONS.ts](backend/03_EXEMPLO_LOGGER_SERVER_ACTIONS.ts) | Exemplo de logger em TypeScript |

### design/ - Tokens de Referencia

| Arquivo | Conteudo |
|---------|----------|
| [CONSTANTS.md](design/CONSTANTS.md) | 562 linhas de tokens: cores, animacoes, gamificacao, i18n |
| [TAILWIND_CONFIG.md](design/TAILWIND_CONFIG.md) | Configuracao completa do Tailwind com paletas Nipo |
| [UTILS.md](design/UTILS.md) | 448 linhas de utilidades: filosofia japonesa, gamificacao, validacao |

### diagnosticos/ - Analises e Gaps

| Arquivo | Conteudo |
|---------|----------|
| [ANALISE_FRONTEND.md](diagnosticos/ANALISE_FRONTEND.md) | Auditoria hooks, dados mock, sprints, prioridades |
| [DISCREPANCIAS.md](diagnosticos/DISCREPANCIAS.md) | 47+ inconsistencias docs vs app, gaps pedagogicos |
| [GAPS_SENIOR.md](diagnosticos/GAPS_SENIOR.md) | 12 gaps criticos: testes, monitoring, performance, seguranca |

### implementacao/ - Registros de Implementacao

| Arquivo | Conteudo |
|---------|----------|
| [STATUS_GERAL.md](implementacao/STATUS_GERAL.md) | Inventario completo: 37 paginas, modulos, pendencias |
| [MIGRACOES.md](implementacao/MIGRACOES.md) | 17 migracoes SQL + migracao frontend Vite→Next.js |
| [FIXES_LOG.md](implementacao/FIXES_LOG.md) | Log de 9 correcoes criticas com causa/solucao/arquivos |

### planejamento/ - Planos Futuros

| Arquivo | Conteudo |
|---------|----------|
| [PLANO_COMPLETO_AREA_ALUNO.md](planejamento/PLANO_COMPLETO_AREA_ALUNO.md) | 28 tabelas relacionadas, dashboard, sections |
| [PLANEJAMENTO_PAGINA_INSTRUMENTO_COMPLETA.md](planejamento/PLANEJAMENTO_PAGINA_INSTRUMENTO_COMPLETA.md) | Design e features da pagina de instrumento |
| [PLANO_VALIDACAO_TESTES.md](planejamento/PLANO_VALIDACAO_TESTES.md) | Estrategia de QA |
| [DIMENSAO_REAL_CURADORIA.md](planejamento/DIMENSAO_REAL_CURADORIA.md) | Dimensao real do trabalho de curadoria |
| [EXEMPLO_TRANSFORMACAO_ORFF.md](planejamento/EXEMPLO_TRANSFORMACAO_ORFF.md) | Exemplo pratico: Orff → implementacao |
| [MUDANCA_ESTRATEGIA.md](planejamento/MUDANCA_ESTRATEGIA.md) | Documentacao do pivot estrategico |

### tutoriais/ - Guias Rapidos

| Arquivo | Conteudo |
|---------|----------|
| [INICIO_RAPIDO.md](tutoriais/INICIO_RAPIDO.md) | Setup em 10min: types, conexao, dev server |
| [INSTRUCOES_POPULATE.md](tutoriais/INSTRUCOES_POPULATE.md) | Popular banco com dados iniciais |
| [acesso_e_rotas.md](tutoriais/acesso_e_rotas.md) | Guia de acesso e navegacao |
| [import-patterns.md](tutoriais/import-patterns.md) | Padroes de import do projeto |

### portfolio/

| Arquivo | Conteudo |
|---------|----------|
| [README.md](portfolio/README.md) | Sistema completo: 6 componentes, 9 metodologias, evidencias |

---

## Sobre a Pasta _arquivo/

Contem todos os ~120 documentos originais antes da consolidacao. Servem como referencia historica caso precise consultar versoes anteriores. Podem ser removidos quando a equipe estiver confortavel com a nova estrutura.
