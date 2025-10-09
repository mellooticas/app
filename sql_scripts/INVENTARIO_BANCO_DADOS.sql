-- ============================================
-- 📊 INVENTÁRIO COMPLETO DO BANCO DE DADOS
-- Execute este script no Supabase SQL Editor
-- ============================================

-- Verificar quais tabelas existem e quantos registros cada uma tem

SELECT 
  schemaname,
  tablename,
  (xpath('/row/cnt/text()', 
    query_to_xml('SELECT COUNT(*) AS cnt FROM ' || schemaname || '.' || tablename, false, true, ''))
  )[1]::text::int AS total_registros
FROM pg_tables
WHERE schemaname = 'public'
  AND tablename NOT LIKE 'pg_%'
  AND tablename NOT LIKE 'sql_%'
ORDER BY tablename;

-- ============================================
-- 🎵 VERIFICAR TABELAS DE INSTRUMENTOS
-- ============================================

-- Contar categorias de instrumentos
SELECT 'categorias_instrumentos' as tabela, COUNT(*) as total
FROM categorias_instrumentos
UNION ALL
-- Contar instrumentos
SELECT 'biblioteca_instrumentos', COUNT(*)
FROM biblioteca_instrumentos
UNION ALL
-- Contar vídeos
SELECT 'videos_professores', COUNT(*)
FROM videos_professores
UNION ALL
-- Contar categorias de vídeos
SELECT 'categorias_videos', COUNT(*)
FROM categorias_videos
UNION ALL
-- Contar repertório
SELECT 'repertorio', COUNT(*)
FROM repertorio
UNION ALL
-- Contar categorias de repertório
SELECT 'categorias_repertorio', COUNT(*)
FROM categorias_repertorio
UNION ALL
-- Contar metodologias
SELECT 'metodologias', COUNT(*)
FROM metodologias
UNION ALL
-- Contar metodologias Alpha
SELECT 'alpha_metodologias', COUNT(*)
FROM alpha_metodologias
UNION ALL
-- Contar desafios Alpha
SELECT 'alpha_desafios', COUNT(*)
FROM alpha_desafios
UNION ALL
-- Contar história - períodos
SELECT 'historia_periodos', COUNT(*)
FROM historia_periodos
UNION ALL
-- Contar história - compositores
SELECT 'historia_compositores', COUNT(*)
FROM historia_compositores
UNION ALL
-- Contar progresso do aluno
SELECT 'progresso_aluno', COUNT(*)
FROM progresso_aluno
ORDER BY tabela;

-- ============================================
-- 📸 MOSTRAR EXEMPLOS DE DADOS
-- ============================================

-- Mostrar 3 instrumentos (se existirem)
SELECT 'INSTRUMENTOS:' as tipo, nome, origem, nivel_dificuldade
FROM biblioteca_instrumentos
LIMIT 3;

-- Mostrar 3 vídeos (se existirem)
SELECT 'VIDEOS:' as tipo, titulo, instrumento_foco, modulo
FROM videos_professores
LIMIT 3;

-- Mostrar 3 metodologias (se existirem)
SELECT 'METODOLOGIAS:' as tipo, nome, fundador, pais_origem
FROM metodologias
LIMIT 3;

-- Mostrar 3 desafios Alpha (se existirem)
SELECT 'DESAFIOS ALPHA:' as tipo, titulo, metodologia, nivel_dificuldade
FROM alpha_desafios
LIMIT 3;
