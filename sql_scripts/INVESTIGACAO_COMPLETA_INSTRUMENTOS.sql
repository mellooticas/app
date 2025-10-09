-- ============================================
-- 🔍 INVESTIGAÇÃO COMPLETA - TODAS AS TABELAS DE INSTRUMENTOS
-- Execute no Supabase SQL Editor
-- ============================================

-- 1️⃣ TABELA PRINCIPAL: instrumentos
-- Ver estrutura completa
SELECT 
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumentos'
ORDER BY ordinal_position;

| column_name             | data_type                   | is_nullable | column_default                 |
| ----------------------- | --------------------------- | ----------- | ------------------------------ |
| id                      | uuid                        | NO          | gen_random_uuid()              |
| nome                    | character varying           | NO          | null                           |
| categoria               | character varying           | YES         | null                           |
| descricao               | text                        | YES         | null                           |
| imagem_url              | text                        | YES         | null                           |
| ativo                   | boolean                     | YES         | true                           |
| ordem_exibicao          | integer                     | YES         | 0                              |
| criado_em               | timestamp without time zone | YES         | CURRENT_TIMESTAMP              |
| historia                | text                        | YES         | null                           |
| origem                  | character varying           | YES         | null                           |
| familia_instrumental    | character varying           | YES         | null                           |
| material_principal      | text                        | YES         | null                           |
| tecnica_producao_som    | text                        | YES         | null                           |
| dificuldade_aprendizado | character varying           | YES         | 'iniciante'::character varying |
| anatomia_partes         | jsonb                       | YES         | '{}'::jsonb                    |
| curiosidades            | jsonb                       | YES         | '[]'::jsonb                    |


-- Ver dados de exemplo (pegue o UUID de um instrumento para usar nas próximas queries)
SELECT * FROM instrumentos LIMIT 5;

| id                                   | nome              | categoria | descricao                                       | imagem_url | ativo | ordem_exibicao | criado_em                  | historia | origem | familia_instrumental | material_principal | tecnica_producao_som | dificuldade_aprendizado | anatomia_partes | curiosidades |
| ------------------------------------ | ----------------- | --------- | ----------------------------------------------- | ---------- | ----- | -------------- | -------------------------- | -------- | ------ | -------------------- | ------------------ | -------------------- | ----------------------- | --------------- | ------------ |
| 8bd473f1-7b35-4b9e-869a-17fb73c6e047 | Teclado           | teclado   | 🎹 Instrumento eletrônico de teclado            | null       | true  | 1              | 2025-05-30 00:04:22.250942 | null     | null   | null                 | null               | null                 | iniciante               | {}              | []           |
| 9a5e0eac-114e-4173-90af-32b55c870675 | Percussão Erudita | percussao | 🥁 Instrumentos de percussão clássica           | null       | true  | 4              | 2025-05-30 00:04:22.250942 | null     | null   | null                 | null               | null                 | iniciante               | {}              | []           |
| 794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08 | Flauta            | sopro     | 🎶 Instrumento de sopro da família das madeiras | null       | true  | 13             | 2025-05-30 00:04:22.250942 | null     | null   | null                 | null               | null                 | iniciante               | {}              | []           |
| 174f6ed4-3c21-444a-acfa-5149f53f2ca0 | Tuba              | sopro     | 🎺 Instrumento de sopro da família dos metais   | null       | true  | 16             | 2025-05-30 00:04:22.250942 | null     | null   | null                 | null               | null                 | iniciante               | {}              | []           |
| 8fbba87d-39e1-4542-b8bb-7c815fdc2b9a | Eufônio           | sopro     | 🎺 Instrumento de sopro da família dos metais   | null       | true  | 17             | 2025-05-30 00:04:22.250942 | null     | null   | null                 | null               | null                 | iniciante               | {}              | []           |



-- ============================================

-- 2️⃣ TABELA: instrumento_curiosidades
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumento_curiosidades'
ORDER BY ordinal_position;

| column_name    | data_type                   | is_nullable |
| -------------- | --------------------------- | ----------- |
| id             | uuid                        | NO          |
| instrumento_id | uuid                        | YES         |
| titulo         | character varying           | NO          |
| conteudo       | text                        | NO          |
| categoria      | character varying           | YES         |
| imagem_url     | text                        | YES         |
| video_url      | text                        | YES         |
| fonte          | character varying           | YES         |
| created_at     | timestamp without time zone | YES         |


-- Ver exemplo de curiosidades
SELECT * FROM instrumento_curiosidades LIMIT 3;

| id                                   | instrumento_id                       | titulo                      | conteudo                                                                                                                                                                                                                | categoria | imagem_url                               | video_url | fonte                                | created_at                 |
| ------------------------------------ | ------------------------------------ | --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | ---------------------------------------- | --------- | ------------------------------------ | -------------------------- |
| 800b8cc3-5f39-4101-84a0-190ff8ce0878 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | O Violão Mais Caro do Mundo | O violão mais caro já vendido foi um Martin D-45 de 1968 que pertenceu a Johnny Cash, vendido por 135.000 dólares em leilão. Violões vintage de luthiers famosos podem valer mais que carros de luxo!                   | cultural  | /images/curiosidades/violao_caro.jpg     | null      | Guinness World Records               | 2025-06-08 01:08:19.394658 |
| 2094b14f-ed14-46a8-92d9-0055751302de | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Por que 6 Cordas?           | O violão nem sempre teve 6 cordas. No século XVIII, violões tinham 5 pares de cordas. A sexta corda grave foi adicionada na Espanha no século XIX para expandir o registro do instrumento.                              | historia  | /images/curiosidades/evolucao_cordas.jpg | null      | História do Violão - José de Azpiazu | 2025-06-08 01:08:19.394658 |
| d2e99781-ae62-4485-9f69-4ca66b911e33 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | O Violão no Espaço          | Em 1965, o astronauta Wally Schirra levou uma gaita para o espaço, mas foi apenas em 2013 que o astronauta Chris Hadfield levou um violão para a Estação Espacial Internacional e gravou "Space Oddity" de David Bowie. | ciencia   | /images/curiosidades/violao_espaco.jpg   | null      | NASA                                 | 2025-06-08 01:08:19.394658 |


-- Contar quantas curiosidades temos
SELECT 
    i.nome as instrumento,
    COUNT(ic.*) as total_curiosidades
FROM instrumentos i
LEFT JOIN instrumento_curiosidades ic ON ic.instrumento_id = i.id
GROUP BY i.id, i.nome
ORDER BY total_curiosidades DESC;


| instrumento          | total_curiosidades |
| -------------------- | ------------------ |
| Viola Clássica       | 20                 |
| Guitarra             | 20                 |
| Violino              | 20                 |
| Violão               | 10                 |
| Piano                | 10                 |
| Bateria              | 10                 |
| Clarinete            | 2                  |
| Eufônio              | 0                  |
| Tuba                 | 0                  |
| Baixo                | 0                  |
| Flauta               | 0                  |
| Percussão Erudita    | 0                  |
| Teoria Musical       | 0                  |
| Contrabaixo Acústico | 0                  |
| Outro                | 0                  |
| Fagote               | 0                  |
| Saxofone             | 0                  |
| Trombone             | 0                  |
| Teclado              | 0                  |
| Violoncelo           | 0                  |
| Canto                | 0                  |
| Oboé                 | 0                  |
| Trompete             | 0                  |


-- ============================================

-- 3️⃣ TABELA: instrumento_midias
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumento_midias'
ORDER BY ordinal_position;

| column_name      | data_type                   | is_nullable |
| ---------------- | --------------------------- | ----------- |
| id               | uuid                        | NO          |
| instrumento_id   | uuid                        | YES         |
| tipo             | character varying           | NO          |
| titulo           | character varying           | NO          |
| descricao        | text                        | YES         |
| url              | text                        | YES         |
| origem           | character varying           | YES         |
| arquivo_local    | text                        | YES         |
| tamanho_bytes    | bigint                      | YES         |
| mime_type        | character varying           | YES         |
| categoria        | character varying           | YES         |
| nivel            | character varying           | YES         |
| duracao_segundos | integer                     | YES         |
| tags             | jsonb                       | YES         |
| visualizacoes    | integer                     | YES         |
| ordem_exibicao   | integer                     | YES         |
| ativo            | boolean                     | YES         |
| created_at       | timestamp without time zone | YES         |

-- Ver exemplo de mídias
SELECT * FROM instrumento_midias LIMIT 3;


| id                                   | instrumento_id                       | tipo   | titulo                              | descricao                                                                    | url                                  | origem | arquivo_local | tamanho_bytes | mime_type | categoria    | nivel     | duracao_segundos | tags                              | visualizacoes | ordem_exibicao | ativo | created_at                 |
| ------------------------------------ | ------------------------------------ | ------ | ----------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------ | ------ | ------------- | ------------- | --------- | ------------ | --------- | ---------------- | --------------------------------- | ------------- | -------------- | ----- | -------------------------- |
| 4b5ef36c-dc1f-4186-8629-272b7aaefc72 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | imagem | Violão Clássico Espanhol Século XIX | Violão construído por Antonio de Torres, considerado o pai do violão moderno | /images/violao/torres_historico.jpg  | upload | null          | null          | null      | historia     | iniciante | null             | ["historia","classico","espanha"] | 0             | 0              | true  | 2025-06-08 01:05:48.886576 |
| 671e9d66-a692-4703-a242-4c983f0722c7 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | imagem | Violão Popular Brasileiro           | Violão típico da música popular brasileira com cordas de aço                 | /images/violao/violao_brasileiro.jpg | upload | null          | null          | null      | demonstracao | iniciante | null             | ["brasil","popular","cordas_aco"] | 0             | 0              | true  | 2025-06-08 01:05:48.886576 |
| 11834256-9b8b-4c7e-91c6-06c6a2036184 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | imagem | Anatomia do Violão                  | Diagrama detalhado mostrando todas as partes do violão                       | /images/violao/anatomia_violao.jpg   | upload | null          | null          | null      | tecnica      | iniciante | null             | ["anatomia","partes","educativo"] | 0             | 0              | true  | 2025-06-08 01:05:48.886576 |


-- Contar mídias por tipo
SELECT 
    tipo_midia,
    COUNT(*) as total
FROM instrumento_midias
GROUP BY tipo_midia;

ERROR:  42703: column "tipo_midia" does not exist
LINE 2:     tipo_midia,
            ^
Note: A limit of 100 was applied to your query. If this was the cause of a syntax error, try selecting "No limit" instead and re-run the query.


-- ============================================

-- 4️⃣ TABELA: instrumento_sons
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumento_sons'
ORDER BY ordinal_position;


| column_name       | data_type                   | is_nullable |
| ----------------- | --------------------------- | ----------- |
| id                | uuid                        | NO          |
| instrumento_id    | uuid                        | YES         |
| nota_musical      | character varying           | YES         |
| tecnica           | character varying           | YES         |
| dinamica          | character varying           | YES         |
| arquivo_audio     | text                        | NO          |
| waveform_data     | jsonb                       | YES         |
| bpm               | integer                     | YES         |
| tonalidade        | character varying           | YES         |
| artista_performer | character varying           | YES         |
| created_at        | timestamp without time zone | YES         |

-- Ver exemplo de sons
SELECT * FROM instrumento_sons LIMIT 3;


| id                                   | instrumento_id                       | nota_musical | tecnica     | dinamica | arquivo_audio                    | waveform_data | bpm | tonalidade | artista_performer      | created_at                 |
| ------------------------------------ | ------------------------------------ | ------------ | ----------- | -------- | -------------------------------- | ------------- | --- | ---------- | ---------------------- | -------------------------- |
| 18175792-1ddb-43c3-81df-e6e6b1091664 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Mi           | corda solta | mf       | /audio/violao/mi_corda_solta.mp3 | null          | 60  | E          | Professor Carlos Silva | 2025-06-08 01:05:32.806885 |
| 7b96c83e-fca6-4a13-8357-16a611eb811e | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Lá           | corda solta | mf       | /audio/violao/la_corda_solta.mp3 | null          | 60  | A          | Professor Carlos Silva | 2025-06-08 01:05:32.806885 |
| b9f8e6e5-daab-4ff4-a6de-39e63dfcab75 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Ré           | corda solta | mf       | /audio/violao/re_corda_solta.mp3 | null          | 60  | D          | Professor Carlos Silva | 2025-06-08 01:05:32.806885 |



-- ============================================

-- 5️⃣ TABELA: instrumento_sons_variacoes
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumento_sons_variacoes'
ORDER BY ordinal_position;

| column_name        | data_type                   | is_nullable |
| ------------------ | --------------------------- | ----------- |
| id                 | uuid                        | NO          |
| som_id             | uuid                        | YES         |
| arquivo_audio      | text                        | NO          |
| artista_performer  | character varying           | YES         |
| qualidade_gravacao | character varying           | YES         |
| instrumento_usado  | character varying           | YES         |
| local_gravacao     | character varying           | YES         |
| ano_gravacao       | integer                     | YES         |
| duracao_segundos   | integer                     | YES         |
| created_at         | timestamp without time zone | YES         |


-- Ver exemplo de variações de sons
SELECT * FROM instrumento_sons_variacoes LIMIT 3;

Success. No rows returned





-- ============================================

-- 6️⃣ TABELA: instrumento_tecnicas
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumento_tecnicas'
ORDER BY ordinal_position;


| column_name               | data_type                   | is_nullable |
| ------------------------- | --------------------------- | ----------- |
| id                        | uuid                        | NO          |
| instrumento_id            | uuid                        | YES         |
| nome                      | character varying           | NO          |
| descricao                 | text                        | YES         |
| nivel                     | character varying           | YES         |
| tipo_tecnica              | character varying           | YES         |
| grupo_tecnico             | character varying           | YES         |
| tempo_pratica_recomendado | integer                     | YES         |
| video_tutorial            | text                        | YES         |
| audio_exemplo             | text                        | YES         |
| partitura_url             | text                        | YES         |
| pre_requisitos            | text                        | YES         |
| ordem_aprendizado         | integer                     | YES         |
| created_at                | timestamp without time zone | YES         |


-- Ver exemplo de técnicas
SELECT * FROM instrumento_tecnicas LIMIT 3;


| id                                   | instrumento_id                       | nome                    | descricao                                                            | nivel     | tipo_tecnica | grupo_tecnico       | tempo_pratica_recomendado | video_tutorial            | audio_exemplo                  | partitura_url | pre_requisitos | ordem_aprendizado | created_at                 |
| ------------------------------------ | ------------------------------------ | ----------------------- | -------------------------------------------------------------------- | --------- | ------------ | ------------------- | ------------------------- | ------------------------- | ------------------------------ | ------------- | -------------- | ----------------- | -------------------------- |
| 7259a62a-4077-4d93-a2c4-2939324f4c39 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Postura Corporal        | Aprenda a posição correta do corpo, braços e mãos para tocar violão  | iniciante | postura      | Fundamentos Básicos | 10                        | /video/postura_violao.mp4 | null                           | null          | null           | 1                 | 2025-06-08 01:07:37.593134 |
| 66b22941-7f6d-4b42-85dd-b863728b7da5 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Posicionamento das Mãos | Posição correta da mão esquerda no braço e da mão direita nas cordas | iniciante | postura      | Fundamentos Básicos | 15                        | /video/posicao_maos.mp4   | null                           | null          | null           | 2                 | 2025-06-08 01:07:37.593134 |
| 588eab28-cb91-42fe-bd63-a3e4ad27ff0e | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Afinação do Violão      | Como afinar o violão usando afinador ou ouvido                       | iniciante | afinacao     | Fundamentos Básicos | 5                         | /video/afinacao.mp4       | /audio/afinacao_referencia.mp3 | null          | null           | 3                 | 2025-06-08 01:07:37.593134 |


-- Contar técnicas por instrumento
SELECT 
    i.nome as instrumento,
    COUNT(it.*) as total_tecnicas
FROM instrumentos i
LEFT JOIN instrumento_tecnicas it ON it.instrumento_id = i.id
GROUP BY i.id, i.nome
ORDER BY total_tecnicas DESC;

| instrumento          | total_tecnicas |
| -------------------- | -------------- |
| Guitarra             | 24             |
| Clarinete            | 13             |
| Baixo                | 13             |
| Piano                | 12             |
| Violoncelo           | 12             |
| Violão               | 12             |
| Trompete             | 12             |
| Saxofone             | 12             |
| Trombone             | 12             |
| Teclado              | 12             |
| Flauta               | 12             |
| Violino              | 12             |
| Contrabaixo Acústico | 12             |
| Bateria              | 12             |
| Viola Clássica       | 12             |
| Fagote               | 12             |
| Teoria Musical       | 0              |
| Eufônio              | 0              |
| Tuba                 | 0              |
| Oboé                 | 0              |
| Percussão Erudita    | 0              |
| Canto                | 0              |
| Outro                | 0              |



-- ============================================

-- 7️⃣ TABELA: instrumento_performances
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumento_performances'
ORDER BY ordinal_position;

| column_name          | data_type                   | is_nullable |
| -------------------- | --------------------------- | ----------- |
| id                   | uuid                        | NO          |
| instrumento_id       | uuid                        | YES         |
| titulo               | character varying           | NO          |
| artista              | character varying           | YES         |
| compositor           | character varying           | YES         |
| ano_performance      | integer                     | YES         |
| video_url            | text                        | YES         |
| audio_url            | text                        | YES         |
| genero_musical       | character varying           | YES         |
| dificuldade_execucao | character varying           | YES         |
| partitura_url        | text                        | YES         |
| descricao_tecnica    | text                        | YES         |
| visualizacoes        | integer                     | YES         |
| created_at           | timestamp without time zone | YES         |

-- Ver exemplo de performances
SELECT * FROM instrumento_performances LIMIT 3;

| id                                   | instrumento_id                       | titulo                   | artista           | compositor        | ano_performance | video_url                                      | audio_url | genero_musical | dificuldade_execucao | partitura_url | descricao_tecnica                                                                                                            | visualizacoes | created_at                 |
| ------------------------------------ | ------------------------------------ | ------------------------ | ----------------- | ----------------- | --------------- | ---------------------------------------------- | --------- | -------------- | -------------------- | ------------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------- | -------------------------- |
| 6b6bfc07-ea0a-4e04-9f02-3cf026b7a700 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Asturias (Leyenda)       | Andrés Segovia    | Isaac Albéniz     | 1950            | https://youtube.com/watch?v=asturias_segovia   | null      | Clássico       | avancado             | null          | Peça originalmente para piano, transcrita magistralmente por Segovia. Técnicas: tremolo, escalas rápidas, acordes complexos. | 0             | 2025-06-08 01:08:28.465107 |
| bfdec516-f4ea-435e-9cf9-f2986e7a9db1 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Choro da Saudade         | Baden Powell      | Baden Powell      | 1966            | https://youtube.com/watch?v=choro_saudade      | null      | Choro/MPB      | intermediario        | null          | Choro brasileiro com elementos do jazz. Técnicas: dedilhado sincopado, acordes com baixo alternado.                          | 0             | 2025-06-08 01:08:28.465107 |
| c2469dd5-6589-4b5b-9e62-9b5beb998769 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Recuerdos de la Alhambra | Francisco Tárrega | Francisco Tárrega | 1896            | https://youtube.com/watch?v=recuerdos_alhambra | null      | Clássico       | avancado             | null          | Obra-prima do tremolo. Uma das peças mais difíceis do repertório clássico, exigindo tremolo perfeito por minutos seguidos.   | 0             | 2025-06-08 01:08:28.465107 |



-- ============================================

-- 8️⃣ TABELA: instrumento_quiz
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumento_quiz'
ORDER BY ordinal_position;

| column_name           | data_type                   | is_nullable |
| --------------------- | --------------------------- | ----------- |
| id                    | uuid                        | NO          |
| instrumento_id        | uuid                        | YES         |
| pergunta              | text                        | NO          |
| opcoes                | text                        | NO          |
| resposta_correta      | character varying           | YES         |
| respostas_corretas    | jsonb                       | YES         |
| tipo_pergunta         | character varying           | YES         |
| arquivo_audio         | text                        | YES         |
| imagem_url            | text                        | YES         |
| tempo_limite_segundos | integer                     | YES         |
| explicacao            | text                        | YES         |
| dificuldade           | character varying           | YES         |
| categoria             | character varying           | YES         |
| ativo                 | boolean                     | YES         |
| created_at            | timestamp without time zone | YES         |


-- Ver exemplo de quiz
SELECT * FROM instrumento_quiz LIMIT 3;


| id                                   | instrumento_id                       | pergunta                                                                  | opcoes                                                                                                 | resposta_correta | respostas_corretas | tipo_pergunta    | arquivo_audio | imagem_url | tempo_limite_segundos | explicacao                                                                                                 | dificuldade | categoria | ativo | created_at                 |
| ------------------------------------ | ------------------------------------ | ------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ---------------- | ------------------ | ---------------- | ------------- | ---------- | --------------------- | ---------------------------------------------------------------------------------------------------------- | ----------- | --------- | ----- | -------------------------- |
| 0fefe250-9540-4d12-a212-fd9061a996e8 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Quem é considerado o "pai do violão moderno"?                             | ["A) Andrés Segovia", "B) Antonio de Torres", "C) Francisco Tárrega", "D) Julian Bream"]               | null             | ["B"]              | multipla_escolha | null          | null       | 30                    | Antonio de Torres Jurado (1817-1892) padronizou as dimensões e proporções do violão moderno no século XIX. | medio       | historia  | true  | 2025-06-08 01:08:54.801634 |
| c9af57f2-4c53-440e-9b3d-60f7d291ef05 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Em que século o violão chegou ao Brasil?                                  | ["A) Século XV", "B) Século XVI", "C) Século XVII", "D) Século XVIII"]                                 | null             | ["B"]              | multipla_escolha | null          | null       | 30                    | O violão chegou ao Brasil no século XVI com os colonizadores portugueses.                                  | facil       | historia  | true  | 2025-06-08 01:08:54.801634 |
| 5a74c433-5fb7-4de3-8799-84baddef8993 | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | Qual a afinação padrão do violão (da corda mais grave para a mais aguda)? | ["A) Mi-Lá-Ré-Sol-Si-Mi", "B) Lá-Ré-Sol-Dó-Mi-Lá", "C) Ré-Sol-Dó-Fá-Lá-Ré", "D) Sol-Dó-Fá-Sib-Ré-Sol"] | null             | ["A"]              | multipla_escolha | null          | null       | 30                    | A afinação padrão é E-A-D-G-B-E (Mi-Lá-Ré-Sol-Si-Mi), com a 6ª corda sendo o Mi mais grave.                | facil       | tecnica   | true  | 2025-06-08 01:08:54.801634 |



-- ============================================

-- 9️⃣ TABELA: instrumentos_relacionados
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumentos_relacionados'
ORDER BY ordinal_position;

| column_name        | data_type                   | is_nullable |
| ------------------ | --------------------------- | ----------- |
| id                 | uuid                        | NO          |
| instrumento_id     | uuid                        | YES         |
| relacionado_id     | uuid                        | YES         |
| tipo_relacao       | character varying           | YES         |
| descricao_relacao  | text                        | YES         |
| similaridade_score | integer                     | YES         |
| created_at         | timestamp without time zone | YES         |


-- Ver exemplo de relações
SELECT 
    i1.nome as instrumento_principal,
    i2.nome as instrumento_relacionado,
    ir.tipo_relacao,
    ir.descricao
FROM instrumentos_relacionados ir
JOIN instrumentos i1 ON i1.id = ir.instrumento_id
JOIN instrumentos i2 ON i2.id = ir.relacionado_id
LIMIT 5;

ERROR:  42703: column ir.descricao does not exist
LINE 5:     ir.descricao
            ^
HINT:  Perhaps you meant to reference the column "i1.descricao" or the column "i2.descricao".


-- ============================================

-- 🔟 TABELA: instrumentos_fisicos (estoque físico da escola)
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
    AND table_name = 'instrumentos_fisicos'
ORDER BY ordinal_position;


| column_name       | data_type                   | is_nullable |
| ----------------- | --------------------------- | ----------- |
| id                | uuid                        | NO          |
| instrumento_id    | uuid                        | YES         |
| codigo_patrimonio | character varying           | YES         |
| numero_serie      | character varying           | YES         |
| marca             | character varying           | YES         |
| modelo            | character varying           | YES         |
| valor_aquisicao   | numeric                     | YES         |
| data_aquisicao    | date                        | YES         |
| proprietario      | character varying           | YES         |
| estado            | character varying           | YES         |
| localizacao       | character varying           | YES         |
| disponivel        | boolean                     | YES         |
| observacoes       | text                        | YES         |
| created_at        | timestamp without time zone | YES         |
| updated_at        | timestamp without time zone | YES         |

-- Ver instrumentos físicos disponíveis
SELECT 
    i.nome,
    if_.*
FROM instrumentos_fisicos if_
JOIN instrumentos i ON i.id = if_.instrumento_id
LIMIT 5;


| nome     | id                                   | instrumento_id                       | codigo_patrimonio | numero_serie | marca  | modelo | valor_aquisicao | data_aquisicao | proprietario | estado | localizacao                | disponivel | observacoes                                       | created_at                 | updated_at                 |
| -------- | ------------------------------------ | ------------------------------------ | ----------------- | ------------ | ------ | ------ | --------------- | -------------- | ------------ | ------ | -------------------------- | ---------- | ------------------------------------------------- | -------------------------- | -------------------------- |
| Teclado  | e399c07c-d862-43ca-ac4f-4b65595d6efa | 8bd473f1-7b35-4b9e-869a-17fb73c6e047 | TESTE-001         | SN-001       | Yamaha | F310   | 1500.00         | 2025-06-07     | Escola       | bom    | Sala A                     | true       | Registro de teste para validação de estatísticas. | 2025-06-07 23:26:43.562962 | 2025-06-07 23:26:43.562962 |
| Teclado  | 4e001976-b32a-4080-9848-b99e6bc0b2f3 | 8bd473f1-7b35-4b9e-869a-17fb73c6e047 | null              | NS-TEC-001   | null   | null   | 1200.00         | 2024-09-08     | igreja       | bom    | Sala de Música - Armário A | true       | null                                              | 2025-09-08 16:51:29.842673 | 2025-09-08 16:51:29.842673 |
| Flauta   | 67183e71-bd7a-486a-b567-1a450baa69d7 | 794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08 | null              | NS-FLA-001   | null   | null   | 600.00          | 2024-09-08     | igreja       | bom    | Sala de Música - Armário A | true       | null                                              | 2025-09-08 16:51:29.842673 | 2025-09-08 16:51:29.842673 |
| Violão   | c257475f-abf7-4c03-99b1-eb6dab5cb06d | 750450cf-e14e-4f02-944e-b3c1bb0f87a4 | null              | NS-VIO-001   | null   | null   | 800.00          | 2024-09-08     | igreja       | bom    | Sala de Música - Armário A | true       | null                                              | 2025-09-08 16:51:29.842673 | 2025-09-08 16:51:29.842673 |
| Saxofone | 5ec3afce-e8ea-4580-bdb2-a2a30af32fb9 | 26cadf44-6d7b-4f9b-85d6-6b2c40715f45 | null              | NS-SAX-001   | null   | null   | 600.00          | 2024-09-08     | igreja       | bom    | Sala de Música - Armário A | true       | null                                              | 2025-09-08 16:51:29.842673 | 2025-09-08 16:51:29.842673 |



-- ============================================
-- 📊 QUERY MASTER: BUSCAR TUDO DE UM INSTRUMENTO ESPECÍFICO
-- Substitua 'UUID_AQUI' pelo UUID de um instrumento real
-- ============================================

-- Instrumento base
SELECT * FROM instrumentos WHERE id = 'UUID_AQUI';

-- Todas as curiosidades
SELECT * FROM instrumento_curiosidades WHERE instrumento_id = 'UUID_AQUI';

-- Todas as mídias
SELECT * FROM instrumento_midias WHERE instrumento_id = 'UUID_AQUI';

-- Todos os sons
SELECT * FROM instrumento_sons WHERE instrumento_id = 'UUID_AQUI';

-- Todas as técnicas
SELECT * FROM instrumento_tecnicas WHERE instrumento_id = 'UUID_AQUI';

-- Todas as performances
SELECT * FROM instrumento_performances WHERE instrumento_id = 'UUID_AQUI';

-- Todos os quiz
SELECT * FROM instrumento_quiz WHERE instrumento_id = 'UUID_AQUI';

-- Instrumentos relacionados
SELECT 
    ir.*,
    i.nome as nome_relacionado
FROM instrumentos_relacionados ir
JOIN instrumentos i ON i.id = ir.relacionado_id
WHERE ir.instrumento_id = 'UUID_AQUI';

-- Instrumentos físicos disponíveis
SELECT * FROM instrumentos_fisicos WHERE instrumento_id = 'UUID_AQUI';
