// src/utils/error-handler.ts
// Sistema centralizado de tratamento de erros

import { formatSupabaseError } from './supabase-helpers';

export interface ErrorResponse {
  message: string;
  code?: string;
  details?: any;
}

/**
 * Classe para erros customizados da aplicação
 */
export class AppError extends Error {
  code: string;
  details?: any;

  constructor(message: string, code: string = 'APP_ERROR', details?: any) {
    super(message);
    this.name = 'AppError';
    this.code = code;
    this.details = details;
  }
}

/**
 * Handler global de erros
 */
export const handleError = (error: unknown): ErrorResponse => {
  console.error('❌ Error:', error);

  // Erro customizado da aplicação
  if (error instanceof AppError) {
    return {
      message: error.message,
      code: error.code,
      details: error.details
    };
  }

  // Erro do Supabase
  const supabaseMessage = formatSupabaseError(error);
  if (supabaseMessage) {
    return {
      message: supabaseMessage,
      code: 'SUPABASE_ERROR'
    };
  }

  // Erro genérico
  if (error instanceof Error) {
    return {
      message: error.message,
      code: 'UNKNOWN_ERROR'
    };
  }

  // Fallback
  return {
    message: 'Ocorreu um erro inesperado',
    code: 'UNKNOWN_ERROR'
  };
};

/**
 * Wrapper para funções assíncronas com tratamento de erro
 */
export const withErrorHandling = <T>(
  fn: () => Promise<T>
): Promise<T> => {
  return fn().catch((error) => {
    const errorResponse = handleError(error);
    throw new AppError(
      errorResponse.message,
      errorResponse.code || 'UNKNOWN_ERROR',
      errorResponse.details
    );
  });
};

/**
 * Toast de erro (para ser usado com biblioteca de toast)
 */
export const showErrorToast = (error: unknown) => {
  const errorResponse = handleError(error);
  console.error('🔴 Toast Error:', errorResponse.message);
  // Aqui você pode integrar com react-toastify, sonner, etc
  // toast.error(errorResponse.message);
};

/**
 * Erros comuns pré-definidos
 */
export const CommonErrors = {
  AUTH_REQUIRED: new AppError('Autenticação necessária', 'AUTH_REQUIRED'),
  PERMISSION_DENIED: new AppError('Permissão negada', 'PERMISSION_DENIED'),
  NOT_FOUND: new AppError('Recurso não encontrado', 'NOT_FOUND'),
  INVALID_INPUT: new AppError('Dados inválidos', 'INVALID_INPUT'),
  NETWORK_ERROR: new AppError('Erro de conexão', 'NETWORK_ERROR'),
};
