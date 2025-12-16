import { createClient } from '@/lib/supabase/server';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import { ArrowLeft, Edit, FileText, Video, Music, Calendar, User } from 'lucide-react';

interface PageProps {
    params: {
        id: string;
    };
}

export default async function DetalhesRepertorioPage({ params }: PageProps) {
    const supabase = await createClient();

    const { data: item, error } = await supabase
        .from('repertorio')
        .select('*')
        .eq('id', params.id)
        .single();

    if (error || !item) {
        notFound();
    }

    return (
        <div className="space-y-8">
            {/* Header */}
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div className="flex items-center gap-4">
                    <Link
                        href="/professores/repertorio"
                        className="p-2 bg-white rounded-full hover:bg-gray-100 transition-colors shadow-sm"
                    >
                        <ArrowLeft className="w-5 h-5 text-gray-600" />
                    </Link>
                    <div>
                        <h1 className="text-3xl font-bold text-gray-900">{item.titulo}</h1>
                        <p className="text-gray-600 flex items-center gap-2">
                            <User className="w-4 h-4" />
                            {item.compositor || 'Compositor desconhecido'}
                        </p>
                    </div>
                </div>

                <Link
                    href={`/professores/repertorio/${item.id}/editar`}
                    className="flex items-center gap-2 px-4 py-2 bg-white border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50 font-medium transition-colors shadow-sm"
                >
                    <Edit className="w-4 h-4" />
                    Editar
                </Link>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                {/* Main Content */}
                <div className="lg:col-span-2 space-y-8">
                    {/* Infos Cards */}
                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                        <div className="bg-white p-4 rounded-xl border border-gray-100 shadow-sm">
                            <p className="text-xs font-bold text-gray-400 uppercase tracking-wider mb-1">Nível</p>
                            <p className="font-semibold text-gray-800 capitalize">{item.nivel_dificuldade}</p>
                        </div>
                        <div className="bg-white p-4 rounded-xl border border-gray-100 shadow-sm">
                            <p className="text-xs font-bold text-gray-400 uppercase tracking-wider mb-1">Instrumento</p>
                            {/* Handle JSON array */}
                            <p className="font-semibold text-gray-800">
                                {Array.isArray(item.instrumentos_necessarios)
                                    ? item.instrumentos_necessarios.join(', ')
                                    : item.instrumentos_necessarios || '-'}
                            </p>
                        </div>
                        <div className="bg-white p-4 rounded-xl border border-gray-100 shadow-sm">
                            <p className="text-xs font-bold text-gray-400 uppercase tracking-wider mb-1">Adicionado em</p>
                            <p className="font-semibold text-gray-800 text-sm flex items-center gap-2 mt-1">
                                <Calendar className="w-4 h-4" />
                                {new Date(item.created_at || item.criado_em || Date.now()).toLocaleDateString('pt-BR')}
                            </p>
                        </div>
                    </div>

                    {/* Resources */}
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                        {item.partitura_url && (
                            <div className="bg-white p-6 rounded-2xl border border-gray-100 shadow-sm">
                                <div className="flex items-center gap-3 mb-4">
                                    <div className="p-3 bg-red-50 text-red-600 rounded-xl">
                                        <FileText className="w-6 h-6" />
                                    </div>
                                    <h3 className="font-bold text-gray-900">Partitura</h3>
                                </div>
                                <a
                                    href={item.partitura_url}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="block w-full text-center px-4 py-2 bg-gray-50 hover:bg-gray-100 text-gray-700 rounded-lg font-medium transition-colors"
                                >
                                    Abrir PDF
                                </a>
                            </div>
                        )}

                        {item.video_tutorial_url && (
                            <div className="bg-white p-6 rounded-2xl border border-gray-100 shadow-sm">
                                <div className="flex items-center gap-3 mb-4">
                                    <div className="p-3 bg-red-50 text-red-600 rounded-xl">
                                        <Video className="w-6 h-6" />
                                    </div>
                                    <h3 className="font-bold text-gray-900">Vídeo Aula</h3>
                                </div>
                                <a
                                    href={item.video_tutorial_url}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="block w-full text-center px-4 py-2 bg-gray-50 hover:bg-gray-100 text-gray-700 rounded-lg font-medium transition-colors"
                                >
                                    Assistir Vídeo
                                </a>
                            </div>
                        )}
                    </div>
                </div>

                {/* Sidebar / Preview?? */}
                <div className="space-y-6">
                    {/* Could add 'History of usage' or 'Linked Lessons' here later */}
                    <div className="bg-gradient-to-br from-indigo-600 to-purple-600 rounded-2xl p-6 text-white shadow-lg">
                        <Music className="w-10 h-10 mb-4 text-white/80" />
                        <h3 className="text-lg font-bold mb-2">Dica do Professor</h3>
                        <p className="text-white/90 text-sm leading-relaxed">
                            Use este material para trabalhar a técnica de arco e expressividade.
                            {/* Static text for now */}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    );
}
