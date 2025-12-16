import { Metadata } from 'next'
import FrequenciaClient from './components/FrequenciaClient'

export const metadata: Metadata = {
    title: 'Lançar Frequência | Professor - Nipo School',
    description: 'Registre a frequência dos alunos.'
}

interface PageProps {
    params: {
        id: string
    }
}

export default function FrequenciaPage({ params }: PageProps) {
    return <FrequenciaClient turmaId={params.id} />
}
