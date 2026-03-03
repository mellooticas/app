import { describe, it, expect, vi, beforeEach } from 'vitest'

vi.mock('@/lib/utils/action-context', () => ({
  getActionContext: vi.fn(),
}))

vi.mock('@/lib/auth/check-permission', () => ({
  checkPermission: vi.fn(),
}))

vi.mock('@/lib/validations/validate-action', () => ({
  validateAction: vi.fn(),
}))

vi.mock('next/cache', () => ({
  revalidatePath: vi.fn(),
}))

vi.mock('@/app/actions/alpha-engine-actions', () => ({
  onLessonComplete: vi.fn().mockResolvedValue(undefined),
}))

import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'

const mockGetActionContext = vi.mocked(getActionContext)
const mockValidateAction = vi.mocked(validateAction)

describe('Lesson Actions - Authorization Guards', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('createLesson', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { createLesson } = await import('@/app/actions/lesson-actions')
      mockValidateAction.mockResolvedValue({ success: true, data: { title: 'Test', module_id: 'm1', lesson_number: 1 } })
      mockGetActionContext.mockResolvedValue(null)

      const result = await createLesson({ title: 'Test', module_id: 'm1', lesson_number: 1 })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('updateLesson', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { updateLesson } = await import('@/app/actions/lesson-actions')
      mockValidateAction.mockResolvedValue({ success: true, data: { lesson_id: 'l1', title: 'Updated' } })
      mockGetActionContext.mockResolvedValue(null)

      const result = await updateLesson({ lesson_id: 'l1', title: 'Updated' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('completeLesson', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { completeLesson } = await import('@/app/actions/lesson-actions')
      mockGetActionContext.mockResolvedValue(null)

      const result = await completeLesson('lesson-1')

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('toggleLessonFavorite', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { toggleLessonFavorite } = await import('@/app/actions/lesson-actions')
      mockGetActionContext.mockResolvedValue(null)

      const result = await toggleLessonFavorite('lesson-1')

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('createLessonComment', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { createLessonComment } = await import('@/app/actions/lesson-actions')
      mockValidateAction.mockResolvedValue({
        success: true,
        data: { lesson_id: 'l1', content: 'Test comment' },
      })
      mockGetActionContext.mockResolvedValue(null)

      const result = await createLessonComment({ lesson_id: 'l1', content: 'Test comment' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('deleteLessonComment', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { deleteLessonComment } = await import('@/app/actions/lesson-actions')
      mockGetActionContext.mockResolvedValue(null)

      const result = await deleteLessonComment('comment-1')

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('updateLessonStatus', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { updateLessonStatus } = await import('@/app/actions/lesson-actions')
      mockValidateAction.mockResolvedValue({
        success: true,
        data: { lesson_id: 'l1', status: 'published' },
      })
      mockGetActionContext.mockResolvedValue(null)

      const result = await updateLessonStatus({ lesson_id: 'l1', status: 'published' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('createMaterial', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { createMaterial } = await import('@/app/actions/lesson-actions')
      mockValidateAction.mockResolvedValue({
        success: true,
        data: { lesson_id: 'l1', title: 'Material', material_type: 'document' },
      })
      mockGetActionContext.mockResolvedValue(null)

      const result = await createMaterial({ lesson_id: 'l1', title: 'Material', material_type: 'document' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })
})
