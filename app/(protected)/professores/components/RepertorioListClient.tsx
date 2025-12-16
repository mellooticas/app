'use client';

import { useState } from 'react';
import { Music, FileText, Search, Plus, ExternalLink, Video, Trash2, Edit, Eye, MoreVertical } from 'lucide-react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase/client';
import { useRouter } from 'next/navigation';

interface RepertorioItem {
    id: string;
    titulo: string;
    compositor: string | null;
    nivel_dificuldade: string | null;
    partitura_url: string | null;
    video_tutorial_url: string | null;
    instrumentos_necessarios: any | null; // JSON
    criado_em: string | null;
}

export function RepertorioListClient({ initialRepertorio }: { initialRepertorio: RepertorioItem[] }) {
    const router = useRouter();
    const [search, setSearch] = useState('');
    const [filterLevel, setFilterLevel] = useState<string>('todos');
    const [filterInstrument, setFilterInstrument] = useState<string>('todos');
    const [isDeleting, setIsDeleting] = useState<string | null>(null);

    // Extract unique instruments
    const instruments = Array.from(new Set(
        initialRepertorio.flatMap(item =>
            Array.isArray(item.instrumentos_necessarios)
                ? item.instrumentos_necessarios
                : item.instrumentos_necessarios ? [item.instrumentos_necessarios] : []
        )
    )).sort();

    const handleDelete = async (id: string, e: React.MouseEvent) => {
        e.preventDefault();
        e.stopPropagation();

        if (!confirm('Tem certeza que deseja excluir este material?')) return;

        setIsDeleting(id);
        try {
            const { error } = await supabase
                .from('repertorio')
                .delete()
                .eq('id', id);

            if (error) throw error;
            router.refresh();
        } catch (error) {
            console.error('Erro ao excluir:', error);
            alert('Erro ao excluir.');
        } finally {
            setIsDeleting(null);
        }
    };

    const filtered = initialRepertorio.filter(item => {
        const matchesSearch = item.titulo.toLowerCase().includes(search.toLowerCase()) ||
            (item.compositor && item.compositor.toLowerCase().includes(search.toLowerCase()));

        const matchesLevel = filterLevel === 'todos' || item.nivel_dificuldade === filterLevel;

        const itemInstruments = Array.isArray(item.instrumentos_necessarios)
            ? item.instrumentos_necessarios
            : item.instrumentos_necessarios ? [item.instrumentos_necessarios] : [];

        // If filter is 'todos', match. Else check if item has the selected instrument.
        const matchesInstrument = filterInstrument === 'todos' || itemInstruments.includes(filterInstrument);

        return matchesSearch && matchesLevel && matchesInstrument;
    });

    return (
        <div>
            <div className="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 mb-8">
                <div className="flex flex-col md:flex-row gap-4">
                    <div className="relative flex-1">
                        <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
                        <input
                            type="text"
                            value={search}
                            onChange={(e) => setSearch(e.target.value)}
                            placeholder="Buscar partituras, compositores..."
                            className="w-full pl-12 pr-4 py-3 bg-gray-50 border-none rounded-xl focus:ring-2 focus:ring-indigo-100 outline-none transition-all"
                        />
                    </div>
                    <select
                        value={filterLevel}
                        onChange={(e) => setFilterLevel(e.target.value)}
                        className="px-4 py-3 bg-gray-50 border-none rounded-xl focus:ring-2 focus:ring-indigo-100 outline-none cursor-pointer"
                    >
                        <option value="todos">Todos os Níveis</option>
                        <option value="iniciante">Iniciante</option>
                        <option value="intermediário">Intermediário</option>
                        <option value="avançado">Avançado</option>
                    </select>
                    <select
                        value={filterInstrument}
                        onChange={(e) => setFilterInstrument(e.target.value)}
                        className="px-4 py-3 bg-gray-50 border-none rounded-xl focus:ring-2 focus:ring-indigo-100 outline-none cursor-pointer"
                    >
                        <option value="todos">Todos os Instrumentos</option>
                        {instruments.map((inst) => (
                            <option key={String(inst)} value={String(inst)}>{String(inst)}</option>
                        ))}
                    </select>
                </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {filtered.map((item) => (
                    <div key={item.id} className="bg-white p-6 rounded-2xl border border-gray-100 hover:shadow-lg transition-all group relative">
                        <Link href={`/professores/repertorio/${item.id}`} className="absolute inset-0 z-0" />

                        <div className="flex items-start justify-between mb-4 relative z-10 pointer-events-none">
                            <div className="w-12 h-12 bg-indigo-50 rounded-xl flex items-center justify-center text-indigo-600">
                                <Music size={24} />
                            </div>
                            <div className="flex gap-2 pointer-events-auto">
                                <Link
                                    href={`/professores/repertorio/${item.id}/editar`}
                                    className="p-2 text-gray-400 hover:text-indigo-600 hover:bg-gray-50 rounded-lg transition-colors"
                                    title="Editar"
                                >
                                    <Edit size={16} />
                                </Link>
                                <button
                                    onClick={(e) => handleDelete(item.id, e)}
                                    disabled={isDeleting === item.id}
                                    className="p-2 text-gray-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors disabled:opacity-50"
                                    title="Excluir"
                                >
                                    <Trash2 size={16} />
                                </button>
                            </div>
                        </div>

                        <div className="relative z-10 pointer-events-none mb-4">
                            <div className="flex items-center gap-2 mb-2">
                                <span className={`px-2 py-0.5 rounded-md text-[10px] font-bold uppercase tracking-wider
                                    ${item.nivel_dificuldade === 'iniciante' ? 'bg-green-100 text-green-700' : ''}
                                    ${item.nivel_dificuldade === 'intermediário' ? 'bg-orange-100 text-orange-700' : ''}
                                    ${item.nivel_dificuldade === 'avançado' ? 'bg-red-100 text-red-700' : ''}
                                `}>
                                    {item.nivel_dificuldade || 'Geral'}
                                </span>
                            </div>
                            <h3 className="text-lg font-bold text-gray-900 mb-1 line-clamp-1" title={item.titulo}>{item.titulo}</h3>
                            <p className="text-sm text-gray-500">{item.compositor || 'Compositor desconhecido'}</p>
                        </div>

                        <div className="flex items-center gap-3 text-sm text-gray-400 border-t border-gray-50 pt-4 mt-auto relative z-10 pointer-events-auto">
                            {item.partitura_url && (
                                <a href={item.partitura_url} target="_blank" rel="noopener noreferrer" className="flex items-center gap-1 hover:text-indigo-600 transition-colors">
                                    <FileText size={14} /> Partitura
                                </a>
                            )}
                            {item.video_tutorial_url && (
                                <a href={item.video_tutorial_url} target="_blank" rel="noopener noreferrer" className="flex items-center gap-1 hover:text-indigo-600 transition-colors">
                                    <Video size={14} /> Vídeo
                                </a>
                            )}
                            <Link href={`/professores/repertorio/${item.id}`} className="ml-auto flex items-center gap-1 text-indigo-600 hover:text-indigo-700 font-medium">
                                Ver Detalhes
                            </Link>
                        </div>
                    </div>
                ))}
            </div>

            {filtered.length === 0 && (
                <div className="text-center py-12 text-gray-500">
                    Nenhum material encontrado.
                </div>
            )}
        </div>
    );
}
