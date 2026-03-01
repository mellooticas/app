import { z } from 'zod'

// ========================================
// User Management
// ========================================

export const assignUserRoleSchema = z.object({
  userId: z.string().uuid('ID de usuário inválido'),
  roleSlug: z.enum(['student', 'teacher', 'admin'], {
    errorMap: () => ({ message: 'Role inválido' }),
  }),
})

export const removeUserRoleSchema = z.object({
  userId: z.string().uuid('ID de usuário inválido'),
  roleSlug: z.enum(['student', 'teacher', 'admin'], {
    errorMap: () => ({ message: 'Role inválido' }),
  }),
})

export const toggleUserActiveSchema = z.object({
  userId: z.string().uuid('ID de usuário inválido'),
  isActive: z.boolean(),
})

export const inviteUserSchema = z.object({
  email: z.string().email('Email inválido'),
  roleSlug: z.enum(['student', 'teacher', 'admin'], {
    errorMap: () => ({ message: 'Role inválido' }),
  }),
})

// ========================================
// Role Management
// ========================================

export const updateRoleSchema = z.object({
  roleId: z.string().uuid('ID de role inválido'),
  display_name: z.string().min(1).max(100).optional(),
  kanji: z.string().max(10).optional(),
  kanji_meaning: z.string().max(100).optional(),
  primary_color: z.string().max(30).optional(),
  secondary_color: z.string().max(30).optional(),
  gradient: z.string().max(60).optional(),
  pattern: z.string().max(30).optional(),
  icon_name: z.string().max(30).optional(),
})

// ========================================
// Role Permissions
// ========================================

export const saveRolePermissionsSchema = z.object({
  roleId: z.string().uuid('ID de role inválido'),
  permissionIds: z.array(z.string().uuid()),
})

// ========================================
// Role Navigation
// ========================================

export const roleNavigationItemSchema = z.object({
  navigationItemId: z.string().uuid(),
  labelOverride: z.string().max(100).nullable().optional(),
  groupName: z.string().max(100).nullable().optional(),
  groupOrder: z.number().int().min(0).default(0),
  itemOrder: z.number().int().min(0).default(0),
})

export const saveRoleNavigationSchema = z.object({
  roleId: z.string().uuid('ID de role inválido'),
  items: z.array(roleNavigationItemSchema),
})

// ========================================
// Types
// ========================================

export type AssignUserRoleInput = z.infer<typeof assignUserRoleSchema>
export type RemoveUserRoleInput = z.infer<typeof removeUserRoleSchema>
export type ToggleUserActiveInput = z.infer<typeof toggleUserActiveSchema>
export type InviteUserInput = z.infer<typeof inviteUserSchema>
export type UpdateRoleInput = z.infer<typeof updateRoleSchema>
export type SaveRolePermissionsInput = z.infer<typeof saveRolePermissionsSchema>
export type SaveRoleNavigationInput = z.infer<typeof saveRoleNavigationSchema>
