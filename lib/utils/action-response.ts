import { ActionResult, ErrorCode } from '@/lib/types/action-result'

/**
 * Helper para retornar sucesso de uma action
 */
export function successResponse<T>(data: T, message?: string): ActionResult<T> {
  return { success: true, data, message }
}

/**
 * Helper para retornar erro de uma action
 */
export function errorResponse(error: string, code?: ErrorCode | string): ActionResult {
  return { success: false, error, code }
}

/**
 * Helper para erro de validação
 */
export function validationError(message: string): ActionResult {
  return errorResponse(message, ErrorCode.VALIDATION_ERROR)
}

/**
 * Helper para erro de autenticação
 */
export function unauthorizedError(message: string = 'Usuário não autenticado'): ActionResult {
  return errorResponse(message, ErrorCode.UNAUTHORIZED)
}

/**
 * Helper para erro de banco de dados
 */
export function databaseError(message: string = 'Erro ao acessar banco de dados'): ActionResult {
  return errorResponse(message, ErrorCode.DATABASE_ERROR)
}

/**
 * Helper para erro de não encontrado
 */
export function notFoundError(resource: string = 'Recurso'): ActionResult {
  return errorResponse(`${resource} não encontrado`, ErrorCode.NOT_FOUND)
}

/**
 * Helper para erro interno
 */
export function internalError(message: string = 'Erro inesperado'): ActionResult {
  return errorResponse(message, ErrorCode.INTERNAL_ERROR)
}
