-- =============================================
-- Migration 051: Storage Buckets for Media Upload
-- =============================================

-- 1. Create Storage Buckets (public = URLs acessíveis diretamente)
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES
  ('portfolios', 'portfolios', true, 52428800, -- 50MB
    ARRAY['image/jpeg','image/png','image/gif','image/webp','image/svg+xml',
          'audio/mpeg','audio/wav','audio/ogg','audio/mp4','audio/aac','audio/flac',
          'video/mp4','video/webm','video/quicktime',
          'application/pdf']::text[]),
  ('challenges', 'challenges', true, 52428800,
    ARRAY['image/jpeg','image/png','image/gif','image/webp',
          'audio/mpeg','audio/wav','audio/ogg','audio/mp4',
          'video/mp4','video/webm','video/quicktime',
          'application/pdf']::text[]),
  ('feed', 'feed', true, 52428800,
    ARRAY['image/jpeg','image/png','image/gif','image/webp',
          'audio/mpeg','audio/wav','audio/ogg','audio/mp4',
          'video/mp4','video/webm','video/quicktime']::text[])
ON CONFLICT (id) DO NOTHING;

-- 2. Storage Policies: authenticated users can upload to their own folder

-- PORTFOLIOS bucket
CREATE POLICY "Auth users can upload to portfolios"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (bucket_id = 'portfolios' AND (storage.foldername(name))[1] = auth.uid()::text);

CREATE POLICY "Auth users can read portfolios"
ON storage.objects FOR SELECT TO authenticated
USING (bucket_id = 'portfolios');

CREATE POLICY "Users can delete own portfolio files"
ON storage.objects FOR DELETE TO authenticated
USING (bucket_id = 'portfolios' AND (storage.foldername(name))[1] = auth.uid()::text);

-- CHALLENGES bucket
CREATE POLICY "Auth users can upload to challenges"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (bucket_id = 'challenges' AND (storage.foldername(name))[1] = auth.uid()::text);

CREATE POLICY "Auth users can read challenges"
ON storage.objects FOR SELECT TO authenticated
USING (bucket_id = 'challenges');

CREATE POLICY "Users can delete own challenge files"
ON storage.objects FOR DELETE TO authenticated
USING (bucket_id = 'challenges' AND (storage.foldername(name))[1] = auth.uid()::text);

-- FEED bucket
CREATE POLICY "Auth users can upload to feed"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (bucket_id = 'feed' AND (storage.foldername(name))[1] = auth.uid()::text);

CREATE POLICY "Auth users can read feed"
ON storage.objects FOR SELECT TO authenticated
USING (bucket_id = 'feed');

CREATE POLICY "Users can delete own feed files"
ON storage.objects FOR DELETE TO authenticated
USING (bucket_id = 'feed' AND (storage.foldername(name))[1] = auth.uid()::text);

-- 3. Public access (anon can read public buckets for direct URL access)
CREATE POLICY "Public read portfolios"
ON storage.objects FOR SELECT TO anon
USING (bucket_id = 'portfolios');

CREATE POLICY "Public read challenges"
ON storage.objects FOR SELECT TO anon
USING (bucket_id = 'challenges');

CREATE POLICY "Public read feed"
ON storage.objects FOR SELECT TO anon
USING (bucket_id = 'feed');
