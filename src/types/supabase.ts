export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "12.2.12 (cd3cf9e)"
  }
  public: {
    Tables: {
      achievements: {
        Row: {
          badge_color: string | null
          badge_icon: string | null
          category: string | null
          created_at: string | null
          description: string | null
          id: string
          is_active: boolean | null
          name: string
          points_reward: number | null
          requirement_type: string | null
          requirement_value: number | null
        }
        Insert: {
          badge_color?: string | null
          badge_icon?: string | null
          category?: string | null
          created_at?: string | null
          description?: string | null
          id?: string
          is_active?: boolean | null
          name: string
          points_reward?: number | null
          requirement_type?: string | null
          requirement_value?: number | null
        }
        Update: {
          badge_color?: string | null
          badge_icon?: string | null
          category?: string | null
          created_at?: string | null
          description?: string | null
          id?: string
          is_active?: boolean | null
          name?: string
          points_reward?: number | null
          requirement_type?: string | null
          requirement_value?: number | null
        }
        Relationships: []
      }
      achievements_educacionais: {
        Row: {
          ativo: boolean | null
          categoria: string | null
          created_at: string | null
          descricao: string | null
          icone: string | null
          id: string
          meta_necessaria: number | null
          nome: string
          pontos_recompensa: number | null
          tipo_criterio: string | null
        }
        Insert: {
          ativo?: boolean | null
          categoria?: string | null
          created_at?: string | null
          descricao?: string | null
          icone?: string | null
          id?: string
          meta_necessaria?: number | null
          nome: string
          pontos_recompensa?: number | null
          tipo_criterio?: string | null
        }
        Update: {
          ativo?: boolean | null
          categoria?: string | null
          created_at?: string | null
          descricao?: string | null
          icone?: string | null
          id?: string
          meta_necessaria?: number | null
          nome?: string
          pontos_recompensa?: number | null
          tipo_criterio?: string | null
        }
        Relationships: []
      }
      achievements_progress: {
        Row: {
          achievement_id: string | null
          completed_at: string | null
          created_at: string | null
          current_progress: number | null
          id: string
          is_completed: boolean | null
          metadata: Json | null
          target_progress: number
          updated_at: string | null
          user_id: string | null
        }
        Insert: {
          achievement_id?: string | null
          completed_at?: string | null
          created_at?: string | null
          current_progress?: number | null
          id?: string
          is_completed?: boolean | null
          metadata?: Json | null
          target_progress: number
          updated_at?: string | null
          user_id?: string | null
        }
        Update: {
          achievement_id?: string | null
          completed_at?: string | null
          created_at?: string | null
          current_progress?: number | null
          id?: string
          is_completed?: boolean | null
          metadata?: Json | null
          target_progress?: number
          updated_at?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "achievements_progress_achievement_id_fkey"
            columns: ["achievement_id"]
            isOneToOne: false
            referencedRelation: "achievements"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "achievements_progress_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "achievements_progress_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "achievements_progress_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "achievements_progress_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "achievements_progress_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "achievements_progress_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      adaptacoes_espacos_alternativos: {
        Row: {
          adaptacoes_realizadas: Json | null
          contato_responsavel: Json | null
          created_at: string | null
          data_inicio: string | null
          desafios_especificos: string[] | null
          documentacao_processo: string[] | null
          endereco_localizacao: Json | null
          faixa_etaria_foco: string | null
          id: string
          impacto_comunitario: string | null
          limitacoes_estruturais: string[] | null
          metodologias_adaptadas: string[] | null
          nome_organizacao: string
          parcerias_estabelecidas: string[] | null
          publico_atendido: string | null
          recursos_disponiveis: Json | null
          replicabilidade_modelo: string | null
          resultados_observados: string | null
          solucoes_criativas: string[] | null
          status_projeto: string | null
          sustentabilidade_projeto: string | null
          tipo_organizacao: string | null
          updated_at: string | null
        }
        Insert: {
          adaptacoes_realizadas?: Json | null
          contato_responsavel?: Json | null
          created_at?: string | null
          data_inicio?: string | null
          desafios_especificos?: string[] | null
          documentacao_processo?: string[] | null
          endereco_localizacao?: Json | null
          faixa_etaria_foco?: string | null
          id?: string
          impacto_comunitario?: string | null
          limitacoes_estruturais?: string[] | null
          metodologias_adaptadas?: string[] | null
          nome_organizacao: string
          parcerias_estabelecidas?: string[] | null
          publico_atendido?: string | null
          recursos_disponiveis?: Json | null
          replicabilidade_modelo?: string | null
          resultados_observados?: string | null
          solucoes_criativas?: string[] | null
          status_projeto?: string | null
          sustentabilidade_projeto?: string | null
          tipo_organizacao?: string | null
          updated_at?: string | null
        }
        Update: {
          adaptacoes_realizadas?: Json | null
          contato_responsavel?: Json | null
          created_at?: string | null
          data_inicio?: string | null
          desafios_especificos?: string[] | null
          documentacao_processo?: string[] | null
          endereco_localizacao?: Json | null
          faixa_etaria_foco?: string | null
          id?: string
          impacto_comunitario?: string | null
          limitacoes_estruturais?: string[] | null
          metodologias_adaptadas?: string[] | null
          nome_organizacao?: string
          parcerias_estabelecidas?: string[] | null
          publico_atendido?: string | null
          recursos_disponiveis?: Json | null
          replicabilidade_modelo?: string | null
          resultados_observados?: string | null
          solucoes_criativas?: string[] | null
          status_projeto?: string | null
          sustentabilidade_projeto?: string | null
          tipo_organizacao?: string | null
          updated_at?: string | null
        }
        Relationships: []
      }
      admins: {
        Row: {
          ativo: boolean | null
          cargo: string | null
          criado_em: string | null
          departamento: string | null
          id: string
          nivel_acesso: string | null
          permissoes: Json | null
        }
        Insert: {
          ativo?: boolean | null
          cargo?: string | null
          criado_em?: string | null
          departamento?: string | null
          id: string
          nivel_acesso?: string | null
          permissoes?: Json | null
        }
        Update: {
          ativo?: boolean | null
          cargo?: string | null
          criado_em?: string | null
          departamento?: string | null
          id?: string
          nivel_acesso?: string | null
          permissoes?: Json | null
        }
        Relationships: [
          {
            foreignKeyName: "admins_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "admins_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "admins_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "admins_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "admins_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "admins_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      alpha_competencias: {
        Row: {
          ativo: boolean | null
          categoria: string | null
          codigo: string
          created_at: string | null
          descricao: string | null
          id: string
          metodologia_id: string | null
          nivel_complexidade: number | null
          nome: string
          ordem: number | null
          pre_requisitos: string[] | null
        }
        Insert: {
          ativo?: boolean | null
          categoria?: string | null
          codigo: string
          created_at?: string | null
          descricao?: string | null
          id?: string
          metodologia_id?: string | null
          nivel_complexidade?: number | null
          nome: string
          ordem?: number | null
          pre_requisitos?: string[] | null
        }
        Update: {
          ativo?: boolean | null
          categoria?: string | null
          codigo?: string
          created_at?: string | null
          descricao?: string | null
          id?: string
          metodologia_id?: string | null
          nivel_complexidade?: number | null
          nome?: string
          ordem?: number | null
          pre_requisitos?: string[] | null
        }
        Relationships: [
          {
            foreignKeyName: "alpha_competencias_metodologia_id_fkey"
            columns: ["metodologia_id"]
            isOneToOne: false
            referencedRelation: "alpha_metodologias"
            referencedColumns: ["id"]
          },
        ]
      }
      alpha_desafios: {
        Row: {
          ativo: boolean | null
          categoria: string | null
          codigo: string
          competencia_id: string | null
          created_at: string | null
          criterios_avaliacao: Json | null
          descricao: string
          dicas: string[] | null
          dificuldade: number | null
          id: string
          instrucoes: string
          metodologia_id: string | null
          objetivos: string[] | null
          ordem: number | null
          pontos_base: number | null
          recursos_necessarios: string[] | null
          tags: string[] | null
          tempo_estimado_minutos: number | null
          tipo_evidencia: string | null
          titulo: string
          updated_at: string | null
        }
        Insert: {
          ativo?: boolean | null
          categoria?: string | null
          codigo: string
          competencia_id?: string | null
          created_at?: string | null
          criterios_avaliacao?: Json | null
          descricao: string
          dicas?: string[] | null
          dificuldade?: number | null
          id?: string
          instrucoes: string
          metodologia_id?: string | null
          objetivos?: string[] | null
          ordem?: number | null
          pontos_base?: number | null
          recursos_necessarios?: string[] | null
          tags?: string[] | null
          tempo_estimado_minutos?: number | null
          tipo_evidencia?: string | null
          titulo: string
          updated_at?: string | null
        }
        Update: {
          ativo?: boolean | null
          categoria?: string | null
          codigo?: string
          competencia_id?: string | null
          created_at?: string | null
          criterios_avaliacao?: Json | null
          descricao?: string
          dicas?: string[] | null
          dificuldade?: number | null
          id?: string
          instrucoes?: string
          metodologia_id?: string | null
          objetivos?: string[] | null
          ordem?: number | null
          pontos_base?: number | null
          recursos_necessarios?: string[] | null
          tags?: string[] | null
          tempo_estimado_minutos?: number | null
          tipo_evidencia?: string | null
          titulo?: string
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "alpha_desafios_competencia_id_fkey"
            columns: ["competencia_id"]
            isOneToOne: false
            referencedRelation: "alpha_competencias"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "alpha_desafios_metodologia_id_fkey"
            columns: ["metodologia_id"]
            isOneToOne: false
            referencedRelation: "alpha_metodologias"
            referencedColumns: ["id"]
          },
        ]
      }
      alpha_metodologias: {
        Row: {
          aplicacao_brasil: string | null
          ativo: boolean | null
          codigo: string
          cor_tema: string | null
          created_at: string | null
          criador: string | null
          descricao_completa: string | null
          descricao_curta: string | null
          filosofia: string | null
          icone: string | null
          id: string
          idade_minima: number | null
          instrumentos_principais: string[] | null
          limitacoes: string[] | null
          metodologia_ensino: string | null
          nivel_dificuldade: number | null
          nome: string
          ordem_apresentacao: number | null
          pais_origem: string | null
          periodo: string | null
          pontos_fortes: string[] | null
          principios_fundamentais: string[] | null
          publico_alvo: string | null
          recursos_necessarios: string[] | null
          updated_at: string | null
        }
        Insert: {
          aplicacao_brasil?: string | null
          ativo?: boolean | null
          codigo: string
          cor_tema?: string | null
          created_at?: string | null
          criador?: string | null
          descricao_completa?: string | null
          descricao_curta?: string | null
          filosofia?: string | null
          icone?: string | null
          id?: string
          idade_minima?: number | null
          instrumentos_principais?: string[] | null
          limitacoes?: string[] | null
          metodologia_ensino?: string | null
          nivel_dificuldade?: number | null
          nome: string
          ordem_apresentacao?: number | null
          pais_origem?: string | null
          periodo?: string | null
          pontos_fortes?: string[] | null
          principios_fundamentais?: string[] | null
          publico_alvo?: string | null
          recursos_necessarios?: string[] | null
          updated_at?: string | null
        }
        Update: {
          aplicacao_brasil?: string | null
          ativo?: boolean | null
          codigo?: string
          cor_tema?: string | null
          created_at?: string | null
          criador?: string | null
          descricao_completa?: string | null
          descricao_curta?: string | null
          filosofia?: string | null
          icone?: string | null
          id?: string
          idade_minima?: number | null
          instrumentos_principais?: string[] | null
          limitacoes?: string[] | null
          metodologia_ensino?: string | null
          nivel_dificuldade?: number | null
          nome?: string
          ordem_apresentacao?: number | null
          pais_origem?: string | null
          periodo?: string | null
          pontos_fortes?: string[] | null
          principios_fundamentais?: string[] | null
          publico_alvo?: string | null
          recursos_necessarios?: string[] | null
          updated_at?: string | null
        }
        Relationships: []
      }
      alpha_progresso: {
        Row: {
          competencia_id: string | null
          created_at: string | null
          desafios_completados: number | null
          id: string
          metodologia_id: string | null
          nivel_atual: number | null
          pontos_acumulados: number | null
          progresso_percentual: number | null
          total_desafios: number | null
          ultima_atividade: string | null
          updated_at: string | null
          user_id: string | null
        }
        Insert: {
          competencia_id?: string | null
          created_at?: string | null
          desafios_completados?: number | null
          id?: string
          metodologia_id?: string | null
          nivel_atual?: number | null
          pontos_acumulados?: number | null
          progresso_percentual?: number | null
          total_desafios?: number | null
          ultima_atividade?: string | null
          updated_at?: string | null
          user_id?: string | null
        }
        Update: {
          competencia_id?: string | null
          created_at?: string | null
          desafios_completados?: number | null
          id?: string
          metodologia_id?: string | null
          nivel_atual?: number | null
          pontos_acumulados?: number | null
          progresso_percentual?: number | null
          total_desafios?: number | null
          ultima_atividade?: string | null
          updated_at?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "alpha_progresso_competencia_id_fkey"
            columns: ["competencia_id"]
            isOneToOne: false
            referencedRelation: "alpha_competencias"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "alpha_progresso_metodologia_id_fkey"
            columns: ["metodologia_id"]
            isOneToOne: false
            referencedRelation: "alpha_metodologias"
            referencedColumns: ["id"]
          },
        ]
      }
      alpha_submissoes: {
        Row: {
          auto_avaliacao: Json | null
          avaliacao_professor: Json | null
          created_at: string | null
          data_avaliacao: string | null
          data_submissao: string | null
          desafio_id: string | null
          descricao: string | null
          evidencia_tipo: string | null
          evidencia_url: string | null
          feedback_professor: string | null
          id: string
          pontos_obtidos: number | null
          status: string | null
          tempo_execucao_minutos: number | null
          titulo: string | null
          updated_at: string | null
          user_id: string | null
        }
        Insert: {
          auto_avaliacao?: Json | null
          avaliacao_professor?: Json | null
          created_at?: string | null
          data_avaliacao?: string | null
          data_submissao?: string | null
          desafio_id?: string | null
          descricao?: string | null
          evidencia_tipo?: string | null
          evidencia_url?: string | null
          feedback_professor?: string | null
          id?: string
          pontos_obtidos?: number | null
          status?: string | null
          tempo_execucao_minutos?: number | null
          titulo?: string | null
          updated_at?: string | null
          user_id?: string | null
        }
        Update: {
          auto_avaliacao?: Json | null
          avaliacao_professor?: Json | null
          created_at?: string | null
          data_avaliacao?: string | null
          data_submissao?: string | null
          desafio_id?: string | null
          descricao?: string | null
          evidencia_tipo?: string | null
          evidencia_url?: string | null
          feedback_professor?: string | null
          id?: string
          pontos_obtidos?: number | null
          status?: string | null
          tempo_execucao_minutos?: number | null
          titulo?: string | null
          updated_at?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "alpha_submissoes_desafio_id_fkey"
            columns: ["desafio_id"]
            isOneToOne: false
            referencedRelation: "alpha_desafios"
            referencedColumns: ["id"]
          },
        ]
      }
      alunos: {
        Row: {
          ativo: boolean | null
          criado_em: string | null
          data_ingresso: string | null
          id: string
          instrumento: string | null
          instrumento_id: string | null
          nivel: string | null
          turma: string | null
          turma_principal_id: string | null
        }
        Insert: {
          ativo?: boolean | null
          criado_em?: string | null
          data_ingresso?: string | null
          id: string
          instrumento?: string | null
          instrumento_id?: string | null
          nivel?: string | null
          turma?: string | null
          turma_principal_id?: string | null
        }
        Update: {
          ativo?: boolean | null
          criado_em?: string | null
          data_ingresso?: string | null
          id?: string
          instrumento?: string | null
          instrumento_id?: string | null
          nivel?: string | null
          turma?: string | null
          turma_principal_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "alunos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "alunos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "alunos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "alunos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "alunos_turma_principal_id_fkey"
            columns: ["turma_principal_id"]
            isOneToOne: false
            referencedRelation: "turmas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      audit_activities: {
        Row: {
          action: string
          component_name: string | null
          created_at: string | null
          details: Json | null
          hook_name: string | null
          id: string
          ip_address: unknown | null
          new_values: Json | null
          old_values: Json | null
          resource: string
          resource_id: string | null
          session_id: string | null
          severity: string | null
          user_agent: string | null
          user_id: string | null
        }
        Insert: {
          action: string
          component_name?: string | null
          created_at?: string | null
          details?: Json | null
          hook_name?: string | null
          id?: string
          ip_address?: unknown | null
          new_values?: Json | null
          old_values?: Json | null
          resource: string
          resource_id?: string | null
          session_id?: string | null
          severity?: string | null
          user_agent?: string | null
          user_id?: string | null
        }
        Update: {
          action?: string
          component_name?: string | null
          created_at?: string | null
          details?: Json | null
          hook_name?: string | null
          id?: string
          ip_address?: unknown | null
          new_values?: Json | null
          old_values?: Json | null
          resource?: string
          resource_id?: string | null
          session_id?: string | null
          severity?: string | null
          user_agent?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "audit_activities_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "audit_activities_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "audit_activities_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "audit_activities_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "audit_activities_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "audit_activities_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_atividades: {
        Row: {
          aula_id: string
          descricao: string | null
          id: string
          tipo: string | null
        }
        Insert: {
          aula_id: string
          descricao?: string | null
          id?: string
          tipo?: string | null
        }
        Update: {
          aula_id?: string
          descricao?: string | null
          id?: string
          tipo?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "aula_atividades_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_atividades_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_atividades_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_atividades_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_atividades_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_checklist: {
        Row: {
          aula_id: string | null
          feito: boolean | null
          id: string
          item: string | null
          tipo: string | null
        }
        Insert: {
          aula_id?: string | null
          feito?: boolean | null
          id?: string
          item?: string | null
          tipo?: string | null
        }
        Update: {
          aula_id?: string | null
          feito?: boolean | null
          id?: string
          item?: string | null
          tipo?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "aula_checklist_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_checklist_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_checklist_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_checklist_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_checklist_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_criterios_avaliacao: {
        Row: {
          aula_id: string
          criterio: string | null
          id: string
        }
        Insert: {
          aula_id: string
          criterio?: string | null
          id?: string
        }
        Update: {
          aula_id?: string
          criterio?: string | null
          id?: string
        }
        Relationships: [
          {
            foreignKeyName: "aula_criterios_avaliacao_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_criterios_avaliacao_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_criterios_avaliacao_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_criterios_avaliacao_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_criterios_avaliacao_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_desafio_alpha: {
        Row: {
          aula_id: string
          descricao: string | null
          id: string
        }
        Insert: {
          aula_id: string
          descricao?: string | null
          id?: string
        }
        Update: {
          aula_id?: string
          descricao?: string | null
          id?: string
        }
        Relationships: [
          {
            foreignKeyName: "aula_desafio_alpha_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_desafio_alpha_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_desafio_alpha_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_desafio_alpha_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_desafio_alpha_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_desafios: {
        Row: {
          aula_id: string | null
          criado_em: string | null
          criterios_avaliacao: string | null
          descricao: string | null
          id: string
          publico_alvo: string | null
          titulo: string
        }
        Insert: {
          aula_id?: string | null
          criado_em?: string | null
          criterios_avaliacao?: string | null
          descricao?: string | null
          id?: string
          publico_alvo?: string | null
          titulo: string
        }
        Update: {
          aula_id?: string | null
          criado_em?: string | null
          criterios_avaliacao?: string | null
          descricao?: string | null
          id?: string
          publico_alvo?: string | null
          titulo?: string
        }
        Relationships: [
          {
            foreignKeyName: "aula_desafios_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_desafios_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_desafios_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_desafios_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_desafios_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_feedback: {
        Row: {
          aula_id: string
          created_at: string | null
          id: string
          professor_id: string
          texto: string | null
        }
        Insert: {
          aula_id: string
          created_at?: string | null
          id?: string
          professor_id: string
          texto?: string | null
        }
        Update: {
          aula_id?: string
          created_at?: string | null
          id?: string
          professor_id?: string
          texto?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "aula_feedback_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedback_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_feedback_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedback_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedback_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedback_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedback_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "aula_feedback_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedback_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedback_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedback_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_feedbacks: {
        Row: {
          aula_id: string | null
          criado_em: string | null
          id: string
          professor_id: string | null
          texto: string | null
        }
        Insert: {
          aula_id?: string | null
          criado_em?: string | null
          id?: string
          professor_id?: string | null
          texto?: string | null
        }
        Update: {
          aula_id?: string | null
          criado_em?: string | null
          id?: string
          professor_id?: string | null
          texto?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "aula_feedbacks_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedbacks_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_feedbacks_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedbacks_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_feedbacks_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_materiais: {
        Row: {
          aula_id: string | null
          descricao: string | null
          id: string
          tipo: string | null
          url: string
        }
        Insert: {
          aula_id?: string | null
          descricao?: string | null
          id?: string
          tipo?: string | null
          url: string
        }
        Update: {
          aula_id?: string | null
          descricao?: string | null
          id?: string
          tipo?: string | null
          url?: string
        }
        Relationships: [
          {
            foreignKeyName: "aula_materiais_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_materiais_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_materiais_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_materiais_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_materiais_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_permissoes: {
        Row: {
          aula_id: string | null
          id: string
          professor_id: string | null
          visivel_para_aluno: boolean | null
          visivel_para_professor: boolean | null
        }
        Insert: {
          aula_id?: string | null
          id?: string
          professor_id?: string | null
          visivel_para_aluno?: boolean | null
          visivel_para_professor?: boolean | null
        }
        Update: {
          aula_id?: string | null
          id?: string
          professor_id?: string | null
          visivel_para_aluno?: boolean | null
          visivel_para_professor?: boolean | null
        }
        Relationships: [
          {
            foreignKeyName: "aula_permissoes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_permissoes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_permissoes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_permissoes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_permissoes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_registros: {
        Row: {
          aula_id: string | null
          id: string
          tipo: string | null
          url: string | null
        }
        Insert: {
          aula_id?: string | null
          id?: string
          tipo?: string | null
          url?: string | null
        }
        Update: {
          aula_id?: string | null
          id?: string
          tipo?: string | null
          url?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "aula_registros_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_registros_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_registros_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_registros_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_registros_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_status_log: {
        Row: {
          alterado_por: string | null
          aula_id: string | null
          criado_em: string | null
          id: string
          status: string
        }
        Insert: {
          alterado_por?: string | null
          aula_id?: string | null
          criado_em?: string | null
          id?: string
          status: string
        }
        Update: {
          alterado_por?: string | null
          aula_id?: string | null
          criado_em?: string | null
          id?: string
          status?: string
        }
        Relationships: [
          {
            foreignKeyName: "aula_status_log_alterado_por_fkey"
            columns: ["alterado_por"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_status_log_alterado_por_fkey"
            columns: ["alterado_por"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "aula_status_log_alterado_por_fkey"
            columns: ["alterado_por"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_status_log_alterado_por_fkey"
            columns: ["alterado_por"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_status_log_alterado_por_fkey"
            columns: ["alterado_por"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_status_log_alterado_por_fkey"
            columns: ["alterado_por"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_status_log_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_status_log_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_status_log_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_status_log_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_status_log_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aula_tags: {
        Row: {
          aula_id: string
          id: string
          tipo: string | null
          valor: string | null
        }
        Insert: {
          aula_id: string
          id?: string
          tipo?: string | null
          valor?: string | null
        }
        Update: {
          aula_id?: string
          id?: string
          tipo?: string | null
          valor?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "aula_tags_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_tags_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "aula_tags_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_tags_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aula_tags_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
        ]
      }
      aulas: {
        Row: {
          criado_em: string | null
          data_programada: string
          desafio_alpha: string | null
          detalhes_aula: Json | null
          formato: string | null
          id: string
          modulo_id: string | null
          nivel: string | null
          numero: number
          objetivo_didatico: string | null
          responsavel_id: string | null
          resumo_atividades: string | null
          status: string | null
          titulo: string
        }
        Insert: {
          criado_em?: string | null
          data_programada: string
          desafio_alpha?: string | null
          detalhes_aula?: Json | null
          formato?: string | null
          id?: string
          modulo_id?: string | null
          nivel?: string | null
          numero: number
          objetivo_didatico?: string | null
          responsavel_id?: string | null
          resumo_atividades?: string | null
          status?: string | null
          titulo: string
        }
        Update: {
          criado_em?: string | null
          data_programada?: string
          desafio_alpha?: string | null
          detalhes_aula?: Json | null
          formato?: string | null
          id?: string
          modulo_id?: string | null
          nivel?: string | null
          numero?: number
          objetivo_didatico?: string | null
          responsavel_id?: string | null
          resumo_atividades?: string | null
          status?: string | null
          titulo?: string
        }
        Relationships: [
          {
            foreignKeyName: "aulas_responsavel_id_fkey"
            columns: ["responsavel_id"]
            isOneToOne: false
            referencedRelation: "admin_professores"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aulas_responsavel_id_fkey"
            columns: ["responsavel_id"]
            isOneToOne: false
            referencedRelation: "professores"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "aulas_responsavel_id_fkey"
            columns: ["responsavel_id"]
            isOneToOne: false
            referencedRelation: "view_professor_dashboard"
            referencedColumns: ["id"]
          },
        ]
      }
      autoavaliacoes: {
        Row: {
          atividades_realizadas: string[] | null
          contribuicao_grupo: string | null
          created_at: string | null
          data_fim: string
          data_inicio: string
          desafios_futuros: string[] | null
          id: string
          ideias_experimentadas: string | null
          maior_progresso: string | null
          metas_alcancadas: string[] | null
          nivel_satisfacao: number | null
          objetivos_proximos: string | null
          periodo_tipo: string | null
          portfolio_id: string | null
          principais_dificuldades: string | null
          reflexoes_livres: string | null
          tempo_dedicado_horas: number | null
          user_id: string | null
        }
        Insert: {
          atividades_realizadas?: string[] | null
          contribuicao_grupo?: string | null
          created_at?: string | null
          data_fim: string
          data_inicio: string
          desafios_futuros?: string[] | null
          id?: string
          ideias_experimentadas?: string | null
          maior_progresso?: string | null
          metas_alcancadas?: string[] | null
          nivel_satisfacao?: number | null
          objetivos_proximos?: string | null
          periodo_tipo?: string | null
          portfolio_id?: string | null
          principais_dificuldades?: string | null
          reflexoes_livres?: string | null
          tempo_dedicado_horas?: number | null
          user_id?: string | null
        }
        Update: {
          atividades_realizadas?: string[] | null
          contribuicao_grupo?: string | null
          created_at?: string | null
          data_fim?: string
          data_inicio?: string
          desafios_futuros?: string[] | null
          id?: string
          ideias_experimentadas?: string | null
          maior_progresso?: string | null
          metas_alcancadas?: string[] | null
          nivel_satisfacao?: number | null
          objetivos_proximos?: string | null
          periodo_tipo?: string | null
          portfolio_id?: string | null
          principais_dificuldades?: string | null
          reflexoes_livres?: string | null
          tempo_dedicado_horas?: number | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "autoavaliacoes_portfolio_id_fkey"
            columns: ["portfolio_id"]
            isOneToOne: false
            referencedRelation: "portfolios"
            referencedColumns: ["id"]
          },
        ]
      }
      avaliacoes_rubricas: {
        Row: {
          avaliador_id: string | null
          created_at: string | null
          data_avaliacao: string | null
          evidencia_id: string | null
          id: string
          nota_final: number | null
          notas: Json
          observacoes: string | null
          rubrica_id: string | null
        }
        Insert: {
          avaliador_id?: string | null
          created_at?: string | null
          data_avaliacao?: string | null
          evidencia_id?: string | null
          id?: string
          nota_final?: number | null
          notas: Json
          observacoes?: string | null
          rubrica_id?: string | null
        }
        Update: {
          avaliador_id?: string | null
          created_at?: string | null
          data_avaliacao?: string | null
          evidencia_id?: string | null
          id?: string
          nota_final?: number | null
          notas?: Json
          observacoes?: string | null
          rubrica_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "avaliacoes_rubricas_evidencia_id_fkey"
            columns: ["evidencia_id"]
            isOneToOne: false
            referencedRelation: "portfolio_evidencias"
            referencedColumns: ["id"]
          },
        ]
      }
      capacitacao_docente: {
        Row: {
          atividades_praticas: Json | null
          avaliacoes_modulos: Json | null
          carga_horaria: number | null
          certificado_emitido: boolean | null
          competencias_desenvolvidas: string[] | null
          conteudo_programatico: Json | null
          created_at: string | null
          criterios_certificacao: Json | null
          data_conclusao: string | null
          data_inicio: string | null
          feedback_curso: string | null
          id: string
          metodologias_abordadas: string[] | null
          modalidade: string | null
          nivel_curso: string | null
          nota_avaliacao: number | null
          professor_id: string | null
          progresso_percentual: number | null
          projetos_realizados: string[] | null
          proximos_cursos_sugeridos: string[] | null
          recursos_materiais: string[] | null
          reflexoes_aprendizagem: string | null
          titulo_curso: string
          updated_at: string | null
        }
        Insert: {
          atividades_praticas?: Json | null
          avaliacoes_modulos?: Json | null
          carga_horaria?: number | null
          certificado_emitido?: boolean | null
          competencias_desenvolvidas?: string[] | null
          conteudo_programatico?: Json | null
          created_at?: string | null
          criterios_certificacao?: Json | null
          data_conclusao?: string | null
          data_inicio?: string | null
          feedback_curso?: string | null
          id?: string
          metodologias_abordadas?: string[] | null
          modalidade?: string | null
          nivel_curso?: string | null
          nota_avaliacao?: number | null
          professor_id?: string | null
          progresso_percentual?: number | null
          projetos_realizados?: string[] | null
          proximos_cursos_sugeridos?: string[] | null
          recursos_materiais?: string[] | null
          reflexoes_aprendizagem?: string | null
          titulo_curso: string
          updated_at?: string | null
        }
        Update: {
          atividades_praticas?: Json | null
          avaliacoes_modulos?: Json | null
          carga_horaria?: number | null
          certificado_emitido?: boolean | null
          competencias_desenvolvidas?: string[] | null
          conteudo_programatico?: Json | null
          created_at?: string | null
          criterios_certificacao?: Json | null
          data_conclusao?: string | null
          data_inicio?: string | null
          feedback_curso?: string | null
          id?: string
          metodologias_abordadas?: string[] | null
          modalidade?: string | null
          nivel_curso?: string | null
          nota_avaliacao?: number | null
          professor_id?: string | null
          progresso_percentual?: number | null
          projetos_realizados?: string[] | null
          proximos_cursos_sugeridos?: string[] | null
          recursos_materiais?: string[] | null
          reflexoes_aprendizagem?: string | null
          titulo_curso?: string
          updated_at?: string | null
        }
        Relationships: []
      }
      cessoes_instrumentos: {
        Row: {
          aluno_id: string | null
          condicoes_uso: string | null
          created_at: string | null
          data_devolucao_real: string | null
          data_fim_prevista: string | null
          data_inicio: string | null
          id: string
          instrumento_fisico_id: string | null
          observacoes: string | null
          responsavel_devolucao: string | null
          responsavel_entrega: string | null
          status: string | null
          termo_responsabilidade: boolean | null
          tipo_cessao: string | null
          updated_at: string | null
        }
        Insert: {
          aluno_id?: string | null
          condicoes_uso?: string | null
          created_at?: string | null
          data_devolucao_real?: string | null
          data_fim_prevista?: string | null
          data_inicio?: string | null
          id?: string
          instrumento_fisico_id?: string | null
          observacoes?: string | null
          responsavel_devolucao?: string | null
          responsavel_entrega?: string | null
          status?: string | null
          termo_responsabilidade?: boolean | null
          tipo_cessao?: string | null
          updated_at?: string | null
        }
        Update: {
          aluno_id?: string | null
          condicoes_uso?: string | null
          created_at?: string | null
          data_devolucao_real?: string | null
          data_fim_prevista?: string | null
          data_inicio?: string | null
          id?: string
          instrumento_fisico_id?: string | null
          observacoes?: string | null
          responsavel_devolucao?: string | null
          responsavel_entrega?: string | null
          status?: string | null
          termo_responsabilidade?: boolean | null
          tipo_cessao?: string | null
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "cessoes_instrumentos_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "admin_alunos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "cessoes_instrumentos_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "alunos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "cessoes_instrumentos_instrumento_fisico_id_fkey"
            columns: ["instrumento_fisico_id"]
            isOneToOne: false
            referencedRelation: "instrumentos_fisicos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "cessoes_instrumentos_responsavel_devolucao_fkey"
            columns: ["responsavel_devolucao"]
            isOneToOne: false
            referencedRelation: "admin_professores"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "cessoes_instrumentos_responsavel_devolucao_fkey"
            columns: ["responsavel_devolucao"]
            isOneToOne: false
            referencedRelation: "professores"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "cessoes_instrumentos_responsavel_devolucao_fkey"
            columns: ["responsavel_devolucao"]
            isOneToOne: false
            referencedRelation: "view_professor_dashboard"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "cessoes_instrumentos_responsavel_entrega_fkey"
            columns: ["responsavel_entrega"]
            isOneToOne: false
            referencedRelation: "admin_professores"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "cessoes_instrumentos_responsavel_entrega_fkey"
            columns: ["responsavel_entrega"]
            isOneToOne: false
            referencedRelation: "professores"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "cessoes_instrumentos_responsavel_entrega_fkey"
            columns: ["responsavel_entrega"]
            isOneToOne: false
            referencedRelation: "view_professor_dashboard"
            referencedColumns: ["id"]
          },
        ]
      }
      comunicacao_engajamento: {
        Row: {
          alcance_estimado: number | null
          alcance_real: number | null
          aprendizados_obtidos: string[] | null
          canais_utilizados: string[] | null
          conteudo_principal: Json | null
          created_at: string | null
          cronograma_execucao: Json | null
          data_execucao: string | null
          feedback_comunidade: string | null
          id: string
          interacoes_geradas: number | null
          metodologias_promovidas: string[] | null
          metricas_engajamento: Json | null
          objetivo_comunicacao: string | null
          orcamento_estimado: number | null
          orcamento_realizado: number | null
          parceiros_envolvidos: string[] | null
          proximas_acoes: string[] | null
          publico_alvo: string | null
          recursos_necessarios: string[] | null
          responsavel_execucao: string | null
          resultados_mensuraveis: Json | null
          status_acao: string | null
          tipo_acao: string | null
          titulo_acao: string
          updated_at: string | null
        }
        Insert: {
          alcance_estimado?: number | null
          alcance_real?: number | null
          aprendizados_obtidos?: string[] | null
          canais_utilizados?: string[] | null
          conteudo_principal?: Json | null
          created_at?: string | null
          cronograma_execucao?: Json | null
          data_execucao?: string | null
          feedback_comunidade?: string | null
          id?: string
          interacoes_geradas?: number | null
          metodologias_promovidas?: string[] | null
          metricas_engajamento?: Json | null
          objetivo_comunicacao?: string | null
          orcamento_estimado?: number | null
          orcamento_realizado?: number | null
          parceiros_envolvidos?: string[] | null
          proximas_acoes?: string[] | null
          publico_alvo?: string | null
          recursos_necessarios?: string[] | null
          responsavel_execucao?: string | null
          resultados_mensuraveis?: Json | null
          status_acao?: string | null
          tipo_acao?: string | null
          titulo_acao: string
          updated_at?: string | null
        }
        Update: {
          alcance_estimado?: number | null
          alcance_real?: number | null
          aprendizados_obtidos?: string[] | null
          canais_utilizados?: string[] | null
          conteudo_principal?: Json | null
          created_at?: string | null
          cronograma_execucao?: Json | null
          data_execucao?: string | null
          feedback_comunidade?: string | null
          id?: string
          interacoes_geradas?: number | null
          metodologias_promovidas?: string[] | null
          metricas_engajamento?: Json | null
          objetivo_comunicacao?: string | null
          orcamento_estimado?: number | null
          orcamento_realizado?: number | null
          parceiros_envolvidos?: string[] | null
          proximas_acoes?: string[] | null
          publico_alvo?: string | null
          recursos_necessarios?: string[] | null
          responsavel_execucao?: string | null
          resultados_mensuraveis?: Json | null
          status_acao?: string | null
          tipo_acao?: string | null
          titulo_acao?: string
          updated_at?: string | null
        }
        Relationships: []
      }
      desafios_alpha: {
        Row: {
          ativo: boolean | null
          created_at: string | null
          criterios_avaliacao: string[] | null
          descricao: string
          exemplos_url: string[] | null
          id: string
          instrucoes: string[] | null
          material_necessario: string[] | null
          modulo_relacionado_id: string | null
          pontos_recompensa: number | null
          semana: number
          tempo_limite_dias: number | null
          tipo_desafio: string | null
          titulo: string
        }
        Insert: {
          ativo?: boolean | null
          created_at?: string | null
          criterios_avaliacao?: string[] | null
          descricao: string
          exemplos_url?: string[] | null
          id?: string
          instrucoes?: string[] | null
          material_necessario?: string[] | null
          modulo_relacionado_id?: string | null
          pontos_recompensa?: number | null
          semana: number
          tempo_limite_dias?: number | null
          tipo_desafio?: string | null
          titulo: string
        }
        Update: {
          ativo?: boolean | null
          created_at?: string | null
          criterios_avaliacao?: string[] | null
          descricao?: string
          exemplos_url?: string[] | null
          id?: string
          instrucoes?: string[] | null
          material_necessario?: string[] | null
          modulo_relacionado_id?: string | null
          pontos_recompensa?: number | null
          semana?: number
          tempo_limite_dias?: number | null
          tipo_desafio?: string | null
          titulo?: string
        }
        Relationships: [
          {
            foreignKeyName: "desafios_alpha_modulo_relacionado_id_fkey"
            columns: ["modulo_relacionado_id"]
            isOneToOne: false
            referencedRelation: "modulos"
            referencedColumns: ["id"]
          },
        ]
      }
      desafios_alpha_respostas: {
        Row: {
          aluno_id: string | null
          avaliado_em: string | null
          created_at: string | null
          desafio_id: string | null
          id: string
          nota_professor: string | null
          pontos_obtidos: number | null
          resposta_texto: string | null
          status: string | null
          url_midia: string | null
        }
        Insert: {
          aluno_id?: string | null
          avaliado_em?: string | null
          created_at?: string | null
          desafio_id?: string | null
          id?: string
          nota_professor?: string | null
          pontos_obtidos?: number | null
          resposta_texto?: string | null
          status?: string | null
          url_midia?: string | null
        }
        Update: {
          aluno_id?: string | null
          avaliado_em?: string | null
          created_at?: string | null
          desafio_id?: string | null
          id?: string
          nota_professor?: string | null
          pontos_obtidos?: number | null
          resposta_texto?: string | null
          status?: string | null
          url_midia?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "desafios_alpha_respostas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "desafios_alpha_respostas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "desafios_alpha_respostas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "desafios_alpha_respostas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "desafios_alpha_respostas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "desafios_alpha_respostas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "desafios_alpha_respostas_desafio_id_fkey"
            columns: ["desafio_id"]
            isOneToOne: false
            referencedRelation: "desafios_alpha"
            referencedColumns: ["id"]
          },
        ]
      }
      devotional_content: {
        Row: {
          author: string | null
          bible_reference: string | null
          bible_verse: string | null
          category: string | null
          content: string
          created_at: string | null
          featured_image_url: string | null
          id: string
          is_published: boolean | null
          published_date: string | null
          title: string
        }
        Insert: {
          author?: string | null
          bible_reference?: string | null
          bible_verse?: string | null
          category?: string | null
          content: string
          created_at?: string | null
          featured_image_url?: string | null
          id?: string
          is_published?: boolean | null
          published_date?: string | null
          title: string
        }
        Update: {
          author?: string | null
          bible_reference?: string | null
          bible_verse?: string | null
          category?: string | null
          content?: string
          created_at?: string | null
          featured_image_url?: string | null
          id?: string
          is_published?: boolean | null
          published_date?: string | null
          title?: string
        }
        Relationships: []
      }
      documentos_institucionais: {
        Row: {
          autor_responsavel: string | null
          campos_personalizaveis: Json | null
          conteudo_template: string | null
          created_at: string | null
          criterios_validacao: string[] | null
          data_aprovacao: string | null
          downloads: number | null
          estrutura_documento: Json | null
          exemplos_preenchidos: string[] | null
          formato_entrega: string | null
          id: string
          instituicao_origem: string | null
          instrucoes_preenchimento: string | null
          metodologias_abordadas: string[] | null
          nivel_aplicacao: string | null
          objetivo_documento: string | null
          proxima_revisao: string | null
          publico_alvo: string | null
          status_documento: string | null
          tipo_documento: string | null
          titulo: string
          updated_at: string | null
          versao: string | null
        }
        Insert: {
          autor_responsavel?: string | null
          campos_personalizaveis?: Json | null
          conteudo_template?: string | null
          created_at?: string | null
          criterios_validacao?: string[] | null
          data_aprovacao?: string | null
          downloads?: number | null
          estrutura_documento?: Json | null
          exemplos_preenchidos?: string[] | null
          formato_entrega?: string | null
          id?: string
          instituicao_origem?: string | null
          instrucoes_preenchimento?: string | null
          metodologias_abordadas?: string[] | null
          nivel_aplicacao?: string | null
          objetivo_documento?: string | null
          proxima_revisao?: string | null
          publico_alvo?: string | null
          status_documento?: string | null
          tipo_documento?: string | null
          titulo: string
          updated_at?: string | null
          versao?: string | null
        }
        Update: {
          autor_responsavel?: string | null
          campos_personalizaveis?: Json | null
          conteudo_template?: string | null
          created_at?: string | null
          criterios_validacao?: string[] | null
          data_aprovacao?: string | null
          downloads?: number | null
          estrutura_documento?: Json | null
          exemplos_preenchidos?: string[] | null
          formato_entrega?: string | null
          id?: string
          instituicao_origem?: string | null
          instrucoes_preenchimento?: string | null
          metodologias_abordadas?: string[] | null
          nivel_aplicacao?: string | null
          objetivo_documento?: string | null
          proxima_revisao?: string | null
          publico_alvo?: string | null
          status_documento?: string | null
          tipo_documento?: string | null
          titulo?: string
          updated_at?: string | null
          versao?: string | null
        }
        Relationships: []
      }
      experiencias_brasileiras: {
        Row: {
          contatos: Json | null
          created_at: string | null
          data_fim: string | null
          data_inicio: string | null
          desafios_enfrentados: string[] | null
          descricao_projeto: string | null
          documentacao_midia: string[] | null
          id: string
          impacto_social: Json | null
          instituicao: string | null
          metodologias_aplicadas: string[] | null
          nome_projeto: string
          publico_alvo: string | null
          recursos_utilizados: Json | null
          regiao_brasil: string | null
          resultados_alcancados: string | null
          solucoes_implementadas: string[] | null
          status_projeto: string | null
          tipo_experiencia: string | null
        }
        Insert: {
          contatos?: Json | null
          created_at?: string | null
          data_fim?: string | null
          data_inicio?: string | null
          desafios_enfrentados?: string[] | null
          descricao_projeto?: string | null
          documentacao_midia?: string[] | null
          id?: string
          impacto_social?: Json | null
          instituicao?: string | null
          metodologias_aplicadas?: string[] | null
          nome_projeto: string
          publico_alvo?: string | null
          recursos_utilizados?: Json | null
          regiao_brasil?: string | null
          resultados_alcancados?: string | null
          solucoes_implementadas?: string[] | null
          status_projeto?: string | null
          tipo_experiencia?: string | null
        }
        Update: {
          contatos?: Json | null
          created_at?: string | null
          data_fim?: string | null
          data_inicio?: string | null
          desafios_enfrentados?: string[] | null
          descricao_projeto?: string | null
          documentacao_midia?: string[] | null
          id?: string
          impacto_social?: Json | null
          instituicao?: string | null
          metodologias_aplicadas?: string[] | null
          nome_projeto?: string
          publico_alvo?: string | null
          recursos_utilizados?: Json | null
          regiao_brasil?: string | null
          resultados_alcancados?: string | null
          solucoes_implementadas?: string[] | null
          status_projeto?: string | null
          tipo_experiencia?: string | null
        }
        Relationships: []
      }
      feedback_pares: {
        Row: {
          aprovado: boolean | null
          avaliado_id: string | null
          avaliador_id: string | null
          comentarios_gerais: string | null
          created_at: string | null
          evidencia_id: string | null
          id: string
          nota_cooperacao: number | null
          nota_criatividade: number | null
          nota_participacao: number | null
          nota_tecnica: number | null
          pontos_fortes: string
          sugestoes_melhoria: string | null
        }
        Insert: {
          aprovado?: boolean | null
          avaliado_id?: string | null
          avaliador_id?: string | null
          comentarios_gerais?: string | null
          created_at?: string | null
          evidencia_id?: string | null
          id?: string
          nota_cooperacao?: number | null
          nota_criatividade?: number | null
          nota_participacao?: number | null
          nota_tecnica?: number | null
          pontos_fortes: string
          sugestoes_melhoria?: string | null
        }
        Update: {
          aprovado?: boolean | null
          avaliado_id?: string | null
          avaliador_id?: string | null
          comentarios_gerais?: string | null
          created_at?: string | null
          evidencia_id?: string | null
          id?: string
          nota_cooperacao?: number | null
          nota_criatividade?: number | null
          nota_participacao?: number | null
          nota_tecnica?: number | null
          pontos_fortes?: string
          sugestoes_melhoria?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "feedback_pares_evidencia_id_fkey"
            columns: ["evidencia_id"]
            isOneToOne: false
            referencedRelation: "portfolio_evidencias"
            referencedColumns: ["id"]
          },
        ]
      }
      forum_likes: {
        Row: {
          created_at: string | null
          id: string
          resposta_id: string | null
          user_id: string | null
        }
        Insert: {
          created_at?: string | null
          id?: string
          resposta_id?: string | null
          user_id?: string | null
        }
        Update: {
          created_at?: string | null
          id?: string
          resposta_id?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "forum_likes_resposta_id_fkey"
            columns: ["resposta_id"]
            isOneToOne: false
            referencedRelation: "forum_respostas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_likes_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_likes_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "forum_likes_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_likes_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_likes_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_likes_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      forum_perguntas: {
        Row: {
          aluno_id: string | null
          categoria: string | null
          created_at: string | null
          id: string
          modulo_id: string | null
          nivel_urgencia: string | null
          pergunta: string
          status: string | null
          titulo: string
          updated_at: string | null
          visualizacoes: number | null
        }
        Insert: {
          aluno_id?: string | null
          categoria?: string | null
          created_at?: string | null
          id?: string
          modulo_id?: string | null
          nivel_urgencia?: string | null
          pergunta: string
          status?: string | null
          titulo: string
          updated_at?: string | null
          visualizacoes?: number | null
        }
        Update: {
          aluno_id?: string | null
          categoria?: string | null
          created_at?: string | null
          id?: string
          modulo_id?: string | null
          nivel_urgencia?: string | null
          pergunta?: string
          status?: string | null
          titulo?: string
          updated_at?: string | null
          visualizacoes?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "forum_perguntas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_perguntas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "forum_perguntas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_perguntas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_perguntas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_perguntas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_perguntas_modulo_id_fkey"
            columns: ["modulo_id"]
            isOneToOne: false
            referencedRelation: "modulos"
            referencedColumns: ["id"]
          },
        ]
      }
      forum_respostas: {
        Row: {
          created_at: string | null
          eh_resposta_oficial: boolean | null
          id: string
          likes_count: number | null
          pergunta_id: string | null
          resposta: string
          resposta_de_id: string | null
        }
        Insert: {
          created_at?: string | null
          eh_resposta_oficial?: boolean | null
          id?: string
          likes_count?: number | null
          pergunta_id?: string | null
          resposta: string
          resposta_de_id?: string | null
        }
        Update: {
          created_at?: string | null
          eh_resposta_oficial?: boolean | null
          id?: string
          likes_count?: number | null
          pergunta_id?: string | null
          resposta?: string
          resposta_de_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "forum_respostas_pergunta_id_fkey"
            columns: ["pergunta_id"]
            isOneToOne: false
            referencedRelation: "forum_perguntas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_respostas_pergunta_id_fkey"
            columns: ["pergunta_id"]
            isOneToOne: false
            referencedRelation: "vw_forum_stats"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_respostas_resposta_de_id_fkey"
            columns: ["resposta_de_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_respostas_resposta_de_id_fkey"
            columns: ["resposta_de_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "forum_respostas_resposta_de_id_fkey"
            columns: ["resposta_de_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_respostas_resposta_de_id_fkey"
            columns: ["resposta_de_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_respostas_resposta_de_id_fkey"
            columns: ["resposta_de_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_respostas_resposta_de_id_fkey"
            columns: ["resposta_de_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      historico_instrumentos: {
        Row: {
          acao: string | null
          aluno_afetado_id: string | null
          data_acao: string | null
          descricao: string | null
          id: string
          instrumento_fisico_id: string | null
          usuario_id: string | null
        }
        Insert: {
          acao?: string | null
          aluno_afetado_id?: string | null
          data_acao?: string | null
          descricao?: string | null
          id?: string
          instrumento_fisico_id?: string | null
          usuario_id?: string | null
        }
        Update: {
          acao?: string | null
          aluno_afetado_id?: string | null
          data_acao?: string | null
          descricao?: string | null
          id?: string
          instrumento_fisico_id?: string | null
          usuario_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "historico_instrumentos_aluno_afetado_id_fkey"
            columns: ["aluno_afetado_id"]
            isOneToOne: false
            referencedRelation: "admin_alunos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "historico_instrumentos_aluno_afetado_id_fkey"
            columns: ["aluno_afetado_id"]
            isOneToOne: false
            referencedRelation: "alunos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "historico_instrumentos_instrumento_fisico_id_fkey"
            columns: ["instrumento_fisico_id"]
            isOneToOne: false
            referencedRelation: "instrumentos_fisicos"
            referencedColumns: ["id"]
          },
        ]
      }
      hook_cache: {
        Row: {
          cache_key: string
          created_at: string | null
          data: Json
          expires_at: string
          hit_count: number | null
          hook_name: string
          id: string
          last_accessed: string | null
          user_id: string | null
        }
        Insert: {
          cache_key: string
          created_at?: string | null
          data: Json
          expires_at: string
          hit_count?: number | null
          hook_name: string
          id?: string
          last_accessed?: string | null
          user_id?: string | null
        }
        Update: {
          cache_key?: string
          created_at?: string | null
          data?: Json
          expires_at?: string
          hit_count?: number | null
          hook_name?: string
          id?: string
          last_accessed?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "hook_cache_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "hook_cache_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "hook_cache_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "hook_cache_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "hook_cache_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "hook_cache_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      indicadores_impacto: {
        Row: {
          created_at: string | null
          data_medicao: string | null
          id: string
          metodo_coleta: string | null
          observacoes: string | null
          tipo_indicador: string
          user_id: string | null
          valor_atual: number | null
          valor_inicial: number | null
        }
        Insert: {
          created_at?: string | null
          data_medicao?: string | null
          id?: string
          metodo_coleta?: string | null
          observacoes?: string | null
          tipo_indicador: string
          user_id?: string | null
          valor_atual?: number | null
          valor_inicial?: number | null
        }
        Update: {
          created_at?: string | null
          data_medicao?: string | null
          id?: string
          metodo_coleta?: string | null
          observacoes?: string | null
          tipo_indicador?: string
          user_id?: string | null
          valor_atual?: number | null
          valor_inicial?: number | null
        }
        Relationships: []
      }
      instrumento_curiosidades: {
        Row: {
          categoria: string | null
          conteudo: string
          created_at: string | null
          fonte: string | null
          id: string
          imagem_url: string | null
          instrumento_id: string | null
          titulo: string
          video_url: string | null
        }
        Insert: {
          categoria?: string | null
          conteudo: string
          created_at?: string | null
          fonte?: string | null
          id?: string
          imagem_url?: string | null
          instrumento_id?: string | null
          titulo: string
          video_url?: string | null
        }
        Update: {
          categoria?: string | null
          conteudo?: string
          created_at?: string | null
          fonte?: string | null
          id?: string
          imagem_url?: string | null
          instrumento_id?: string | null
          titulo?: string
          video_url?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumento_curiosidades_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_curiosidades_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumento_curiosidades_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_curiosidades_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      instrumento_midias: {
        Row: {
          arquivo_local: string | null
          ativo: boolean | null
          categoria: string | null
          created_at: string | null
          descricao: string | null
          duracao_segundos: number | null
          id: string
          instrumento_id: string | null
          mime_type: string | null
          nivel: string | null
          ordem_exibicao: number | null
          origem: string | null
          tags: Json | null
          tamanho_bytes: number | null
          tipo: string
          titulo: string
          url: string | null
          visualizacoes: number | null
        }
        Insert: {
          arquivo_local?: string | null
          ativo?: boolean | null
          categoria?: string | null
          created_at?: string | null
          descricao?: string | null
          duracao_segundos?: number | null
          id?: string
          instrumento_id?: string | null
          mime_type?: string | null
          nivel?: string | null
          ordem_exibicao?: number | null
          origem?: string | null
          tags?: Json | null
          tamanho_bytes?: number | null
          tipo: string
          titulo: string
          url?: string | null
          visualizacoes?: number | null
        }
        Update: {
          arquivo_local?: string | null
          ativo?: boolean | null
          categoria?: string | null
          created_at?: string | null
          descricao?: string | null
          duracao_segundos?: number | null
          id?: string
          instrumento_id?: string | null
          mime_type?: string | null
          nivel?: string | null
          ordem_exibicao?: number | null
          origem?: string | null
          tags?: Json | null
          tamanho_bytes?: number | null
          tipo?: string
          titulo?: string
          url?: string | null
          visualizacoes?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumento_midias_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_midias_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumento_midias_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_midias_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      instrumento_performances: {
        Row: {
          ano_performance: number | null
          artista: string | null
          audio_url: string | null
          compositor: string | null
          created_at: string | null
          descricao_tecnica: string | null
          dificuldade_execucao: string | null
          genero_musical: string | null
          id: string
          instrumento_id: string | null
          partitura_url: string | null
          titulo: string
          video_url: string | null
          visualizacoes: number | null
        }
        Insert: {
          ano_performance?: number | null
          artista?: string | null
          audio_url?: string | null
          compositor?: string | null
          created_at?: string | null
          descricao_tecnica?: string | null
          dificuldade_execucao?: string | null
          genero_musical?: string | null
          id?: string
          instrumento_id?: string | null
          partitura_url?: string | null
          titulo: string
          video_url?: string | null
          visualizacoes?: number | null
        }
        Update: {
          ano_performance?: number | null
          artista?: string | null
          audio_url?: string | null
          compositor?: string | null
          created_at?: string | null
          descricao_tecnica?: string | null
          dificuldade_execucao?: string | null
          genero_musical?: string | null
          id?: string
          instrumento_id?: string | null
          partitura_url?: string | null
          titulo?: string
          video_url?: string | null
          visualizacoes?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumento_performances_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_performances_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumento_performances_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_performances_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      instrumento_quiz: {
        Row: {
          arquivo_audio: string | null
          ativo: boolean | null
          categoria: string | null
          created_at: string | null
          dificuldade: string | null
          explicacao: string | null
          id: string
          imagem_url: string | null
          instrumento_id: string | null
          opcoes: string
          pergunta: string
          resposta_correta: string | null
          respostas_corretas: Json | null
          tempo_limite_segundos: number | null
          tipo_pergunta: string | null
        }
        Insert: {
          arquivo_audio?: string | null
          ativo?: boolean | null
          categoria?: string | null
          created_at?: string | null
          dificuldade?: string | null
          explicacao?: string | null
          id?: string
          imagem_url?: string | null
          instrumento_id?: string | null
          opcoes: string
          pergunta: string
          resposta_correta?: string | null
          respostas_corretas?: Json | null
          tempo_limite_segundos?: number | null
          tipo_pergunta?: string | null
        }
        Update: {
          arquivo_audio?: string | null
          ativo?: boolean | null
          categoria?: string | null
          created_at?: string | null
          dificuldade?: string | null
          explicacao?: string | null
          id?: string
          imagem_url?: string | null
          instrumento_id?: string | null
          opcoes?: string
          pergunta?: string
          resposta_correta?: string | null
          respostas_corretas?: Json | null
          tempo_limite_segundos?: number | null
          tipo_pergunta?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumento_quiz_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_quiz_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumento_quiz_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_quiz_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      instrumento_sons: {
        Row: {
          arquivo_audio: string
          artista_performer: string | null
          bpm: number | null
          created_at: string | null
          dinamica: string | null
          id: string
          instrumento_id: string | null
          nota_musical: string | null
          tecnica: string | null
          tonalidade: string | null
          waveform_data: Json | null
        }
        Insert: {
          arquivo_audio: string
          artista_performer?: string | null
          bpm?: number | null
          created_at?: string | null
          dinamica?: string | null
          id?: string
          instrumento_id?: string | null
          nota_musical?: string | null
          tecnica?: string | null
          tonalidade?: string | null
          waveform_data?: Json | null
        }
        Update: {
          arquivo_audio?: string
          artista_performer?: string | null
          bpm?: number | null
          created_at?: string | null
          dinamica?: string | null
          id?: string
          instrumento_id?: string | null
          nota_musical?: string | null
          tecnica?: string | null
          tonalidade?: string | null
          waveform_data?: Json | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumento_sons_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_sons_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumento_sons_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_sons_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      instrumento_sons_variacoes: {
        Row: {
          ano_gravacao: number | null
          arquivo_audio: string
          artista_performer: string | null
          created_at: string | null
          duracao_segundos: number | null
          id: string
          instrumento_usado: string | null
          local_gravacao: string | null
          qualidade_gravacao: string | null
          som_id: string | null
        }
        Insert: {
          ano_gravacao?: number | null
          arquivo_audio: string
          artista_performer?: string | null
          created_at?: string | null
          duracao_segundos?: number | null
          id?: string
          instrumento_usado?: string | null
          local_gravacao?: string | null
          qualidade_gravacao?: string | null
          som_id?: string | null
        }
        Update: {
          ano_gravacao?: number | null
          arquivo_audio?: string
          artista_performer?: string | null
          created_at?: string | null
          duracao_segundos?: number | null
          id?: string
          instrumento_usado?: string | null
          local_gravacao?: string | null
          qualidade_gravacao?: string | null
          som_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumento_sons_variacoes_som_id_fkey"
            columns: ["som_id"]
            isOneToOne: false
            referencedRelation: "instrumento_sons"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_sons_variacoes_som_id_fkey"
            columns: ["som_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumento_sons"
            referencedColumns: ["id"]
          },
        ]
      }
      instrumento_tecnicas: {
        Row: {
          audio_exemplo: string | null
          created_at: string | null
          descricao: string | null
          grupo_tecnico: string | null
          id: string
          instrumento_id: string | null
          nivel: string | null
          nome: string
          ordem_aprendizado: number | null
          partitura_url: string | null
          pre_requisitos: string | null
          tempo_pratica_recomendado: number | null
          tipo_tecnica: string | null
          video_tutorial: string | null
        }
        Insert: {
          audio_exemplo?: string | null
          created_at?: string | null
          descricao?: string | null
          grupo_tecnico?: string | null
          id?: string
          instrumento_id?: string | null
          nivel?: string | null
          nome: string
          ordem_aprendizado?: number | null
          partitura_url?: string | null
          pre_requisitos?: string | null
          tempo_pratica_recomendado?: number | null
          tipo_tecnica?: string | null
          video_tutorial?: string | null
        }
        Update: {
          audio_exemplo?: string | null
          created_at?: string | null
          descricao?: string | null
          grupo_tecnico?: string | null
          id?: string
          instrumento_id?: string | null
          nivel?: string | null
          nome?: string
          ordem_aprendizado?: number | null
          partitura_url?: string | null
          pre_requisitos?: string | null
          tempo_pratica_recomendado?: number | null
          tipo_tecnica?: string | null
          video_tutorial?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumento_tecnicas_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_tecnicas_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumento_tecnicas_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_tecnicas_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      instrumentos: {
        Row: {
          anatomia_partes: Json | null
          ativo: boolean | null
          categoria: string | null
          criado_em: string | null
          curiosidades: Json | null
          descricao: string | null
          dificuldade_aprendizado: string | null
          familia_instrumental: string | null
          historia: string | null
          id: string
          imagem_url: string | null
          material_principal: string | null
          nome: string
          ordem_exibicao: number | null
          origem: string | null
          tecnica_producao_som: string | null
        }
        Insert: {
          anatomia_partes?: Json | null
          ativo?: boolean | null
          categoria?: string | null
          criado_em?: string | null
          curiosidades?: Json | null
          descricao?: string | null
          dificuldade_aprendizado?: string | null
          familia_instrumental?: string | null
          historia?: string | null
          id?: string
          imagem_url?: string | null
          material_principal?: string | null
          nome: string
          ordem_exibicao?: number | null
          origem?: string | null
          tecnica_producao_som?: string | null
        }
        Update: {
          anatomia_partes?: Json | null
          ativo?: boolean | null
          categoria?: string | null
          criado_em?: string | null
          curiosidades?: Json | null
          descricao?: string | null
          dificuldade_aprendizado?: string | null
          familia_instrumental?: string | null
          historia?: string | null
          id?: string
          imagem_url?: string | null
          material_principal?: string | null
          nome?: string
          ordem_exibicao?: number | null
          origem?: string | null
          tecnica_producao_som?: string | null
        }
        Relationships: []
      }
      instrumentos_alunos: {
        Row: {
          aluno_id: string | null
          ano_aquisicao: number | null
          created_at: string | null
          estado: string | null
          id: string
          instrumento_id: string | null
          marca: string | null
          modelo: string | null
          observacoes: string | null
          principal: boolean | null
          updated_at: string | null
        }
        Insert: {
          aluno_id?: string | null
          ano_aquisicao?: number | null
          created_at?: string | null
          estado?: string | null
          id?: string
          instrumento_id?: string | null
          marca?: string | null
          modelo?: string | null
          observacoes?: string | null
          principal?: boolean | null
          updated_at?: string | null
        }
        Update: {
          aluno_id?: string | null
          ano_aquisicao?: number | null
          created_at?: string | null
          estado?: string | null
          id?: string
          instrumento_id?: string | null
          marca?: string | null
          modelo?: string | null
          observacoes?: string | null
          principal?: boolean | null
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumentos_alunos_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "admin_alunos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_alunos_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "alunos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_alunos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_alunos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumentos_alunos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_alunos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      instrumentos_fisicos: {
        Row: {
          codigo_patrimonio: string | null
          created_at: string | null
          data_aquisicao: string | null
          disponivel: boolean | null
          estado: string | null
          id: string
          instrumento_id: string | null
          localizacao: string | null
          marca: string | null
          modelo: string | null
          numero_serie: string | null
          observacoes: string | null
          proprietario: string | null
          updated_at: string | null
          valor_aquisicao: number | null
        }
        Insert: {
          codigo_patrimonio?: string | null
          created_at?: string | null
          data_aquisicao?: string | null
          disponivel?: boolean | null
          estado?: string | null
          id?: string
          instrumento_id?: string | null
          localizacao?: string | null
          marca?: string | null
          modelo?: string | null
          numero_serie?: string | null
          observacoes?: string | null
          proprietario?: string | null
          updated_at?: string | null
          valor_aquisicao?: number | null
        }
        Update: {
          codigo_patrimonio?: string | null
          created_at?: string | null
          data_aquisicao?: string | null
          disponivel?: boolean | null
          estado?: string | null
          id?: string
          instrumento_id?: string | null
          localizacao?: string | null
          marca?: string | null
          modelo?: string | null
          numero_serie?: string | null
          observacoes?: string | null
          proprietario?: string | null
          updated_at?: string | null
          valor_aquisicao?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumentos_fisicos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_fisicos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumentos_fisicos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_fisicos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      instrumentos_relacionados: {
        Row: {
          created_at: string | null
          descricao_relacao: string | null
          id: string
          instrumento_id: string | null
          relacionado_id: string | null
          similaridade_score: number | null
          tipo_relacao: string | null
        }
        Insert: {
          created_at?: string | null
          descricao_relacao?: string | null
          id?: string
          instrumento_id?: string | null
          relacionado_id?: string | null
          similaridade_score?: number | null
          tipo_relacao?: string | null
        }
        Update: {
          created_at?: string | null
          descricao_relacao?: string | null
          id?: string
          instrumento_id?: string | null
          relacionado_id?: string | null
          similaridade_score?: number | null
          tipo_relacao?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumentos_relacionados_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_relacionado_id_fkey"
            columns: ["relacionado_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_relacionado_id_fkey"
            columns: ["relacionado_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_relacionado_id_fkey"
            columns: ["relacionado_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_relacionado_id_fkey"
            columns: ["relacionado_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      lessons: {
        Row: {
          audio_files: Json | null
          categoria: string | null
          created_at: string | null
          description: string | null
          has_exercise: boolean | null
          id: string
          is_free: boolean | null
          metodologia: string | null
          module_id: string | null
          nivel_dificuldade: string | null
          order_index: number | null
          pdf_materials: Json | null
          professor_responsavel_id: string | null
          slug: string
          tags: string[] | null
          thumbnail_url: string | null
          tipo_conteudo: string | null
          title: string
          updated_at: string | null
          video_duration_seconds: number | null
          video_url: string | null
        }
        Insert: {
          audio_files?: Json | null
          categoria?: string | null
          created_at?: string | null
          description?: string | null
          has_exercise?: boolean | null
          id?: string
          is_free?: boolean | null
          metodologia?: string | null
          module_id?: string | null
          nivel_dificuldade?: string | null
          order_index?: number | null
          pdf_materials?: Json | null
          professor_responsavel_id?: string | null
          slug: string
          tags?: string[] | null
          thumbnail_url?: string | null
          tipo_conteudo?: string | null
          title: string
          updated_at?: string | null
          video_duration_seconds?: number | null
          video_url?: string | null
        }
        Update: {
          audio_files?: Json | null
          categoria?: string | null
          created_at?: string | null
          description?: string | null
          has_exercise?: boolean | null
          id?: string
          is_free?: boolean | null
          metodologia?: string | null
          module_id?: string | null
          nivel_dificuldade?: string | null
          order_index?: number | null
          pdf_materials?: Json | null
          professor_responsavel_id?: string | null
          slug?: string
          tags?: string[] | null
          thumbnail_url?: string | null
          tipo_conteudo?: string | null
          title?: string
          updated_at?: string | null
          video_duration_seconds?: number | null
          video_url?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "lessons_module_id_fkey"
            columns: ["module_id"]
            isOneToOne: false
            referencedRelation: "modules"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "lessons_professor_responsavel_id_fkey"
            columns: ["professor_responsavel_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "lessons_professor_responsavel_id_fkey"
            columns: ["professor_responsavel_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "lessons_professor_responsavel_id_fkey"
            columns: ["professor_responsavel_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "lessons_professor_responsavel_id_fkey"
            columns: ["professor_responsavel_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "lessons_professor_responsavel_id_fkey"
            columns: ["professor_responsavel_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "lessons_professor_responsavel_id_fkey"
            columns: ["professor_responsavel_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      logos: {
        Row: {
          ativo: boolean | null
          created_at: string | null
          descricao: string | null
          id: string
          nome: string
          url: string
        }
        Insert: {
          ativo?: boolean | null
          created_at?: string | null
          descricao?: string | null
          id?: string
          nome: string
          url: string
        }
        Update: {
          ativo?: boolean | null
          created_at?: string | null
          descricao?: string | null
          id?: string
          nome?: string
          url?: string
        }
        Relationships: []
      }
      manutencoes_instrumentos: {
        Row: {
          created_at: string | null
          data_entrada: string | null
          data_saida_prevista: string | null
          data_saida_real: string | null
          descricao_problema: string | null
          descricao_servico: string | null
          id: string
          instrumento_fisico_id: string | null
          observacoes: string | null
          status: string | null
          tecnico_responsavel: string | null
          tipo_manutencao: string | null
          updated_at: string | null
          valor_servico: number | null
        }
        Insert: {
          created_at?: string | null
          data_entrada?: string | null
          data_saida_prevista?: string | null
          data_saida_real?: string | null
          descricao_problema?: string | null
          descricao_servico?: string | null
          id?: string
          instrumento_fisico_id?: string | null
          observacoes?: string | null
          status?: string | null
          tecnico_responsavel?: string | null
          tipo_manutencao?: string | null
          updated_at?: string | null
          valor_servico?: number | null
        }
        Update: {
          created_at?: string | null
          data_entrada?: string | null
          data_saida_prevista?: string | null
          data_saida_real?: string | null
          descricao_problema?: string | null
          descricao_servico?: string | null
          id?: string
          instrumento_fisico_id?: string | null
          observacoes?: string | null
          status?: string | null
          tecnico_responsavel?: string | null
          tipo_manutencao?: string | null
          updated_at?: string | null
          valor_servico?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "manutencoes_instrumentos_instrumento_fisico_id_fkey"
            columns: ["instrumento_fisico_id"]
            isOneToOne: false
            referencedRelation: "instrumentos_fisicos"
            referencedColumns: ["id"]
          },
        ]
      }
      materiais_apoio: {
        Row: {
          ativo: boolean | null
          autor: string | null
          categoria: string | null
          created_at: string | null
          descricao: string | null
          downloads_count: number | null
          duracao_segundos: number | null
          id: string
          instrumento_relacionado_id: string | null
          licenca: string | null
          metodologia_relacionada_id: string | null
          modulo_relacionado_id: string | null
          nivel: string | null
          tags: string[] | null
          tamanho_arquivo_mb: number | null
          tipo: string
          titulo: string
          url_arquivo: string | null
          visualizacoes: number | null
        }
        Insert: {
          ativo?: boolean | null
          autor?: string | null
          categoria?: string | null
          created_at?: string | null
          descricao?: string | null
          downloads_count?: number | null
          duracao_segundos?: number | null
          id?: string
          instrumento_relacionado_id?: string | null
          licenca?: string | null
          metodologia_relacionada_id?: string | null
          modulo_relacionado_id?: string | null
          nivel?: string | null
          tags?: string[] | null
          tamanho_arquivo_mb?: number | null
          tipo: string
          titulo: string
          url_arquivo?: string | null
          visualizacoes?: number | null
        }
        Update: {
          ativo?: boolean | null
          autor?: string | null
          categoria?: string | null
          created_at?: string | null
          descricao?: string | null
          downloads_count?: number | null
          duracao_segundos?: number | null
          id?: string
          instrumento_relacionado_id?: string | null
          licenca?: string | null
          metodologia_relacionada_id?: string | null
          modulo_relacionado_id?: string | null
          nivel?: string | null
          tags?: string[] | null
          tamanho_arquivo_mb?: number | null
          tipo?: string
          titulo?: string
          url_arquivo?: string | null
          visualizacoes?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "materiais_apoio_instrumento_relacionado_id_fkey"
            columns: ["instrumento_relacionado_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "materiais_apoio_instrumento_relacionado_id_fkey"
            columns: ["instrumento_relacionado_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "materiais_apoio_instrumento_relacionado_id_fkey"
            columns: ["instrumento_relacionado_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "materiais_apoio_instrumento_relacionado_id_fkey"
            columns: ["instrumento_relacionado_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "materiais_apoio_metodologia_relacionada_id_fkey"
            columns: ["metodologia_relacionada_id"]
            isOneToOne: false
            referencedRelation: "metodologias_ensino"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "materiais_apoio_metodologia_relacionada_id_fkey"
            columns: ["metodologia_relacionada_id"]
            isOneToOne: false
            referencedRelation: "vw_metodologias_stats"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "materiais_apoio_modulo_relacionado_id_fkey"
            columns: ["modulo_relacionado_id"]
            isOneToOne: false
            referencedRelation: "modulos"
            referencedColumns: ["id"]
          },
        ]
      }
      matriculas: {
        Row: {
          aluno_id: string
          atualizado_em: string | null
          criado_em: string | null
          data_cancelamento: string | null
          data_inicio_aulas: string | null
          data_matricula: string | null
          desconto_aplicado: number | null
          forma_pagamento: string | null
          id: string
          motivo_cancelamento: string | null
          notas_professor: string | null
          observacoes: string | null
          status: string | null
          turma_id: string
          valor_acordado: number | null
        }
        Insert: {
          aluno_id: string
          atualizado_em?: string | null
          criado_em?: string | null
          data_cancelamento?: string | null
          data_inicio_aulas?: string | null
          data_matricula?: string | null
          desconto_aplicado?: number | null
          forma_pagamento?: string | null
          id?: string
          motivo_cancelamento?: string | null
          notas_professor?: string | null
          observacoes?: string | null
          status?: string | null
          turma_id: string
          valor_acordado?: number | null
        }
        Update: {
          aluno_id?: string
          atualizado_em?: string | null
          criado_em?: string | null
          data_cancelamento?: string | null
          data_inicio_aulas?: string | null
          data_matricula?: string | null
          desconto_aplicado?: number | null
          forma_pagamento?: string | null
          id?: string
          motivo_cancelamento?: string | null
          notas_professor?: string | null
          observacoes?: string | null
          status?: string | null
          turma_id?: string
          valor_acordado?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "matriculas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "admin_alunos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "matriculas_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "alunos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "matriculas_turma_id_fkey"
            columns: ["turma_id"]
            isOneToOne: false
            referencedRelation: "turmas"
            referencedColumns: ["id"]
          },
        ]
      }
      metodologias_ensino: {
        Row: {
          ano_desenvolvimento: number | null
          aplicacao_brasileira: string | null
          ativa: boolean | null
          bibliografia: string | null
          conteudo_completo: string | null
          created_at: string | null
          criador_principal: string | null
          descricao_resumo: string | null
          faixa_etaria_ideal: string | null
          id: string
          instrumentos_principais: string[] | null
          limitacoes: string[] | null
          nome: string
          origem: string | null
          principios_fundamentais: string[] | null
          url_material_apoio: string | null
          vantagens: string[] | null
        }
        Insert: {
          ano_desenvolvimento?: number | null
          aplicacao_brasileira?: string | null
          ativa?: boolean | null
          bibliografia?: string | null
          conteudo_completo?: string | null
          created_at?: string | null
          criador_principal?: string | null
          descricao_resumo?: string | null
          faixa_etaria_ideal?: string | null
          id?: string
          instrumentos_principais?: string[] | null
          limitacoes?: string[] | null
          nome: string
          origem?: string | null
          principios_fundamentais?: string[] | null
          url_material_apoio?: string | null
          vantagens?: string[] | null
        }
        Update: {
          ano_desenvolvimento?: number | null
          aplicacao_brasileira?: string | null
          ativa?: boolean | null
          bibliografia?: string | null
          conteudo_completo?: string | null
          created_at?: string | null
          criador_principal?: string | null
          descricao_resumo?: string | null
          faixa_etaria_ideal?: string | null
          id?: string
          instrumentos_principais?: string[] | null
          limitacoes?: string[] | null
          nome?: string
          origem?: string | null
          principios_fundamentais?: string[] | null
          url_material_apoio?: string | null
          vantagens?: string[] | null
        }
        Relationships: []
      }
      migration_log: {
        Row: {
          created_at: string | null
          details: Json | null
          id: string
          migration_name: string
          status: string | null
        }
        Insert: {
          created_at?: string | null
          details?: Json | null
          id?: string
          migration_name: string
          status?: string | null
        }
        Update: {
          created_at?: string | null
          details?: Json | null
          id?: string
          migration_name?: string
          status?: string | null
        }
        Relationships: []
      }
      modules: {
        Row: {
          created_at: string | null
          description: string | null
          duration_hours: number | null
          id: string
          instrument_category: string | null
          is_active: boolean | null
          is_premium: boolean | null
          lessons_count: number | null
          level_required: string | null
          order_index: number | null
          slug: string
          thumbnail_url: string | null
          title: string
          updated_at: string | null
        }
        Insert: {
          created_at?: string | null
          description?: string | null
          duration_hours?: number | null
          id?: string
          instrument_category?: string | null
          is_active?: boolean | null
          is_premium?: boolean | null
          lessons_count?: number | null
          level_required?: string | null
          order_index?: number | null
          slug: string
          thumbnail_url?: string | null
          title: string
          updated_at?: string | null
        }
        Update: {
          created_at?: string | null
          description?: string | null
          duration_hours?: number | null
          id?: string
          instrument_category?: string | null
          is_active?: boolean | null
          is_premium?: boolean | null
          lessons_count?: number | null
          level_required?: string | null
          order_index?: number | null
          slug?: string
          thumbnail_url?: string | null
          title?: string
          updated_at?: string | null
        }
        Relationships: []
      }
      modulos: {
        Row: {
          ativo: boolean | null
          created_at: string | null
          descricao: string | null
          id: string
          nome: string
          ordem: number | null
        }
        Insert: {
          ativo?: boolean | null
          created_at?: string | null
          descricao?: string | null
          id?: string
          nome: string
          ordem?: number | null
        }
        Update: {
          ativo?: boolean | null
          created_at?: string | null
          descricao?: string | null
          id?: string
          nome?: string
          ordem?: number | null
        }
        Relationships: []
      }
      permission_templates: {
        Row: {
          created_at: string | null
          description: string | null
          id: string
          name: string
          permissions: Json
          role_types: string[]
          updated_at: string | null
        }
        Insert: {
          created_at?: string | null
          description?: string | null
          id?: string
          name: string
          permissions: Json
          role_types: string[]
          updated_at?: string | null
        }
        Update: {
          created_at?: string | null
          description?: string | null
          id?: string
          name?: string
          permissions?: Json
          role_types?: string[]
          updated_at?: string | null
        }
        Relationships: []
      }
      permissions: {
        Row: {
          created_at: string | null
          description: string | null
          id: number
          name: string
        }
        Insert: {
          created_at?: string | null
          description?: string | null
          id?: number
          name: string
        }
        Update: {
          created_at?: string | null
          description?: string | null
          id?: number
          name?: string
        }
        Relationships: []
      }
      portfolio_evidencias: {
        Row: {
          aprovado: boolean | null
          aprovado_por: string | null
          arquivo_tamanho: number | null
          arquivo_tipo: string | null
          arquivo_url: string | null
          autoavaliacao: Json | null
          conteudo_texto: string | null
          created_at: string | null
          data_aprovacao: string | null
          data_criacao: string | null
          data_evento: string | null
          descricao: string | null
          feedback_professor: string | null
          id: string
          link_externo: string | null
          metadata: Json | null
          ordem: number | null
          portfolio_id: string | null
          tipo_evidencia: string
          titulo: string
          updated_at: string | null
        }
        Insert: {
          aprovado?: boolean | null
          aprovado_por?: string | null
          arquivo_tamanho?: number | null
          arquivo_tipo?: string | null
          arquivo_url?: string | null
          autoavaliacao?: Json | null
          conteudo_texto?: string | null
          created_at?: string | null
          data_aprovacao?: string | null
          data_criacao?: string | null
          data_evento?: string | null
          descricao?: string | null
          feedback_professor?: string | null
          id?: string
          link_externo?: string | null
          metadata?: Json | null
          ordem?: number | null
          portfolio_id?: string | null
          tipo_evidencia: string
          titulo: string
          updated_at?: string | null
        }
        Update: {
          aprovado?: boolean | null
          aprovado_por?: string | null
          arquivo_tamanho?: number | null
          arquivo_tipo?: string | null
          arquivo_url?: string | null
          autoavaliacao?: Json | null
          conteudo_texto?: string | null
          created_at?: string | null
          data_aprovacao?: string | null
          data_criacao?: string | null
          data_evento?: string | null
          descricao?: string | null
          feedback_professor?: string | null
          id?: string
          link_externo?: string | null
          metadata?: Json | null
          ordem?: number | null
          portfolio_id?: string | null
          tipo_evidencia?: string
          titulo?: string
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "portfolio_evidencias_portfolio_id_fkey"
            columns: ["portfolio_id"]
            isOneToOne: false
            referencedRelation: "portfolios"
            referencedColumns: ["id"]
          },
        ]
      }
      portfolios: {
        Row: {
          competencia_id: string | null
          created_at: string | null
          data_fim: string | null
          data_inicio: string | null
          descricao: string | null
          id: string
          metodologia_id: string | null
          objetivos: string[] | null
          reflexoes_finais: string | null
          reflexoes_iniciais: string | null
          status: string | null
          tags: string[] | null
          tipo: string | null
          titulo: string
          updated_at: string | null
          user_id: string | null
          visibilidade: string | null
        }
        Insert: {
          competencia_id?: string | null
          created_at?: string | null
          data_fim?: string | null
          data_inicio?: string | null
          descricao?: string | null
          id?: string
          metodologia_id?: string | null
          objetivos?: string[] | null
          reflexoes_finais?: string | null
          reflexoes_iniciais?: string | null
          status?: string | null
          tags?: string[] | null
          tipo?: string | null
          titulo: string
          updated_at?: string | null
          user_id?: string | null
          visibilidade?: string | null
        }
        Update: {
          competencia_id?: string | null
          created_at?: string | null
          data_fim?: string | null
          data_inicio?: string | null
          descricao?: string | null
          id?: string
          metodologia_id?: string | null
          objetivos?: string[] | null
          reflexoes_finais?: string | null
          reflexoes_iniciais?: string | null
          status?: string | null
          tags?: string[] | null
          tipo?: string | null
          titulo?: string
          updated_at?: string | null
          user_id?: string | null
          visibilidade?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "portfolios_competencia_id_fkey"
            columns: ["competencia_id"]
            isOneToOne: false
            referencedRelation: "alpha_competencias"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "portfolios_metodologia_id_fkey"
            columns: ["metodologia_id"]
            isOneToOne: false
            referencedRelation: "alpha_metodologias"
            referencedColumns: ["id"]
          },
        ]
      }
      presencas: {
        Row: {
          criado_em: string | null
          data_aula: string
          id: string
          justificativa: string | null
          matricula_id: string
          observacoes: string | null
          presente: boolean | null
        }
        Insert: {
          criado_em?: string | null
          data_aula: string
          id?: string
          justificativa?: string | null
          matricula_id: string
          observacoes?: string | null
          presente?: boolean | null
        }
        Update: {
          criado_em?: string | null
          data_aula?: string
          id?: string
          justificativa?: string | null
          matricula_id?: string
          observacoes?: string | null
          presente?: boolean | null
        }
        Relationships: [
          {
            foreignKeyName: "presencas_matricula_id_fkey"
            columns: ["matricula_id"]
            isOneToOne: false
            referencedRelation: "matriculas"
            referencedColumns: ["id"]
          },
        ]
      }
      professor_instrumentos: {
        Row: {
          anos_experiencia: number | null
          ativo: boolean | null
          certificacoes: string | null
          criado_em: string | null
          id: string
          instrumento_id: string
          nivel_ensino: string | null
          professor_id: string
        }
        Insert: {
          anos_experiencia?: number | null
          ativo?: boolean | null
          certificacoes?: string | null
          criado_em?: string | null
          id?: string
          instrumento_id: string
          nivel_ensino?: string | null
          professor_id: string
        }
        Update: {
          anos_experiencia?: number | null
          ativo?: boolean | null
          certificacoes?: string | null
          criado_em?: string | null
          id?: string
          instrumento_id?: string
          nivel_ensino?: string | null
          professor_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "professor_instrumentos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "professor_instrumentos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "professor_instrumentos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "professor_instrumentos_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "professor_instrumentos_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "admin_professores"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "professor_instrumentos_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "professores"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "professor_instrumentos_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "view_professor_dashboard"
            referencedColumns: ["id"]
          },
        ]
      }
      professores: {
        Row: {
          ativo: boolean | null
          biografia: string | null
          criado_em: string | null
          especialidades: string[] | null
          formacao: string | null
          id: string
        }
        Insert: {
          ativo?: boolean | null
          biografia?: string | null
          criado_em?: string | null
          especialidades?: string[] | null
          formacao?: string | null
          id: string
        }
        Update: {
          ativo?: boolean | null
          biografia?: string | null
          criado_em?: string | null
          especialidades?: string[] | null
          formacao?: string | null
          id?: string
        }
        Relationships: [
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      professores_categorias: {
        Row: {
          ativo: boolean | null
          cor: string | null
          criado_em: string | null
          descricao: string | null
          icone: string | null
          id: string
          nome: string
          ordem: number | null
        }
        Insert: {
          ativo?: boolean | null
          cor?: string | null
          criado_em?: string | null
          descricao?: string | null
          icone?: string | null
          id?: string
          nome: string
          ordem?: number | null
        }
        Update: {
          ativo?: boolean | null
          cor?: string | null
          criado_em?: string | null
          descricao?: string | null
          icone?: string | null
          id?: string
          nome?: string
          ordem?: number | null
        }
        Relationships: []
      }
      professores_conteudos: {
        Row: {
          ativo: boolean | null
          categoria: string | null
          categoria_id: string | null
          criado_em: string | null
          criado_por: string | null
          descricao: string | null
          destaque: boolean | null
          downloads: number | null
          duracao_minutos: number | null
          editado_em: string | null
          editado_por: string | null
          id: string
          nivel_dificuldade: string | null
          tags: string[] | null
          thumbnail_url: string | null
          tipo: string
          titulo: string
          url_arquivo: string | null
          url_video: string | null
          visivel: boolean | null
          visualizacoes: number | null
        }
        Insert: {
          ativo?: boolean | null
          categoria?: string | null
          categoria_id?: string | null
          criado_em?: string | null
          criado_por?: string | null
          descricao?: string | null
          destaque?: boolean | null
          downloads?: number | null
          duracao_minutos?: number | null
          editado_em?: string | null
          editado_por?: string | null
          id?: string
          nivel_dificuldade?: string | null
          tags?: string[] | null
          thumbnail_url?: string | null
          tipo: string
          titulo: string
          url_arquivo?: string | null
          url_video?: string | null
          visivel?: boolean | null
          visualizacoes?: number | null
        }
        Update: {
          ativo?: boolean | null
          categoria?: string | null
          categoria_id?: string | null
          criado_em?: string | null
          criado_por?: string | null
          descricao?: string | null
          destaque?: boolean | null
          downloads?: number | null
          duracao_minutos?: number | null
          editado_em?: string | null
          editado_por?: string | null
          id?: string
          nivel_dificuldade?: string | null
          tags?: string[] | null
          thumbnail_url?: string | null
          tipo?: string
          titulo?: string
          url_arquivo?: string | null
          url_video?: string | null
          visivel?: boolean | null
          visualizacoes?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "professores_conteudos_categoria_id_fkey"
            columns: ["categoria_id"]
            isOneToOne: false
            referencedRelation: "professores_categorias"
            referencedColumns: ["id"]
          },
        ]
      }
      profiles: {
        Row: {
          avatar_url: string | null
          best_streak: number | null
          bio: string | null
          church_name: string | null
          city: string | null
          current_streak: number | null
          dob: string | null
          email: string | null
          full_name: string | null
          has_voted: boolean | null
          id: string
          instrument: string | null
          joined_at: string | null
          last_active: string | null
          lessons_completed: number | null
          modules_completed: number | null
          nome: string | null
          notification_enabled: boolean | null
          phone: string | null
          sound_enabled: boolean | null
          state: string | null
          theme_preference: string | null
          tipo_usuario: string | null
          total_points: number | null
          user_level: string | null
          voted_logo: string | null
        }
        Insert: {
          avatar_url?: string | null
          best_streak?: number | null
          bio?: string | null
          church_name?: string | null
          city?: string | null
          current_streak?: number | null
          dob?: string | null
          email?: string | null
          full_name?: string | null
          has_voted?: boolean | null
          id: string
          instrument?: string | null
          joined_at?: string | null
          last_active?: string | null
          lessons_completed?: number | null
          modules_completed?: number | null
          nome?: string | null
          notification_enabled?: boolean | null
          phone?: string | null
          sound_enabled?: boolean | null
          state?: string | null
          theme_preference?: string | null
          tipo_usuario?: string | null
          total_points?: number | null
          user_level?: string | null
          voted_logo?: string | null
        }
        Update: {
          avatar_url?: string | null
          best_streak?: number | null
          bio?: string | null
          church_name?: string | null
          city?: string | null
          current_streak?: number | null
          dob?: string | null
          email?: string | null
          full_name?: string | null
          has_voted?: boolean | null
          id?: string
          instrument?: string | null
          joined_at?: string | null
          last_active?: string | null
          lessons_completed?: number | null
          modules_completed?: number | null
          nome?: string | null
          notification_enabled?: boolean | null
          phone?: string | null
          sound_enabled?: boolean | null
          state?: string | null
          theme_preference?: string | null
          tipo_usuario?: string | null
          total_points?: number | null
          user_level?: string | null
          voted_logo?: string | null
        }
        Relationships: []
      }
      proposta_curricular: {
        Row: {
          adaptacoes_inclusivas: string[] | null
          carga_horaria_semanal: number | null
          carga_horaria_total: number | null
          competencias_bncc: string[] | null
          conteudos_essenciais: Json | null
          created_at: string | null
          id: string
          instrumentos_avaliacao: string[] | null
          metodologia_principal: string | null
          metodologias_integradas: string[] | null
          nivel_ensino: string | null
          objetivos_aprendizagem: string[] | null
          prerequisitos: string[] | null
          progressao_curricular: Json | null
          projetos_integradores: Json | null
          recursos_necessarios: string[] | null
          sequencia_didatica: Json | null
          serie_ano: string | null
          status: string | null
          trimestre_bimestre: string | null
          updated_at: string | null
          validacao_pedagogica: boolean | null
        }
        Insert: {
          adaptacoes_inclusivas?: string[] | null
          carga_horaria_semanal?: number | null
          carga_horaria_total?: number | null
          competencias_bncc?: string[] | null
          conteudos_essenciais?: Json | null
          created_at?: string | null
          id?: string
          instrumentos_avaliacao?: string[] | null
          metodologia_principal?: string | null
          metodologias_integradas?: string[] | null
          nivel_ensino?: string | null
          objetivos_aprendizagem?: string[] | null
          prerequisitos?: string[] | null
          progressao_curricular?: Json | null
          projetos_integradores?: Json | null
          recursos_necessarios?: string[] | null
          sequencia_didatica?: Json | null
          serie_ano?: string | null
          status?: string | null
          trimestre_bimestre?: string | null
          updated_at?: string | null
          validacao_pedagogica?: boolean | null
        }
        Update: {
          adaptacoes_inclusivas?: string[] | null
          carga_horaria_semanal?: number | null
          carga_horaria_total?: number | null
          competencias_bncc?: string[] | null
          conteudos_essenciais?: Json | null
          created_at?: string | null
          id?: string
          instrumentos_avaliacao?: string[] | null
          metodologia_principal?: string | null
          metodologias_integradas?: string[] | null
          nivel_ensino?: string | null
          objetivos_aprendizagem?: string[] | null
          prerequisitos?: string[] | null
          progressao_curricular?: Json | null
          projetos_integradores?: Json | null
          recursos_necessarios?: string[] | null
          sequencia_didatica?: Json | null
          serie_ano?: string | null
          status?: string | null
          trimestre_bimestre?: string | null
          updated_at?: string | null
          validacao_pedagogica?: boolean | null
        }
        Relationships: [
          {
            foreignKeyName: "proposta_curricular_metodologia_principal_fkey"
            columns: ["metodologia_principal"]
            isOneToOne: false
            referencedRelation: "alpha_metodologias"
            referencedColumns: ["id"]
          },
        ]
      }
      qr_codes: {
        Row: {
          aula_id: string | null
          code: string
          created_at: string | null
          created_by: string | null
          current_scans: number | null
          expires_at: string
          id: string
          instrument_id: string | null
          is_active: boolean | null
          max_scans: number | null
          metadata: Json | null
          type: string
          updated_at: string | null
        }
        Insert: {
          aula_id?: string | null
          code: string
          created_at?: string | null
          created_by?: string | null
          current_scans?: number | null
          expires_at: string
          id?: string
          instrument_id?: string | null
          is_active?: boolean | null
          max_scans?: number | null
          metadata?: Json | null
          type: string
          updated_at?: string | null
        }
        Update: {
          aula_id?: string | null
          code?: string
          created_at?: string | null
          created_by?: string | null
          current_scans?: number | null
          expires_at?: string
          id?: string
          instrument_id?: string | null
          is_active?: boolean | null
          max_scans?: number | null
          metadata?: Json | null
          type?: string
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "qr_codes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "qr_codes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_instrument_id_fkey"
            columns: ["instrument_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_instrument_id_fkey"
            columns: ["instrument_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "qr_codes_instrument_id_fkey"
            columns: ["instrument_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_instrument_id_fkey"
            columns: ["instrument_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      qr_scans: {
        Row: {
          id: string
          ip_address: unknown | null
          location_data: Json | null
          metadata: Json | null
          points_awarded: number | null
          qr_code_id: string | null
          result: string
          scanned_at: string | null
          user_agent: string | null
          user_id: string | null
        }
        Insert: {
          id?: string
          ip_address?: unknown | null
          location_data?: Json | null
          metadata?: Json | null
          points_awarded?: number | null
          qr_code_id?: string | null
          result: string
          scanned_at?: string | null
          user_agent?: string | null
          user_id?: string | null
        }
        Update: {
          id?: string
          ip_address?: unknown | null
          location_data?: Json | null
          metadata?: Json | null
          points_awarded?: number | null
          qr_code_id?: string | null
          result?: string
          scanned_at?: string | null
          user_agent?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "qr_scans_qr_code_id_fkey"
            columns: ["qr_code_id"]
            isOneToOne: false
            referencedRelation: "qr_codes"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_scans_qr_code_id_fkey"
            columns: ["qr_code_id"]
            isOneToOne: false
            referencedRelation: "view_qr_analytics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_scans_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_scans_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "qr_scans_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_scans_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_scans_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_scans_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      referenciais_internacionais: {
        Row: {
          adaptabilidade_brasil: string | null
          ano_implementacao: number | null
          avaliacao_metodos: Json | null
          contatos_institucionais: Json | null
          created_at: string | null
          descricao_abordagem: string | null
          estrutura_curricular: Json | null
          id: string
          links_recursos: string[] | null
          metodologias_relacionadas: string[] | null
          nome_referencial: string
          pais_origem: string
          principios_pedagogicos: string[] | null
          referencias_bibliograficas: string[] | null
          resultados_pesquisa: string | null
          tipo: string | null
        }
        Insert: {
          adaptabilidade_brasil?: string | null
          ano_implementacao?: number | null
          avaliacao_metodos?: Json | null
          contatos_institucionais?: Json | null
          created_at?: string | null
          descricao_abordagem?: string | null
          estrutura_curricular?: Json | null
          id?: string
          links_recursos?: string[] | null
          metodologias_relacionadas?: string[] | null
          nome_referencial: string
          pais_origem: string
          principios_pedagogicos?: string[] | null
          referencias_bibliograficas?: string[] | null
          resultados_pesquisa?: string | null
          tipo?: string | null
        }
        Update: {
          adaptabilidade_brasil?: string | null
          ano_implementacao?: number | null
          avaliacao_metodos?: Json | null
          contatos_institucionais?: Json | null
          created_at?: string | null
          descricao_abordagem?: string | null
          estrutura_curricular?: Json | null
          id?: string
          links_recursos?: string[] | null
          metodologias_relacionadas?: string[] | null
          nome_referencial?: string
          pais_origem?: string
          principios_pedagogicos?: string[] | null
          referencias_bibliograficas?: string[] | null
          resultados_pesquisa?: string | null
          tipo?: string | null
        }
        Relationships: []
      }
      repertorio_musical: {
        Row: {
          artista: string | null
          ativo: boolean | null
          cifra: string | null
          created_at: string | null
          dificuldade_tecnica: number | null
          duracao_segundos: number | null
          eh_dominio_publico: boolean | null
          genero: string | null
          id: string
          instrumento_principal_id: string | null
          letra: string | null
          modulo_sugerido_id: string | null
          nivel: string | null
          observacoes_professor: string | null
          tags: string[] | null
          tempo_bpm: number | null
          titulo: string
          tonalidade: string | null
          url_audio: string | null
          url_partitura: string | null
          url_playback: string | null
          url_video_tutorial: string | null
        }
        Insert: {
          artista?: string | null
          ativo?: boolean | null
          cifra?: string | null
          created_at?: string | null
          dificuldade_tecnica?: number | null
          duracao_segundos?: number | null
          eh_dominio_publico?: boolean | null
          genero?: string | null
          id?: string
          instrumento_principal_id?: string | null
          letra?: string | null
          modulo_sugerido_id?: string | null
          nivel?: string | null
          observacoes_professor?: string | null
          tags?: string[] | null
          tempo_bpm?: number | null
          titulo: string
          tonalidade?: string | null
          url_audio?: string | null
          url_partitura?: string | null
          url_playback?: string | null
          url_video_tutorial?: string | null
        }
        Update: {
          artista?: string | null
          ativo?: boolean | null
          cifra?: string | null
          created_at?: string | null
          dificuldade_tecnica?: number | null
          duracao_segundos?: number | null
          eh_dominio_publico?: boolean | null
          genero?: string | null
          id?: string
          instrumento_principal_id?: string | null
          letra?: string | null
          modulo_sugerido_id?: string | null
          nivel?: string | null
          observacoes_professor?: string | null
          tags?: string[] | null
          tempo_bpm?: number | null
          titulo?: string
          tonalidade?: string | null
          url_audio?: string | null
          url_partitura?: string | null
          url_playback?: string | null
          url_video_tutorial?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "repertorio_musical_instrumento_principal_id_fkey"
            columns: ["instrumento_principal_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "repertorio_musical_instrumento_principal_id_fkey"
            columns: ["instrumento_principal_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "repertorio_musical_instrumento_principal_id_fkey"
            columns: ["instrumento_principal_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "repertorio_musical_instrumento_principal_id_fkey"
            columns: ["instrumento_principal_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "repertorio_musical_modulo_sugerido_id_fkey"
            columns: ["modulo_sugerido_id"]
            isOneToOne: false
            referencedRelation: "modulos"
            referencedColumns: ["id"]
          },
        ]
      }
      role_permissions: {
        Row: {
          permission_id: number
          role_id: number
        }
        Insert: {
          permission_id: number
          role_id: number
        }
        Update: {
          permission_id?: number
          role_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "role_permissions_permission_id_fkey"
            columns: ["permission_id"]
            isOneToOne: false
            referencedRelation: "permissions"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "role_permissions_role_id_fkey"
            columns: ["role_id"]
            isOneToOne: false
            referencedRelation: "roles"
            referencedColumns: ["id"]
          },
        ]
      }
      roles: {
        Row: {
          created_at: string | null
          description: string | null
          id: number
          name: string
        }
        Insert: {
          created_at?: string | null
          description?: string | null
          id?: number
          name: string
        }
        Update: {
          created_at?: string | null
          description?: string | null
          id?: number
          name?: string
        }
        Relationships: []
      }
      rubricas_avaliacao: {
        Row: {
          ativo: boolean | null
          created_at: string | null
          criterios: Json
          descricao: string | null
          id: string
          metodologia_id: string | null
          niveis_desempenho: Json
          nome: string
          peso_total: number | null
          tipo: string
          updated_at: string | null
        }
        Insert: {
          ativo?: boolean | null
          created_at?: string | null
          criterios?: Json
          descricao?: string | null
          id?: string
          metodologia_id?: string | null
          niveis_desempenho?: Json
          nome: string
          peso_total?: number | null
          tipo: string
          updated_at?: string | null
        }
        Update: {
          ativo?: boolean | null
          created_at?: string | null
          criterios?: Json
          descricao?: string | null
          id?: string
          metodologia_id?: string | null
          niveis_desempenho?: Json
          nome?: string
          peso_total?: number | null
          tipo?: string
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "rubricas_avaliacao_metodologia_id_fkey"
            columns: ["metodologia_id"]
            isOneToOne: false
            referencedRelation: "alpha_metodologias"
            referencedColumns: ["id"]
          },
        ]
      }
      sequencias_didaticas: {
        Row: {
          atividade_principal: string | null
          created_at: string | null
          criado_por_id: string | null
          duracao_semanas: number | null
          faixa_etaria: string | null
          id: string
          jogo_dinamica: string | null
          material_necessario: string[] | null
          metodologia_id: string | null
          objetivos: string[] | null
          observacoes: string | null
          roda_atividade: string | null
          semana_numero: number | null
          titulo: string
        }
        Insert: {
          atividade_principal?: string | null
          created_at?: string | null
          criado_por_id?: string | null
          duracao_semanas?: number | null
          faixa_etaria?: string | null
          id?: string
          jogo_dinamica?: string | null
          material_necessario?: string[] | null
          metodologia_id?: string | null
          objetivos?: string[] | null
          observacoes?: string | null
          roda_atividade?: string | null
          semana_numero?: number | null
          titulo: string
        }
        Update: {
          atividade_principal?: string | null
          created_at?: string | null
          criado_por_id?: string | null
          duracao_semanas?: number | null
          faixa_etaria?: string | null
          id?: string
          jogo_dinamica?: string | null
          material_necessario?: string[] | null
          metodologia_id?: string | null
          objetivos?: string[] | null
          observacoes?: string | null
          roda_atividade?: string | null
          semana_numero?: number | null
          titulo?: string
        }
        Relationships: [
          {
            foreignKeyName: "sequencias_didaticas_criado_por_id_fkey"
            columns: ["criado_por_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "sequencias_didaticas_criado_por_id_fkey"
            columns: ["criado_por_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "sequencias_didaticas_criado_por_id_fkey"
            columns: ["criado_por_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "sequencias_didaticas_criado_por_id_fkey"
            columns: ["criado_por_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "sequencias_didaticas_criado_por_id_fkey"
            columns: ["criado_por_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "sequencias_didaticas_criado_por_id_fkey"
            columns: ["criado_por_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "sequencias_didaticas_metodologia_id_fkey"
            columns: ["metodologia_id"]
            isOneToOne: false
            referencedRelation: "metodologias_ensino"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "sequencias_didaticas_metodologia_id_fkey"
            columns: ["metodologia_id"]
            isOneToOne: false
            referencedRelation: "vw_metodologias_stats"
            referencedColumns: ["id"]
          },
        ]
      }
      sequencias_didaticas_expandidas: {
        Row: {
          adaptacoes_niveis: Json | null
          autor_criador: string | null
          avaliacao_formativa: Json | null
          avaliacao_somativa: Json | null
          competencia_foco: string | null
          created_at: string | null
          downloads_utilizacoes: number | null
          duracao_aulas: number | null
          duracao_semanas: number | null
          espacos_utilizados: string[] | null
          extensoes_projetos: string[] | null
          feedback_professores: Json | null
          id: string
          materiais_necessarios: string[] | null
          metodologia_base: string | null
          nivel_ensino: string | null
          objetivo_geral: string | null
          objetivos_especificos: string[] | null
          produtos_finais: string[] | null
          referencias_apoio: string[] | null
          sequencia_atividades: Json | null
          status_validacao: string | null
          tecnologias_integradas: string[] | null
          titulo: string
          updated_at: string | null
        }
        Insert: {
          adaptacoes_niveis?: Json | null
          autor_criador?: string | null
          avaliacao_formativa?: Json | null
          avaliacao_somativa?: Json | null
          competencia_foco?: string | null
          created_at?: string | null
          downloads_utilizacoes?: number | null
          duracao_aulas?: number | null
          duracao_semanas?: number | null
          espacos_utilizados?: string[] | null
          extensoes_projetos?: string[] | null
          feedback_professores?: Json | null
          id?: string
          materiais_necessarios?: string[] | null
          metodologia_base?: string | null
          nivel_ensino?: string | null
          objetivo_geral?: string | null
          objetivos_especificos?: string[] | null
          produtos_finais?: string[] | null
          referencias_apoio?: string[] | null
          sequencia_atividades?: Json | null
          status_validacao?: string | null
          tecnologias_integradas?: string[] | null
          titulo: string
          updated_at?: string | null
        }
        Update: {
          adaptacoes_niveis?: Json | null
          autor_criador?: string | null
          avaliacao_formativa?: Json | null
          avaliacao_somativa?: Json | null
          competencia_foco?: string | null
          created_at?: string | null
          downloads_utilizacoes?: number | null
          duracao_aulas?: number | null
          duracao_semanas?: number | null
          espacos_utilizados?: string[] | null
          extensoes_projetos?: string[] | null
          feedback_professores?: Json | null
          id?: string
          materiais_necessarios?: string[] | null
          metodologia_base?: string | null
          nivel_ensino?: string | null
          objetivo_geral?: string | null
          objetivos_especificos?: string[] | null
          produtos_finais?: string[] | null
          referencias_apoio?: string[] | null
          sequencia_atividades?: Json | null
          status_validacao?: string | null
          tecnologias_integradas?: string[] | null
          titulo?: string
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "sequencias_didaticas_expandidas_competencia_foco_fkey"
            columns: ["competencia_foco"]
            isOneToOne: false
            referencedRelation: "alpha_competencias"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "sequencias_didaticas_expandidas_metodologia_base_fkey"
            columns: ["metodologia_base"]
            isOneToOne: false
            referencedRelation: "alpha_metodologias"
            referencedColumns: ["id"]
          },
        ]
      }
      sistema_presto: {
        Row: {
          configuracoes_interativas: Json | null
          conteudo_digital: Json | null
          created_at: string | null
          data_ultimo_acesso: string | null
          descricao: string | null
          feedback_usuario: string | null
          id: string
          metodologia_associada: string | null
          metricas_engajamento: Json | null
          nivel_dificuldade: number | null
          progresso_usuario: Json | null
          status: string | null
          tempo_uso_total: number | null
          tipo_recurso: string | null
          titulo: string
          updated_at: string | null
          user_id: string | null
        }
        Insert: {
          configuracoes_interativas?: Json | null
          conteudo_digital?: Json | null
          created_at?: string | null
          data_ultimo_acesso?: string | null
          descricao?: string | null
          feedback_usuario?: string | null
          id?: string
          metodologia_associada?: string | null
          metricas_engajamento?: Json | null
          nivel_dificuldade?: number | null
          progresso_usuario?: Json | null
          status?: string | null
          tempo_uso_total?: number | null
          tipo_recurso?: string | null
          titulo: string
          updated_at?: string | null
          user_id?: string | null
        }
        Update: {
          configuracoes_interativas?: Json | null
          conteudo_digital?: Json | null
          created_at?: string | null
          data_ultimo_acesso?: string | null
          descricao?: string | null
          feedback_usuario?: string | null
          id?: string
          metodologia_associada?: string | null
          metricas_engajamento?: Json | null
          nivel_dificuldade?: number | null
          progresso_usuario?: Json | null
          status?: string | null
          tempo_uso_total?: number | null
          tipo_recurso?: string | null
          titulo?: string
          updated_at?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "sistema_presto_metodologia_associada_fkey"
            columns: ["metodologia_associada"]
            isOneToOne: false
            referencedRelation: "alpha_metodologias"
            referencedColumns: ["id"]
          },
        ]
      }
      trigger_logs: {
        Row: {
          created_at: string | null
          error_details: string | null
          event_type: string
          id: string
          message: string | null
          trigger_name: string
          user_id: string | null
        }
        Insert: {
          created_at?: string | null
          error_details?: string | null
          event_type: string
          id?: string
          message?: string | null
          trigger_name: string
          user_id?: string | null
        }
        Update: {
          created_at?: string | null
          error_details?: string | null
          event_type?: string
          id?: string
          message?: string | null
          trigger_name?: string
          user_id?: string | null
        }
        Relationships: []
      }
      turma_alunos: {
        Row: {
          aluno_id: string | null
          id: string
          turma_id: string | null
        }
        Insert: {
          aluno_id?: string | null
          id?: string
          turma_id?: string | null
        }
        Update: {
          aluno_id?: string | null
          id?: string
          turma_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "turma_alunos_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "admin_alunos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "turma_alunos_aluno_id_fkey"
            columns: ["aluno_id"]
            isOneToOne: false
            referencedRelation: "alunos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "turma_alunos_turma_id_fkey"
            columns: ["turma_id"]
            isOneToOne: false
            referencedRelation: "turmas"
            referencedColumns: ["id"]
          },
        ]
      }
      turmas: {
        Row: {
          ativo: boolean | null
          atualizado_em: string | null
          criado_em: string | null
          data_fim: string | null
          data_inicio: string | null
          descricao: string | null
          horarios: Json | null
          id: string
          instrumento_id: string
          local: string | null
          material_necessario: string | null
          max_alunos: number | null
          min_alunos: number | null
          modalidade: string | null
          nivel: string
          nome: string
          observacoes: string | null
          pre_requisitos: string | null
          professor_id: string
          status: string | null
          valor_mensalidade: number | null
        }
        Insert: {
          ativo?: boolean | null
          atualizado_em?: string | null
          criado_em?: string | null
          data_fim?: string | null
          data_inicio?: string | null
          descricao?: string | null
          horarios?: Json | null
          id?: string
          instrumento_id: string
          local?: string | null
          material_necessario?: string | null
          max_alunos?: number | null
          min_alunos?: number | null
          modalidade?: string | null
          nivel?: string
          nome: string
          observacoes?: string | null
          pre_requisitos?: string | null
          professor_id: string
          status?: string | null
          valor_mensalidade?: number | null
        }
        Update: {
          ativo?: boolean | null
          atualizado_em?: string | null
          criado_em?: string | null
          data_fim?: string | null
          data_inicio?: string | null
          descricao?: string | null
          horarios?: Json | null
          id?: string
          instrumento_id?: string
          local?: string | null
          material_necessario?: string | null
          max_alunos?: number | null
          min_alunos?: number | null
          modalidade?: string | null
          nivel?: string
          nome?: string
          observacoes?: string | null
          pre_requisitos?: string | null
          professor_id?: string
          status?: string | null
          valor_mensalidade?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "turmas_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "turmas_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "turmas_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "turmas_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "turmas_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "admin_professores"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "turmas_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "professores"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "turmas_professor_id_fkey"
            columns: ["professor_id"]
            isOneToOne: false
            referencedRelation: "view_professor_dashboard"
            referencedColumns: ["id"]
          },
        ]
      }
      user_achievements: {
        Row: {
          achievement_id: string | null
          earned_at: string | null
          id: string
          points_earned: number | null
          user_id: string | null
        }
        Insert: {
          achievement_id?: string | null
          earned_at?: string | null
          id?: string
          points_earned?: number | null
          user_id?: string | null
        }
        Update: {
          achievement_id?: string | null
          earned_at?: string | null
          id?: string
          points_earned?: number | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_achievements_achievement_id_fkey"
            columns: ["achievement_id"]
            isOneToOne: false
            referencedRelation: "achievements"
            referencedColumns: ["id"]
          },
        ]
      }
      user_devotional_progress: {
        Row: {
          devotional_id: string | null
          id: string
          is_favorite: boolean | null
          notes: string | null
          read_at: string | null
          user_id: string | null
        }
        Insert: {
          devotional_id?: string | null
          id?: string
          is_favorite?: boolean | null
          notes?: string | null
          read_at?: string | null
          user_id?: string | null
        }
        Update: {
          devotional_id?: string | null
          id?: string
          is_favorite?: boolean | null
          notes?: string | null
          read_at?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_devotional_progress_devotional_id_fkey"
            columns: ["devotional_id"]
            isOneToOne: false
            referencedRelation: "devotional_content"
            referencedColumns: ["id"]
          },
        ]
      }
      user_notifications: {
        Row: {
          action_url: string | null
          created_at: string | null
          expires_at: string | null
          id: string
          is_push_sent: boolean | null
          is_read: boolean | null
          message: string
          metadata: Json | null
          read_at: string | null
          title: string
          type: string
          user_id: string | null
        }
        Insert: {
          action_url?: string | null
          created_at?: string | null
          expires_at?: string | null
          id?: string
          is_push_sent?: boolean | null
          is_read?: boolean | null
          message: string
          metadata?: Json | null
          read_at?: string | null
          title: string
          type: string
          user_id?: string | null
        }
        Update: {
          action_url?: string | null
          created_at?: string | null
          expires_at?: string | null
          id?: string
          is_push_sent?: boolean | null
          is_read?: boolean | null
          message?: string
          metadata?: Json | null
          read_at?: string | null
          title?: string
          type?: string
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_notifications_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_notifications_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "user_notifications_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_notifications_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_notifications_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_notifications_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      user_points_log: {
        Row: {
          action: string
          aula_id: string | null
          created_at: string | null
          id: string
          multiplier: number | null
          notes: string | null
          points_earned: number
          source_id: string | null
          source_type: string
          user_id: string | null
        }
        Insert: {
          action: string
          aula_id?: string | null
          created_at?: string | null
          id?: string
          multiplier?: number | null
          notes?: string | null
          points_earned: number
          source_id?: string | null
          source_type: string
          user_id?: string | null
        }
        Update: {
          action?: string
          aula_id?: string | null
          created_at?: string | null
          id?: string
          multiplier?: number | null
          notes?: string | null
          points_earned?: number
          source_id?: string | null
          source_type?: string
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_points_log_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_points_log_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "user_points_log_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_points_log_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_points_log_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_points_log_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_points_log_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "user_points_log_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_points_log_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_points_log_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_points_log_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      user_progress: {
        Row: {
          completed_at: string | null
          id: string
          is_completed: boolean | null
          lesson_id: string | null
          notes: string | null
          rating: number | null
          started_at: string | null
          user_id: string | null
          watch_time_seconds: number | null
        }
        Insert: {
          completed_at?: string | null
          id?: string
          is_completed?: boolean | null
          lesson_id?: string | null
          notes?: string | null
          rating?: number | null
          started_at?: string | null
          user_id?: string | null
          watch_time_seconds?: number | null
        }
        Update: {
          completed_at?: string | null
          id?: string
          is_completed?: boolean | null
          lesson_id?: string | null
          notes?: string | null
          rating?: number | null
          started_at?: string | null
          user_id?: string | null
          watch_time_seconds?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "user_progress_lesson_id_fkey"
            columns: ["lesson_id"]
            isOneToOne: false
            referencedRelation: "lessons"
            referencedColumns: ["id"]
          },
        ]
      }
      user_roles: {
        Row: {
          created_at: string | null
          expires_at: string | null
          granted_at: string | null
          granted_by: string | null
          id: string
          is_active: boolean | null
          metadata: Json | null
          permissions: Json | null
          role_level: number | null
          role_type: string
          updated_at: string | null
          user_id: string | null
        }
        Insert: {
          created_at?: string | null
          expires_at?: string | null
          granted_at?: string | null
          granted_by?: string | null
          id?: string
          is_active?: boolean | null
          metadata?: Json | null
          permissions?: Json | null
          role_level?: number | null
          role_type: string
          updated_at?: string | null
          user_id?: string | null
        }
        Update: {
          created_at?: string | null
          expires_at?: string | null
          granted_at?: string | null
          granted_by?: string | null
          id?: string
          is_active?: boolean | null
          metadata?: Json | null
          permissions?: Json | null
          role_level?: number | null
          role_type?: string
          updated_at?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_roles_granted_by_fkey"
            columns: ["granted_by"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_roles_granted_by_fkey"
            columns: ["granted_by"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "user_roles_granted_by_fkey"
            columns: ["granted_by"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_roles_granted_by_fkey"
            columns: ["granted_by"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_roles_granted_by_fkey"
            columns: ["granted_by"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_roles_granted_by_fkey"
            columns: ["granted_by"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_roles_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_roles_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "user_roles_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_roles_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_roles_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_roles_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      usuarios: {
        Row: {
          email: string | null
          id: string
          nome: string | null
          tipo: string | null
          turma_id: string | null
        }
        Insert: {
          email?: string | null
          id: string
          nome?: string | null
          tipo?: string | null
          turma_id?: string | null
        }
        Update: {
          email?: string | null
          id?: string
          nome?: string | null
          tipo?: string | null
          turma_id?: string | null
        }
        Relationships: []
      }
    }
    Views: {
      admin_alunos: {
        Row: {
          ativo: boolean | null
          city: string | null
          criado_em: string | null
          current_streak: number | null
          data_ingresso: string | null
          dob: string | null
          email: string | null
          full_name: string | null
          has_voted: boolean | null
          id: string | null
          instrumento: string | null
          joined_at: string | null
          last_active: string | null
          lessons_completed: number | null
          nivel: string | null
          nome: string | null
          perfil_completo: boolean | null
          phone: string | null
          state: string | null
          status_atividade: string | null
          total_points: number | null
          turma: string | null
          user_level: string | null
          voted_logo: string | null
        }
        Relationships: [
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_aluno_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      admin_professores: {
        Row: {
          ativo: boolean | null
          biografia: string | null
          criado_em: string | null
          current_streak: number | null
          email: string | null
          especialidades: string[] | null
          formacao: string | null
          full_name: string | null
          id: string | null
          joined_at: string | null
          last_active: string | null
          lessons_completed: number | null
          modules_completed: number | null
          nome: string | null
          phone: string | null
          status_atividade: string | null
          total_alunos: number | null
          total_conteudos: number | null
          total_points: number | null
          total_turmas: number | null
          user_level: string | null
        }
        Relationships: [
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      admin_usuarios_completos: {
        Row: {
          best_streak: number | null
          city: string | null
          current_streak: number | null
          dob: string | null
          e_admin: boolean | null
          e_aluno: boolean | null
          e_professor: boolean | null
          email: string | null
          full_name: string | null
          has_voted: boolean | null
          id: string | null
          joined_at: string | null
          last_active: string | null
          lessons_completed: number | null
          modules_completed: number | null
          nome: string | null
          phone: string | null
          state: string | null
          status_atividade: string | null
          tipo_usuario: string | null
          total_points: number | null
          user_level: string | null
          voted_logo: string | null
        }
        Insert: {
          best_streak?: number | null
          city?: string | null
          current_streak?: number | null
          dob?: string | null
          e_admin?: never
          e_aluno?: never
          e_professor?: never
          email?: string | null
          full_name?: string | null
          has_voted?: boolean | null
          id?: string | null
          joined_at?: string | null
          last_active?: string | null
          lessons_completed?: number | null
          modules_completed?: number | null
          nome?: string | null
          phone?: string | null
          state?: string | null
          status_atividade?: never
          tipo_usuario?: string | null
          total_points?: number | null
          user_level?: string | null
          voted_logo?: string | null
        }
        Update: {
          best_streak?: number | null
          city?: string | null
          current_streak?: number | null
          dob?: string | null
          e_admin?: never
          e_aluno?: never
          e_professor?: never
          email?: string | null
          full_name?: string | null
          has_voted?: boolean | null
          id?: string | null
          joined_at?: string | null
          last_active?: string | null
          lessons_completed?: number | null
          modules_completed?: number | null
          nome?: string | null
          phone?: string | null
          state?: string | null
          status_atividade?: never
          tipo_usuario?: string | null
          total_points?: number | null
          user_level?: string | null
          voted_logo?: string | null
        }
        Relationships: []
      }
      professores_dashboard_stats: {
        Row: {
          professor_id: string | null
          professor_nome: string | null
          total_conteudos: number | null
          total_devocionais: number | null
          total_downloads: number | null
          total_materiais: number | null
          total_sacadas: number | null
          total_videos: number | null
          total_visualizacoes: number | null
          ultimo_conteudo_criado: string | null
        }
        Relationships: []
      }
      view_admin_dashboard: {
        Row: {
          active_cache_entries: number | null
          activities_week: number | null
          avg_cache_hits: number | null
          points_awarded_week: number | null
          qr_scans_week: number | null
          top_students: Json | null
          total_achievements: number | null
          total_admins: number | null
          total_alunos: number | null
          total_aulas: number | null
          total_conteudos: number | null
          total_instrumentos: number | null
          total_professores: number | null
          total_users: number | null
          unread_notifications: number | null
        }
        Relationships: []
      }
      view_attendance_analytics: {
        Row: {
          attendance_percentage: number | null
          aula_id: string | null
          confirmed_present: number | null
          data_programada: string | null
          numero: number | null
          qr_codes_generated: number | null
          qr_scans_success: number | null
          qr_scans_total: number | null
          status: string | null
          titulo: string | null
          total_enrolled: number | null
          total_present: number | null
        }
        Insert: {
          attendance_percentage?: never
          aula_id?: string | null
          confirmed_present?: never
          data_programada?: string | null
          numero?: number | null
          qr_codes_generated?: never
          qr_scans_success?: never
          qr_scans_total?: never
          status?: string | null
          titulo?: string | null
          total_enrolled?: never
          total_present?: never
        }
        Update: {
          attendance_percentage?: never
          aula_id?: string | null
          confirmed_present?: never
          data_programada?: string | null
          numero?: number | null
          qr_codes_generated?: never
          qr_scans_success?: never
          qr_scans_total?: never
          status?: string | null
          titulo?: string | null
          total_enrolled?: never
          total_present?: never
        }
        Relationships: []
      }
      view_aulas_admin: {
        Row: {
          criado_em: string | null
          data_programada: string | null
          desafio_alpha: string | null
          formato: string | null
          id: string | null
          modulo_nome: string | null
          nivel: string | null
          numero: number | null
          objetivo_didatico: string | null
          responsavel_nome: string | null
          resumo_atividades: string | null
          status: string | null
          titulo: string | null
        }
        Relationships: []
      }
      view_aulas_aluno: {
        Row: {
          data_programada: string | null
          desafio_alpha: string | null
          id: string | null
          numero: number | null
          titulo: string | null
        }
        Insert: {
          data_programada?: string | null
          desafio_alpha?: string | null
          id?: string | null
          numero?: number | null
          titulo?: string | null
        }
        Update: {
          data_programada?: string | null
          desafio_alpha?: string | null
          id?: string | null
          numero?: number | null
          titulo?: string | null
        }
        Relationships: []
      }
      view_aulas_professor: {
        Row: {
          data_programada: string | null
          desafio_alpha: string | null
          id: string | null
          modulo_nome: string | null
          numero: number | null
          objetivo_didatico: string | null
          resumo_atividades: string | null
          status: string | null
          titulo: string | null
        }
        Relationships: []
      }
      view_dashboard_aluno: {
        Row: {
          achievements_last_week: number | null
          best_streak: number | null
          current_streak: number | null
          full_name: string | null
          id: string | null
          lessons_completed: number | null
          modules_completed: number | null
          submissoes_avaliadas: number | null
          total_achievements: number | null
          total_points: number | null
          total_portfolios: number | null
          total_submissoes: number | null
        }
        Relationships: []
      }
      view_dashboard_professor: {
        Row: {
          full_name: string | null
          id: string | null
          submissoes_pendentes: number | null
          taxa_presenca: number | null
          total_alunos: number | null
          total_turmas: number | null
        }
        Relationships: []
      }
      view_placar_logos: {
        Row: {
          ativo: boolean | null
          descricao: string | null
          id: string | null
          nome: string | null
          percentual: number | null
          url: string | null
          votos: number | null
        }
        Relationships: []
      }
      view_professor_dashboard: {
        Row: {
          admin_access: boolean | null
          id: string | null
          nome: string | null
          points_awarded_via_qr: number | null
          qr_codes_active: number | null
          qr_codes_created: number | null
          recent_activities: number | null
          total_conteudos: number | null
          total_qr_scans: number | null
          total_sacadas: number | null
          total_videos: number | null
        }
        Insert: {
          admin_access?: never
          id?: string | null
          nome?: never
          points_awarded_via_qr?: never
          qr_codes_active?: never
          qr_codes_created?: never
          recent_activities?: never
          total_conteudos?: never
          total_qr_scans?: never
          total_sacadas?: never
          total_videos?: never
        }
        Update: {
          admin_access?: never
          id?: string | null
          nome?: never
          points_awarded_via_qr?: never
          qr_codes_active?: never
          qr_codes_created?: never
          recent_activities?: never
          total_conteudos?: never
          total_qr_scans?: never
          total_sacadas?: never
          total_videos?: never
        }
        Relationships: [
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_professor_profile"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      view_qr_analytics: {
        Row: {
          aula_id: string | null
          aula_titulo: string | null
          code: string | null
          created_at: string | null
          created_by: string | null
          creator_name: string | null
          current_scans: number | null
          expires_at: string | null
          id: string | null
          is_active: boolean | null
          max_scans: number | null
          successful_scans: number | null
          total_points_awarded: number | null
          total_scans: number | null
          type: string | null
          unique_users: number | null
        }
        Relationships: [
          {
            foreignKeyName: "qr_codes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_attendance_analytics"
            referencedColumns: ["aula_id"]
          },
          {
            foreignKeyName: "qr_codes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_admin"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "view_aulas_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "admin_usuarios_completos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "professores_dashboard_stats"
            referencedColumns: ["professor_id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "view_dashboard_aluno"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "view_dashboard_professor"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_codes_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "view_user_gamification"
            referencedColumns: ["id"]
          },
        ]
      }
      view_user_gamification: {
        Row: {
          best_streak: number | null
          current_streak: number | null
          full_name: string | null
          id: string | null
          lessons_completed: number | null
          modules_completed: number | null
          nome: string | null
          points_rank: number | null
          points_this_week: number | null
          recent_achievements: number | null
          total_achievements: number | null
          total_points: number | null
          user_level: string | null
        }
        Relationships: []
      }
      vw_forum_stats: {
        Row: {
          aluno_nome: string | null
          categoria: string | null
          created_at: string | null
          id: string | null
          modulo_nome: string | null
          nivel_urgencia: string | null
          respostas_oficiais: number | null
          status: string | null
          titulo: string | null
          total_respostas: number | null
          updated_at: string | null
          visualizacoes: number | null
        }
        Relationships: []
      }
      vw_metodologias_stats: {
        Row: {
          aplicacao_brasileira: string | null
          created_at: string | null
          descricao_resumo: string | null
          faixa_etaria_ideal: string | null
          id: string | null
          materiais_relacionados: number | null
          nome: string | null
          origem: string | null
          principios_fundamentais: string[] | null
          vantagens: string[] | null
        }
        Relationships: []
      }
      vw_repertorio_stats: {
        Row: {
          artista: string | null
          created_at: string | null
          genero: string | null
          id: string | null
          instrumento_nome: string | null
          instrumento_principal_id: string | null
          nivel: string | null
          observacoes_professor: string | null
          tags: string[] | null
          tempo_bpm: number | null
          titulo: string | null
          tonalidade: string | null
        }
        Relationships: [
          {
            foreignKeyName: "repertorio_musical_instrumento_principal_id_fkey"
            columns: ["instrumento_principal_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "repertorio_musical_instrumento_principal_id_fkey"
            columns: ["instrumento_principal_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "repertorio_musical_instrumento_principal_id_fkey"
            columns: ["instrumento_principal_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "repertorio_musical_instrumento_principal_id_fkey"
            columns: ["instrumento_principal_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      vw_violin_ids: {
        Row: {
          instrumento_id: string | null
          nome: string | null
        }
        Insert: {
          instrumento_id?: string | null
          nome?: string | null
        }
        Update: {
          instrumento_id?: string | null
          nome?: string | null
        }
        Relationships: []
      }
      vw_violino_instrumento_sons: {
        Row: {
          arquivo_audio: string | null
          artista_performer: string | null
          bpm: number | null
          created_at: string | null
          dinamica: string | null
          id: string | null
          instrumento_id: string | null
          nota_musical: string | null
          tecnica: string | null
          tonalidade: string | null
          waveform_data: Json | null
        }
        Insert: {
          arquivo_audio?: string | null
          artista_performer?: string | null
          bpm?: number | null
          created_at?: string | null
          dinamica?: string | null
          id?: string | null
          instrumento_id?: string | null
          nota_musical?: string | null
          tecnica?: string | null
          tonalidade?: string | null
          waveform_data?: Json | null
        }
        Update: {
          arquivo_audio?: string | null
          artista_performer?: string | null
          bpm?: number | null
          created_at?: string | null
          dinamica?: string | null
          id?: string | null
          instrumento_id?: string | null
          nota_musical?: string | null
          tecnica?: string | null
          tonalidade?: string | null
          waveform_data?: Json | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumento_sons_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_sons_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumento_sons_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_sons_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      vw_violino_instrumento_sons_variacoes: {
        Row: {
          ano_gravacao: number | null
          arquivo_audio: string | null
          artista_performer: string | null
          created_at: string | null
          duracao_segundos: number | null
          id: string | null
          instrumento_usado: string | null
          local_gravacao: string | null
          qualidade_gravacao: string | null
          som_id: string | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumento_sons_variacoes_som_id_fkey"
            columns: ["som_id"]
            isOneToOne: false
            referencedRelation: "instrumento_sons"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumento_sons_variacoes_som_id_fkey"
            columns: ["som_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumento_sons"
            referencedColumns: ["id"]
          },
        ]
      }
      vw_violino_instrumentos: {
        Row: {
          anatomia_partes: Json | null
          ativo: boolean | null
          categoria: string | null
          criado_em: string | null
          curiosidades: Json | null
          descricao: string | null
          dificuldade_aprendizado: string | null
          familia_instrumental: string | null
          historia: string | null
          id: string | null
          imagem_url: string | null
          material_principal: string | null
          nome: string | null
          ordem_exibicao: number | null
          origem: string | null
          tecnica_producao_som: string | null
        }
        Relationships: []
      }
      vw_violino_instrumentos_relacionados: {
        Row: {
          created_at: string | null
          descricao_relacao: string | null
          id: string | null
          instrumento_id: string | null
          instrumento_nome: string | null
          relacionado_id: string | null
          relacionado_nome: string | null
          similaridade_score: number | null
          tipo_relacao: string | null
        }
        Relationships: [
          {
            foreignKeyName: "instrumentos_relacionados_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_instrumento_id_fkey"
            columns: ["instrumento_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_relacionado_id_fkey"
            columns: ["relacionado_id"]
            isOneToOne: false
            referencedRelation: "instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_relacionado_id_fkey"
            columns: ["relacionado_id"]
            isOneToOne: false
            referencedRelation: "vw_violin_ids"
            referencedColumns: ["instrumento_id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_relacionado_id_fkey"
            columns: ["relacionado_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_instrumentos"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "instrumentos_relacionados_relacionado_id_fkey"
            columns: ["relacionado_id"]
            isOneToOne: false
            referencedRelation: "vw_violino_palestra"
            referencedColumns: ["instrumento_id"]
          },
        ]
      }
      vw_violino_palestra: {
        Row: {
          anatomia_partes: Json | null
          ativo: boolean | null
          categoria: string | null
          como_produz_som: string | null
          criado_em: string | null
          curiosidades: Json | null
          dificuldade: string | null
          familia: string | null
          historia: string | null
          imagem_url: string | null
          instrumento: string | null
          instrumento_id: string | null
          material: string | null
          o_que_e: string | null
          ordem_exibicao: number | null
          origem: string | null
          relacionados: Json | null
          sons_exemplos: Json | null
          sons_variacoes: Json | null
        }
        Relationships: []
      }
    }
    Functions: {
      add_user_points: {
        Args: { points: number; user_id: string }
        Returns: boolean
      }
      award_points: {
        Args: {
          p_action: string
          p_notes?: string
          p_points: number
          p_source_id?: string
          p_source_type?: string
          p_user_id: string
        }
        Returns: Json
      }
      calculate_user_achievements: {
        Args: { user_uuid: string }
        Returns: Json
      }
      check_and_grant_achievements: {
        Args: { target_user_id: string }
        Returns: number
      }
      cleanup_expired_data: {
        Args: Record<PropertyKey, never>
        Returns: undefined
      }
      column_exists: {
        Args: { column_name: string; table_name: string }
        Returns: boolean
      }
      create_user_with_profile: {
        Args: {
          user_dob: string
          user_email: string
          user_full_name: string
          user_instrument: string
          user_password: string
          user_tipo_usuario?: string
        }
        Returns: Json
      }
      detect_user_role: {
        Args: { user_uuid: string }
        Returns: Json
      }
      emergency_signup: {
        Args: {
          user_dob: string
          user_email: string
          user_full_name: string
          user_instrument: string
          user_password: string
          user_tipo_usuario?: string
        }
        Returns: Json
      }
      find_professor_relation_column: {
        Args: Record<PropertyKey, never>
        Returns: string
      }
      generate_qr_code: {
        Args: {
          p_aula_id?: string
          p_expiration_minutes?: number
          p_max_scans?: number
          p_type: string
          p_user_id: string
        }
        Returns: Json
      }
      gerar_qr_aula: {
        Args: { aula_numero: number }
        Returns: string
      }
      get_alunos_by_instrumento: {
        Args: { instrumento_nome: string }
        Returns: {
          aluno_email: string
          aluno_id: string
          aluno_nome: string
          data_ingresso: string
          nivel: string
        }[]
      }
      get_estatisticas_autor: {
        Args: { autor_id: string }
        Returns: Json
      }
      get_estatisticas_gerais: {
        Args: Record<PropertyKey, never>
        Returns: Json
      }
      get_lessons_by_module: {
        Args: { module_uuid: string }
        Returns: {
          audio_files: Json | null
          categoria: string | null
          created_at: string | null
          description: string | null
          has_exercise: boolean | null
          id: string
          is_free: boolean | null
          metodologia: string | null
          module_id: string | null
          nivel_dificuldade: string | null
          order_index: number | null
          pdf_materials: Json | null
          professor_responsavel_id: string | null
          slug: string
          tags: string[] | null
          thumbnail_url: string | null
          tipo_conteudo: string | null
          title: string
          updated_at: string | null
          video_duration_seconds: number | null
          video_url: string | null
        }[]
      }
      get_modules_by_instrument: {
        Args: { instrument: string }
        Returns: {
          created_at: string | null
          description: string | null
          duration_hours: number | null
          id: string
          instrument_category: string | null
          is_active: boolean | null
          is_premium: boolean | null
          lessons_count: number | null
          level_required: string | null
          order_index: number | null
          slug: string
          thumbnail_url: string | null
          title: string
          updated_at: string | null
        }[]
      }
      get_modules_by_level: {
        Args: { user_level: string }
        Returns: {
          created_at: string | null
          description: string | null
          duration_hours: number | null
          id: string
          instrument_category: string | null
          is_active: boolean | null
          is_premium: boolean | null
          lessons_count: number | null
          level_required: string | null
          order_index: number | null
          slug: string
          thumbnail_url: string | null
          title: string
          updated_at: string | null
        }[]
      }
      get_modules_stats: {
        Args: Record<PropertyKey, never>
        Returns: Json
      }
      get_professores_by_instrumento: {
        Args: { instrumento_nome: string }
        Returns: {
          anos_experiencia: number
          nivel_ensino: string
          professor_email: string
          professor_id: string
          professor_nome: string
        }[]
      }
      get_user_profile: {
        Args: { user_id: string }
        Returns: Json
      }
      get_user_stats: {
        Args: { p_user_id: string }
        Returns: Json
      }
      get_vagas_disponiveis: {
        Args: { turma_uuid: string }
        Returns: number
      }
      handle_new_user_signup: {
        Args: { p_email: string; p_metadata: Json; p_password: string }
        Returns: string
      }
      has_permission: {
        Args: { permission: string; user_uuid: string }
        Returns: boolean
      }
      incrementar_download: {
        Args: { conteudo_id: string }
        Returns: undefined
      }
      incrementar_visualizacao: {
        Args: { conteudo_id: string }
        Returns: undefined
      }
      invalidate_cache: {
        Args: { p_cache_key?: string; p_hook_name?: string; p_user_id?: string }
        Returns: number
      }
      is_admin: {
        Args: { user_id: string }
        Returns: boolean
      }
      is_professor_of_student: {
        Args: { p_student_id: string }
        Returns: boolean
      }
      is_professor_of_student_v2: {
        Args: { p_student_id: string }
        Returns: boolean
      }
      log_activity: {
        Args: {
          p_action: string
          p_component_name?: string
          p_details?: Json
          p_hook_name?: string
          p_resource: string
          p_user_id: string
        }
        Returns: string
      }
      normalizar_instrumento: {
        Args: { instrumento_input: string }
        Returns: string
      }
      process_qr_scan: {
        Args: { qr_code_text: string; scan_metadata?: Json; user_uuid: string }
        Returns: Json
      }
      show_table_structure: {
        Args: { table_name_param: string }
        Returns: {
          column_default: string
          column_name: string
          data_type: string
          is_nullable: string
        }[]
      }
      simple_create_profile: {
        Args: {
          profile_id: string
          user_dob: string
          user_email: string
          user_full_name: string
          user_instrument: string
          user_tipo_usuario?: string
        }
        Returns: Json
      }
      test_profile_creation: {
        Args: {
          user_dob: string
          user_email: string
          user_instrument: string
          user_name: string
          user_tipo?: string
        }
        Returns: Json
      }
      update_attendance_view: {
        Args: Record<PropertyKey, never>
        Returns: undefined
      }
      update_professor_view: {
        Args: Record<PropertyKey, never>
        Returns: undefined
      }
      update_professor_view_fixed: {
        Args: Record<PropertyKey, never>
        Returns: undefined
      }
      update_user_streak: {
        Args: { new_streak: number; user_id: string }
        Returns: boolean
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {},
  },
} as const
