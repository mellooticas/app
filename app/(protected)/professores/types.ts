export interface Professor {
    id: string
    full_name: string | null
    email: string | null
    avatar_url: string | null
}

export interface Aluno {
    id: string
    full_name: string | null
    email: string | null
    avatar_url: string | null
}

export interface Aula {
    id: string
    titulo: string
    descricao?: string | null
    tipo?: 'gravada' | 'ao_vivo'
    status?: string
    duracao_minutos?: number
    data_inicio?: string
    nivel?: string
    responsavel_id: string
}

export interface AulaMaterial {
    id: string
    aula_id: string
    titulo: string
    tipo: 'video' | 'pdf' | 'audio' | 'link'
    url: string
    descricao?: string
}

export interface AulaDesafio {
    id: string
    aula_id: string
    titulo: string
    descricao?: string
    dificuldade?: string
    pontos_xp: number
    ativo: boolean
}

export interface AulaAvaliacao {
    id: string
    aula_id: string
    aluno_id: string
    nota?: number
    comentario?: string
    feedback?: string
    status: 'pendente' | 'corrigido' | 'revisar'
    created_at: string
    // Joins
    aula?: {
        titulo: string
    }
    aluno?: Aluno
}

export interface DesafioResposta {
    id: string
    desafio_id: string
    aluno_id: string
    resposta_conteudo: string
    arquivo_url?: string
    status: 'pendente' | 'em_analise' | 'aprovado' | 'rejeitado'
    feedback_professor?: string
    nota?: number
    created_at: string
    // Joins
    desafio?: {
        titulo: string
        descricao: string
    }
    aluno?: Aluno
}

export interface AutoAvaliacao {
    id: string
    aluno_id: string
    aula_id: string
    nota_compreensao: number
    nota_pratica: number
    duvidas?: string
    created_at: string
    // Joins
    aula?: {
        titulo: string
    }
    aluno?: Aluno
}
