-- DIAGNÓSTICO COMPLETO DO ERRO PORTFOLIO_ID
-- Execute linha por linha para identificar onde está o problema

-- PASSO 1: Verificar se as tabelas existem
SELECT 
    table_name,
    CASE WHEN table_name IN (
        'portfolios', 'portfolio_evidencias', 'autoavaliacoes', 
        'feedback_pares', 'rubricas_avaliacao', 'avaliacoes_rubricas', 
        'indicadores_impacto'
    ) THEN '✅ Tabela Portfolio'
    ELSE '❌ Outra tabela'
    END as status
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name LIKE '%portfolio%'
ORDER BY table_name;


| table_name           | status             |
| -------------------- | ------------------ |
| portfolio_evidencias | ✅ Tabela Portfolio |
| portfolios           | ✅ Tabela Portfolio |

-- PASSO 2: Verificar estrutura específica de cada tabela Portfolio
SELECT 
    'portfolios' as tabela,
    column_name, 
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns 
WHERE table_name = 'portfolios' 
AND table_schema = 'public'
ORDER BY ordinal_position;


| tabela     | column_name        | data_type                | is_nullable | column_default               |
| ---------- | ------------------ | ------------------------ | ----------- | ---------------------------- |
| portfolios | id                 | uuid                     | NO          | gen_random_uuid()            |
| portfolios | user_id            | uuid                     | YES         | null                         |
| portfolios | titulo             | character varying        | NO          | null                         |
| portfolios | descricao          | text                     | YES         | null                         |
| portfolios | tipo               | character varying        | YES         | 'pessoal'::character varying |
| portfolios | status             | character varying        | YES         | 'ativo'::character varying   |
| portfolios | visibilidade       | character varying        | YES         | 'privado'::character varying |
| portfolios | data_inicio        | date                     | YES         | CURRENT_DATE                 |
| portfolios | data_fim           | date                     | YES         | null                         |
| portfolios | metodologia_id     | uuid                     | YES         | null                         |
| portfolios | competencia_id     | uuid                     | YES         | null                         |
| portfolios | tags               | ARRAY                    | YES         | null                         |
| portfolios | objetivos          | ARRAY                    | YES         | null                         |
| portfolios | reflexoes_iniciais | text                     | YES         | null                         |
| portfolios | reflexoes_finais   | text                     | YES         | null                         |
| portfolios | created_at         | timestamp with time zone | YES         | now()                        |
| portfolios | updated_at         | timestamp with time zone | YES         | now()                        |


-- PASSO 3: Verificar se há constraints ou políticas problemáticas
SELECT 
    constraint_name,
    constraint_type,
    table_name
FROM information_schema.table_constraints 
WHERE table_name IN ('portfolios', 'portfolio_evidencias', 'autoavaliacoes')
AND table_schema = 'public';


| constraint_name                           | constraint_type | table_name           |
| ----------------------------------------- | --------------- | -------------------- |
| autoavaliacoes_nivel_satisfacao_check     | CHECK           | autoavaliacoes       |
| autoavaliacoes_periodo_tipo_check         | CHECK           | autoavaliacoes       |
| autoavaliacoes_pkey                       | PRIMARY KEY     | autoavaliacoes       |
| autoavaliacoes_portfolio_id_fkey          | FOREIGN KEY     | autoavaliacoes       |
| autoavaliacoes_user_id_fkey               | FOREIGN KEY     | autoavaliacoes       |
| portfolio_evidencias_aprovado_por_fkey    | FOREIGN KEY     | portfolio_evidencias |
| portfolio_evidencias_pkey                 | PRIMARY KEY     | portfolio_evidencias |
| portfolio_evidencias_portfolio_id_fkey    | FOREIGN KEY     | portfolio_evidencias |
| portfolio_evidencias_tipo_evidencia_check | CHECK           | portfolio_evidencias |
| portfolios_competencia_id_fkey            | FOREIGN KEY     | portfolios           |
| portfolios_metodologia_id_fkey            | FOREIGN KEY     | portfolios           |
| portfolios_pkey                           | PRIMARY KEY     | portfolios           |
| portfolios_status_check                   | CHECK           | portfolios           |
| portfolios_tipo_check                     | CHECK           | portfolios           |
| portfolios_user_id_fkey                   | FOREIGN KEY     | portfolios           |
| portfolios_visibilidade_check             | CHECK           | portfolios           |
| 2200_89784_1_not_null                     | CHECK           | autoavaliacoes       |
| 2200_89784_5_not_null                     | CHECK           | autoavaliacoes       |
| 2200_89784_6_not_null                     | CHECK           | autoavaliacoes       |
| 2200_89760_1_not_null                     | CHECK           | portfolio_evidencias |
| 2200_89760_3_not_null                     | CHECK           | portfolio_evidencias |
| 2200_89760_5_not_null                     | CHECK           | portfolio_evidencias |
| 2200_89728_1_not_null                     | CHECK           | portfolios           |
| 2200_89728_3_not_null                     | CHECK           | portfolios           |

-- PASSO 4: Verificar políticas RLS ativas
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual
FROM pg_policies 
WHERE tablename LIKE '%portfolio%';


| schemaname | tablename            | policyname                                         | permissive | roles    | cmd    | qual                                                                                                                                                                                                                                        |
| ---------- | -------------------- | -------------------------------------------------- | ---------- | -------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| public     | portfolios           | Usuários podem atualizar seus portfolios           | PERMISSIVE | {public} | UPDATE | (auth.uid() = user_id)                                                                                                                                                                                                                      |
| public     | portfolios           | Usuários podem criar seus portfolios               | PERMISSIVE | {public} | INSERT | null                                                                                                                                                                                                                                        |
| public     | portfolios           | Usuários podem ver seus próprios portfolios        | PERMISSIVE | {public} | SELECT | ((auth.uid() = user_id) OR ((visibilidade)::text = 'publico'::text))                                                                                                                                                                        |
| public     | portfolio_evidencias | Acesso a evidências via portfolio                  | PERMISSIVE | {public} | SELECT | (EXISTS ( SELECT 1
   FROM portfolios p
  WHERE ((p.id = portfolio_evidencias.portfolio_id) AND ((p.user_id = auth.uid()) OR ((p.visibilidade)::text = ANY ((ARRAY['turma'::character varying, 'publico'::character varying])::text[])))))) |
| public     | portfolio_evidencias | Usuários podem atualizar suas evidências           | PERMISSIVE | {public} | UPDATE | (EXISTS ( SELECT 1
   FROM portfolios p
  WHERE ((p.id = portfolio_evidencias.portfolio_id) AND (p.user_id = auth.uid()))))                                                                                                                 |
| public     | portfolio_evidencias | Usuários podem criar evidências em seus portfolios | PERMISSIVE | {public} | INSERT | null                                                                                                                                                                                                                                        |

-- PASSO 5: Se a tabela portfolios não existir, criar apenas ela primeiro
CREATE TABLE IF NOT EXISTS portfolios (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    titulo varchar(300) NOT NULL,
    descricao text,
    tipo varchar(50) CHECK (tipo IN ('pessoal', 'projeto', 'metodologia', 'competencia')) DEFAULT 'pessoal',
    status varchar(20) CHECK (status IN ('ativo', 'finalizado', 'arquivado')) DEFAULT 'ativo',
    visibilidade varchar(20) CHECK (visibilidade IN ('privado', 'turma', 'publico')) DEFAULT 'privado',
    data_inicio date DEFAULT CURRENT_DATE,
    data_fim date,
    metodologia_id uuid REFERENCES alpha_metodologias(id) ON DELETE SET NULL,
    competencia_id uuid REFERENCES alpha_competencias(id) ON DELETE SET NULL,
    tags text[],
    objetivos text[],
    reflexoes_iniciais text,
    reflexoes_finais text,
    configuracoes jsonb DEFAULT '{}'::jsonb,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- PASSO 6: Verificar se portfolios foi criada com sucesso
SELECT 'portfolios criada com sucesso' as resultado
WHERE EXISTS (
    SELECT 1 FROM information_schema.tables 
    WHERE table_name = 'portfolios' 
    AND table_schema = 'public'
);

| resultado                     |
| ----------------------------- |
| portfolios criada com sucesso |

-- PASSO 7: Mostrar colunas da tabela portfolios
SELECT column_name, data_type
FROM information_schema.columns 
WHERE table_name = 'portfolios' 
AND table_schema = 'public'
ORDER BY ordinal_position;


| column_name        | data_type                |
| ------------------ | ------------------------ |
| id                 | uuid                     |
| user_id            | uuid                     |
| titulo             | character varying        |
| descricao          | text                     |
| tipo               | character varying        |
| status             | character varying        |
| visibilidade       | character varying        |
| data_inicio        | date                     |
| data_fim           | date                     |
| metodologia_id     | uuid                     |
| competencia_id     | uuid                     |
| tags               | ARRAY                    |
| objetivos          | ARRAY                    |
| reflexoes_iniciais | text                     |
| reflexoes_finais   | text                     |
| created_at         | timestamp with time zone |
| updated_at         | timestamp with time zone |