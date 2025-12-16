import { createClient } from '@/lib/supabase/server'
import { Globe, BookOpen, ExternalLink } from 'lucide-react'
import Link from 'next/link'

export default async function ReferenciaisInternacionaisPage() {
    const supabase = await createClient()

    const { data: referenciais } = await supabase
        .from('referenciais_internacionais')
        .select('*');

    return (
        <div className="space-y-8">
            <div>
                <h1 className="text-3xl font-bold text-gray-900">Referenciais Internacionais</h1>
                <p className="text-gray-500">Padrões e metodologias de ensino musical ao redor do mundo.</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {referenciais?.map((item: any) => (
                    <div key={item.id} className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm hover:border-blue-200 transition-all group">
                        <div className="flex items-start justify-between mb-4">
                            <div className="p-3 bg-blue-50 rounded-full group-hover:bg-blue-100 transition-colors">
                                <Globe className="w-6 h-6 text-blue-600" />
                            </div>
                            {item.pais && (
                                <span className="px-3 py-1 bg-gray-100 text-gray-600 text-xs font-bold rounded-full">
                                    {item.pais}
                                </span>
                            )}
                        </div>

                        <h3 className="font-bold text-lg text-gray-900 mb-2 group-hover:text-blue-600 transition-colors">
                            {item.titulo || item.nome}
                        </h3>

                        <p className="text-gray-500 text-sm mb-6 line-clamp-3">
                            {item.descricao || item.resumo}
                        </p>

                        {item.url_referencia && (
                            <Link
                                href={item.url_referencia}
                                target="_blank"
                                className="inline-flex items-center gap-2 text-sm font-medium text-blue-600 hover:text-blue-800"
                            >
                                <ExternalLink className="w-4 h-4" />
                                Acessar Referência
                            </Link>
                        )}
                    </div>
                ))}

                {(!referenciais || referenciais.length === 0) && (
                    <div className="col-span-full text-center py-12 text-gray-500 bg-white rounded-xl border border-dashed">
                        Nenhum referencial cadastrado.
                    </div>
                )}
            </div>
        </div>
    )
}
