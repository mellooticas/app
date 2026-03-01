'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { User, ArrowLeft, BookOpen, Users, Calendar } from 'lucide-react'
import Link from 'next/link'
import type { Tables } from '@/lib/supabase/database.types'

type Profile = Tables<'v_profiles'>

export default function TeacherDetailPage() {
  const { id } = useParams<{ id: string }>()
  const [profile, setProfile] = useState<Profile | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const { data: p } = await supabase
          .from('v_profiles')
          .select('*')
          .eq('user_id', id)
          .single()
        if (p) setProfile(p as Profile)
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  if (loading) {
    return (
      <div className="space-y-6 animate-pulse">
        <div className="h-48 bg-gray-200 rounded-2xl" />
        <div className="h-32 bg-gray-200 rounded-2xl" />
      </div>
    )
  }

  if (!profile) {
    return (
      <div className="text-center py-16">
        <p className="text-gray-500">Professor(a) não encontrado(a).</p>
        <Link href="/teachers" className="text-blue-600 hover:underline mt-4 inline-block">
          Voltar
        </Link>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <Link href="/teachers" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar
      </Link>

      {/* Profile Header */}
      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
        <div className="flex items-center gap-4">
          <div className="w-16 h-16 bg-blue-50 rounded-full flex items-center justify-center">
            {profile.avatar_url ? (
              <img src={profile.avatar_url} alt="" className="w-full h-full rounded-full object-cover" />
            ) : (
              <User className="w-8 h-8 text-blue-400" />
            )}
          </div>
          <div>
            <h1 className="text-2xl font-bold text-gray-900">{profile.full_name || profile.display_name}</h1>
            {profile.display_name && profile.full_name && profile.display_name !== profile.full_name && (
              <p className="text-sm text-gray-500">{profile.display_name}</p>
            )}
            <span className="inline-flex items-center gap-1 mt-1 px-2 py-0.5 rounded-lg text-xs font-bold bg-blue-100 text-blue-700">
              Sensei
            </span>
          </div>
        </div>
      </div>

      {/* Info Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div className="bg-white rounded-xl p-4 border border-gray-100 text-center">
          <BookOpen className="w-5 h-5 text-gray-400 mx-auto mb-2" />
          <p className="text-xs text-gray-500">Unidade</p>
          <p className="font-bold text-gray-900">{profile.unit_name || 'N/A'}</p>
        </div>
        <div className="bg-white rounded-xl p-4 border border-gray-100 text-center">
          <Calendar className="w-5 h-5 text-gray-400 mx-auto mb-2" />
          <p className="text-xs text-gray-500">Desde</p>
          <p className="font-bold text-gray-900">
            {profile.created_at ? new Date(profile.created_at).toLocaleDateString('pt-BR') : 'N/A'}
          </p>
        </div>
        <div className="bg-white rounded-xl p-4 border border-gray-100 text-center">
          <Users className="w-5 h-5 text-gray-400 mx-auto mb-2" />
          <p className="text-xs text-gray-500">Status</p>
          <p className="font-bold text-gray-900">
            {profile.is_active ? 'Ativo' : 'Inativo'}
          </p>
        </div>
      </div>
    </div>
  )
}
