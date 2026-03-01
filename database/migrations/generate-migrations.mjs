/**
 * generate-migrations.mjs
 *
 * Reads CSV files from csv_originais/ and generates SQL migration files
 * for seeding the Supabase database.
 *
 * Usage: node generate-migrations.mjs
 */

import { readFileSync, writeFileSync } from 'fs'
import { parse } from 'csv-parse/sync'
import { join, dirname } from 'path'
import { fileURLToPath } from 'url'

const __dirname = dirname(fileURLToPath(import.meta.url))
const CSV_DIR = join(__dirname, '..', '..', 'csv_originais')
const OUT_DIR = __dirname

const TENANT_ID = '00000000-0000-0000-0000-000000000001'

// ─── Helpers ─────────────────────────────────────────────────────────

function readCsv(filename) {
  const content = readFileSync(join(CSV_DIR, filename), 'utf-8')
  return parse(content, { columns: true, skip_empty_lines: true, relax_column_count: true })
}

/** Escape a string for SQL using dollar-quoting to avoid apostrophe issues */
function sqlStr(val) {
  if (val === null || val === undefined || val === '') return 'NULL'
  const s = String(val).trim()
  if (s === '') return 'NULL'
  // Use dollar-quoting with a unique tag to handle any content
  if (s.includes('$$')) {
    return `$str$${s}$str$`
  }
  return `$$${s}$$`
}

/** Format a value as SQL literal based on type */
function sqlVal(val, type = 'text') {
  if (val === null || val === undefined || val === '') {
    if (type === 'boolean') return 'true'  // default for is_active etc
    if (type === 'integer') return 'NULL'
    if (type === 'decimal') return 'NULL'
    if (type === 'jsonb') return "'[]'"
    return 'NULL'
  }

  const s = String(val).trim()
  if (s === '') {
    if (type === 'boolean') return 'true'
    return 'NULL'
  }

  switch (type) {
    case 'uuid':
      return s === '' ? 'NULL' : `'${s}'`
    case 'boolean':
      return s === 'true' || s === 't' || s === '1' ? 'true' : 'false'
    case 'integer':
      return isNaN(parseInt(s)) ? 'NULL' : String(parseInt(s))
    case 'decimal':
      return isNaN(parseFloat(s)) ? 'NULL' : String(parseFloat(s))
    case 'jsonb':
      // If it looks like JSON, pass it through; otherwise wrap in array
      if (s.startsWith('[') || s.startsWith('{')) {
        return `'${s.replace(/'/g, "''")}'::jsonb`
      }
      return `'${JSON.stringify([s]).replace(/'/g, "''")}'::jsonb`
    case 'timestamp':
      return s === '' ? 'NULL' : `'${s}'::timestamptz`
    case 'date':
      return s === '' ? 'NULL' : `'${s}'::date`
    case 'enum':
      return `'${s}'`
    default:
      return sqlStr(s)
  }
}

/** Apply enum mapping */
function mapEnum(val, mapping) {
  if (!val || val === '') return 'NULL'
  const key = String(val).trim().toLowerCase()
  const mapped = mapping[key]
  if (mapped) return `'${mapped}'`
  // If not in mapping, try using the raw value (it might already be correct)
  return `'${key}'`
}

/** Generate a SQL migration file */
function generateMigration(config) {
  const { csv, table, filename, columns, defaults = {}, onConflict = 'id', skipFilter } = config

  console.log(`  Reading ${csv}...`)
  let rows = readCsv(csv)

  if (skipFilter) {
    rows = rows.filter(skipFilter)
  }

  if (rows.length === 0) {
    console.log(`  ⚠ No rows to insert for ${table}`)
    return
  }

  // Get DB column names from the config
  const dbCols = ['tenant_id']
  const colEntries = Object.entries(columns)
  for (const [, spec] of colEntries) {
    if (!dbCols.includes(spec.db)) {
      dbCols.push(spec.db)
    }
  }
  // Add default columns
  for (const [dbCol] of Object.entries(defaults)) {
    if (!dbCols.includes(dbCol)) {
      dbCols.push(dbCol)
    }
  }

  const lines = []
  lines.push(`-- =============================================`)
  lines.push(`-- Migration: ${filename}`)
  lines.push(`-- Table: ${table}`)
  lines.push(`-- Source CSV: ${csv}`)
  lines.push(`-- Generated: ${new Date().toISOString()}`)
  lines.push(`-- Rows: ${rows.length}`)
  lines.push(`-- =============================================`)
  lines.push(``)
  lines.push(`BEGIN;`)
  lines.push(``)

  for (const row of rows) {
    const vals = [`'${TENANT_ID}'`]  // tenant_id always first

    for (const [csvCol, spec] of colEntries) {
      let rawVal = row[csvCol]

      // Apply transform function if exists
      if (spec.transform) {
        rawVal = spec.transform(rawVal, row)
      }

      // Apply enum mapping if exists
      if (spec.enumMap) {
        vals.push(mapEnum(rawVal, spec.enumMap))
      } else {
        vals.push(sqlVal(rawVal, spec.type || 'text'))
      }
    }

    // Add defaults
    for (const [, defVal] of Object.entries(defaults)) {
      vals.push(defVal)
    }

    lines.push(`INSERT INTO ${table} (${dbCols.join(', ')})`)
    lines.push(`VALUES (${vals.join(', ')})`)
    lines.push(`ON CONFLICT (${onConflict}) DO NOTHING;`)
    lines.push(``)
  }

  lines.push(`COMMIT;`)

  const outPath = join(OUT_DIR, filename)
  writeFileSync(outPath, lines.join('\n'), 'utf-8')
  console.log(`  ✓ ${filename} — ${rows.length} rows`)
}

// ─── Enum Mappings ───────────────────────────────────────────────────

const DIFFICULTY_ENUM = {
  iniciante: 'beginner',
  medio: 'intermediate', intermediario: 'intermediate', intermediária: 'intermediate',
  avancado: 'advanced', avançado: 'advanced',
  expert: 'expert'
}

const DIFFICULTY_INT = {
  iniciante: '1', medio: '2', intermediario: '2', avancado: '3', avançado: '3', expert: '4'
}

const MEDIA_TYPE = {
  video: 'video', vídeo: 'video',
  imagem: 'image', imagen: 'image', image: 'image',
  '3d': 'model_3d', modelo_3d: 'model_3d',
  audio: 'audio', áudio: 'audio'
}

const MATERIAL_TYPE = {
  pdf: 'document', documento: 'document', document: 'document',
  video: 'video', vídeo: 'video',
  audio: 'audio', áudio: 'audio',
  link: 'link', url: 'link',
  partitura: 'sheet_music', sheet_music: 'sheet_music'
}

const QUIZ_TYPE = {
  multipla_escolha: 'multiple_choice', multiple_choice: 'multiple_choice',
  verdadeiro_falso: 'true_false', true_false: 'true_false',
  aberta: 'open', open: 'open'
}

const LESSON_STATUS = {
  'a fazer': 'draft', draft: 'draft', rascunho: 'draft',
  'concluída': 'completed', completed: 'completed', concluida: 'completed',
  'em andamento': 'in_progress', in_progress: 'in_progress'
}

const CHALLENGE_TYPE = {
  performance: 'practical', prático: 'practical', pratico: 'practical', practical: 'practical',
  semanal: 'practical', weekly: 'practical',
  quiz: 'theoretical', teórico: 'theoretical', teorico: 'theoretical', theoretical: 'theoretical',
  criativo: 'creative', creative: 'creative',
  colaborativo: 'collaborative', collaborative: 'collaborative',
  video: 'practical', tecnologico: 'creative', reflexivo: 'theoretical'
}

const ENROLLMENT_STATUS = {
  ativa: 'active', ativo: 'active', active: 'active',
  pendente: 'pending', pending: 'pending',
  concluida: 'completed', concluída: 'completed', completed: 'completed',
  cancelada: 'cancelled', cancelled: 'cancelled',
  suspensa: 'suspended', suspended: 'suspended',
  trancada: 'suspended'
}

const SUBMISSION_STATUS = {
  pendente: 'submitted', submitted: 'submitted',
  em_avaliacao: 'under_review', under_review: 'under_review',
  aprovado: 'approved', approved: 'approved',
  revisao: 'revision_needed', revision_needed: 'revision_needed',
  rejeitado: 'rejected', rejected: 'rejected'
}

// ─── Migration Configs ───────────────────────────────────────────────

const migrations = [
  // 001: Instruments (all 69, ON CONFLICT skips existing 8)
  {
    csv: 'instrumentos_rows.csv',
    table: 'core.instruments',
    filename: '001_instruments_complete.sql',
    columns: {
      id:                    { db: 'id', type: 'uuid' },
      nome:                  { db: 'name' },
      familia_instrumental:  { db: 'family' },
      categoria:             { db: 'category' },
      descricao:             { db: 'description' },
      historia:              { db: 'detailed_description' },
      origem:                { db: 'origin' },
      dificuldade_aprendizado: { db: 'difficulty_level', type: 'integer', transform: (v) => {
        if (!v || v === '') return null
        const map = { 'Iniciante': '1', 'Intermediário': '2', 'Avançado': '3', 'Expert': '4' }
        return map[v] || v
      }},
      imagem_url:            { db: 'image_url' },
      ordem_exibicao:        { db: 'display_order', type: 'integer' },
      ativo:                 { db: 'is_active', type: 'boolean' },
      created_at:            { db: 'created_at', type: 'timestamp' },
      updated_at:            { db: 'updated_at', type: 'timestamp' }
    }
  },

  // 002: Instrument Media (2,700)
  {
    csv: 'instrumento_midias_rows.csv',
    table: 'core.instrument_media',
    filename: '002_instrument_media.sql',
    columns: {
      id:              { db: 'id', type: 'uuid' },
      instrumento_id:  { db: 'instrument_id', type: 'uuid' },
      titulo:          { db: 'title', transform: (v) => v || 'Sem título' },
      tipo:            { db: 'media_type', enumMap: MEDIA_TYPE },
      url:             { db: 'url', transform: (v) => v || '#' },
      ordem_exibicao:  { db: 'order_index', type: 'integer' },
      created_at:      { db: 'created_at', type: 'timestamp' }
    }
  },

  // 003: Instrument Facts (1,379)
  {
    csv: 'instrumento_curiosidades_rows.csv',
    table: 'core.instrument_facts',
    filename: '003_instrument_facts.sql',
    columns: {
      id:              { db: 'id', type: 'uuid' },
      instrumento_id:  { db: 'instrument_id', type: 'uuid' },
      titulo:          { db: 'title', transform: (v) => v || 'Curiosidade' },
      conteudo:        { db: 'description' },
      imagem_url:      { db: 'image_url' },
      created_at:      { db: 'created_at', type: 'timestamp' }
    },
    defaults: { order_index: '0' }
  },

  // 004: Instrument Sounds (1,034)
  {
    csv: 'instrumento_sons_rows.csv',
    table: 'core.instrument_sounds',
    filename: '004_instrument_sounds.sql',
    columns: {
      id:              { db: 'id', type: 'uuid' },
      instrumento_id:  { db: 'instrument_id', type: 'uuid' },
      nota_musical:    { db: 'title', transform: (v, row) => {
        const nota = (v || '').trim()
        const tecnica = (row.tecnica || '').trim()
        if (nota && tecnica) return `${nota} - ${tecnica}`
        if (nota) return nota
        if (tecnica) return tecnica
        return 'Som'
      }},
      tecnica:         { db: 'sound_type' },
      arquivo_audio:   { db: 'audio_url', transform: (v) => v || 'audio/default/silence.mp3' },
      created_at:      { db: 'created_at', type: 'timestamp' }
    }
  },

  // 005: Instrument Techniques (827)
  {
    csv: 'instrumento_tecnicas_rows.csv',
    table: 'core.instrument_techniques',
    filename: '005_instrument_techniques.sql',
    columns: {
      id:                { db: 'id', type: 'uuid' },
      instrumento_id:    { db: 'instrument_id', type: 'uuid' },
      nome:              { db: 'name' },
      descricao:         { db: 'description' },
      nivel:             { db: 'difficulty', enumMap: DIFFICULTY_ENUM },
      video_tutorial:    { db: 'video_url' },
      ordem_aprendizado: { db: 'order_index', type: 'integer' },
      created_at:        { db: 'created_at', type: 'timestamp' }
    }
  },

  // 006: Instrument Performances (551)
  {
    csv: 'instrumento_performances_rows.csv',
    table: 'core.instrument_performances',
    filename: '006_instrument_performances.sql',
    columns: {
      id:                { db: 'id', type: 'uuid' },
      instrumento_id:    { db: 'instrument_id', type: 'uuid' },
      artista:           { db: 'artist', transform: (v) => v || 'Artista desconhecido' },
      titulo:            { db: 'title', transform: (v) => v || 'Performance' },
      video_url:         { db: 'video_url' },
      descricao_tecnica: { db: 'description' },
      created_at:        { db: 'created_at', type: 'timestamp' }
    }
  },

  // 007: Instrument Quizzes (482)
  {
    csv: 'instrumento_quiz_rows.csv',
    table: 'core.instrument_quizzes',
    filename: '007_instrument_quizzes.sql',
    columns: {
      id:               { db: 'id', type: 'uuid' },
      instrumento_id:   { db: 'instrument_id', type: 'uuid' },
      tipo_pergunta:    { db: 'question_type', enumMap: QUIZ_TYPE },
      pergunta:         { db: 'question' },
      resposta_correta: { db: 'correct_answer' },
      opcoes:           { db: 'options', type: 'jsonb' },
      created_at:       { db: 'created_at', type: 'timestamp' }
    },
    defaults: { points: '10' }
  },

  // 008: Instrument Relations (46)
  {
    csv: 'instrumentos_relacionados_rows.csv',
    table: 'core.instrument_relations',
    filename: '008_instrument_relations.sql',
    columns: {
      id:             { db: 'id', type: 'uuid' },
      instrumento_id: { db: 'instrument_id', type: 'uuid' },
      relacionado_id: { db: 'related_instrument_id', type: 'uuid' },
      tipo_relacao:   { db: 'relation_type' },
      created_at:     { db: 'created_at', type: 'timestamp' }
    },
    onConflict: 'instrument_id, related_instrument_id'
  },

  // 009: Instrument Inventory Extra (16 physical items)
  {
    csv: 'instrumentos_fisicos_rows.csv',
    table: 'core.instrument_inventory',
    filename: '009_instrument_inventory_extra.sql',
    columns: {
      id:                 { db: 'id', type: 'uuid' },
      instrumento_id:     { db: 'instrument_id', type: 'uuid' },
      codigo_patrimonio:  { db: 'asset_code' },
      numero_serie:       { db: 'serial_number' },
      marca:              { db: 'brand' },
      modelo:             { db: 'model' },
      valor_aquisicao:    { db: 'acquisition_value', type: 'decimal' },
      data_aquisicao:     { db: 'acquisition_date', type: 'date' },
      proprietario:       { db: 'owner' },
      estado:             { db: 'condition' },
      localizacao:        { db: 'location' },
      disponivel:         { db: 'is_available', type: 'boolean' },
      observacoes:        { db: 'notes' },
      created_at:         { db: 'created_at', type: 'timestamp' },
      updated_at:         { db: 'updated_at', type: 'timestamp' }
    }
  },

  // 010: Modules
  {
    csv: 'modulos_rows.csv',
    table: 'core.modules',
    filename: '010_modules.sql',
    columns: {
      id:          { db: 'id', type: 'uuid' },
      nome:        { db: 'name' },
      descricao:   { db: 'description' },
      ordem:       { db: 'order_index', type: 'integer' },
      ativo:       { db: 'is_active', type: 'boolean' },
      created_at:  { db: 'created_at', type: 'timestamp' }
    }
  },

  // 011: Lessons (29)
  {
    csv: 'aulas_rows.csv',
    table: 'core.lessons',
    filename: '011_lessons.sql',
    columns: {
      id:                { db: 'id', type: 'uuid' },
      modulo_id:         { db: 'module_id', type: 'uuid' },
      numero:            { db: 'number', type: 'integer' },
      titulo:            { db: 'title' },
      objetivo_didatico: { db: 'learning_objective' },
      data_programada:   { db: 'scheduled_date', type: 'date' },
      responsavel_id:    { db: 'teacher_id', type: 'uuid' },
      status:            { db: 'status', enumMap: LESSON_STATUS },
      created_at:        { db: 'created_at', type: 'timestamp' },
      updated_at:        { db: 'updated_at', type: 'timestamp' }
    },
    defaults: { is_active: 'true' }
  },

  // 012: Lesson Materials (140)
  {
    csv: 'aula_materiais_rows.csv',
    table: 'core.lesson_materials',
    filename: '012_lesson_materials.sql',
    columns: {
      id:          { db: 'id', type: 'uuid' },
      aula_id:     { db: 'lesson_id', type: 'uuid' },
      descricao:   { db: 'title', transform: (v) => v || 'Material' },
      tipo:        { db: 'material_type', enumMap: MATERIAL_TYPE },
      url:         { db: 'file_url' },
      created_at:  { db: 'created_at', type: 'timestamp' }
    },
    defaults: { order_index: '0' }
  },

  // 013: Lesson Activities (94)
  {
    csv: 'aula_atividades_rows.csv',
    table: 'core.lesson_activities',
    filename: '013_lesson_activities.sql',
    columns: {
      id:          { db: 'id', type: 'uuid' },
      aula_id:     { db: 'lesson_id', type: 'uuid' },
      descricao:   { db: 'title', transform: (v) => {
        if (!v) return 'Atividade'
        // Use first 80 chars as title
        const s = v.replace(/^["']|["']$/g, '').trim()
        return s.length > 80 ? s.substring(0, 77) + '...' : s
      }},
      tipo:        { db: 'activity_type' },
      created_at:  { db: 'created_at', type: 'timestamp' }
    },
    defaults: { order_index: '0' }
  },

  // 014: Evaluation Criteria (117)
  {
    csv: 'aula_criterios_avaliacao_rows.csv',
    table: 'core.evaluation_criteria',
    filename: '014_evaluation_criteria.sql',
    columns: {
      id:          { db: 'id', type: 'uuid' },
      aula_id:     { db: 'lesson_id', type: 'uuid' },
      criterio:    { db: 'name', transform: (v) => {
        // Strip surrounding quotes
        if (!v) return 'Critério'
        return v.replace(/^["]+|["]+$/g, '').trim() || 'Critério'
      }},
      created_at:  { db: 'created_at', type: 'timestamp' }
    },
    defaults: { weight: '1.00', order_index: '0' }
  },

  // 015: Lesson Checklists (111)
  {
    csv: 'aula_checklist_rows.csv',
    table: 'core.lesson_checklists',
    filename: '015_lesson_checklists.sql',
    columns: {
      id:          { db: 'id', type: 'uuid' },
      aula_id:     { db: 'lesson_id', type: 'uuid' },
      item:        { db: 'item', transform: (v) => {
        if (!v) return 'Item'
        return v.replace(/^["]+|["]+$/g, '').trim() || 'Item'
      }},
      tipo:        { db: 'checklist_type', transform: (v) => {
        const map = { pre: 'preparation', pos: 'evaluation', durante: 'execution' }
        return map[(v || '').toLowerCase()] || v || 'preparation'
      }},
      feito:       { db: 'is_done', type: 'boolean' },
      created_at:  { db: 'created_at', type: 'timestamp' },
      updated_at:  { db: 'updated_at', type: 'timestamp' }
    }
  },

  // 016: Challenges (40)
  {
    csv: 'alpha_desafios_rows.csv',
    table: 'core.challenges',
    filename: '016_challenges.sql',
    columns: {
      id:                    { db: 'id', type: 'uuid' },
      codigo:                { db: 'code' },
      metodologia_id:        { db: 'methodology_id', type: 'uuid' },
      titulo:                { db: 'title' },
      descricao:             { db: 'description' },
      objetivos:             { db: 'objectives', transform: (v) => {
        // JSON array → join as text
        if (!v) return null
        try {
          const arr = JSON.parse(v)
          if (Array.isArray(arr)) return arr.join('; ')
        } catch {}
        return v
      }},
      dificuldade:           { db: 'difficulty', type: 'integer' },
      pontos_base:           { db: 'base_points', type: 'integer' },
      tipo:                  { db: 'challenge_type', enumMap: CHALLENGE_TYPE },
      criterios_conclusao:   { db: 'evaluation_criteria', type: 'jsonb' },
      recursos_necessarios:  { db: 'required_resources', type: 'jsonb' },
      ativo:                 { db: 'is_active', type: 'boolean' },
      created_at:            { db: 'created_at', type: 'timestamp' },
      updated_at:            { db: 'updated_at', type: 'timestamp' }
    }
  },

  // 017: Competencies (8)
  {
    csv: 'alpha_competencias_rows.csv',
    table: 'core.competencies',
    filename: '017_competencies.sql',
    columns: {
      id:              { db: 'id', type: 'uuid' },
      metodologia_id:  { db: 'methodology_id', type: 'uuid' },
      nome:            { db: 'name' },
      descricao:       { db: 'description' },
      ordem:           { db: 'order_index', type: 'integer' },
      created_at:      { db: 'created_at', type: 'timestamp' }
    }
  },

  // 018: History Works (25)
  {
    csv: 'historia_obras_rows.csv',
    table: 'core.history_works',
    filename: '018_history_works.sql',
    columns: {
      id:                     { db: 'id', type: 'uuid' },
      titulo:                 { db: 'title' },
      titulo_original:        { db: 'original_title' },
      compositor_id:          { db: 'composer_id', type: 'uuid' },
      periodo_id:             { db: 'period_id', type: 'uuid' },
      ano_composicao:         { db: 'composition_year', type: 'integer' },
      tipo_obra:              { db: 'work_type' },
      genero:                 { db: 'genre' },
      nivel_dificuldade:      { db: 'difficulty_level', transform: (v) => {
        if (!v || v === '') return null
        const n = parseInt(v)
        if (n <= 1) return 'beginner'
        if (n <= 2) return 'intermediate'
        if (n <= 3) return 'advanced'
        return 'expert'
      }, type: 'enum' },
      popularidade:           { db: 'popularity', type: 'integer' },
      audio_url:              { db: 'audio_url' },
      video_performance_url:  { db: 'video_url' },
      partitura_url:          { db: 'score_url' },
      ativo:                  { db: 'is_active', type: 'boolean' },
      created_at:             { db: 'created_at', type: 'timestamp' }
    }
  },

  // 019: Repertoire (18)
  {
    csv: 'repertorio_musical_rows.csv',
    table: 'core.repertoire',
    filename: '019_repertoire.sql',
    columns: {
      id:                  { db: 'id', type: 'uuid' },
      titulo:              { db: 'title' },
      artista:             { db: 'composer' },
      tonalidade:          { db: 'key_signature' },
      tempo_bpm:           { db: 'tempo', transform: (v) => v ? String(v) : null },
      nivel:               { db: 'difficulty_level', enumMap: DIFFICULTY_ENUM },
      url_partitura:       { db: 'sheet_music_url' },
      url_audio:           { db: 'playback_url' },
      url_video_tutorial:  { db: 'tutorial_video_url' },
      tags:                { db: 'tags', type: 'jsonb' },
      observacoes_professor: { db: 'notes' },
      eh_dominio_publico:  { db: 'is_public', type: 'boolean' },
      ativo:               { db: 'is_active', type: 'boolean' },
      created_at:          { db: 'created_at', type: 'timestamp' }
    }
  },

  // 020: Forum Topics (10) - may fail if auth.users FKs don't exist
  {
    csv: 'forum_perguntas_rows.csv',
    table: 'core.forum_topics',
    filename: '020_forum_topics.sql',
    columns: {
      id:          { db: 'id', type: 'uuid' },
      aluno_id:    { db: 'author_id', type: 'uuid' },
      titulo:      { db: 'title' },
      pergunta:    { db: 'content' },
      categoria:   { db: 'category' },
      created_at:  { db: 'created_at', type: 'timestamp' },
      updated_at:  { db: 'updated_at', type: 'timestamp' }
    }
  },

  // ─── NEW MIGRATIONS 021–035 ────────────────────────────────────────

  // 021: History Periods (foundational — many history tables FK into this)
  {
    csv: 'historia_periodos_rows.csv',
    table: 'core.history_periods',
    filename: '021_history_periods.sql',
    columns: {
      id:                    { db: 'id', type: 'uuid' },
      nome:                  { db: 'name' },
      descricao_completa:    { db: 'description' },
      periodo_inicio:        { db: 'start_year', type: 'integer' },
      periodo_fim:           { db: 'end_year', type: 'integer' },
      cor_tematica:          { db: 'theme_color' },
      imagem_capa_url:       { db: 'cover_image_url' },
      ordem_cronologica:     { db: 'chronological_order', type: 'integer' },
      ativo:                 { db: 'is_active', type: 'boolean' },
      created_at:            { db: 'created_at', type: 'timestamp' }
    }
  },

  // 022: History Composers (FKs into history_periods)
  {
    csv: 'historia_compositores_rows.csv',
    table: 'core.history_composers',
    filename: '022_history_composers.sql',
    columns: {
      id:                { db: 'id', type: 'uuid' },
      nome_completo:     { db: 'full_name' },
      nome_artistico:    { db: 'artistic_name' },
      periodo_id:        { db: 'period_id', type: 'uuid' },
      pais_nascimento:   { db: 'birth_country' },
      data_nascimento:   { db: 'birth_date', type: 'date' },
      data_falecimento:  { db: 'death_date', type: 'date' },
      biografia_completa: { db: 'biography' },
      foto_url:          { db: 'photo_url' },
      nivel_importancia: { db: 'importance_level', type: 'integer' },
      ativo:             { db: 'is_active', type: 'boolean' },
      created_at:        { db: 'created_at', type: 'timestamp' }
    }
  },

  // 023: History Genres (FKs into history_periods)
  {
    csv: 'historia_generos_rows.csv',
    table: 'core.history_genres',
    filename: '023_history_genres.sql',
    columns: {
      id:                        { db: 'id', type: 'uuid' },
      nome:                      { db: 'name' },
      slug:                      { db: 'slug' },
      periodo_origem_id:         { db: 'origin_period_id', type: 'uuid' },
      decada_origem:             { db: 'origin_decade' },
      pais_origem:               { db: 'origin_country' },
      descricao:                 { db: 'description' },
      caracteristicas_musicais:  { db: 'musical_characteristics' },
      generos_relacionados:      { db: 'related_genres', type: 'jsonb' },
      compositores_principais:   { db: 'main_composers', type: 'jsonb' },
      obras_representativas:     { db: 'representative_works', type: 'jsonb' },
      influencias_culturais:     { db: 'cultural_influences' },
      imagem_url:                { db: 'image_url' },
      cor_tematica:              { db: 'theme_color' },
      ativo:                     { db: 'is_active', type: 'boolean' },
      created_at:                { db: 'created_at', type: 'timestamp' }
    }
  },

  // 024: History Movements
  {
    csv: 'historia_movimentos_rows.csv',
    table: 'core.history_movements',
    filename: '024_history_movements.sql',
    columns: {
      id:                  { db: 'id', type: 'uuid' },
      nome:                { db: 'name' },
      periodo_inicio:      { db: 'start_year', type: 'integer' },
      periodo_fim:         { db: 'end_year', type: 'integer' },
      locais_principais:   { db: 'main_locations' },
      manifesto:           { db: 'manifesto' },
      caracteristicas:     { db: 'characteristics' },
      compositores:        { db: 'composers', type: 'jsonb' },
      obras_iconicas:      { db: 'iconic_works', type: 'jsonb' },
      contexto_historico:  { db: 'historical_context' },
      legado:              { db: 'legacy' },
      imagem_url:          { db: 'image_url' },
      ativo:               { db: 'is_active', type: 'boolean' },
      created_at:          { db: 'created_at', type: 'timestamp' }
    }
  },

  // 025: History Cultural Contexts (FKs into history_periods)
  {
    csv: 'historia_contexto_cultural_rows.csv',
    table: 'core.history_cultural_contexts',
    filename: '025_history_cultural_contexts.sql',
    columns: {
      id:                { db: 'id', type: 'uuid' },
      periodo_id:        { db: 'period_id', type: 'uuid' },
      titulo:            { db: 'title' },
      tipo:              { db: 'context_type' },
      descricao:         { db: 'description' },
      impacto_na_musica: { db: 'impact_on_music' },
      ano_inicio:        { db: 'start_year', type: 'integer' },
      ano_fim:           { db: 'end_year', type: 'integer' },
      imagens_url:       { db: 'images_url', type: 'jsonb' },
      ativo:             { db: 'is_active', type: 'boolean' },
      created_at:        { db: 'created_at', type: 'timestamp' }
    }
  },

  // 026: History Timeline Events (FKs into periods, composers, works)
  {
    csv: 'historia_eventos_timeline_rows.csv',
    table: 'core.history_timeline_events',
    filename: '026_history_timeline_events.sql',
    columns: {
      id:            { db: 'id', type: 'uuid' },
      ano:           { db: 'year', type: 'integer' },
      mes:           { db: 'month', type: 'integer' },
      dia:           { db: 'day', type: 'integer' },
      titulo:        { db: 'title' },
      tipo_evento:   { db: 'event_type' },
      categoria:     { db: 'category' },
      descricao:     { db: 'description' },
      compositor_id: { db: 'composer_id', type: 'uuid' },
      obra_id:       { db: 'work_id', type: 'uuid' },
      periodo_id:    { db: 'period_id', type: 'uuid' },
      imagem_url:    { db: 'image_url' },
      importancia:   { db: 'importance', type: 'integer' },
      ativo:         { db: 'is_active', type: 'boolean' },
      created_at:    { db: 'created_at', type: 'timestamp' }
    }
  },

  // 027: History Instrument Evolution (FKs into instruments, periods)
  {
    csv: 'historia_instrumentos_evolucao_rows.csv',
    table: 'core.history_instrument_evolution',
    filename: '027_history_instrument_evolution.sql',
    columns: {
      id:                        { db: 'id', type: 'uuid' },
      instrumento_id:            { db: 'instrument_id', type: 'uuid' },
      periodo_id:                { db: 'period_id', type: 'uuid' },
      versao_historica:          { db: 'historical_version' },
      ano_aproximado:            { db: 'approximate_year', type: 'integer' },
      inventor_ou_luthier:       { db: 'inventor' },
      descricao_tecnica:         { db: 'technical_description' },
      diferencas_versao_moderna: { db: 'differences_from_modern' },
      imagem_url:                { db: 'image_url' },
      audio_exemplo_url:         { db: 'audio_url' },
      curiosidades:              { db: 'curiosities' },
      ativo:                     { db: 'is_active', type: 'boolean' },
      created_at:                { db: 'created_at', type: 'timestamp' }
    }
  },

  // 028: History Theory Concepts (FKs into history_periods)
  {
    csv: 'historia_conceitos_teoricos_rows.csv',
    table: 'core.history_theory_concepts',
    filename: '028_history_theory_concepts.sql',
    columns: {
      id:                  { db: 'id', type: 'uuid' },
      nome:                { db: 'name' },
      categoria:           { db: 'category' },
      definicao_simples:   { db: 'simple_definition' },
      definicao_tecnica:   { db: 'technical_definition' },
      periodo_origem_id:   { db: 'origin_period_id', type: 'uuid' },
      exemplos_auditivos:  { db: 'audio_examples', type: 'jsonb' },
      diagramas_url:       { db: 'diagram_url' },
      nivel_dificuldade:   { db: 'difficulty_level', type: 'integer' },
      pre_requisitos:      { db: 'prerequisites', type: 'jsonb' },
      exercicios:          { db: 'exercises', type: 'jsonb' },
      tags:                { db: 'tags', type: 'jsonb' },
      ativo:               { db: 'is_active', type: 'boolean' },
      created_at:          { db: 'created_at', type: 'timestamp' }
    }
  },

  // 029: History Quizzes (FKs into history_periods)
  {
    csv: 'historia_quiz_rows.csv',
    table: 'core.history_quizzes',
    filename: '029_history_quizzes.sql',
    columns: {
      id:                { db: 'id', type: 'uuid' },
      titulo:            { db: 'title' },
      periodo_id:        { db: 'period_id', type: 'uuid' },
      nivel_dificuldade: { db: 'difficulty_level', type: 'integer' },
      tipo:              { db: 'question_type', enumMap: QUIZ_TYPE },
      pergunta:          { db: 'question' },
      opcoes:            { db: 'options', type: 'jsonb' },
      opcoes_correct:    { db: 'correct_answer', transform: (_, row) => {
        // Extract correct answer text from opcoes JSON
        try {
          const opts = JSON.parse(row.opcoes || '[]')
          const correct = opts.find(o => o.correta === true || o.correta === 'true')
          return correct ? correct.texto : 'N/A'
        } catch { return 'N/A' }
      }},
      explicacao:        { db: 'explanation' },
      audio_url:         { db: 'audio_url' },
      imagem_url:        { db: 'image_url' },
      tags:              { db: 'tags', type: 'jsonb' },
      ativo:             { db: 'is_active', type: 'boolean' },
      created_at:        { db: 'created_at', type: 'timestamp' }
    },
    defaults: { points: '10' }
  },

  // 030: Achievements
  {
    csv: 'achievements_rows.csv',
    table: 'core.achievements',
    filename: '030_achievements.sql',
    columns: {
      id:                { db: 'id', type: 'uuid' },
      name:              { db: 'name' },
      description:       { db: 'description' },
      badge_icon:        { db: 'badge_icon' },
      badge_color:       { db: 'badge_color' },
      points_reward:     { db: 'points_reward', type: 'integer' },
      category:          { db: 'category', type: 'enum' },
      requirement_type:  { db: 'requirement_type' },
      requirement_value: { db: 'requirement_value', type: 'integer' },
      is_active:         { db: 'is_active', type: 'boolean' },
      created_at:        { db: 'created_at', type: 'timestamp' }
    }
  },

  // 031: User Achievements / Progress (depends on auth.users existing)
  {
    csv: 'achievements_progress_rows.csv',
    table: 'core.user_achievements',
    filename: '031_user_achievements.sql',
    columns: {
      id:               { db: 'id', type: 'uuid' },
      user_id:          { db: 'user_id', type: 'uuid' },
      achievement_id:   { db: 'achievement_id', type: 'uuid' },
      current_progress: { db: 'current_progress', type: 'integer' },
      target_progress:  { db: 'target_progress', type: 'integer' },
      is_completed:     { db: 'is_completed', type: 'boolean' },
      completed_at:     { db: 'completed_at', type: 'timestamp' },
      metadata:         { db: 'metadata', type: 'jsonb' },
      created_at:       { db: 'created_at', type: 'timestamp' },
      updated_at:       { db: 'updated_at', type: 'timestamp' }
    },
    onConflict: 'user_id, achievement_id'
  },

  // 032: Support Materials (FKs into modules, methodologies, instruments)
  {
    csv: 'materiais_apoio_rows.csv',
    table: 'core.support_materials',
    filename: '032_support_materials.sql',
    columns: {
      id:                          { db: 'id', type: 'uuid' },
      titulo:                      { db: 'title' },
      tipo:                        { db: 'material_type' },
      categoria:                   { db: 'category' },
      descricao:                   { db: 'description' },
      url_arquivo:                 { db: 'file_url' },
      modulo_relacionado_id:       { db: 'module_id', type: 'uuid' },
      metodologia_relacionada_id:  { db: 'methodology_id', type: 'uuid' },
      instrumento_relacionado_id:  { db: 'instrument_id', type: 'uuid' },
      nivel:                       { db: 'difficulty_level', type: 'integer', transform: (v) => {
        if (!v || v === '') return null
        const map = { iniciante: '1', intermediario: '2', intermediário: '2', avancado: '3', avançado: '3', expert: '4' }
        return map[(v || '').toLowerCase()] || v
      }},
      tags:                        { db: 'tags', type: 'jsonb' },
      tamanho_arquivo_mb:          { db: 'file_size_mb', type: 'decimal' },
      duracao_segundos:            { db: 'duration_seconds', type: 'integer' },
      autor:                       { db: 'author' },
      licenca:                     { db: 'license' },
      downloads_count:             { db: 'download_count', type: 'integer' },
      visualizacoes:               { db: 'view_count', type: 'integer' },
      ativo:                       { db: 'is_active', type: 'boolean' },
      created_at:                  { db: 'created_at', type: 'timestamp' }
    }
  },

  // 033: Teaching Sequences (FKs into methodologies)
  {
    csv: 'sequencias_didaticas_rows.csv',
    table: 'core.teaching_sequences',
    filename: '033_teaching_sequences.sql',
    columns: {
      id:                  { db: 'id', type: 'uuid' },
      titulo:              { db: 'title' },
      metodologia_id:      { db: 'methodology_id', type: 'uuid' },
      faixa_etaria:        { db: 'age_range' },
      duracao_semanas:     { db: 'duration_weeks', type: 'integer' },
      objetivos:           { db: 'objectives' },
      semana_numero:       { db: 'week_number', type: 'integer' },
      atividade_principal: { db: 'main_activity' },
      roda_atividade:      { db: 'circle_activity' },
      jogo_dinamica:       { db: 'game_dynamic' },
      material_necessario: { db: 'required_materials' },
      observacoes:         { db: 'notes' },
      criado_por_id:       { db: 'created_by', type: 'uuid' },
      created_at:          { db: 'created_at', type: 'timestamp' }
    }
  },

  // 034: Enrollments (depends on auth.users and courses existing)
  {
    csv: 'matriculas_rows.csv',
    table: 'core.enrollments',
    filename: '034_enrollments.sql',
    columns: {
      id:              { db: 'id', type: 'uuid' },
      turma_id:        { db: 'course_id', type: 'uuid' },
      aluno_id:        { db: 'student_id', type: 'uuid' },
      status:          { db: 'status', enumMap: ENROLLMENT_STATUS },
      data_matricula:  { db: 'enrolled_at', type: 'timestamp' },
      created_at:      { db: 'created_at', type: 'timestamp' }
    },
    onConflict: 'course_id, student_id'
  },

  // 035: Challenge Submissions (depends on auth.users and challenges existing)
  {
    csv: 'alpha_submissoes_rows.csv',
    table: 'core.challenge_submissions',
    filename: '035_challenge_submissions.sql',
    columns: {
      id:                    { db: 'id', type: 'uuid' },
      desafio_id:            { db: 'challenge_id', type: 'uuid' },
      user_id:               { db: 'student_id', type: 'uuid', transform: (v, row) => v || row.aluno_id },
      descricao:             { db: 'response' },
      evidencia_url:         { db: 'file_url' },
      status:                { db: 'status', enumMap: SUBMISSION_STATUS },
      pontos_obtidos:        { db: 'grade', type: 'decimal' },
      feedback_professor:    { db: 'feedback' },
      data_avaliacao:        { db: 'evaluated_at', type: 'timestamp' },
      created_at:            { db: 'created_at', type: 'timestamp' },
      updated_at:            { db: 'updated_at', type: 'timestamp' }
    }
  }
]

// ─── Run ─────────────────────────────────────────────────────────────

console.log('🎵 Nipo School — CSV → SQL Migration Generator')
console.log(`   CSV dir: ${CSV_DIR}`)
console.log(`   Output:  ${OUT_DIR}`)
console.log(`   Tenant:  ${TENANT_ID}`)
console.log('')

let totalRows = 0

for (const config of migrations) {
  try {
    generateMigration(config)
    // Count rows after generation
    const rows = readCsv(config.csv)
    totalRows += config.skipFilter ? rows.filter(config.skipFilter).length : rows.length
  } catch (err) {
    console.error(`  ✗ ${config.filename}: ${err.message}`)
  }
}

console.log('')
console.log(`✅ Done! Generated ${migrations.length} migration files with ~${totalRows} total rows.`)
console.log('   Run them in order (001→035) in the Supabase SQL Editor.')
console.log('   Note: 031, 034, 035 depend on auth.users existing in the DB.')
