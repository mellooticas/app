-- =============================================
-- Migration 039: Extra Passthrough Views
-- =============================================
-- Passthrough views para tabelas que as server actions precisam
-- mas não estavam na migration 038.
--
-- Padrão: SELECT * FROM schema.table com security_invoker = true
-- Permite INSERT/UPDATE/DELETE via PostgREST mantendo RLS.
-- =============================================

BEGIN;

-- 1. challenges (core.challenges) — challenge-actions.ts faz SELECT para validar
CREATE OR REPLACE VIEW public.challenges
  WITH (security_invoker = true)
  AS SELECT * FROM core.challenges;

GRANT SELECT ON public.challenges TO authenticated;

-- 2. repertoire (core.repertoire) — repertoire-actions.ts faz INSERT/UPDATE
CREATE OR REPLACE VIEW public.repertoire
  WITH (security_invoker = true)
  AS SELECT * FROM core.repertoire;

GRANT SELECT, INSERT, UPDATE ON public.repertoire TO authenticated;

-- 3. repertoire_categories (core.repertoire_categories) — usado em forms de repertório
CREATE OR REPLACE VIEW public.repertoire_categories
  WITH (security_invoker = true)
  AS SELECT * FROM core.repertoire_categories;

GRANT SELECT ON public.repertoire_categories TO authenticated;

-- 4. instruments (core.instruments) — forms de prática/portfolio precisam listar
CREATE OR REPLACE VIEW public.instruments
  WITH (security_invoker = true)
  AS SELECT * FROM core.instruments;

GRANT SELECT ON public.instruments TO authenticated;

-- 5. points_log (core.points_log) — rpc_award_points já existe, mas select direto precisa view
CREATE OR REPLACE VIEW public.points_log
  WITH (security_invoker = true)
  AS SELECT * FROM core.points_log;

GRANT SELECT ON public.points_log TO authenticated;

-- 6. modules (core.modules) — lesson forms podem precisar listar módulos
CREATE OR REPLACE VIEW public.modules
  WITH (security_invoker = true)
  AS SELECT * FROM core.modules;

GRANT SELECT ON public.modules TO authenticated;

-- Recarregar cache do PostgREST
NOTIFY pgrst, 'reload schema';

COMMIT;
