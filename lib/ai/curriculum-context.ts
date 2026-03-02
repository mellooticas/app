// =============================================
// Curriculum context for AI prompts
// Maps methodologies and lesson themes to curriculum knowledge
// =============================================

/**
 * Core Alpha Method principles — injected into every AI prompt
 */
export const ALPHA_PRINCIPLES = `
Os 8 Pilares do Método Alpha (eixo transversal de todo o currículo):
1. Desafios Contínuos + Registro Digital — O aluno nunca para. Sempre há um próximo passo.
2. Aprendizagem Ativa e Protagonismo — O aluno lidera, sugere, cria.
3. Aprendizagem entre Pares — Alunos avançados mentoram iniciantes.
4. Integração App + Presencial — Vídeos, feedback, comunidade entre as aulas.
5. Projetos Coletivos — Gravações, festivais, bandas experimentais.
6. Acompanhamento Individualizado — Professor acompanha evolução via app.
7. Feedback e Celebração Constante — Reconhecimento público, mural digital.
8. Espiritualidade, Valores e Cultura Nipo-Brasileira — União, respeito, disciplina, alegria.
`

/**
 * Methodology descriptions for context-aware content generation
 */
export const METHODOLOGIES: Record<string, string> = {
  orff: `Orff Schulwerk: Música como experiência corporal. Improvisação, instrumentos simples, coletividade,
    inclusão. Ideal para fundamentos — abordagem democrática e acessível. Jogos rítmicos, percussão corporal,
    instrumentos de lâminas (xilofones, metalofones). Sequência: exploração sonora → improvisação → criação coletiva.`,

  suzuki: `Método Suzuki: Educação do talento por imitação e repetição. Ouvir primeiro, tocar depois.
    Envolvimento familiar. Repertório sequencial progressivo. Aulas individuais + grupo.
    Foco em um instrumento principal com repertório graduado.`,

  kodaly: `Método Kodály: Canto como base universal. Desenvolvimento auditivo, solfejo, dó móvel,
    sinais de Curwen. Literacia musical a partir do repertório local/folclórico.
    Leitura e escrita musical progressiva.`,

  musical_futures: `Musical Futures: Aprendizagem informal. Repertório popular escolhido pelo aluno.
    Bandas colaborativas, tecnologia, professor como facilitador. Autoria criativa e produção.`,

  dalcroze: `Dalcroze/Euritmia: Corpo como instrumento primário. Movimento + música integrados.
    Internalização rítmica pela expressão física. Improvisação, inclusivo.`,

  gordon: `Gordon Music Learning Theory: Audiação (pensar música internamente).
    Aprendizagem sequencial, reconhecimento de padrões, improvisação antes da notação.`,

  waldorf: `Waldorf/Steiner: Educação integral e artística. Experiência antes da teoria.
    Instrumentos pentatônicos, movimento, integração interdisciplinar.`,

  berklee: `Berklee/Abordagem Contemporânea: Criatividade, autonomia, performance, gravação,
    composição, produção digital, empreendedorismo musical. Múltiplos estilos.`,

  lincoln: `Lincoln Center Education: Multiculturalismo, artes integradas, prática experimental,
    educação estética, projetos interdisciplinares, engajamento comunitário.`,
}

/**
 * Learning cycles for age-appropriate content
 */
export const LEARNING_CYCLES: Record<string, string> = {
  initial: `Ciclo Inicial (6-7 anos): Exploração sonora, corpo, jogos, ritmo.
    Percepção auditiva, coordenação, criatividade. Métodos: Orff, Dalcroze, Waldorf.`,

  fundamental: `Ciclo Fundamental (8-11 anos): Instrumentos, literacia, improvisação, grupos.
    Base técnica, leitura, composição. Métodos: Kodály, Suzuki, Gordon, Musical Futures.`,

  intermediate: `Ciclo Intermediário (12-14 anos): Bandas, performance, digital, autoria.
    Habilidades de conjunto, produção, liderança. Métodos: Berklee, Lincoln, PRESTO.`,

  advanced: `Ciclo Avançado (15+): Produção, empreendedorismo, especialização.
    Caminho profissional, independência, inovação. Métodos: Berklee, Digital, Mentoria.`,
}

/**
 * Map lesson themes/modules to relevant methodologies
 */
export function getMethodologyForLesson(lessonTitle: string, lessonNumber: number): string {
  const title = lessonTitle.toLowerCase()

  // Year 1 mapping by lesson number ranges
  if (lessonNumber <= 5) return METHODOLOGIES.orff
  if (lessonNumber <= 7) return METHODOLOGIES.kodaly
  if (lessonNumber <= 9) return METHODOLOGIES.suzuki
  if (lessonNumber <= 13) return METHODOLOGIES.gordon
  if (lessonNumber <= 16) return METHODOLOGIES.berklee
  if (lessonNumber <= 17) return METHODOLOGIES.dalcroze
  if (title.includes('japão') || title.includes('japone')) return METHODOLOGIES.waldorf
  if (title.includes('pop') || title.includes('tiktok')) return METHODOLOGIES.musical_futures
  if (title.includes('produção') || title.includes('digital')) return METHODOLOGIES.berklee
  if (title.includes('composição') || title.includes('arranjo')) return METHODOLOGIES.berklee

  // Year 2 mapping by block
  if (lessonNumber >= 30 && lessonNumber <= 35) return METHODOLOGIES.orff // Retomada
  if (lessonNumber >= 36 && lessonNumber <= 41) return METHODOLOGIES.suzuki // Aprofundamento
  if (lessonNumber >= 42 && lessonNumber <= 47) return METHODOLOGIES.berklee // Criação
  if (lessonNumber >= 48 && lessonNumber <= 53) return METHODOLOGIES.lincoln // Cultura
  if (lessonNumber >= 54 && lessonNumber <= 61) return METHODOLOGIES.berklee // Performance
  if (lessonNumber >= 62) return METHODOLOGIES.musical_futures // Show Final

  return METHODOLOGIES.orff // fallback
}

/**
 * Build full context string for a lesson
 */
export function buildLessonContext(lesson: {
  title: string
  lesson_number: number
  description?: string | null
  learning_objective?: string | null
  module_name?: string | null
}): string {
  const methodology = getMethodologyForLesson(lesson.title, lesson.lesson_number)

  return `
CONTEXTO DA AULA:
- Título: ${lesson.title}
- Aula nº: ${lesson.lesson_number}
- Módulo: ${lesson.module_name || 'Geral'}
${lesson.description ? `- Descrição: ${lesson.description}` : ''}
${lesson.learning_objective ? `- Objetivo: ${lesson.learning_objective}` : ''}

METODOLOGIA APLICÁVEL:
${methodology}

${ALPHA_PRINCIPLES}
`.trim()
}

/**
 * Build context for adaptive next-step generation
 */
export function buildStudentContext(student: {
  level: number
  total_points: number
  lessons_completed: number
  current_streak: number
  preferred_difficulty?: number
  preferred_style?: string
  strengths?: string[]
  areas_for_growth?: string[]
}): string {
  return `
PERFIL DO ALUNO:
- Nível: ${student.level}
- Pontos totais: ${student.total_points}
- Aulas concluídas: ${student.lessons_completed}
- Streak atual: ${student.current_streak} dias
- Dificuldade preferida: ${student.preferred_difficulty || 3}/5
- Estilo de aprendizagem: ${student.preferred_style || 'misto'}
${student.strengths?.length ? `- Pontos fortes: ${student.strengths.join(', ')}` : ''}
${student.areas_for_growth?.length ? `- Áreas de crescimento: ${student.areas_for_growth.join(', ')}` : ''}
`.trim()
}
