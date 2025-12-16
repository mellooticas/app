/**
 * =====================================================
 * EXEMPLO: Server Actions com Logger
 * =====================================================
 * 
 * Este arquivo mostra como aplicar o logger estruturado
 * nas server actions existentes.
 * 
 * Padrão de uso:
 * 1. Criar logger específico da action
 * 2. Logar início da operação
 * 3. Logar validação
 * 4. Logar auth check
 * 5. Logar queries do banco
 * 6. Logar resultado final (sucesso/erro)
 */

'use server'

import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'
import { validateAction, validateFormData } from '@/lib/validations/validate-action'
import { submitPortfolioSchema, concluirAulaSchema } from '@/lib/validations/aluno-schemas'
import {
  successResponse,
  errorResponse,
  validationError,
  unauthorizedError,
  databaseError,
} from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'
import { createActionLogger, measurePerformance } from '@/lib/logger'

// ========================================
// EXEMPLO 1: submitPortfolio com Logger
// ========================================

export async function submitPortfolioComLogger(formData: FormData): Promise<ActionResult> {
  // 1. Criar logger específico
  const logger = createActionLogger('submitPortfolio')
  logger.startTimer()
  
  try {
    logger.info('Iniciando submissão de portfólio')

    // 2. Validação
    const validation = await validateFormData(submitPortfolioSchema, formData)
    if (!validation.success) {
      logger.warn('Validação falhou', { errors: validation.error })
      return validationError(validation.error)
    }
    logger.debug('Validação bem-sucedida', { data: validation.data })

    // 3. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Usuário não autenticado', authError)
      return unauthorizedError()
    }
    
    // Atualizar logger com userId
    const userLogger = logger.setContext({ userId: user.id })
    userLogger.info('Usuário autenticado')

    // 4. Upload do arquivo
    const arquivo = formData.get('arquivo') as File | null
    let arquivo_url = validation.data.arquivo_url

    if (arquivo && arquivo.size > 0) {
      userLogger.info('Fazendo upload de arquivo', { 
        fileName: arquivo.name, 
        fileSize: arquivo.size 
      })

      const { data: uploadData, error: uploadError } = await supabase.storage
        .from('portfolio')
        .upload(`obras/${user.id}/${Date.now()}-${arquivo.name}`, arquivo)

      if (uploadError) {
        userLogger.error('Erro no upload', uploadError, { fileName: arquivo.name })
        return databaseError('Erro ao fazer upload do arquivo')
      }

      const { data: { publicUrl } } = supabase.storage
        .from('portfolio')
        .getPublicUrl(uploadData.path)
      
      arquivo_url = publicUrl
      userLogger.debug('Upload concluído', { url: arquivo_url })
    }

    // 5. Salvar no banco
    userLogger.info('Salvando portfólio no banco')
    
    const { data, error } = await supabase
      .from('portfolios')
      .insert({
        aluno_id: user.id,
        titulo: validation.data.titulo,
        descricao: validation.data.descricao,
        tipo_obra: validation.data.tipo_obra,
        arquivo_url,
        instrumento_id: validation.data.instrumento_id,
      })
      .select()
      .single()

    if (error) {
      userLogger.error('Erro ao salvar portfólio', error)
      return databaseError('Erro ao salvar portfólio')
    }

    // 6. Revalidar cache
    revalidatePath('/dashboard/aluno/portfolio')
    userLogger.debug('Cache revalidado')

    // 7. Sucesso final
    userLogger.endTimer('Portfólio submetido com sucesso')
    
    return successResponse({
      portfolio: data,
      message: 'Portfólio submetido com sucesso!',
    })

  } catch (error) {
    logger.error('Erro inesperado ao submeter portfólio', error)
    return errorResponse('Erro inesperado ao submeter portfólio')
  }
}

// ========================================
// EXEMPLO 2: concluirAula com Logger
// ========================================

export async function concluirAulaComLogger(data: unknown): Promise<ActionResult> {
  const logger = createActionLogger('concluirAula')
  logger.startTimer()

  try {
    logger.info('Iniciando conclusão de aula')

    // 1. Validação
    const validation = await validateAction(concluirAulaSchema, data)
    if (!validation.success) {
      logger.warn('Validação falhou', { errors: validation.error })
      return validationError(validation.error)
    }

    // 2. Auth
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Usuário não autenticado', authError)
      return unauthorizedError()
    }

    const userLogger = logger.setContext({ 
      userId: user.id,
      action: `concluirAula:${validation.data.aula_id}`
    })
    userLogger.info('Usuário autenticado', { aulaId: validation.data.aula_id })

    // 3. Verificar se já foi concluída
    const { data: progresso, error: checkError } = await supabase
      .from('aula_progresso')
      .select('concluida')
      .eq('aluno_id', user.id)
      .eq('aula_id', validation.data.aula_id)
      .single()

    if (checkError && checkError.code !== 'PGRST116') {
      userLogger.error('Erro ao verificar progresso', checkError)
      return databaseError('Erro ao verificar progresso da aula')
    }

    if (progresso?.concluida) {
      userLogger.warn('Aula já estava concluída', { aulaId: validation.data.aula_id })
      return errorResponse('Aula já foi concluída')
    }

    // 4. Marcar como concluída usando RPC
    userLogger.info('Marcando aula como concluída via RPC')
    
    const { data: result, error: rpcError } = await supabase
      .rpc('concluir_aula_transaction', {
        p_aluno_id: user.id,
        p_aula_id: validation.data.aula_id,
        p_tempo_estudo_minutos: validation.data.tempo_estudo_minutos,
        p_notas_aluno: validation.data.notas_aluno,
      })

    if (rpcError) {
      userLogger.error('Erro na função RPC', rpcError)
      return databaseError('Erro ao concluir aula')
    }

    userLogger.info('Aula concluída', { 
      aulaId: validation.data.aula_id,
      pontosGanhos: result.points_awarded,
      conquistaDesbloqueada: result.achievement_unlocked
    })

    // 5. Revalidar
    revalidatePath('/dashboard/aluno/aulas')
    revalidatePath('/dashboard/aluno/progresso')

    userLogger.endTimer('Aula concluída com sucesso')

    return successResponse({
      message: result.message,
      pointsAwarded: result.points_awarded,
      achievementUnlocked: result.achievement_unlocked,
    })

  } catch (error) {
    logger.error('Erro inesperado ao concluir aula', error)
    return errorResponse('Erro inesperado ao concluir aula')
  }
}

// ========================================
// EXEMPLO 3: Usando measurePerformance helper
// ========================================

export async function buscarAulasComLogger(nivel?: string): Promise<ActionResult> {
  const logger = createActionLogger('buscarAulas')

  try {
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      return unauthorizedError()
    }

    const userLogger = logger.setContext({ userId: user.id })

    // Usar measurePerformance para queries
    const aulas = await measurePerformance(
      async () => {
        let query = supabase
          .from('aulas')
          .select('*')
          .eq('status', 'publicada')

        if (nivel) {
          query = query.eq('nivel', nivel)
        }

        const { data, error } = await query

        if (error) throw error
        return data
      },
      `Buscar aulas${nivel ? ` (nível: ${nivel})` : ''}`,
      userLogger
    )

    return successResponse({ aulas })

  } catch (error) {
    logger.error('Erro ao buscar aulas', error)
    return errorResponse('Erro ao buscar aulas')
  }
}

// ========================================
// PADRÃO RECOMENDADO
// ========================================

/**
 * CHECKLIST para adicionar logger em server actions:
 * 
 * ✅ 1. Criar logger: `const logger = createActionLogger('nomeDaAction')`
 * ✅ 2. Iniciar timer: `logger.startTimer()`
 * ✅ 3. Logar início: `logger.info('Iniciando...')`
 * ✅ 4. Logar validação: `logger.warn()` se falhar, `logger.debug()` se suceder
 * ✅ 5. Logar auth: `logger.error()` se falhar, depois `setContext({ userId })`
 * ✅ 6. Logar operações do banco: `logger.info()` antes, `logger.error()` se falhar
 * ✅ 7. Logar sucesso: `logger.endTimer('Operação concluída')`
 * ✅ 8. Catch final: `logger.error('Erro inesperado', error)`
 * 
 * BENEFÍCIOS:
 * - Debug mais fácil em produção
 * - Métricas de performance automáticas
 * - Rastreamento de erros estruturado
 * - Correlação de logs por requestId
 * - Integração futura com Sentry/Datadog
 */
