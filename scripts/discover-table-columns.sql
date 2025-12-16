-- Descobrir estrutura real das tabelas principais

-- Profiles
SELECT 
    column_name, 
    data_type, 
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public' 
    AND table_name = 'profiles'
ORDER BY ordinal_position;

| column_name          | data_type                | is_nullable | column_default    |
| -------------------- | ------------------------ | ----------- | ----------------- |
| id                   | uuid                     | NO          | null              |
| email                | text                     | YES         | null              |
| full_name            | text                     | YES         | null              |
| dob                  | date                     | YES         | null              |
| instrument           | text                     | YES         | null              |
| voted_logo           | uuid                     | YES         | null              |
| has_voted            | boolean                  | YES         | false             |
| avatar_url           | text                     | YES         | null              |
| church_name          | text                     | YES         | null              |
| user_level           | text                     | YES         | 'beginner'::text  |
| total_points         | integer                  | YES         | 0                 |
| bio                  | text                     | YES         | null              |
| phone                | text                     | YES         | null              |
| city                 | text                     | YES         | null              |
| state                | text                     | YES         | null              |
| joined_at            | timestamp with time zone | YES         | now()             |
| last_active          | timestamp with time zone | YES         | now()             |
| current_streak       | integer                  | YES         | 0                 |
| best_streak          | integer                  | YES         | 0                 |
| lessons_completed    | integer                  | YES         | 0                 |
| modules_completed    | integer                  | YES         | 0                 |
| theme_preference     | text                     | YES         | 'light'::text     |
| notification_enabled | boolean                  | YES         | true              |
| sound_enabled        | boolean                  | YES         | true              |
| tipo_usuario         | text                     | YES         | null              |
| nome                 | text                     | YES         | null              |
| created_at           | timestamp with time zone | YES         | CURRENT_TIMESTAMP |
| updated_at           | timestamp with time zone | YES         | CURRENT_TIMESTAMP |



-- Aulas
SELECT 
    column_name, 
    data_type, 
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public' 
    AND table_name = 'aulas'
ORDER BY ordinal_position;

| column_name       | data_type                   | is_nullable |
| ----------------- | --------------------------- | ----------- |
| id                | uuid                        | NO          |
| numero            | integer                     | NO          |
| titulo            | text                        | NO          |
| modulo_id         | uuid                        | YES         |
| data_programada   | date                        | NO          |
| objetivo_didatico | text                        | YES         |
| resumo_atividades | text                        | YES         |
| desafio_alpha     | text                        | YES         |
| nivel             | text                        | YES         |
| formato           | text                        | YES         |
| status            | text                        | YES         |
| criado_em         | timestamp without time zone | YES         |
| responsavel_id    | uuid                        | YES         |
| detalhes_aula     | jsonb                       | YES         |
| created_at        | timestamp with time zone    | YES         |
| updated_at        | timestamp with time zone    | YES         |
| deleted_at        | timestamp with time zone    | YES         |



-- Portfolios
SELECT 
    column_name, 
    data_type, 
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public' 
    AND table_name = 'portfolios'
ORDER BY ordinal_position;

| column_name        | data_type                | is_nullable |
| ------------------ | ------------------------ | ----------- |
| id                 | uuid                     | NO          |
| user_id            | uuid                     | YES         |
| titulo             | character varying        | NO          |
| descricao          | text                     | YES         |
| tipo               | character varying        | YES         |
| status             | character varying        | YES         |
| visibilidade       | character varying        | YES         |
| data_inicio        | date                     | YES         |
| data_fim           | date                     | YES         |
| metodologia_id     | uuid                     | YES         |
| competencia_id     | uuid                     | YES         |
| tags               | ARRAY                    | YES         |
| objetivos          | ARRAY                    | YES         |
| reflexoes_iniciais | text                     | YES         |
| reflexoes_finais   | text                     | YES         |
| created_at         | timestamp with time zone | YES         |
| updated_at         | timestamp with time zone | YES         |
| deleted_at         | timestamp with time zone | YES         |



-- User Points Log
SELECT 
    column_name, 
    data_type, 
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public' 
    AND table_name = 'user_points_log'
ORDER BY ordinal_position;

| column_name   | data_type                | is_nullable |
| ------------- | ------------------------ | ----------- |
| id            | uuid                     | NO          |
| user_id       | uuid                     | YES         |
| action        | text                     | NO          |
| points_earned | integer                  | NO          |
| multiplier    | numeric                  | YES         |
| source_type   | text                     | NO          |
| source_id     | uuid                     | YES         |
| notes         | text                     | YES         |
| aula_id       | uuid                     | YES         |
| created_at    | timestamp with time zone | YES         |



-- Achievements
SELECT 
    column_name, 
    data_type, 
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public' 
    AND table_name = 'achievements'
ORDER BY ordinal_position;

| column_name       | data_type                | is_nullable |
| ----------------- | ------------------------ | ----------- |
| id                | uuid                     | NO          |
| name              | text                     | NO          |
| description       | text                     | YES         |
| badge_icon        | text                     | YES         |
| badge_color       | text                     | YES         |
| points_reward     | integer                  | YES         |
| category          | text                     | YES         |
| requirement_type  | text                     | YES         |
| requirement_value | integer                  | YES         |
| is_active         | boolean                  | YES         |
| created_at        | timestamp with time zone | YES         |