import { createClient } from '@/lib/supabase/server'
import { Lightbulb, Target, TrendingUp } from 'lucide-react'

export default async function EstrategiasEngajamentoPage() {
    const supabase = await createClient()

    const { data: estrategias } = await supabase
        .from('comunicacao_engajamento')
        .select('*');

    return (
        <div className="space-y-8">
            <div>
                <h1 className="text-3xl font-bold text-gray-900">Estratégias de Engajamento</h1>
                <p className="text-gray-500">Técnicas e cases para manter a motivação dos alunos.</p>
            </div>

            <div className="space-y-4">
                {estrategias?.map((item: any) => (
                    <div key={item.id} className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm hover:border-yellow-300 transition-colors flex gap-4">
                        <div className="p-3 bg-yellow-50 rounded-full h-fit">
                            <Lightbulb className="w-6 h-6 text-yellow-600" />
                        </div>
                        <div className="flex-1">
                            <h3 className="font-bold text-lg text-gray-900 mb-2">
                                {item.titulo || item.nome_estrategia}
                            </h3>
                            <p className="text-gray-600 text-sm mb-4">
                                {item.descricao}
                            </p>

                            <div className="flex gap-4">
                                {item.objetivo && (
                                    <div className="flex items-center gap-2 text-xs text-gray-500 bg-gray-50 px-3 py-1.5 rounded-full">
                                        <Target className="w-3 h-3" />
                                        <span>Objetivo: {item.objetivo}</span>
                                    </div>
                                )}
                                {item.resultado_esperado && (
                                    <div className="flex items-center gap-2 text-xs text-gray-500 bg-gray-50 px-3 py-1.5 rounded-full">
                                        <TrendingUp className="w-3 h-3" />
                                        <span>Resultado: {item.resultado_esperado}</span>
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>
                ))}

                {(!estrategias || estrategias.length === 0) && (
                    <div className="text-center py-12 text-gray-500 bg-white rounded-xl border border-dashed">
                        Nenhuma estratégia registrada.
                    </div>
                )}
            </div>
        </div>
    )
}
