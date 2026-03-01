// =============================================
// Lesson System Constants
// =============================================

// ── Year 1 (2025) Levels ──
export const LESSON_LEVELS = {
  iniciante: {
    numbers: [0, 1, 2, 3, 4, 5, 6],
    color: 'green',
    label: 'Iniciante',
    icon: 'Sprout',
    emoji: '🌱',
    description: 'Fundamentos ritmicos, consciencia corporal e iniciacao instrumental',
    methodologies: ['Orff Schulwerk', 'Suzuki', 'Kodaly', 'Dalcroze'],
    prerequisite: 0,
  },
  intermediario: {
    numbers: [7, 8, 9, 10, 11, 12, 21, 23],
    color: 'yellow',
    label: 'Intermediario',
    icon: 'Leaf',
    emoji: '🌿',
    description: 'Leitura musical, repertorio brasileiro, criatividade e tecnica',
    methodologies: ['Kodaly', 'Gordon', 'Experiencias Brasileiras', 'Musical Futures'],
    prerequisite: 5,
  },
  avancado: {
    numbers: [13, 14, 15, 16, 17, 18, 19, 20, 22, 24],
    color: 'red',
    label: 'Avancado',
    icon: 'TreePine',
    emoji: '🌳',
    description: 'Harmonia, composicao, tecnologia, improvisacao e performance',
    methodologies: ['Berklee', 'PRESTO', 'Waldorf', 'Gordon', 'Musical Futures'],
    prerequisite: 10,
  },
  showFinal: {
    numbers: [25, 26, 27, 28, 29],
    color: 'blue',
    label: 'Show Final',
    icon: 'Star',
    emoji: '🎭',
    description: 'Ensaios gerais, avaliacao criativa e apresentacao coletiva',
    methodologies: ['Principio Alpha'],
    prerequisite: 20,
  },
} as const

// ── Year 2 (2026) Levels ──
export const LESSON_LEVELS_YEAR2 = {
  retomada: {
    numbers: [30, 31, 32, 33, 34, 35],
    color: 'green',
    label: 'Retomada',
    icon: 'RefreshCw',
    emoji: '🔄',
    description: 'Revisao de fundamentos, leitura avancada e pratica de conjunto',
    methodologies: ['Orff Schulwerk', 'Kodaly', 'Dalcroze', 'Gordon'],
    prerequisite: 25,
  },
  aprofundamento: {
    numbers: [36, 37, 38, 39, 40, 41],
    color: 'yellow',
    label: 'Aprofundamento',
    icon: 'Target',
    emoji: '🎯',
    description: 'Tecnica instrumental avancada, escalas, acordes e leitura de cifras',
    methodologies: ['Suzuki', 'Berklee', 'Gordon', 'Kodaly'],
    prerequisite: 30,
  },
  criacao: {
    numbers: [42, 43, 44, 45, 46, 47],
    color: 'orange',
    label: 'Criacao',
    icon: 'Lightbulb',
    emoji: '💡',
    description: 'Composicao, arranjo, producao digital e gravacao',
    methodologies: ['Berklee', 'PRESTO', 'Musical Futures', 'Gordon'],
    prerequisite: 36,
  },
  cultura: {
    numbers: [48, 49, 50, 51, 52, 53],
    color: 'purple',
    label: 'Cultura',
    icon: 'Globe',
    emoji: '🌍',
    description: 'Diversidade musical: Africa, America Latina, Japao, jazz, blues, rock e pop',
    methodologies: ['Experiencias Brasileiras', 'Musical Futures', 'Berklee', 'Waldorf'],
    prerequisite: 42,
  },
  performance: {
    numbers: [54, 55, 56, 57, 58, 59],
    color: 'red',
    label: 'Performance',
    icon: 'Mic',
    emoji: '🎤',
    description: 'Tecnicas de palco, sonorizacao, improvisacao avancada e projetos musicais',
    methodologies: ['Berklee', 'PRESTO', 'Musical Futures', 'Principio Alpha'],
    prerequisite: 48,
  },
  projetos: {
    numbers: [60, 61, 62, 63, 64, 65],
    color: 'amber',
    label: 'Projetos',
    icon: 'Clapperboard',
    emoji: '🎬',
    description: 'Videoclipe, musica e comunidade, repertorio e ensaios dirigidos',
    methodologies: ['PRESTO', 'Musical Futures', 'Principio Alpha'],
    prerequisite: 54,
  },
  formatura: {
    numbers: [66, 67, 68, 69],
    color: 'blue',
    label: 'Formatura',
    icon: 'GraduationCap',
    emoji: '🎓',
    description: 'Ensaios gerais, passagem de som e Show Final / Formatura 2026',
    methodologies: ['Principio Alpha'],
    prerequisite: 60,
  },
} as const

export type LessonLevel = keyof typeof LESSON_LEVELS
export type LessonLevelYear2 = keyof typeof LESSON_LEVELS_YEAR2
export type AnyLessonLevel = LessonLevel | LessonLevelYear2

export function getLessonYear(number: number | null): 1 | 2 {
  if (number === null) return 1
  return number >= 30 ? 2 : 1
}

export function getLessonLevel(number: number | null): LessonLevel {
  if (number === null) return 'iniciante'
  if (number <= 6) return 'iniciante'
  if ((number >= 7 && number <= 12) || number === 21 || number === 23) return 'intermediario'
  if ((number >= 13 && number <= 20) || number === 22 || number === 24) return 'avancado'
  return 'showFinal'
}

export function getLessonLevelYear2(number: number | null): LessonLevelYear2 {
  if (number === null) return 'retomada'
  if (number <= 35) return 'retomada'
  if (number <= 41) return 'aprofundamento'
  if (number <= 47) return 'criacao'
  if (number <= 53) return 'cultura'
  if (number <= 59) return 'performance'
  if (number <= 65) return 'projetos'
  return 'formatura'
}

export function getAnyLessonLevel(number: number | null): AnyLessonLevel {
  if (number === null) return 'iniciante'
  if (number >= 30) return getLessonLevelYear2(number)
  return getLessonLevel(number)
}

export function getLessonLevelsForYear(year: 1 | 2) {
  return year === 1 ? LESSON_LEVELS : LESSON_LEVELS_YEAR2
}

export const STATUS_LABELS: Record<string, string> = {
  draft: 'Rascunho',
  scheduled: 'Agendada',
  in_progress: 'Em Andamento',
  completed: 'Concluida',
  cancelled: 'Cancelada',
}

export const STATUS_COLORS: Record<string, string> = {
  draft: 'bg-gray-100 text-gray-600',
  scheduled: 'bg-blue-100 text-blue-700',
  in_progress: 'bg-amber-100 text-amber-700',
  completed: 'bg-emerald-100 text-emerald-700',
  cancelled: 'bg-red-100 text-red-600',
}

export const LEVEL_COLORS: Record<string, { bg: string; text: string; border: string; gradient: string }> = {
  green: {
    bg: 'bg-green-50',
    text: 'text-green-700',
    border: 'border-green-200',
    gradient: 'from-green-500 to-emerald-600',
  },
  yellow: {
    bg: 'bg-yellow-50',
    text: 'text-yellow-700',
    border: 'border-yellow-200',
    gradient: 'from-yellow-500 to-amber-600',
  },
  red: {
    bg: 'bg-red-50',
    text: 'text-red-700',
    border: 'border-red-200',
    gradient: 'from-red-500 to-rose-600',
  },
  blue: {
    bg: 'bg-blue-50',
    text: 'text-blue-700',
    border: 'border-blue-200',
    gradient: 'from-blue-500 to-indigo-600',
  },
  orange: {
    bg: 'bg-orange-50',
    text: 'text-orange-700',
    border: 'border-orange-200',
    gradient: 'from-orange-500 to-amber-600',
  },
  purple: {
    bg: 'bg-purple-50',
    text: 'text-purple-700',
    border: 'border-purple-200',
    gradient: 'from-purple-500 to-violet-600',
  },
  amber: {
    bg: 'bg-amber-50',
    text: 'text-amber-700',
    border: 'border-amber-200',
    gradient: 'from-amber-500 to-yellow-600',
  },
}

export const ACTIVITY_TYPE_CONFIG: Record<string, { label: string; bg: string; text: string; border: string; icon: string }> = {
  abertura: {
    label: 'Abertura',
    bg: 'bg-blue-50',
    text: 'text-blue-700',
    border: 'border-blue-200',
    icon: 'Play',
  },
  principal: {
    label: 'Atividade Principal',
    bg: 'bg-green-50',
    text: 'text-green-700',
    border: 'border-green-200',
    icon: 'Music',
  },
  alpha: {
    label: 'Desafio Alpha',
    bg: 'bg-amber-50',
    text: 'text-amber-700',
    border: 'border-amber-200',
    icon: 'Zap',
  },
  final: {
    label: 'Encerramento',
    bg: 'bg-purple-50',
    text: 'text-purple-700',
    border: 'border-purple-200',
    icon: 'Flag',
  },
}

export const MATERIAL_TYPE_ICONS: Record<string, string> = {
  document: 'FileText',
  video: 'Video',
  audio: 'Music2',
  link: 'ExternalLink',
  sheet_music: 'FileMusic',
}

export const MATERIAL_TYPE_LABELS: Record<string, string> = {
  document: 'Documento',
  video: 'Video',
  audio: 'Audio',
  link: 'Link',
  sheet_music: 'Partitura',
}
