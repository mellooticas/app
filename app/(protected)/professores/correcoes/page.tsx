import { Metadata } from 'next'
import CorrecoesClient from './components/CorrecoesClient'

export const metadata: Metadata = {
    title: 'Correções Pendentes | Professor - Nipo School',
    description: 'Gerencie avaliações e feedbacks pendentes dos alunos.'
}

export default function CorrecoesPage() {
    return (
        <div className="space-y-6">
            <div className="flex justify-between items-center">
                <div>
                    <h1 className="text-2xl font-bold text-gray-900">Correções Pendentes</h1>
                    <p className="text-gray-500">Avalie o progresso e atividades dos seus alunos</p>
                </div>
            </div>

            <CorrecoesClient />
        </div>
    )
}
