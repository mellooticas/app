-- ============================================
-- 🎵 POPULAR DADOS DE INSTRUMENTOS
-- Execute no Supabase SQL Editor
-- ============================================

-- ============================================
-- 1. CATEGORIAS DE INSTRUMENTOS
-- ============================================

INSERT INTO categorias_instrumentos (nome, descricao, icone, ordem_exibicao) VALUES
('Cordas', 'Instrumentos que produzem som através da vibração de cordas', '🎸', 1),
('Sopro', 'Instrumentos de sopro - madeiras e metais', '🎺', 2),
('Percussão', 'Instrumentos percussivos e de bateria', '🥁', 3),
('Teclados', 'Piano, órgão e teclados eletrônicos', '🎹', 4),
('Eletrônicos', 'Sintetizadores e instrumentos digitais', '🎛️', 5)
ON CONFLICT (nome) DO NOTHING;

-- ============================================
-- 2. BIBLIOTECA DE INSTRUMENTOS
-- ============================================

-- Piano
INSERT INTO biblioteca_instrumentos (
  nome, categoria_id, origem, historia, curiosidades,
  uso_tradicional, uso_moderno, classificacao, material,
  afinacao, tecnicas_basicas, nivel_dificuldade,
  idade_recomendada, disponivel_escola, ativo
) SELECT
  'Piano',
  id,
  'Itália',
  'O piano foi inventado por Bartolomeo Cristofori em 1700. É um instrumento de cordas percutidas que revolucionou a música ocidental.',
  'O nome "piano" vem de "pianoforte", que significa "suave-forte", referindo-se à capacidade de tocar em diferentes volumes.',
  'Música clássica, concertos, acompanhamento de voz',
  'Jazz, pop, rock, música eletrônica, trilhas sonoras',
  'Cordofone percutido',
  'Madeira (corpo), metal (cordas), feltro (martelos)',
  'Temperamento igual, 88 teclas',
  'Postura, posição das mãos, leitura de partitura, pedais',
  'intermediário',
  '7 anos em diante',
  true,
  true
FROM categorias_instrumentos WHERE nome = 'Teclados'
ON CONFLICT (nome) DO NOTHING;

-- Violão
INSERT INTO biblioteca_instrumentos (
  nome, categoria_id, origem, historia, curiosidades,
  uso_tradicional, uso_moderno, classificacao, material,
  afinacao, tecnicas_basicas, nivel_dificuldade,
  idade_recomendada, disponivel_escola, ativo
) SELECT
  'Violão',
  id,
  'Espanha',
  'O violão moderno evoluiu da vihuela e do alaúde no século XIX. É um dos instrumentos mais populares do mundo.',
  'Existem mais de 50 milhões de violões no mundo. É o instrumento mais buscado para iniciantes.',
  'Música folclórica, serenatas, flamenco',
  'MPB, samba, bossa nova, pop, rock acústico',
  'Cordofone dedilhado',
  'Madeira (tampo, fundo, laterais), metal ou nylon (cordas)',
  'E-A-D-G-B-E (Mi-Lá-Ré-Sol-Si-Mi)',
  'Posição dos dedos, acordes básicos, ritmo, dedilhado',
  'iniciante',
  '6 anos em diante',
  true,
  true
FROM categorias_instrumentos WHERE nome = 'Cordas'
ON CONFLICT (nome) DO NOTHING;

-- Flauta Doce
INSERT INTO biblioteca_instrumentos (
  nome, categoria_id, origem, historia, curiosidades,
  uso_tradicional, uso_moderno, classificacao, material,
  afinacao, tecnicas_basicas, nivel_dificuldade,
  idade_recomendada, disponivel_escola, ativo
) SELECT
  'Flauta Doce',
  id,
  'Europa',
  'A flauta doce foi muito popular na Europa renascentista e barroca. É um instrumento ideal para iniciantes.',
  'Shakespeare menciona a flauta doce em "Hamlet". É usada em escolas de música do mundo todo.',
  'Música medieval e renascentista, música barroca',
  'Educação musical, música contemporânea, world music',
  'Aerofone',
  'Madeira, plástico',
  'Dó maior (soprano) ou Fá maior (contralto)',
  'Respiração, posição dos dedos, articulação, embocadura',
  'iniciante',
  '5 anos em diante',
  true,
  true
FROM categorias_instrumentos WHERE nome = 'Sopro'
ON CONFLICT (nome) DO NOTHING;

-- Bateria
INSERT INTO biblioteca_instrumentos (
  nome, categoria_id, origem, historia, curiosidades,
  uso_tradicional, uso_moderno, classificacao, material,
  afinacao, tecnicas_basicas, nivel_dificuldade,
  idade_recomendada, disponivel_escola, ativo
) SELECT
  'Bateria',
  id,
  'Estados Unidos',
  'A bateria moderna foi inventada no início do século XX, combinando vários tambores e pratos em um único instrumento.',
  'Um baterista profissional pode queimar até 600 calorias por hora tocando!',
  'Jazz, swing, big bands',
  'Rock, pop, funk, metal, hip hop',
  'Membranofone + Idiofone',
  'Madeira (corpo), pele sintética ou natural (peles), metal (pratos)',
  'Afinação por tensão das peles',
  'Coordenação motora, independência dos membros, leitura rítmica, rudimentos',
  'intermediário',
  '8 anos em diante',
  true,
  true
FROM categorias_instrumentos WHERE nome = 'Percussão'
ON CONFLICT (nome) DO NOTHING;

-- Teclado Eletrônico
INSERT INTO biblioteca_instrumentos (
  nome, categoria_id, origem, historia, curiosidades,
  uso_tradicional, uso_moderno, classificacao, material,
  afinacao, tecnicas_basicas, nivel_dificuldade,
  idade_recomendada, disponivel_escola, ativo
) SELECT
  'Teclado Eletrônico',
  id,
  'Japão/Estados Unidos',
  'Os teclados eletrônicos modernos surgiram na década de 1960, revolucionando a produção musical.',
  'O Minimoog (1970) foi um dos primeiros sintetizadores portáteis e mudou a música pop.',
  'Música experimental, trilhas sonoras',
  'Pop, eletrônica, house, techno, produção musical',
  'Eletrônico',
  'Plástico, metal, componentes eletrônicos',
  'Digital, afinação automática',
  'Operação de controles, programação de timbres, sequenciamento',
  'iniciante',
  '6 anos em diante',
  true,
  true
FROM categorias_instrumentos WHERE nome = 'Eletrônicos'
ON CONFLICT (nome) DO NOTHING;

-- ============================================
-- 3. CATEGORIAS DE VÍDEOS
-- ============================================

INSERT INTO categorias_videos (nome, descricao, icone, cor_tema) VALUES
('Técnicas', 'Técnicas instrumentais e exercícios', '✋', '#3B82F6'),
('Teoria', 'Teoria musical e harmonia', '📚', '#8B5CF6'),
('Performance', 'Apresentações e performances', '🎭', '#EC4899'),
('História', 'História da música e contexto cultural', '📜', '#F59E0B'),
('Repertório', 'Músicas e arranjos', '🎵', '#10B981')
ON CONFLICT (nome) DO NOTHING;

-- ============================================
-- 4. VÍDEOS DE EXEMPLO
-- ============================================

-- Vídeo de Piano
INSERT INTO videos_professores (
  titulo, categoria_id, professor_id, descricao,
  duracao, video_url, modulo, instrumento_foco,
  nivel_dificuldade, publico, ativo
) SELECT
  'Introdução ao Piano - Postura e Primeiras Notas',
  cv.id,
  (SELECT id FROM auth.users LIMIT 1),
  'Aprenda a postura correta e as primeiras notas no piano. Ideal para iniciantes.',
  720,
  'https://example.com/video-piano-introducao.mp4',
  'Módulo 1 - Fundamentos',
  'Piano',
  'iniciante',
  true,
  true
FROM categorias_videos cv WHERE cv.nome = 'Técnicas'
ON CONFLICT (titulo) DO NOTHING;

-- Vídeo de Violão
INSERT INTO videos_professores (
  titulo, categoria_id, professor_id, descricao,
  duracao, video_url, modulo, instrumento_foco,
  nivel_dificuldade, publico, ativo
) SELECT
  'Acordes Básicos de Violão',
  cv.id,
  (SELECT id FROM auth.users LIMIT 1),
  'Aprenda os acordes mais usados no violão: C, G, D, Am, Em.',
  540,
  'https://example.com/video-violao-acordes.mp4',
  'Módulo 1 - Fundamentos',
  'Violão',
  'iniciante',
  true,
  true
FROM categorias_videos cv WHERE cv.nome = 'Técnicas'
ON CONFLICT (titulo) DO NOTHING;

-- ============================================
-- 5. CATEGORIAS DE REPERTÓRIO
-- ============================================

INSERT INTO categorias_repertorio (nome, descricao, cor_tema, ordem_exibicao) VALUES
('Tradicional Japonês', 'Músicas tradicionais japonesas', '#DC2626', 1),
('Gospel', 'Músicas gospel e religiosas', '#7C3AED', 2),
('Popular Brasileira', 'MPB, samba, bossa nova', '#059669', 3),
('Clássica', 'Repertório clássico ocidental', '#1E40AF', 4),
('Infantil', 'Canções infantis educativas', '#F59E0B', 5)
ON CONFLICT (nome) DO NOTHING;

-- ============================================
-- 6. REPERTÓRIO DE EXEMPLO
-- ============================================

-- Sakura Sakura
INSERT INTO repertorio (
  titulo, categoria_id, compositor, tonalidade,
  andamento, nivel_dificuldade, publico, ativo
) SELECT
  'Sakura Sakura',
  id,
  'Tradicional',
  'Lá menor pentatônica',
  'Andante (72 bpm)',
  'iniciante',
  true,
  true
FROM categorias_repertorio WHERE nome = 'Tradicional Japonês'
ON CONFLICT (titulo) DO NOTHING;

-- Amazing Grace
INSERT INTO repertorio (
  titulo, categoria_id, compositor, tonalidade,
  andamento, nivel_dificuldade, publico, ativo
) SELECT
  'Amazing Grace',
  id,
  'John Newton',
  'Sol maior',
  'Moderato (80 bpm)',
  'iniciante',
  true,
  true
FROM categorias_repertorio WHERE nome = 'Gospel'
ON CONFLICT (titulo) DO NOTHING;

-- ============================================
-- VERIFICAR RESULTADOS
-- ============================================

SELECT 'Categorias de Instrumentos' as tabela, COUNT(*) as total FROM categorias_instrumentos
UNION ALL
SELECT 'Instrumentos', COUNT(*) FROM biblioteca_instrumentos
UNION ALL
SELECT 'Categorias de Vídeos', COUNT(*) FROM categorias_videos
UNION ALL
SELECT 'Vídeos', COUNT(*) FROM videos_professores
UNION ALL
SELECT 'Categorias de Repertório', COUNT(*) FROM categorias_repertorio
UNION ALL
SELECT 'Repertório', COUNT(*) FROM repertorio;
