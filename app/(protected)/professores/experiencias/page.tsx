import { createClient } from '@/lib/supabase/server'
import { MapPin, Building2, Info } from 'lucide-react'

export default async function ExperienciasBrasileirasPage() {
    const supabase = await createClient()

    const { data: experiencias } = await supabase
        .from('experiencias_brasileiras')
        .select('*');

    return (
        <div className="space-y-8">
            <div>
                <h1 className="text-3xl font-bold text-gray-900">Experiências Brasileiras</h1>
                <p className="text-gray-500">Catalogação de projetos inovadores e referências nacionais.</p>
            </div>

            <div className="grid grid-cols-1 gap-6">
                {experiencias?.map((item: any) => (
                    <div key={item.id} className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm hover:shadow-md transition-shadow flex flex-col md:flex-row gap-6">
                        <div className="flex-1">
                            <div className="flex items-center gap-2 mb-2">
                                <span className="px-2 py-1 bg-green-100 text-green-700 text-xs font-bold rounded-md uppercase">
                                    {item.categoria || 'Projeto'}
                                </span>
                                {(item.cidade || item.uf) && (
                                    <span className="flex items-center gap-1 text-xs text-gray-500">
                                        <MapPin className="w-3 h-3" />
                                        {item.cidade}{item.cidade && item.uf ? ' - ' : ''}{item.uf}
                                    </span>
                                )}
                            </div>
                            <h3 className="font-bold text-xl text-gray-900 mb-2">
                                {item.nome || item.titulo || 'Experiência Sem Título'}
                            </h3>
                            <p className="text-gray-600 mb-4">
                                {item.descricao || 'Sem descrição detalhada.'}
                            </p>
                            {item.instituicao && (
                                <div className="flex items-center gap-2 text-sm text-gray-500">
                                    <Building2 className="w-4 h-4" />
                                    <span>{item.instituicao}</span>
                                </div>
                            )}
                        </div>
                    </div>
                ))}

                {(!experiencias || experiencias.length === 0) && (
                    <div className="text-center py-12 text-gray-500 bg-white rounded-xl border border-dashed">
                        Nenhuma experiência cadastrada.
                    </div>
                )}
            </div>
        </div>
    )
}
