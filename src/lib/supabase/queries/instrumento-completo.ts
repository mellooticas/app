/**
 * 🎵 QUERY MASTER - Instrumento Completo
 * 
 * Busca TODOS os dados de um instrumento pelo UUID
 * Otimizado com Promise.all para queries paralelas
 */

import { supabase } from '../supabaseClient'
import type {
  InstrumentoCompleto,
  Curiosidade,
  Midia,
  Som,
  Tecnica,
  Performance,
  Quiz,
  InstrumentoRelacionado,
  InstrumentoFisico
} from '@/types/instrumentos.types'

/**
 * Busca TODAS as informações de um instrumento
 * Executa 10 queries em paralelo para melhor performance
 */
export async function getInstrumentoCompleto(uuid: string): Promise<InstrumentoCompleto | null> {
  try {
    // Executa todas as queries em paralelo
    const [
      instrumentoRes,
      curiosidadesRes,
      midiasRes,
      sonsRes,
      tecnicasRes,
      performancesRes,
      quizRes,
      relacionadosRes,
      fisicosRes
    ] = await Promise.all([
      // 1. Instrumento base
      supabase
        .from('instrumentos')
        .select('*')
        .eq('id', uuid)
        .single(),

      // 2. Curiosidades
      supabase
        .from('instrumento_curiosidades')
        .select('*')
        .eq('instrumento_id', uuid)
        .order('created_at', { ascending: false }),

      // 3. Mídias (imagens, vídeos, áudios)
      supabase
        .from('instrumento_midias')
        .select('*')
        .eq('instrumento_id', uuid)
        .eq('ativo', true)
        .order('ordem_exibicao', { ascending: true }),

      // 4. Sons (com variações)
      supabase
        .from('instrumento_sons')
        .select(`
          *,
          variacoes:instrumento_sons_variacoes(*)
        `)
        .eq('instrumento_id', uuid)
        .order('nota_musical', { ascending: true }),

      // 5. Técnicas (ordenadas por aprendizado)
      supabase
        .from('instrumento_tecnicas')
        .select('*')
        .eq('instrumento_id', uuid)
        .order('ordem_aprendizado', { ascending: true }),

      // 6. Performances famosas
      supabase
        .from('instrumento_performances')
        .select('*')
        .eq('instrumento_id', uuid)
        .order('ano_performance', { ascending: false }),

      // 7. Quiz
      supabase
        .from('instrumento_quiz')
        .select('*')
        .eq('instrumento_id', uuid)
        .eq('ativo', true)
        .order('dificuldade', { ascending: true }),

      // 8. Instrumentos relacionados (com join)
      supabase
        .from('instrumentos_relacionados')
        .select(`
          *,
          relacionado:instrumentos!relacionado_id(
            id,
            nome,
            categoria,
            descricao,
            imagem_url
          )
        `)
        .eq('instrumento_id', uuid),

      // 9. Instrumentos físicos disponíveis
      supabase
        .from('instrumentos_fisicos')
        .select('*')
        .eq('instrumento_id', uuid)
        .eq('disponivel', true)
        .order('estado', { ascending: false })
    ])

    // Verifica se o instrumento existe
    if (instrumentoRes.error || !instrumentoRes.data) {
      console.error('Erro ao buscar instrumento:', instrumentoRes.error)
      return null
    }

    // Monta o objeto completo
    const instrumento = instrumentoRes.data
    const curiosidades = curiosidadesRes.data || []
    const midias = midiasRes.data || []
    const sons = sonsRes.data || []
    const tecnicas = tecnicasRes.data || []
    const performances = performancesRes.data || []
    const quiz = quizRes.data || []
    const relacionados = relacionadosRes.data || []
    const fisicos = fisicosRes.data || []

    const instrumentoCompleto: InstrumentoCompleto = {
      ...instrumento,
      curiosidades: curiosidades as Curiosidade[],
      midias: midias as Midia[],
      sons: sons as Som[],
      tecnicas: tecnicas as Tecnica[],
      performances: performances as Performance[],
      quiz: quiz as Quiz[],
      relacionados: relacionados as InstrumentoRelacionado[],
      fisicos: fisicos as InstrumentoFisico[],
      stats: {
        total_curiosidades: curiosidades.length,
        total_midias: midias.length,
        total_sons: sons.length,
        total_tecnicas: tecnicas.length,
        total_performances: performances.length,
        total_quiz: quiz.length,
        total_relacionados: relacionados.length,
        total_fisicos_disponiveis: fisicos.length
      }
    }

    console.log('📊 Instrumento completo carregado:', {
      nome: instrumento.nome,
      curiosidades: curiosidades.length,
      midias: midias.length,
      sons: sons.length,
      tecnicas: tecnicas.length,
      performances: performances.length,
      quiz: quiz.length,
      relacionados: relacionados.length,
      fisicos: fisicos.length
    })

    return instrumentoCompleto

  } catch (error) {
    console.error('Erro ao buscar instrumento completo:', error)
    return null
  }
}

/**
 * Hook React Query para instrumento completo
 */
import { useQuery } from '@tanstack/react-query'

export function useInstrumentoCompleto(uuid: string | undefined) {
  return useQuery({
    queryKey: ['instrumento-completo', uuid],
    queryFn: () => {
      if (!uuid) return null
      return getInstrumentoCompleto(uuid)
    },
    enabled: !!uuid,
    staleTime: 1000 * 60 * 30, // 30 minutos
    gcTime: 1000 * 60 * 60 // 1 hora
  })
}
