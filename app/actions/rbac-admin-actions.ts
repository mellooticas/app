'use server'

import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'
import { adminSupabase } from '@/lib/supabase/admin-client'
import { validateAction } from '@/lib/validations/validate-action'
import {
  assignUserRoleSchema,
  removeUserRoleSchema,
  toggleUserActiveSchema,
  inviteUserSchema,
  createStudentSchema,
  updateRoleSchema,
  saveRolePermissionsSchema,
  saveRoleNavigationSchema,
} from '@/lib/validations/rbac-schemas'
import {
  successResponse,
  errorResponse,
  validationError,
  unauthorizedError,
  databaseError,
} from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'

/**
 * Helper: get current user + tenant_id from JWT claims.
 * Returns null if not authenticated or no tenant.
 */
async function getAuthContext() {
  const supabase = await createClient()
  const { data: { user }, error } = await supabase.auth.getUser()
  if (error || !user) return null

  // Read tenant from JWT
  const { data: { session } } = await supabase.auth.getSession()
  if (!session?.access_token) return null

  const claims = JSON.parse(atob(session.access_token.split('.')[1]))
  const tenantId: string | null = claims.tenant_id || null
  const userRoles: string[] = claims.user_roles || []

  if (!tenantId) return null
  if (!userRoles.includes('admin')) return null

  return { supabase, userId: user.id, tenantId }
}

// ========================================
// USER MANAGEMENT
// ========================================

/**
 * List all users in the tenant (via v_profiles view).
 */
export async function listUsers(): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const { data, error } = await ctx.supabase
    .from('v_profiles')
    .select('*')
    .eq('tenant_id', ctx.tenantId)
    .order('full_name')

  if (error) return databaseError(error.message)
  return successResponse(data || [])
}

/**
 * Assign a role to a user.
 */
export async function assignUserRole(rawData: unknown): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const validation = await validateAction(assignUserRoleSchema, rawData)
  if (!validation.success) return validationError(validation.error)

  const { userId, roleSlug } = validation.data

  // Find role_id by slug + tenant
  const { data: role, error: roleErr } = await ctx.supabase
    .from('roles')
    .select('id')
    .eq('tenant_id', ctx.tenantId)
    .eq('slug', roleSlug)
    .single()

  if (roleErr || !role) return databaseError('Role não encontrado')

  // Delete existing then insert (views don't support ON CONFLICT)
  await ctx.supabase
    .from('user_roles')
    .delete()
    .eq('user_id', userId)
    .eq('tenant_id', ctx.tenantId)
    .eq('role_id', role.id)

  const { error } = await ctx.supabase
    .from('user_roles')
    .insert({
      user_id: userId,
      tenant_id: ctx.tenantId,
      role_id: role.id,
      assigned_by: ctx.userId,
      is_active: true,
    })

  if (error) return databaseError(error.message)

  revalidatePath('/settings/users')
  return successResponse(null, 'Role atribuído com sucesso')
}

/**
 * Remove a role from a user.
 */
export async function removeUserRole(rawData: unknown): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const validation = await validateAction(removeUserRoleSchema, rawData)
  if (!validation.success) return validationError(validation.error)

  const { userId, roleSlug } = validation.data

  // Prevent removing own admin role
  if (userId === ctx.userId && roleSlug === 'admin') {
    return errorResponse('Não é possível remover seu próprio role de admin', 'FORBIDDEN')
  }

  const { data: role } = await ctx.supabase
    .from('roles')
    .select('id')
    .eq('tenant_id', ctx.tenantId)
    .eq('slug', roleSlug)
    .single()

  if (!role) return databaseError('Role não encontrado')

  const { error } = await ctx.supabase
    .from('user_roles')
    .delete()
    .eq('user_id', userId)
    .eq('tenant_id', ctx.tenantId)
    .eq('role_id', role.id)

  if (error) return databaseError(error.message)

  revalidatePath('/settings/users')
  return successResponse(null, 'Role removido com sucesso')
}

/**
 * Toggle user active status.
 */
export async function toggleUserActive(rawData: unknown): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const validation = await validateAction(toggleUserActiveSchema, rawData)
  if (!validation.success) return validationError(validation.error)

  const { userId, isActive } = validation.data

  // Prevent deactivating self
  if (userId === ctx.userId && !isActive) {
    return errorResponse('Não é possível desativar sua própria conta', 'FORBIDDEN')
  }

  const { error } = await ctx.supabase
    .from('profiles')
    .update({ is_active: isActive })
    .eq('user_id', userId)
    .eq('tenant_id', ctx.tenantId)

  if (error) return databaseError(error.message)

  revalidatePath('/settings/users')
  return successResponse(null, isActive ? 'Usuário ativado' : 'Usuário desativado')
}

/**
 * Invite a new user with a role.
 * Uses Supabase Auth admin.inviteUserByEmail to send a magic link email.
 * The invited user clicks the link, lands on /auth/callback, then sets their password.
 */
export async function inviteUser(rawData: unknown): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const validation = await validateAction(inviteUserSchema, rawData)
  if (!validation.success) return validationError(validation.error)

  const { email, roleSlug } = validation.data

  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'http://localhost:4000'

  // 1. Send invite via Supabase Auth (creates user + sends magic link email)
  const { data: inviteData, error: inviteError } = await adminSupabase.auth.admin.inviteUserByEmail(email, {
    data: {
      full_name: email.split('@')[0],
      invited_role: roleSlug,
      tenant_id: ctx.tenantId,
    },
    redirectTo: `${siteUrl}/auth/callback?next=/set-password`,
  })

  if (inviteError) return databaseError(inviteError.message)

  // 2. If the role is not student (default), assign the correct role
  if (inviteData.user && roleSlug !== 'student') {
    const { data: role } = await ctx.supabase
      .from('roles')
      .select('id')
      .eq('tenant_id', ctx.tenantId)
      .eq('slug', roleSlug)
      .single()

    if (role) {
      // Wait briefly for the trigger to create the profile
      await new Promise(resolve => setTimeout(resolve, 500))

      await adminSupabase
        .from('iam.user_roles')
        .insert({
          user_id: inviteData.user.id,
          tenant_id: ctx.tenantId,
          role_id: role.id,
          assigned_by: ctx.userId,
          is_active: true,
        })
    }
  }

  revalidatePath('/settings/users')
  return successResponse(null, 'Convite enviado por email com sucesso')
}

/**
 * Create a new student/teacher directly (admin sets name, email, password).
 * Uses Supabase Auth admin.createUser so the user can login immediately.
 */
export async function createStudent(rawData: unknown): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const validation = await validateAction(createStudentSchema, rawData)
  if (!validation.success) return validationError(validation.error)

  const { fullName, email, password, phone, instrumentId, roleSlug } = validation.data

  // 1. Create user via Supabase Auth admin API (user can login immediately)
  const { data: userData, error: createError } = await adminSupabase.auth.admin.createUser({
    email,
    password,
    email_confirm: true,
    user_metadata: {
      full_name: fullName,
      role: roleSlug,
      phone: phone || null,
      primary_instrument_id: instrumentId || null,
      tenant_id: ctx.tenantId,
    },
  })

  if (createError) return databaseError(createError.message)

  // 2. If role is teacher, assign teacher role (trigger assigns student by default)
  if (userData.user && roleSlug === 'teacher') {
    const { data: role } = await ctx.supabase
      .from('roles')
      .select('id')
      .eq('tenant_id', ctx.tenantId)
      .eq('slug', 'teacher')
      .single()

    if (role) {
      // Wait for trigger to create profile
      await new Promise(resolve => setTimeout(resolve, 500))

      // Remove student role assigned by trigger
      const { data: studentRole } = await ctx.supabase
        .from('roles')
        .select('id')
        .eq('tenant_id', ctx.tenantId)
        .eq('slug', 'student')
        .single()

      if (studentRole) {
        await adminSupabase
          .from('iam.user_roles')
          .delete()
          .eq('user_id', userData.user.id)
          .eq('tenant_id', ctx.tenantId)
          .eq('role_id', studentRole.id)
      }

      await adminSupabase
        .from('iam.user_roles')
        .insert({
          user_id: userData.user.id,
          tenant_id: ctx.tenantId,
          role_id: role.id,
          assigned_by: ctx.userId,
          is_active: true,
        })
    }
  }

  revalidatePath('/settings/enrollments')
  revalidatePath('/settings/users')
  return successResponse({ userId: userData.user?.id }, 'Cadastro realizado com sucesso')
}

// ========================================
// ROLE MANAGEMENT
// ========================================

/**
 * List all roles in the tenant.
 */
export async function listRoles(): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const { data, error } = await ctx.supabase
    .from('roles')
    .select('*')
    .eq('tenant_id', ctx.tenantId)
    .order('hierarchy_level', { ascending: true })

  if (error) return databaseError(error.message)
  return successResponse(data || [])
}

/**
 * Update a role's configuration.
 */
export async function updateRole(rawData: unknown): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const validation = await validateAction(updateRoleSchema, rawData)
  if (!validation.success) return validationError(validation.error)

  const { roleId, ...updates } = validation.data

  const { error } = await ctx.supabase
    .from('roles')
    .update(updates)
    .eq('id', roleId)
    .eq('tenant_id', ctx.tenantId)

  if (error) return databaseError(error.message)

  revalidatePath('/settings/roles')
  return successResponse(null, 'Role atualizado com sucesso')
}

// ========================================
// PERMISSIONS MANAGEMENT
// ========================================

/**
 * List all available permissions.
 */
export async function listPermissions(): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const { data, error } = await ctx.supabase
    .from('permissions')
    .select('*')
    .order('resource')
    .order('action')

  if (error) return databaseError(error.message)
  return successResponse(data || [])
}

/**
 * Get permissions assigned to a specific role.
 */
export async function listRolePermissions(roleId: string): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const { data, error } = await ctx.supabase
    .from('role_permissions')
    .select('permission_id')
    .eq('role_id', roleId)

  if (error) return databaseError(error.message)
  return successResponse((data || []).map(rp => rp.permission_id))
}

/**
 * Save permissions for a role (replace all).
 */
export async function saveRolePermissions(rawData: unknown): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const validation = await validateAction(saveRolePermissionsSchema, rawData)
  if (!validation.success) return validationError(validation.error)

  const { roleId, permissionIds } = validation.data

  // Delete existing
  const { error: delErr } = await ctx.supabase
    .from('role_permissions')
    .delete()
    .eq('role_id', roleId)

  if (delErr) return databaseError(delErr.message)

  // Insert new
  if (permissionIds.length > 0) {
    const rows = permissionIds.map(pid => ({
      role_id: roleId,
      permission_id: pid,
    }))

    const { error: insErr } = await ctx.supabase
      .from('role_permissions')
      .insert(rows)

    if (insErr) return databaseError(insErr.message)
  }

  revalidatePath('/settings/roles')
  return successResponse(null, 'Permissões salvas com sucesso')
}

// ========================================
// NAVIGATION MANAGEMENT
// ========================================

/**
 * List all available navigation items.
 */
export async function listNavigationItems(): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const { data, error } = await ctx.supabase
    .from('navigation_items')
    .select('*')
    .eq('is_active', true)
    .order('label')

  if (error) return databaseError(error.message)
  return successResponse(data || [])
}

/**
 * Get navigation config for a specific role.
 */
export async function listRoleNavigation(roleId: string): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const { data, error } = await ctx.supabase
    .from('role_navigation')
    .select('*, navigation_items(slug, label, href, icon_name)')
    .eq('role_id', roleId)
    .order('group_order')
    .order('item_order')

  if (error) return databaseError(error.message)
  return successResponse(data || [])
}

/**
 * Save navigation items for a role (replace all).
 */
export async function saveRoleNavigation(rawData: unknown): Promise<ActionResult> {
  const ctx = await getAuthContext()
  if (!ctx) return unauthorizedError('Acesso restrito a administradores')

  const validation = await validateAction(saveRoleNavigationSchema, rawData)
  if (!validation.success) return validationError(validation.error)

  const { roleId, items } = validation.data

  // Delete existing
  const { error: delErr } = await ctx.supabase
    .from('role_navigation')
    .delete()
    .eq('role_id', roleId)

  if (delErr) return databaseError(delErr.message)

  // Insert new
  if (items.length > 0) {
    const rows = items.map(item => ({
      role_id: roleId,
      navigation_item_id: item.navigationItemId,
      label_override: item.labelOverride || null,
      group_name: item.groupName || null,
      group_order: item.groupOrder,
      item_order: item.itemOrder,
    }))

    const { error: insErr } = await ctx.supabase
      .from('role_navigation')
      .insert(rows)

    if (insErr) return databaseError(insErr.message)
  }

  revalidatePath('/settings/roles')
  return successResponse(null, 'Navegação salva com sucesso')
}
