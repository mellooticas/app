-- VERIFICAÇÃO E CORREÇÃO DA TABELA RUBRICAS_AVALIACAO
-- Execute este script para verificar e corrigir a estrutura

-- Primeiro, vamos ver a estrutura atual da tabela
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'rubricas_avaliacao' 
AND table_schema = 'public'
ORDER BY ordinal_position;


| column_name       | data_type                | is_nullable |
| ----------------- | ------------------------ | ----------- |
| id                | uuid                     | NO          |
| nome              | character varying        | NO          |
| descricao         | text                     | YES         |
| tipo              | character varying        | NO          |
| metodologia_id    | uuid                     | YES         |
| criterios         | jsonb                    | NO          |
| niveis_desempenho | jsonb                    | NO          |
| peso_total        | integer                  | YES         |
| ativo             | boolean                  | YES         |
| created_at        | timestamp with time zone | YES         |
| updated_at        | timestamp with time zone | YES         |

-- Se a coluna niveis_desempenho não existir, vamos adicioná-la
ALTER TABLE rubricas_avaliacao 
ADD COLUMN IF NOT EXISTS niveis_desempenho jsonb NOT NULL DEFAULT '{}'::jsonb;



| column_name       | data_type                | is_nullable |
| ----------------- | ------------------------ | ----------- |
| id                | uuid                     | NO          |
| nome              | character varying        | NO          |
| descricao         | text                     | YES         |
| tipo              | character varying        | NO          |
| metodologia_id    | uuid                     | YES         |
| criterios         | jsonb                    | NO          |
| niveis_desempenho | jsonb                    | NO          |
| peso_total        | integer                  | YES         |
| ativo             | boolean                  | YES         |
| created_at        | timestamp with time zone | YES         |
| updated_at        | timestamp with time zone | YES         |

-- Verificar novamente após a alteração
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'rubricas_avaliacao' 
AND table_schema = 'public'
ORDER BY ordinal_position;


| column_name       | data_type                | is_nullable |
| ----------------- | ------------------------ | ----------- |
| id                | uuid                     | NO          |
| nome              | character varying        | NO          |
| descricao         | text                     | YES         |
| tipo              | character varying        | NO          |
| metodologia_id    | uuid                     | YES         |
| criterios         | jsonb                    | NO          |
| niveis_desempenho | jsonb                    | NO          |
| peso_total        | integer                  | YES         |
| ativo             | boolean                  | YES         |
| created_at        | timestamp with time zone | YES         |
| updated_at        | timestamp with time zone | YES         |