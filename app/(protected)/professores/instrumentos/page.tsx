import { createClient } from '@/lib/supabase/server'
import { ArrowLeft } from 'lucide-react'
import Link from 'next/link'
import Image from 'next/image'

export default async function InstrumentosPage() {
    const supabase = await createClient()

    // Fetch instruments with related data counts if possible, or just basic info
    const { data: instrumentos } = await supabase
        .from('instrumentos')
        .select('*')
        .order('nome');

    return (
        <div className="space-y-6">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-2xl font-bold text-gray-900">Enciclopédia de Instrumentos</h1>
                    <p className="text-gray-500">Explore a coleção didática de instrumentos do Nipo School.</p>
                </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {instrumentos?.map((inst: any) => (
                    <div key={inst.id} className="bg-white rounded-xl border border-gray-100 shadow-sm overflow-hidden hover:shadow-md transition-all group">
                        <div className="aspect-video bg-gray-100 relative overflow-hidden">
                            {/* Placeholder or specific image field if exists - assuming 'foto_url' or similar, else using generic */}
                            <div className="absolute inset-0 flex items-center justify-center text-gray-400">
                                <span className="text-4xl">🎻</span>
                            </div>
                        </div>
                        <div className="p-5">
                            <h3 className="font-bold text-lg text-gray-900 mb-2 group-hover:text-indigo-600 transition-colors">
                                {inst.nome}
                            </h3>
                            <p className="text-sm text-gray-500 line-clamp-2 mb-4">
                                {inst.descricao || 'Sem descrição disponível.'}
                            </p>
                            <div className="flex items-center gap-2 text-xs font-medium text-gray-500">
                                <span className="bg-indigo-50 text-indigo-700 px-2 py-1 rounded">
                                    {inst.familia || 'Família n/d'}
                                </span>
                                <span className="bg-gray-100 px-2 py-1 rounded">
                                    {inst.classificacao || 'Geral'}
                                </span>
                            </div>
                        </div>
                    </div>
                ))}
            </div>

            {(!instrumentos || instrumentos.length === 0) && (
                <div className="text-center py-12 text-gray-500 bg-white rounded-xl border border-dashed">
                    Nenhum instrumento encontrado na base de dados.
                </div>
            )}
        </div>
    )
}
