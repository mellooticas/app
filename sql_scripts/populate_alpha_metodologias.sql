-- Inserção das 8 Metodologias Alpha baseadas na curadoria completa do curriculum
-- Dados extraídos dos capítulos 1-8 da documentação Nipo School

INSERT INTO alpha_metodologias (
  codigo, nome, nome_original, criador, pais_origem, periodo,
  descricao_curta, descricao_completa, principios_fundamentais, filosofia,
  publico_alvo, instrumentos_principais, metodologia_ensino,
  pontos_fortes, limitacoes, aplicacao_brasil,
  nivel_dificuldade, idade_minima, idade_maxima, duracao_tipica_meses,
  recursos_necessarios, cor_tema, icone, ordem_apresentacao
) VALUES 

-- 1. ORFF SCHULWERK
('orff_schulwerk', 'Orff Schulwerk', 'Elementaria - Música Elementar', 'Carl Orff e Gunild Keetman', 'Alemanha', '1920-1950',
'Música elementar através da experimentação, corpo, voz, movimento e improvisação usando instrumentos simples.',
'O Orff Schulwerk promove o aprendizado musical através da experimentação, do corpo, da voz, do movimento e da improvisação, usando instrumentos simples e atividades lúdicas. A música elementar é inseparável do movimento, da dança e da fala.',
ARRAY['Música como experiência corporal', 'Improvisação e criação', 'Instrumentação elementar', 'Coletividade e inclusão', 'Interdisciplinaridade'],
'A música elementar não é nunca música sozinha. É inseparável do movimento, da dança e da fala. É música que se faz, não apenas se ouve.',
'Crianças e adolescentes de todas as idades, especialmente em contextos inclusivos e de baixa renda',
ARRAY['Xilofones', 'Metalofones', 'Percussão', 'Instrumentos do cotidiano', 'Voz', 'Corpo'],
'Experiência precede teoria. Partir do corpo, do ritmo natural, dos gestos, antes da formalização teórica.',
ARRAY['Altamente inclusivo', 'Desenvolve criatividade', 'Promove colaboração', 'Baixo custo', 'Interdisciplinar'],
ARRAY['Pode parecer não estruturado', 'Requer formação específica do professor', 'Menos foco na técnica instrumental'],
'Muito aplicado em musicalização infantil, projetos sociais, escolas públicas. Uma das abordagens mais democráticas para inclusão musical no Brasil.',
2, 3, 16, 12,
ARRAY['Instrumentos Orff', 'Espaço amplo para movimento', 'Objetos diversos para percussão'],
'#FF6B35', 'music-note', 1),

-- 2. MÉTODO SUZUKI
('suzuki', 'Método Suzuki', 'Talent Education', 'Shinichi Suzuki', 'Japão', '1940-1960',
'Aprendizado instrumental como aquisição da língua materna: imitação, repetição, ambiente rico e participação familiar.',
'O Método Suzuki parte do princípio de que todas as crianças podem aprender música da mesma forma que adquirem sua língua materna — por imitação, repetição, ambiente rico e incentivo familiar. O objetivo vai além da música: formar bons cidadãos.',
ARRAY['Toda criança pode aprender', 'Aprendizagem pelo ouvido', 'Repetição constante', 'Ambiente e família', 'Desenvolvimento humano'],
'O talento não é um dom inato, mas pode ser desenvolvido. Todas as crianças podem alcançar alto nível musical e humano.',
'Crianças de 3 a 12 anos, com forte envolvimento familiar',
ARRAY['Violino', 'Piano', 'Violão', 'Viola', 'Violoncelo', 'Flauta'],
'Início precoce, repertório progressivo, envolvimento dos pais, aulas individuais e em grupo, avaliação processual.',
ARRAY['Resultados sólidos em performance', 'Desenvolve disciplina', 'Envolve a família', 'Formação do caráter'],
ARRAY['Requer alto investimento familiar', 'Pode ser rígido', 'Menos ênfase na criatividade inicial'],
'Aplicado em escolas particulares, projetos sociais e iniciativas de inclusão, especialmente para cordas, piano e violão.',
4, 3, 12, 24,
ARRAY['Instrumento individual', 'Participação dos pais', 'Repertório padronizado', 'Professor certificado'],
'#4ECDC4', 'violin', 2),

-- 3. MÉTODO KODÁLY
('kodaly', 'Método Kodály', 'Kodály Concept', 'Zoltán Kodály', 'Hungria', '1920-1950',
'Canto coletivo, desenvolvimento auditivo, solfejo e repertório popular como base universal do ensino musical.',
'Método que coloca o canto como instrumento mais acessível e natural. Foca no desenvolvimento auditivo através do solfejo, uso do folclore nacional e musicalização sistemática desde a infância.',
ARRAY['Canto como base universal', 'Musicalização precoce', 'Repertório nacional/popular', 'Sistematicidade', 'Solfejo móvel'],
'A música deve pertencer a todos. O canto é o instrumento mais acessível e deveria ser a base de todo ensino musical.',
'Crianças de 3 anos em diante, corais, escolas regulares',
ARRAY['Voz humana', 'Instrumentos melódicos simples', 'Piano (apoio)'],
'Solfejo móvel (dó móvel), rítmica Kodály, repertório folclórico progressivo, leitura musical sistemática.',
ARRAY['Desenvolve ouvido musical', 'Sistematizado e progressivo', 'Valoriza cultura local', 'Base sólida para leitura'],
ARRAY['Pode ser muito teórico', 'Requer conhecimento de folclore', 'Menos foco em instrumentos'],
'Aplicado em corais, escolas de música, projetos que valorizam a cultura brasileira e desenvolvimento auditivo.',
3, 3, 18, 18,
ARRAY['Repertório folclórico', 'Piano ou teclado', 'Material de solfejo'],
'#45B7D1', 'microphone', 3),

-- 4. MUSICAL FUTURES
('musical_futures', 'Musical Futures', 'Musical Futures', 'David Price', 'Reino Unido', '2003-presente',
'Aprendizagem musical através de repertório popular, práticas colaborativas, autoria e tecnologia acessível.',
'Metodologia que aproxima o ensino de música das experiências dos alunos. Foca em repertório popular, aprendizagem em grupo, processo não-formal e tecnologia acessível, rompendo com o ensino tradicional.',
ARRAY['Repertório popular', 'Aprendizagem em grupo', 'Processo não-formal', 'Tecnologia acessível', 'Professor como facilitador'],
'O aprendizado musical deve ser tão natural quanto ouvir música. Partir dos gostos e experiências dos próprios alunos.',
'Adolescentes e jovens adultos, especialmente em contextos de música popular',
ARRAY['Violão', 'Teclado', 'Percussão', 'Voz', 'Tecnologia digital'],
'Learning by doing - aprender tocando, experimentando e colaborando. Menos teoria, mais prática e criatividade.',
ARRAY['Alta motivação', 'Inclusão social', 'Estímulo à autoria', 'Usa tecnologia familiar'],
ARRAY['Pode negligenciar fundamentos', 'Requer professor flexível', 'Menos estrutura formal'],
'Introduzido via ONGs, escolas alternativas, projetos universitários. Muito adequado à diversidade musical brasileira.',
2, 12, 25, 6,
ARRAY['Instrumentos populares', 'Tecnologia básica', 'Acesso à internet', 'Repertório de escolha dos alunos'],
'#F39C12', 'guitar', 4),

-- 5. DALCROZE (EURITMIA)
('dalcroze', 'Dalcroze Euritmia', 'Rhythmic Movement', 'Émile Jaques-Dalcroze', 'Suíça', '1890-1920',
'Integração de movimento corporal, percepção rítmica, improvisação e consciência espacial através do corpo.',
'Método pioneiro que integra movimento corporal, percepção rítmica e improvisação. O corpo é o primeiro instrumento musical e o aprendizado depende do engajamento físico do aluno.',
ARRAY['Euritmia corporal', 'Movimento espontâneo', 'Improvisação corporal', 'Integração ouvir-sentir-agir', 'Expressão não-verbal'],
'O ritmo é o motor da música, e o corpo é seu veículo natural. Ritmo e musicalidade devem ser vividos antes de serem racionalizados.',
'Todas as idades, especialmente eficaz para desenvolvimento integral e inclusão',
ARRAY['Corpo humano', 'Percussão corporal', 'Objetos para movimento', 'Tecidos', 'Bolas'],
'Aulas práticas e coletivas, exercícios em grupo, explorações do espaço, dinâmicas circulares.',
ARRAY['Desenvolve coordenação', 'Inclusivo para diferentes habilidades', 'Integra corpo e mente', 'Melhora expressividade'],
ARRAY['Requer espaço amplo', 'Pode causar inibição inicial', 'Menos foco na técnica instrumental'],
'Usado em escolas Waldorf, projetos sociais, dança, teatro e contextos terapêuticos. Muito valorizado na educação integral.',
3, 4, 99, 12,
ARRAY['Espaço amplo', 'Liberdade de movimento', 'Música variada', 'Materiais para expressão corporal'],
'#9B59B6', 'figure-dancing', 5),

-- 6. GORDON MUSIC LEARNING THEORY
('gordon', 'Gordon Music Learning Theory', 'Music Learning Theory', 'Edwin Gordon', 'Estados Unidos', '1970-2000',
'Desenvolvimento da audiação (pensamento musical) através de padrões tonais e rítmicos estruturados.',
'Teoria focada no desenvolvimento da "audiação" - capacidade de pensar musicalmente. Usa padrões tonais e rítmicos para desenvolver compreensão musical interna antes da notação formal.',
ARRAY['Audiação como base', 'Padrões tonais e rítmicos', 'Sequência de aprendizagem', 'Desenvolvimento da sintaxe musical', 'Improvisação estruturada'],
'Audiação para a música é como pensamento para a linguagem. Desenvolver a capacidade de ouvir e compreender música mentalmente.',
'Crianças pequenas até adultos, especialmente eficaz dos 0 aos 9 anos',
ARRAY['Voz', 'Instrumentos melódicos', 'Percussão afinada'],
'Desenvolvimento sequencial: discriminação, inferência, generalização, criatividade e leitura musical.',
ARRAY['Base científica sólida', 'Desenvolve musicalidade profunda', 'Estruturado e progressivo', 'Ênfase na compreensão'],
ARRAY['Requer formação especializada', 'Pode ser abstrato inicialmente', 'Menos motivação imediata'],
'Aplicado em conservatórios, escolas especializadas e projetos que buscam formação musical profunda e científica.',
4, 0, 18, 36,
ARRAY['Formação específica do professor', 'Repertório de padrões tonais', 'Instrumentos afinados'],
'#2ECC71', 'brain', 6),

-- 7. WALDORF STEINER
('waldorf', 'Pedagogia Waldorf', 'Waldorf Education', 'Rudolf Steiner', 'Alemanha', '1919',
'Educação integral através das artes, conectando música, movimento, artes visuais e desenvolvimento espiritual.',
'Abordagem integral que conecta música com desenvolvimento humano global. Enfatiza as artes como meio de educação, respeitando fases de desenvolvimento e integrando aspectos espirituais.',
ARRAY['Educação integral', 'Arte como educação', 'Respeito às fases de desenvolvimento', 'Integração sensorial', 'Desenvolvimento espiritual'],
'A educação deve nutrir o ser humano integral: pensar, sentir e querer. As artes são fundamentais para o desenvolvimento harmonioso.',
'Crianças e jovens de 3 a 18 anos, em contexto de educação integral',
ARRAY['Flauta doce', 'Lira', 'Instrumentos pentatônicos', 'Percussão natural', 'Voz'],
'Progressão por setênios, integração artística, movimento eurítmico, música pentatônica, desenvolvimento gradual.',
ARRAY['Desenvolvimento integral', 'Respeita individualidade', 'Integra artes', 'Base filosófica profunda'],
ARRAY['Pode ser elitista', 'Requer formação específica', 'Menos foco na performance', 'Progressão lenta'],
'Presente em escolas Waldorf, comunidades alternativas e projetos de educação integral. Crescimento constante no Brasil.',
3, 3, 18, 36,
ARRAY['Instrumentos específicos Waldorf', 'Ambiente preparado', 'Formação antroposófica'],
'#E67E22', 'leaf', 7),

-- 8. BERKLEE CONTEMPORARY
('berklee', 'Abordagem Contemporânea Berklee', 'Contemporary Music Education', 'Berklee College of Music', 'Estados Unidos', '1945-presente',
'Formação musical contemporânea integrando performance, composição, tecnologia e indústria musical.',
'Abordagem moderna que integra performance, composição, produção musical, tecnologia e conhecimento da indústria. Foca na música popular contemporânea e preparação profissional.',
ARRAY['Integração performance-composição', 'Tecnologia musical', 'Música popular contemporânea', 'Preparação profissional', 'Colaboração criativa'],
'Música é uma linguagem viva e contemporânea. Formar músicos completos para a realidade atual da indústria musical.',
'Jovens e adultos com interesse em música popular e carreira musical',
ARRAY['Instrumentos eletrônicos', 'Tecnologia digital', 'Equipamentos de gravação', 'Instrumentos populares'],
'Projetos autorais, colaboração, uso de tecnologia, conexão com indústria, performance e composição integradas.',
ARRAY['Prepara para mercado atual', 'Integra tecnologia', 'Foca na criatividade', 'Networking profissional'],
ARRAY['Pode ser comercial demais', 'Requer investimento alto', 'Menos foco em fundamentos clássicos'],
'Aplicado em escolas de música popular, cursos livres, projetos de formação profissional e produção musical.',
5, 16, 35, 48,
ARRAY['Tecnologia musical', 'Estúdio de gravação', 'Instrumentos profissionais', 'Software especializado'],
'#E74C3C', 'headphones', 8);

-- Inserir competências para cada metodologia (exemplo para Orff Schulwerk)
INSERT INTO alpha_competencias (metodologia_id, tipo, nome, descricao, nivel, pre_requisitos, ordem) 
SELECT 
  m.id,
  comp.tipo,
  comp.nome,
  comp.descricao,
  comp.nivel,
  comp.pre_requisitos,
  comp.ordem
FROM alpha_metodologias m
CROSS JOIN (VALUES
  ('tecnica', 'Percussão Corporal', 'Desenvolver ritmo através de palmas, batidas e movimentos corporais', 1, ARRAY[]::TEXT[], 1),
  ('criativa', 'Improvisação Vocal', 'Criar melodias e sons vocais espontâneos em grupo', 2, ARRAY['Percussão Corporal'], 2),
  ('colaborativa', 'Conjunto Instrumental', 'Tocar em grupo com instrumentos Orff coordenadamente', 3, ARRAY['Percussão Corporal', 'Improvisação Vocal'], 3),
  ('cultural', 'Repertório Folclórico', 'Conhecer e interpretar canções da cultura local', 2, ARRAY['Improvisação Vocal'], 4),
  ('tecnica', 'Leitura Rítmica', 'Ler e interpretar padrões rítmicos simples', 4, ARRAY['Percussão Corporal', 'Conjunto Instrumental'], 5)
) AS comp(tipo, nome, descricao, nivel, pre_requisitos, ordem)
WHERE m.codigo = 'orff_schulwerk';