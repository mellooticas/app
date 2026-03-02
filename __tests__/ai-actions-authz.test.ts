import { describe, it, expect, vi, beforeEach } from 'vitest'

// Mock dependencies before importing actions
vi.mock('@/lib/utils/action-context', () => ({
  getActionContext: vi.fn(),
}))

vi.mock('@/lib/auth/check-permission', () => ({
  checkPermission: vi.fn(),
}))

vi.mock('@/lib/validations/validate-action', () => ({
  validateAction: vi.fn(),
}))

vi.mock('@/lib/ai/ai-client', () => ({
  generateText: vi.fn().mockResolvedValue('mock material'),
  generateJSON: vi.fn().mockResolvedValue({ exercises: [] }),
}))

vi.mock('@/lib/ai/prompts', () => ({
  SYSTEM_BASE: 'mock',
  LESSON_MATERIAL_PROMPT: 'mock',
  EXERCISE_PROMPT: 'mock',
  FEEDBACK_PROMPT: 'mock',
}))

vi.mock('@/lib/ai/curriculum-context', () => ({
  buildLessonContext: vi.fn().mockReturnValue('mock context'),
}))

vi.mock('next/cache', () => ({
  revalidatePath: vi.fn(),
}))

import { getActionContext } from '@/lib/utils/action-context'
import { checkPermission } from '@/lib/auth/check-permission'
import { validateAction } from '@/lib/validations/validate-action'

const mockGetActionContext = vi.mocked(getActionContext)
const mockCheckPermission = vi.mocked(checkPermission)
const mockValidateAction = vi.mocked(validateAction)

describe('AI Actions - Authorization Guards', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('generateLessonMaterials', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { generateLessonMaterials } = await import('@/app/actions/ai-actions')
      mockValidateAction.mockResolvedValue({ success: true, data: { lesson_id: 'abc' } })
      mockGetActionContext.mockResolvedValue(null)

      const result = await generateLessonMaterials({ lesson_id: 'abc' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })

    it('returns FORBIDDEN when user lacks lessons.create permission', async () => {
      const { generateLessonMaterials } = await import('@/app/actions/ai-actions')
      mockValidateAction.mockResolvedValue({ success: true, data: { lesson_id: 'abc' } })
      mockGetActionContext.mockResolvedValue({
        supabase: {} as any,
        userId: 'user-1',
        tenantId: 'tenant-1',
      })
      mockCheckPermission.mockResolvedValue(false)

      const result = await generateLessonMaterials({ lesson_id: 'abc' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('FORBIDDEN')
      expect(mockCheckPermission).toHaveBeenCalledWith('lessons.create')
    })
  })

  describe('generateBatchMaterials', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { generateBatchMaterials } = await import('@/app/actions/ai-actions')
      mockValidateAction.mockResolvedValue({ success: true, data: { lesson_ids: ['a'] } })
      mockGetActionContext.mockResolvedValue(null)

      const result = await generateBatchMaterials({ lesson_ids: ['a'] })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })

    it('returns FORBIDDEN when user lacks lessons.create permission', async () => {
      const { generateBatchMaterials } = await import('@/app/actions/ai-actions')
      mockValidateAction.mockResolvedValue({ success: true, data: { lesson_ids: ['a'] } })
      mockGetActionContext.mockResolvedValue({
        supabase: {} as any,
        userId: 'user-1',
        tenantId: 'tenant-1',
      })
      mockCheckPermission.mockResolvedValue(false)

      const result = await generateBatchMaterials({ lesson_ids: ['a'] })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('FORBIDDEN')
    })
  })
})

describe('AI Feedback Actions - Authorization Guards', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('requestAIFeedback', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { requestAIFeedback } = await import('@/app/actions/ai-feedback-actions')
      mockGetActionContext.mockResolvedValue(null)

      const result = await requestAIFeedback('challenge', 'sub-1', 'ch-1')

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })

    it('returns FORBIDDEN when user lacks lessons.create permission', async () => {
      const { requestAIFeedback } = await import('@/app/actions/ai-feedback-actions')
      mockGetActionContext.mockResolvedValue({
        supabase: {} as any,
        userId: 'user-1',
        tenantId: 'tenant-1',
      })
      mockCheckPermission.mockResolvedValue(false)

      const result = await requestAIFeedback('challenge', 'sub-1', 'ch-1')

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('FORBIDDEN')
    })
  })
})
