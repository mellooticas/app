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
  onChallengeComplete: vi.fn().mockResolvedValue(undefined),
}))

vi.mock('@/app/actions/ai-feedback-actions', () => ({
  generateChallengeFeedback: vi.fn().mockResolvedValue(undefined),
}))

import { getActionContext } from '@/lib/utils/action-context'
import { validateAction } from '@/lib/validations/validate-action'

const mockGetActionContext = vi.mocked(getActionContext)
const mockValidateAction = vi.mocked(validateAction)

describe('Challenge Actions - Authorization Guards', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('submitChallenge', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { submitChallenge } = await import('@/app/actions/challenge-actions')
      mockValidateAction.mockResolvedValue({
        success: true,
        data: { challenge_id: 'c1', response: 'My answer' },
      })
      mockGetActionContext.mockResolvedValue(null)

      const result = await submitChallenge({ challenge_id: 'c1', response: 'My answer' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('evaluateSubmission', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { evaluateSubmission } = await import('@/app/actions/challenge-actions')
      mockValidateAction.mockResolvedValue({
        success: true,
        data: { submission_id: 's1', grade: 8, feedback: 'Good', status: 'evaluated' },
      })
      mockGetActionContext.mockResolvedValue(null)

      const result = await evaluateSubmission({
        submission_id: 's1',
        grade: 8,
        feedback: 'Good',
        status: 'evaluated',
      })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })
})
