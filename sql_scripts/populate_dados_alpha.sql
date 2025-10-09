-- SCRIPT PARA POPULAR DADOS ALPHA - EXECUTAR NO PAINEL SUPABASE
-- =================================================================
-- Este script deve ser executado no SQL Editor do Supabase como usuário admin

-- PASSO 1: Temporariamente desabilitar RLS para inserção inicial
ALTER TABLE alpha_metodologias DISABLE ROW LEVEL SECURITY;

-- PASSO 2: Inserir metodologias
INSERT INTO alpha_metodologias (
    codigo, nome, criador, pais_origem, periodo, descricao_curta, descricao_completa,
    principios_fundamentais, filosofia, publico_alvo, instrumentos_principais,
    metodologia_ensino, pontos_fortes, limitacoes, aplicacao_brasil,
    nivel_dificuldade, idade_minima, recursos_necessarios, cor_tema, icone, ordem_apresentacao
) VALUES 
(
    'orff_schulwerk',
    'Orff Schulwerk',
    'Carl Orff',
    'Alemanha',
    '1930-1950',
    'Abordagem criativa combinando música, movimento e fala através de instrumentos de percussão.',
    'O Orff Schulwerk é uma abordagem pedagógica musical que enfatiza a educação musical através da experiência prática e criativa. Desenvolvida por Carl Orff, esta metodologia integra música, movimento, drama e fala como elementos fundamentais do aprendizado musical.',
    ARRAY['Integração de música, movimento e fala', 'Aprendizado através da experiência prática', 'Criatividade e improvisação como base', 'Uso de instrumentos acessíveis'],
    'A música deve ser vivenciada pelo corpo inteiro. O aprendizado musical acontece naturalmente através do brincar, cantar, dançar e tocar.',
    'Crianças a partir de 3 anos, adolescentes e adultos. Especialmente eficaz para educação infantil.',
    ARRAY['Xilofones diatônicos e cromáticos', 'Metalofones', 'Glockenspiel', 'Tambores de vários tamanhos', 'Instrumentos de percussão diversos'],
    'Baseada na progressão natural: imitação → exploração → criação. As aulas incluem aquecimentos com movimento, exploração de instrumentos, criação musical coletiva.',
    ARRAY['Desenvolve criatividade musical', 'Acessível para não-músicos', 'Integra múltiplas linguagens', 'Promove trabalho em equipe'],
    ARRAY['Requer instrumentos específicos caros', 'Necessita espaço amplo', 'Formação específica do professor'],
    'Muito bem adaptado ao contexto brasileiro pela valorização da criatividade e movimento. Compatível com a cultura musical diversificada do país.',
    2,
    3,
    ARRAY['Instrumentos Orff (xilofones, metalofones)', 'Espaço amplo para movimento', 'Equipamento de som', 'Formação específica do educador'],
    '#FF6B35',
    'music-note',
    1
),
(
    'suzuki',
    'Método Suzuki',
    'Shinichi Suzuki',
    'Japão',
    '1940-1960',
    'Método baseado na "língua materna" onde crianças aprendem música da mesma forma que aprendem a falar.',
    'O Método Suzuki, também conhecido como "Método da Língua Materna", é uma filosofia educacional que aplica os princípios de aquisição da linguagem ao aprendizado musical.',
    ARRAY['Toda criança pode aprender', 'Começar cedo é fundamental', 'Ambiente rico em música', 'Escutar precede tocar', 'Participação ativa dos pais'],
    'O potencial musical é inato em todas as crianças. Através de amor, paciência e ambiente musical rico, qualquer criança pode desenvolver alta habilidade musical.',
    'Crianças pequenas (3-6 anos idealmente), mas adaptável para qualquer idade. Funciona melhor com envolvimento familiar.',
    ARRAY['Violino (mais comum)', 'Piano', 'Violoncelo', 'Viola', 'Flauta', 'Harpa'],
    'Escuta diária do repertório, imitação do professor, prática constante, participação dos pais, aulas individuais e em grupo.',
    ARRAY['Desenvolve disciplina e concentração', 'Resulta em alta técnica instrumental', 'Fortalece vínculo familiar', 'Cultiva sensibilidade musical refinada'],
    ARRAY['Requer comprometimento intenso dos pais', 'Pode ser rígido demais', 'Enfoque limitado em criatividade', 'Método caro (aulas individuais)'],
    'Adaptação crescente no Brasil através de institutos especializados. Compatível com valores familiares brasileiros.',
    4,
    3,
    ARRAY['Instrumento adequado ao tamanho', 'Professor certificado Suzuki', 'Equipamento de áudio para escuta', 'Comprometimento parental total'],
    '#E74C3C',
    'violin',
    2
),
(
    'kodaly',
    'Método Kodály',
    'Zoltán Kodály',
    'Hungria',
    '1920-1940',
    'Desenvolvimento musical através da voz humana e música folclórica nacional.',
    'O Método Kodály é uma abordagem abrangente para educação musical que usa a voz humana como instrumento primário e a música folclórica como material básico.',
    ARRAY['A voz é o instrumento mais acessível', 'Música folclórica como base', 'Desenvolvimento sequencial', 'Leitura musical fluente'],
    'A música é um direito de todos. O desenvolvimento musical deve começar com a própria cultura musical da criança.',
    'Crianças a partir de 5 anos, com aplicação em todas as idades. Especialmente eficaz no ensino fundamental.',
    ARRAY['Voz humana (principal)', 'Instrumentos folclóricos', 'Piano (apoio)', 'Instrumentos de percussão simples'],
    'Sequência pedagógica rigorosa usando solfejo relativo, manossolfa, leitura musical progressiva e repertório folclórico nacional.',
    ARRAY['Desenvolve ouvido musical refinado', 'Acessível economicamente', 'Preserva patrimônio cultural', 'Base sólida para leitura musical'],
    ARRAY['Requer formação específica intensiva', 'Pode ser muito teórico', 'Dependente da qualidade vocal do professor'],
    'Excelente adaptação ao Brasil pela riqueza do folclore nacional. Usado em conservatórios e escolas de música erudita.',
    3,
    5,
    ARRAY['Formação específica em Kodály', 'Repertório folclórico nacional', 'Piano para apoio harmônico', 'Material didático especializado'],
    '#2ECC71',
    'microphone',
    3
),
(
    'musical_futures',
    'Musical Futures',
    'Paul Sanderson',
    'Reino Unido',
    '2000-2010',
    'Aprendizado musical informal baseado em práticas da música popular.',
    'Musical Futures é uma abordagem pedagógica que replica as formas naturais de aprendizado musical encontradas na música popular, enfatizando colaboração, escolha e aprendizado pelos pares.',
    ARRAY['Aprendizado informal e natural', 'Música popular como base', 'Colaboração entre pares', 'Escolha do aluno central', 'Tecnologia integrada'],
    'Os jovens aprendem música de forma mais eficaz quando podem escolher o que querem aprender e trabalhar colaborativamente.',
    'Adolescentes e jovens adultos (12+ anos). Especialmente eficaz para engajar estudantes desinteressados na música tradicional.',
    ARRAY['Instrumentos eletrônicos', 'Computadores e software musical', 'Instrumentos de banda', 'Equipamentos de gravação'],
    'Aprendizado através de cópia e imitação, composição colaborativa, uso de tecnologia musical, performance em grupos pequenos.',
    ARRAY['Alta motivação dos estudantes', 'Conecta com cultura jovem', 'Desenvolve criatividade', 'Usa tecnologia atual', 'Flexível e adaptável'],
    ARRAY['Menor foco em técnica tradicional', 'Requer equipamentos tecnológicos', 'Pode negligenciar teoria musical formal'],
    'Muito adequado para o Brasil pela forte cultura de música popular. Usado em escolas públicas e projetos sociais.',
    2,
    12,
    ARRAY['Instrumentos eletrônicos', 'Computadores com software musical', 'Equipamentos de áudio', 'Acesso à internet'],
    '#9B59B6',
    'guitar',
    4
),
(
    'dalcroze',
    'Dalcroze Eurythmics',
    'Émile Jaques-Dalcroze',
    'Suíça',
    '1900-1920',
    'Educação musical através do movimento corporal e euritmia.',
    'A Euritmia de Dalcroze é um método que desenvolve a musicalidade através do movimento corporal consciente, conectando música, mente e corpo.',
    ARRAY['Movimento corporal consciente', 'Integração música-corpo-mente', 'Desenvolvimento rítmico', 'Improvisação musical', 'Expressão através do movimento'],
    'O corpo é o primeiro instrumento musical. O movimento consciente desenvolve a compreensão musical interna.',
    'Todas as idades, desde crianças pequenas até adultos. Especialmente benéfico para desenvolvimento rítmico.',
    ARRAY['Piano (principal)', 'Instrumentos de percussão', 'Objetos para movimento (lenços, bolas)', 'Espaço amplo para movimento'],
    'Exercícios de movimento e música, improvisação corporal, desenvolvimento rítmico através do corpo, expressão musical através do movimento.',
    ARRAY['Desenvolve consciência corporal', 'Melhora coordenação', 'Integra música e movimento', 'Desenvolve musicalidade interna'],
    ARRAY['Requer espaço adequado', 'Formação específica necessária', 'Pode ser intimidante para alguns', 'Foco limitado em técnica instrumental'],
    'Bem recebido no Brasil pela cultura corporal rica. Usado em escolas de dança, música e teatro.',
    3,
    4,
    ARRAY['Espaço amplo para movimento', 'Piano', 'Formação em Dalcroze', 'Materiais para movimento'],
    '#F39C12',
    'running',
    5
),
(
    'gordon',
    'Music Learning Theory (Gordon)',
    'Edwin Gordon',
    'Estados Unidos',
    '1970-1990',
    'Teoria da Audiação Musical - desenvolvimento da compreensão musical interna.',
    'A Teoria da Aprendizagem Musical de Edwin Gordon baseia-se no conceito de audiação - a capacidade de ouvir e compreender música mentalmente.',
    ARRAY['Audiação como base', 'Desenvolvimento sequencial', 'Padrões tonais e rítmicos', 'Aprendizagem musical natural', 'Vocabulário musical'],
    'A audiação é para a música o que o pensamento é para a linguagem. Deve ser desenvolvida antes da performance.',
    'Bebês a adultos, com metodologias específicas para cada faixa etária. Especialmente importante nos primeiros anos.',
    ARRAY['Voz humana (principal)', 'Instrumentos melódicos simples', 'Instrumentos de percussão', 'Piano (para padrões)'],
    'Desenvolvimento de vocabulário musical através de padrões, respiração musical, movimento livre, improvisação estruturada.',
    ARRAY['Base científica sólida', 'Desenvolve musicalidade profunda', 'Metodologia abrangente', 'Aplicável a qualquer estilo musical'],
    ARRAY['Complexo para implementar', 'Requer formação específica intensa', 'Pode ser muito teórico inicialmente'],
    'Crescente interesse no Brasil em conservatórios e universidades. Adequado para formação de educadores musicais.',
    4,
    0,
    ARRAY['Formação específica em Gordon', 'Compreensão de padrões musicais', 'Material didático específico'],
    '#3498DB',
    'brain',
    6
),
(
    'waldorf',
    'Pedagogia Waldorf Musical',
    'Rudolf Steiner',
    'Alemanha',
    '1910-1920',
    'Educação musical integral baseada no desenvolvimento antroposófico.',
    'A Pedagogia Waldorf aborda a música como parte integral do desenvolvimento humano, respeitando as fases evolutivas da criança.',
    ARRAY['Desenvolvimento por fases etárias', 'Integração com outras artes', 'Música como desenvolvimento humano', 'Respeito ao ritmo natural', 'Arte como necessidade'],
    'A música é uma necessidade humana fundamental que deve ser cultivada respeitando o desenvolvimento natural da criança.',
    'Crianças e adolescentes (0-18 anos) com abordagens específicas para cada fase do desenvolvimento.',
    ARRAY['Flauta doce', 'Lira', 'Instrumentos de corda', 'Percussão natural', 'Canto'],
    'Progressão por setênios, integração música-movimento-artes, repertório adequado à idade, desenvolvimento técnico gradual.',
    ARRAY['Desenvolvimento integral', 'Respeita individualidade', 'Integra múltiplas linguagens', 'Cultiva sensibilidade artística'],
    ARRAY['Progressão pode ser lenta', 'Requer formação antroposófica', 'Menos foco em performance', 'Limitado em música contemporânea'],
    'Presente no Brasil através de escolas Waldorf. Adequado à valorização da infância e desenvolvimento integral.',
    3,
    3,
    ARRAY['Formação em Pedagogia Waldorf', 'Instrumentos específicos (flauta, lira)', 'Compreensão do desenvolvimento infantil'],
    '#8E44AD',
    'leaf',
    7
),
(
    'berklee',
    'Berklee Method',
    'Lawrence Berk',
    'Estados Unidos',
    '1940-1960',
    'Metodologia de música contemporânea focada em performance e criatividade.',
    'O Método Berklee é uma abordagem contemporânea que integra técnica, teoria, performance e tecnologia musical para formação de músicos profissionais.',
    ARRAY['Música contemporânea como base', 'Integração teoria-prática', 'Performance como objetivo', 'Tecnologia musical', 'Criatividade e composição'],
    'A educação musical deve preparar músicos para o mercado atual, integrando tradição e inovação.',
    'Adolescentes e adultos (16+ anos) com interesse em música profissional e contemporânea.',
    ARRAY['Instrumentos eletrônicos', 'Computadores e software', 'Instrumentos tradicionais adaptados', 'Equipamentos de gravação'],
    'Ensembles práticos, teoria aplicada, uso de tecnologia, composição e arranjo, preparação para indústria musical.',
    ARRAY['Prepara para mercado atual', 'Integra tecnologia', 'Foco em criatividade', 'Networking profissional', 'Versatilidade musical'],
    ARRAY['Pode ser comercial demais', 'Requer equipamentos caros', 'Menos foco em tradição clássica', 'Competitivo'],
    'Excelente para o Brasil pela forte indústria musical nacional. Usado em escolas de música popular e universidades.',
    4,
    16,
    ARRAY['Instrumentos profissionais', 'Tecnologia musical avançada', 'Acesso à indústria musical', 'Formação em música contemporânea'],
    '#E67E22',
    'microphone-alt',
    8
);

-- PASSO 3: Reabilitar RLS
ALTER TABLE alpha_metodologias ENABLE ROW LEVEL SECURITY;

-- PASSO 4: Verificar inserção
SELECT codigo, nome, nivel_dificuldade, cor_tema FROM alpha_metodologias ORDER BY ordem_apresentacao;

-- PASSO 5: Inserir algumas competências de exemplo
INSERT INTO alpha_competencias (metodologia_id, codigo, nome, descricao, categoria, nivel_complexidade, ordem) 
SELECT 
    id,
    'competencia_basica_' || codigo,
    'Competência Básica em ' || nome,
    'Fundamentos essenciais da metodologia ' || nome,
    'Fundamental',
    1,
    1
FROM alpha_metodologias;

-- PASSO 6: Inserir alguns desafios de exemplo
INSERT INTO alpha_desafios (
    metodologia_id, codigo, titulo, descricao, instrucoes, dificuldade, 
    tempo_estimado_minutos, pontos_base, tipo_evidencia, categoria
)
SELECT 
    id,
    'desafio_inicial_' || codigo,
    'Primeiro Desafio: ' || nome,
    'Demonstre os conceitos básicos da metodologia ' || nome,
    'Grave um vídeo de 3-5 minutos mostrando uma atividade prática usando os princípios fundamentais desta metodologia.',
    1,
    30,
    100,
    'video',
    'Introdução'
FROM alpha_metodologias;

-- SUCESSO! Sistema Alpha populado com dados iniciais
SELECT 
    (SELECT COUNT(*) FROM alpha_metodologias) as metodologias,
    (SELECT COUNT(*) FROM alpha_competencias) as competencias,
    (SELECT COUNT(*) FROM alpha_desafios) as desafios;