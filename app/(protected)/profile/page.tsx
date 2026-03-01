'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { useAuth } from '@/app/providers/AuthProvider'
import { User, Mail, Phone, Calendar, MapPin, Pencil, Save, X, Loader2 } from 'lucide-react'
import { updateProfile } from '@/app/actions/profile-actions'
import type { Tables } from '@/lib/supabase/database.types'

type Profile = Tables<'v_profiles'>

export default function ProfilePage() {
  const { user } = useAuth()
  const [profile, setProfile] = useState<Profile | null>(null)
  const [loading, setLoading] = useState(true)
  const [editing, setEditing] = useState(false)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  // Edit state
  const [fullName, setFullName] = useState('')
  const [displayName, setDisplayName] = useState('')
  const [phone, setPhone] = useState('')
  const [birthDate, setBirthDate] = useState('')

  useEffect(() => {
    async function load() {
      if (!user) return
      try {
        const { data } = await supabase
          .from('v_profiles')
          .select('*')
          .eq('user_id', user.id)
          .single()
        if (data) {
          const p = data as Profile
          setProfile(p)
          setFullName(p.full_name || '')
          setDisplayName(p.display_name || '')
          setPhone(p.phone || '')
          setBirthDate(p.birth_date || '')
        }
      } catch (error) {
        console.error('Error loading profile:', error)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [user])

  async function handleSave() {
    setSaving(true)
    setError('')

    const result = await updateProfile({
      full_name: fullName.trim(),
      display_name: displayName.trim() || undefined,
      phone: phone.trim() || undefined,
      birth_date: birthDate || undefined,
    })

    if ('error' in result) {
      setError(result.error)
    } else {
      setSuccess('Perfil atualizado!')
      setEditing(false)
      // Reload profile
      const { data } = await supabase.from('v_profiles').select('*').eq('user_id', user!.id).single()
      if (data) setProfile(data as Profile)
      setTimeout(() => setSuccess(''), 3000)
    }
    setSaving(false)
  }

  if (loading) {
    return <div className="space-y-6 animate-pulse"><div className="h-48 bg-gray-200 rounded-2xl" /></div>
  }

  const p = profile || {} as Profile

  return (
    <div className="max-w-2xl mx-auto space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
          <User className="w-6 h-6 text-gray-500" />
          Meu Perfil
        </h1>
        {!editing ? (
          <button
            onClick={() => setEditing(true)}
            className="flex items-center gap-2 px-4 py-2 bg-gray-100 text-gray-700 rounded-xl font-bold hover:bg-gray-200 transition-colors"
          >
            <Pencil className="w-4 h-4" /> Editar
          </button>
        ) : (
          <div className="flex gap-2">
            <button
              onClick={handleSave}
              disabled={saving}
              className="flex items-center gap-2 px-4 py-2 bg-green-600 text-white rounded-xl font-bold hover:bg-green-700 transition-colors disabled:opacity-50"
            >
              {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
              Salvar
            </button>
            <button
              onClick={() => { setEditing(false); setFullName(p.full_name || ''); setDisplayName(p.display_name || ''); setPhone(p.phone || ''); setBirthDate(p.birth_date || '') }}
              className="flex items-center gap-2 px-4 py-2 bg-gray-100 text-gray-700 rounded-xl font-bold hover:bg-gray-200 transition-colors"
            >
              <X className="w-4 h-4" /> Cancelar
            </button>
          </div>
        )}
      </div>

      {error && <div className="bg-red-50 text-red-700 border border-red-200 rounded-xl px-4 py-3 text-sm">{error}</div>}
      {success && <div className="bg-green-50 text-green-700 border border-green-200 rounded-xl px-4 py-3 text-sm">{success}</div>}

      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
        {/* Avatar */}
        <div className="bg-gradient-to-r from-gray-800 to-gray-900 p-8 flex items-center gap-6">
          <div className="w-20 h-20 rounded-full bg-white/20 flex items-center justify-center text-3xl font-bold text-white">
            {p.full_name?.[0] || user?.email?.[0]?.toUpperCase() || '?'}
          </div>
          <div className="text-white">
            {editing ? (
              <div className="space-y-2">
                <input
                  value={fullName}
                  onChange={e => setFullName(e.target.value)}
                  placeholder="Nome completo"
                  className="bg-white/10 border border-white/20 rounded-lg px-3 py-1.5 text-lg font-bold text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-white/30"
                />
                <input
                  value={displayName}
                  onChange={e => setDisplayName(e.target.value)}
                  placeholder="Nome de exibição"
                  className="bg-white/10 border border-white/20 rounded-lg px-3 py-1.5 text-sm text-gray-300 placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-white/30 block"
                />
              </div>
            ) : (
              <>
                <h2 className="text-2xl font-bold">{p.full_name || 'Sem nome'}</h2>
                <p className="text-gray-300">{p.display_name}</p>
              </>
            )}
          </div>
        </div>

        {/* Info */}
        <div className="p-6 space-y-4">
          <InfoRow icon={Mail} label="Email" value={user?.email || ''} />
          {editing ? (
            <>
              <EditRow icon={Phone} label="Telefone" value={phone} onChange={setPhone} placeholder="(11) 99999-0000" />
              <EditRow icon={Calendar} label="Data de Nascimento" value={birthDate} onChange={setBirthDate} type="date" />
            </>
          ) : (
            <>
              {p.phone && <InfoRow icon={Phone} label="Telefone" value={p.phone} />}
              {p.birth_date && <InfoRow icon={Calendar} label="Data de Nascimento" value={new Date(p.birth_date).toLocaleDateString('pt-BR')} />}
            </>
          )}
          {p.unit_name && <InfoRow icon={MapPin} label="Unidade" value={p.unit_name} />}
        </div>
      </div>
    </div>
  )
}

function InfoRow({ icon: Icon, label, value }: { icon: any; label: string; value: string }) {
  return (
    <div className="flex items-center gap-3 py-2 border-b border-gray-50 last:border-0">
      <Icon className="w-4 h-4 text-gray-400" />
      <span className="text-sm text-gray-500 w-40">{label}</span>
      <span className="text-sm font-medium text-gray-900">{value}</span>
    </div>
  )
}

function EditRow({ icon: Icon, label, value, onChange, placeholder, type = 'text' }: { icon: any; label: string; value: string; onChange: (v: string) => void; placeholder?: string; type?: string }) {
  return (
    <div className="flex items-center gap-3 py-2 border-b border-gray-50 last:border-0">
      <Icon className="w-4 h-4 text-gray-400" />
      <span className="text-sm text-gray-500 w-40">{label}</span>
      <input
        type={type}
        value={value}
        onChange={e => onChange(e.target.value)}
        placeholder={placeholder}
        className="flex-1 px-3 py-1.5 border border-gray-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-200"
      />
    </div>
  )
}
