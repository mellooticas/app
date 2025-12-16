import { Metadata } from 'next'
import NotasClient from './components/NotasClient'

export const metadata: Metadata = {
    title: 'Lançar Notas | Professor - Nipo School',
    description: 'Avalie o desempenho dos alunos.'
}

interface PageProps {
    params: {
        id: string
    }
}

export default function NotasPage({ params }: PageProps) {
    return <NotasClient turmaId={params.id} />
}
