import { describe, it, expect, vi, beforeEach } from 'vitest'
import { NextRequest, NextResponse } from 'next/server'

// Mock @supabase/ssr
const mockGetSession = vi.fn()
vi.mock('@supabase/ssr', () => ({
  createServerClient: vi.fn(() => ({
    auth: { getSession: mockGetSession },
  })),
}))

// Need to import after mock setup
const { proxy } = await import('../proxy')

function makeRequest(path: string): NextRequest {
  return new NextRequest(new URL(`http://localhost:4000${path}`))
}

describe('Proxy — Auth Redirects', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('unauthenticated users', () => {
    beforeEach(() => {
      mockGetSession.mockResolvedValue({ data: { session: null } })
    })

    it('redirects to /login on protected route /dashboard', async () => {
      const response = await proxy(makeRequest('/dashboard'))
      expect(response.status).toBe(307)
      expect(new URL(response.headers.get('location')!).pathname).toBe('/login')
    })

    it('redirects to /login on protected route /lessons', async () => {
      const response = await proxy(makeRequest('/lessons'))
      expect(response.status).toBe(307)
      expect(new URL(response.headers.get('location')!).pathname).toBe('/login')
    })

    it('redirects to /login on protected route /settings/users', async () => {
      const response = await proxy(makeRequest('/settings/users'))
      expect(response.status).toBe(307)
      expect(new URL(response.headers.get('location')!).pathname).toBe('/login')
    })

    it('allows access to /login (public route)', async () => {
      const response = await proxy(makeRequest('/login'))
      expect(response.status).toBe(200)
    })

    it('allows access to /register (public route)', async () => {
      const response = await proxy(makeRequest('/register'))
      expect(response.status).toBe(200)
    })

    it('allows access to /set-password (public route)', async () => {
      const response = await proxy(makeRequest('/set-password'))
      expect(response.status).toBe(200)
    })

    it('allows access to / (public route)', async () => {
      const response = await proxy(makeRequest('/'))
      expect(response.status).toBe(200)
    })

    it('allows access to /auth/callback (public route)', async () => {
      const response = await proxy(makeRequest('/auth/callback'))
      expect(response.status).toBe(200)
    })
  })

  describe('authenticated users', () => {
    beforeEach(() => {
      mockGetSession.mockResolvedValue({
        data: { session: { access_token: 'valid-token', user: { id: 'u1' } } },
      })
    })

    it('redirects /login to /dashboard', async () => {
      const response = await proxy(makeRequest('/login'))
      expect(response.status).toBe(307)
      expect(new URL(response.headers.get('location')!).pathname).toBe('/dashboard')
    })

    it('redirects / to /dashboard', async () => {
      const response = await proxy(makeRequest('/'))
      expect(response.status).toBe(307)
      expect(new URL(response.headers.get('location')!).pathname).toBe('/dashboard')
    })

    it('allows access to /dashboard', async () => {
      const response = await proxy(makeRequest('/dashboard'))
      expect(response.status).toBe(200)
    })

    it('allows access to /lessons', async () => {
      const response = await proxy(makeRequest('/lessons'))
      expect(response.status).toBe(200)
    })
  })

  describe('legacy route redirects', () => {
    beforeEach(() => {
      mockGetSession.mockResolvedValue({
        data: { session: { access_token: 'valid-token', user: { id: 'u1' } } },
      })
    })

    it('redirects /admin to /dashboard', async () => {
      const response = await proxy(makeRequest('/admin'))
      expect(response.status).toBe(307)
      expect(new URL(response.headers.get('location')!).pathname).toBe('/dashboard')
    })

    it('redirects /admin/dashboard to /dashboard', async () => {
      const response = await proxy(makeRequest('/admin/dashboard'))
      expect(response.status).toBe(307)
      expect(new URL(response.headers.get('location')!).pathname).toBe('/dashboard')
    })

    it('redirects /professores to /dashboard', async () => {
      const response = await proxy(makeRequest('/professores'))
      expect(response.status).toBe(307)
      expect(new URL(response.headers.get('location')!).pathname).toBe('/dashboard')
    })

    it('redirects /alunos to /dashboard', async () => {
      const response = await proxy(makeRequest('/alunos'))
      expect(response.status).toBe(307)
      expect(new URL(response.headers.get('location')!).pathname).toBe('/dashboard')
    })

    it('redirects /esqueci-senha to /forgot-password', async () => {
      const response = await proxy(makeRequest('/esqueci-senha'))
      expect(response.status).toBe(307)
      expect(new URL(response.headers.get('location')!).pathname).toBe('/forgot-password')
    })
  })
})
