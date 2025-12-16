'use client';

import { supabase } from '@/lib/supabase/client';
import { useState, useEffect } from 'react';
import { Loader2 } from 'lucide-react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';

interface RepertorioFormProps {
    initialData?: any;
    isEditing?: boolean;
}

export default function RepertorioForm({ initialData, isEditing = false }: RepertorioFormProps) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);
    const [instrumentos, setInstrumentos] = useState<any[]>([]);

    const [formData, setFormData] = useState({
        titulo: '',
        compositor: '',
        instrumento_id: '',
        nivel_dificuldade: 'iniciante',
        partitura_url: '',
        video_url: ''
    });

    useEffect(() => {
        if (initialData) {
            setFormData({
                titulo: initialData.titulo || '',
                compositor: initialData.compositor || '',
                instrumento_id: '',
                nivel_dificuldade: initialData.nivel_dificuldade || 'iniciante',
                partitura_url: initialData.partitura_url || '',
                video_url: initialData.video_tutorial_url || ''
            });
        }
    }, [initialData]);

    useEffect(() => {
        async function loadInstrumentos() {
            const { data } = await supabase.from('instrumentos').select('id, nome').order('nome');
            if (data) {
                setInstrumentos(data);
                if (initialData && initialData.instrumentos_necessarios && initialData.instrumentos_necessarios.length > 0) {
                    const name = initialData.instrumentos_necessarios[0];
                    const found = data.find((i: any) => i.nome === name);
                    if (found) {
                        setFormData(prev => ({ ...prev, instrumento_id: found.id }));
                    }
                }
            }
        }
        loadInstrumentos();
    }, [initialData]);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);

        try {
            const selectedInstrument = instrumentos.find(i => i.id === formData.instrumento_id);

            const payload = {
                titulo: formData.titulo,
                compositor: formData.compositor,
                nivel_dificuldade: formData.nivel_dificuldade,
                partitura_url: formData.partitura_url,
                video_tutorial_url: formData.video_url,
                instrumentos_necessarios: selectedInstrument ? [selectedInstrument.nome] : [],
                ativo: true
            };

            let error;
            if (isEditing && initialData?.id) {
                const { error: err } = await supabase
                    .from('repertorio')
                    .update(payload as any)
                    .eq('id', initialData.id);
                error = err;
            } else {
                const { error: err } = await supabase
                    .from('repertorio')
                    .insert(payload as any);
                error = err;
            }

            if (error) throw error;

            router.push('/professores/repertorio');
            router.refresh();

        } catch (error) {
            console.error('Erro ao salvar repertório:', error);
            alert('Erro ao salvar. Verifique o console.');
        } finally {
            setLoading(false);
        }
    };

    return (
        <form onSubmit={handleSubmit} className="bg-white p-8 rounded-3xl border border-gray-100 shadow-xl animate-in fade-in slide-in-from-bottom-4">
            <div className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label className="block text-sm font-bold text-gray-700 mb-2">Título</label>
                        <input
                            required
                            type="text"
                            value={formData.titulo}
                            onChange={e => setFormData({ ...formData, titulo: e.target.value })}
                            className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 outline-none transition-all"
                            placeholder="Ex: Sakura Sakura"
                        />
                    </div>
                    <div>
                        <label className="block text-sm font-bold text-gray-700 mb-2">Compositor</label>
                        <input
                            type="text"
                            value={formData.compositor}
                            onChange={e => setFormData({ ...formData, compositor: e.target.value })}
                            className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 outline-none transition-all"
                            placeholder="Tradicional / Nome do Compositor"
                        />
                    </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label className="block text-sm font-bold text-gray-700 mb-2">Instrumento</label>
                        <select
                            value={formData.instrumento_id}
                            onChange={e => setFormData({ ...formData, instrumento_id: e.target.value })}
                            className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 outline-none transition-all"
                        >
                            <option value="">Selecione...</option>
                            {instrumentos.map(inst => (
                                <option key={inst.id} value={inst.id}>{inst.nome}</option>
                            ))}
                        </select>
                    </div>
                    <div>
                        <label className="block text-sm font-bold text-gray-700 mb-2">Nível</label>
                        <select
                            value={formData.nivel_dificuldade}
                            onChange={e => setFormData({ ...formData, nivel_dificuldade: e.target.value })}
                            className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 outline-none transition-all"
                        >
                            <option value="iniciante">Iniciante</option>
                            <option value="intermediário">Intermediário</option>
                            <option value="avançado">Avançado</option>
                        </select>
                    </div>
                </div>

                <div>
                    <label className="block text-sm font-bold text-gray-700 mb-2">URL da Partitura (PDF)</label>
                    <input
                        type="url"
                        value={formData.partitura_url}
                        onChange={e => setFormData({ ...formData, partitura_url: e.target.value })}
                        className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 outline-none transition-all"
                        placeholder="https://..."
                    />
                </div>

                <div>
                    <label className="block text-sm font-bold text-gray-700 mb-2">URL do Vídeo Tutorial (Youtube)</label>
                    <input
                        type="url"
                        value={formData.video_url}
                        onChange={e => setFormData({ ...formData, video_url: e.target.value })}
                        className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 outline-none transition-all"
                        placeholder="https://..."
                    />
                </div>

                <div className="pt-4 flex justify-end gap-4">
                    <Link
                        href="/professores/repertorio"
                        className="px-6 py-3 rounded-xl font-bold text-gray-500 hover:bg-gray-100 transition-colors"
                    >
                        Cancelar
                    </Link>
                    <button
                        type="submit"
                        className="px-6 py-3 rounded-xl font-bold bg-indigo-600 text-white hover:bg-indigo-700 transition-colors flex items-center gap-2"
                        disabled={loading}
                    >
                        {loading && <Loader2 className="w-5 h-5 animate-spin" />}
                        {isEditing ? 'Salvar Alterações' : 'Salvar Material'}
                    </button>
                </div>
            </div>
        </form>
    );
}
