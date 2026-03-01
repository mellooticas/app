import { z } from 'zod'

// =============================================
// Feed
// =============================================
export const createPostSchema = z.object({
  content_type: z.enum(['video', 'audio', 'image', 'text']),
  caption: z.string().max(500).optional(),
  media_url: z.string().url().optional(),
  thumbnail_url: z.string().url().optional(),
  duration_seconds: z.number().int().positive().optional(),
  visibility: z.enum(['public', 'course_only', 'private']).default('public'),
  challenge_id: z.string().uuid().optional(),
})

export const commentSchema = z.object({
  post_id: z.string().uuid(),
  content: z.string().min(1).max(1000),
  parent_id: z.string().uuid().optional(),
})

// =============================================
// Practice
// =============================================
export const logPracticeSchema = z.object({
  instrument_id: z.string().uuid().optional(),
  duration_minutes: z.number().int().min(1).max(480),
  practice_type: z.enum(['exercise', 'repertoire', 'improvisation', 'technique', 'warmup']),
  mood: z.enum(['easy', 'challenging', 'breakthrough', 'frustrating']).optional(),
  notes: z.string().max(2000).optional(),
  media_url: z.string().url().optional(),
  challenge_id: z.string().uuid().optional(),
  session_date: z.string().optional(),
})

// =============================================
// Challenge
// =============================================
export const submitChallengeSchema = z.object({
  challenge_id: z.string().uuid(),
  response: z.string().max(5000).optional(),
  file_url: z.string().url().optional(),
})

export const evaluateSubmissionSchema = z.object({
  submission_id: z.string().uuid(),
  grade: z.number().min(0).max(10),
  feedback: z.string().min(1).max(5000),
  status: z.enum(['evaluated', 'rejected']).default('evaluated'),
})

// =============================================
// Portfolio
// =============================================
export const submitPortfolioSchema = z.object({
  title: z.string().min(1).max(200),
  work_type: z.enum(['performance', 'composition', 'arrangement', 'recording', 'reflection', 'other']),
  description: z.string().max(5000).optional(),
  instrument_id: z.string().uuid().optional(),
})

export const evaluatePortfolioSchema = z.object({
  portfolio_id: z.string().uuid(),
  grade: z.number().min(0).max(10),
  feedback: z.string().min(1).max(5000),
})

// =============================================
// Course
// =============================================
export const createCourseSchema = z.object({
  name: z.string().min(1).max(200),
  instrument_id: z.string().uuid().optional(),
  level: z.enum(['beginner', 'intermediate', 'advanced']).default('beginner'),
})

export const enrollStudentSchema = z.object({
  course_id: z.string().uuid(),
  student_id: z.string().uuid(),
})

export const recordAttendanceSchema = z.object({
  course_id: z.string().uuid(),
  date: z.string(),
  records: z.array(z.object({
    student_id: z.string().uuid(),
    is_present: z.boolean(),
    justification: z.string().optional(),
  })),
})

// =============================================
// Community
// =============================================
export const createTopicSchema = z.object({
  title: z.string().min(1).max(200),
  content: z.string().min(1).max(10000),
  category: z.string().max(50).optional(),
})

export const replyToTopicSchema = z.object({
  topic_id: z.string().uuid(),
  content: z.string().min(1).max(5000),
})

// =============================================
// Lesson
// =============================================
export const createLessonSchema = z.object({
  title: z.string().min(1).max(200),
  description: z.string().max(5000).optional(),
  learning_objective: z.string().max(5000).optional(),
  duration_minutes: z.number().int().positive().optional(),
  scheduled_date: z.string().optional(),
  module_id: z.string().uuid().optional(),
})

export const updateLessonSchema = createLessonSchema.partial().extend({
  lesson_id: z.string().uuid(),
  status: z.enum(['draft', 'scheduled', 'in_progress', 'completed', 'cancelled']).optional(),
})

export const toggleChecklistSchema = z.object({
  checklist_id: z.string().uuid(),
  is_done: z.boolean(),
})

export const toggleFavoriteSchema = z.object({
  lesson_id: z.string().uuid(),
})

export const createLessonCommentSchema = z.object({
  lesson_id: z.string().uuid(),
  content: z.string().min(1).max(2000),
  parent_id: z.string().uuid().optional(),
})

export const updateLessonStatusSchema = z.object({
  lesson_id: z.string().uuid(),
  status: z.enum(['draft', 'scheduled', 'in_progress', 'completed', 'cancelled']),
})

// =============================================
// Lesson Materials
// =============================================
export const createMaterialSchema = z.object({
  lesson_id: z.string().uuid(),
  title: z.string().min(1, 'Titulo obrigatorio').max(200),
  description: z.string().max(2000).optional(),
  material_type: z.enum(['document', 'video', 'audio', 'link', 'sheet_music']).default('document'),
  file_url: z.string().max(500).optional(),
  order_index: z.number().int().min(0).default(0),
})

export const updateMaterialSchema = z.object({
  id: z.string().uuid(),
  title: z.string().min(1).max(200).optional(),
  description: z.string().max(2000).optional(),
  material_type: z.enum(['document', 'video', 'audio', 'link', 'sheet_music']).optional(),
  file_url: z.string().max(500).optional(),
  order_index: z.number().int().min(0).optional(),
})

// =============================================
// Lesson Activities
// =============================================
export const createActivitySchema = z.object({
  lesson_id: z.string().uuid(),
  title: z.string().min(1, 'Titulo obrigatorio').max(200),
  description: z.string().max(5000).optional(),
  activity_type: z.enum(['abertura', 'principal', 'alpha', 'final']).default('principal'),
  duration_minutes: z.number().int().min(1).max(480).optional(),
  order_index: z.number().int().min(0).default(0),
})

export const updateActivitySchema = z.object({
  id: z.string().uuid(),
  title: z.string().min(1).max(200).optional(),
  description: z.string().max(5000).optional(),
  activity_type: z.enum(['abertura', 'principal', 'alpha', 'final']).optional(),
  duration_minutes: z.number().int().min(1).max(480).optional(),
  order_index: z.number().int().min(0).optional(),
})

// =============================================
// Evaluation Criteria
// =============================================
export const createCriteriaSchema = z.object({
  lesson_id: z.string().uuid(),
  name: z.string().min(1, 'Nome obrigatorio').max(200),
  description: z.string().max(2000).optional(),
  weight: z.number().min(0).max(100).default(1),
  order_index: z.number().int().min(0).default(0),
})

export const updateCriteriaSchema = z.object({
  id: z.string().uuid(),
  name: z.string().min(1).max(200).optional(),
  description: z.string().max(2000).optional(),
  weight: z.number().min(0).max(100).optional(),
  order_index: z.number().int().min(0).optional(),
})

// =============================================
// Lesson Tags
// =============================================
export const addLessonTagSchema = z.object({
  lesson_id: z.string().uuid(),
  tag: z.string().min(1).max(50),
})

export const removeLessonTagSchema = z.object({
  id: z.string().uuid(),
})

// =============================================
// Profile
// =============================================
export const updateProfileSchema = z.object({
  full_name: z.string().min(1).max(200).optional(),
  display_name: z.string().max(100).optional(),
  phone: z.string().max(30).optional(),
  birth_date: z.string().optional(),
}).refine(data => Object.values(data).some(v => v !== undefined), {
  message: 'Pelo menos um campo deve ser informado',
})

// =============================================
// Repertoire
// =============================================
export const createRepertoireSchema = z.object({
  title: z.string().min(1, 'Título é obrigatório').max(200),
  composer: z.string().max(200).optional(),
  arranger: z.string().max(200).optional(),
  difficulty_level: z.number().int().min(1).max(10).optional(),
  key_signature: z.string().max(20).optional(),
  notes: z.string().max(5000).optional(),
})

export const updateRepertoireSchema = z.object({
  id: z.string().uuid(),
  title: z.string().min(1).max(200).optional(),
  composer: z.string().max(200).optional(),
  arranger: z.string().max(200).optional(),
  difficulty_level: z.number().int().min(1).max(10).optional(),
  key_signature: z.string().max(20).optional(),
  notes: z.string().max(5000).optional(),
})
