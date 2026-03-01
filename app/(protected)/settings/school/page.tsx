'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import {
  Building2, Search, ChevronLeft, X, Check, Plus, Pencil,
  MapPin, Phone, Loader2, ToggleLeft, ToggleRight,
} from 'lucide-react'
import { PermissionGate } from '@/components/auth/PermissionGate'
import { listUnits, createUnit, updateUnit, toggleUnitActive } from '@/app/actions/unit-actions'

interface Unit {
  id: string
  tenant_id: string
  name: string
  slug: string
  address: string | null
  city: string | null
  state: string | null
  phone: string | null
  is_active: boolean
  created_at: string
}

export default function SchoolPage() {
  const router = useRouter()
  const [units, setUnits] = useState<Unit[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [saving, setSaving] = useState(false)
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  // Modal state
  const [showModal, setShowModal] = useState(false)
  const [editingUnit, setEditingUnit] = useState<Unit | null>(null)
  const [formName, setFormName] = useState('')
  const [formSlug, setFormSlug] = useState('')
  const [formAddress, setFormAddress] = useState('')
  const [formCity, setFormCity] = useState('')
  const [formState, setFormState] = useState('')
  const [formPhone, setFormPhone] = useState('')

  useEffect(() => {
    loadUnits()
  }, [])

  async function loadUnits() {
    setLoading(true)
    const result = await listUnits()
    if (result.success) {
      setUnits(result.data as Unit[])
    }
    setLoading(false)
  }

  function showMsg(type: 'success' | 'error', text: string) {
    setMessage({ type, text })
    setTimeout(() => setMessage(null), 4000)
  }

  function slugify(text: string) {
    return text
      .toLowerCase()
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-|-$/g, '')
  }

  function openCreateModal() {
    setEditingUnit(null)
    setFormName('')
    setFormSlug('')
    setFormAddress('')
    setFormCity('')
    setFormState('')
    setFormPhone('')
    setShowModal(true)
  }

  function openEditModal(unit: Unit) {
    setEditingUnit(unit)
    setFormName(unit.name)
    setFormSlug(unit.slug)
    setFormAddress(unit.address || '')
    setFormCity(unit.city || '')
    setFormState(unit.state || '')
    setFormPhone(unit.phone || '')
    setShowModal(true)
  }

  async function handleSave() {
    if (!formName.trim()) return
    setSaving(true)

    let result
    if (editingUnit) {
      result = await updateUnit({
        unitId: editingUnit.id,
        name: formName.trim(),
        address: formAddress.trim() || undefined,
        city: formCity.trim() || undefined,
        state: formState.trim() || undefined,
        phone: formPhone.trim() || undefined,
      })
    } else {
      result = await createUnit({
        name: formName.trim(),
        slug: formSlug.trim() || slugify(formName),
        address: formAddress.trim() || undefined,
        city: formCity.trim() || undefined,
        state: formState.trim() || undefined,
        phone: formPhone.trim() || undefined,
      })
    }

    if ('error' in result) {
      showMsg('error', result.error)
    } else {
      showMsg('success', result.message || 'Salvo com sucesso')
      setShowModal(false)
      await loadUnits()
    }
    setSaving(false)
  }

  async function handleToggleActive(unit: Unit) {
    setSaving(true)
    const result = await toggleUnitActive({ unitId: unit.id, isActive: !unit.is_active })
    if ('error' in result) {
      showMsg('error', result.error)
    } else {
      showMsg('success', result.message || 'Status alterado')
      await loadUnits()
    }
    setSaving(false)
  }

  const filtered = units.filter(u =>
    search === '' ||
    u.name.toLowerCase().includes(search.toLowerCase()) ||
    u.city?.toLowerCase().includes(search.toLowerCase())
  )

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
                <Building2 className="w-6 h-6 text-blue-600" />
                Escola e Unidades
              </h1>
              <p className="text-sm text-gray-500 mt-1">{units.length} unidades cadastradas</p>
            </div>
          </div>
          <button
            onClick={openCreateModal}
            className="flex items-center gap-2 px-4 py-2.5 bg-blue-600 text-white rounded-xl font-bold text-sm hover:bg-blue-700 transition-colors shadow-sm"
          >
            <Plus className="w-4 h-4" />
            Nova Unidade
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

        {/* Search */}
        <div className="relative">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
          <input
            type="text"
            placeholder="Buscar por nome ou cidade..."
            value={search}
            onChange={e => setSearch(e.target.value)}
            className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none"
          />
        </div>

        {/* Units List */}
        {loading ? (
          <div className="space-y-3">
            {[...Array(3)].map((_, i) => (
              <div key={i} className="bg-white rounded-xl border border-gray-100 p-5 animate-pulse">
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 bg-gray-200 rounded-xl" />
                  <div className="flex-1 space-y-2">
                    <div className="h-4 bg-gray-200 rounded w-1/3" />
                    <div className="h-3 bg-gray-100 rounded w-1/2" />
                  </div>
                </div>
              </div>
            ))}
          </div>
        ) : filtered.length === 0 ? (
          <div className="text-center py-16 bg-white rounded-xl border border-gray-100">
            <Building2 className="w-12 h-12 text-gray-300 mx-auto mb-3" />
            <p className="text-gray-500">Nenhuma unidade encontrada</p>
          </div>
        ) : (
          <div className="space-y-3">
            {filtered.map(unit => (
              <div
                key={unit.id}
                className={`bg-white rounded-xl border border-gray-100 shadow-sm p-5 hover:shadow-md transition-all ${
                  !unit.is_active ? 'opacity-60' : ''
                }`}
              >
                <div className="flex items-center gap-4">
                  {/* Icon */}
                  <div className="w-12 h-12 rounded-xl bg-blue-50 flex items-center justify-center text-blue-600 flex-shrink-0">
                    <Building2 className="w-6 h-6" />
                  </div>

                  {/* Info */}
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <span className="font-bold text-gray-900">{unit.name}</span>
                      <span className="text-xs text-gray-400">({unit.slug})</span>
                      {!unit.is_active && (
                        <span className="px-1.5 py-0.5 rounded text-[10px] font-bold bg-gray-100 text-gray-500 uppercase">Inativa</span>
                      )}
                    </div>
                    <div className="flex items-center gap-3 text-sm text-gray-500 mt-1">
                      {(unit.city || unit.state) && (
                        <span className="flex items-center gap-1">
                          <MapPin className="w-3 h-3" />
                          {[unit.city, unit.state].filter(Boolean).join(', ')}
                        </span>
                      )}
                      {unit.phone && (
                        <span className="flex items-center gap-1">
                          <Phone className="w-3 h-3" />
                          {unit.phone}
                        </span>
                      )}
                    </div>
                    {unit.address && (
                      <p className="text-xs text-gray-400 mt-1 truncate">{unit.address}</p>
                    )}
                  </div>

                  {/* Actions */}
                  <div className="flex items-center gap-2 flex-shrink-0">
                    <button
                      onClick={() => openEditModal(unit)}
                      disabled={saving}
                      title="Editar"
                      className="p-2 rounded-lg text-gray-400 hover:text-blue-600 hover:bg-blue-50 transition-all"
                    >
                      <Pencil className="w-4 h-4" />
                    </button>
                    <button
                      onClick={() => handleToggleActive(unit)}
                      disabled={saving}
                      title={unit.is_active ? 'Desativar' : 'Ativar'}
                      className={`p-2 rounded-lg transition-all ${
                        unit.is_active
                          ? 'text-green-600 hover:bg-green-50'
                          : 'text-gray-400 hover:bg-gray-50'
                      }`}
                    >
                      {unit.is_active ? <ToggleRight className="w-5 h-5" /> : <ToggleLeft className="w-5 h-5" />}
                    </button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}

        {/* Create/Edit Modal */}
        {showModal && (
          <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4" onClick={() => setShowModal(false)}>
            <div className="bg-white rounded-2xl shadow-xl w-full max-w-md p-6 space-y-4" onClick={e => e.stopPropagation()}>
              <div className="flex items-center justify-between">
                <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
                  <Building2 className="w-5 h-5 text-blue-600" />
                  {editingUnit ? 'Editar Unidade' : 'Nova Unidade'}
                </h2>
                <button onClick={() => setShowModal(false)} className="p-1 hover:bg-gray-100 rounded-lg">
                  <X className="w-5 h-5 text-gray-400" />
                </button>
              </div>

              <div className="space-y-3">
                {/* Name */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Nome da Unidade</label>
                  <input
                    type="text"
                    value={formName}
                    onChange={e => {
                      setFormName(e.target.value)
                      if (!editingUnit) setFormSlug(slugify(e.target.value))
                    }}
                    placeholder="Ex: Suzano, Mogi das Cruzes"
                    className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none"
                  />
                </div>

                {/* Slug (only for create) */}
                {!editingUnit && (
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Slug <span className="text-gray-400 font-normal">(gerado automaticamente)</span>
                    </label>
                    <input
                      type="text"
                      value={formSlug}
                      onChange={e => setFormSlug(e.target.value)}
                      placeholder="suzano"
                      className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none bg-gray-50"
                    />
                  </div>
                )}

                {/* Address */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Endereço <span className="text-gray-400 font-normal">(opcional)</span>
                  </label>
                  <input
                    type="text"
                    value={formAddress}
                    onChange={e => setFormAddress(e.target.value)}
                    placeholder="Rua, número, bairro"
                    className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none"
                  />
                </div>

                {/* City + State */}
                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Cidade</label>
                    <input
                      type="text"
                      value={formCity}
                      onChange={e => setFormCity(e.target.value)}
                      placeholder="Suzano"
                      className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Estado</label>
                    <input
                      type="text"
                      value={formState}
                      onChange={e => setFormState(e.target.value)}
                      placeholder="SP"
                      className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none"
                    />
                  </div>
                </div>

                {/* Phone */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Telefone <span className="text-gray-400 font-normal">(opcional)</span>
                  </label>
                  <input
                    type="tel"
                    value={formPhone}
                    onChange={e => setFormPhone(e.target.value)}
                    placeholder="(11) 99999-9999"
                    className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none"
                  />
                </div>
              </div>

              <div className="flex justify-end gap-2 pt-2">
                <button
                  onClick={() => setShowModal(false)}
                  className="px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-100 rounded-xl transition-colors"
                >
                  Cancelar
                </button>
                <button
                  onClick={handleSave}
                  disabled={saving || !formName.trim()}
                  className="flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-xl text-sm font-bold hover:bg-blue-700 transition-colors disabled:opacity-50"
                >
                  {saving ? (
                    <Loader2 className="w-4 h-4 animate-spin" />
                  ) : (
                    <Check className="w-4 h-4" />
                  )}
                  {editingUnit ? 'Salvar' : 'Criar Unidade'}
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </PermissionGate>
  )
}
