-- Inserção de desafios Alpha exemplares
-- Baseados nas metodologias e competências definidas

-- Desafios para ORFF SCHULWERK
INSERT INTO alpha_desafios (
  metodologia_id, titulo, descricao, objetivo, instrucoes,
  tempo_estimado_minutos, dificuldade, tipo_evidencia,
  criterios_avaliacao, pontos_base, materiais_necessarios, tags
)
SELECT 
  m.id,
  d.titulo,
  d.descricao,
  d.objetivo,
  d.instrucoes,
  d.tempo_estimado_minutos,
  d.dificuldade,
  d.tipo_evidencia,
  d.criterios_avaliacao::jsonb,
  d.pontos_base,
  d.materiais_necessarios,
  d.tags
FROM alpha_metodologias m
CROSS JOIN (VALUES
  (
    'Ritmo do Coração Alpha',
    'Criar uma sequência rítmica usando apenas o corpo como instrumento',
    'Desenvolver consciência corporal e internalização do pulso musical',
    '1. Encontre um espaço silencioso\n2. Comece batendo palmas no seu pulso natural\n3. Adicione batidas no peito, coxas e pés\n4. Crie uma sequência de 8 tempos\n5. Repita 4 vezes\n6. Grave um vídeo de 1 minuto',
    15,
    1,
    'video',
    '{"criterios": ["Manter pulso constante", "Criatividade na sequência", "Uso de diferentes partes do corpo", "Clareza rítmica"], "peso": [3, 2, 2, 3]}',
    10,
    ARRAY['Espaço silencioso', 'Celular para gravação'],
    ARRAY['ritmo', 'corpo', 'iniciante', 'orff']
  ),
  (
    'Sinfonia dos Objetos',
    'Transformar objetos do cotidiano em uma pequena orquestra',
    'Explorar sonoridades e texturas musicais através de objetos comuns',
    '1. Reúna 5 objetos diferentes da sua casa\n2. Explore os sons que cada um pode fazer\n3. Organize-os do grave ao agudo\n4. Crie uma música de 30 segundos\n5. Grave o áudio da sua composição',
    25,
    2,
    'audio',
    '{"criterios": ["Variedade de timbres", "Organização sonora", "Criatividade musical", "Duração adequada"], "peso": [3, 2, 3, 2]}',
    15,
    ARRAY['5 objetos diversos', 'Criatividade', 'Celular para gravação'],
    ARRAY['timbre', 'criatividade', 'instrumentos_alternativos', 'orff']
  ),
  (
    'Cantiga em Movimento',
    'Criar movimentos coreográficos para uma cantiga popular brasileira',
    'Integrar música, movimento e cultura popular',
    '1. Escolha uma cantiga popular que você conhece\n2. Cante a cantiga inteira\n3. Crie movimentos que representem a letra\n4. Pratique até decorar\n5. Grave um vídeo cantando e dançando',
    30,
    2,
    'video',
    '{"criterios": ["Conhecimento da cantiga", "Coordenação música-movimento", "Expressividade", "Conexão cultural"], "peso": [2, 3, 2, 3]}',
    20,
    ARRAY['Conhecimento de cantigas', 'Espaço para movimento'],
    ARRAY['cantiga', 'movimento', 'cultura_brasileira', 'orff']
  )
) AS d(titulo, descricao, objetivo, instrucoes, tempo_estimado_minutos, dificuldade, tipo_evidencia, criterios_avaliacao, pontos_base, materiais_necessarios, tags)
WHERE m.codigo = 'orff_schulwerk';

-- Desafios para MUSICAL FUTURES
INSERT INTO alpha_desafios (
  metodologia_id, titulo, descricao, objetivo, instrucoes,
  tempo_estimado_minutos, dificuldade, tipo_evidencia,
  criterios_avaliacao, pontos_base, materiais_necessarios, tags
)
SELECT 
  m.id,
  d.titulo,
  d.descricao,
  d.objetivo,
  d.instrucoes,
  d.tempo_estimado_minutos,
  d.dificuldade,
  d.tipo_evidencia,
  d.criterios_avaliacao::jsonb,
  d.pontos_base,
  d.materiais_necessarios,
  d.tags
FROM alpha_metodologias m
CROSS JOIN (VALUES
  (
    'Cover da Sua Música Favorita',
    'Gravar uma versão simplificada de uma música que você ama',
    'Desenvolver repertório pessoal e habilidades de performance',
    '1. Escolha uma música que você realmente gosta\n2. Encontre a cifra ou partitura simplificada\n3. Pratique a base (acordes ou melodia principal)\n4. Grave sua versão em vídeo\n5. Pode ser só vocal, só instrumental ou misto',
    45,
    2,
    'video',
    '{"criterios": ["Escolha musical pessoal", "Execução técnica", "Interpretação própria", "Qualidade da gravação"], "peso": [2, 3, 3, 2]}',
    20,
    ARRAY['Instrumento de escolha', 'Acesso à música original', 'Celular/câmera'],
    ARRAY['cover', 'repertorio_pessoal', 'performance', 'musical_futures']
  ),
  (
    'Jam Session Virtual',
    'Criar uma gravação tocando junto com uma base musical',
    'Desenvolver habilidades de conjunto e improvisação',
    '1. Escolha uma base/backing track no YouTube\n2. Ouça várias vezes para entender a estrutura\n3. Improvise ou toque junto por 2-3 minutos\n4. Grave sua performance\n5. Inclua uma reflexão de 30 segundos sobre a experiência',
    60,
    3,
    'video',
    '{"criterios": ["Sincronização com a base", "Criatividade na improvisação", "Entendimento musical", "Reflexão pessoal"], "peso": [3, 2, 2, 3]}',
    25,
    ARRAY['Instrumento', 'Acesso à internet', 'Fones de ouvido', 'Sistema de gravação'],
    ARRAY['jam_session', 'improvisacao', 'backing_track', 'musical_futures']
  )
) AS d(titulo, descricao, objetivo, instrucoes, tempo_estimado_minutos, dificuldade, tipo_evidencia, criterios_avaliacao, pontos_base, materiais_necessarios, tags)
WHERE m.codigo = 'musical_futures';

-- Desafios para MÉTODO SUZUKI
INSERT INTO alpha_desafios (
  metodologia_id, titulo, descricao, objetivo, instrucoes,
  tempo_estimado_minutos, dificuldade, tipo_evidencia,
  criterios_avaliacao, pontos_base, materiais_necessarios, tags
)
SELECT 
  m.id,
  d.titulo,
  d.descricao,
  d.objetivo,
  d.instrucoes,
  d.tempo_estimado_minutos,
  d.dificuldade,
  d.tipo_evidencia,
  d.criterios_avaliacao::jsonb,
  d.pontos_base,
  d.materiais_necessarios,
  d.tags
FROM alpha_metodologias m
CROSS JOIN (VALUES
  (
    'Minueto da Memória',
    'Tocar uma peça do repertório Suzuki de memória com expressividade',
    'Desenvolver memória musical e interpretação expressiva',
    '1. Escolha uma peça que você já estudou\n2. Revise até conseguir tocar de memória\n3. Foque na expressividade: dinâmicas, frases, emoção\n4. Grave a performance completa\n5. Inclua um vídeo comentando suas escolhas interpretativas',
    40,
    3,
    'video',
    '{"criterios": ["Precisão técnica", "Execução de memória", "Expressividade musical", "Reflexão interpretativa"], "peso": [3, 2, 3, 2]}',
    25,
    ARRAY['Instrumento afinado', 'Repertório Suzuki', 'Espaço silencioso'],
    ARRAY['memoria_musical', 'expressividade', 'repertorio_suzuki', 'suzuki']
  ),
  (
    'Família Musical',
    'Gravar uma performance em família ou com um acompanhante',
    'Desenvolver habilidades de conjunto e envolvimento familiar',
    '1. Escolha um familiar ou amigo para tocar junto\n2. Selecionem uma música simples que ambos conhecem\n3. Pratiquem juntos por 20 minutos\n4. Gravem a performance em dupla\n5. Cada um comenta sobre a experiência',
    50,
    2,
    'video',
    '{"criterios": ["Sincronização da dupla", "Qualidade individual", "Dinâmica de conjunto", "Participação familiar"], "peso": [3, 2, 2, 3]}',
    30,
    ARRAY['Dois instrumentos', 'Participação familiar', 'Repertório simples'],
    ARRAY['familia', 'conjunto', 'colaboracao', 'suzuki']
  )
) AS d(titulo, descricao, objetivo, instrucoes, tempo_estimado_minutos, dificuldade, tipo_evidencia, criterios_avaliacao, pontos_base, materiais_necessarios, tags)
WHERE m.codigo = 'suzuki';

-- Desafios para DALCROZE EURITMIA
INSERT INTO alpha_desafios (
  metodologia_id, titulo, descricao, objetivo, instrucoes,
  tempo_estimado_minutos, dificuldade, tipo_evidencia,
  criterios_avaliacao, pontos_base, materiais_necessarios, tags
)
SELECT 
  m.id,
  d.titulo,
  d.descricao,
  d.objetivo,
  d.instrucoes,
  d.tempo_estimado_minutos,
  d.dificuldade,
  d.tipo_evidencia,
  d.criterios_avaliacao::jsonb,
  d.pontos_base,
  d.materiais_necessarios,
  d.tags
FROM alpha_metodologias m
CROSS JOIN (VALUES
  (
    'Caminhada Musical',
    'Expressar diferentes andamentos musicais através do movimento',
    'Desenvolver percepção rítmica e expressão corporal',
    '1. Prepare 3 músicas: lenta, moderada e rápida\n2. Para cada música, caminhe expressando o andamento\n3. Use todo o espaço disponível\n4. Deixe o corpo responder naturalmente\n5. Grave sua "caminhada musical" de 2 minutos',
    20,
    1,
    'video',
    '{"criterios": ["Correspondência música-movimento", "Uso do espaço", "Expressividade corporal", "Fluidez natural"], "peso": [3, 2, 3, 2]}',
    15,
    ARRAY['Espaço amplo', '3 músicas de andamentos diferentes', 'Roupa confortável'],
    ARRAY['movimento', 'andamento', 'expressao_corporal', 'dalcroze']
  ),
  (
    'Escultura Sonora',
    'Criar formas corporais que representem elementos musicais',
    'Desenvolver percepção musical através da expressão corporal',
    '1. Ouça uma música instrumental de 3 minutos\n2. Identifique momentos de tensão e relaxamento\n3. Crie "esculturas" corporais para cada momento\n4. Grave sua performance em câmera lenta\n5. Explique suas escolhas em áudio',
    35,
    3,
    'video',
    '{"criterios": ["Interpretação musical", "Criatividade corporal", "Consciência dos contrastes", "Explicação clara"], "peso": [3, 2, 2, 3]}',
    20,
    ARRAY['Música instrumental', 'Espaço livre', 'Capacidade de gravação em câmera lenta'],
    ARRAY['escultura_corporal', 'interpretacao', 'contraste_musical', 'dalcroze']
  )
) AS d(titulo, descricao, objetivo, instrucoes, tempo_estimado_minutos, dificuldade, tipo_evidencia, criterios_avaliacao, pontos_base, materiais_necessarios, tags)
WHERE m.codigo = 'dalcroze';