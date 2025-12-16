import { createClient } from '@/lib/supabase/server'
import { MessageSquare, ThumbsUp, Eye, Search } from 'lucide-react'
import Link from 'next/link'

export default async function ForumPage() {
    const supabase = await createClient()

    // Fetch questions with stats (replies and likes count)
    // Assuming simpler structure without complex joins for now, or using 'forum_perguntas' directly
    // Ideally we would join with profiles, but let's start with raw data display for robustness
    const { data: perguntas } = await supabase
        .from('forum_perguntas')
        .select(`
            *,
            autor:profiles!user_id(full_name, avatar_url),
            respostas_count:forum_respostas(count),
            likes_count:forum_likes(count)
        `)
        .order('created_at', { ascending: false });

    return (
        <div className="space-y-6">
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Fórum da Comunidade</h1>
                    <p className="text-gray-500">Espaço para dúvidas, discussões e compartilhamento de conhecimento.</p>
                </div>
                <div>
                    <button className="px-6 py-3 bg-pink-600 text-white font-medium rounded-xl hover:bg-pink-700 transition-colors shadow-sm dark-hover">
                        Nova Pergunta
                    </button>
                </div>
            </div>

            {/* Search Bar Placeholder */}
            <div className="relative">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 w-5 h-5" />
                <input
                    type="text"
                    placeholder="Pesquisar discussões..."
                    className="w-full pl-12 pr-4 py-3 rounded-xl border border-gray-200 focus:border-pink-500 focus:ring-2 focus:ring-pink-200 outline-none transition-all"
                />
            </div>

            <div className="space-y-4">
                {perguntas?.map((p: any) => (
                    <div key={p.id} className="bg-white p-6 rounded-2xl border border-gray-100 shadow-sm hover:border-pink-100 transition-all cursor-pointer">
                        <div className="flex items-start gap-4">
                            <div className="w-12 h-12 rounded-full bg-gray-100 flex-shrink-0 overflow-hidden">
                                {p.autor?.avatar_url ? (
                                    <img src={p.autor.avatar_url} alt={p.autor.full_name} className="w-full h-full object-cover" />
                                ) : (
                                    <div className="w-full h-full flex items-center justify-center text-gray-400 font-bold text-lg">
                                        {p.autor?.full_name?.charAt(0) || '?'}
                                    </div>
                                )}
                            </div>
                            <div className="flex-1">
                                <h3 className="text-lg font-bold text-gray-900 mb-1 hover:text-pink-600 transition-colors">
                                    {p.titulo}
                                </h3>
                                <p className="text-gray-600 line-clamp-2 mb-3">
                                    {p.conteudo}
                                </p>
                                <div className="flex items-center gap-4 text-sm text-gray-500">
                                    <span className="font-medium text-gray-900">{p.autor?.full_name || 'Usuário Anônimo'}</span>
                                    <span>•</span>
                                    <span>{new Date(p.created_at).toLocaleDateString()}</span>

                                    <div className="flex items-center gap-4 ml-auto">
                                        <div className="flex items-center gap-1 hover:text-pink-600">
                                            <MessageSquare className="w-4 h-4" />
                                            <span>{p.respostas_count?.[0]?.count || 0}</span>
                                        </div>
                                        <div className="flex items-center gap-1 hover:text-pink-600">
                                            <ThumbsUp className="w-4 h-4" />
                                            <span>{p.likes_count?.[0]?.count || 0}</span>
                                        </div>
                                        <div className="flex items-center gap-1">
                                            <Eye className="w-4 h-4" />
                                            <span>{p.visualizacoes || 0}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                ))}

                {(!perguntas || perguntas.length === 0) && (
                    <div className="text-center py-12 text-gray-500 bg-white rounded-xl border border-dashed">
                        Nenhuma discussão encontrada. Seja o primeiro a perguntar!
                    </div>
                )}
            </div>
        </div>
    )
}
