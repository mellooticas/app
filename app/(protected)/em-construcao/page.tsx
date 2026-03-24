'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'

/** Redirect orphan route to dashboard */
export default function EmConstrucaoPage() {
  const router = useRouter()
  useEffect(() => {
    router.replace('/dashboard')
  }, [router])
  return null
}
