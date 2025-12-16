import { createClient } from '@/lib/supabase/server'
import { Star, Calendar, Users, Music } from 'lucide-react'

export default async function ShowFinalPage() {
    const supabase = await createClient()

    // Fetch celebrations (shows, recitals)
    const { data: celebracoes } = await supabase
        .from('alpha_celebracoes')
        .select(`
            *,
            estudante:profiles(full_name)
        `)
        .order('created_at', { ascending: false });

    // Fetch collective projects
    const { data: projetos } = await supabase
        .from('alpha_projetos_coletivos')
        .select('*, criador:profiles(full_name)')
        .order('created_at', { ascending: false });

    return (
        <div className="space-y-8">
            <div className="bg-gradient-to-r from-purple-600 to-indigo-600 rounded-3xl p-8 text-white relative overflow-hidden">
                <Star className="absolute top-4 right-4 text-white/10 w-32 h-32" />
                <h1 className="text-3xl font-bold mb-2">Show Final & Celebrações</h1>
                <p className="text-indigo-100 max-w-xl">
                    Acompanhe os preparativos para os grandes eventos, recitais e apresentações finais dos alunos.
                </p>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                {/* Projetos Coletivos Section */}
                <div>
                    <h2 className="text-xl font-bold text-gray-900 mb-4 flex items-center gap-2">
                        <Users className="w-5 h-5 text-indigo-600" />
                        Projetos Coletivos
                    </h2>
                    <div className="space-y-4">
                        {projetos?.map((proj: any) => (
                            <div key={proj.id} className="bg-white p-5 rounded-xl border border-gray-100 shadow-sm">
                                <h3 className="font-bold text-gray-900">{proj.nome || proj.titulo}</h3>
                                <p className="text-sm text-gray-500 mb-2">{proj.descricao}</p>
                                <div className="text-xs text-gray-400">
                                    Criado por: {proj.criador?.full_name || 'Desconhecido'}
                                </div>
                            </div>
                        ))}
                        {(!projetos || projetos.length === 0) && (
                            <div className="p-8 bg-gray-50 rounded-xl border border-dashed text-center text-gray-400 text-sm">
                                Nenhum projeto coletivo em andamento.
                            </div>
                        )}
                    </div>
                </div>

                {/* Celebrações Section */}
                <div>
                    <h2 className="text-xl font-bold text-gray-900 mb-4 flex items-center gap-2">
                        <Music className="w-5 h-5 text-pink-600" />
                        Celebrações & Conquistas
                    </h2>
                    <div className="space-y-4">
                        {celebracoes?.map((cel: any) => (
                            <div key={cel.id} className="bg-white p-5 rounded-xl border border-gray-100 shadow-sm flex gap-4">
                                <div className="bg-pink-50 p-3 rounded-full h-fit text-pink-600">
                                    <Star className="w-5 h-5" />
                                </div>
                                <div>
                                    <h3 className="font-bold text-gray-900">{cel.titulo || 'Celebração'}</h3>
                                    <p className="text-sm text-gray-500 mb-1">{cel.descricao}</p>
                                    <div className="flex items-center gap-2 text-xs text-gray-400">
                                        <Calendar className="w-3 h-3" />
                                        <span>{new Date(cel.created_at).toLocaleDateString()}</span>
                                        <span>•</span>
                                        <span>{cel.estudante?.full_name}</span>
                                    </div>
                                </div>
                            </div>
                        ))}
                        {(!celebracoes || celebracoes.length === 0) && (
                            <div className="p-8 bg-gray-50 rounded-xl border border-dashed text-center text-gray-400 text-sm">
                                Nenhuma celebração registrada recentemente.
                            </div>
                        )}
                    </div>
                </div>
            </div>
        </div>
    )
}
