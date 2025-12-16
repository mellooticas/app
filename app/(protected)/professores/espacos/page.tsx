import { createClient } from '@/lib/supabase/server'
import { Building2, Users, CheckCircle } from 'lucide-react'

export default async function EspacosAlternativosPage() {
    const supabase = await createClient()

    const { data: espacos } = await supabase
        .from('adaptacoes_espacos_alternativos')
        .select('*');

    return (
        <div className="space-y-8">
            <div>
                <h1 className="text-3xl font-bold text-gray-900">Adaptações em Espaços Alternativos</h1>
                <p className="text-gray-500">Guias e registros para atuação em ONGs, Igrejas e Centros Comunitários.</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {espacos?.map((item: any) => (
                    <div key={item.id} className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm hover:shadow-md transition-all">
                        <div className="flex items-center justify-between mb-4">
                            <span className="px-2 py-1 bg-amber-100 text-amber-700 text-xs font-bold rounded-md uppercase">
                                {item.tipo_organizacao || 'Organização'}
                            </span>
                            {item.status_projeto && (
                                <span className="flex items-center gap-1 text-xs text-gray-500">
                                    <CheckCircle className="w-3 h-3 text-green-500" />
                                    {item.status_projeto.replace('_', ' ')}
                                </span>
                            )}
                        </div>

                        <h3 className="font-bold text-lg text-gray-900 mb-2">
                            {item.nome_organizacao}
                        </h3>

                        <p className="text-gray-500 text-sm mb-4 line-clamp-3">
                            {item.descricao || 'Detalhes sobre a adaptação do espaço e metodologia.'}
                        </p>

                        <div className="flex items-center gap-2 text-xs text-gray-400 mt-auto pt-4 border-t">
                            <Users className="w-3 h-3" />
                            <span>Público: {item.publico_atendido || 'Geral'}</span>
                        </div>
                    </div>
                ))}

                {(!espacos || espacos.length === 0) && (
                    <div className="col-span-full text-center py-12 text-gray-500 bg-white rounded-xl border border-dashed">
                        Nenhum espaço alternativo registrado.
                    </div>
                )}
            </div>
        </div>
    )
}
