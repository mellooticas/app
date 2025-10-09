export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      // ============================================
      // GAMIFICAÇÃO
      // ============================================
      gamification_usuarios: {
        Row: {
          id: string
          usuario_id: string
          total_pontos: number
          nivel_atual: number
          nome_nivel: string
          cor_nivel: string
          data_criacao: string
          data_atualizacao: string
        }
        Insert: {
          id?: string
          usuario_id: string
          total_pontos?: number
          nivel_atual?: number
          nome_nivel?: string
          cor_nivel?: string
          data_criacao?: string
          data_atualizacao?: string
        }
        Update: {
          id?: string
          usuario_id?: string
          total_pontos?: number
          nivel_atual?: number
          nome_nivel?: string
          cor_nivel?: string
          data_criacao?: string
          data_atualizacao?: string
        }
      }
      gamification_pontos: {
        Row: {
          id: string
          usuario_id: string
          pontos: number
          fonte: string
          descricao: string | null
          metadata: Json
          data_conquista: string
        }
        Insert: {
          id?: string
          usuario_id: string
          pontos: number
          fonte: string
          descricao?: string | null
          metadata?: Json
          data_conquista?: string
        }
        Update: {
          id?: string
          usuario_id?: string
          pontos?: number
          fonte?: string
          descricao?: string | null
          metadata?: Json
          data_conquista?: string
        }
      }
      gamification_badges: {
        Row: {
          id: string
          usuario_id: string
          tipo_badge: string
          nome_badge: string
          descricao: string | null
          icone: string | null
          cor: string | null
          metadata: Json
          data_conquista: string
        }
        Insert: {
          id?: string
          usuario_id: string
          tipo_badge: string
          nome_badge: string
          descricao?: string | null
          icone?: string | null
          cor?: string | null
          metadata?: Json
          data_conquista?: string
        }
        Update: {
          id?: string
          usuario_id?: string
          tipo_badge?: string
          nome_badge?: string
          descricao?: string | null
          icone?: string | null
          cor?: string | null
          metadata?: Json
          data_conquista?: string
        }
      }
      gamification_conquistas: {
        Row: {
          id: string
          usuario_id: string
          tipo_conquista: string
          nome_conquista: string
          descricao: string | null
          valor_conquista: number | null
          metadata: Json
          data_conquista: string
        }
        Insert: {
          id?: string
          usuario_id: string
          tipo_conquista: string
          nome_conquista: string
          descricao?: string | null
          valor_conquista?: number | null
          metadata?: Json
          data_conquista?: string
        }
        Update: {
          id?: string
          usuario_id?: string
          tipo_conquista?: string
          nome_conquista?: string
          descricao?: string | null
          valor_conquista?: number | null
          metadata?: Json
          data_conquista?: string
        }
      }
      // ============================================
      // PORTFOLIO
      // ============================================
      portfolios: {
        Row: {
          id: string
          user_id: string
          titulo: string
          descricao: string | null
          tipo: 'pessoal' | 'projeto' | 'metodologia' | 'competencia'
          status: 'ativo' | 'finalizado' | 'arquivado'
          visibilidade: 'privado' | 'turma' | 'publico'
          data_inicio: string | null
          data_fim: string | null
          metodologia_id: string | null
          competencia_id: string | null
          tags: string[] | null
          objetivos: string[] | null
          reflexoes_iniciais: string | null
          reflexoes_finais: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          user_id: string
          titulo: string
          descricao?: string | null
          tipo?: 'pessoal' | 'projeto' | 'metodologia' | 'competencia'
          status?: 'ativo' | 'finalizado' | 'arquivado'
          visibilidade?: 'privado' | 'turma' | 'publico'
          data_inicio?: string | null
          data_fim?: string | null
          metodologia_id?: string | null
          competencia_id?: string | null
          tags?: string[] | null
          objetivos?: string[] | null
          reflexoes_iniciais?: string | null
          reflexoes_finais?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          user_id?: string
          titulo?: string
          descricao?: string | null
          tipo?: 'pessoal' | 'projeto' | 'metodologia' | 'competencia'
          status?: 'ativo' | 'finalizado' | 'arquivado'
          visibilidade?: 'privado' | 'turma' | 'publico'
          data_inicio?: string | null
          data_fim?: string | null
          metodologia_id?: string | null
          competencia_id?: string | null
          tags?: string[] | null
          objetivos?: string[] | null
          reflexoes_iniciais?: string | null
          reflexoes_finais?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      portfolio_evidencias: {
        Row: {
          id: string
          portfolio_id: string
          titulo: string
          descricao: string | null
          tipo_evidencia: 'video' | 'audio' | 'foto' | 'texto' | 'arquivo' | 'link' | 'reflexao'
          arquivo_url: string | null
          arquivo_tipo: string | null
          arquivo_tamanho: number | null
          conteudo_texto: string | null
          link_externo: string | null
          metadata: Json | null
          ordem: number
          data_criacao: string
          data_evento: string | null
          aprovado: boolean
          aprovado_por: string | null
          data_aprovacao: string | null
          feedback_professor: string | null
          autoavaliacao: Json | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          portfolio_id: string
          titulo: string
          descricao?: string | null
          tipo_evidencia: 'video' | 'audio' | 'foto' | 'texto' | 'arquivo' | 'link' | 'reflexao'
          arquivo_url?: string | null
          arquivo_tipo?: string | null
          arquivo_tamanho?: number | null
          conteudo_texto?: string | null
          link_externo?: string | null
          metadata?: Json | null
          ordem?: number
          data_criacao?: string
          data_evento?: string | null
          aprovado?: boolean
          aprovado_por?: string | null
          data_aprovacao?: string | null
          feedback_professor?: string | null
          autoavaliacao?: Json | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          portfolio_id?: string
          titulo?: string
          descricao?: string | null
          tipo_evidencia?: 'video' | 'audio' | 'foto' | 'texto' | 'arquivo' | 'link' | 'reflexao'
          arquivo_url?: string | null
          arquivo_tipo?: string | null
          arquivo_tamanho?: number | null
          conteudo_texto?: string | null
          link_externo?: string | null
          metadata?: Json | null
          ordem?: number
          data_criacao?: string
          data_evento?: string | null
          aprovado?: boolean
          aprovado_por?: string | null
          data_aprovacao?: string | null
          feedback_professor?: string | null
          autoavaliacao?: Json | null
          created_at?: string
          updated_at?: string
        }
      }
      // ============================================
      // ALPHA SYSTEM (DESAFIOS)
      // ============================================
      alpha_metodologias: {
        Row: {
          id: string
          codigo: string
          nome: string
          nome_original: string | null
          criador: string | null
          pais_origem: string | null
          periodo: string | null
          descricao_curta: string
          descricao_completa: string
          principios_fundamentais: string[]
          filosofia: string
          publico_alvo: string
          instrumentos_principais: string[] | null
          metodologia_ensino: string
          pontos_fortes: string[]
          limitacoes: string[] | null
          aplicacao_brasil: string
          nivel_dificuldade: number
          idade_minima: number | null
          idade_maxima: number | null
          duracao_tipica_meses: number | null
          recursos_necessarios: string[] | null
          cor_tema: string
          icone: string
          ativo: boolean
          ordem_apresentacao: number | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          codigo: string
          nome: string
          nome_original?: string | null
          criador?: string | null
          pais_origem?: string | null
          periodo?: string | null
          descricao_curta: string
          descricao_completa: string
          principios_fundamentais: string[]
          filosofia: string
          publico_alvo: string
          instrumentos_principais?: string[] | null
          metodologia_ensino: string
          pontos_fortes: string[]
          limitacoes?: string[] | null
          aplicacao_brasil: string
          nivel_dificuldade: number
          idade_minima?: number | null
          idade_maxima?: number | null
          duracao_tipica_meses?: number | null
          recursos_necessarios?: string[] | null
          cor_tema: string
          icone: string
          ativo?: boolean
          ordem_apresentacao?: number | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          codigo?: string
          nome?: string
          nome_original?: string | null
          criador?: string | null
          pais_origem?: string | null
          periodo?: string | null
          descricao_curta?: string
          descricao_completa?: string
          principios_fundamentais?: string[]
          filosofia?: string
          publico_alvo?: string
          instrumentos_principais?: string[] | null
          metodologia_ensino?: string
          pontos_fortes?: string[]
          limitacoes?: string[] | null
          aplicacao_brasil?: string
          nivel_dificuldade?: number
          idade_minima?: number | null
          idade_maxima?: number | null
          duracao_tipica_meses?: number | null
          recursos_necessarios?: string[] | null
          cor_tema?: string
          icone?: string
          ativo?: boolean
          ordem_apresentacao?: number | null
          created_at?: string
          updated_at?: string
        }
      }
      alpha_desafios: {
        Row: {
          id: string
          metodologia_id: string
          competencia_id: string | null
          titulo: string
          descricao: string
          objetivo: string
          instrucoes: string
          tempo_estimado_minutos: number | null
          dificuldade: number
          tipo_evidencia: string
          criterios_avaliacao: Json
          pontos_base: number
          pontos_bonus: number
          materiais_necessarios: string[] | null
          tags: string[] | null
          ativo: boolean
          ordem: number | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          metodologia_id: string
          competencia_id?: string | null
          titulo: string
          descricao: string
          objetivo: string
          instrucoes: string
          tempo_estimado_minutos?: number | null
          dificuldade: number
          tipo_evidencia: string
          criterios_avaliacao: Json
          pontos_base?: number
          pontos_bonus?: number
          materiais_necessarios?: string[] | null
          tags?: string[] | null
          ativo?: boolean
          ordem?: number | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          metodologia_id?: string
          competencia_id?: string | null
          titulo?: string
          descricao?: string
          objetivo?: string
          instrucoes?: string
          tempo_estimado_minutos?: number | null
          dificuldade?: number
          tipo_evidencia?: string
          criterios_avaliacao?: Json
          pontos_base?: number
          pontos_bonus?: number
          materiais_necessarios?: string[] | null
          tags?: string[] | null
          ativo?: boolean
          ordem?: number | null
          created_at?: string
          updated_at?: string
        }
      }
      alpha_submissoes: {
        Row: {
          id: string
          desafio_id: string
          estudante_id: string
          titulo: string | null
          descricao: string | null
          url_evidencia: string | null
          tipo_arquivo: string | null
          tamanho_arquivo: number | null
          status: 'pendente' | 'avaliado' | 'aprovado' | 'rejeitado'
          nota: number | null
          feedback_professor: string | null
          pontos_obtidos: number
          tempo_execucao_minutos: number | null
          data_submissao: string
          data_avaliacao: string | null
          avaliador_id: string | null
          metadata: Json | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          desafio_id: string
          estudante_id: string
          titulo?: string | null
          descricao?: string | null
          url_evidencia?: string | null
          tipo_arquivo?: string | null
          tamanho_arquivo?: number | null
          status?: 'pendente' | 'avaliado' | 'aprovado' | 'rejeitado'
          nota?: number | null
          feedback_professor?: string | null
          pontos_obtidos?: number
          tempo_execucao_minutos?: number | null
          data_submissao?: string
          data_avaliacao?: string | null
          avaliador_id?: string | null
          metadata?: Json | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          desafio_id?: string
          estudante_id?: string
          titulo?: string | null
          descricao?: string | null
          url_evidencia?: string | null
          tipo_arquivo?: string | null
          tamanho_arquivo?: number | null
          status?: 'pendente' | 'avaliado' | 'aprovado' | 'rejeitado'
          nota?: number | null
          feedback_professor?: string | null
          pontos_obtidos?: number
          tempo_execucao_minutos?: number | null
          data_submissao?: string
          data_avaliacao?: string | null
          avaliador_id?: string | null
          metadata?: Json | null
          created_at?: string
          updated_at?: string
        }
      }
      // ============================================
      // SISTEMA ESCOLAR (TURMAS & AULAS)
      // ============================================
      turmas: {
        Row: {
          id: string
          nome: string
          descricao: string | null
          professor_id: string
          ano_letivo: number
          semestre: number | null
          nivel: string | null
          data_inicio: string
          data_fim: string | null
          dias_semana: Json | null
          horario_inicio: string | null
          horario_fim: string | null
          vagas_totais: number
          vagas_ocupadas: number
          ativa: boolean
          criado_em: string
          atualizado_em: string
        }
        Insert: {
          id?: string
          nome: string
          descricao?: string | null
          professor_id: string
          ano_letivo: number
          semestre?: number | null
          nivel?: string | null
          data_inicio: string
          data_fim?: string | null
          dias_semana?: Json | null
          horario_inicio?: string | null
          horario_fim?: string | null
          vagas_totais?: number
          vagas_ocupadas?: number
          ativa?: boolean
          criado_em?: string
          atualizado_em?: string
        }
        Update: {
          id?: string
          nome?: string
          descricao?: string | null
          professor_id?: string
          ano_letivo?: number
          semestre?: number | null
          nivel?: string | null
          data_inicio?: string
          data_fim?: string | null
          dias_semana?: Json | null
          horario_inicio?: string | null
          horario_fim?: string | null
          vagas_totais?: number
          vagas_ocupadas?: number
          ativa?: boolean
          criado_em?: string
          atualizado_em?: string
        }
      }
      matriculas: {
        Row: {
          id: string
          aluno_id: string
          turma_id: string
          status: 'ativa' | 'trancada' | 'cancelada' | 'concluida'
          data_matricula: string
          data_conclusao: string | null
          data_cancelamento: string | null
          motivo_cancelamento: string | null
        }
        Insert: {
          id?: string
          aluno_id: string
          turma_id: string
          status?: 'ativa' | 'trancada' | 'cancelada' | 'concluida'
          data_matricula?: string
          data_conclusao?: string | null
          data_cancelamento?: string | null
          motivo_cancelamento?: string | null
        }
        Update: {
          id?: string
          aluno_id?: string
          turma_id?: string
          status?: 'ativa' | 'trancada' | 'cancelada' | 'concluida'
          data_matricula?: string
          data_conclusao?: string | null
          data_cancelamento?: string | null
          motivo_cancelamento?: string | null
        }
      }
      aulas: {
        Row: {
          id: string
          turma_id: string | null
          responsavel_id: string
          titulo: string
          descricao: string | null
          modulo: string | null
          topico: string | null
          objetivos: Json | null
          conteudo_programatico: string | null
          data_aula: string
          horario_inicio: string
          horario_fim: string
          duracao_minutos: number | null
          status: 'planejada' | 'em_andamento' | 'concluida' | 'cancelada'
          materiais_necessarios: Json | null
          recursos_digitais: Json | null
          observacoes: string | null
          observacoes_pos_aula: string | null
          criado_em: string
          atualizado_em: string
        }
        Insert: {
          id?: string
          turma_id?: string | null
          responsavel_id: string
          titulo: string
          descricao?: string | null
          modulo?: string | null
          topico?: string | null
          objetivos?: Json | null
          conteudo_programatico?: string | null
          data_aula: string
          horario_inicio: string
          horario_fim: string
          duracao_minutos?: number | null
          status?: 'planejada' | 'em_andamento' | 'concluida' | 'cancelada'
          materiais_necessarios?: Json | null
          recursos_digitais?: Json | null
          observacoes?: string | null
          observacoes_pos_aula?: string | null
          criado_em?: string
          atualizado_em?: string
        }
        Update: {
          id?: string
          turma_id?: string | null
          responsavel_id?: string
          titulo?: string
          descricao?: string | null
          modulo?: string | null
          topico?: string | null
          objetivos?: Json | null
          conteudo_programatico?: string | null
          data_aula?: string
          horario_inicio?: string
          horario_fim?: string
          duracao_minutos?: number | null
          status?: 'planejada' | 'em_andamento' | 'concluida' | 'cancelada'
          materiais_necessarios?: Json | null
          recursos_digitais?: Json | null
          observacoes?: string | null
          observacoes_pos_aula?: string | null
          criado_em?: string
          atualizado_em?: string
        }
      }
      presencas: {
        Row: {
          id: string
          matricula_id: string
          aula_id: string | null
          presente: boolean
          justificado: boolean
          justificativa: string | null
          horario_entrada: string | null
          horario_saida: string | null
          observacoes: string | null
          nivel_participacao: 'baixa' | 'media' | 'alta' | null
          registrado_em: string
          registrado_por: string | null
        }
        Insert: {
          id?: string
          matricula_id: string
          aula_id?: string | null
          presente?: boolean
          justificado?: boolean
          justificativa?: string | null
          horario_entrada?: string | null
          horario_saida?: string | null
          observacoes?: string | null
          nivel_participacao?: 'baixa' | 'media' | 'alta' | null
          registrado_em?: string
          registrado_por?: string | null
        }
        Update: {
          id?: string
          matricula_id?: string
          aula_id?: string | null
          presente?: boolean
          justificado?: boolean
          justificativa?: string | null
          horario_entrada?: string | null
          horario_saida?: string | null
          observacoes?: string | null
          nivel_participacao?: 'baixa' | 'media' | 'alta' | null
          registrado_em?: string
          registrado_por?: string | null
        }
      }
      profiles: {
        Row: {
          id: string
          tipo_usuario: 'aluno' | 'professor' | 'admin' | 'pastor'
          full_name: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id: string
          tipo_usuario: 'aluno' | 'professor' | 'admin' | 'pastor'
          full_name?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          tipo_usuario?: 'aluno' | 'professor' | 'admin' | 'pastor'
          full_name?: string | null
          created_at?: string
          updated_at?: string
        }
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
  }
}
