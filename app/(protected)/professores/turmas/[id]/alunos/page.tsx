import { Metadata } from 'next'
import AlunosManagerClient from './components/AlunosManagerClient'

export const metadata: Metadata = {
    title: 'Gerenciar Alunos | Professor - Nipo School',
    description: 'Gerencie as matrículas desta turma.'
}

interface PageProps {
    params: {
        id: string
    }
}

export default function GerenciarAlunosPage({ params }: PageProps) {
    return <AlunosManagerClient turmaId={params.id} />
}
