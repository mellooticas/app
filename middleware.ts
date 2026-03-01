import { createServerClient, type CookieOptions } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'
import type { Database } from './lib/supabase/database.types'

// Public routes that don't require authentication
const publicRoutes = ['/', '/login', '/register', '/forgot-password', '/auth/callback', '/set-password']

export async function middleware(request: NextRequest) {
  let response = NextResponse.next({
    request: { headers: request.headers },
  })

  const supabase = createServerClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        get(name: string) {
          return request.cookies.get(name)?.value
        },
        set(name: string, value: string, options: CookieOptions) {
          request.cookies.set({ name, value, ...options })
          response = NextResponse.next({
            request: { headers: request.headers },
          })
          response.cookies.set({ name, value, ...options })
        },
        remove(name: string, options: CookieOptions) {
          request.cookies.set({ name, value: '', ...options })
          response = NextResponse.next({
            request: { headers: request.headers },
          })
          response.cookies.set({ name, value: '', ...options })
        },
      },
    }
  )

  const { data: { session } } = await supabase.auth.getSession()
  const path = request.nextUrl.pathname

  // No session + protected route → redirect to login
  if (!session && !publicRoutes.includes(path)) {
    return NextResponse.redirect(new URL('/login', request.url))
  }

  // Has session + login/root page → redirect to dashboard
  if (session && (path === '/login' || path === '/')) {
    return NextResponse.redirect(new URL('/dashboard', request.url))
  }

  // Redirect legacy routes to unified routes
  const legacyRedirects: Record<string, string> = {
    '/admin': '/dashboard',
    '/admin/dashboard': '/dashboard',
    '/professores': '/dashboard',
    '/professores/dashboard': '/dashboard',
    '/alunos': '/dashboard',
    '/alunos/dashboard': '/dashboard',
    '/esqueci-senha': '/forgot-password',
  }

  const redirect = legacyRedirects[path]
  if (redirect) {
    return NextResponse.redirect(new URL(redirect, request.url))
  }

  return response
}

export const config = {
  matcher: [
    '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
  ],
}
