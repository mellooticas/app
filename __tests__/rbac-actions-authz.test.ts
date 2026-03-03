import { describe, it, expect, vi, beforeEach } from 'vitest'

// Mock dependencies — rbac-admin-actions uses its own getAuthContext() internally
// which reads from createClient + getUser + getSession
vi.mock('@/lib/supabase/server', () => ({
  createClient: vi.fn(),
}))

vi.mock('@/lib/supabase/admin-client', () => ({
  adminSupabase: {
    auth: { admin: { inviteUserByEmail: vi.fn(), createUser: vi.fn() } },
    from: vi.fn(() => ({ insert: vi.fn(), delete: vi.fn() })),
  },
}))

vi.mock('@/lib/validations/validate-action', () => ({
  validateAction: vi.fn(),
}))

vi.mock('next/cache', () => ({
  revalidatePath: vi.fn(),
}))

import { createClient } from '@/lib/supabase/server'
import { validateAction } from '@/lib/validations/validate-action'

const mockCreateClient = vi.mocked(createClient)
const mockValidateAction = vi.mocked(validateAction)

function mockNoAuth() {
  mockCreateClient.mockResolvedValue({
    auth: {
      getUser: vi.fn().mockResolvedValue({ data: { user: null }, error: new Error('no user') }),
      getSession: vi.fn().mockResolvedValue({ data: { session: null } }),
    },
  } as any)
}

function mockAuthNoAdmin() {
  mockCreateClient.mockResolvedValue({
    auth: {
      getUser: vi.fn().mockResolvedValue({ data: { user: { id: 'user-1' } }, error: null }),
      getSession: vi.fn().mockResolvedValue({
        data: {
          session: {
            access_token: `header.${btoa(JSON.stringify({ tenant_id: 'tenant-1', user_roles: ['student'] }))}.sig`,
          },
        },
      }),
    },
  } as any)
}

describe('RBAC Admin Actions - Authorization Guards', () => {
  beforeEach(() => {
    vi.clearAllMocks()
    // Reset module registry for dynamic imports
    vi.resetModules()
  })

  describe('listRoles', () => {
    it('returns UNAUTHORIZED when no user session', async () => {
      mockNoAuth()
      const { listRoles } = await import('@/app/actions/rbac-admin-actions')
      const result = await listRoles()

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })

    it('returns UNAUTHORIZED when user is not admin', async () => {
      mockAuthNoAdmin()
      const { listRoles } = await import('@/app/actions/rbac-admin-actions')
      const result = await listRoles()

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('assignUserRole', () => {
    it('returns UNAUTHORIZED when no user session', async () => {
      mockNoAuth()
      mockValidateAction.mockResolvedValue({ success: true, data: { userId: 'u1', roleSlug: 'student' } })
      const { assignUserRole } = await import('@/app/actions/rbac-admin-actions')
      const result = await assignUserRole({ userId: 'u1', roleSlug: 'student' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })

    it('returns UNAUTHORIZED when user is not admin', async () => {
      mockAuthNoAdmin()
      mockValidateAction.mockResolvedValue({ success: true, data: { userId: 'u1', roleSlug: 'student' } })
      const { assignUserRole } = await import('@/app/actions/rbac-admin-actions')
      const result = await assignUserRole({ userId: 'u1', roleSlug: 'student' })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('saveRolePermissions', () => {
    it('returns UNAUTHORIZED when no user session', async () => {
      mockNoAuth()
      mockValidateAction.mockResolvedValue({
        success: true,
        data: { roleId: 'r1', permissionIds: ['p1'] },
      })
      const { saveRolePermissions } = await import('@/app/actions/rbac-admin-actions')
      const result = await saveRolePermissions({ roleId: 'r1', permissionIds: ['p1'] })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('listUsers', () => {
    it('returns UNAUTHORIZED when user is not admin', async () => {
      mockAuthNoAdmin()
      const { listUsers } = await import('@/app/actions/rbac-admin-actions')
      const result = await listUsers()

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })

  describe('saveRoleNavigation', () => {
    it('returns UNAUTHORIZED when no user session', async () => {
      mockNoAuth()
      mockValidateAction.mockResolvedValue({
        success: true,
        data: { roleId: 'r1', items: [] },
      })
      const { saveRoleNavigation } = await import('@/app/actions/rbac-admin-actions')
      const result = await saveRoleNavigation({ roleId: 'r1', items: [] })

      expect(result.success).toBe(false)
      expect('code' in result && result.code).toBe('UNAUTHORIZED')
    })
  })
})
