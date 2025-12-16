/**
 * =====================================================
 * LOGGER ESTRUTURADO - NIPO SCHOOL
 * =====================================================
 * 
 * Sistema de logging estruturado para monitoramento e debugging
 * 
 * Funcionalidades:
 * - Logs estruturados em JSON
 * - Níveis de log (debug, info, warn, error, fatal)
 * - Contexto automático (timestamp, requestId, userId, etc.)
 * - Integração com Sentry para erros
 * - Ambiente aware (dev vs production)
 * 
 * Uso:
 * ```ts
 * import { logger } from '@/lib/logger';
 * 
 * logger.info('Usuário logado', { userId: '123' });
 * logger.error('Erro ao salvar', { error, data });
 * logger.warn('Tentativa duplicada', { reference_id });
 * ```
 */

// =====================================================
// TIPOS
// =====================================================

export enum LogLevel {
  DEBUG = 'debug',
  INFO = 'info',
  WARN = 'warn',
  ERROR = 'error',
  FATAL = 'fatal',
}

export interface LogContext {
  timestamp: string;
  level: LogLevel;
  message: string;
  requestId?: string;
  userId?: string;
  action?: string;
  duration?: number;
  error?: {
    message: string;
    stack?: string;
    code?: string;
  };
  metadata?: Record<string, unknown>;
  environment: 'development' | 'production' | 'test';
}

export interface LoggerOptions {
  minLevel?: LogLevel;
  enableConsole?: boolean;
  enableSentry?: boolean;
  requestId?: string;
  userId?: string;
  action?: string;
}

// =====================================================
// CONFIGURAÇÃO
// =====================================================

const LOG_LEVELS: Record<LogLevel, number> = {
  [LogLevel.DEBUG]: 0,
  [LogLevel.INFO]: 1,
  [LogLevel.WARN]: 2,
  [LogLevel.ERROR]: 3,
  [LogLevel.FATAL]: 4,
};

const isDevelopment = process.env.NODE_ENV === 'development';
const isTest = process.env.NODE_ENV === 'test';
const isProduction = process.env.NODE_ENV === 'production';

// Nível mínimo de log baseado no ambiente
const DEFAULT_MIN_LEVEL = isDevelopment 
  ? LogLevel.DEBUG 
  : LogLevel.INFO;

// =====================================================
// LOGGER CLASS
// =====================================================

export class Logger {
  private options: Required<LoggerOptions>;
  private startTime?: number;

  constructor(options: LoggerOptions = {}) {
    this.options = {
      minLevel: options.minLevel || DEFAULT_MIN_LEVEL,
      enableConsole: options.enableConsole ?? true,
      enableSentry: options.enableSentry ?? isProduction,
      requestId: options.requestId || this.generateRequestId(),
      userId: options.userId || '',
      action: options.action || '',
    };
  }

  // =====================================================
  // MÉTODOS PÚBLICOS
  // =====================================================

  debug(message: string, metadata?: Record<string, unknown>): void {
    this.log(LogLevel.DEBUG, message, metadata);
  }

  info(message: string, metadata?: Record<string, unknown>): void {
    this.log(LogLevel.INFO, message, metadata);
  }

  warn(message: string, metadata?: Record<string, unknown>): void {
    this.log(LogLevel.WARN, message, metadata);
  }

  error(message: string, error?: Error | unknown, metadata?: Record<string, unknown>): void {
    const errorData = this.formatError(error);
    this.log(LogLevel.ERROR, message, { ...metadata, error: errorData });

    // Enviar para Sentry se habilitado
    if (this.options.enableSentry && error instanceof Error) {
      this.sendToSentry(error, metadata);
    }
  }

  fatal(message: string, error?: Error | unknown, metadata?: Record<string, unknown>): void {
    const errorData = this.formatError(error);
    this.log(LogLevel.FATAL, message, { ...metadata, error: errorData });

    // Sempre enviar fatal para Sentry
    if (error instanceof Error) {
      this.sendToSentry(error, { ...metadata, level: 'fatal' });
    }
  }

  // =====================================================
  // TIMER (para medir performance)
  // =====================================================

  startTimer(): void {
    this.startTime = Date.now();
  }

  endTimer(message: string, metadata?: Record<string, unknown>): void {
    if (!this.startTime) {
      this.warn('endTimer called without startTimer');
      return;
    }

    const duration = Date.now() - this.startTime;
    this.info(message, { ...metadata, duration });
    this.startTime = undefined;
  }

  // =====================================================
  // CONTEXTO
  // =====================================================

  setContext(context: Partial<Pick<LoggerOptions, 'userId' | 'action' | 'requestId'>>): Logger {
    return new Logger({
      ...this.options,
      ...context,
    });
  }

  // =====================================================
  // MÉTODOS PRIVADOS
  // =====================================================

  private log(level: LogLevel, message: string, metadata?: Record<string, unknown>): void {
    // Verificar se deve logar baseado no nível mínimo
    if (LOG_LEVELS[level] < LOG_LEVELS[this.options.minLevel]) {
      return;
    }

    // Não logar em testes (a menos que seja error ou fatal)
    if (isTest && level !== LogLevel.ERROR && level !== LogLevel.FATAL) {
      return;
    }

    const logContext: LogContext = {
      timestamp: new Date().toISOString(),
      level,
      message,
      requestId: this.options.requestId,
      userId: this.options.userId || undefined,
      action: this.options.action || undefined,
      metadata,
      environment: (process.env.NODE_ENV || 'development') as LogContext['environment'],
    };

    // Console output
    if (this.options.enableConsole) {
      this.outputToConsole(logContext);
    }

    // Aqui você pode adicionar outros destinos:
    // - Arquivo de log
    // - Serviço de log (Datadog, LogRocket, etc.)
    // - Database
  }

  private outputToConsole(context: LogContext): void {
    const { level, message, timestamp, metadata, error } = context;

    // Em desenvolvimento: log formatado e colorido
    if (isDevelopment) {
      const colors = {
        debug: '\x1b[36m', // Cyan
        info: '\x1b[32m',  // Green
        warn: '\x1b[33m',  // Yellow
        error: '\x1b[31m', // Red
        fatal: '\x1b[35m', // Magenta
      };
      const reset = '\x1b[0m';
      const color = colors[level];

      console.log(
        `${color}[${level.toUpperCase()}]${reset} ${timestamp} - ${message}`,
        metadata && Object.keys(metadata).length > 0 ? metadata : ''
      );

      if (error) {
        console.error(`${color}Error:${reset}`, error);
      }
    } 
    // Em produção: JSON estruturado
    else {
      console.log(JSON.stringify(context));
    }
  }

  private formatError(error: unknown): LogContext['error'] | undefined {
    if (!error) return undefined;

    if (error instanceof Error) {
      return {
        message: error.message,
        stack: error.stack,
        code: (error as any).code,
      };
    }

    if (typeof error === 'string') {
      return {
        message: error,
      };
    }

    return {
      message: String(error),
    };
  }

  private sendToSentry(error: Error, metadata?: Record<string, unknown>): void {
    // TODO: Integrar com Sentry quando configurado
    // import * as Sentry from '@sentry/nextjs';
    // Sentry.captureException(error, {
    //   tags: {
    //     action: this.options.action,
    //   },
    //   extra: metadata,
    // });
    
    // Por enquanto, apenas log
    if (isDevelopment) {
      console.error('📤 [SENTRY] Error would be sent:', error, metadata);
    }
  }

  private generateRequestId(): string {
    return `req_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
  }
}

// =====================================================
// INSTÂNCIA PADRÃO
// =====================================================

export const logger = new Logger();

// =====================================================
// HELPER: Create logger for specific action
// =====================================================

export function createActionLogger(
  action: string, 
  userId?: string
): Logger {
  return new Logger({
    action,
    userId,
    requestId: `action_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
  });
}

// =====================================================
// HELPER: Measure async function performance
// =====================================================

export async function measurePerformance<T>(
  fn: () => Promise<T>,
  logMessage: string,
  actionLogger?: Logger
): Promise<T> {
  const log = actionLogger || logger;
  const startTime = Date.now();

  try {
    const result = await fn();
    const duration = Date.now() - startTime;
    
    log.info(logMessage, { duration, success: true });
    
    return result;
  } catch (error) {
    const duration = Date.now() - startTime;
    
    log.error(logMessage, error, { duration, success: false });
    
    throw error;
  }
}

// =====================================================
// EXPORTS
// =====================================================

export default logger;
