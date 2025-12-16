import { createClient } from '@/lib/supabase/server'
import { GraduationCap, Clock, Award } from 'lucide-react'

export default async function FormacaoDocentePage() {
    const supabase = await createClient()

    const { data: capacitacoes } = await supabase
        .from('capacitacao_docente')
        .select('*');

    return (
        <div className="space-y-8">
            <div>
                <h1 className="text-3xl font-bold text-gray-900">Formação Docente</h1>
                <p className="text-gray-500">Recursos e cursos para desenvolvimento contínuo.</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {capacitacoes?.map((item: any) => (
                    <div key={item.id} className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm hover:shadow-md transition-shadow">
                        <div className="flex items-center gap-3 mb-4">
                            <div className="p-2 bg-indigo-50 rounded-lg">
                                <GraduationCap className="w-6 h-6 text-indigo-600" />
                            </div>
                            <h3 className="font-bold text-lg text-gray-900 line-clamp-1">
                                {item.nome || item.titulo || 'Formação Sem Título'}
                            </h3>
                        </div>

                        <p className="text-gray-500 text-sm mb-6 line-clamp-3">
                            {item.descricao || item.description || 'Sem descrição disponível.'}
                        </p>

                        <div className="flex items-center justify-between text-xs text-gray-400 border-t pt-4">
                            <div className="flex items-center gap-1">
                                <Clock className="w-3 h-3" />
                                <span>{item.duracao || item.carga_horaria || '--'}h</span>
                            </div>
                            <div className="flex items-center gap-1">
                                <Award className="w-3 h-3" />
                                <span>{item.nivel || 'Geral'}</span>
                            </div>
                        </div>
                    </div>
                ))}

                {(!capacitacoes || capacitacoes.length === 0) && (
                    <div className="col-span-full text-center py-12 text-gray-500 bg-white rounded-xl border border-dashed">
                        Nenhuma formação disponível no momento.
                    </div>
                )}
            </div>
        </div>
    )
}
