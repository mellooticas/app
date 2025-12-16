import { Metadata } from 'next';
import SpeedGraderClient from '../components/SpeedGraderClient';

export const metadata: Metadata = {
    title: 'Correção | Professor - Nipo School',
    description: 'Ambiente de avaliação e feedback.'
};

interface PageProps {
    params: {
        id: string;
    };
    searchParams: {
        type?: string;
    };
}

export default function GradePage({ params, searchParams }: PageProps) {
    return (
        <SpeedGraderClient
            id={params.id}
            type={searchParams.type}
        />
    );
}
