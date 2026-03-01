// =============================================
// Generator: 2026 Curriculum (40 lessons, Mar 14 – Dec 12)
// Generates migrations 041–045
// =============================================
import { randomUUID } from 'crypto'
import { writeFileSync } from 'fs'
import { join, dirname } from 'path'
import { fileURLToPath } from 'url'

const __dirname = dirname(fileURLToPath(import.meta.url))
const TENANT = '00000000-0000-0000-0000-000000000001'
const TS = '2026-03-01 00:00:00.000000+00'

// =============================================
// FULL CURRICULUM DEFINITION
// =============================================

const lessons = [
  // ── Bloco 1: Retomada e Novos Horizontes (30–35) ──
  {
    n: 30, date: '2026-03-14', title: 'Aula Inaugural 2026 – Reencontro Musical',
    objective: 'Acolher os alunos veteranos e novatos, revisar combinados, apresentar o plano do Ano 2, formar novos grupos e reacender o vínculo com a música e com o projeto Nipo School.',
    activities: [
      { title: 'Abertura/Integração — Devocional de boas-vindas e dinâmica de reencontro. Cada aluno compartilha uma memória musical do ano passado ou uma expectativa para o ano novo.', type: 'abertura' },
      { title: 'Atividade Principal — Apresentação do plano anual 2026 (7 blocos temáticos). Dinâmica de formação de grupos: sorteio de instrumentos e afinidades. Tour pelo app atualizado: novas funcionalidades.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar um vídeo de apresentação pessoal: nome, instrumento e meta musical para 2026. Postar no feed do app.', type: 'alpha' },
      { title: 'Encerramento — Roda de expectativas: cada grupo compartilha 3 metas coletivas para o ano. Foto oficial dos grupos 2026.', type: 'final' },
    ],
    materials: [
      { title: 'PDF: Plano Anual 2026 – Visão geral dos blocos temáticos', type: 'document' },
      { title: 'Vídeo: Retrospectiva 2025 – Melhores momentos do ano anterior', type: 'video' },
      { title: 'PDF: Ficha de metas pessoais e coletivas', type: 'document' },
      { title: 'Link: Acesso ao app Nipo School atualizado', type: 'link' },
    ],
    criteria: ['Participação na dinâmica de reencontro', 'Engajamento na formação de grupos', 'Clareza na apresentação de metas', 'Cumprimento do desafio Alpha'],
    checklist: ['Sala organizada em roda', 'App atualizado e testado', 'Projetor/TV preparado para retrospectiva', 'Fichas de metas impressas'],
  },
  {
    n: 31, date: '2026-03-21', title: 'Revisão de Fundamentos e Novos Objetivos',
    objective: 'Revisar os fundamentos musicais do Ano 1 (ritmo, leitura, postura instrumental), diagnosticar o nível atual dos alunos e estabelecer objetivos individuais de evolução.',
    activities: [
      { title: 'Abertura/Integração — Aquecimento corporal e vocal. Jogo de memória rítmica: professor toca padrões, alunos repetem e variam.', type: 'abertura' },
      { title: 'Atividade Principal — Diagnóstico musical: exercícios de leitura rítmica, melódica e prática instrumental em estações rotativas. Professor avalia e anota nível individual.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo tocando uma peça livre de até 1 minuto. Postar no app como "baseline" do Ano 2.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Apostila de Revisão – Figuras rítmicas e notas musicais', type: 'document' },
      { title: 'PDF: Ficha de diagnóstico individual do professor', type: 'document' },
      { title: 'Instrumentos variados para as estações rotativas', type: null },
      { title: 'Áudio: Playbacks para exercícios de leitura', type: 'audio' },
    ],
    criteria: ['Domínio de figuras rítmicas básicas', 'Postura e empunhadura correta', 'Capacidade de leitura melódica', 'Cumprimento do desafio Alpha'],
    checklist: ['Estações rotativas montadas', 'Fichas de diagnóstico impressas', 'Instrumentos afinados', 'App liberado para uploads'],
  },
  {
    n: 32, date: '2026-03-28', title: 'Leitura Rítmica Avançada',
    objective: 'Aprofundar a leitura rítmica com figuras compostas (semicolcheia, síncope, quiáltera), desenvolver independência rítmica e aplicar em peças coletivas.',
    activities: [
      { title: 'Abertura/Integração — Aquecimento com palmas em cânone. Jogo do "Ritmo Viajante" em roda: cada aluno adiciona uma célula rítmica à sequência.', type: 'abertura' },
      { title: 'Atividade Principal — Explicação de semicolcheias, síncopas e quiálteras com exemplos no quadro e no instrumento. Exercícios de leitura em grupo. Prática: peça rítmica a 3 vozes.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo executando um exercício rítmico com síncope. Postar no app com a hashtag #RitmoAvançado.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Apostila Rítmica Avançada – Semicolcheias e síncopas', type: 'document' },
      { title: 'PDF: Peça rítmica a 3 vozes – Partitura', type: 'document' },
      { title: 'Áudio: Base rítmica para prática de síncope', type: 'audio' },
      { title: 'Vídeo: Demonstração de figuras rítmicas compostas', type: 'video' },
    ],
    criteria: ['Execução correta de semicolcheias', 'Domínio da síncope', 'Coordenação na peça a 3 vozes', 'Cumprimento do desafio Alpha'],
    checklist: ['Quadro branco preparado com figuras', 'Apostilas impressas', 'Metrônomo disponível', 'Instrumentos de percussão separados'],
  },
  {
    n: 33, date: '2026-04-04', title: 'Leitura Melódica e Intervalos',
    objective: 'Desenvolver a leitura melódica com foco em intervalos musicais (2ª a 8ª), treinar o ouvido para reconhecimento auditivo e aplicar em melodias conhecidas.',
    activities: [
      { title: 'Abertura/Integração — Jogo de intervalos: professor toca dois sons, alunos identificam se é 2ª, 3ª, 5ª ou 8ª. Dinâmica de competição amigável entre grupos.', type: 'abertura' },
      { title: 'Atividade Principal — Explicação visual e sonora dos intervalos de 2ª a 8ª. Associação com músicas conhecidas (ex: 5ª = Star Wars). Prática de solfejo com intervalos. Leitura de melodia com intervalos variados.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar áudio cantando ou tocando uma sequência de intervalos. Postar no app identificando cada intervalo.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Guia de Intervalos Musicais – Tabela de referência', type: 'document' },
      { title: 'PDF: Melodias para prática de intervalos', type: 'document' },
      { title: 'Áudio: Intervalos de referência para treinamento auditivo', type: 'audio' },
      { title: 'Link: App de treinamento auditivo (sugestão externa)', type: 'link' },
    ],
    criteria: ['Reconhecimento auditivo de intervalos', 'Leitura correta de melodias com intervalos', 'Participação no solfejo', 'Cumprimento do desafio Alpha'],
    checklist: ['Teclado/piano disponível para demonstrações', 'Material de intervalos impresso', 'Caixas de som para áudios', 'App de treinamento auditivo testado'],
  },
  {
    n: 34, date: '2026-04-11', title: 'Dinâmica e Expressividade Musical',
    objective: 'Explorar os elementos de dinâmica musical (piano, forte, crescendo, diminuendo), desenvolver a expressividade na execução e aplicar em peças de conjunto.',
    activities: [
      { title: 'Abertura/Integração — Dinâmica do "Semáforo Musical": verde = forte, amarelo = mezzo, vermelho = piano. Professor rege e alunos respondem em tempo real.', type: 'abertura' },
      { title: 'Atividade Principal — Explicação dos sinais de dinâmica. Prática em grupo: mesma peça tocada com diferentes dinâmicas. Exercício de crescendo/diminuendo em cânone. Ensaio de peça expressiva.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo tocando uma peça com variações de dinâmica claras (piano → forte → piano). Postar no app.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Tabela de sinais de dinâmica musical', type: 'document' },
      { title: 'Partitura: Peça expressiva com marcações de dinâmica', type: 'sheet_music' },
      { title: 'Vídeo: Demonstração de dinâmica em orquestra', type: 'video' },
      { title: 'Cartões coloridos para o Semáforo Musical', type: null },
    ],
    criteria: ['Compreensão dos sinais de dinâmica', 'Execução com variações expressivas', 'Resposta ao regente na dinâmica coletiva', 'Cumprimento do desafio Alpha'],
    checklist: ['Cartões coloridos preparados', 'Partituras com dinâmica impressas', 'Instrumentos afinados', 'Vídeo de demonstração carregado'],
  },
  {
    n: 35, date: '2026-04-18', title: 'Prática de Conjunto – Retomada',
    objective: 'Consolidar os fundamentos revisados nas aulas anteriores através de prática de conjunto, reforçar a escuta coletiva e preparar os grupos para os próximos blocos.',
    activities: [
      { title: 'Abertura/Integração — Aquecimento coletivo: escalas em uníssono, depois em terças. Exercício de escuta: tocar sussurrado e crescer juntos.', type: 'abertura' },
      { title: 'Atividade Principal — Ensaio de 2 peças em conjunto (uma rítmica, uma melódica). Foco em sincronia, dinâmica e afinação. Rodízio de liderança: cada aluno rege por 1 minuto.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo do grupo tocando uma das peças ensaiadas. Postar no app com comentário sobre o que melhorou desde o Ano 1.', type: 'alpha' },
      { title: 'Encerramento — Roda de feedback: o que cada grupo precisa melhorar? Definição de metas para o Bloco 2.', type: 'final' },
    ],
    materials: [
      { title: 'Partitura: Peça rítmica para conjunto', type: 'sheet_music' },
      { title: 'Partitura: Peça melódica para conjunto', type: 'sheet_music' },
      { title: 'Áudio: Playback para acompanhamento das peças', type: 'audio' },
      { title: 'PDF: Ficha de auto-avaliação do Bloco 1', type: 'document' },
    ],
    criteria: ['Sincronia no conjunto', 'Aplicação de dinâmica nas peças', 'Participação na liderança/regência', 'Cumprimento do desafio Alpha'],
    checklist: ['Partituras impressas para todos', 'Instrumentos afinados e organizados', 'Playbacks testados', 'Fichas de auto-avaliação impressas'],
  },

  // ── Bloco 2: Aprofundamento Instrumental (36–41) ──
  {
    n: 36, date: '2026-04-25', title: 'Técnica Instrumental Avançada I',
    objective: 'Aprofundar a técnica instrumental individual com foco em articulação, velocidade e clareza sonora, utilizando exercícios progressivos e repertório técnico.',
    activities: [
      { title: 'Abertura/Integração — Aquecimento técnico: escalas cromáticas lentas com foco em legato e staccato. Dinâmica de respiração para sopros / postura para cordas e percussão.', type: 'abertura' },
      { title: 'Atividade Principal — Exercícios técnicos por naipe: escalas em diferentes articulações, arpejos, padrões de velocidade progressiva. Professor circula e orienta individualmente.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo praticando um exercício técnico em 3 velocidades (lento, médio, rápido). Postar no app.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Exercícios técnicos por instrumento – Nível 2', type: 'document' },
      { title: 'PDF: Tabela de articulações (legato, staccato, tenuto, accent)', type: 'document' },
      { title: 'Áudio: Metrônomo com velocidades progressivas', type: 'audio' },
      { title: 'Vídeo: Demonstração de articulações em diferentes instrumentos', type: 'video' },
    ],
    criteria: ['Clareza sonora nas articulações', 'Controle de velocidade progressiva', 'Postura e empunhadura corretas', 'Cumprimento do desafio Alpha'],
    checklist: ['Exercícios por naipe impressos', 'Metrônomo preparado', 'Estantes de partitura organizadas', 'Instrumentos afinados'],
  },
  {
    n: 37, date: '2026-05-02', title: 'Técnica Instrumental Avançada II',
    objective: 'Continuar o desenvolvimento técnico com foco em ornamentos (trinado, mordente, apojatura), vibrato e técnicas estendidas básicas de cada instrumento.',
    activities: [
      { title: 'Abertura/Integração — Escuta comparativa: trechos musicais com e sem ornamentos. Alunos identificam onde os ornamentos aparecem.', type: 'abertura' },
      { title: 'Atividade Principal — Demonstração e prática de ornamentos por naipe. Exercícios de vibrato (cordas/sopros). Introdução a técnicas estendidas (harmônicos, pizzicato, flutter-tongue). Aplicação em trecho musical.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo demonstrando um ornamento aprendido aplicado em uma melodia. Postar no app.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Guia de ornamentos musicais por instrumento', type: 'document' },
      { title: 'Partitura: Peça com ornamentos escritos', type: 'sheet_music' },
      { title: 'Vídeo: Demonstração de vibrato e ornamentos', type: 'video' },
      { title: 'Áudio: Exemplos de técnicas estendidas', type: 'audio' },
    ],
    criteria: ['Execução correta de ornamentos', 'Desenvolvimento do vibrato', 'Musicalidade na aplicação dos ornamentos', 'Cumprimento do desafio Alpha'],
    checklist: ['Material de ornamentos impresso', 'Vídeos de demonstração preparados', 'Instrumentos afinados', 'App liberado para uploads'],
  },
  {
    n: 38, date: '2026-05-09', title: 'Escalas e Modos Musicais',
    objective: 'Apresentar as escalas maiores, menores e modos gregos básicos (jônio, eólio, dórico, mixolídio), desenvolver a percepção de "cor sonora" e aplicar em improvisação.',
    activities: [
      { title: 'Abertura/Integração — Jogo de "adivinha o modo": professor toca trechos em diferentes modos, alunos descrevem a emoção/cor que sentem (alegre, triste, misterioso, festivo).', type: 'abertura' },
      { title: 'Atividade Principal — Explicação das escalas maior e menor natural. Introdução aos modos: jônio, eólio, dórico e mixolídio com exemplos musicais conhecidos. Prática: tocar escalas e improvisar sobre cada modo.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar improvisação curta (30s) usando um modo aprendido. Postar no app identificando qual modo usou e que emoção quis transmitir.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Mapa das Escalas e Modos – Guia visual', type: 'document' },
      { title: 'PDF: Exercícios de escalas em todos os modos', type: 'document' },
      { title: 'Áudio: Playbacks modais para improvisação', type: 'audio' },
      { title: 'Link: Referências de modos em músicas populares', type: 'link' },
    ],
    criteria: ['Execução correta das escalas', 'Identificação auditiva dos modos', 'Criatividade na improvisação modal', 'Cumprimento do desafio Alpha'],
    checklist: ['Quadro com mapa de escalas', 'Playbacks modais testados', 'Instrumentos afinados', 'Material impresso distribuído'],
  },
  {
    n: 39, date: '2026-05-16', title: 'Acordes e Progressões Harmônicas',
    objective: 'Aprofundar o estudo de acordes (maiores, menores, com 7ª), ensinar progressões harmônicas comuns (I-IV-V, ii-V-I, I-V-vi-IV) e aplicar em acompanhamento de canções.',
    activities: [
      { title: 'Abertura/Integração — Escuta ativa: professor toca 3 músicas famosas, alunos tentam identificar os acordes/progressão. Debate sobre o "efeito" de cada progressão.', type: 'abertura' },
      { title: 'Atividade Principal — Formação de acordes no teclado/violão: maiores, menores, com 7ª. Prática de progressões I-IV-V e I-V-vi-IV em grupo. Aplicação: acompanhar uma canção popular usando as progressões.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo tocando uma progressão harmônica enquanto outro colega faz a melodia. Postar no app em dupla.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Tabela de acordes maiores, menores e com 7ª', type: 'document' },
      { title: 'PDF: Progressões harmônicas mais usadas na música popular', type: 'document' },
      { title: 'Cifra: Canção popular para prática de acompanhamento', type: 'sheet_music' },
      { title: 'Áudio: Bases harmônicas para prática em grupo', type: 'audio' },
    ],
    criteria: ['Formação correta dos acordes', 'Fluência nas trocas de acordes', 'Acompanhamento harmônico em grupo', 'Cumprimento do desafio Alpha'],
    checklist: ['Teclados/violões disponíveis', 'Tabelas de acordes impressas', 'Cifras da canção distribuídas', 'Bases harmônicas testadas'],
  },
  {
    n: 40, date: '2026-05-23', title: 'Leitura de Cifras e Partituras',
    objective: 'Desenvolver a habilidade de leitura simultânea de cifras e partituras, integrar melodia e harmonia na prática e preparar os alunos para autonomia musical.',
    activities: [
      { title: 'Abertura/Integração — Quiz rápido: projetar trechos de cifras e partituras, alunos identificam tonalidade, compasso e acordes.', type: 'abertura' },
      { title: 'Atividade Principal — Leitura guiada de partitura com cifras. Prática em naipes: melodia (leitura de partitura) + harmonia (leitura de cifras). Montagem de uma peça completa com ambas as notações.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo do grupo executando a peça lida na aula. Postar no app com o PDF da partitura/cifra como referência.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Partitura com cifras integradas – Peça do dia', type: 'document' },
      { title: 'PDF: Guia de leitura de cifras para iniciantes/intermediários', type: 'document' },
      { title: 'Partitura: Peça completa para leitura em grupo', type: 'sheet_music' },
      { title: 'Áudio: Gravação de referência da peça do dia', type: 'audio' },
    ],
    criteria: ['Leitura correta da partitura', 'Interpretação das cifras', 'Integração melodia-harmonia no grupo', 'Cumprimento do desafio Alpha'],
    checklist: ['Partituras e cifras impressas', 'Projetor para quiz de leitura', 'Instrumentos afinados', 'Gravação de referência preparada'],
  },
  {
    n: 41, date: '2026-05-30', title: 'Revisão e Mini-Recital I',
    objective: 'Revisar os conteúdos dos Blocos 1 e 2, consolidar aprendizados através de uma apresentação interna (mini-recital) e praticar postura de palco.',
    activities: [
      { title: 'Abertura/Integração — Aquecimento coletivo com escala em cânone. Revisão rápida dos conceitos-chave: ritmo avançado, intervalos, dinâmica, técnica, escalas, acordes, leitura.', type: 'abertura' },
      { title: 'Atividade Principal — Mini-recital interno: cada grupo apresenta 1 peça preparada. Plateia (outros grupos) avalia usando critérios combinados. Feedback construtivo do professor.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar o mini-recital do grupo e postar no app. Cada aluno comenta o vídeo de outro grupo com feedback positivo.', type: 'alpha' },
      { title: 'Encerramento — Premiação simbólica (destaque de cada grupo). Roda de feedback geral sobre o 1º semestre parcial.', type: 'final' },
    ],
    materials: [
      { title: 'PDF: Ficha de avaliação do mini-recital (para plateia)', type: 'document' },
      { title: 'PDF: Resumo dos conteúdos – Blocos 1 e 2', type: 'document' },
      { title: 'Certificados/premiações simbólicas', type: null },
      { title: 'Partituras das peças escolhidas pelos grupos', type: 'sheet_music' },
    ],
    criteria: ['Qualidade da apresentação musical', 'Postura de palco e confiança', 'Capacidade de dar feedback construtivo', 'Cumprimento do desafio Alpha'],
    checklist: ['Espaço organizado como mini-palco', 'Fichas de avaliação impressas', 'Câmera/celular para gravação', 'Premiações preparadas'],
  },

  // ── Bloco 3: Criação e Composição (42–47) ──
  {
    n: 42, date: '2026-06-06', title: 'Composição – Estrutura de Canção',
    objective: 'Ensinar as estruturas formais de uma canção (intro, verso, refrão, ponte, coda), analisar músicas conhecidas e iniciar o processo de composição em grupo.',
    activities: [
      { title: 'Abertura/Integração — Escuta analítica: ouvir 2 músicas populares e mapear a estrutura (intro, verso, refrão, ponte). Alunos desenham o "mapa da canção" no papel.', type: 'abertura' },
      { title: 'Atividade Principal — Explicação das seções de uma canção com exemplos. Cada grupo recebe uma estrutura (ex: AABA, ABAB) e deve criar uma melodia curta para cada seção. Apresentação das primeiras ideias.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar áudio da primeira ideia de composição do grupo (pode ser esboço). Postar no app pedindo feedback dos colegas.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Estruturas de canção – Guia visual com exemplos', type: 'document' },
      { title: 'PDF: Ficha de composição – Template em branco', type: 'document' },
      { title: 'Áudio: Exemplos de diferentes estruturas de canção', type: 'audio' },
      { title: 'Folhas grandes e canetas para mapeamento visual', type: null },
    ],
    criteria: ['Compreensão das seções de uma canção', 'Criatividade no esboço melódico', 'Colaboração no grupo de composição', 'Cumprimento do desafio Alpha'],
    checklist: ['Material de composição impresso', 'Caixas de som para escuta analítica', 'Folhas grandes e canetas disponíveis', 'App liberado para uploads de áudio'],
  },
  {
    n: 43, date: '2026-06-13', title: 'Composição – Letra e Melodia',
    objective: 'Desenvolver a habilidade de criar letras musicais, integrar letra e melodia de forma orgânica e explorar técnicas de escrita criativa aplicadas à música.',
    activities: [
      { title: 'Abertura/Integração — Jogo de palavras musicais: professor dá um tema, cada aluno escreve 3 palavras/frases em 2 minutos. Compartilhar em roda.', type: 'abertura' },
      { title: 'Atividade Principal — Técnicas de escrita de letra: rima, métrica, prosódia (encaixe letra-melodia). Cada grupo escolhe um tema e escreve verso e refrão. Prática de cantar a letra sobre a melodia criada na aula anterior.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo cantando ou falando a letra criada sobre uma base. Postar no app.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Guia de escrita de letras – Rima, métrica e prosódia', type: 'document' },
      { title: 'PDF: Banco de temas para inspiração de letras', type: 'document' },
      { title: 'Áudio: Bases instrumentais para encaixe de letra', type: 'audio' },
      { title: 'Cadernos/folhas para rascunho de letras', type: null },
    ],
    criteria: ['Qualidade e coerência da letra', 'Encaixe letra-melodia (prosódia)', 'Participação no processo criativo', 'Cumprimento do desafio Alpha'],
    checklist: ['Material de escrita distribuído', 'Bases instrumentais preparadas', 'Dicionário de rimas disponível', 'Espaço silencioso para criação'],
  },
  {
    n: 44, date: '2026-06-20', title: 'Arranjo Musical I – Fundamentos',
    objective: 'Introduzir conceitos de arranjo musical (distribuição de vozes, textura, contraponto básico), ensinar a transformar uma melodia simples em uma peça para conjunto.',
    activities: [
      { title: 'Abertura/Integração — Escuta comparativa: mesma melodia tocada solo vs. com arranjo para grupo. Debate: o que muda? O que é arranjo?', type: 'abertura' },
      { title: 'Atividade Principal — Conceitos de arranjo: uníssonos, oitavas, terças, contracantos. Cada grupo recebe uma melodia simples e deve criar um arranjo para seus instrumentos. Professor orienta cada grupo.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar a primeira versão do arranjo do grupo. Postar no app comparando com a melodia original.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Introdução ao arranjo musical – Conceitos e técnicas', type: 'document' },
      { title: 'Partitura: Melodias simples para arranjar', type: 'sheet_music' },
      { title: 'Áudio: Exemplos de arranjos progressivos (solo → dueto → grupo)', type: 'audio' },
      { title: 'PDF: Ficha de arranjo – Template para vozes', type: 'document' },
    ],
    criteria: ['Compreensão dos conceitos de arranjo', 'Criatividade na distribuição de vozes', 'Funcionalidade do arranjo criado', 'Cumprimento do desafio Alpha'],
    checklist: ['Melodias-base impressas', 'Fichas de arranjo impressas', 'Exemplos de arranjo preparados', 'Instrumentos por naipe organizados'],
  },
  {
    n: 45, date: '2026-06-27', title: 'Arranjo Musical II – Vozes e Naipes',
    objective: 'Aprofundar técnicas de arranjo com foco em escrita para naipes (sopros, cordas, percussão), texturas (homofônica, polifônica) e dinâmica de grupo.',
    activities: [
      { title: 'Abertura/Integração — Demonstração ao vivo: professor toca 3 arranjos da mesma música com texturas diferentes (unísono, homofônico, polifônico). Debate sobre o efeito de cada um.', type: 'abertura' },
      { title: 'Atividade Principal — Divisão por naipes: cada naipe cria sua parte para a peça da semana. Ensaio por naipes separados, depois junção. Ajustes de equilíbrio e dinâmica no conjunto.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo do arranjo completo com todos os naipes juntos. Postar no app.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Guia de escrita para naipes – Sopros, cordas e percussão', type: 'document' },
      { title: 'Partitura: Arranjo-base com partes separadas por naipe', type: 'sheet_music' },
      { title: 'Áudio: Referência do arranjo completo', type: 'audio' },
      { title: 'PDF: Ficha de equilíbrio e dinâmica entre naipes', type: 'document' },
    ],
    criteria: ['Funcionalidade da parte do naipe', 'Equilíbrio sonoro no conjunto', 'Coesão entre os naipes', 'Cumprimento do desafio Alpha'],
    checklist: ['Partes por naipe impressas', 'Salas/espaços para ensaio separado', 'Gravação de referência testada', 'Cronômetro para gerenciar ensaios'],
  },
  {
    n: 46, date: '2026-07-04', title: 'Produção Musical Digital Avançada',
    objective: 'Aprofundar o uso de ferramentas digitais de produção musical (DAWs móveis e desktop), ensinar edição de áudio, uso de loops e efeitos básicos.',
    activities: [
      { title: 'Abertura/Integração — Demonstração: professor monta uma música ao vivo em DAW usando loops, samples e gravação. Debate: como a tecnologia amplia a criatividade?', type: 'abertura' },
      { title: 'Atividade Principal — Tutorial hands-on: BandLab/GarageBand/Soundtrap. Cada dupla cria uma produção de 1 minuto usando loops + gravação de instrumento real. Edição básica: cortar, colar, volume, pan, efeitos.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Exportar a produção digital e postar no app como áudio. Descrever os elementos usados (loops, gravação, efeitos).', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Tutorial BandLab/GarageBand – Passo a passo', type: 'document' },
      { title: 'Link: Acesso ao BandLab (gratuito e online)', type: 'link' },
      { title: 'Áudio: Banco de loops e samples para uso livre', type: 'audio' },
      { title: 'Vídeo: Tutorial de edição de áudio básica', type: 'video' },
    ],
    criteria: ['Capacidade de usar a DAW', 'Criatividade na produção', 'Qualidade da edição de áudio', 'Cumprimento do desafio Alpha'],
    checklist: ['Celulares/tablets carregados', 'Apps de DAW instalados e testados', 'Fones de ouvido disponíveis', 'Wi-Fi estável'],
  },
  {
    n: 47, date: '2026-07-11', title: 'Gravação e Mixagem Básica',
    objective: 'Ensinar fundamentos de gravação de áudio (posicionamento de microfone, níveis, ambiente), mixagem básica e masterização simplificada.',
    activities: [
      { title: 'Abertura/Integração — Escuta crítica: comparar gravações de baixa e alta qualidade da mesma música. Alunos identificam diferenças e problemas técnicos.', type: 'abertura' },
      { title: 'Atividade Principal — Demonstração de gravação: posicionamento de microfone, níveis de entrada, tratamento acústico improvisado. Cada grupo grava um take de sua peça. Introdução à mixagem: volume, pan, EQ simples.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Postar no app a gravação finalizada com mixagem básica. Comparar com a versão "crua" sem mixagem.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Guia de gravação caseira – Dicas práticas', type: 'document' },
      { title: 'PDF: Introdução à mixagem – Volume, pan e EQ', type: 'document' },
      { title: 'Vídeo: Posicionamento de microfone por instrumento', type: 'video' },
      { title: 'Microfone e interface de áudio (demonstração)', type: null },
    ],
    criteria: ['Qualidade da gravação (níveis, ruído)', 'Aplicação dos conceitos de mixagem', 'Trabalho em equipe na sessão de gravação', 'Cumprimento do desafio Alpha'],
    checklist: ['Microfone e interface testados', 'Software de gravação instalado', 'Ambiente acústico preparado', 'Fones de ouvido para mixagem'],
  },

  // ── Bloco 4: Cultura e Diversidade Musical (48–53) ──
  {
    n: 48, date: '2026-07-18', title: 'Música Africana e Afro-Brasileira',
    objective: 'Explorar as raízes musicais africanas e sua influência na música brasileira, praticar ritmos afro-brasileiros e valorizar a diversidade cultural.',
    activities: [
      { title: 'Abertura/Integração — Roda de conversa: o que sabemos sobre a influência africana na música brasileira? Escuta de exemplos: maracatu, ijexá, samba de roda, jongo.', type: 'abertura' },
      { title: 'Atividade Principal — Prática de ritmos africanos em percussão corporal e instrumentos: djembê, agogô, ganzá. Aprender uma canção afro-brasileira em grupo. Contexto cultural: história e significado dos ritmos.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo do grupo tocando um ritmo afro-brasileiro aprendido. Postar no app com informação cultural sobre o ritmo.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Ritmos Africanos e Afro-Brasileiros – Guia rítmico', type: 'document' },
      { title: 'Vídeo: Documentário curto sobre música africana no Brasil', type: 'video' },
      { title: 'Áudio: Exemplos de maracatu, ijexá, samba de roda', type: 'audio' },
      { title: 'Instrumentos de percussão afro-brasileiros', type: null },
    ],
    criteria: ['Execução dos ritmos afro-brasileiros', 'Participação nas atividades culturais', 'Compreensão do contexto histórico', 'Cumprimento do desafio Alpha'],
    checklist: ['Instrumentos de percussão separados', 'Vídeo documentário preparado', 'Material cultural impresso', 'Espaço para dança e movimento'],
  },
  {
    n: 49, date: '2026-07-25', title: 'Música Latino-Americana',
    objective: 'Conhecer a diversidade musical da América Latina (salsa, cumbia, bossa nova, tango, son cubano), praticar ritmos latinos e explorar a identidade musical continental.',
    activities: [
      { title: 'Abertura/Integração — Viagem sonora: ouvir 1 minuto de cada gênero latino (salsa, cumbia, bossa, tango, son). Alunos adivinham o país de origem.', type: 'abertura' },
      { title: 'Atividade Principal — Prática de clave latina e ritmos de bossa nova no conjunto. Aprender uma peça latino-americana em grupo. Comparação de padrões rítmicos entre gêneros.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo tocando uma peça latina aprendida. Postar no app com pesquisa sobre o gênero escolhido.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Mapa musical da América Latina – Gêneros e ritmos', type: 'document' },
      { title: 'Partitura: Peça latino-americana para conjunto', type: 'sheet_music' },
      { title: 'Áudio: Exemplos de salsa, cumbia, bossa nova, tango', type: 'audio' },
      { title: 'Vídeo: Performance de conjunto latino para referência', type: 'video' },
    ],
    criteria: ['Execução do ritmo latino', 'Compreensão da diversidade musical latina', 'Qualidade do conjunto na peça', 'Cumprimento do desafio Alpha'],
    checklist: ['Material de referência impresso', 'Partituras distribuídas', 'Áudios de gêneros latinos testados', 'Instrumentos de percussão latina disponíveis'],
  },
  {
    n: 50, date: '2026-08-01', title: 'Música Japonesa e Asiática – Aprofundamento',
    objective: 'Aprofundar o estudo da música japonesa tradicional e contemporânea, explorar escalas pentatônicas orientais, J-Pop/J-Rock e integrar elementos culturais nipo-brasileiros.',
    activities: [
      { title: 'Abertura/Integração — Escuta meditativa: peça tradicional para koto. Debate: quais emoções a música oriental desperta? Comparação com a escala ocidental.', type: 'abertura' },
      { title: 'Atividade Principal — Prática da escala pentatônica japonesa (in, yo, miyako-bushi). Aprender trecho de música tradicional + adaptação de J-Pop para o conjunto. Conexão cultural: a herança nipo-brasileira.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo tocando na escala pentatônica japonesa ou a adaptação de J-Pop. Postar no app com reflexão sobre a identidade nipo-brasileira.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Escalas pentatônicas japonesas – In, Yo, Miyako-bushi', type: 'document' },
      { title: 'Partitura: Peça tradicional japonesa adaptada', type: 'sheet_music' },
      { title: 'Vídeo: Instrumentos tradicionais japoneses (koto, shamisen, taiko)', type: 'video' },
      { title: 'Áudio: J-Pop e J-Rock – Seleção para adaptação', type: 'audio' },
    ],
    criteria: ['Execução da escala pentatônica japonesa', 'Qualidade da adaptação para conjunto', 'Reflexão cultural nipo-brasileira', 'Cumprimento do desafio Alpha'],
    checklist: ['Material de escalas japonesas impresso', 'Vídeos de instrumentos tradicionais preparados', 'Partituras adaptadas distribuídas', 'Espaço preparado para prática'],
  },
  {
    n: 51, date: '2026-08-08', title: 'Jazz e Blues – Raízes e Estilo',
    objective: 'Apresentar os fundamentos do jazz e do blues (blue notes, swing, walking bass, 12-bar blues), praticar improvisação no estilo e valorizar a história dessas tradições.',
    activities: [
      { title: 'Abertura/Integração — Escuta histórica: do blues do Delta do Mississippi ao jazz de New Orleans. Linha do tempo visual. Debate: como o blues influenciou toda a música popular?', type: 'abertura' },
      { title: 'Atividade Principal — Prática do 12-bar blues em conjunto: base harmônica + melodia blues. Introdução às blue notes e ao swing. Improvisação guiada sobre o 12-bar blues: cada aluno faz um chorus.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar improvisação de 12 compassos sobre base de blues. Postar no app.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Guia de Blues e Jazz – História e fundamentos', type: 'document' },
      { title: 'Partitura: 12-Bar Blues em Dó – Partes para conjunto', type: 'sheet_music' },
      { title: 'Áudio: Playback de 12-bar blues para improvisação', type: 'audio' },
      { title: 'Vídeo: Documentário curto sobre história do blues/jazz', type: 'video' },
    ],
    criteria: ['Execução do 12-bar blues', 'Uso de blue notes na improvisação', 'Swing e feeling no groove', 'Cumprimento do desafio Alpha'],
    checklist: ['Playbacks de blues preparados', 'Partituras de blues impressas', 'Linha do tempo visual montada', 'Instrumentos afinados'],
  },
  {
    n: 52, date: '2026-08-15', title: 'Rock, Pop e Música Urbana',
    objective: 'Explorar os gêneros rock, pop e música urbana contemporânea (hip-hop, trap, R&B), praticar ritmos e grooves característicos e criar arranjos em grupo.',
    activities: [
      { title: 'Abertura/Integração — Playlist colaborativa: cada aluno traz 1 música que representa "sua geração". Escuta coletiva e debate sobre diversidade de gêneros.', type: 'abertura' },
      { title: 'Atividade Principal — Prática de grooves: rock (8th note feel), pop (4 on the floor), hip-hop (boom-bap). Cada grupo escolhe um gênero e cria um arranjo curto de uma música atual. Ensaio e apresentação.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo do arranjo pop/rock/urbano criado. Postar no app com enquete: qual gênero a turma mais curtiu?', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Grooves essenciais – Rock, Pop e Música Urbana', type: 'document' },
      { title: 'Áudio: Exemplos de grooves por gênero', type: 'audio' },
      { title: 'Link: Plataforma de beats para referência (YouTube/Spotify)', type: 'link' },
      { title: 'Cifra/partitura: Opções de músicas atuais para arranjo', type: 'sheet_music' },
    ],
    criteria: ['Domínio do groove do gênero escolhido', 'Criatividade no arranjo', 'Energia e engajamento na performance', 'Cumprimento do desafio Alpha'],
    checklist: ['Lista de músicas atuais preparada', 'Caixas de som para escuta', 'Instrumentos organizados', 'App preparado para enquete'],
  },
  {
    n: 53, date: '2026-08-22', title: 'Revisão e Mini-Recital II',
    objective: 'Revisar os conteúdos dos Blocos 3 e 4, consolidar os aprendizados de composição, arranjo, produção digital e diversidade cultural através de um mini-recital temático.',
    activities: [
      { title: 'Abertura/Integração — Quiz musical relâmpago: perguntas sobre composição, arranjo, escalas modais, gêneros mundiais. Competição entre grupos.', type: 'abertura' },
      { title: 'Atividade Principal — Mini-recital temático: cada grupo apresenta 1 peça que represente um dos temas dos Blocos 3-4 (composição original, arranjo, música mundial, produção digital). Avaliação pela plateia.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar e postar o mini-recital no app. Cada aluno vota na melhor apresentação.', type: 'alpha' },
      { title: 'Encerramento — Premiação e feedback coletivo. Reflexão sobre o 1º semestre completo. Celebração das conquistas.', type: 'final' },
    ],
    materials: [
      { title: 'PDF: Ficha de avaliação do mini-recital II', type: 'document' },
      { title: 'PDF: Resumo dos Blocos 3 e 4', type: 'document' },
      { title: 'Certificados de participação do 1º semestre', type: null },
      { title: 'Partituras das peças dos grupos', type: 'sheet_music' },
    ],
    criteria: ['Qualidade da apresentação', 'Conexão com o tema escolhido', 'Evolução musical desde o início do ano', 'Cumprimento do desafio Alpha'],
    checklist: ['Espaço de mini-palco preparado', 'Fichas de avaliação impressas', 'Câmera para gravação', 'Certificados e premiações prontos'],
  },

  // ── Bloco 5: Performance e Palco (54–59) ──
  {
    n: 54, date: '2026-08-29', title: 'Técnicas de Palco e Presença Cênica',
    objective: 'Desenvolver habilidades de performance ao vivo: presença de palco, comunicação com a plateia, posicionamento, movimentação e controle do nervosismo.',
    activities: [
      { title: 'Abertura/Integração — Dinâmica de confiança: exercícios teatrais de projeção de voz, contato visual e expressão corporal. "Diga seu nome como uma estrela do rock."', type: 'abertura' },
      { title: 'Atividade Principal — Workshop de palco: posicionamento no palco (onde ficar, como se mover), comunicação com a plateia (olhar, gestos, falar ao microfone), técnicas de controle da ansiedade (respiração, visualização). Prática: simular entrada no palco, performance e saída.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo simulando uma entrada de palco + performance + agradecimento. Postar no app.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Manual de performance ao vivo – 10 dicas essenciais', type: 'document' },
      { title: 'Vídeo: Análise de performances icônicas (pontos fortes e erros)', type: 'video' },
      { title: 'PDF: Exercícios de controle de ansiedade para músicos', type: 'document' },
      { title: 'Microfone e sistema de som para simulação', type: null },
    ],
    criteria: ['Presença de palco e postura', 'Comunicação com a plateia', 'Controle emocional na simulação', 'Cumprimento do desafio Alpha'],
    checklist: ['Espaço simulando palco preparado', 'Microfone e som testados', 'Vídeos de referência preparados', 'Exercícios de teatro impressos'],
  },
  {
    n: 55, date: '2026-09-05', title: 'Sonorização e Amplificação',
    objective: 'Ensinar fundamentos de sonorização ao vivo: uso de microfones, mesa de som, retorno/monitor, equalização básica e montagem de som para apresentações.',
    activities: [
      { title: 'Abertura/Integração — Tour técnico: apresentar cada equipamento de som (microfone, mesa, caixas, cabos, retorno). Quiz: para que serve cada um?', type: 'abertura' },
      { title: 'Atividade Principal — Prática hands-on: montar um sistema de som simples. Cada dupla conecta microfone → mesa → caixa. Prática de passagem de som: ajustar volume, EQ e retorno para cada instrumento. Simulação de soundcheck completo.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo-tutorial curto explicando como conectar um microfone à mesa de som. Postar no app.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Guia de sonorização ao vivo – Do zero ao palco', type: 'document' },
      { title: 'PDF: Diagrama de conexões – Mesa de som, microfones e caixas', type: 'document' },
      { title: 'Vídeo: Tutorial de passagem de som', type: 'video' },
      { title: 'Equipamento de som para demonstração', type: null },
    ],
    criteria: ['Compreensão do sistema de som', 'Capacidade de montar conexões básicas', 'Participação no soundcheck', 'Cumprimento do desafio Alpha'],
    checklist: ['Equipamento de som disponível e testado', 'Cabos e adaptadores suficientes', 'Diagrama de conexões impresso', 'Espaço seguro para prática'],
  },
  {
    n: 56, date: '2026-09-12', title: 'Improvisação Avançada',
    objective: 'Desenvolver habilidades avançadas de improvisação musical: improvisar sobre progressões, usar modos e escalas aprendidas, improvisar coletivamente com diálogo musical.',
    activities: [
      { title: 'Abertura/Integração — "Conversa musical": 2 alunos improvisam juntos como se estivessem conversando (pergunta e resposta musical). Turma observa e comenta.', type: 'abertura' },
      { title: 'Atividade Principal — Improvisação sobre progressões: ii-V-I em diferentes tonalidades. Uso de escalas modais na improvisação. Prática de improvisação coletiva: formato de jam session com revezamento de solistas.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar improvisação de 1 minuto sobre uma base harmônica. Postar no app descrevendo a escala/modo usado.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Guia de improvisação avançada – Escalas sobre progressões', type: 'document' },
      { title: 'Áudio: Playbacks de jam session em diferentes tonalidades', type: 'audio' },
      { title: 'PDF: Mapa de escalas para cada acorde', type: 'document' },
      { title: 'Vídeo: Jam session de referência', type: 'video' },
    ],
    criteria: ['Fluência na improvisação', 'Uso consciente de escalas/modos', 'Diálogo musical com outros improvisadores', 'Cumprimento do desafio Alpha'],
    checklist: ['Playbacks de jam preparados', 'Mapas de escalas impressos', 'Instrumentos afinados', 'Espaço organizado para jam session'],
  },
  {
    n: 57, date: '2026-09-19', title: 'Música de Câmara e Formações Acústicas',
    objective: 'Explorar a música de câmara e formações acústicas pequenas (duo, trio, quarteto), desenvolver escuta íntima e interação musical sem amplificação.',
    activities: [
      { title: 'Abertura/Integração — Escuta de quarteto de cordas e trio de jazz. Debate: o que muda quando não há amplificação? Como os músicos se comunicam?', type: 'abertura' },
      { title: 'Atividade Principal — Formação de duos, trios e quartetos. Cada formação ensaia uma peça curta com foco em equilíbrio dinâmico, escuta mútua e comunicação visual. Apresentação para a turma.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo da formação acústica tocando. Postar no app. Desafio extra: gravar sem edição (take único).', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Repertório para formações de câmara – Arranjos para duo/trio/quarteto', type: 'document' },
      { title: 'Partitura: Peças para duos e trios', type: 'sheet_music' },
      { title: 'Áudio: Exemplos de música de câmara', type: 'audio' },
      { title: 'Vídeo: Quarteto de cordas em performance', type: 'video' },
    ],
    criteria: ['Equilíbrio dinâmico na formação', 'Escuta mútua e interação', 'Comunicação visual entre músicos', 'Cumprimento do desafio Alpha'],
    checklist: ['Partituras para formações distribuídas', 'Espaços separados para ensaio', 'Ambiente silencioso preparado', 'Câmera para gravação acústica'],
  },
  {
    n: 58, date: '2026-09-26', title: 'Projeto Musical – Planejamento',
    objective: 'Iniciar o Projeto Musical de cada grupo: escolher repertório, definir formação, planejar arranjo, distribuir responsabilidades e criar cronograma até o Show Final.',
    activities: [
      { title: 'Abertura/Integração — Brainstorm coletivo: cada grupo discute ideias para seu projeto musical. Quais músicas? Qual formação? Vão compor ou arranjar?', type: 'abertura' },
      { title: 'Atividade Principal — Cada grupo preenche a ficha de projeto: repertório escolhido (1-2 músicas), formação dos músicos, estilo de arranjo, cronograma de ensaios. Professor orienta e valida cada projeto.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Postar no app o plano do projeto musical do grupo: nome do grupo, repertório e foto da equipe.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Ficha de Projeto Musical – Template completo', type: 'document' },
      { title: 'PDF: Lista de repertório sugerido por nível', type: 'document' },
      { title: 'PDF: Cronograma modelo para preparação de show', type: 'document' },
      { title: 'Folhas grandes para brainstorm visual', type: null },
    ],
    criteria: ['Viabilidade do projeto escolhido', 'Organização do cronograma', 'Clareza na distribuição de funções', 'Cumprimento do desafio Alpha'],
    checklist: ['Fichas de projeto impressas', 'Lista de repertório disponível', 'Folhas grandes e canetas', 'App preparado para postagens'],
  },
  {
    n: 59, date: '2026-10-03', title: 'Projeto Musical – Execução',
    objective: 'Iniciar a execução do Projeto Musical: primeiros ensaios focados, leitura do repertório escolhido, montagem do arranjo e resolução de desafios técnicos.',
    activities: [
      { title: 'Abertura/Integração — Check-in rápido: cada grupo apresenta em 1 minuto o que preparou durante a semana. O que funcionou? O que travou?', type: 'abertura' },
      { title: 'Atividade Principal — Ensaio dirigido por grupo: professor circula entre os grupos orientando. Foco em leitura do repertório, distribuição de partes e primeiros ensaios musicais. Resolução de problemas técnicos.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo do primeiro ensaio do projeto (mesmo que incompleto). Postar no app como "work in progress".', type: 'alpha' },
    ],
    materials: [
      { title: 'Partituras/cifras do repertório de cada grupo', type: 'sheet_music' },
      { title: 'PDF: Checklist de ensaio – O que verificar em cada sessão', type: 'document' },
      { title: 'Áudio: Gravações de referência das músicas escolhidas', type: 'audio' },
      { title: 'Metrônomo e afinador', type: null },
    ],
    criteria: ['Progresso no repertório', 'Organização do ensaio', 'Capacidade de resolver problemas técnicos', 'Cumprimento do desafio Alpha'],
    checklist: ['Espaços de ensaio por grupo preparados', 'Partituras de cada grupo disponíveis', 'Metrônomos e afinadores distribuídos', 'Professor com roteiro de orientação'],
  },

  // ── Bloco 6: Projetos e Repertório Final (60–65) ──
  {
    n: 60, date: '2026-10-10', title: 'Videoclipe e Conteúdo Digital',
    objective: 'Ensinar técnicas básicas de produção audiovisual para criação de videoclipes musicais, desenvolver linguagem visual e storytelling aplicados à música.',
    activities: [
      { title: 'Abertura/Integração — Análise de videoclipes: assistir 2 clips (um simples, um elaborado). Debate: o que torna um clipe interessante? Qual a relação entre imagem e música?', type: 'abertura' },
      { title: 'Atividade Principal — Workshop de produção de videoclipe: planejamento (storyboard básico), filmagem (enquadramentos, iluminação com celular), edição (CapCut/iMovie). Cada grupo planeja e filma um trecho de seu videoclipe.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Postar no app o trecho filmado do videoclipe (mesmo que seja um teaser de 30s).', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Guia de produção de videoclipe com celular', type: 'document' },
      { title: 'PDF: Template de storyboard para videoclipe', type: 'document' },
      { title: 'Link: Tutorial CapCut/iMovie para edição de vídeo', type: 'link' },
      { title: 'Vídeo: Exemplos de videoclipes feitos com celular', type: 'video' },
    ],
    criteria: ['Criatividade do conceito visual', 'Qualidade da filmagem', 'Coerência entre imagem e música', 'Cumprimento do desafio Alpha'],
    checklist: ['Celulares carregados para filmagem', 'Apps de edição instalados', 'Espaços para filmagem preparados', 'Templates de storyboard impressos'],
  },
  {
    n: 61, date: '2026-10-17', title: 'Música e Comunidade',
    objective: 'Refletir sobre o papel da música na comunidade, planejar ações musicais comunitárias e preparar repertório acessível para apresentação em contextos diversos.',
    activities: [
      { title: 'Abertura/Integração — Debate: como a música pode transformar uma comunidade? Exemplos de projetos sociais musicais no Brasil e no mundo. Conexão com a missão Nipo School.', type: 'abertura' },
      { title: 'Atividade Principal — Cada grupo planeja uma "ação musical comunitária" hipotética: onde tocariam? Para quem? Que repertório? Prática de peça acessível para público leigo (simples, envolvente, com participação da plateia).', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar vídeo da peça ensaiada com convite para a comunidade. Postar no app como "preview" da ação comunitária.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Música e Transformação Social – Projetos de referência', type: 'document' },
      { title: 'PDF: Repertório acessível para apresentações comunitárias', type: 'document' },
      { title: 'Vídeo: Documentário sobre projetos sociais musicais', type: 'video' },
      { title: 'Cifra: Peças para apresentação com participação da plateia', type: 'sheet_music' },
    ],
    criteria: ['Reflexão sobre música e comunidade', 'Viabilidade do plano de ação', 'Qualidade da peça ensaiada', 'Cumprimento do desafio Alpha'],
    checklist: ['Material de referência preparado', 'Repertório acessível selecionado', 'Vídeo de documentário pronto', 'Espaço para ensaio em grupo'],
  },
  {
    n: 62, date: '2026-10-24', title: 'Repertório para o Show Final I',
    objective: 'Definir o repertório oficial do Show Final 2026, distribuir partes entre grupos e naipes, e iniciar os ensaios focados no repertório de encerramento.',
    activities: [
      { title: 'Abertura/Integração — Apresentação do setlist oficial do Show Final. Votação final sobre ordem das músicas. Definição dos grupos e solistas para cada peça.', type: 'abertura' },
      { title: 'Atividade Principal — Distribuição de partes e partituras do Show Final. Primeiro ensaio das peças coletivas (toda a turma junta). Foco na leitura e nas entradas de cada naipe.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Postar no app o setlist oficial do Show Final com foto do grupo. Cada aluno comenta qual peça está mais animado para tocar.', type: 'alpha' },
    ],
    materials: [
      { title: 'Partitura: Repertório completo do Show Final – Partes por naipe', type: 'sheet_music' },
      { title: 'PDF: Setlist oficial do Show Final 2026', type: 'document' },
      { title: 'Áudio: Gravações de referência de cada peça do show', type: 'audio' },
      { title: 'PDF: Mapa de palco com posições dos músicos', type: 'document' },
    ],
    criteria: ['Leitura das partes do Show Final', 'Comprometimento com o repertório', 'Participação no primeiro ensaio coletivo', 'Cumprimento do desafio Alpha'],
    checklist: ['Partituras completas impressas e distribuídas', 'Gravações de referência preparadas', 'Mapa de palco definido', 'Setlist oficial finalizado'],
  },
  {
    n: 63, date: '2026-10-31', title: 'Repertório para o Show Final II',
    objective: 'Aprofundar o ensaio do repertório do Show Final com foco em detalhes musicais: dinâmica, articulação, transições entre peças e momentos especiais do show.',
    activities: [
      { title: 'Abertura/Integração — Escuta da gravação de referência: cada peça é ouvida com partitura na mão. Marcar pontos de atenção (dinâmica, cortes, entradas).', type: 'abertura' },
      { title: 'Atividade Principal — Ensaio focado: trabalhar cada peça do setlist com atenção a dinâmicas, articulações e transições. Ensaiar momentos especiais: solos, participação da plateia, momentos de silêncio.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar trecho do ensaio mostrando evolução. Postar no app comparando com o primeiro ensaio.', type: 'alpha' },
    ],
    materials: [
      { title: 'Partitura: Repertório do Show Final com marcações de dinâmica', type: 'sheet_music' },
      { title: 'PDF: Roteiro do Show Final – Ordem, transições e momentos especiais', type: 'document' },
      { title: 'Áudio: Gravações de referência com dinâmicas marcadas', type: 'audio' },
      { title: 'PDF: Lista de correções do ensaio anterior', type: 'document' },
    ],
    criteria: ['Execução das dinâmicas marcadas', 'Fluência nas transições', 'Atenção aos detalhes musicais', 'Cumprimento do desafio Alpha'],
    checklist: ['Partituras com marcações atualizadas', 'Roteiro do show impresso', 'Gravações de referência testadas', 'Lista de correções distribuída'],
  },
  {
    n: 64, date: '2026-11-07', title: 'Ensaio Dirigido I',
    objective: 'Realizar ensaio completo do Show Final no formato de passada geral (run-through), simulando o show do início ao fim com foco em continuidade e fluência.',
    activities: [
      { title: 'Abertura/Integração — Aquecimento coletivo: vocalize, escalas e alongamento. Devocional motivacional sobre confiança e união.', type: 'abertura' },
      { title: 'Atividade Principal — Run-through completo: executar todo o setlist na ordem, sem parar. Simular entradas, saídas, transições e momentos de fala/apresentação. Feedback do professor ao final de cada peça.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar o run-through completo (ou trechos). Postar no app como "contagem regressiva para o Show Final".', type: 'alpha' },
    ],
    materials: [
      { title: 'Partitura: Repertório completo do Show Final', type: 'sheet_music' },
      { title: 'PDF: Roteiro de palco – Entradas, saídas e falas', type: 'document' },
      { title: 'Cronômetro para controle de tempo do show', type: null },
      { title: 'PDF: Ficha de feedback por peça', type: 'document' },
    ],
    criteria: ['Continuidade no run-through', 'Transições fluentes entre peças', 'Postura de palco durante todo o show', 'Cumprimento do desafio Alpha'],
    checklist: ['Espaço simulando palco completo', 'Roteiro de palco distribuído', 'Cronômetro preparado', 'Câmera para gravar o ensaio'],
  },
  {
    n: 65, date: '2026-11-14', title: 'Ensaio Dirigido II',
    objective: 'Realizar segundo ensaio completo com correções dos pontos identificados no Ensaio Dirigido I, polir detalhes e fortalecer a confiança do grupo.',
    activities: [
      { title: 'Abertura/Integração — Revisão dos pontos de melhoria do ensaio anterior. Exercício de confiança: "Diga algo que admira no colega ao lado."', type: 'abertura' },
      { title: 'Atividade Principal — Trabalho focado nos pontos fracos identificados. Depois: run-through completo novamente. Ensaio de situações-problema: o que fazer se errar? Se o som falhar? Se esquecer a parte?', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Postar no app um "diário de ensaio": o que melhorou, o que ainda precisa de atenção. Encorajar os colegas nos comentários.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Lista de correções do Ensaio Dirigido I', type: 'document' },
      { title: 'Partitura: Repertório com marcações atualizadas', type: 'sheet_music' },
      { title: 'PDF: Protocolo de emergência – O que fazer se algo der errado', type: 'document' },
      { title: 'Áudio: Click track para controle de tempo', type: 'audio' },
    ],
    criteria: ['Melhoria nos pontos fracos identificados', 'Resiliência em situações-problema', 'Confiança e apoio entre colegas', 'Cumprimento do desafio Alpha'],
    checklist: ['Lista de correções revisada', 'Partituras atualizadas', 'Protocolo de emergência distribuído', 'Click track testado'],
  },

  // ── Bloco 7: Preparação e Formatura (66–69) ──
  {
    n: 66, date: '2026-11-21', title: 'Ensaio Geral I',
    objective: 'Realizar o primeiro ensaio geral com cenário, iluminação (se possível), figurino e todos os elementos do show final, simulando o evento real.',
    activities: [
      { title: 'Abertura/Integração — Devocional de motivação: reflexão sobre a jornada do ano. Cada aluno recebe uma carta de si mesmo escrita na aula inaugural (aula 30).', type: 'abertura' },
      { title: 'Atividade Principal — Ensaio geral completo no espaço de apresentação (ou simulação). Com figurino, posições de palco, iluminação e som amplificado. Run-through do início ao fim sem interrupções.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Gravar bastidores do ensaio geral (fotos e vídeos). Postar no app como "behind the scenes" do Show Final.', type: 'alpha' },
    ],
    materials: [
      { title: 'Partitura: Repertório final completo', type: 'sheet_music' },
      { title: 'PDF: Roteiro de palco definitivo', type: 'document' },
      { title: 'PDF: Checklist de produção do show', type: 'document' },
      { title: 'Figurino e acessórios de palco', type: null },
    ],
    criteria: ['Execução completa sem interrupções', 'Uso correto de figurino e posicionamento', 'Sincronia com som e iluminação', 'Cumprimento do desafio Alpha'],
    checklist: ['Espaço de apresentação reservado', 'Sistema de som montado e testado', 'Figurinos conferidos', 'Iluminação preparada (se disponível)'],
  },
  {
    n: 67, date: '2026-11-28', title: 'Ensaio Geral II',
    objective: 'Realizar o segundo e último ensaio geral, corrigir detalhes finais e preparar emocionalmente os alunos para a apresentação oficial da Formatura.',
    activities: [
      { title: 'Abertura/Integração — Círculo de gratidão: cada aluno agradece a alguém do grupo por algo específico do ano. Momento de oração/reflexão coletiva.', type: 'abertura' },
      { title: 'Atividade Principal — Ensaio geral final: run-through completo com todos os elementos. Ajustes finais de som, posicionamento e transições. Ensaio da cerimônia de formatura (entrega de certificados, discursos, agradecimentos).', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Postar no app uma mensagem de agradecimento à equipe Nipo School. Compartilhar expectativas para o Show Final.', type: 'alpha' },
    ],
    materials: [
      { title: 'Partitura: Repertório final com últimas correções', type: 'sheet_music' },
      { title: 'PDF: Roteiro da cerimônia de formatura', type: 'document' },
      { title: 'Certificados de conclusão do Ano 2', type: null },
      { title: 'PDF: Checklist final do show', type: 'document' },
    ],
    criteria: ['Excelência na execução final', 'Postura e profissionalismo', 'Preparação emocional e foco', 'Cumprimento do desafio Alpha'],
    checklist: ['Todos os elementos de produção testados', 'Certificados impressos e conferidos', 'Roteiro da cerimônia finalizado', 'Convites distribuídos para famílias'],
  },
  {
    n: 68, date: '2026-12-05', title: 'Passagem de Som e Ensaio Final',
    objective: 'Realizar a passagem de som oficial no local do Show Final, fazer os últimos ajustes técnicos e emocionais e preparar tudo para a Formatura.',
    activities: [
      { title: 'Abertura/Integração — Momento de concentração: exercício de respiração profunda e visualização do show perfeito. Palavras de encorajamento do professor.', type: 'abertura' },
      { title: 'Atividade Principal — Passagem de som completa no local do evento: testar cada instrumento, vozes, retorno, volume de cada naipe. Run-through final das peças mais desafiadoras. Ensaio da cerimônia de formatura com todos os elementos.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Postar no app uma mensagem motivacional para si mesmo: "Carta para o eu de amanhã". Compartilhar com o grupo.', type: 'alpha' },
    ],
    materials: [
      { title: 'PDF: Rider técnico do show – Necessidades de som e palco', type: 'document' },
      { title: 'Partitura: Repertório final para consulta rápida', type: 'sheet_music' },
      { title: 'PDF: Cronograma do dia do Show Final', type: 'document' },
      { title: 'Kit de emergência: cordas, palhetas, pilhas, fita', type: null },
    ],
    criteria: ['Qualidade da passagem de som', 'Foco e concentração nos últimos ajustes', 'Preparação técnica e emocional', 'Cumprimento do desafio Alpha'],
    checklist: ['Local do evento reservado e acessível', 'Sistema de som completo no local', 'Kit de emergência preparado', 'Cronograma do dia distribuído'],
  },
  {
    n: 69, date: '2026-12-12', title: 'Formatura – Show Final 2026',
    objective: 'Realizar a Formatura e o Show Final do Ano 2 da Nipo School: apresentar todo o repertório preparado, celebrar as conquistas individuais e coletivas, entregar certificados e encerrar o ciclo com gratidão e alegria.',
    activities: [
      { title: 'Abertura/Integração — Devocional de abertura com famílias e comunidade. Palavras de boas-vindas do diretor/coordenador. Apresentação dos alunos e professores.', type: 'abertura' },
      { title: 'Atividade Principal — Show Final completo: execução de todo o repertório na ordem do setlist. Momentos especiais: solos, duetos, participação da plateia, homenagens. Cerimônia de formatura: entrega de certificados, premiações especiais e discurso de encerramento.', type: 'principal' },
      { title: 'Atividade App/Desafio Alpha — Postar no app foto ou vídeo pessoal do Show Final. Escrever reflexão final: "O que a música me ensinou neste ano."', type: 'alpha' },
      { title: 'Encerramento — Roda de celebração com alunos, professores e famílias. Foto oficial da turma 2026. Confraternização e agradecimentos.', type: 'final' },
    ],
    materials: [
      { title: 'PDF: Programa oficial do Show Final 2026', type: 'document' },
      { title: 'Certificados de conclusão individuais', type: null },
      { title: 'Premiações especiais (destaque do ano, maior evolução, etc.)', type: null },
      { title: 'Partitura: Repertório completo (backup)', type: 'sheet_music' },
    ],
    criteria: ['Qualidade da performance no show', 'Postura de palco e profissionalismo', 'Emoção e entrega artística', 'Participação na celebração final'],
    checklist: ['Local do evento preparado e decorado', 'Sistema de som testado e funcionando', 'Certificados e premiações organizados', 'Confraternização organizada (comida, bebida)'],
  },
]

// =============================================
// UUID GENERATION & SQL OUTPUT
// =============================================
const lessonIds = {}
const now = TS

function genSQL_lessons() {
  const lines = [
    `-- =============================================`,
    `-- Migration: 041_lessons_2026.sql`,
    `-- Table: core.lessons`,
    `-- Year 2 Curriculum: 40 lessons (Mar 14 – Dec 12, 2026)`,
    `-- Generated: ${new Date().toISOString()}`,
    `-- Rows: ${lessons.length}`,
    `-- =============================================`,
    ``,
    `BEGIN;`,
    ``,
  ]

  for (const l of lessons) {
    const id = randomUUID()
    lessonIds[l.n] = id
    lines.push(
      `INSERT INTO core.lessons (tenant_id, id, module_id, number, title, learning_objective, scheduled_date, teacher_id, status, created_at, updated_at, is_active)`,
      `VALUES ('${TENANT}', '${id}', NULL, ${l.n}, $$${l.title}$$, $$${l.objective}$$, '${l.date}'::date, NULL, 'draft', '${now}'::timestamptz, '${now}'::timestamptz, true)`,
      `ON CONFLICT (id) DO NOTHING;`,
      ``,
    )
  }

  lines.push(`COMMIT;`)
  return lines.join('\n')
}

function genSQL_activities() {
  const lines = [
    `-- =============================================`,
    `-- Migration: 042_lesson_activities_2026.sql`,
    `-- Table: core.lesson_activities`,
    `-- Year 2 Curriculum Activities`,
    `-- Generated: ${new Date().toISOString()}`,
    `-- =============================================`,
    ``,
    `BEGIN;`,
    ``,
  ]
  let count = 0

  for (const l of lessons) {
    const lid = lessonIds[l.n]
    for (let i = 0; i < l.activities.length; i++) {
      const a = l.activities[i]
      const id = randomUUID()
      lines.push(
        `INSERT INTO core.lesson_activities (tenant_id, id, lesson_id, title, activity_type, created_at, order_index)`,
        `VALUES ('${TENANT}', '${id}', '${lid}', $$${a.title}$$, $$${a.type}$$, '${now}'::timestamptz, ${i})`,
        `ON CONFLICT (id) DO NOTHING;`,
        ``,
      )
      count++
    }
  }

  lines.push(`-- Total: ${count} activities`)
  lines.push(`COMMIT;`)
  return lines.join('\n')
}

function genSQL_materials() {
  const lines = [
    `-- =============================================`,
    `-- Migration: 043_lesson_materials_2026.sql`,
    `-- Table: core.lesson_materials`,
    `-- Year 2 Curriculum Materials`,
    `-- Generated: ${new Date().toISOString()}`,
    `-- =============================================`,
    ``,
    `BEGIN;`,
    ``,
  ]
  let count = 0

  for (const l of lessons) {
    const lid = lessonIds[l.n]
    for (let i = 0; i < l.materials.length; i++) {
      const m = l.materials[i]
      const id = randomUUID()
      const typeVal = `'${m.type || 'document'}'`
      lines.push(
        `INSERT INTO core.lesson_materials (tenant_id, id, lesson_id, title, material_type, file_url, created_at, order_index)`,
        `VALUES ('${TENANT}', '${id}', '${lid}', $$${m.title}$$, ${typeVal}, $$#$$, '${now}'::timestamptz, ${i})`,
        `ON CONFLICT (id) DO NOTHING;`,
        ``,
      )
      count++
    }
  }

  lines.push(`-- Total: ${count} materials`)
  lines.push(`COMMIT;`)
  return lines.join('\n')
}

function genSQL_criteria() {
  const lines = [
    `-- =============================================`,
    `-- Migration: 044_lesson_criteria_2026.sql`,
    `-- Table: core.evaluation_criteria`,
    `-- Year 2 Curriculum Evaluation Criteria`,
    `-- Generated: ${new Date().toISOString()}`,
    `-- =============================================`,
    ``,
    `BEGIN;`,
    ``,
  ]
  let count = 0

  for (const l of lessons) {
    const lid = lessonIds[l.n]
    for (let i = 0; i < l.criteria.length; i++) {
      const c = l.criteria[i]
      const id = randomUUID()
      lines.push(
        `INSERT INTO core.evaluation_criteria (tenant_id, id, lesson_id, name, created_at, weight, order_index)`,
        `VALUES ('${TENANT}', '${id}', '${lid}', $$${c}$$, '${now}'::timestamptz, 1.00, ${i})`,
        `ON CONFLICT (id) DO NOTHING;`,
        ``,
      )
      count++
    }
  }

  lines.push(`-- Total: ${count} criteria`)
  lines.push(`COMMIT;`)
  return lines.join('\n')
}

function genSQL_checklists() {
  const lines = [
    `-- =============================================`,
    `-- Migration: 045_lesson_checklists_2026.sql`,
    `-- Table: core.lesson_checklists`,
    `-- Year 2 Curriculum Checklists`,
    `-- Generated: ${new Date().toISOString()}`,
    `-- =============================================`,
    ``,
    `BEGIN;`,
    ``,
  ]
  let count = 0

  for (const l of lessons) {
    const lid = lessonIds[l.n]
    for (let i = 0; i < l.checklist.length; i++) {
      const item = l.checklist[i]
      const id = randomUUID()
      lines.push(
        `INSERT INTO core.lesson_checklists (tenant_id, id, lesson_id, item, checklist_type, is_done, created_at, updated_at)`,
        `VALUES ('${TENANT}', '${id}', '${lid}', $$${item}$$, $$preparation$$, false, '${now}'::timestamptz, '${now}'::timestamptz)`,
        `ON CONFLICT (id) DO NOTHING;`,
        ``,
      )
      count++
    }
  }

  lines.push(`-- Total: ${count} checklist items`)
  lines.push(`COMMIT;`)
  return lines.join('\n')
}

function genCSV_lessons() {
  const header = 'id,tenant_id,module_id,number,title,learning_objective,scheduled_date,teacher_id,status,is_active'
  const rows = lessons.map(l => {
    const id = lessonIds[l.n]
    return `${id},${TENANT},,${l.n},"${l.title.replace(/"/g, '""')}","${l.objective.replace(/"/g, '""')}",${l.date},,draft,true`
  })
  return [header, ...rows].join('\n')
}

// =============================================
// GENERATE ALL FILES
// =============================================

// First generate lessons to populate lessonIds
const sqlLessons = genSQL_lessons()
writeFileSync(join(__dirname, '041_lessons_2026.sql'), sqlLessons)
console.log(`✓ 041_lessons_2026.sql (${lessons.length} lessons)`)

const sqlActivities = genSQL_activities()
writeFileSync(join(__dirname, '042_lesson_activities_2026.sql'), sqlActivities)
console.log(`✓ 042_lesson_activities_2026.sql`)

const sqlMaterials = genSQL_materials()
writeFileSync(join(__dirname, '043_lesson_materials_2026.sql'), sqlMaterials)
console.log(`✓ 043_lesson_materials_2026.sql`)

const sqlCriteria = genSQL_criteria()
writeFileSync(join(__dirname, '044_lesson_criteria_2026.sql'), sqlCriteria)
console.log(`✓ 044_lesson_criteria_2026.sql`)

const sqlChecklists = genSQL_checklists()
writeFileSync(join(__dirname, '045_lesson_checklists_2026.sql'), sqlChecklists)
console.log(`✓ 045_lesson_checklists_2026.sql`)

// CSV
const csvDir = join(__dirname, '..', '..', 'csv_originais')
writeFileSync(join(csvDir, 'aulas_2026_rows.csv'), genCSV_lessons())
console.log(`✓ csv_originais/aulas_2026_rows.csv`)

// Print summary
console.log('\n=== CURRICULUM 2026 SUMMARY ===')
console.log(`Lessons: ${lessons.length}`)
console.log(`Activities: ${lessons.reduce((s, l) => s + l.activities.length, 0)}`)
console.log(`Materials: ${lessons.reduce((s, l) => s + l.materials.length, 0)}`)
console.log(`Criteria: ${lessons.reduce((s, l) => s + l.criteria.length, 0)}`)
console.log(`Checklists: ${lessons.reduce((s, l) => s + l.checklist.length, 0)}`)
console.log(`\nDate range: ${lessons[0].date} → ${lessons[lessons.length - 1].date}`)
console.log(`Lesson numbers: ${lessons[0].n} → ${lessons[lessons.length - 1].n}`)

// Print lesson list
console.log('\n=== LESSON LIST ===')
for (const l of lessons) {
  console.log(`  ${l.n}: ${l.date} — ${l.title}`)
}
