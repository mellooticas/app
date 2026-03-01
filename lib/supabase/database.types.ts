export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: Record<string, never>
    Views: {
      // =============================================
      // IAM Views
      // =============================================
      v_profiles: {
        Row: {
          id: string
          user_id: string
          tenant_id: string
          unit_id: string | null
          full_name: string
          display_name: string | null
          avatar_url: string | null
          phone: string | null
          birth_date: string | null
          locale: string
          is_active: boolean
          created_at: string
          updated_at: string
          unit_name: string | null
          roles: Json
        }
      }

      // =============================================
      // Education Views
      // =============================================
      v_courses: {
        Row: {
          id: string
          tenant_id: string
          unit_id: string | null
          name: string
          description: string | null
          instrument_id: string | null
          teacher_id: string | null
          level: Database["public"]["Enums"]["course_level"]
          max_students: number | null
          schedule: string | null
          start_date: string | null
          end_date: string | null
          is_active: boolean
          created_at: string
          updated_at: string
          instrument_name: string | null
          teacher_name: string | null
          teacher_avatar: string | null
          active_students: number
        }
      }
      v_enrollments: {
        Row: {
          id: string
          tenant_id: string
          course_id: string
          student_id: string
          status: Database["public"]["Enums"]["enrollment_status"]
          enrolled_at: string
          completed_at: string | null
          created_at: string
          course_name: string | null
          student_name: string | null
          student_avatar: string | null
        }
      }
      v_lessons: {
        Row: {
          id: string
          tenant_id: string
          module_id: string | null
          number: number | null
          title: string
          description: string | null
          learning_objective: string | null
          scheduled_date: string | null
          duration_minutes: number | null
          status: Database["public"]["Enums"]["lesson_status"]
          teacher_id: string | null
          is_active: boolean
          created_at: string
          updated_at: string
          module_name: string | null
          teacher_name: string | null
        }
      }
      v_lesson_progress: {
        Row: {
          id: string
          tenant_id: string
          lesson_id: string
          student_id: string
          is_completed: boolean
          progress_percent: number
          notes: string | null
          completed_at: string | null
          created_at: string
          lesson_title: string | null
          lesson_number: number | null
        }
      }
      v_lesson_materials: {
        Row: {
          id: string
          tenant_id: string
          lesson_id: string
          title: string
          description: string | null
          material_type: string | null
          file_url: string | null
          order_index: number
          created_at: string
          lesson_title: string | null
          lesson_number: number | null
        }
      }
      v_lesson_activities: {
        Row: {
          id: string
          tenant_id: string
          lesson_id: string
          title: string
          description: string | null
          activity_type: string | null
          duration_minutes: number | null
          order_index: number
          created_at: string
          lesson_title: string | null
          lesson_number: number | null
        }
      }
      v_evaluation_criteria: {
        Row: {
          id: string
          tenant_id: string
          lesson_id: string
          name: string
          description: string | null
          weight: number
          order_index: number
          created_at: string
          lesson_title: string | null
          lesson_number: number | null
        }
      }
      v_lesson_comments: {
        Row: {
          id: string
          tenant_id: string
          lesson_id: string
          user_id: string
          content: string
          parent_id: string | null
          created_at: string
          updated_at: string
          author_name: string | null
          author_avatar: string | null
          lesson_title: string | null
        }
      }
      v_attendance: {
        Row: {
          id: string
          tenant_id: string
          course_id: string
          lesson_id: string | null
          student_id: string
          date: string
          is_present: boolean | null
          justification: string | null
          notes: string | null
          created_at: string
          course_name: string | null
          student_name: string | null
        }
      }

      // =============================================
      // Instrument Views
      // =============================================
      v_instruments: {
        Row: {
          id: string
          tenant_id: string
          name: string
          family: string | null
          category: string | null
          description: string | null
          detailed_description: string | null
          origin: string | null
          difficulty_level: number | null
          recommended_age_range: string | null
          image_url: string | null
          video_url: string | null
          audio_url: string | null
          popularity: number
          display_order: number
          is_active: boolean
          created_at: string
          updated_at: string
          media_count: number
          sounds_count: number
        }
      }

      // =============================================
      // Content Views
      // =============================================
      v_repertoire: {
        Row: {
          id: string
          tenant_id: string
          title: string
          composer: string | null
          arranger: string | null
          category_id: string | null
          key_signature: string | null
          tempo: string | null
          estimated_duration: string | null
          difficulty_level: Database["public"]["Enums"]["difficulty_level"] | null
          required_instruments: Json
          min_participants: number | null
          sheet_music_url: string | null
          chord_chart_url: string | null
          lyrics_url: string | null
          playback_url: string | null
          tutorial_video_url: string | null
          is_public: boolean
          requires_approval: boolean
          tags: Json
          notes: string | null
          is_active: boolean
          created_at: string
          updated_at: string
          category_name: string | null
        }
      }
      v_history_periods: {
        Row: {
          id: string
          tenant_id: string
          name: string
          description: string | null
          start_year: number | null
          end_year: number | null
          theme_color: string | null
          cover_image_url: string | null
          chronological_order: number
          is_active: boolean
          created_at: string
          composer_count: number
          work_count: number
        }
      }
      v_history_composers: {
        Row: {
          id: string
          tenant_id: string
          full_name: string
          artistic_name: string | null
          period_id: string | null
          birth_country: string | null
          birth_date: string | null
          death_date: string | null
          biography: string | null
          photo_url: string | null
          importance_level: number | null
          is_active: boolean
          created_at: string
          period_name: string | null
          work_count: number
        }
      }
      v_history_works: {
        Row: {
          id: string
          tenant_id: string
          title: string
          original_title: string | null
          composer_id: string | null
          period_id: string | null
          composition_year: number | null
          work_type: string | null
          genre: string | null
          difficulty_level: Database["public"]["Enums"]["difficulty_level"] | null
          popularity: number
          audio_url: string | null
          video_url: string | null
          score_url: string | null
          is_active: boolean
          created_at: string
          composer_name: string | null
          composer_artistic_name: string | null
          period_name: string | null
        }
      }

      // =============================================
      // Gamification Views
      // =============================================
      v_achievements: {
        Row: {
          id: string
          tenant_id: string
          name: string
          description: string | null
          badge_icon: string | null
          badge_color: string | null
          points_reward: number
          category: Database["public"]["Enums"]["achievement_category"]
          requirement_type: string | null
          requirement_value: number | null
          is_active: boolean
          created_at: string
        }
      }
      v_user_achievements: {
        Row: {
          id: string
          tenant_id: string
          user_id: string
          achievement_id: string
          current_progress: number
          target_progress: number | null
          is_completed: boolean
          completed_at: string | null
          metadata: Json
          created_at: string
          updated_at: string
          achievement_name: string | null
          achievement_description: string | null
          badge_icon: string | null
          badge_color: string | null
          achievement_category: Database["public"]["Enums"]["achievement_category"] | null
          points_reward: number | null
        }
      }
      v_user_progress: {
        Row: {
          id: string
          tenant_id: string
          user_id: string
          total_points: number
          level: number
          level_name: string
          current_xp: number
          xp_to_next_level: number
          current_streak: number
          longest_streak: number
          lessons_completed: number
          achievements_unlocked: number
          badges_earned: number
          created_at: string
          updated_at: string
          full_name: string | null
          avatar_url: string | null
        }
      }
      v_points_log: {
        Row: {
          id: string
          tenant_id: string
          user_id: string
          points: number
          source: string
          action: string | null
          description: string | null
          reference_type: string | null
          reference_id: string | null
          metadata: Json
          created_at: string
        }
      }

      // =============================================
      // Portfolio Views
      // =============================================
      v_portfolios: {
        Row: {
          id: string
          tenant_id: string
          student_id: string
          title: string
          description: string | null
          work_type: Database["public"]["Enums"]["portfolio_type"]
          status: Database["public"]["Enums"]["portfolio_status"]
          visibility: Database["public"]["Enums"]["visibility"]
          learning_objectives: string | null
          initial_reflection: string | null
          final_reflection: string | null
          instrument_id: string | null
          difficulty_level: Database["public"]["Enums"]["difficulty_level"] | null
          file_url: string | null
          video_url: string | null
          audio_url: string | null
          tags: Json
          grade: number | null
          feedback: string | null
          evaluated_by: string | null
          evaluated_at: string | null
          created_at: string
          updated_at: string
          deleted_at: string | null
          student_name: string | null
          student_avatar: string | null
          instrument_name: string | null
          evaluator_name: string | null
          evidence_count: number
        }
      }

      // =============================================
      // Challenge Views
      // =============================================
      v_challenges: {
        Row: {
          id: string
          tenant_id: string
          code: string | null
          methodology_id: string | null
          competency_id: string | null
          title: string
          description: string | null
          objectives: string | null
          difficulty: number
          base_points: number
          challenge_type: Database["public"]["Enums"]["challenge_type"]
          evaluation_criteria: Json | null
          required_resources: Json | null
          is_active: boolean
          created_at: string
          updated_at: string
          methodology_name: string | null
          methodology_code: string | null
          competency_name: string | null
          submission_count: number
        }
      }
      v_challenge_submissions: {
        Row: {
          id: string
          tenant_id: string
          challenge_id: string
          student_id: string
          response: string | null
          evidence_urls: Json
          file_url: string | null
          status: Database["public"]["Enums"]["submission_status"]
          grade: number | null
          feedback: string | null
          evaluated_by: string | null
          evaluated_at: string | null
          created_at: string
          updated_at: string
          deleted_at: string | null
          challenge_title: string | null
          challenge_code: string | null
          challenge_difficulty: number | null
          student_name: string | null
          evaluator_name: string | null
        }
      }

      // =============================================
      // Community Views
      // =============================================
      v_forum_topics: {
        Row: {
          id: string
          tenant_id: string
          unit_id: string | null
          author_id: string
          title: string
          content: string
          category: string | null
          is_pinned: boolean
          is_locked: boolean
          created_at: string
          updated_at: string
          deleted_at: string | null
          author_name: string | null
          author_avatar: string | null
          reply_count: number
          like_count: number
        }
      }

      // =============================================
      // Notification View
      // =============================================
      v_notifications: {
        Row: {
          id: string
          tenant_id: string
          user_id: string
          title: string
          message: string | null
          notification_type: string | null
          reference_type: string | null
          reference_id: string | null
          is_read: boolean
          read_at: string | null
          created_at: string
        }
      }

      // =============================================
      // Dashboard Views
      // =============================================
      v_dashboard_student: {
        Row: {
          user_id: string
          tenant_id: string
          total_points: number
          level: number
          level_name: string
          current_xp: number
          xp_to_next_level: number
          current_streak: number
          longest_streak: number
          lessons_completed: number
          achievements_unlocked: number
          active_courses: number
          portfolio_count: number
          submissions_count: number
          unread_notifications: number
          practice_sessions_this_week: number
          practice_minutes_this_week: number
          total_posts: number
          pending_recommendations: number
          weekly_goal_minutes: number | null
        }
      }
      v_dashboard_teacher: {
        Row: {
          user_id: string
          tenant_id: string
          active_courses: number
          total_students: number
          pending_submissions: number
          pending_portfolios: number
        }
      }
      v_dashboard_admin: {
        Row: {
          tenant_id: string
          total_users: number
          total_students: number
          total_teachers: number
          active_courses: number
          total_lessons: number
          total_instruments: number
          total_feed_posts: number
          feed_posts_last_week: number
          active_practitioners_last_week: number
          practice_minutes_last_week: number
          inventory_total_items: number
          inventory_available_items: number
          total_support_materials: number
        }
      }

      // =============================================
      // Feed Social Views (new)
      // =============================================
      v_feed_posts: {
        Row: {
          id: string
          tenant_id: string
          author_id: string
          content_type: Database["public"]["Enums"]["feed_content_type"]
          caption: string | null
          media_url: string | null
          thumbnail_url: string | null
          duration_seconds: number | null
          visibility: Database["public"]["Enums"]["visibility"]
          challenge_id: string | null
          is_pinned: boolean
          is_featured: boolean
          view_count: number
          created_at: string
          updated_at: string
          author_name: string | null
          author_display_name: string | null
          author_avatar: string | null
          challenge_title: string | null
          like_count: number
          comment_count: number
        }
      }
      v_feed_comments: {
        Row: {
          id: string
          tenant_id: string
          post_id: string
          author_id: string
          content: string
          parent_id: string | null
          created_at: string
          author_name: string | null
          author_display_name: string | null
          author_avatar: string | null
          like_count: number
          reply_count: number
        }
      }
      v_feed_likes: {
        Row: {
          id: string
          tenant_id: string
          user_id: string
          post_id: string | null
          comment_id: string | null
          created_at: string
          user_name: string | null
          user_avatar: string | null
        }
      }

      // =============================================
      // Practice Diary Views (new)
      // =============================================
      v_practice_sessions: {
        Row: {
          id: string
          tenant_id: string
          student_id: string
          instrument_id: string | null
          duration_minutes: number
          practice_type: Database["public"]["Enums"]["practice_type"]
          mood: Database["public"]["Enums"]["practice_mood"] | null
          notes: string | null
          media_url: string | null
          challenge_id: string | null
          session_date: string
          created_at: string
          student_name: string | null
          student_avatar: string | null
          instrument_name: string | null
          challenge_title: string | null
        }
      }
      v_practice_stats: {
        Row: {
          tenant_id: string
          student_id: string
          student_name: string | null
          total_sessions: number
          total_minutes: number
          avg_minutes_per_session: number
          unique_days: number
          instruments_practiced: number
          last_practice_date: string | null
          first_practice_date: string | null
          sessions_this_week: number
          minutes_this_week: number
        }
      }

      // =============================================
      // AI / Adaptive Learning Views (new)
      // =============================================
      v_student_learning_profiles: {
        Row: {
          id: string
          tenant_id: string
          user_id: string
          preferred_style: Database["public"]["Enums"]["learning_style"]
          current_focus_areas: Json
          strengths: Json
          areas_for_growth: Json
          weekly_goal_minutes: number
          preferred_difficulty: number
          ai_notes: Json
          last_recommendation_at: string | null
          created_at: string
          updated_at: string
          student_name: string | null
          student_avatar: string | null
          minutes_practiced_this_week: number
        }
      }
      v_learning_recommendations: {
        Row: {
          id: string
          tenant_id: string
          user_id: string
          recommendation_type: Database["public"]["Enums"]["recommendation_type"]
          title: string
          description: string | null
          reference_type: string | null
          reference_id: string | null
          reason: string | null
          priority: number
          is_dismissed: boolean
          is_completed: boolean
          created_at: string
          student_name: string | null
        }
      }

      // =============================================
      // History Expansion Views (new)
      // =============================================
      v_history_genres: {
        Row: {
          id: string
          tenant_id: string
          name: string
          slug: string | null
          origin_period_id: string | null
          origin_decade: string | null
          origin_country: string | null
          description: string | null
          musical_characteristics: string | null
          related_genres: Json
          main_composers: Json
          representative_works: Json
          cultural_influences: string | null
          image_url: string | null
          theme_color: string | null
          is_active: boolean
          created_at: string
          origin_period_name: string | null
        }
      }
      v_history_movements: {
        Row: {
          id: string
          tenant_id: string
          name: string
          description: string | null
          start_year: number | null
          end_year: number | null
          main_locations: string | null
          manifesto: string | null
          characteristics: string | null
          composers: Json
          iconic_works: Json
          historical_context: string | null
          legacy: string | null
          image_url: string | null
          is_active: boolean
          created_at: string
        }
      }
      v_history_cultural_contexts: {
        Row: {
          id: string
          tenant_id: string
          period_id: string
          title: string
          context_type: string | null
          description: string | null
          impact_on_music: string | null
          start_year: number | null
          end_year: number | null
          images_url: Json
          is_active: boolean
          created_at: string
          period_name: string | null
        }
      }
      v_history_timeline_events: {
        Row: {
          id: string
          tenant_id: string
          year: number
          month: number | null
          day: number | null
          title: string
          event_type: string | null
          category: string | null
          description: string | null
          composer_id: string | null
          work_id: string | null
          period_id: string | null
          image_url: string | null
          importance: number
          is_active: boolean
          created_at: string
          composer_name: string | null
          composer_artistic_name: string | null
          work_title: string | null
          period_name: string | null
        }
      }
      v_history_theory_concepts: {
        Row: {
          id: string
          tenant_id: string
          name: string
          category: string | null
          simple_definition: string | null
          technical_definition: string | null
          origin_period_id: string | null
          audio_examples: Json
          diagram_url: string | null
          difficulty_level: number | null
          prerequisites: Json
          exercises: Json
          tags: Json
          is_active: boolean
          created_at: string
          origin_period_name: string | null
        }
      }
      v_history_instrument_evolution: {
        Row: {
          id: string
          tenant_id: string
          instrument_id: string
          period_id: string | null
          historical_version: string | null
          approximate_year: number | null
          inventor: string | null
          technical_description: string | null
          differences_from_modern: string | null
          image_url: string | null
          audio_url: string | null
          curiosities: string | null
          is_active: boolean
          created_at: string
          instrument_name: string | null
          instrument_family: string | null
          period_name: string | null
        }
      }
      v_history_quizzes: {
        Row: {
          id: string
          tenant_id: string
          title: string | null
          period_id: string | null
          difficulty_level: number | null
          question_type: Database["public"]["Enums"]["quiz_type"]
          question: string
          options: Json | null
          correct_answer: string
          explanation: string | null
          audio_url: string | null
          image_url: string | null
          tags: Json
          points: number
          is_active: boolean
          created_at: string
          period_name: string | null
        }
      }

      // =============================================
      // Education Expansion Views (new)
      // =============================================
      v_lesson_checklists: {
        Row: {
          id: string
          tenant_id: string
          lesson_id: string
          item: string
          checklist_type: string
          is_done: boolean
          created_at: string
          updated_at: string
          lesson_title: string | null
          lesson_number: number | null
          lesson_date: string | null
        }
      }
      v_teaching_sequences: {
        Row: {
          id: string
          tenant_id: string
          title: string
          methodology_id: string | null
          age_range: string | null
          duration_weeks: number | null
          objectives: string | null
          week_number: number | null
          main_activity: string | null
          circle_activity: string | null
          game_dynamic: string | null
          required_materials: string | null
          notes: string | null
          created_by: string | null
          created_at: string
          methodology_name: string | null
          methodology_code: string | null
          creator_name: string | null
        }
      }
      v_support_materials: {
        Row: {
          id: string
          tenant_id: string
          title: string
          material_type: string
          category: string | null
          description: string | null
          file_url: string | null
          module_id: string | null
          methodology_id: string | null
          instrument_id: string | null
          difficulty_level: number | null
          tags: Json
          file_size_mb: number | null
          duration_seconds: number | null
          author: string | null
          license: string | null
          download_count: number
          view_count: number
          is_active: boolean
          created_at: string
          module_name: string | null
          methodology_name: string | null
          instrument_name: string | null
        }
      }

      // =============================================
      // Inventory Views (new)
      // =============================================
      v_instrument_inventory: {
        Row: {
          id: string
          tenant_id: string
          unit_id: string | null
          instrument_id: string
          asset_code: string | null
          serial_number: string | null
          brand: string | null
          model: string | null
          acquisition_value: number | null
          acquisition_date: string | null
          owner: string | null
          condition: string
          location: string | null
          is_available: boolean
          notes: string | null
          created_at: string
          updated_at: string
          instrument_name: string | null
          instrument_family: string | null
          unit_name: string | null
        }
      }
      v_inventory_summary: {
        Row: {
          tenant_id: string
          instrument_id: string
          instrument_name: string | null
          instrument_family: string | null
          unit_id: string | null
          unit_name: string | null
          total_items: number
          available_items: number
          needs_attention: number
          total_value: number
        }
      }
    }
    Functions: {
      rpc_get_user_rbac: {
        Args: Record<string, never>
        Returns: Json
      }
      rpc_award_points: {
        Args: {
          p_user_id: string
          p_points: number
          p_source: string
          p_action?: string
          p_description?: string
          p_reference_type?: string
          p_reference_id?: string
        }
        Returns: Json
      }
      rpc_complete_lesson: {
        Args: {
          p_lesson_id: string
          p_notes?: string
        }
        Returns: Json
      }
      rpc_submit_portfolio: {
        Args: {
          p_title: string
          p_description?: string
          p_work_type?: Database["public"]["Enums"]["portfolio_type"]
          p_instrument_id?: string
          p_difficulty?: Database["public"]["Enums"]["difficulty_level"]
          p_file_url?: string
          p_video_url?: string
          p_audio_url?: string
          p_tags?: Json
          p_learning_objectives?: string
          p_initial_reflection?: string
        }
        Returns: Json
      }
      rpc_evaluate_portfolio: {
        Args: {
          p_portfolio_id: string
          p_grade: number
          p_feedback?: string
        }
        Returns: Json
      }
      rpc_submit_challenge: {
        Args: {
          p_challenge_id: string
          p_response?: string
          p_file_url?: string
          p_evidence_urls?: Json
        }
        Returns: Json
      }
      rpc_evaluate_challenge: {
        Args: {
          p_submission_id: string
          p_grade: number
          p_feedback?: string
        }
        Returns: Json
      }
      rpc_check_achievements: {
        Args: {
          p_user_id?: string
        }
        Returns: Json
      }
    }
    Enums: {
      enrollment_status: "active" | "pending" | "completed" | "cancelled"
      lesson_status: "draft" | "scheduled" | "in_progress" | "completed" | "cancelled"
      course_level: "beginner" | "intermediate" | "advanced"
      difficulty_level: "beginner" | "intermediate" | "advanced" | "expert"
      technique_difficulty: "beginner" | "intermediate" | "advanced" | "expert"
      material_type: "document" | "video" | "audio" | "link" | "sheet_music"
      quiz_type: "multiple_choice" | "true_false" | "open"
      portfolio_type: "project" | "research" | "performance" | "reflection" | "composition"
      portfolio_status: "draft" | "submitted" | "in_review" | "evaluated"
      visibility: "private" | "class_only" | "public"
      evidence_type: "photo" | "video" | "audio" | "document"
      challenge_type: "practical" | "theoretical" | "creative" | "collaborative"
      submission_status: "submitted" | "under_review" | "evaluated" | "returned"
      achievement_category: "progress" | "consistency" | "milestone" | "special"
      invitation_status: "pending" | "accepted" | "expired" | "revoked"
      // New enums (12_schema_expansion)
      practice_type: "exercise" | "repertoire" | "improvisation" | "technique" | "warmup"
      practice_mood: "easy" | "challenging" | "breakthrough" | "frustrating"
      feed_content_type: "video" | "audio" | "image" | "text"
      learning_style: "visual" | "auditory" | "kinesthetic" | "mixed"
      recommendation_type: "challenge" | "practice" | "content" | "instrument" | "repertoire"
    }
    CompositeTypes: Record<string, never>
  }
}

// =============================================
// Helper types
// =============================================

type PublicSchema = Database[Extract<keyof Database, "public">]

/**
 * Extract the Row type from a View in the public schema.
 * Usage: Tables<"v_profiles"> => { id: string; user_id: string; ... }
 */
export type Tables<
  PublicTableNameOrOptions extends
    | keyof (PublicSchema["Tables"] & PublicSchema["Views"])
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
      Database[PublicTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : PublicTableNameOrOptions extends keyof (PublicSchema["Tables"] &
        PublicSchema["Views"])
    ? (PublicSchema["Tables"] & PublicSchema["Views"])[PublicTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

/**
 * Extract the Insert type from a Table in the public schema.
 * Note: Views do not support Insert, so this only applies to Tables.
 */
export type TablesInsert<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

/**
 * Extract the Update type from a Table in the public schema.
 * Note: Views do not support Update, so this only applies to Tables.
 */
export type TablesUpdate<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

/**
 * Extract an Enum type from the public schema.
 * Usage: Enums<"enrollment_status"> => "active" | "pending" | "completed" | "cancelled"
 */
export type Enums<
  PublicEnumNameOrOptions extends
    | keyof PublicSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends PublicEnumNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = PublicEnumNameOrOptions extends { schema: keyof Database }
  ? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
    ? PublicSchema["Enums"][PublicEnumNameOrOptions]
    : never
