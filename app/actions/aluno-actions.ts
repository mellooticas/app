'use server'

import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'
import { validateAction, validateFormData } from '@/lib/validations/validate-action'
import {
  submitPortfolioSchema,
  updatePortfolioSchema,
  updatePortfolioItemSchema,
  participarDesafioSchema,
  submeterDesafioSchema,
  concluirAulaSchema,
  comentarioAulaSchema,
  atualizarPerfilSchema,
} from '@/lib/validations/aluno-schemas'
import {
  successResponse,
  errorResponse,
  validationError,
  unauthorizedError,
  databaseError,
  notFoundError,
} from '@/lib/utils/action-response'
import type { ActionResult } from '@/lib/types/action-result'
import { createActionLogger } from '@/lib/logger'

// ========================================
// PORTFOLIO ACTIONS
// ========================================

export async function submitPortfolio(formData: FormData): Promise<ActionResult> {
  const logger = createActionLogger('submitPortfolio')
  const timer = logger.startTimer()
  
  try {
    logger.info('Iniciando submissão de portfólio')
    
    // 1. Validação
    const validation = await validateFormData(submitPortfolioSchema, formData)
    if (!validation.success) {
      logger.warn('Validação falhou', { errors: validation.error })
      logger.endTimer(timer, false)
      return validationError(validation.error)
    }
    logger.debug('Validação bem-sucedida')

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Usuário não autenticado', { error: authError?.message })
      logger.endTimer(timer, false)
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Upload do arquivo (se fornecido)
    const arquivo = formData.get('arquivo') as File | null
    let arquivo_url = validation.data.arquivo_url

    if (arquivo && arquivo.size > 0) {
      logger.info('Fazendo upload de arquivo', { 
        fileName: arquivo.name, 
        fileSize: arquivo.size 
      })
      
      const { data: uploadData, error: uploadError } = await supabase.storage
        .from('portfolio')
        .upload(`obras/${user.id}/${Date.now()}-${arquivo.name}`, arquivo)

      if (uploadError) {
        logger.error('Erro no upload', { error: uploadError.message, fileName: arquivo.name })
        logger.endTimer(timer, false)
        return databaseError('Erro ao fazer upload do arquivo')
      }

      const { data: { publicUrl } } = supabase.storage
        .from('portfolio')
        .getPublicUrl(uploadData.path)
      
      arquivo_url = publicUrl
      logger.info('Upload concluído', { url: publicUrl })
    }

    // 4. Salvar no banco
    logger.info('Salvando portfólio no banco')
    
    const { data, error } = await supabase
      .from('portfolios')
      .insert({
        user_id: user.id,
        titulo: validation.data.titulo,
        descricao: validation.data.descricao,
        tipo: validation.data.tipo_obra,
        arquivo_url,
        instrumento_id: validation.data.instrumento_id,
      })
      .select()
      .single()

    if (error) {
      logger.error('Erro ao salvar portfólio', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao salvar portfólio')
    }

    logger.info('Portfólio salvo com sucesso', { portfolioId: data.id })

    // 5. Revalidate
    revalidatePath('/alunos/portfolio')
    logger.debug('Cache revalidado')

    logger.endTimer(timer, true)
    return successResponse(data, 'Obra adicionada ao portfólio com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado ao processar portfólio')
  }
}

export async function deletePortfolioItem(obraId: string): Promise<ActionResult> {
  const logger = createActionLogger('deletePortfolioItem')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação básica
    if (!obraId || obraId.length === 0) {
      logger.warn('Validação falhou: ID da obra ausente')
      return validationError('ID da obra é obrigatório')
    }
    logger.info('Validação concluída', { obraId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Buscar obra para verificar ownership
    const { data: obra, error: fetchError } = await supabase
      .from('portfolios')
      .select('*')
      .eq('id', obraId)
      .eq('aluno_id', user.id)
      .single()

    if (fetchError || !obra) {
      return notFoundError('Obra')
    }

    // 4. Soft delete
    const { error: deleteError } = await supabase
      .from('portfolios')
      .update({ deleted_at: new Date().toISOString() })
      .eq('id', obraId)

    if (deleteError) {
      console.error('Erro ao deletar obra:', deleteError)
      return databaseError('Erro ao remover obra')
    }

    // 5. Revalidate
    revalidatePath('/alunos/portfolio')

    return successResponse({ id: obraId }, 'Obra removida do portfólio')

  } catch (error) {
    console.error('Erro inesperado ao deletar obra:', error)
    return errorResponse('Erro inesperado ao deletar obra')
  }
}

export async function updatePortfolioItem(obraId: string, rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('updatePortfolioItem')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(updatePortfolioItemSchema, { ...rawData, obraId })
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { obraId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar ownership
    const { data: obra, error: fetchError } = await supabase
      .from('portfolios')
      .select('id')
      .eq('id', obraId)
      .eq('aluno_id', user.id)
      .single()

    if (fetchError || !obra) {
      return notFoundError('Obra')
    }

    // 4. Update
    const { data, error } = await supabase
      .from('portfolios')
      .update(validation.data)
      .eq('id', obraId)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao atualizar obra no banco', { error: error.message, obraId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao atualizar obra')
    }

    logger.info('Obra atualizada com sucesso', { obraId })

    // 5. Revalidate
    revalidatePath('/alunos/portfolio')
    revalidatePath(`/alunos/portfolio/${obraId}`)

    logger.endTimer(timer, true)
    return successResponse(data, 'Obra atualizada com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

// ========================================
// DESAFIOS ACTIONS
// ========================================

export async function participarDesafio(desafioId: string): Promise<ActionResult> {
  const logger = createActionLogger('participarDesafio')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(participarDesafioSchema, { desafioId })
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { desafioId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar se desafio existe e está ativo
    const { data: desafio, error: desafioError } = await supabase
      .from('alpha_desafios')
      .select('id, titulo, ativo')
      .eq('id', desafioId)
      .single()

    if (desafioError || !desafio) {
      return notFoundError('Desafio')
    }

    if (!desafio.ativo) {
      return errorResponse('Este desafio não está mais ativo', 'DESAFIO_INATIVO')
    }

    // 4. Verificar se já está participando
    const { data: existing } = await supabase
      .from('alpha_submissoes')
      .select('id')
      .eq('desafio_id', desafioId)
      .eq('aluno_id', user.id)
      .maybeSingle()

    if (existing) {
      return errorResponse('Você já está participando deste desafio', 'JA_PARTICIPANDO')
    }

    // 5. Criar participação
    const { data, error } = await supabase
      .from('alpha_submissoes')
      .insert({
        desafio_id: desafioId,
        aluno_id: user.id,
        status: 'em_andamento',
      })
      .select()
      .single()

    if (error) {
      logger.error('Erro ao registrar participação no banco', { error: error.message, desafioId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao registrar participação')
    }

    logger.info('Participação registrada com sucesso', { desafioId })

    // 6. Revalidate
    revalidatePath('/alunos/desafios')
    revalidatePath(`/alunos/desafios/${desafioId}`)

    logger.endTimer(timer, true)
    return successResponse(data, 'Você está participando do desafio!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function submeterDesafio(desafioId: string, formData: FormData): Promise<ActionResult> {
  const logger = createActionLogger('submeterDesafio')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const rawData = {
      desafioId,
      arquivo_url: formData.get('arquivo_url') as string,
      descricao_submissao: formData.get('descricao_submissao') as string,
    }
    const validation = await validateAction(submeterDesafioSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { desafioId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Upload do arquivo (se fornecido)
    const arquivo = formData.get('arquivo') as File | null
    let arquivo_url = validation.data.arquivo_url

    if (arquivo && arquivo.size > 0) {
      logger.info('Iniciando upload de arquivo', { fileName: arquivo.name, fileSize: arquivo.size })
      const { data: uploadData, error: uploadError } = await supabase.storage
        .from('desafios')
        .upload(`submissoes/${user.id}/${Date.now()}-${arquivo.name}`, arquivo)

      if (uploadError) {
        logger.error('Erro ao fazer upload', { error: uploadError.message })
        logger.endTimer(timer, false)
        return databaseError('Erro ao fazer upload do arquivo')
      }

      const { data: { publicUrl } } = supabase.storage
        .from('desafios')
        .getPublicUrl(uploadData.path)
      
      arquivo_url = publicUrl
      logger.info('Upload concluído', { url: publicUrl })
    }

    // 4. Atualizar submissão
    const { data, error } = await supabase
      .from('alpha_submissoes')
      .update({
        arquivo_url,
        descricao: validation.data.descricao_submissao,
        status: 'submetido',
        data_submissao: new Date().toISOString(),
      })
      .eq('desafio_id', desafioId)
      .eq('aluno_id', user.id)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao submeter desafio no banco', { error: error.message, desafioId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao submeter desafio')
    }

    logger.info('Desafio submetido com sucesso', { desafioId })

    // 5. Revalidate
    revalidatePath('/alunos/desafios')
    revalidatePath(`/alunos/desafios/${desafioId}`)

    logger.endTimer(timer, true)
    return successResponse(data, 'Desafio submetido com sucesso! Aguarde a avaliação.')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function cancelarParticipacaoDesafio(desafioId: string): Promise<ActionResult> {
  const logger = createActionLogger('cancelarParticipacaoDesafio')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    if (!desafioId || desafioId.length === 0) {
      logger.warn('Validação falhou: ID do desafio ausente')
      return validationError('ID do desafio é obrigatório')
    }
    logger.info('Validação concluída', { desafioId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Cancelar (soft delete)
    const { error } = await supabase
      .from('alpha_submissoes')
      .update({ 
        status: 'cancelado',
        deleted_at: new Date().toISOString() 
      })
      .eq('desafio_id', desafioId)
      .eq('aluno_id', user.id)

    if (error) {
      logger.error('Erro ao cancelar participação no banco', { error: error.message, desafioId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao cancelar participação')
    }

    logger.info('Participação cancelada com sucesso', { desafioId })

    // 4. Revalidate
    revalidatePath('/alunos/desafios')
    revalidatePath(`/alunos/desafios/${desafioId}`)

    logger.endTimer(timer, true)
    return successResponse({ desafioId }, 'Participação cancelada')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

// ========================================
// AULAS ACTIONS
// ========================================

export async function marcarAulaFavorita(aulaId: string): Promise<ActionResult> {
  const logger = createActionLogger('marcarAulaFavorita')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação básica
    if (!aulaId || aulaId.length === 0) {
      logger.warn('Validação falhou: ID da aula ausente')
      return validationError('ID da aula é obrigatório')
    }
    logger.info('Validação concluída', { aulaId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Adicionar favorito
    const { data, error } = await supabase
      .from('aulas_favoritas')
      .insert({ 
        aula_id: aulaId,
        aluno_id: user.id 
      })
      .select()
      .single()

    if (error) {
      // Se já existe, ignorar
      if (error.code === '23505') {
        logger.info('Aula já estava nos favoritos', { aulaId })
        logger.endTimer(timer, true)
        return successResponse({ aulaId }, 'Aula já está nos favoritos')
      }
      logger.error('Erro ao marcar favorito no banco', { error: error.message, aulaId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao marcar favorito')
    }

    logger.info('Aula marcada como favorita', { aulaId })

    // 4. Revalidate
    revalidatePath('/alunos/aulas')

    logger.endTimer(timer, true)
    return successResponse(data, 'Aula adicionada aos favoritos!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function removerAulaFavorita(aulaId: string): Promise<ActionResult> {
  const logger = createActionLogger('removerAulaFavorita')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação básica
    if (!aulaId || aulaId.length === 0) {
      logger.warn('Validação falhou: ID da aula ausente')
      return validationError('ID da aula é obrigatório')
    }
    logger.info('Validação concluída', { aulaId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Remover favorito
    const { error } = await supabase
      .from('aulas_favoritas')
      .delete()
      .eq('aula_id', aulaId)
      .eq('aluno_id', user.id)

    if (error) {
      logger.error('Erro ao remover favorito no banco', { error: error.message, aulaId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao remover favorito')
    }

    logger.info('Aula removida dos favoritos', { aulaId })

    // 4. Revalidate
    revalidatePath('/alunos/aulas')

    logger.endTimer(timer, true)
    return successResponse({ aulaId }, 'Aula removida dos favoritos')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function concluirAula(aulaId: string, tempoEstudo?: number): Promise<ActionResult> {
  const logger = createActionLogger('concluirAula')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(concluirAulaSchema, { aulaId, tempoEstudo })
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { aulaId, tempoEstudo })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Marcar como concluída (upsert)
    const { data, error } = await supabase
      .from('aula_progresso')
      .upsert({
        aluno_id: user.id,
        aula_id: validation.data.aulaId,
        concluida: true,
        tempo_estudo_minutos: validation.data.tempoEstudo || 0,
        data_conclusao: new Date().toISOString(),
      }, {
        onConflict: 'aluno_id,aula_id'
      })
      .select()
      .single()

    if (error) {
      logger.error('Erro ao marcar aula como concluída no banco', { error: error.message, aulaId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao marcar aula como concluída')
    }

    logger.info('Aula concluída com sucesso', { aulaId, tempoEstudo: validation.data.tempoEstudo })

    // 4. TODO: Adicionar pontos (será feito via transaction na semana 5)
    const xpGanho = 50

    // 5. Revalidate
    revalidatePath('/alunos/aulas')
    revalidatePath(`/alunos/aulas/${aulaId}`)
    revalidatePath('/alunos/progresso')

    logger.endTimer(timer, true)
    return successResponse(
      { ...data, xpGanho }, 
      `Parabéns! Aula concluída. Você ganhou ${xpGanho} XP!`
    )

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

// ========================================
// COMENTÁRIOS ACTIONS
// ========================================

export async function enviarComentario(aulaId: string, comentario: string): Promise<ActionResult> {
  const logger = createActionLogger('enviarComentario')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(comentarioAulaSchema, { aulaId, comentario })
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída', { aulaId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Salvar comentário
    const { data, error } = await supabase
      .from('aulas_comentarios')
      .insert({
        aula_id: validation.data.aulaId,
        user_id: user.id,
        comentario: validation.data.comentario,
      })
      .select()
      .single()

    if (error) {
      logger.error('Erro ao salvar comentário no banco', { error: error.message, aulaId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao enviar comentário')
    }

    logger.info('Comentário enviado com sucesso', { aulaId, comentarioId: data.id })

    // 4. Revalidate
    revalidatePath(`/alunos/aulas/${aulaId}`)

    logger.endTimer(timer, true)
    return successResponse(data, 'Comentário adicionado!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function deletarComentario(comentarioId: string): Promise<ActionResult> {
  const logger = createActionLogger('deletarComentario')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação básica
    if (!comentarioId || comentarioId.length === 0) {
      logger.warn('Validação falhou: ID do comentário ausente')
      return validationError('ID do comentário é obrigatório')
    }
    logger.info('Validação concluída', { comentarioId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Verificar ownership antes de deletar
    const { data: comentario, error: fetchError } = await supabase
      .from('aulas_comentarios')
      .select('id, user_id')
      .eq('id', comentarioId)
      .single()

    if (fetchError || !comentario) {
      return notFoundError('Comentário')
    }

    if (comentario.user_id !== user.id) {
      return errorResponse('Você não pode deletar este comentário', 'FORBIDDEN')
    }

    // 4. Deletar (soft delete)
    const { error } = await supabase
      .from('aulas_comentarios')
      .update({ deleted_at: new Date().toISOString() })
      .eq('id', comentarioId)

    if (error) {
      logger.error('Erro ao deletar comentário no banco', { error: error.message, comentarioId })
      logger.endTimer(timer, false)
      return databaseError('Erro ao remover comentário')
    }

    logger.info('Comentário deletado com sucesso', { comentarioId })

    // 5. Revalidate
    revalidatePath('/alunos/aulas')

    logger.endTimer(timer, true)
    return successResponse({ id: comentarioId }, 'Comentário removido')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function curtirComentario(comentarioId: string): Promise<ActionResult> {
  const logger = createActionLogger('curtirComentario')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação básica
    if (!comentarioId || comentarioId.length === 0) {
      logger.warn('Validação falhou: ID do comentário ausente')
      return validationError('ID do comentário é obrigatório')
    }
    logger.info('Validação concluída', { comentarioId })

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Toggle curtida
    const { data: existing } = await supabase
      .from('comentarios_curtidas')
      .select('id')
      .eq('comentario_id', comentarioId)
      .eq('user_id', user.id)
      .maybeSingle()

    if (existing) {
      // Já curtiu, remover curtida
      const { error } = await supabase
        .from('comentarios_curtidas')
        .delete()
        .eq('id', existing.id)

      if (error) {
        logger.error('Erro ao descurtir comentário', { error: error.message, comentarioId })
        logger.endTimer(timer, false)
        return databaseError('Erro ao processar curtida')
      }

      logger.info('Curtida removida', { comentarioId })
      logger.endTimer(timer, true)
      return successResponse({ curtido: false }, 'Curtida removida')
    } else {
      // Ainda não curtiu, adicionar curtida
      const { data, error } = await supabase
        .from('comentarios_curtidas')
        .insert({
          comentario_id: comentarioId,
          user_id: user.id,
        })
        .select()
        .single()

      if (error) {
        logger.error('Erro ao curtir comentário', { error: error.message, comentarioId })
        logger.endTimer(timer, false)
        return databaseError('Erro ao processar curtida')
      }

      logger.info('Comentário curtido', { comentarioId })
      logger.endTimer(timer, true)
      return successResponse({ curtido: true, ...data }, 'Comentário curtido!')
    }

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

// ========================================
// PERFIL ACTIONS
// ========================================

export async function atualizarPerfil(rawData: any): Promise<ActionResult> {
  const logger = createActionLogger('atualizarPerfil')
  const timer = logger.startTimer()
  
  try {
    // 1. Validação
    const validation = await validateAction(atualizarPerfilSchema, rawData)
    if (!validation.success) {
      logger.warn('Validação falhou', { error: validation.error })
      return validationError(validation.error)
    }
    logger.info('Validação concluída')

    // 2. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 3. Update profile
    const { data, error } = await supabase
      .from('profiles')
      .update(validation.data)
      .eq('id', user.id)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao atualizar perfil no banco', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao atualizar perfil')
    }

    logger.info('Perfil atualizado com sucesso')

    // 4. Revalidate
    revalidatePath('/alunos/perfil')

    logger.endTimer(timer, true)
    return successResponse(data, 'Perfil atualizado com sucesso!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

export async function atualizarAvatar(formData: FormData): Promise<ActionResult> {
  const logger = createActionLogger('atualizarAvatar')
  const timer = logger.startTimer()
  
  try {
    // 1. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 2. Pegar arquivo
    const avatar = formData.get('avatar') as File | null
    if (!avatar || avatar.size === 0) {
      logger.warn('Validação falhou: arquivo de avatar ausente')
      return validationError('Arquivo de avatar é obrigatório')
    }
    logger.info('Validação concluída', { fileName: avatar.name, fileSize: avatar.size })

    // 3. Upload
    const fileExt = avatar.name.split('.').pop()
    const fileName = `${user.id}-${Date.now()}.${fileExt}`
    
    logger.info('Iniciando upload de avatar', { fileName })
    const { data: uploadData, error: uploadError } = await supabase.storage
      .from('avatars')
      .upload(fileName, avatar, { upsert: true })

    if (uploadError) {
      logger.error('Erro ao fazer upload de avatar', { error: uploadError.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao fazer upload do avatar')
    }
    logger.info('Upload concluído', { path: uploadData.path })

    // 4. Pegar URL pública
    const { data: { publicUrl } } = supabase.storage
      .from('avatars')
      .getPublicUrl(uploadData.path)

    // 5. Atualizar perfil
    const { data, error } = await supabase
      .from('profiles')
      .update({ avatar_url: publicUrl })
      .eq('id', user.id)
      .select()
      .single()

    if (error) {
      logger.error('Erro ao atualizar avatar no perfil', { error: error.message })
      logger.endTimer(timer, false)
      return databaseError('Erro ao atualizar avatar')
    }

    logger.info('Avatar atualizado com sucesso', { url: publicUrl })

    // 6. Revalidate
    revalidatePath('/alunos/perfil')

    logger.endTimer(timer, true)
    return successResponse(data, 'Avatar atualizado!')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}

// ========================================
// CONQUISTAS ACTIONS
// ========================================

export async function verificarConquistas(): Promise<ActionResult> {
  const logger = createActionLogger('verificarConquistas')
  const timer = logger.startTimer()
  
  try {
    // 1. Auth check
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      logger.error('Autenticação falhou', { error: authError?.message })
      return unauthorizedError()
    }
    logger.setContext({ userId: user.id })

    // 2. TODO: Implementar lógica de verificação de conquistas
    // Esta função será expandida quando implementarmos o sistema completo
    logger.info('Verificação de conquistas executada (stub)')
    
    // Por enquanto, retornar vazio
    const novasConquistas: any[] = []

    // 3. Revalidate
    revalidatePath('/alunos/conquistas')
    revalidatePath('/alunos/progresso')

    logger.endTimer(timer, true)
    return successResponse({ novasConquistas }, 'Conquistas verificadas')

  } catch (error) {
    logger.error('Erro inesperado', { error: error instanceof Error ? error.message : String(error) })
    logger.endTimer(timer, false)
    return errorResponse('Erro inesperado')
  }
}
