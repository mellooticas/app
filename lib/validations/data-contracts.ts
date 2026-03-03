/**
 * Data Contracts — Zod schemas for critical tables
 *
 * These contracts define the shape and constraints for data written
 * to the 6 critical tables. Server actions should validate against
 * these contracts to ensure data quality at the application layer,
 * complementing the database CHECK constraints in migration 057.
 */

import { z } from 'zod'

// =============================================
// Profile Contract (iam.profiles)
// =============================================
export const profileContract = z.object({
  full_name: z.string().min(2, 'Nome deve ter pelo menos 2 caracteres').max(200),
  display_name: z.string().max(100).nullable().optional(),
  email: z.string().email('Email inválido').optional(),
  phone: z.string().max(20).nullable().optional(),
  avatar_url: z.string().url('URL de avatar inválida').nullable().optional(),
  bio: z.string().max(500).nullable().optional(),
  unit_id: z.string().uuid().nullable().optional(),
  primary_instrument_id: z.string().uuid().nullable().optional(),
})

// =============================================
// User Role Contract (iam.user_roles)
// =============================================
export const userRoleContract = z.object({
  user_id: z.string().uuid('ID do usuário inválido'),
  tenant_id: z.string().uuid('ID do tenant inválido'),
  role_id: z.string().uuid('ID do role inválido'),
  assigned_by: z.string().uuid().optional(),
  is_active: z.boolean().default(true),
})

// =============================================
// Lesson Contract (core.lessons)
// =============================================
const lessonStatusEnum = z.enum(['draft', 'published', 'archived', 'in_review'])

export const lessonContract = z.object({
  title: z.string().min(3, 'Título deve ter pelo menos 3 caracteres').max(200),
  description: z.string().max(2000).nullable().optional(),
  learning_objective: z.string().max(1000).nullable().optional(),
  lesson_number: z.number().int().positive('Número da aula deve ser positivo'),
  module_id: z.string().uuid('ID do módulo inválido'),
  teacher_id: z.string().uuid().optional(),
  status: lessonStatusEnum.default('draft'),
  duration_minutes: z.number().int().positive().nullable().optional(),
  difficulty_level: z.number().int().min(1).max(5).nullable().optional(),
})

// =============================================
// Challenge Submission Contract (core.challenge_submissions)
// =============================================
export const challengeSubmissionContract = z.object({
  challenge_id: z.string().uuid('ID do desafio inválido'),
  student_id: z.string().uuid(),
  response: z.string().min(1, 'Resposta não pode estar vazia').max(10000),
  file_url: z.string().url().nullable().optional(),
  evidence_urls: z.array(z.string().url()).nullable().optional(),
  grade: z.number().min(0).max(10, 'Nota deve ser entre 0 e 10').nullable().optional(),
  feedback: z.string().max(5000).nullable().optional(),
  ai_feedback: z.string().nullable().optional(),
  ai_suggested_grade: z.number().min(0).max(10).nullable().optional(),
  status: z.enum(['pending', 'submitted', 'in_review', 'evaluated']).default('pending'),
})

// =============================================
// Portfolio Contract (core.portfolios)
// =============================================
export const portfolioContract = z.object({
  title: z.string().min(3, 'Título deve ter pelo menos 3 caracteres').max(200),
  description: z.string().max(5000).nullable().optional(),
  work_type: z.enum(['performance', 'composition', 'arrangement', 'analysis', 'project', 'other']),
  visibility: z.enum(['private', 'class_only', 'public']).default('private'),
  status: z.enum(['draft', 'submitted', 'in_review', 'evaluated']).default('draft'),
  grade: z.number().min(0).max(10, 'Nota deve ser entre 0 e 10').nullable().optional(),
  feedback: z.string().max(5000).nullable().optional(),
  instrument_id: z.string().uuid().nullable().optional(),
  difficulty_level: z.number().int().min(1).max(5).nullable().optional(),
})

// =============================================
// AI Generated Content Contract (core.ai_generated_content)
// =============================================
export const aiGeneratedContentContract = z.object({
  lesson_id: z.string().uuid('ID da aula inválido'),
  content_type: z.enum(['material', 'exercise', 'explanation', 'micro_challenge', 'feedback']),
  title: z.string().min(3).max(300),
  content: z.string().min(10, 'Conteúdo deve ter pelo menos 10 caracteres'),
  metadata: z.record(z.string(), z.unknown()).default({}),
  ai_model: z.string().min(1),
  ai_prompt_hash: z.string().min(1),
  status: z.enum(['active', 'archived', 'error']).default('active'),
})
