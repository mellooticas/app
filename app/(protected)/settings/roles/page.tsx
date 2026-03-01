'use client'

import { useEffect, useState, useCallback } from 'react'
import { useRouter } from 'next/navigation'
import {
  Shield, ChevronLeft, Crown, GraduationCap, Music, Save,
  Check, Lock, Unlock, Eye, Menu as MenuIcon, Grip,
} from 'lucide-react'
import { PermissionGate } from '@/components/auth/PermissionGate'
import {
  listRoles,
  listPermissions,
  listRolePermissions,
  saveRolePermissions,
  listNavigationItems,
  listRoleNavigation,
  saveRoleNavigation,
  updateRole,
} from '@/app/actions/rbac-admin-actions'

// ========================================
// Types
// ========================================

interface Role {
  id: string
  slug: string
  display_name: string
  kanji: string
  kanji_meaning: string
  primary_color: string
  secondary_color: string
  gradient: string
  pattern: string
  icon_name: string
  hierarchy_level: number
  is_system: boolean
  is_active: boolean
}

interface Permission {
  id: string
  slug: string
  display_name: string
  resource: string
  action: string
}

interface NavItem {
  id: string
  slug: string
  label: string
  href: string
  icon_name: string | null
}

interface RoleNavConfig {
  navigation_item_id: string
  label_override: string | null
  group_name: string | null
  group_order: number
  item_order: number
  navigation_items?: NavItem
}

type Tab = 'roles' | 'permissions' | 'navigation'

const ROLE_ICON: Record<string, typeof Crown> = {
  admin: Crown,
  teacher: GraduationCap,
  student: Music,
}

const ROLE_COLOR: Record<string, string> = {
  admin: 'border-purple-200 bg-purple-50',
  teacher: 'border-blue-200 bg-blue-50',
  student: 'border-red-200 bg-red-50',
}

// ========================================
// Main Page
// ========================================

export default function RolesPage() {
  const router = useRouter()
  const [tab, setTab] = useState<Tab>('roles')
  const [roles, setRoles] = useState<Role[]>([])
  const [selectedRoleId, setSelectedRoleId] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  useEffect(() => {
    loadRoles()
  }, [])

  async function loadRoles() {
    setLoading(true)
    const result = await listRoles()
    if (result.success) {
      const data = result.data as Role[]
      setRoles(data)
      if (data.length > 0 && !selectedRoleId) {
        setSelectedRoleId(data[0].id)
      }
    }
    setLoading(false)
  }

  function showMessage(type: 'success' | 'error', text: string) {
    setMessage({ type, text })
    setTimeout(() => setMessage(null), 3000)
  }

  const selectedRole = roles.find(r => r.id === selectedRoleId) || null

  const tabs: { key: Tab; label: string; icon: typeof Shield }[] = [
    { key: 'roles', label: 'Roles', icon: Shield },
    { key: 'permissions', label: 'Permissões', icon: Lock },
    { key: 'navigation', label: 'Navegação', icon: MenuIcon },
  ]

  return (
    <PermissionGate permission="settings.view" fallback={<div className="text-center py-16"><p className="text-gray-500">Sem permissão.</p></div>}>
      <div className="max-w-6xl mx-auto space-y-6">
        {/* Header */}
        <div className="flex items-center gap-3">
          <button onClick={() => router.push('/settings')} className="p-2 hover:bg-gray-100 rounded-lg transition-colors">
            <ChevronLeft className="w-5 h-5 text-gray-500" />
          </button>
          <div>
            <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
              <Shield className="w-6 h-6 text-purple-600" />
              Roles e Permissões
            </h1>
            <p className="text-sm text-gray-500 mt-1">Gerencie roles, permissões e navegação</p>
          </div>
        </div>

        {/* Toast */}
        {message && (
          <div className={`px-4 py-3 rounded-xl text-sm font-medium ${
            message.type === 'success' ? 'bg-green-50 text-green-700 border border-green-200' : 'bg-red-50 text-red-700 border border-red-200'
          }`}>
            {message.text}
          </div>
        )}

        {/* Role Selector */}
        <div className="flex gap-3">
          {roles.map(role => {
            const Icon = ROLE_ICON[role.slug] || Shield
            const isSelected = role.id === selectedRoleId
            return (
              <button
                key={role.id}
                onClick={() => setSelectedRoleId(role.id)}
                className={`flex items-center gap-2 px-4 py-3 rounded-xl border-2 transition-all font-bold text-sm ${
                  isSelected
                    ? `${ROLE_COLOR[role.slug] || 'border-gray-300 bg-gray-50'} shadow-sm`
                    : 'border-gray-100 bg-white hover:border-gray-200 text-gray-500'
                }`}
              >
                <Icon className="w-4 h-4" />
                <span>{role.display_name}</span>
                <span className="text-[10px] font-normal opacity-60">{role.kanji}</span>
              </button>
            )
          })}
        </div>

        {/* Tabs */}
        <div className="flex gap-1 bg-gray-100 rounded-xl p-1">
          {tabs.map(t => {
            const Icon = t.icon
            return (
              <button
                key={t.key}
                onClick={() => setTab(t.key)}
                className={`flex items-center gap-2 px-4 py-2 rounded-lg text-sm font-medium transition-all flex-1 justify-center ${
                  tab === t.key
                    ? 'bg-white text-gray-900 shadow-sm'
                    : 'text-gray-500 hover:text-gray-700'
                }`}
              >
                <Icon className="w-4 h-4" />
                {t.label}
              </button>
            )
          })}
        </div>

        {/* Tab Content */}
        {loading ? (
          <div className="bg-white rounded-xl border border-gray-100 p-8 text-center">
            <div className="animate-spin w-8 h-8 border-2 border-purple-600 border-t-transparent rounded-full mx-auto" />
          </div>
        ) : selectedRole && (
          <>
            {tab === 'roles' && <RolesTab role={selectedRole} onSave={loadRoles} showMessage={showMessage} />}
            {tab === 'permissions' && <PermissionsTab roleId={selectedRole.id} showMessage={showMessage} />}
            {tab === 'navigation' && <NavigationTab roleId={selectedRole.id} showMessage={showMessage} />}
          </>
        )}
      </div>
    </PermissionGate>
  )
}

// ========================================
// Tab 1: Roles Config
// ========================================

function RolesTab({ role, onSave, showMessage }: {
  role: Role
  onSave: () => void
  showMessage: (type: 'success' | 'error', text: string) => void
}) {
  const [form, setForm] = useState({
    display_name: role.display_name,
    kanji: role.kanji,
    kanji_meaning: role.kanji_meaning,
    primary_color: role.primary_color,
    secondary_color: role.secondary_color,
    gradient: role.gradient,
    pattern: role.pattern,
    icon_name: role.icon_name,
  })
  const [saving, setSaving] = useState(false)

  useEffect(() => {
    setForm({
      display_name: role.display_name,
      kanji: role.kanji,
      kanji_meaning: role.kanji_meaning,
      primary_color: role.primary_color,
      secondary_color: role.secondary_color,
      gradient: role.gradient,
      pattern: role.pattern,
      icon_name: role.icon_name,
    })
  }, [role])

  async function handleSave() {
    setSaving(true)
    const result = await updateRole({ roleId: role.id, ...form })
    if ('error' in result) { showMessage('error', result.error); setSaving(false); return }
    showMessage('success', 'Role atualizado com sucesso')
    onSave()
    setSaving(false)
  }

  const fields: Array<{ key: keyof typeof form; label: string; placeholder: string }> = [
    { key: 'display_name', label: 'Nome de exibição', placeholder: 'Ex: Administrador' },
    { key: 'kanji', label: 'Kanji', placeholder: 'Ex: 管理' },
    { key: 'kanji_meaning', label: 'Significado', placeholder: 'Ex: Nobreza & Estrutura' },
    { key: 'primary_color', label: 'Cor primária (CSS)', placeholder: 'Ex: text-purple-600' },
    { key: 'secondary_color', label: 'Cor secundária (CSS)', placeholder: 'Ex: bg-purple-100' },
    { key: 'gradient', label: 'Gradiente (CSS)', placeholder: 'Ex: from-purple-600 to-indigo-600' },
    { key: 'pattern', label: 'Pattern (CSS)', placeholder: 'Ex: bg-pattern-sayagata' },
    { key: 'icon_name', label: 'Ícone', placeholder: 'Ex: Crown' },
  ]

  return (
    <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-lg font-bold text-gray-900">Configuração do Role</h2>
          <p className="text-sm text-gray-500">
            Slug: <code className="bg-gray-100 px-1.5 py-0.5 rounded text-xs font-mono">{role.slug}</code>
            {role.is_system && <span className="ml-2 text-xs text-amber-600 font-medium">(role de sistema)</span>}
          </p>
        </div>
        {/* Preview */}
        <div className={`px-4 py-2 rounded-xl border ${ROLE_COLOR[role.slug] || 'border-gray-200'} flex items-center gap-2`}>
          <span className="text-lg">{form.kanji}</span>
          <span className="font-bold text-sm">{form.display_name}</span>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {fields.map(f => (
          <div key={f.key}>
            <label className="block text-sm font-medium text-gray-700 mb-1">{f.label}</label>
            <input
              type="text"
              value={form[f.key]}
              onChange={e => setForm(prev => ({ ...prev, [f.key]: e.target.value }))}
              placeholder={f.placeholder}
              className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-purple-200 focus:border-purple-400 outline-none"
            />
          </div>
        ))}
      </div>

      <div className="flex justify-end">
        <button
          onClick={handleSave}
          disabled={saving}
          className="flex items-center gap-2 px-5 py-2.5 bg-purple-600 text-white rounded-xl font-bold text-sm hover:bg-purple-700 transition-colors disabled:opacity-50 shadow-sm"
        >
          <Save className="w-4 h-4" />
          {saving ? 'Salvando...' : 'Salvar Alterações'}
        </button>
      </div>
    </div>
  )
}

// ========================================
// Tab 2: Permissions Editor
// ========================================

function PermissionsTab({ roleId, showMessage }: {
  roleId: string
  showMessage: (type: 'success' | 'error', text: string) => void
}) {
  const [permissions, setPermissions] = useState<Permission[]>([])
  const [assignedIds, setAssignedIds] = useState<Set<string>>(new Set())
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [dirty, setDirty] = useState(false)

  const loadData = useCallback(async () => {
    setLoading(true)
    const [permsResult, assignedResult] = await Promise.all([
      listPermissions(),
      listRolePermissions(roleId),
    ])
    if (permsResult.success) setPermissions(permsResult.data as Permission[])
    if (assignedResult.success) setAssignedIds(new Set(assignedResult.data as string[]))
    setDirty(false)
    setLoading(false)
  }, [roleId])

  useEffect(() => { loadData() }, [loadData])

  function togglePermission(id: string) {
    setAssignedIds(prev => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else next.add(id)
      return next
    })
    setDirty(true)
  }

  function toggleResource(resource: string) {
    const resourcePerms = permissions.filter(p => p.resource === resource)
    const allAssigned = resourcePerms.every(p => assignedIds.has(p.id))
    setAssignedIds(prev => {
      const next = new Set(prev)
      for (const p of resourcePerms) {
        if (allAssigned) next.delete(p.id)
        else next.add(p.id)
      }
      return next
    })
    setDirty(true)
  }

  async function handleSave() {
    setSaving(true)
    const result = await saveRolePermissions({ roleId, permissionIds: Array.from(assignedIds) })
    if ('error' in result) { showMessage('error', result.error); setSaving(false); return }
    showMessage('success', 'Permissões salvas com sucesso')
    setDirty(false)
    setSaving(false)
  }

  // Group permissions by resource
  const grouped = permissions.reduce<Record<string, Permission[]>>((acc, p) => {
    if (!acc[p.resource]) acc[p.resource] = []
    acc[p.resource].push(p)
    return acc
  }, {})

  if (loading) {
    return (
      <div className="bg-white rounded-xl border border-gray-100 p-8 text-center">
        <div className="animate-spin w-8 h-8 border-2 border-purple-600 border-t-transparent rounded-full mx-auto" />
      </div>
    )
  }

  return (
    <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-lg font-bold text-gray-900">Permissões</h2>
          <p className="text-sm text-gray-500">{assignedIds.size} de {permissions.length} permissões ativas</p>
        </div>
        <button
          onClick={handleSave}
          disabled={saving || !dirty}
          className="flex items-center gap-2 px-5 py-2.5 bg-purple-600 text-white rounded-xl font-bold text-sm hover:bg-purple-700 transition-colors disabled:opacity-50 shadow-sm"
        >
          <Save className="w-4 h-4" />
          {saving ? 'Salvando...' : 'Salvar'}
        </button>
      </div>

      <div className="space-y-4">
        {Object.entries(grouped).sort(([a], [b]) => a.localeCompare(b)).map(([resource, perms]) => {
          const allAssigned = perms.every(p => assignedIds.has(p.id))
          const someAssigned = perms.some(p => assignedIds.has(p.id))

          return (
            <div key={resource} className="border border-gray-100 rounded-xl p-4">
              <div className="flex items-center gap-3 mb-3">
                <button
                  onClick={() => toggleResource(resource)}
                  className={`w-5 h-5 rounded border-2 flex items-center justify-center transition-all ${
                    allAssigned
                      ? 'bg-purple-600 border-purple-600 text-white'
                      : someAssigned
                        ? 'bg-purple-200 border-purple-400'
                        : 'border-gray-300 hover:border-purple-400'
                  }`}
                >
                  {allAssigned && <Check className="w-3 h-3" />}
                </button>
                <h3 className="font-bold text-sm text-gray-900 uppercase tracking-wide">{resource}</h3>
                <span className="text-xs text-gray-400">{perms.length} ações</span>
              </div>

              <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-2">
                {perms.map(p => {
                  const isOn = assignedIds.has(p.id)
                  return (
                    <button
                      key={p.id}
                      onClick={() => togglePermission(p.id)}
                      className={`flex items-center gap-2 px-3 py-2 rounded-lg text-xs font-medium transition-all text-left ${
                        isOn
                          ? 'bg-purple-50 text-purple-700 border border-purple-200'
                          : 'bg-gray-50 text-gray-500 border border-gray-100 hover:border-gray-200'
                      }`}
                    >
                      {isOn ? <Unlock className="w-3 h-3 flex-shrink-0" /> : <Lock className="w-3 h-3 flex-shrink-0" />}
                      <span className="truncate">{p.action}</span>
                    </button>
                  )
                })}
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}

// ========================================
// Tab 3: Navigation Editor
// ========================================

function NavigationTab({ roleId, showMessage }: {
  roleId: string
  showMessage: (type: 'success' | 'error', text: string) => void
}) {
  const [allItems, setAllItems] = useState<NavItem[]>([])
  const [roleNav, setRoleNav] = useState<RoleNavConfig[]>([])
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [dirty, setDirty] = useState(false)

  const loadData = useCallback(async () => {
    setLoading(true)
    const [itemsResult, navResult] = await Promise.all([
      listNavigationItems(),
      listRoleNavigation(roleId),
    ])
    if (itemsResult.success) setAllItems(itemsResult.data as NavItem[])
    if (navResult.success) setRoleNav(navResult.data as RoleNavConfig[])
    setDirty(false)
    setLoading(false)
  }, [roleId])

  useEffect(() => { loadData() }, [loadData])

  const assignedItemIds = new Set(roleNav.map(rn => rn.navigation_item_id))

  function toggleItem(itemId: string) {
    if (assignedItemIds.has(itemId)) {
      setRoleNav(prev => prev.filter(rn => rn.navigation_item_id !== itemId))
    } else {
      setRoleNav(prev => [...prev, {
        navigation_item_id: itemId,
        label_override: null,
        group_name: null,
        group_order: 0,
        item_order: prev.length,
      }])
    }
    setDirty(true)
  }

  function updateNavConfig(itemId: string, field: keyof RoleNavConfig, value: string | number | null) {
    setRoleNav(prev => prev.map(rn =>
      rn.navigation_item_id === itemId ? { ...rn, [field]: value } : rn
    ))
    setDirty(true)
  }

  async function handleSave() {
    setSaving(true)
    const items = roleNav.map(rn => ({
      navigationItemId: rn.navigation_item_id,
      labelOverride: rn.label_override,
      groupName: rn.group_name,
      groupOrder: rn.group_order,
      itemOrder: rn.item_order,
    }))

    const result = await saveRoleNavigation({ roleId, items })
    if ('error' in result) { showMessage('error', result.error); setSaving(false); return }
    showMessage('success', 'Navegação salva com sucesso')
    setDirty(false)
    setSaving(false)
  }

  // Group assigned items by group_name
  const groups = roleNav.reduce<Record<string, Array<RoleNavConfig & { item?: NavItem }>>>((acc, rn) => {
    const groupKey = rn.group_name || '(sem grupo)'
    if (!acc[groupKey]) acc[groupKey] = []
    acc[groupKey].push({ ...rn, item: allItems.find(i => i.id === rn.navigation_item_id) })
    return acc
  }, {})

  if (loading) {
    return (
      <div className="bg-white rounded-xl border border-gray-100 p-8 text-center">
        <div className="animate-spin w-8 h-8 border-2 border-purple-600 border-t-transparent rounded-full mx-auto" />
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* Available Items */}
      <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 space-y-4">
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-lg font-bold text-gray-900">Itens do Menu</h2>
            <p className="text-sm text-gray-500">{assignedItemIds.size} de {allItems.length} itens ativos</p>
          </div>
          <button
            onClick={handleSave}
            disabled={saving || !dirty}
            className="flex items-center gap-2 px-5 py-2.5 bg-purple-600 text-white rounded-xl font-bold text-sm hover:bg-purple-700 transition-colors disabled:opacity-50 shadow-sm"
          >
            <Save className="w-4 h-4" />
            {saving ? 'Salvando...' : 'Salvar'}
          </button>
        </div>

        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-2">
          {allItems.map(item => {
            const isOn = assignedItemIds.has(item.id)
            return (
              <button
                key={item.id}
                onClick={() => toggleItem(item.id)}
                className={`flex items-center gap-2 px-3 py-2 rounded-lg text-xs font-medium transition-all text-left ${
                  isOn
                    ? 'bg-purple-50 text-purple-700 border border-purple-200'
                    : 'bg-gray-50 text-gray-500 border border-gray-100 hover:border-gray-200'
                }`}
              >
                {isOn ? <Eye className="w-3 h-3 flex-shrink-0" /> : <Eye className="w-3 h-3 flex-shrink-0 opacity-30" />}
                <span className="truncate">{item.label}</span>
              </button>
            )
          })}
        </div>
      </div>

      {/* Assigned Items Configuration */}
      {roleNav.length > 0 && (
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 space-y-4">
          <h2 className="text-lg font-bold text-gray-900">Configuração dos Itens</h2>

          {Object.entries(groups)
            .sort(([, a], [, b]) => (a[0]?.group_order || 0) - (b[0]?.group_order || 0))
            .map(([groupName, items]) => (
              <div key={groupName} className="border border-gray-100 rounded-xl p-4 space-y-3">
                <h3 className="font-bold text-sm text-gray-700 uppercase tracking-wide flex items-center gap-2">
                  <Grip className="w-3.5 h-3.5 text-gray-400" />
                  {groupName}
                </h3>

                <div className="space-y-2">
                  {items
                    .sort((a, b) => a.item_order - b.item_order)
                    .map(rn => {
                      const item = rn.item
                      if (!item) return null
                      return (
                        <div key={rn.navigation_item_id} className="flex items-center gap-3 bg-gray-50 rounded-lg px-3 py-2">
                          <span className="text-xs font-medium text-gray-700 w-28 truncate" title={item.label}>
                            {item.label}
                          </span>
                          <input
                            type="text"
                            value={rn.label_override || ''}
                            onChange={e => updateNavConfig(rn.navigation_item_id, 'label_override', e.target.value || null)}
                            placeholder="Label override"
                            className="flex-1 px-2 py-1 border border-gray-200 rounded text-xs focus:ring-1 focus:ring-purple-200 outline-none"
                          />
                          <input
                            type="text"
                            value={rn.group_name || ''}
                            onChange={e => updateNavConfig(rn.navigation_item_id, 'group_name', e.target.value || null)}
                            placeholder="Grupo"
                            className="w-28 px-2 py-1 border border-gray-200 rounded text-xs focus:ring-1 focus:ring-purple-200 outline-none"
                          />
                          <input
                            type="number"
                            value={rn.group_order}
                            onChange={e => updateNavConfig(rn.navigation_item_id, 'group_order', parseInt(e.target.value) || 0)}
                            className="w-14 px-2 py-1 border border-gray-200 rounded text-xs text-center focus:ring-1 focus:ring-purple-200 outline-none"
                            title="Ordem do grupo"
                          />
                          <input
                            type="number"
                            value={rn.item_order}
                            onChange={e => updateNavConfig(rn.navigation_item_id, 'item_order', parseInt(e.target.value) || 0)}
                            className="w-14 px-2 py-1 border border-gray-200 rounded text-xs text-center focus:ring-1 focus:ring-purple-200 outline-none"
                            title="Ordem do item"
                          />
                        </div>
                      )
                    })}
                </div>
              </div>
            ))}
        </div>
      )}
    </div>
  )
}
