-- =============================================
-- Nipo School - New Database Schema
-- File: 11_storage.sql
-- Description: Storage buckets + RLS policies
-- Folder convention: {tenant_id}/... for tenant isolation
-- Execute AFTER all other schema files
-- =============================================

-- =============================================
-- 1. Create Storage Buckets
-- =============================================

-- Avatars: profile photos (PUBLIC read)
-- Path: {tenant_id}/{user_id}/{filename}
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'avatars',
    'avatars',
    true,
    2097152, -- 2MB
    ARRAY['image/jpeg', 'image/png', 'image/webp', 'image/gif', 'image/svg+xml']
);

-- Logos: tenant logos and branding (PUBLIC read)
-- Path: {tenant_id}/{filename}
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'logos',
    'logos',
    true,
    5242880, -- 5MB
    ARRAY['image/jpeg', 'image/png', 'image/webp', 'image/svg+xml']
);

-- Instruments: instrument media catalog (PUBLIC read)
-- Path: {tenant_id}/{instrument_id}/{filename}
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'instruments',
    'instruments',
    true,
    52428800, -- 50MB
    ARRAY[
        'image/jpeg', 'image/png', 'image/webp', 'image/gif', 'image/svg+xml',
        'video/mp4', 'video/webm', 'video/ogg',
        'audio/mpeg', 'audio/ogg', 'audio/wav', 'audio/webm', 'audio/mp4',
        'model/gltf-binary', 'model/gltf+json'
    ]
);

-- History: music history content (PUBLIC read)
-- Path: {tenant_id}/{type}/{id}/{filename}
-- type = periods | composers | works
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'history',
    'history',
    true,
    26214400, -- 25MB
    ARRAY[
        'image/jpeg', 'image/png', 'image/webp', 'image/svg+xml',
        'audio/mpeg', 'audio/ogg', 'audio/wav', 'audio/webm',
        'video/mp4', 'video/webm'
    ]
);

-- Lessons: lesson materials (PRIVATE - authenticated same tenant)
-- Path: {tenant_id}/{lesson_id}/{filename}
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'lessons',
    'lessons',
    false,
    104857600, -- 100MB
    ARRAY[
        'image/jpeg', 'image/png', 'image/webp', 'image/gif', 'image/svg+xml',
        'video/mp4', 'video/webm', 'video/ogg',
        'audio/mpeg', 'audio/ogg', 'audio/wav', 'audio/webm', 'audio/mp4',
        'application/pdf',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'application/vnd.openxmlformats-officedocument.presentationml.presentation',
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        'text/plain', 'text/markdown'
    ]
);

-- Repertoire: sheet music, audio, tutorials (PRIVATE - authenticated same tenant)
-- Path: {tenant_id}/{repertoire_id}/{filename}
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'repertoire',
    'repertoire',
    false,
    104857600, -- 100MB
    ARRAY[
        'image/jpeg', 'image/png', 'image/webp', 'image/svg+xml',
        'video/mp4', 'video/webm',
        'audio/mpeg', 'audio/ogg', 'audio/wav', 'audio/webm', 'audio/mp4',
        'application/pdf',
        'application/vnd.ms-midi', 'audio/midi',
        'application/xml', 'text/xml'
    ]
);

-- Portfolios: student portfolio files (PRIVATE - owner + teacher + admin)
-- Path: {tenant_id}/{student_id}/{portfolio_id}/{filename}
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'portfolios',
    'portfolios',
    false,
    104857600, -- 100MB
    ARRAY[
        'image/jpeg', 'image/png', 'image/webp', 'image/gif',
        'video/mp4', 'video/webm', 'video/ogg',
        'audio/mpeg', 'audio/ogg', 'audio/wav', 'audio/webm', 'audio/mp4',
        'application/pdf',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'application/vnd.openxmlformats-officedocument.presentationml.presentation',
        'text/plain'
    ]
);

-- Challenges: challenge submission files (PRIVATE - owner + teacher + admin)
-- Path: {tenant_id}/{student_id}/{submission_id}/{filename}
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'challenges',
    'challenges',
    false,
    52428800, -- 50MB
    ARRAY[
        'image/jpeg', 'image/png', 'image/webp', 'image/gif',
        'video/mp4', 'video/webm', 'video/ogg',
        'audio/mpeg', 'audio/ogg', 'audio/wav', 'audio/webm', 'audio/mp4',
        'application/pdf',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'text/plain'
    ]
);

-- =============================================
-- 2. Helper: Extract tenant_id from storage path
-- =============================================
-- All paths follow: {tenant_id}/...
-- We extract the first segment and compare with JWT tenant_id

-- =============================================
-- 3. RLS Policies for storage.objects
-- =============================================
-- NOTE: RLS is already enabled on storage.objects by Supabase.
-- We only need to CREATE the policies.

-- =============================================
-- 3.1 AVATARS (public: true)
-- =============================================
-- Path: {tenant_id}/{user_id}/{filename}

-- Anyone can view (bucket is public)
CREATE POLICY "avatars_select_public"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'avatars');

-- Users can upload their own avatar (tenant_id/user_id/*)
CREATE POLICY "avatars_insert_own"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (storage.foldername(name))[2] = auth.uid()::text
);

-- Users can update their own avatar
CREATE POLICY "avatars_update_own"
ON storage.objects FOR UPDATE
TO authenticated
USING (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (storage.foldername(name))[2] = auth.uid()::text
)
WITH CHECK (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (storage.foldername(name))[2] = auth.uid()::text
);

-- Users can delete their own avatar
CREATE POLICY "avatars_delete_own"
ON storage.objects FOR DELETE
TO authenticated
USING (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (storage.foldername(name))[2] = auth.uid()::text
);

-- Admins can manage all avatars in their tenant
CREATE POLICY "avatars_admin_all"
ON storage.objects FOR ALL
TO authenticated
USING (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_role('admin'))
)
WITH CHECK (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_role('admin'))
);

-- =============================================
-- 3.2 LOGOS (public: true)
-- =============================================
-- Path: {tenant_id}/{filename}

-- Anyone can view (bucket is public)
CREATE POLICY "logos_select_public"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'logos');

-- Only admins can manage logos for their tenant
CREATE POLICY "logos_admin_insert"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'logos'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_role('admin'))
);

CREATE POLICY "logos_admin_update"
ON storage.objects FOR UPDATE
TO authenticated
USING (
    bucket_id = 'logos'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_role('admin'))
)
WITH CHECK (
    bucket_id = 'logos'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_role('admin'))
);

CREATE POLICY "logos_admin_delete"
ON storage.objects FOR DELETE
TO authenticated
USING (
    bucket_id = 'logos'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_role('admin'))
);

-- =============================================
-- 3.3 INSTRUMENTS (public: true)
-- =============================================
-- Path: {tenant_id}/{instrument_id}/{filename}

-- Anyone can view (bucket is public)
CREATE POLICY "instruments_select_public"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'instruments');

-- Teachers and admins can manage instrument media in their tenant
CREATE POLICY "instruments_teacher_insert"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'instruments'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('instruments.create') OR internal.fn_has_permission('instruments.edit'))
);

CREATE POLICY "instruments_teacher_update"
ON storage.objects FOR UPDATE
TO authenticated
USING (
    bucket_id = 'instruments'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('instruments.edit'))
)
WITH CHECK (
    bucket_id = 'instruments'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('instruments.edit'))
);

CREATE POLICY "instruments_teacher_delete"
ON storage.objects FOR DELETE
TO authenticated
USING (
    bucket_id = 'instruments'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('instruments.edit'))
);

-- =============================================
-- 3.4 HISTORY (public: true)
-- =============================================
-- Path: {tenant_id}/{type}/{id}/{filename}

-- Anyone can view (bucket is public)
CREATE POLICY "history_select_public"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'history');

-- Teachers and admins can manage history content
CREATE POLICY "history_teacher_insert"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'history'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('history.create') OR internal.fn_has_permission('history.edit'))
);

CREATE POLICY "history_teacher_update"
ON storage.objects FOR UPDATE
TO authenticated
USING (
    bucket_id = 'history'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('history.edit'))
)
WITH CHECK (
    bucket_id = 'history'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('history.edit'))
);

CREATE POLICY "history_teacher_delete"
ON storage.objects FOR DELETE
TO authenticated
USING (
    bucket_id = 'history'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('history.edit'))
);

-- =============================================
-- 3.5 LESSONS (private)
-- =============================================
-- Path: {tenant_id}/{lesson_id}/{filename}

-- Same-tenant authenticated users can view
CREATE POLICY "lessons_select_tenant"
ON storage.objects FOR SELECT
TO authenticated
USING (
    bucket_id = 'lessons'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
);

-- Teachers and admins can upload lesson materials
CREATE POLICY "lessons_teacher_insert"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'lessons'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('lessons.create') OR internal.fn_has_permission('lessons.edit'))
);

CREATE POLICY "lessons_teacher_update"
ON storage.objects FOR UPDATE
TO authenticated
USING (
    bucket_id = 'lessons'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('lessons.edit'))
)
WITH CHECK (
    bucket_id = 'lessons'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('lessons.edit'))
);

CREATE POLICY "lessons_teacher_delete"
ON storage.objects FOR DELETE
TO authenticated
USING (
    bucket_id = 'lessons'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('lessons.delete'))
);

-- =============================================
-- 3.6 REPERTOIRE (private)
-- =============================================
-- Path: {tenant_id}/{repertoire_id}/{filename}

-- Same-tenant authenticated users can view
CREATE POLICY "repertoire_select_tenant"
ON storage.objects FOR SELECT
TO authenticated
USING (
    bucket_id = 'repertoire'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
);

-- Teachers and admins can manage repertoire files
CREATE POLICY "repertoire_teacher_insert"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'repertoire'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('repertoire.create') OR internal.fn_has_permission('repertoire.edit'))
);

CREATE POLICY "repertoire_teacher_update"
ON storage.objects FOR UPDATE
TO authenticated
USING (
    bucket_id = 'repertoire'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('repertoire.edit'))
)
WITH CHECK (
    bucket_id = 'repertoire'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('repertoire.edit'))
);

CREATE POLICY "repertoire_teacher_delete"
ON storage.objects FOR DELETE
TO authenticated
USING (
    bucket_id = 'repertoire'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (SELECT internal.fn_has_permission('repertoire.edit'))
);

-- =============================================
-- 3.7 PORTFOLIOS (private - owner + teachers + admin)
-- =============================================
-- Path: {tenant_id}/{student_id}/{portfolio_id}/{filename}

-- Students see own files; teachers see their students'; admins see all in tenant
CREATE POLICY "portfolios_select"
ON storage.objects FOR SELECT
TO authenticated
USING (
    bucket_id = 'portfolios'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (
        -- Own files
        (storage.foldername(name))[2] = auth.uid()::text
        -- Teacher of the student
        OR (SELECT internal.fn_is_teacher_of((storage.foldername(name))[2]::uuid))
        -- Admin
        OR (SELECT internal.fn_has_role('admin'))
    )
);

-- Students can upload to own folder
CREATE POLICY "portfolios_insert_own"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'portfolios'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (storage.foldername(name))[2] = auth.uid()::text
    AND (SELECT internal.fn_has_permission('portfolios.submit'))
);

-- Students can update own files
CREATE POLICY "portfolios_update_own"
ON storage.objects FOR UPDATE
TO authenticated
USING (
    bucket_id = 'portfolios'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (storage.foldername(name))[2] = auth.uid()::text
)
WITH CHECK (
    bucket_id = 'portfolios'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (storage.foldername(name))[2] = auth.uid()::text
);

-- Students can delete own files; admins can delete any in tenant
CREATE POLICY "portfolios_delete"
ON storage.objects FOR DELETE
TO authenticated
USING (
    bucket_id = 'portfolios'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (
        (storage.foldername(name))[2] = auth.uid()::text
        OR (SELECT internal.fn_has_role('admin'))
    )
);

-- =============================================
-- 3.8 CHALLENGES (private - owner + teachers + admin)
-- =============================================
-- Path: {tenant_id}/{student_id}/{submission_id}/{filename}

-- Students see own files; teachers see their students'; admins see all in tenant
CREATE POLICY "challenges_select"
ON storage.objects FOR SELECT
TO authenticated
USING (
    bucket_id = 'challenges'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (
        -- Own files
        (storage.foldername(name))[2] = auth.uid()::text
        -- Teacher of the student
        OR (SELECT internal.fn_is_teacher_of((storage.foldername(name))[2]::uuid))
        -- Admin
        OR (SELECT internal.fn_has_role('admin'))
    )
);

-- Students can upload to own folder
CREATE POLICY "challenges_insert_own"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'challenges'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (storage.foldername(name))[2] = auth.uid()::text
    AND (SELECT internal.fn_has_permission('challenges.participate'))
);

-- Students can update own files
CREATE POLICY "challenges_update_own"
ON storage.objects FOR UPDATE
TO authenticated
USING (
    bucket_id = 'challenges'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (storage.foldername(name))[2] = auth.uid()::text
)
WITH CHECK (
    bucket_id = 'challenges'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (storage.foldername(name))[2] = auth.uid()::text
);

-- Students can delete own files; admins can delete any in tenant
CREATE POLICY "challenges_delete"
ON storage.objects FOR DELETE
TO authenticated
USING (
    bucket_id = 'challenges'
    AND (storage.foldername(name))[1] = (SELECT (auth.jwt() ->> 'tenant_id'))
    AND (
        (storage.foldername(name))[2] = auth.uid()::text
        OR (SELECT internal.fn_has_role('admin'))
    )
);

-- =============================================
-- 4. Summary
-- =============================================
-- Buckets created: 8
--
-- | Bucket      | Public | Max Size | Path Structure                              |
-- |-------------|--------|----------|---------------------------------------------|
-- | avatars     | YES    | 2MB      | {tenant_id}/{user_id}/{filename}            |
-- | logos       | YES    | 5MB      | {tenant_id}/{filename}                      |
-- | instruments | YES    | 50MB     | {tenant_id}/{instrument_id}/{filename}      |
-- | history     | YES    | 25MB     | {tenant_id}/{type}/{id}/{filename}          |
-- | lessons     | NO     | 100MB    | {tenant_id}/{lesson_id}/{filename}          |
-- | repertoire  | NO     | 100MB    | {tenant_id}/{repertoire_id}/{filename}      |
-- | portfolios  | NO     | 100MB    | {tenant_id}/{student_id}/{portfolio_id}/{f} |
-- | challenges  | NO     | 50MB     | {tenant_id}/{student_id}/{submission_id}/{f}|
--
-- Security model:
-- - ALL paths start with {tenant_id} for tenant isolation
-- - Public buckets: anyone can read, permission-based write
-- - Private buckets: tenant-scoped read, owner/permission-based write
-- - Portfolios & Challenges: owner + teacher-of + admin access
-- - initPlan caching: (SELECT (auth.jwt()...)) pattern used everywhere
