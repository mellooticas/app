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

import { getActionContext } from '@/lib/utils/action-context'
import { checkPermission } from '@/lib/auth/check-permission'
import { validateAction } from '@/lib/validations/validate-action'

const mockGetActionContext = vi.mocked(getActionContext)
const mockCheckPermission = vi.mocked(checkPermission)
const mockValidateAction = vi.mocked(validateAction)

describe('Library Actions - Authorization Guards', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('createLibraryItem', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { createLibraryItem } = await import('@/app/actions/library-actions')
      mockValidateAction.mockResolvedValue({ success: true, data: { title: 'Test' } })
      mockGetActionContext.mockResolvedValue(null)

      const result = await createLibraryItem({ title: 'Test' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })

    it('returns FORBIDDEN when user lacks lessons.create permission', async () => {
      const { createLibraryItem } = await import('@/app/actions/library-actions')
      mockValidateAction.mockResolvedValue({ success: true, data: { title: 'Test' } })
      mockGetActionContext.mockResolvedValue({
        supabase: {} as any,
        userId: 'user-1',
        tenantId: 'tenant-1',
      })
      mockCheckPermission.mockResolvedValue(false)

      const result = await createLibraryItem({ title: 'Test' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('FORBIDDEN')
      expect(mockCheckPermission).toHaveBeenCalledWith('lessons.create')
    })
  })

  describe('updateLibraryItem', () => {
    it('returns FORBIDDEN when user lacks lessons.edit permission', async () => {
      const { updateLibraryItem } = await import('@/app/actions/library-actions')
      mockValidateAction.mockResolvedValue({ success: true, data: { id: '1', title: 'Updated' } })
      mockGetActionContext.mockResolvedValue({
        supabase: {} as any,
        userId: 'user-1',
        tenantId: 'tenant-1',
      })
      mockCheckPermission.mockResolvedValue(false)

      const result = await updateLibraryItem({ id: '1', title: 'Updated' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('FORBIDDEN')
      expect(mockCheckPermission).toHaveBeenCalledWith('lessons.edit')
    })
  })

  describe('deleteLibraryItem', () => {
    it('returns UNAUTHORIZED when no auth context', async () => {
      const { deleteLibraryItem } = await import('@/app/actions/library-actions')
      mockGetActionContext.mockResolvedValue(null)

      const result = await deleteLibraryItem('item-1')

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })

    it('returns FORBIDDEN when user lacks lessons.create permission', async () => {
      const { deleteLibraryItem } = await import('@/app/actions/library-actions')
      mockGetActionContext.mockResolvedValue({
        supabase: {} as any,
        userId: 'user-1',
        tenantId: 'tenant-1',
      })
      mockCheckPermission.mockResolvedValue(false)

      const result = await deleteLibraryItem('item-1')

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('FORBIDDEN')
    })
  })
})
