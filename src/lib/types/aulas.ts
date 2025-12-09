// Tipos e interfaces para o sistema de aulas - Método Alpha

export type StatusAula = 'a_fazer' | 'em_preparacao' | 'concluida' | 'cancelada';
export type FormatoAula = 'presencial' | 'online' | 'hibrido';
export type StatusProgresso = 'nao_iniciada' | 'em_andamento' | 'concluida';
export type TipoMaterial = 'pdf' | 'video' | 'partitura' | 'audio' | 'formulario' | 'slide' | 'link';

export interface Aula {
  id: string;
  numero: number; // 0-29 (progressão contínua)
  titulo: string;
  data_programada: string;
  objetivo_didatico: string;
  modulo?: string; // BLOCO 1-9
  metodologia_principal?: string;
  metodologias_secundarias?: string[];
  status: StatusAula;
  resumo_atividades?: string;
  desafio_alpha?: string;
  formato?: FormatoAula;
  duracao_minutos?: number;
  professor_responsavel_id?: string;
  created_at?: string;
  updated_at?: string;
}

export interface Material {
  id: string;
  aula_id: string;
  tipo: TipoMaterial;
  titulo: string;
  descricao?: string;
  url?: string;
  arquivo_path?: string;
  ordem: number;
  obrigatorio: boolean;
  visivel_antes_aula: boolean;
  created_at?: string;
}

export interface PreRequisito {
  id: string;
  aula_id: string;
  pre_requisito_aula_id: string;
  obrigatorio: boolean;
}

export interface ProgressoAula {
  id: string;
  aluno_id: string;
  aula_id: string;
  status: StatusProgresso;
  data_inicio?: string;
  data_conclusao?: string;
  porcentagem_completa: number;
  desafio_enviado: boolean;
  desafio_aprovado: boolean;
  nota_auto_avaliacao?: number;
  created_at?: string;
  updated_at?: string;
}

export interface Feedback {
  id: string;
  aula_id: string;
  professor_id: string;
  aluno_id?: string;
  texto: string;
  tipo: 'individual' | 'geral';
  data_feedback: string;
  created_at?: string;
}

export interface Registro {
  id: string;
  aula_id: string;
  tipo: 'foto' | 'video';
  titulo?: string;
  descricao?: string;
  url: string;
  data_registro: string;
  created_at?: string;
}

export interface Checklist {
  id: string;
  aula_id: string;
  descricao: string;
  tipo: 'pre_aula' | 'pos_aula';
  concluido: boolean;
  ordem: number;
  created_at?: string;
}

export interface AulaCompleta extends Aula {
  materiais?: Material[];
  pre_requisitos?: PreRequisito[];
  progresso?: ProgressoAula;
  feedbacks?: Feedback[];
  registros?: Registro[];
  checklist?: Checklist[];
}

// Filtros para listagem de aulas
export interface FiltrosAulas {
  status?: StatusAula;
  formato?: FormatoAula;
  modulo?: string;
  data_inicio?: string;
  data_fim?: string;
  search?: string;
}

// Estatísticas de progresso
export interface EstatisticasProgresso {
  totalAulas: number;
  concluidas: number;
  emAndamento: number;
  desafiosAprovados: number;
  proximaAula?: {
    numero: number;
    titulo: string;
    descricao_curta?: string;
  };
}

// Mapeamento de blocos pedagógicos (Método Alpha)
export const BLOCOS_PEDAGOGICOS = {
  'BLOCO 1': { nome: 'Fundação e Iniciação', aulas: [0, 1, 2, 3, 4, 5] },
  'BLOCO 2': { nome: 'Alfabetização Musical', aulas: [6, 7] },
  'BLOCO 3': { nome: 'Repertório Brasileiro', aulas: [8, 9] },
  'BLOCO 4': { nome: 'Consolidação I', aulas: [10] },
  'BLOCO 5': { nome: 'Técnica e Criatividade', aulas: [11, 12, 13, 14, 15] },
  'BLOCO 6': { nome: 'Tecnologia e Improvisação', aulas: [16, 17] },
  'BLOCO 7': { nome: 'Repertório Multicultural', aulas: [18, 19] },
  'BLOCO 8': { nome: 'Performance e Prática de Conjunto', aulas: [20, 21, 22, 23, 24] },
  'BLOCO 9': { nome: 'Preparação Final e Show', aulas: [25, 26, 27, 28, 29] },
} as const;

// Ícones por status
export const STATUS_CONFIG: Record<StatusAula, { label: string; color: string }> = {
  a_fazer: { label: 'A Fazer', color: 'gray' },
  em_preparacao: { label: 'Em Preparação', color: 'blue' },
  concluida: { label: 'Concluída', color: 'green' },
  cancelada: { label: 'Cancelada', color: 'red' },
};

// Ícones por tipo de material
export const TIPO_MATERIAL_CONFIG: Record<TipoMaterial, { label: string; icon: string }> = {
  pdf: { label: 'PDF', icon: 'FileText' },
  video: { label: 'Vídeo', icon: 'Video' },
  partitura: { label: 'Partitura', icon: 'Music' },
  audio: { label: 'Áudio', icon: 'Headphones' },
  formulario: { label: 'Formulário', icon: 'ClipboardList' },
  slide: { label: 'Slide', icon: 'Presentation' },
  link: { label: 'Link', icon: 'Link' },
};
