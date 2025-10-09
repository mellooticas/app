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
      // CORE - Perfis e Usuários
      // ============================================
      profiles: {
        Row: {
          id: string
          email: string | null
          full_name: string | null
          nome: string | null
          dob: string | null
          instrument: string | null
          voted_logo: string | null
          has_voted: boolean | null
          avatar_url: string | null
          church_name: string | null
          user_level: 'beginner' | 'intermediate' | 'advanced' | null
          total_points: number | null
          bio: string | null
          phone: string | null
          city: string | null
          state: string | null
          joined_at: string | null
          last_active: string | null
          current_streak: number | null
          best_streak: number | null
          lessons_completed: number | null
          modules_completed: number | null
          theme_preference: string | null
          notification_enabled: boolean | null
          sound_enabled: boolean | null
          tipo_usuario: 'aluno' | 'professor' | 'pastor' | 'admin' | null
        }
        Insert: {
          id: string
          email?: string | null
          full_name?: string | null
          nome?: string | null
          dob?: string | null
          instrument?: string | null
          voted_logo?: string | null
          has_voted?: boolean | null
          avatar_url?: string | null
          church_name?: string | null
          user_level?: 'beginner' | 'intermediate' | 'advanced' | null
          total_points?: number | null
          bio?: string | null
          phone?: string | null
          city?: string | null
          state?: string | null
          joined_at?: string | null
          last_active?: string | null
          current_streak?: number | null
          best_streak?: number | null
          lessons_completed?: number | null
          modules_completed?: number | null
          theme_preference?: string | null
          notification_enabled?: boolean | null
          sound_enabled?: boolean | null
          tipo_usuario?: 'aluno' | 'professor' | 'pastor' | 'admin' | null
        }
        Update: {
          id?: string
          email?: string | null
          full_name?: string | null
          nome?: string | null
          dob?: string | null
          instrument?: string | null
          voted_logo?: string | null
          has_voted?: boolean | null
          avatar_url?: string | null
          church_name?: string | null
          user_level?: 'beginner' | 'intermediate' | 'advanced' | null
          total_points?: number | null
          bio?: string | null
          phone?: string | null
          city?: string | null
          state?: string | null
          joined_at?: string | null
          last_active?: string | null
          current_streak?: number | null
          best_streak?: number | null
          lessons_completed?: number | null
          modules_completed?: number | null
          theme_preference?: string | null
          notification_enabled?: boolean | null
          sound_enabled?: boolean | null
          tipo_usuario?: 'aluno' | 'professor' | 'pastor' | 'admin' | null
        }
      }

      alunos: {
        Row: {
          id: string
          user_id: string
          data_nascimento: string | null
          telefone: string | null
          endereco: string | null
          responsavel: string | null
          created_at: string
        }
        Insert: {
          id?: string
          user_id: string
          data_nascimento?: string | null
          telefone?: string | null
          endereco?: string | null
          responsavel?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          user_id?: string
          data_nascimento?: string | null
          telefone?: string | null
          endereco?: string | null
          responsavel?: string | null
          created_at?: string
        }
      }
      professores: {
        Row: {
          id: string
          user_id: string
          especialidade: string | null
          created_at: string
        }
        Insert: {
          id?: string
          user_id: string
          especialidade?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          user_id?: string
          especialidade?: string | null
          created_at?: string
        }
      }
      admins: {
        Row: {
          id: string
          user_id: string
          nivel_acesso: string
          created_at: string
        }
        Insert: {
          id?: string
          user_id: string
          nivel_acesso: string
          created_at?: string
        }
        Update: {
          id?: string
          user_id?: string
          nivel_acesso?: string
          created_at?: string
        }
      }
      
      // ============================================
      // GAMIFICAÇÃO
      // ============================================
      achievements: {
        Row: {
          id: string
          nome: string
          descricao: string
          icone: string | null
          categoria: string
          pontos_recompensa: number
          raridade: 'comum' | 'raro' | 'epico' | 'lendario'
          visivel: boolean
          created_at: string
        }
        Insert: {
          id?: string
          nome: string
          descricao: string
          icone?: string | null
          categoria: string
          pontos_recompensa?: number
          raridade?: 'comum' | 'raro' | 'epico' | 'lendario'
          visivel?: boolean
          created_at?: string
        }
        Update: {
          id?: string
          nome?: string
          descricao?: string
          icone?: string | null
          categoria?: string
          pontos_recompensa?: number
          raridade?: 'comum' | 'raro' | 'epico' | 'lendario'
          visivel?: boolean
          created_at?: string
        }
      }
      user_achievements: {
        Row: {
          id: string
          user_id: string
          achievement_id: string
          earned_at: string
          notificado: boolean
        }
        Insert: {
          id?: string
          user_id: string
          achievement_id: string
          earned_at?: string
          notificado?: boolean
        }
        Update: {
          id?: string
          user_id?: string
          achievement_id?: string
          earned_at?: string
          notificado?: boolean
        }
      }
      achievements_progress: {
        Row: {
          id: string
          user_id: string
          achievement_id: string
          progresso_atual: number
          progresso_necessario: number
          porcentagem_conclusao: number
          iniciado_em: string
          atualizado_em: string
        }
        Insert: {
          id?: string
          user_id: string
          achievement_id: string
          progresso_atual?: number
          progresso_necessario: number
          porcentagem_conclusao?: number
          iniciado_em?: string
          atualizado_em?: string
        }
        Update: {
          id?: string
          user_id?: string
          achievement_id?: string
          progresso_atual?: number
          progresso_necessario?: number
          porcentagem_conclusao?: number
          iniciado_em?: string
          atualizado_em?: string
        }
      }
      user_points_log: {
        Row: {
          id: string
          user_id: string
          pontos: number
          tipo_transacao: string
          descricao: string | null
          created_at: string
        }
        Insert: {
          id?: string
          user_id: string
          pontos: number
          tipo_transacao: string
          descricao?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          user_id?: string
          pontos?: number
          tipo_transacao?: string
          descricao?: string | null
          created_at?: string
        }
      }

      // ============================================
      // PORTFÓLIOS
      // ============================================
      portfolios: {
        Row: {
          id: string
          user_id: string
          titulo: string
          descricao: string | null
          tipo: string
          status: 'rascunho' | 'submetido' | 'em_avaliacao' | 'avaliado'
          nota_final: number | null
          feedback: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          user_id: string
          titulo: string
          descricao?: string | null
          tipo: string
          status?: 'rascunho' | 'submetido' | 'em_avaliacao' | 'avaliado'
          nota_final?: number | null
          feedback?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          user_id?: string
          titulo?: string
          descricao?: string | null
          tipo?: string
          status?: 'rascunho' | 'submetido' | 'em_avaliacao' | 'avaliado'
          nota_final?: number | null
          feedback?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      portfolio_evidencias: {
        Row: {
          id: string
          portfolio_id: string
          tipo: string
          titulo: string
          descricao: string | null
          arquivo_url: string | null
          created_at: string
        }
        Insert: {
          id?: string
          portfolio_id: string
          tipo: string
          titulo: string
          descricao?: string | null
          arquivo_url?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          portfolio_id?: string
          tipo?: string
          titulo?: string
          descricao?: string | null
          arquivo_url?: string | null
          created_at?: string
        }
      }

      // ============================================
      // ALPHA DESAFIOS
      // ============================================
      alpha_desafios: {
        Row: {
          id: string
          titulo: string
          descricao: string
          tipo: string
          nivel: 'facil' | 'medio' | 'dificil'
          pontos: number
          ativo: boolean
          created_at: string
        }
        Insert: {
          id?: string
          titulo: string
          descricao: string
          tipo: string
          nivel?: 'facil' | 'medio' | 'dificil'
          pontos?: number
          ativo?: boolean
          created_at?: string
        }
        Update: {
          id?: string
          titulo?: string
          descricao?: string
          tipo?: string
          nivel?: 'facil' | 'medio' | 'dificil'
          pontos?: number
          ativo?: boolean
          created_at?: string
        }
      }
      alpha_submissoes: {
        Row: {
          id: string
          user_id: string
          desafio_id: string
          resposta: Json
          status: 'pendente' | 'avaliada' | 'rejeitada'
          nota: number | null
          feedback: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          user_id: string
          desafio_id: string
          resposta: Json
          status?: 'pendente' | 'avaliada' | 'rejeitada'
          nota?: number | null
          feedback?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          user_id?: string
          desafio_id?: string
          resposta?: Json
          status?: 'pendente' | 'avaliada' | 'rejeitada'
          nota?: number | null
          feedback?: string | null
          created_at?: string
          updated_at?: string
        }
      }

      // ============================================
      // TURMAS E AULAS
      // ============================================
      turmas: {
        Row: {
          id: string
          nome: string
          descricao: string | null
          professor_id: string
          data_inicio: string
          data_fim: string | null
          ativo: boolean
          created_at: string
        }
        Insert: {
          id?: string
          nome: string
          descricao?: string | null
          professor_id: string
          data_inicio: string
          data_fim?: string | null
          ativo?: boolean
          created_at?: string
        }
        Update: {
          id?: string
          nome?: string
          descricao?: string | null
          professor_id?: string
          data_inicio?: string
          data_fim?: string | null
          ativo?: boolean
          created_at?: string
        }
      }
      matriculas: {
        Row: {
          id: string
          aluno_id: string
          turma_id: string
          status: 'ativa' | 'trancada' | 'cancelada' | 'concluida'
          data_matricula: string
          created_at: string
        }
        Insert: {
          id?: string
          aluno_id: string
          turma_id: string
          status?: 'ativa' | 'trancada' | 'cancelada' | 'concluida'
          data_matricula?: string
          created_at?: string
        }
        Update: {
          id?: string
          aluno_id?: string
          turma_id?: string
          status?: 'ativa' | 'trancada' | 'cancelada' | 'concluida'
          data_matricula?: string
          created_at?: string
        }
      }
      aulas: {
        Row: {
          id: string
          turma_id: string
          responsavel_id: string
          titulo: string
          descricao: string | null
          data_aula: string
          status: 'planejada' | 'em_andamento' | 'concluida' | 'cancelada'
          created_at: string
        }
        Insert: {
          id?: string
          turma_id: string
          responsavel_id: string
          titulo: string
          descricao?: string | null
          data_aula: string
          status?: 'planejada' | 'em_andamento' | 'concluida' | 'cancelada'
          created_at?: string
        }
        Update: {
          id?: string
          turma_id?: string
          responsavel_id?: string
          titulo?: string
          descricao?: string | null
          data_aula?: string
          status?: 'planejada' | 'em_andamento' | 'concluida' | 'cancelada'
          created_at?: string
        }
      }
      presencas: {
        Row: {
          id: string
          matricula_id: string
          aula_id: string
          presente: boolean
          justificado: boolean
          created_at: string
        }
        Insert: {
          id?: string
          matricula_id: string
          aula_id: string
          presente?: boolean
          justificado?: boolean
          created_at?: string
        }
        Update: {
          id?: string
          matricula_id?: string
          aula_id?: string
          presente?: boolean
          justificado?: boolean
          created_at?: string
        }
      }

      // ============================================
      // INSTRUMENTOS
      // ============================================
      instrumentos: {
        Row: {
          id: string
          nome: string
          categoria: string
          descricao: string | null
          imagem_url: string | null
          ativo: boolean
          created_at: string
        }
        Insert: {
          id?: string
          nome: string
          categoria: string
          descricao?: string | null
          imagem_url?: string | null
          ativo?: boolean
          created_at?: string
        }
        Update: {
          id?: string
          nome?: string
          categoria?: string
          descricao?: string | null
          imagem_url?: string | null
          ativo?: boolean
          created_at?: string
        }
      }
      instrumentos_fisicos: {
        Row: {
          id: string
          instrumento_id: string
          codigo: string
          status: 'disponivel' | 'emprestado' | 'manutencao' | 'inativo'
          localizacao: string | null
          created_at: string
        }
        Insert: {
          id?: string
          instrumento_id: string
          codigo: string
          status?: 'disponivel' | 'emprestado' | 'manutencao' | 'inativo'
          localizacao?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          instrumento_id?: string
          codigo?: string
          status?: 'disponivel' | 'emprestado' | 'manutencao' | 'inativo'
          localizacao?: string | null
          created_at?: string
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
