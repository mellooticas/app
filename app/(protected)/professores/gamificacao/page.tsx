import { Metadata } from 'next';
import GamificacaoClient from './components/GamificacaoClient';

export const metadata: Metadata = {
    title: 'Gamificação - Área do Professor',
    description: 'Acompanhe conquistas e progresso dos alunos.',
}

export default function GamificacaoPage() {
    return (
        <div className="max-w-6xl mx-auto space-y-8">
            <div>
                <h1 className="text-3xl font-bold text-gray-900">Gamificação</h1>
                <p className="text-gray-600">Conquistas e Ranking de Alunos</p>
            </div>

            <GamificacaoClient />
        </div>
    );
}
