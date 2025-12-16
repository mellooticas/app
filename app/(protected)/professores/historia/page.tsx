import { createClient } from '@/lib/supabase/server'
import { Calendar, Music, ArrowRight } from 'lucide-react'

export default async function HistoriaPage() {
    const supabase = await createClient()

    // Fetch artistic movements ordered by date/period
    // Assuming 'historia_movimentos_artisticos' has period info (start_year, etc). 
    // If not clear, we'll fetch all.
    const { data: movimentos } = await supabase
        .from('historia_movimentos_artisticos')
        .select('*')
        //.order('periodo_inicio', { ascending: true }) // Assuming column exists or similar
        .limit(20);

    return (
        <div className="space-y-8">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">História da Música</h1>
                    <p className="text-gray-500">Uma jornada através dos tempos, movimentos e compositores.</p>
                </div>
            </div>

            <div className="relative border-l-4 border-amber-200 ml-6 space-y-12 pl-8 py-4">
                {movimentos?.map((mov: any, idx) => (
                    <div key={mov.id} className="relative">
                        {/* Timeline Dot */}
                        <div className="absolute -left-[43px] top-0 bg-amber-500 w-6 h-6 rounded-full border-4 border-white shadow-sm"></div>

                        <div className="bg-white rounded-2xl border border-gray-100 p-6 shadow-sm hover:shadow-md transition-shadow">
                            <div className="flex items-start justify-between mb-4">
                                <div>
                                    <span className="inline-block px-3 py-1 bg-amber-100 text-amber-800 text-xs font-bold rounded-full mb-2">
                                        {mov.periodo || 'Período Indefinido'}
                                    </span>
                                    <h3 className="text-xl font-bold text-gray-900">{mov.nome}</h3>
                                </div>
                                <Music className="text-amber-200 w-12 h-12" />
                            </div>

                            <p className="text-gray-600 mb-6 leading-relaxed">
                                {mov.descricao || 'Descrição detalhada do movimento artístico indisponível.'}
                            </p>

                            <div className="flex items-center gap-4 text-sm font-medium text-amber-700 cursor-pointer hover:underline">
                                Explorar Obras e Compositores <ArrowRight size={16} />
                            </div>
                        </div>
                    </div>
                ))}
            </div>

            {(!movimentos || movimentos.length === 0) && (
                <div className="text-center py-12 text-gray-500 bg-white rounded-xl border border-dashed">
                    Nenhum registro histórico encontrado.
                </div>
            )}
        </div>
    )
}
