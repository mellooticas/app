-- =============================================
-- Migration: 015b_fix_methodology_ids.sql
-- Purpose: Fix methodology IDs to match migrations 016/017
-- Problem: Seed created methodologies with random UUIDs but
--          016_challenges.sql and 017_competencies.sql reference
--          specific hardcoded UUIDs from the original database.
-- Run BEFORE: 016_challenges.sql and 017_competencies.sql
-- =============================================

BEGIN;

-- Update existing methodologies to use the correct IDs
-- (matching what 016_challenges and 017_competencies expect)

UPDATE core.methodologies
SET id = 'd64dac55-ed34-4f4d-93c7-d6fca955eff5'
WHERE tenant_id = '00000000-0000-0000-0000-000000000001' AND code = 'ORFF'
  AND id != 'd64dac55-ed34-4f4d-93c7-d6fca955eff5';

UPDATE core.methodologies
SET id = '68632b58-86b0-44e7-becc-69099e78764d'
WHERE tenant_id = '00000000-0000-0000-0000-000000000001' AND code = 'FUTURES'
  AND id != '68632b58-86b0-44e7-becc-69099e78764d';

UPDATE core.methodologies
SET id = '8622a0d3-c389-47bf-a3a9-843bfcc293a2'
WHERE tenant_id = '00000000-0000-0000-0000-000000000001' AND code = 'SUZUKI'
  AND id != '8622a0d3-c389-47bf-a3a9-843bfcc293a2';

UPDATE core.methodologies
SET id = 'a5a5b85d-bace-4415-90bb-01c80cb1564c'
WHERE tenant_id = '00000000-0000-0000-0000-000000000001' AND code = 'KODALY'
  AND id != 'a5a5b85d-bace-4415-90bb-01c80cb1564c';

UPDATE core.methodologies
SET id = 'eaf8c6d8-d709-4b2a-8b6e-8ecdbbc772b0'
WHERE tenant_id = '00000000-0000-0000-0000-000000000001' AND code = 'GORDON'
  AND id != 'eaf8c6d8-d709-4b2a-8b6e-8ecdbbc772b0';

UPDATE core.methodologies
SET id = 'a8a09c03-0771-4b2a-911b-8a357f312b63'
WHERE tenant_id = '00000000-0000-0000-0000-000000000001' AND code = 'WILLEMS'
  AND id != 'a8a09c03-0771-4b2a-911b-8a357f312b63';

UPDATE core.methodologies
SET id = '28ff3697-1df2-48a6-a961-2f10054a3720'
WHERE tenant_id = '00000000-0000-0000-0000-000000000001' AND code = 'ALPHA'
  AND id != '28ff3697-1df2-48a6-a961-2f10054a3720';

UPDATE core.methodologies
SET id = '5122d3b5-3f1e-4cb0-bc9b-ff6e140a51a2'
WHERE tenant_id = '00000000-0000-0000-0000-000000000001' AND code = 'BERKLEE'
  AND id != '5122d3b5-3f1e-4cb0-bc9b-ff6e140a51a2';

-- Add Dalcroze Eurythmics (missing from original seed)
INSERT INTO core.methodologies (id, tenant_id, code, name, description, philosophy, icon_name)
VALUES (
    '99551ce6-bdc4-4cd2-b72f-728cc09f36ae',
    '00000000-0000-0000-0000-000000000001',
    'DALCROZE',
    'Dalcroze Eurythmics',
    'Movement-based approach connecting body, mind, and music through rhythm',
    'The body is the first instrument',
    'Activity'
)
ON CONFLICT DO NOTHING;

COMMIT;