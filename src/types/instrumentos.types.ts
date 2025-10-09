/**
 * 🎵 TIPOS COMPLETOS PARA INSTRUMENTOS
 * 
 * Baseado no schema REAL do Supabase com dados reais
 */

// ============================================
// TABELA PRINCIPAL: instrumentos
// ============================================

export type Instrumento = {
  id: string // uuid
  nome: string
  categoria: string | null // 'cordas', 'sopro', 'percussao', 'teclado'
  descricao: string | null
  imagem_url: string | null
  ativo: boolean | null
  ordem_exibicao: number | null
  criado_em: string | null
  historia: string | null
  origem: string | null
  familia_instrumental: string | null
  material_principal: string | null
  tecnica_producao_som: string | null
  dificuldade_aprendizado: string | null // 'iniciante', 'intermediario', 'avancado'
  anatomia_partes: Record<string, unknown> | null // jsonb
  curiosidades: unknown[] | null // jsonb array (mas tem tabela separada também!)
}

// ============================================
// instrumento_curiosidades
// ============================================

export type Curiosidade = {
  id: string
  instrumento_id: string
  titulo: string
  conteudo: string
  categoria: string | null // 'cultural', 'historia', 'ciencia'
  imagem_url: string | null
  video_url: string | null
  fonte: string | null
  created_at: string | null
}

// ============================================
// instrumento_midias
// ============================================

export type Midia = {
  id: string
  instrumento_id: string
  tipo: string // 'imagem', 'video', 'audio'
  titulo: string
  descricao: string | null
  url: string | null
  origem: string | null
  arquivo_local: string | null
  tamanho_bytes: number | null
  mime_type: string | null
  categoria: string | null // 'historia', 'demonstracao', 'tecnica'
  nivel: string | null
  duracao_segundos: number | null
  tags: string[] | null // jsonb
  visualizacoes: number | null
  ordem_exibicao: number | null
  ativo: boolean | null
  created_at: string | null
}

// ============================================
// instrumento_sons
// ============================================

export type Som = {
  id: string
  instrumento_id: string
  nota_musical: string | null // 'Mi', 'Lá', 'Ré', etc.
  tecnica: string | null // 'corda solta', 'pizzicato', etc.
  dinamica: string | null // 'mf', 'f', 'p'
  arquivo_audio: string
  waveform_data: unknown | null // jsonb
  bpm: number | null
  tonalidade: string | null // 'E', 'A', 'D'
  artista_performer: string | null
  created_at: string | null
  variacoes?: SomVariacao[] // Relação com sons_variacoes
}

// ============================================
// instrumento_sons_variacoes
// ============================================

export type SomVariacao = {
  id: string
  som_id: string
  arquivo_audio: string
  artista_performer: string | null
  qualidade_gravacao: string | null
  instrumento_usado: string | null
  local_gravacao: string | null
  ano_gravacao: number | null
  duracao_segundos: number | null
  created_at: string | null
}

// ============================================
// instrumento_tecnicas
// ============================================

export type Tecnica = {
  id: string
  instrumento_id: string
  nome: string
  descricao: string | null
  nivel: string | null // 'iniciante', 'intermediario', 'avancado'
  tipo_tecnica: string | null // 'postura', 'afinacao', 'execucao'
  grupo_tecnico: string | null // 'Fundamentos Básicos', 'Técnicas Avançadas'
  tempo_pratica_recomendado: number | null // minutos
  video_tutorial: string | null
  audio_exemplo: string | null
  partitura_url: string | null
  pre_requisitos: string | null
  ordem_aprendizado: number | null
  created_at: string | null
}

// ============================================
// instrumento_performances
// ============================================

export type Performance = {
  id: string
  instrumento_id: string
  titulo: string
  artista: string | null
  compositor: string | null
  ano_performance: number | null
  video_url: string | null
  audio_url: string | null
  genero_musical: string | null // 'Clássico', 'Choro/MPB', 'Jazz'
  dificuldade_execucao: string | null // 'avancado', 'intermediario'
  partitura_url: string | null
  descricao_tecnica: string | null
  visualizacoes: number | null
  created_at: string | null
}

// ============================================
// instrumento_quiz
// ============================================

export type Quiz = {
  id: string
  instrumento_id: string
  pergunta: string
  opcoes: string // JSON string com array de opções
  resposta_correta: string | null
  respostas_corretas: string[] | null // jsonb
  tipo_pergunta: string | null // 'multipla_escolha', 'verdadeiro_falso'
  arquivo_audio: string | null
  imagem_url: string | null
  tempo_limite_segundos: number | null
  explicacao: string | null
  dificuldade: string | null // 'facil', 'medio', 'dificil'
  categoria: string | null // 'historia', 'tecnica', 'teoria'
  ativo: boolean | null
  created_at: string | null
}

// ============================================
// instrumentos_relacionados
// ============================================

export type InstrumentoRelacionado = {
  id: string
  instrumento_id: string
  relacionado_id: string
  tipo_relacao: string | null // 'mesma_familia', 'som_similar', 'complementar'
  descricao_relacao: string | null
  similaridade_score: number | null
  created_at: string | null
  // Join com instrumentos
  relacionado?: {
    id: string
    nome: string
    categoria: string | null
    descricao: string | null
    imagem_url: string | null
  }
}

// ============================================
// instrumentos_fisicos (estoque da escola)
// ============================================

export type InstrumentoFisico = {
  id: string
  instrumento_id: string
  codigo_patrimonio: string | null
  numero_serie: string | null
  marca: string | null
  modelo: string | null
  valor_aquisicao: number | null
  data_aquisicao: string | null
  proprietario: string | null // 'Escola', 'igreja'
  estado: string | null // 'bom', 'regular', 'precisa_reparo'
  localizacao: string | null // 'Sala de Música - Armário A'
  disponivel: boolean | null
  observacoes: string | null
  created_at: string | null
  updated_at: string | null
}

// ============================================
// TIPO AGREGADO: InstrumentoCompleto
// ============================================

export type InstrumentoCompleto = Instrumento & {
  curiosidades: Curiosidade[]
  midias: Midia[]
  sons: Som[]
  tecnicas: Tecnica[]
  performances: Performance[]
  quiz: Quiz[]
  relacionados: InstrumentoRelacionado[]
  fisicos: InstrumentoFisico[]
  
  // Estatísticas calculadas
  stats?: {
    total_curiosidades: number
    total_midias: number
    total_sons: number
    total_tecnicas: number
    total_performances: number
    total_quiz: number
    total_relacionados: number
    total_fisicos_disponiveis: number
  }
}
