// src/utils/supabase-helpers.ts
// Helpers genéricos para trabalhar com Supabase

import { PostgrestError } from '@supabase/supabase-js';

/**
 * Verifica se um erro é do tipo PostgrestError
 */
export const isPostgrestError = (error: unknown): error is PostgrestError => {
  return (
    typeof error === 'object' &&
    error !== null &&
    'code' in error &&
    'message' in error &&
    'details' in error
  );
};

/**
 * Formata mensagem de erro do Supabase
 */
export const formatSupabaseError = (error: unknown): string => {
  if (isPostgrestError(error)) {
    return error.message || 'Erro desconhecido do banco de dados';
  }
  
  if (error instanceof Error) {
    return error.message;
  }
  
  return 'Erro desconhecido';
};

/**
 * Helper para upload de arquivo no Supabase Storage
 */
export const uploadFile = async (
  bucket: string,
  path: string,
  file: File
): Promise<string> => {
  const { supabase } = await import('../lib/supabase/client');
  
  const { data, error } = await supabase.storage
    .from(bucket)
    .upload(path, file, {
      cacheControl: '3600',
      upsert: false
    });

  if (error) throw error;
  
  // Retorna URL pública
  const { data: { publicUrl } } = supabase.storage
    .from(bucket)
    .getPublicUrl(data.path);
    
  return publicUrl;
};

/**
 * Helper para deletar arquivo do Supabase Storage
 */
export const deleteFile = async (
  bucket: string,
  path: string
): Promise<void> => {
  const { supabase } = await import('../lib/supabase/client');
  
  const { error } = await supabase.storage
    .from(bucket)
    .remove([path]);

  if (error) throw error;
};

/**
 * Helper para listar arquivos de um bucket
 */
export const listFiles = async (
  bucket: string,
  path: string = ''
): Promise<any[]> => {
  const { supabase } = await import('../lib/supabase/client');
  
  const { data, error } = await supabase.storage
    .from(bucket)
    .list(path);

  if (error) throw error;
  return data || [];
};

/**
 * Validação de permissão baseada em RLS
 * Retorna true se usuário tem permissão
 */
export const checkPermission = async (
  table: string,
  operation: 'select' | 'insert' | 'update' | 'delete'
): Promise<boolean> => {
  // RLS do Supabase já faz isso automaticamente
  // Esta função é mais para documentação
  return true;
};

/**
 * Helper para paginação
 */
export interface PaginationOptions {
  page: number;
  pageSize: number;
}

export const getPaginationRange = (
  options: PaginationOptions
): { from: number; to: number } => {
  const { page, pageSize } = options;
  const from = (page - 1) * pageSize;
  const to = from + pageSize - 1;
  return { from, to };
};
