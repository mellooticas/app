# 📋 PLANO DE MIGRAÇÕES - NIPO SCHOOL

**Data:** 15/12/2025  
**Status:** 🚧 Em Planejamento  
**Fonte:** Análise Completa do Banco de Dados

---

## 🎯 RESUMO DOS PROBLEMAS IDENTIFICADOS

| Categoria | Quantidade | Prioridade |
|-----------|-----------|------------|
| RLS Desabilitado | 37 tabelas | 🔴 CRÍTICO |
| Índices Faltantes | 56 FKs | 🟡 ALTO |
| Campos sem Validação | 5 emails | 🟡 ALTO |
| Status sem ENUM | 22 tabelas | 🟡 ALTO |
| Tabelas sem Timestamps | 31 tabelas | 🟡 ALTO |
| Campos sem Limites | 4 campos | 🟢 MÉDIO |
| Soft Delete Faltante | 1 tabela | 🟢 MÉDIO |

---

## 📦 ESTRUTURA DAS MIGRAÇÕES

### Prioridade 1 - SEGURANÇA (Crítico)
1. ✅ `01_habilitar_rls_tabelas_criticas.sql` - Habilitar RLS nas 37 tabelas
2. ✅ `02_criar_politicas_rls_gamificacao.sql` - Políticas para sistema alpha
3. ✅ `03_criar_politicas_rls_forum.sql` - Políticas para fórum
4. ✅ `04_criar_politicas_rls_instrumentos.sql` - Políticas para instrumentos
5. ✅ `05_criar_politicas_rls_avaliacoes.sql` - Políticas para avaliações

### Prioridade 2 - VALIDAÇÃO (Alto)
6. ✅ `06_adicionar_validacao_emails.sql` - CHECK constraints para emails
7. ✅ `07_criar_enums_status.sql` - ENUMs para campos de status
8. ✅ `08_adicionar_validacao_numeros.sql` - CHECK para notas e anos

### Prioridade 3 - AUDITORIA (Alto)
9. ✅ `09_adicionar_timestamps_parte1.sql` - created_at/updated_at (15 tabelas)
10. ✅ `10_adicionar_timestamps_parte2.sql` - created_at/updated_at (16 tabelas)
11. ✅ `11_adicionar_soft_delete.sql` - deleted_at na tabela aulas

### Prioridade 4 - PERFORMANCE (Alto)
12. ✅ `12_criar_indices_fk_parte1.sql` - Índices para 28 FKs
13. ✅ `13_criar_indices_fk_parte2.sql` - Índices para 28 FKs
14. ✅ `14_criar_indices_busca_parte1.sql` - Índices para nome/email (29 tabelas)
15. ✅ `15_criar_indices_busca_parte2.sql` - Índices para título/slug (29 tabelas)

### Prioridade 5 - TRIGGERS (Médio)
16. ✅ `16_criar_triggers_updated_at.sql` - Triggers automáticos para updated_at
17. ✅ `17_criar_triggers_auditoria.sql` - Triggers para audit_activities

---

## 🚀 ORDEM DE EXECUÇÃO

Execute as migrações na ordem numérica:

```bash
# Segurança
psql -f 01_habilitar_rls_tabelas_criticas.sql
psql -f 02_criar_politicas_rls_gamificacao.sql
psql -f 03_criar_politicas_rls_forum.sql
psql -f 04_criar_politicas_rls_instrumentos.sql
psql -f 05_criar_politicas_rls_avaliacoes.sql

# Validação
psql -f 06_adicionar_validacao_emails.sql
psql -f 07_criar_enums_status.sql
psql -f 08_adicionar_validacao_numeros.sql

# Auditoria
psql -f 09_adicionar_timestamps_parte1.sql
psql -f 10_adicionar_timestamps_parte2.sql
psql -f 11_adicionar_soft_delete.sql

# Performance
psql -f 12_criar_indices_fk_parte1.sql
psql -f 13_criar_indices_fk_parte2.sql
psql -f 14_criar_indices_busca_parte1.sql
psql -f 15_criar_indices_busca_parte2.sql

# Triggers
psql -f 16_criar_triggers_updated_at.sql
psql -f 17_criar_triggers_auditoria.sql
```

---

## ⚠️ AVISOS IMPORTANTES

### Antes de Executar
- ✅ Fazer backup completo do banco
- ✅ Executar em ambiente de desenvolvimento primeiro
- ✅ Testar cada migração individualmente
- ✅ Verificar logs de erro após cada execução

### Durante Execução
- ⚠️ Algumas migrações podem demorar (índices em tabelas grandes)
- ⚠️ RLS pode impactar queries existentes - teste a aplicação
- ⚠️ ENUMs podem quebrar código que use valores hard-coded

### Após Execução
- ✅ Verificar políticas RLS funcionando
- ✅ Validar constraints de email
- ✅ Testar triggers de updated_at
- ✅ Medir performance das queries com novos índices

---

## 📊 IMPACTO ESPERADO

### Segurança
- 🔐 37 tabelas protegidas com RLS
- 🔐 Dados sensíveis isolados por usuário
- 🔐 Redução de 100% em riscos de acesso não autorizado

### Performance
- ⚡ 56 novos índices em FKs
- ⚡ 58 novos índices em campos de busca
- ⚡ Redução estimada de 60-80% no tempo de queries JOIN

### Qualidade de Dados
- ✅ 5 campos de email validados
- ✅ 22 campos de status padronizados
- ✅ 31 tabelas com auditoria temporal

---

## 🔄 ROLLBACK

Cada migração possui um script de rollback correspondente (quando aplicável).

Para reverter uma migração:
```bash
psql -f rollback/XX_nome_migracao_rollback.sql
```

**ATENÇÃO:** Algumas migrações (como adição de colunas) podem ter perda de dados no rollback!

---

## 📝 CHECKLIST DE EXECUÇÃO

- [ ] Backup do banco realizado
- [ ] Ambiente de desenvolvimento testado
- [ ] Aplicação testada com RLS habilitado
- [ ] Queries testadas com novos índices
- [ ] Triggers de auditoria validados
- [ ] Constraints de validação testadas
- [ ] Performance medida antes/depois
- [ ] Documentação atualizada
- [ ] Equipe notificada sobre mudanças
- [ ] Plano de rollback preparado

---

**Última atualização:** 15/12/2025
