-- =============================================
-- Nipo School - New Database Schema
-- File: 00_extensions.sql
-- Description: Extensions, custom schemas, and base permissions
-- =============================================

-- Extensions (most already enabled on Supabase, declared for completeness)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" SCHEMA extensions;
CREATE EXTENSION IF NOT EXISTS "pgcrypto" SCHEMA extensions;

-- =============================================
-- Custom Schemas
-- =============================================

CREATE SCHEMA IF NOT EXISTS iam;
COMMENT ON SCHEMA iam IS 'Identity & Access Management: tenants, profiles, roles, permissions';

CREATE SCHEMA IF NOT EXISTS core;
COMMENT ON SCHEMA core IS 'Domain data: education, instruments, gamification, portfolio, challenges';

CREATE SCHEMA IF NOT EXISTS internal;
COMMENT ON SCHEMA internal IS 'Private helper functions for RLS policies (SECURITY DEFINER). Never expose to PostgREST.';

-- =============================================
-- Schema Permissions
-- =============================================

-- iam & core: authenticated can CRUD (RLS will enforce per-row access)
GRANT USAGE ON SCHEMA iam TO authenticated, service_role;
GRANT USAGE ON SCHEMA core TO authenticated, service_role;

-- internal: authenticated needs USAGE + EXECUTE for RLS policy evaluation
-- BUT PostgREST must NOT list internal in "Exposed schemas" (no HTTP endpoints)
GRANT USAGE ON SCHEMA internal TO authenticated, service_role;

-- Default privileges for objects created in these schemas by postgres role
ALTER DEFAULT PRIVILEGES IN SCHEMA iam
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES IN SCHEMA iam
  GRANT USAGE ON SEQUENCES TO authenticated;

ALTER DEFAULT PRIVILEGES IN SCHEMA core
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES IN SCHEMA core
  GRANT USAGE ON SEQUENCES TO authenticated;

-- internal: only function execution (no tables in this schema)
ALTER DEFAULT PRIVILEGES IN SCHEMA internal
  GRANT EXECUTE ON FUNCTIONS TO authenticated;

-- service_role gets full access (bypasses RLS anyway)
ALTER DEFAULT PRIVILEGES IN SCHEMA iam
  GRANT ALL ON TABLES TO service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA core
  GRANT ALL ON TABLES TO service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA internal
  GRANT ALL ON FUNCTIONS TO service_role;
