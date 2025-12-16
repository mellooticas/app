
import { ArrowLeft, Plus } from 'lucide-react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/server';
import { RepertorioListClient } from '../components/RepertorioListClient';

export const revalidate = 0;

export default async function RepertorioPage() {
    const supabase = await createClient();

    const { data: repertorio } = await supabase
        .from('repertorio')
        .select('*')
        .order('criado_em', { ascending: false });

    return (
        <div className="max-w-6xl mx-auto">
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-6 mb-8">
                <div className="flex items-center gap-4">
                    <Link
                        href="/professores"
                        className="p-2 bg-white rounded-full hover:bg-gray-100 transition-colors"
                    >
                        <ArrowLeft className="w-5 h-5 text-gray-600" />
                    </Link>
                    <div>
                        <h1 className="text-3xl font-bold text-gray-900">Repertório & Exercícios</h1>
                        <p className="text-gray-600">Gerencie o material didático das suas aulas</p>
                    </div>
                </div>

                <Link href="/professores/repertorio/novo">
                    <button className="flex items-center gap-2 px-6 py-3 bg-indigo-600 text-white rounded-xl font-bold hover:bg-indigo-700 transition-colors shadow-lg shadow-indigo-200">
                        <Plus size={20} />
                        Novo Material
                    </button>
                </Link>
            </div>

            <RepertorioListClient initialRepertorio={repertorio || []} />
        </div>
    );
}
