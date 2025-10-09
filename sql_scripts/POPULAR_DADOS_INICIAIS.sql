-- ============================================
-- SCRIPT DE POPULARIZAÇÃO INICIAL
-- Banco de Dados Nipo School
-- ============================================
-- Este script adiciona dados iniciais para teste
-- Execute no SQL Editor do Supabase Dashboard
-- ============================================

-- ============================================
-- 1. BADGES PADRÃO DO SISTEMA
-- ============================================

-- Badges de Primeiro Passo
INSERT INTO public.gamification_badges (usuario_id, tipo_badge, nome_badge, descricao, icone, cor, metadata)
SELECT 
  u.id,
  'primeiro_acesso',
  'Bem-vindo!',
  'Primeiro acesso à plataforma',
  '👋',
  '#3B82F6',
  '{"categoria": "onboarding", "raridade": "comum"}'::jsonb
FROM auth.users u
WHERE u.email = 'tgjphotos@gmail.com'
ON CONFLICT DO NOTHING;

-- ============================================
-- 2. CONQUISTAS DISPONÍVEIS
-- ============================================

-- Conquista: Primeiro Desafio
INSERT INTO public.gamification_conquistas (usuario_id, tipo_conquista, nome_conquista, descricao, valor_conquista, metadata)
SELECT 
  u.id,
  'desafio_completado',
  'Desbravador',
  'Completou o primeiro desafio Alpha',
  50,
  '{"categoria": "desafios", "icone": "🎯"}'::jsonb
FROM auth.users u
WHERE u.email = 'tgjphotos@gmail.com'
ON CONFLICT DO NOTHING;

-- ============================================
-- 3. HISTÓRICO DE PONTOS
-- ============================================

-- Pontos de boas-vindas
INSERT INTO public.gamification_pontos (usuario_id, pontos, fonte, descricao, metadata)
SELECT 
  u.id,
  100,
  'bonus_boas_vindas',
  'Bônus de boas-vindas ao sistema',
  '{"tipo": "bonus_inicial"}'::jsonb
FROM auth.users u
WHERE u.email = 'tgjphotos@gmail.com';

-- ============================================
-- 4. METODOLOGIAS ALPHA
-- ============================================

-- Metodologia Orff
INSERT INTO public.alpha_metodologias (
  nome,
  slug,
  descricao_curta,
  descricao_completa,
  fundador,
  ano_criacao,
  pais_origem,
  principios_fundamentais,
  objetivos_pedagogicos,
  faixa_etaria,
  instrumentos_utilizados,
  atividades_tipicas,
  beneficios,
  icone,
  cor_principal,
  ativo,
  ordem
) VALUES (
  'Orff',
  'orff',
  'Educação musical baseada em improvisação, movimento e instrumentos de percussão',
  'O Método Orff-Schulwerk combina música, movimento, fala e drama de forma integrada. Desenvolvido por Carl Orff, enfatiza a experiência criativa e a improvisação.',
  'Carl Orff',
  1924,
  'Alemanha',
  ARRAY['Improvisação', 'Experiência prática', 'Integração das artes', 'Aprendizado por exploração'],
  ARRAY['Desenvolver criatividade musical', 'Integrar música com movimento', 'Promover expressão individual', 'Desenvolver senso rítmico'],
  '3 a 18 anos',
  ARRAY['Xilofones', 'Metalofones', 'Carrilhões', 'Instrumentos de percussão', 'Flautas doces'],
  ARRAY['Improvisação rítmica', 'Criação de ostinatos', 'Danças folclóricas', 'Jogos musicais', 'Imitação e eco'],
  ARRAY['Desenvolvimento da criatividade', 'Coordenação motora', 'Expressão corporal', 'Trabalho em grupo', 'Autoconfiança'],
  '🎵',
  '#FF6B6B',
  true,
  1
) ON CONFLICT (slug) DO NOTHING;

-- Metodologia Suzuki
INSERT INTO public.alpha_metodologias (
  nome,
  slug,
  descricao_curta,
  descricao_completa,
  fundador,
  ano_criacao,
  pais_origem,
  principios_fundamentais,
  objetivos_pedagogicos,
  faixa_etaria,
  instrumentos_utilizados,
  atividades_tipicas,
  beneficios,
  icone,
  cor_principal,
  ativo,
  ordem
) VALUES (
  'Suzuki',
  'suzuki',
  'Método de aprendizagem musical baseado na língua materna',
  'Desenvolvido por Shinichi Suzuki, o método se baseia na ideia de que toda criança pode aprender música da mesma forma que aprende sua língua materna.',
  'Shinichi Suzuki',
  1945,
  'Japão',
  ARRAY['Aprendizagem pela escuta', 'Participação dos pais', 'Repetição e prática', 'Ambiente encorajador'],
  ARRAY['Desenvolver habilidades técnicas', 'Cultivar caráter nobre', 'Criar amor pela música', 'Desenvolver concentração'],
  '3 a 12 anos',
  ARRAY['Violino', 'Viola', 'Violoncelo', 'Piano', 'Flauta'],
  ARRAY['Escuta diária', 'Repetição de peças', 'Prática em grupo', 'Recitais', 'Memorização'],
  ARRAY['Desenvolvimento auditivo refinado', 'Disciplina', 'Autoestima', 'Coordenação fina', 'Paciência'],
  '🎻',
  '#4ECDC4',
  true,
  2
);

-- Metodologia Kodály
INSERT INTO public.alpha_metodologias (
  nome,
  slug,
  descricao_curta,
  descricao_completa,
  fundador,
  ano_criacao,
  pais_origem,
  principios_fundamentais,
  objetivos_pedagogicos,
  faixa_etaria,
  instrumentos_utilizados,
  atividades_tipicas,
  beneficios,
  icone,
  cor_principal,
  ativo,
  ordem
) VALUES (
  'Kodály',
  'kodaly',
  'Método húngaro focado em canto, leitura musical e folclore',
  'Zoltán Kodály desenvolveu um método que enfatiza o canto como base da educação musical, usando o sistema de dó móvel e manossolfa.',
  'Zoltán Kodály',
  1925,
  'Hungria',
  ARRAY['Canto como base', 'Música folclórica', 'Leitura musical desde cedo', 'Sequência pedagógica'],
  ARRAY['Desenvolver alfabetização musical', 'Cantar afinadamente', 'Ler partituras fluentemente', 'Apreciar cultura musical'],
  '5 a 14 anos',
  ARRAY['Voz', 'Instrumentos de percussão simples'],
  ARRAY['Solfejo', 'Manossolfa', 'Jogos rítmicos', 'Canções folclóricas', 'Ditados musicais'],
  ARRAY['Leitura musical proficiente', 'Afinação vocal', 'Memória musical', 'Compreensão teórica', 'Conexão cultural'],
  '🎼',
  '#95E1D3',
  true,
  3
);

-- ============================================
-- 5. DESAFIOS ALPHA (Exemplos)
-- ============================================

-- Desafio Orff 01
INSERT INTO public.alpha_desafios (
  metodologia_id,
  codigo,
  titulo,
  descricao,
  objetivos,
  tipo_desafio,
  nivel,
  dificuldade,
  pontos_base,
  duracao_estimada,
  competencias,
  criterios_avaliacao,
  recursos_necessarios,
  instrucoes_detalhadas,
  ativo,
  ordem
)
SELECT 
  m.id,
  'ORFF-01',
  'Criação de Ostinato Rítmico',
  'Crie um padrão rítmico repetitivo (ostinato) de 4 tempos usando um instrumento de percussão.',
  ARRAY['Compreender o conceito de ostinato', 'Desenvolver senso rítmico', 'Praticar improvisação'],
  'pratico',
  'iniciante',
  1,
  50,
  '30 minutos',
  ARRAY['Ritmo', 'Criatividade', 'Coordenação motora'],
  jsonb_build_object(
    'ritmo_claro', jsonb_build_object('peso', 40, 'descricao', 'O padrão rítmico é claro e consistente'),
    'criatividade', jsonb_build_object('peso', 30, 'descricao', 'Demonstra originalidade na criação'),
    'execucao', jsonb_build_object('peso', 30, 'descricao', 'Executa o ostinato com precisão')
  ),
  ARRAY['Instrumento de percussão (pandeiro, tambor, etc.)', 'Dispositivo para gravação (celular)'],
  E'1. Escolha um instrumento de percussão\n2. Crie um padrão rítmico de 4 tempos\n3. Pratique até conseguir repetir com consistência\n4. Grave um vídeo de 30 segundos executando seu ostinato\n5. Submeta o vídeo junto com uma breve descrição do seu padrão',
  true,
  1
FROM public.alpha_metodologias m
WHERE m.slug = 'orff';

-- Desafio Suzuki 01
INSERT INTO public.alpha_desafios (
  metodologia_id,
  codigo,
  titulo,
  descricao,
  objetivos,
  tipo_desafio,
  nivel,
  dificuldade,
  pontos_base,
  duracao_estimada,
  competencias,
  criterios_avaliacao,
  recursos_necessarios,
  instrucoes_detalhadas,
  ativo,
  ordem
)
SELECT 
  m.id,
  'SUZUKI-01',
  'Escuta Ativa Diária',
  'Pratique a escuta ativa de uma peça do repertório Suzuki por 7 dias consecutivos.',
  ARRAY['Desenvolver ouvido musical', 'Memorizar melodias', 'Cultivar disciplina diária'],
  'teorico',
  'iniciante',
  1,
  30,
  '10 minutos por dia',
  ARRAY['Percepção auditiva', 'Memória musical', 'Disciplina'],
  jsonb_build_object(
    'consistencia', jsonb_build_object('peso', 50, 'descricao', 'Praticou todos os 7 dias'),
    'descricao_experiencia', jsonb_build_object('peso', 30, 'descricao', 'Descreve bem sua experiência'),
    'aprendizado', jsonb_build_object('peso', 20, 'descricao', 'Demonstra aprendizado auditivo')
  ),
  ARRAY['Dispositivo com acesso à gravação (celular, computador)', 'Fones de ouvido (opcional)'],
  E'1. Escolha uma peça do repertório Suzuki\n2. Ouça a peça completa 3 vezes por dia durante 7 dias\n3. Anote suas observações diárias em um diário\n4. No 7º dia, tente cantar ou tocar a melodia de memória\n5. Submeta seu diário de escuta e uma gravação da melodia',
  true,
  1
FROM public.alpha_metodologias m
WHERE m.slug = 'suzuki';

-- ============================================
-- 6. TURMAS EXEMPLO
-- ============================================

-- Turma de Violão Iniciante
INSERT INTO public.turmas (
  nome,
  descricao,
  professor_id,
  instrumento_id,
  nivel,
  max_alunos,
  horario,
  dias_semana,
  data_inicio,
  data_fim,
  ativo
)
SELECT 
  'Violão Iniciante - Turma A',
  'Turma para iniciantes que nunca tocaram violão. Aprenderemos acordes básicos, ritmos simples e músicas populares.',
  p.id,
  i.id,
  'iniciante',
  12,
  '14:00-15:30',
  ARRAY['Segunda', 'Quarta'],
  CURRENT_DATE,
  CURRENT_DATE + INTERVAL '6 months',
  true
FROM auth.users u
JOIN public.professors p ON p.id = u.id
JOIN public.biblioteca_instrumentos i ON i.nome ILIKE '%violão%'
WHERE u.user_metadata->>'tipo_usuario' = 'professor'
LIMIT 1
ON CONFLICT DO NOTHING;

-- ============================================
-- 7. MATRICULAR ALUNO DE TESTE
-- ============================================

INSERT INTO public.matriculas (
  aluno_id,
  turma_id,
  data_matricula,
  status,
  progresso_percentual
)
SELECT 
  a.id,
  t.id,
  CURRENT_DATE,
  'ativa',
  0
FROM auth.users u
JOIN public.alunos a ON a.id = u.id
CROSS JOIN public.turmas t
WHERE u.email = 'tgjphotos@gmail.com'
  AND t.nome LIKE '%Iniciante%'
LIMIT 1
ON CONFLICT DO NOTHING;

-- ============================================
-- 8. AULAS DA TURMA
-- ============================================

-- Criar 5 próximas aulas
INSERT INTO public.aulas (
  turma_id,
  titulo,
  descricao,
  data_aula,
  duracao,
  tipo_aula,
  conteudo_programatico,
  materiais,
  observacoes
)
SELECT 
  t.id,
  'Aula ' || generate_series || ' - Introdução ao Violão',
  'Nesta aula aprenderemos os conceitos básicos do instrumento.',
  CURRENT_DATE + (generate_series * INTERVAL '3 days'),
  90,
  'pratica',
  ARRAY['Postura correta', 'Afinação', 'Primeiros acordes'],
  ARRAY['Violão', 'Palheta', 'Apostila página ' || generate_series],
  'Trazer violão próprio se possível'
FROM generate_series(1, 5),
     public.turmas t
WHERE t.nome LIKE '%Iniciante%'
LIMIT 5;

-- ============================================
-- 9. INSTRUMENTOS NA BIBLIOTECA
-- ============================================

-- Violão Clássico
INSERT INTO public.biblioteca_instrumentos (
  nome,
  slug,
  categoria,
  familia,
  origem,
  descricao_detalhada,
  historia,
  caracteristicas,
  tecnicas_basicas,
  repertorio_sugerido,
  nivel_dificuldade,
  faixa_etaria_recomendada,
  ativo,
  ordem
) VALUES (
  'Violão Clássico',
  'violao-classico',
  'cordas',
  'cordofones',
  'Espanha',
  'O violão clássico, também conhecido como violão espanhol, é um instrumento de cordas dedilhadas com corpo oco e seis cordas de nylon. Produz um som suave e melódico, ideal para música clássica, bossa nova e MPB.',
  'O violão moderno evoluiu na Espanha do século XIX, com contribuições significativas do luthier Antonio de Torres Jurado. O instrumento tornou-se popular mundialmente através de compositores como Francisco Tárrega e Andrés Segovia.',
  'Corpo: madeira (cedro, abeto)\nBraço: mogno ou cedro\nCordas: 3 de nylon, 3 enroladas em metal\nPeso: ~1-1.5 kg\nComprimento: ~95-100 cm',
  'Postura: sentado com o violão apoiado na perna esquerda\nMão direita: dedilhado com polegar, indicador, médio e anular\nMão esquerda: pressionar as cordas no braço com dedos curvados\nAfinação padrão: MI-LÁ-RÉ-SOL-SI-MI',
  'Iniciante: Asa Branca, Noite Feliz\nIntermediário: Romanza Anónima, Estudo 1 de Villa-Lobos\nAvançado: Prelúdio BWV 999 (Bach), Recuerdos de la Alhambra (Tárrega)',
  'iniciante',
  '7 anos ou mais',
  true,
  1
) ON CONFLICT (slug) DO UPDATE SET atualizado_em = NOW();

-- Piano
INSERT INTO public.biblioteca_instrumentos (
  nome,
  slug,
  categoria,
  familia,
  origem,
  descricao_detalhada,
  historia,
  caracteristicas,
  tecnicas_basicas,
  repertorio_sugerido,
  nivel_dificuldade,
  faixa_etaria_recomendada,
  ativo,
  ordem
) VALUES (
  'Piano',
  'piano',
  'teclado',
  'cordofones percutidos',
  'Itália',
  'O piano é um instrumento de teclado com cordas percutidas por martelos acionados por teclas. Possui 88 teclas (52 brancas e 36 pretas) e pedais que modificam o som. É considerado um dos instrumentos mais completos e versáteis da música ocidental.',
  'Inventado por Bartolomeo Cristofori em 1700 na Itália, o piano evoluiu do cravo. O nome original "pianoforte" reflete sua capacidade de tocar sons suaves (piano) e fortes (forte), impossível no cravo. Tornou-se o instrumento padrão na música clássica, jazz e popular.',
  'Teclas: 88 (7 oitavas + 3 notas)\nPedais: 3 (sustain, una corda, sostenuto)\nCordas: ~230 de aço\nPeso: 200-600 kg (acústico)\nComprimento: 1.5-3 metros',
  'Postura: sentado com costas retas, braços relaxados\nDedos: numerados de 1 (polegar) a 5 (mínimo)\nTécnicas: legato, staccato, escalas, arpejos\nPedais: pedal de sustain (direito) sustenta as notas',
  'Iniciante: Para Elisa (Beethoven), Minueto em Sol (Bach)\nIntermediário: Claro de Lua (Beethoven), Nocturne Op.9 No.2 (Chopin)\nAvançado: Rapsódia Húngara No.2 (Liszt), Étude Op.10 No.4 (Chopin)',
  'intermediario',
  '5 anos ou mais',
  true,
  2
) ON CONFLICT (slug) DO UPDATE SET atualizado_em = NOW();

-- ============================================
-- RESUMO DO QUE FOI CRIADO
-- ============================================

SELECT 'Script executado com sucesso!' as mensagem;

SELECT 'RESUMO:' as tipo, 
       (SELECT COUNT(*) FROM public.gamification_badges) as badges,
       (SELECT COUNT(*) FROM public.gamification_conquistas) as conquistas,
       (SELECT COUNT(*) FROM public.gamification_pontos) as pontos,
       (SELECT COUNT(*) FROM public.alpha_metodologias) as metodologias,
       (SELECT COUNT(*) FROM public.alpha_desafios) as desafios,
       (SELECT COUNT(*) FROM public.turmas) as turmas,
       (SELECT COUNT(*) FROM public.matriculas) as matriculas,
       (SELECT COUNT(*) FROM public.aulas) as aulas,
       (SELECT COUNT(*) FROM public.biblioteca_instrumentos) as instrumentos;
