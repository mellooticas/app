import { createClient } from '@/lib/supabase/server';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import { ArrowLeft } from 'lucide-react';
import RepertorioForm from '../../../components/RepertorioForm';

interface PageProps {
    params: {
        id: string;
    };
}

export default async function EditarRepertorioPage({ params }: PageProps) {
    const supabase = await createClient();

    const { data: repertorio, error } = await supabase
        .from('repertorio')
        .select('*')
        .eq('id', params.id)
        .single();

    if (error || !repertorio) {
        notFound();
    }

    return (
        <div className="max-w-3xl mx-auto">
            <div className="mb-8 flex items-center gap-4">
                <Link
                    href="/professores/repertorio"
                    className="p-2 bg-white rounded-full hover:bg-gray-100 transition-colors"
                >
                    <ArrowLeft className="w-5 h-5 text-gray-600" />
                </Link>
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Editar Material</h1>
                    <p className="text-gray-600">Atualize as informações do repertório</p>
                </div>
            </div>

            <RepertorioForm initialData={repertorio} isEditing={true} />
        </div>
    );
}
