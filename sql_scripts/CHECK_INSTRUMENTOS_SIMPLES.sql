-- ============================================
-- 🔍 INVENTÁRIO SIMPLES - TABELAS DE INSTRUMENTOS
-- Execute no Supabase SQL Editor e me envie os resultados
-- ============================================

-- 1. Listar TODAS as tabelas que contém "instrument" no nome
SELECT 
    table_name,
    table_type
FROM information_schema.tables
WHERE table_schema = 'public'
    AND table_name ILIKE '%instrument%'
ORDER BY table_name;

| table_name                            | table_type |
| ------------------------------------- | ---------- |
| cessoes_instrumentos                  | BASE TABLE |
| historia_instrumentos_evolucao        | BASE TABLE |
| historico_instrumentos                | BASE TABLE |
| instrumento_curiosidades              | BASE TABLE |
| instrumento_midias                    | BASE TABLE |
| instrumento_performances              | BASE TABLE |
| instrumento_quiz                      | BASE TABLE |
| instrumento_sons                      | BASE TABLE |
| instrumento_sons_variacoes            | BASE TABLE |
| instrumento_tecnicas                  | BASE TABLE |
| instrumentos                          | BASE TABLE |
| instrumentos_alunos                   | BASE TABLE |
| instrumentos_fisicos                  | BASE TABLE |
| instrumentos_relacionados             | BASE TABLE |
| manutencoes_instrumentos              | BASE TABLE |
| professor_instrumentos                | BASE TABLE |
| vw_violino_instrumento_sons           | VIEW       |
| vw_violino_instrumento_sons_variacoes | VIEW       |
| vw_violino_instrumentos               | VIEW       |
| vw_violino_instrumentos_relacionados  | VIEW       |


-- ============================================

-- 2. Ver TODAS as colunas da tabela biblioteca_instrumentos
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'biblioteca_instrumentos'
ORDER BY ordinal_position;

Success. No rows returned



-- ============================================

-- 3. Ver TODAS as colunas da tabela categorias_instrumentos
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'categorias_instrumentos'
ORDER BY ordinal_position;


Success. No rows returned




-- ============================================

-- 4. Verificar as FOREIGN KEYS entre as tabelas
SELECT
    tc.table_name, 
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'public'
    AND (tc.table_name ILIKE '%instrument%' OR ccu.table_name ILIKE '%instrument%')
ORDER BY tc.table_name;

| table_name                     | column_name                | foreign_table_name   | foreign_column_name |
| ------------------------------ | -------------------------- | -------------------- | ------------------- |
| alunos                         | instrumento_id             | instrumentos         | id                  |
| cessoes_instrumentos           | aluno_id                   | alunos               | id                  |
| cessoes_instrumentos           | instrumento_fisico_id      | instrumentos_fisicos | id                  |
| cessoes_instrumentos           | responsavel_devolucao      | professores          | id                  |
| cessoes_instrumentos           | responsavel_entrega        | professores          | id                  |
| historia_instrumentos_evolucao | periodo_id                 | historia_periodos    | id                  |
| historia_instrumentos_evolucao | instrumento_id             | instrumentos         | id                  |
| historico_instrumentos         | aluno_afetado_id           | alunos               | id                  |
| historico_instrumentos         | instrumento_fisico_id      | instrumentos_fisicos | id                  |
| instrumento_curiosidades       | instrumento_id             | instrumentos         | id                  |
| instrumento_midias             | instrumento_id             | instrumentos         | id                  |
| instrumento_performances       | instrumento_id             | instrumentos         | id                  |
| instrumento_quiz               | instrumento_id             | instrumentos         | id                  |
| instrumento_sons               | instrumento_id             | instrumentos         | id                  |
| instrumento_sons_variacoes     | som_id                     | instrumento_sons     | id                  |
| instrumento_tecnicas           | instrumento_id             | instrumentos         | id                  |
| instrumentos_alunos            | instrumento_id             | instrumentos         | id                  |
| instrumentos_alunos            | aluno_id                   | alunos               | id                  |
| instrumentos_fisicos           | instrumento_id             | instrumentos         | id                  |
| instrumentos_relacionados      | relacionado_id             | instrumentos         | id                  |
| instrumentos_relacionados      | instrumento_id             | instrumentos         | id                  |
| manutencoes_instrumentos       | instrumento_fisico_id      | instrumentos_fisicos | id                  |
| materiais_apoio                | instrumento_relacionado_id | instrumentos         | id                  |
| professor_instrumentos         | professor_id               | professores          | id                  |
| professor_instrumentos         | instrumento_id             | instrumentos         | id                  |
| qr_codes                       | instrument_id              | instrumentos         | id                  |
| repertorio_musical             | instrumento_principal_id   | instrumentos         | id                  |
| turmas                         | instrumento_id             | instrumentos         | id                  |


-- ============================================

-- 5. Contar quantos registros existem em cada tabela
SELECT 'biblioteca_instrumentos' as tabela, COUNT(*) as total
FROM biblioteca_instrumentos
UNION ALL
SELECT 'categorias_instrumentos', COUNT(*)
FROM categorias_instrumentos;

ERROR:  42P01: relation "biblioteca_instrumentos" does not exist
LINE 2: FROM biblioteca_instrumentos
             ^
Note: A limit of 100 was applied to your query. If this was the cause of a syntax error, try selecting "No limit" instead and re-run the query.

-- ============================================

-- 6. Mostrar 3 exemplos de cada tabela (se existir)
SELECT 'CATEGORIAS:' as tipo, id, nome, icone
FROM categorias_instrumentos
LIMIT 3;

ERROR:  42P01: relation "categorias_instrumentos" does not exist
LINE 2: FROM categorias_instrumentos
             ^

SELECT 'INSTRUMENTOS:' as tipo, id, nome, origem, nivel_dificuldade
FROM biblioteca_instrumentos
LIMIT 3;

ERROR:  42P01: relation "biblioteca_instrumentos" does not exist
LINE 2: FROM biblioteca_instrumentos
             ^



-- Ver TODAS as colunas da tabela instrumentos (A REAL)
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumentos'
ORDER BY ordinal_position;



| column_name             | data_type                   | is_nullable |
| ----------------------- | --------------------------- | ----------- |
| id                      | uuid                        | NO          |
| nome                    | character varying           | NO          |
| categoria               | character varying           | YES         |
| descricao               | text                        | YES         |
| imagem_url              | text                        | YES         |
| ativo                   | boolean                     | YES         |
| ordem_exibicao          | integer                     | YES         |
| criado_em               | timestamp without time zone | YES         |
| historia                | text                        | YES         |
| origem                  | character varying           | YES         |
| familia_instrumental    | character varying           | YES         |
| material_principal      | text                        | YES         |
| tecnica_producao_som    | text                        | YES         |
| dificuldade_aprendizado | character varying           | YES         |
| anatomia_partes         | jsonb                       | YES         |
| curiosidades            | jsonb                       | YES         |




-- Ver exemplo de dados
SELECT * FROM instrumentos LIMIT 3;


| id                                   | nome              | categoria | descricao                                       | imagem_url | ativo | ordem_exibicao | criado_em                  | historia | origem | familia_instrumental | material_principal | tecnica_producao_som | dificuldade_aprendizado | anatomia_partes | curiosidades |
| ------------------------------------ | ----------------- | --------- | ----------------------------------------------- | ---------- | ----- | -------------- | -------------------------- | -------- | ------ | -------------------- | ------------------ | -------------------- | ----------------------- | --------------- | ------------ |
| 8bd473f1-7b35-4b9e-869a-17fb73c6e047 | Teclado           | teclado   | 🎹 Instrumento eletrônico de teclado            | null       | true  | 1              | 2025-05-30 00:04:22.250942 | null     | null   | null                 | null               | null                 | iniciante               | {}              | []           |
| 9a5e0eac-114e-4173-90af-32b55c870675 | Percussão Erudita | percussao | 🥁 Instrumentos de percussão clássica           | null       | true  | 4              | 2025-05-30 00:04:22.250942 | null     | null   | null                 | null               | null                 | iniciante               | {}              | []           |
| 794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08 | Flauta            | sopro     | 🎶 Instrumento de sopro da família das madeiras | null       | true  | 13             | 2025-05-30 00:04:22.250942 | null     | null   | null                 | null               | null                 | iniciante               | {}              | []           |
