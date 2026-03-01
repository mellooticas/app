'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import {
  Users, Search, Shield, ChevronLeft, UserCheck, UserX,
  Crown, GraduationCap, Music, MailPlus, X, Check,
  Pencil, Phone, Building2, Loader2,
} from 'lucide-react'
import { supabase } from '@/lib/supabase/client'
import { PermissionGate } from '@/components/auth/PermissionGate'
import {
  listUsers,
  assignUserRole,
  removeUserRole,
  toggleUserActive,
  inviteUser,
  updateProfile,
} from '@/app/actions/rbac-admin-actions'
import type { UserRole } from '@/lib/types/rbac'

interface UserProfile {
  id: string
  user_id: string
  tenant_id: string
  full_name: string
  display_name: string | null
  avatar_url: string | null
  phone: string | null
  is_active: boolean
  created_at: string
  unit_id: string | null
  unit_name: string | null
  primary_instrument_id: string | null
  roles: Array<{ slug: string; display_name: string }>
}

interface Instrument {
  id: string
  name: string
}

interface Unit {
  id: string
  name: string
  city: string | null
  is_active: boolean
}

interface ProfileInstrument {
  id: string
  user_id: string
  instrument_id: string
  is_primary: boolean
  instrument_name: string
}

const ROLE_BADGE: Record<string, { label: string; color: string; icon: typeof Crown }> = {
  admin: { label: 'Admin', color: 'bg-purple-100 text-purple-700', icon: Crown },
  teacher: { label: 'Sensei', color: 'bg-blue-100 text-blue-700', icon: GraduationCap },
  student: { label: 'Aluno', color: 'bg-red-100 text-red-700', icon: Music },
}

export default function UsersPage() {
  const router = useRouter()
  const [users, setUsers] = useState<UserProfile[]>([])
  const [instruments, setInstruments] = useState<Instrument[]>([])
  const [units, setUnits] = useState<Unit[]>([])
  const [profileInstruments, setProfileInstruments] = useState<ProfileInstrument[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [roleFilter, setRoleFilter] = useState<string>('all')
  const [showInvite, setShowInvite] = useState(false)
  const [inviteEmail, setInviteEmail] = useState('')
  const [inviteRole, setInviteRole] = useState<UserRole>('student')
  const [saving, setSaving] = useState(false)
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  // Edit profile modal state
  const [showEditModal, setShowEditModal] = useState(false)
  const [editUser, setEditUser] = useState<UserProfile | null>(null)
  const [editName, setEditName] = useState('')
  const [editDisplayName, setEditDisplayName] = useState('')
  const [editPhone, setEditPhone] = useState('')
  const [editUnitId, setEditUnitId] = useState('')
  const [editInstrumentIds, setEditInstrumentIds] = useState<string[]>([])

  useEffect(() => {
    loadData()
  }, [])

  async function loadData() {
    setLoading(true)
    const [usersResult, instrumentsRes, unitsRes, profInstRes] = await Promise.all([
      listUsers(),
      supabase.from('instruments').select('id, name').eq('is_active', true).order('name'),
      supabase.from('units').select('id, name, city, is_active').eq('is_active', true).order('name'),
      supabase.from('v_profile_instruments').select('*'),
    ])

    if (usersResult.success) {
      const all = usersResult.data as UserProfile[]
      setUsers(all.filter(u => !/^Aluno (Seed )?\d+$/.test(u.full_name || '')))
    }
    if (instrumentsRes.data) setInstruments(instrumentsRes.data as Instrument[])
    if (unitsRes.data) setUnits(unitsRes.data as Unit[])
    if (profInstRes.data) setProfileInstruments(profInstRes.data as ProfileInstrument[])

    setLoading(false)
  }

  function showMessage(type: 'success' | 'error', text: string) {
    setMessage({ type, text })
    setTimeout(() => setMessage(null), 3000)
  }

  async function handleAssignRole(userId: string, roleSlug: string) {
    setSaving(true)
    const result = await assignUserRole({ userId, roleSlug })
    if ('error' in result) { showMessage('error', result.error); setSaving(false); return }
    showMessage('success', result.message || 'Role atribuído')
    await loadData()
    setSaving(false)
  }

  async function handleRemoveRole(userId: string, roleSlug: string) {
    setSaving(true)
    const result = await removeUserRole({ userId, roleSlug })
    if ('error' in result) { showMessage('error', result.error); setSaving(false); return }
    showMessage('success', result.message || 'Role removido')
    await loadData()
    setSaving(false)
  }

  async function handleToggleActive(userId: string, isActive: boolean) {
    setSaving(true)
    const result = await toggleUserActive({ userId, isActive })
    if ('error' in result) { showMessage('error', result.error); setSaving(false); return }
    showMessage('success', result.message || 'Status alterado')
    await loadData()
    setSaving(false)
  }

  async function handleInvite() {
    if (!inviteEmail) return
    setSaving(true)
    const result = await inviteUser({ email: inviteEmail, roleSlug: inviteRole })
    if ('error' in result) { showMessage('error', result.error); setSaving(false); return }
    showMessage('success', 'Convite enviado com sucesso')
    setShowInvite(false)
    setInviteEmail('')
    setSaving(false)
  }

  function openEditModal(user: UserProfile) {
    setEditUser(user)
    setEditName(user.full_name || '')
    setEditDisplayName(user.display_name || '')
    setEditPhone(user.phone || '')
    setEditUnitId(user.unit_id || '')
    const userInsts = profileInstruments
      .filter(pi => pi.user_id === user.user_id)
      .map(pi => pi.instrument_id)
    setEditInstrumentIds(userInsts.length > 0 ? userInsts : user.primary_instrument_id ? [user.primary_instrument_id] : [])
    setShowEditModal(true)
  }

  async function handleEditSave() {
    if (!editUser || !editName.trim()) return
    setSaving(true)
    const result = await updateProfile({
      userId: editUser.user_id,
      fullName: editName.trim(),
      displayName: editDisplayName.trim() || undefined,
      phone: editPhone.trim() || undefined,
      unitId: editUnitId || null,
      instrumentIds: editInstrumentIds,
    })
    if ('error' in result) {
      showMessage('error', result.error)
    } else {
      showMessage('success', result.message || 'Perfil atualizado')
      setShowEditModal(false)
      setEditUser(null)
      await loadData()
    }
    setSaving(false)
  }

  function toggleEditInstrument(instrumentId: string) {
    setEditInstrumentIds(prev =>
      prev.includes(instrumentId)
        ? prev.filter(id => id !== instrumentId)
        : [...prev, instrumentId]
    )
  }

  const filtered = users.filter(u => {
    const matchesSearch = search === '' ||
      u.full_name?.toLowerCase().includes(search.toLowerCase()) ||
      u.display_name?.toLowerCase().includes(search.toLowerCase())
    const matchesRole = roleFilter === 'all' ||
      u.roles?.some(r => r.slug === roleFilter)
    return matchesSearch && matchesRole
  })

  return (
    <PermissionGate permission="settings.view" fallback={<div className="text-center py-16"><p className="text-gray-500">Sem permissão.</p></div>}>
      <div className="max-w-5xl mx-auto space-y-6">
        {/* Header */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <button onClick={() => router.push('/settings')} className="p-2 hover:bg-gray-100 rounded-lg transition-colors">
              <ChevronLeft className="w-5 h-5 text-gray-500" />
            </button>
            <div>
              <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
                <Users className="w-6 h-6 text-purple-600" />
                Gestão de Usuários
              </h1>
              <p className="text-sm text-gray-500 mt-1">{users.length} usuários no sistema</p>
            </div>
          </div>
          <button
            onClick={() => setShowInvite(true)}
            className="flex items-center gap-2 px-4 py-2.5 bg-purple-600 text-white rounded-xl font-bold text-sm hover:bg-purple-700 transition-colors shadow-sm"
          >
            <MailPlus className="w-4 h-4" />
            Convidar
          </button>
        </div>

        {/* Toast */}
        {message && (
          <div className={`px-4 py-3 rounded-xl text-sm font-medium ${
            message.type === 'success' ? 'bg-green-50 text-green-700 border border-green-200' : 'bg-red-50 text-red-700 border border-red-200'
          }`}>
            {message.text}
          </div>
        )}

        {/* Filters */}
        <div className="flex flex-col sm:flex-row gap-3">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
            <input
              type="text"
              placeholder="Buscar por nome..."
              value={search}
              onChange={e => setSearch(e.target.value)}
              className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-purple-200 focus:border-purple-400 outline-none"
            />
          </div>
          <select
            value={roleFilter}
            onChange={e => setRoleFilter(e.target.value)}
            className="px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-purple-200 focus:border-purple-400 outline-none bg-white"
          >
            <option value="all">Todos os roles</option>
            <option value="admin">Admin</option>
            <option value="teacher">Sensei</option>
            <option value="student">Aluno</option>
          </select>
        </div>

        {/* Users List */}
        {loading ? (
          <div className="space-y-3">
            {[...Array(5)].map((_, i) => (
              <div key={i} className="bg-white rounded-xl border border-gray-100 p-4 animate-pulse">
                <div className="flex items-center gap-4">
                  <div className="w-10 h-10 bg-gray-200 rounded-full" />
                  <div className="flex-1 space-y-2">
                    <div className="h-4 bg-gray-200 rounded w-1/3" />
                    <div className="h-3 bg-gray-100 rounded w-1/4" />
                  </div>
                </div>
              </div>
            ))}
          </div>
        ) : filtered.length === 0 ? (
          <div className="text-center py-16 bg-white rounded-xl border border-gray-100">
            <Users className="w-12 h-12 text-gray-300 mx-auto mb-3" />
            <p className="text-gray-500">Nenhum usuário encontrado</p>
          </div>
        ) : (
          <div className="space-y-2">
            {filtered.map(user => (
              <div
                key={user.id}
                className={`bg-white rounded-xl border border-gray-100 shadow-sm p-4 hover:shadow-md transition-all ${
                  !user.is_active ? 'opacity-60' : ''
                }`}
              >
                <div className="flex items-center gap-4">
                  {/* Avatar */}
                  <div className="w-10 h-10 rounded-full bg-purple-100 flex items-center justify-center text-purple-600 font-bold flex-shrink-0">
                    {user.avatar_url ? (
                      <img src={user.avatar_url} alt="" className="w-10 h-10 rounded-full object-cover" />
                    ) : (
                      user.full_name?.[0]?.toUpperCase() || '?'
                    )}
                  </div>

                  {/* Info */}
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <span className="font-bold text-gray-900 truncate">{user.full_name}</span>
                      {!user.is_active && (
                        <span className="px-1.5 py-0.5 rounded text-[10px] font-bold bg-gray-100 text-gray-500 uppercase">Inativo</span>
                      )}
                    </div>
                    <div className="flex items-center gap-2 text-xs text-gray-500">
                      {user.unit_name && (
                        <span className="flex items-center gap-1">
                          <Building2 className="w-3 h-3" />
                          {user.unit_name}
                        </span>
                      )}
                      {user.phone && (
                        <span className="flex items-center gap-1">
                          <Phone className="w-3 h-3" />
                          {user.phone}
                        </span>
                      )}
                      {!user.unit_name && !user.phone && (
                        <span>{user.display_name || 'Sem unidade'}</span>
                      )}
                    </div>
                  </div>

                  {/* Roles */}
                  <div className="flex items-center gap-1.5 flex-shrink-0">
                    {user.roles?.map(role => {
                      const badge = ROLE_BADGE[role.slug] || ROLE_BADGE.student
                      const Icon = badge.icon
                      return (
                        <span
                          key={role.slug}
                          className={`inline-flex items-center gap-1 px-2 py-1 rounded-lg text-xs font-bold ${badge.color}`}
                        >
                          <Icon className="w-3 h-3" />
                          {badge.label}
                        </span>
                      )
                    })}
                  </div>

                  {/* Actions */}
                  <div className="flex items-center gap-1 flex-shrink-0">
                    {/* Edit button */}
                    <button
                      onClick={() => openEditModal(user)}
                      disabled={saving}
                      title="Editar perfil"
                      className="p-1.5 rounded-lg text-gray-300 hover:text-blue-600 hover:bg-blue-50 transition-all"
                    >
                      <Pencil className="w-3.5 h-3.5" />
                    </button>

                    {/* Role toggles */}
                    {(['admin', 'teacher', 'student'] as const).map(roleSlug => {
                      const hasRole = user.roles?.some(r => r.slug === roleSlug)
                      const badge = ROLE_BADGE[roleSlug]
                      const Icon = badge.icon
                      return (
                        <button
                          key={roleSlug}
                          onClick={() => hasRole
                            ? handleRemoveRole(user.user_id, roleSlug)
                            : handleAssignRole(user.user_id, roleSlug)
                          }
                          disabled={saving}
                          title={hasRole ? `Remover ${badge.label}` : `Adicionar ${badge.label}`}
                          className={`p-1.5 rounded-lg transition-all ${
                            hasRole
                              ? `${badge.color} shadow-sm`
                              : 'text-gray-300 hover:text-gray-500 hover:bg-gray-50'
                          }`}
                        >
                          <Icon className="w-3.5 h-3.5" />
                        </button>
                      )
                    })}

                    {/* Active toggle */}
                    <button
                      onClick={() => handleToggleActive(user.user_id, !user.is_active)}
                      disabled={saving}
                      title={user.is_active ? 'Desativar' : 'Ativar'}
                      className={`p-1.5 rounded-lg transition-all ml-1 ${
                        user.is_active
                          ? 'text-green-600 hover:bg-green-50'
                          : 'text-gray-400 hover:bg-gray-50'
                      }`}
                    >
                      {user.is_active ? <UserCheck className="w-3.5 h-3.5" /> : <UserX className="w-3.5 h-3.5" />}
                    </button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}

        {/* Invite Modal */}
        {showInvite && (
          <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4" onClick={() => setShowInvite(false)}>
            <div className="bg-white rounded-2xl shadow-xl w-full max-w-md p-6 space-y-4" onClick={e => e.stopPropagation()}>
              <div className="flex items-center justify-between">
                <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
                  <MailPlus className="w-5 h-5 text-purple-600" />
                  Convidar Usuário
                </h2>
                <button onClick={() => setShowInvite(false)} className="p-1 hover:bg-gray-100 rounded-lg">
                  <X className="w-5 h-5 text-gray-400" />
                </button>
              </div>

              <div className="space-y-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
                  <input
                    type="email"
                    value={inviteEmail}
                    onChange={e => setInviteEmail(e.target.value)}
                    placeholder="email@exemplo.com"
                    className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-purple-200 focus:border-purple-400 outline-none"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Role</label>
                  <select
                    value={inviteRole}
                    onChange={e => setInviteRole(e.target.value as UserRole)}
                    className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-purple-200 focus:border-purple-400 outline-none bg-white"
                  >
                    <option value="student">Aluno</option>
                    <option value="teacher">Sensei</option>
                    <option value="admin">Admin</option>
                  </select>
                </div>
              </div>

              <div className="flex justify-end gap-2 pt-2">
                <button
                  onClick={() => setShowInvite(false)}
                  className="px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-100 rounded-xl transition-colors"
                >
                  Cancelar
                </button>
                <button
                  onClick={handleInvite}
                  disabled={saving || !inviteEmail}
                  className="flex items-center gap-2 px-4 py-2 bg-purple-600 text-white rounded-xl text-sm font-bold hover:bg-purple-700 transition-colors disabled:opacity-50"
                >
                  <Check className="w-4 h-4" />
                  Enviar Convite
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Edit Profile Modal */}
        {showEditModal && editUser && (
          <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4" onClick={() => setShowEditModal(false)}>
            <div className="bg-white rounded-2xl shadow-xl w-full max-w-md p-6 space-y-4" onClick={e => e.stopPropagation()}>
              <div className="flex items-center justify-between">
                <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
                  <Pencil className="w-5 h-5 text-purple-600" />
                  Editar Perfil
                </h2>
                <button onClick={() => setShowEditModal(false)} className="p-1 hover:bg-gray-100 rounded-lg">
                  <X className="w-5 h-5 text-gray-400" />
                </button>
              </div>

              {/* User Info */}
              <div className="flex items-center gap-3 p-3 bg-gray-50 rounded-xl">
                <div className="w-10 h-10 rounded-full bg-purple-100 flex items-center justify-center text-purple-600 font-bold">
                  {editUser.full_name?.[0]?.toUpperCase() || '?'}
                </div>
                <div>
                  <p className="font-bold text-gray-900">{editUser.full_name}</p>
                  <p className="text-xs text-gray-500">
                    {editUser.roles?.map(r => r.display_name).join(', ') || 'Sem role'}
                  </p>
                </div>
              </div>

              <div className="space-y-3">
                {/* Name */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Nome Completo</label>
                  <input
                    type="text"
                    value={editName}
                    onChange={e => setEditName(e.target.value)}
                    className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-purple-200 focus:border-purple-400 outline-none"
                  />
                </div>

                {/* Display Name */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Apelido <span className="text-gray-400 font-normal">(opcional)</span>
                  </label>
                  <input
                    type="text"
                    value={editDisplayName}
                    onChange={e => setEditDisplayName(e.target.value)}
                    placeholder="Nome de exibição"
                    className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-purple-200 focus:border-purple-400 outline-none"
                  />
                </div>

                {/* Phone */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Telefone <span className="text-gray-400 font-normal">(opcional)</span>
                  </label>
                  <div className="relative">
                    <Phone className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <input
                      type="tel"
                      value={editPhone}
                      onChange={e => setEditPhone(e.target.value)}
                      placeholder="(11) 99999-9999"
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-purple-200 focus:border-purple-400 outline-none"
                    />
                  </div>
                </div>

                {/* Unit */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Unidade</label>
                  <div className="relative">
                    <Building2 className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <select
                      value={editUnitId}
                      onChange={e => setEditUnitId(e.target.value)}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-purple-200 focus:border-purple-400 outline-none bg-white appearance-none"
                    >
                      <option value="">Sem unidade</option>
                      {units.map(unit => (
                        <option key={unit.id} value={unit.id}>
                          {unit.name}{unit.city ? ` (${unit.city})` : ''}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>

                {/* Instruments (multi-select checkboxes) */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Instrumentos <span className="text-gray-400 font-normal">(selecione um ou mais)</span>
                  </label>
                  <div className="grid grid-cols-2 gap-2 max-h-40 overflow-y-auto">
                    {instruments.map(inst => (
                      <label
                        key={inst.id}
                        className={`flex items-center gap-2 px-3 py-2 rounded-lg border cursor-pointer transition-all text-sm ${
                          editInstrumentIds.includes(inst.id)
                            ? 'border-purple-300 bg-purple-50 text-purple-700 font-medium'
                            : 'border-gray-200 hover:border-gray-300 text-gray-600'
                        }`}
                      >
                        <input
                          type="checkbox"
                          checked={editInstrumentIds.includes(inst.id)}
                          onChange={() => toggleEditInstrument(inst.id)}
                          className="rounded border-gray-300 text-purple-600 focus:ring-purple-500"
                        />
                        {inst.name}
                      </label>
                    ))}
                  </div>
                </div>
              </div>

              <div className="flex justify-end gap-2 pt-2">
                <button
                  onClick={() => setShowEditModal(false)}
                  className="px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-100 rounded-xl transition-colors"
                >
                  Cancelar
                </button>
                <button
                  onClick={handleEditSave}
                  disabled={saving || !editName.trim()}
                  className="flex items-center gap-2 px-4 py-2 bg-purple-600 text-white rounded-xl text-sm font-bold hover:bg-purple-700 transition-colors disabled:opacity-50"
                >
                  {saving ? (
                    <Loader2 className="w-4 h-4 animate-spin" />
                  ) : (
                    <Check className="w-4 h-4" />
                  )}
                  Salvar
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </PermissionGate>
  )
}
