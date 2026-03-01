/**
 * RBAC (Role-Based Access Control) - Nipo School
 *
 * Types for roles, permissions and navigation from the database.
 * All slugs in English matching the new schema.
 */

export type UserRole = 'student' | 'teacher' | 'admin'

export interface RoleConfig {
  id: string
  slug: UserRole
  display_name: string
  kanji: string
  kanji_meaning: string
  primary_color: string
  secondary_color: string
  gradient: string
  pattern: string
  icon_name: string
  hierarchy_level: number
  is_active: boolean
}

export interface NavigationItem {
  slug: string
  label: string
  href: string
  icon_name: string | null
  group_name: string | null
  group_order: number
  item_order: number
  required_permission: string | null
}

export interface NavigationGroup {
  title: string
  order: number
  items: NavigationItem[]
}

export interface UserRBAC {
  role: RoleConfig
  permissions: string[]
  navigation: NavigationItem[]
}

export interface PermissionsContextType {
  role: RoleConfig | null
  permissions: string[]
  navigation: NavigationItem[]
  navigationGroups: NavigationGroup[]
  loading: boolean
  hasPermission: (slug: string) => boolean
  hasAnyPermission: (...slugs: string[]) => boolean
  hasAllPermissions: (...slugs: string[]) => boolean
}
