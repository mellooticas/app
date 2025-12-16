'use client';

import { supabase } from '@/lib/supabase/client';
import { useState } from 'react';
import { Save, X, Loader2, Plus, Trash2, FileText, Video, Link as LinkIcon, AlertCircle } from 'lucide-react';
import { useRouter } from 'next/navigation';

interface NovaAulaFormProps {
    initialType: 'gravada' | 'ao_vivo';
    onCancel: () => void;
}

interface Material {
    id: string; // temp id for UI
    titulo: string;
    tipo: 'video' | 'pdf' | 'audio' | 'link';
    url: string;
}

interface Desafio {
    titulo: string;
    descricao: string;
    dificuldade: string;
    pontos_xp: number;
}

export function NovaAulaForm({ initialType, onCancel }: NovaAulaFormProps) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);

    // Main Form Data
    const [formData, setFormData] = useState({
        titulo: '',
        descricao: '',
        tipo: initialType,
        data_aula: '', // For datetime-local
        duracao_estimada: 60,
        nivel: 'iniciante',
        status: 'rascunho',
    });

    // Materials List
    const [materiais, setMateriais] = useState<Material[]>([]);
    const [newMaterial, setNewMaterial] = useState<{ titulo: string, tipo: 'video' | 'pdf' | 'audio' | 'link', url: string }>({
        titulo: '',
        tipo: 'video',
        url: ''
    });

    // Challenge Data
    const [addDesafio, setAddDesafio] = useState(false);
    const [desafio, setDesafio] = useState<Desafio>({
        titulo: '',
        descricao: '',
        dificuldade: 'iniciante',
        pontos_xp: 10
    });

    const addMaterial = () => {
        if (!newMaterial.titulo || !newMaterial.url) return;
        setMateriais([
            ...materiais,
            { ...newMaterial, id: Math.random().toString(36).substr(2, 9) }
        ]);
        setNewMaterial({ titulo: '', tipo: 'video', url: '' });
    };

    const removeMaterial = (id: string) => {
        setMateriais(materiais.filter(m => m.id !== id));
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);

        try {
            const { data: { user } } = await supabase.auth.getUser();
            if (!user) throw new Error('Usuário não autenticado');

            const payload: any = {
                titulo: formData.titulo,
                descricao: formData.descricao,
                tipo: formData.tipo,
                status: formData.status,
                duracao_minutos: formData.duracao_estimada,
                nivel: formData.nivel,
                responsavel_id: user.id,
                ...(formData.data_aula ? { data_inicio: new Date(formData.data_aula).toISOString() } : {}),
            };

            // 1. Insert Aula
            const { data: aula, error } = await supabase
                .from('aulas')
                .insert(payload)
                .select()
                .single();

            if (error) throw error;
            if (!aula) throw new Error('Erro ao criar aula');

            // 2. Insert Materiais
            if (materiais.length > 0) {
                const materiaisPayload = materiais.map(m => ({
                    aula_id: aula.id,
                    tipo: m.tipo,
                    titulo: m.titulo,
                    url: m.url,
                    descricao: m.titulo // Defaulting description to title for now
                }));

                const { error: matError } = await supabase
                    .from('aula_materiais')
                    .insert(materiaisPayload as any);

                if (matError) console.error('Error inserting materials:', matError);
            }

            // 3. Insert Desafio (if enabled)
            if (addDesafio && desafio.titulo) {
                // Casting 'any' safely as schema might vary slightly
                const { error: desError } = await supabase
                    .from('aula_desafios' as any)
                    .insert({
                        aula_id: aula.id,
                        titulo: desafio.titulo,
                        descricao: desafio.descricao,
                        dificuldade: desafio.dificuldade,
                        pontos_xp: desafio.pontos_xp,
                        ativo: true
                    } as any);

                if (desError) console.error('Error inserting challenge:', desError);
            }

            router.push('/professores');
            router.refresh();

        } catch (error) {
            console.error('Error creating lesson:', error);
            alert('Erro ao criar aula. Verifique o console.');
        } finally {
            setLoading(false);
        }
    };

    return (
        <form onSubmit={handleSubmit} className="bg-white p-8 rounded-3xl border border-gray-100 shadow-xl max-w-4xl mx-auto animate-in fade-in slide-in-from-bottom-4 space-y-8">
            <div className="flex justify-between items-center pb-6 border-b border-gray-100">
                <h2 className="text-2xl font-bold text-gray-900">
                    {formData.tipo === 'gravada' ? 'Nova Aula Gravada' : 'Agendar Live'}
                </h2>
                <button type="button" onClick={onCancel} className="p-2 hover:bg-gray-100 rounded-full">
                    <X className="w-5 h-5 text-gray-500" />
                </button>
            </div>

            {/* Basic Info */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div className="space-y-6">
                    <div>
                        <label className="block text-sm font-bold text-gray-700 mb-2">Título da Aula</label>
                        <input
                            required
                            type="text"
                            value={formData.titulo}
                            onChange={e => setFormData({ ...formData, titulo: e.target.value })}
                            className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all"
                            placeholder="Ex: Introdução ao Hiragana"
                        />
                    </div>

                    <div>
                        <label className="block text-sm font-bold text-gray-700 mb-2">Descrição</label>
                        <textarea
                            rows={4}
                            value={formData.descricao}
                            onChange={e => setFormData({ ...formData, descricao: e.target.value })}
                            className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all"
                            placeholder="Descreva o conteúdo da aula..."
                        />
                    </div>

                    <div className="grid grid-cols-2 gap-4">
                        <div>
                            <label className="block text-sm font-bold text-gray-700 mb-2">Nível</label>
                            <select
                                value={formData.nivel}
                                onChange={e => setFormData({ ...formData, nivel: e.target.value })}
                                className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all"
                            >
                                <option value="iniciante">Iniciante</option>
                                <option value="intermediario">Intermediário</option>
                                <option value="avancado">Avançado</option>
                            </select>
                        </div>
                        <div>
                            <label className="block text-sm font-bold text-gray-700 mb-2">Duração (min)</label>
                            <input
                                type="number"
                                value={formData.duracao_estimada}
                                onChange={e => setFormData({ ...formData, duracao_estimada: parseInt(e.target.value) })}
                                className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all"
                            />
                        </div>
                    </div>
                </div>

                <div className="space-y-6">
                    {formData.tipo === 'ao_vivo' && (
                        <div>
                            <label className="block text-sm font-bold text-gray-700 mb-2">Data e Hora</label>
                            <input
                                required
                                type="datetime-local"
                                value={formData.data_aula}
                                onChange={e => setFormData({ ...formData, data_aula: e.target.value })}
                                className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all"
                            />
                        </div>
                    )}

                    {/* Materials Section */}
                    <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100">
                        <label className="block text-sm font-bold text-gray-800 mb-4">Materiais de Apoio</label>

                        <div className="space-y-3 mb-4">
                            {materiais.map(m => (
                                <div key={m.id} className="flex items-center justify-between bg-white p-3 rounded-lg border border-gray-200 shadow-sm">
                                    <div className="flex items-center gap-3">
                                        {m.tipo === 'video' ? <Video className="w-4 h-4 text-blue-500" /> :
                                            m.tipo === 'pdf' ? <FileText className="w-4 h-4 text-red-500" /> :
                                                <LinkIcon className="w-4 h-4 text-gray-500" />}
                                        <span className="text-sm font-medium text-gray-700">{m.titulo}</span>
                                    </div>
                                    <button type="button" onClick={() => removeMaterial(m.id)} className="text-red-400 hover:text-red-600">
                                        <Trash2 className="w-4 h-4" />
                                    </button>
                                </div>
                            ))}
                        </div>

                        <div className="grid grid-cols-12 gap-2">
                            <div className="col-span-12 md:col-span-4">
                                <select
                                    value={newMaterial.tipo}
                                    onChange={e => setNewMaterial({ ...newMaterial, tipo: e.target.value as any })}
                                    className="w-full px-3 py-2 text-sm rounded-lg border border-gray-200 outline-none"
                                >
                                    <option value="video">Vídeo</option>
                                    <option value="pdf">PDF</option>
                                    <option value="audio">Áudio</option>
                                    <option value="link">Link</option>
                                </select>
                            </div>
                            <div className="col-span-12 md:col-span-8">
                                <input
                                    type="text"
                                    placeholder="Título do Material"
                                    value={newMaterial.titulo}
                                    onChange={e => setNewMaterial({ ...newMaterial, titulo: e.target.value })}
                                    className="w-full px-3 py-2 text-sm rounded-lg border border-gray-200 outline-none"
                                />
                            </div>
                            <div className="col-span-12">
                                <div className="flex gap-2">
                                    <input
                                        type="url"
                                        placeholder="URL do arquivo ou vídeo"
                                        value={newMaterial.url}
                                        onChange={e => setNewMaterial({ ...newMaterial, url: e.target.value })}
                                        className="w-full px-3 py-2 text-sm rounded-lg border border-gray-200 outline-none"
                                    />
                                    <button
                                        type="button"
                                        onClick={addMaterial}
                                        className="bg-gray-900 text-white p-2 rounded-lg hover:bg-gray-800 transition-colors"
                                    >
                                        <Plus className="w-5 h-5" />
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {/* Challenges Section */}
            <div className="border-t border-gray-100 pt-6">
                <div className="flex items-center justify-between mb-4">
                    <label className="text-lg font-bold text-gray-900 flex items-center gap-2">
                        <AlertCircle className="w-5 h-5 text-orange-500" />
                        Desafio Prático
                    </label>
                    <label className="relative inline-flex items-center cursor-pointer">
                        <input type="checkbox" checked={addDesafio} onChange={() => setAddDesafio(!addDesafio)} className="sr-only peer" />
                        <div className="w-11 h-6 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-blue-600"></div>
                    </label>
                </div>

                {addDesafio && (
                    <div className="bg-orange-50 p-6 rounded-2xl border border-orange-100 animate-in fade-in slide-in-from-top-2">
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label className="block text-sm font-bold text-gray-700 mb-2">Título do Desafio</label>
                                <input
                                    type="text"
                                    value={desafio.titulo}
                                    onChange={e => setDesafio({ ...desafio, titulo: e.target.value })}
                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-orange-500 outline-none"
                                    placeholder="Ex: Gravar escala de Dó Maior"
                                />
                            </div>
                            <div>
                                <label className="block text-sm font-bold text-gray-700 mb-2">XP Recompensa</label>
                                <input
                                    type="number"
                                    value={desafio.pontos_xp}
                                    onChange={e => setDesafio({ ...desafio, pontos_xp: parseInt(e.target.value) })}
                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-orange-500 outline-none"
                                />
                            </div>
                            <div className="md:col-span-2">
                                <label className="block text-sm font-bold text-gray-700 mb-2">Instruções do Desafio</label>
                                <textarea
                                    rows={3}
                                    value={desafio.descricao}
                                    onChange={e => setDesafio({ ...desafio, descricao: e.target.value })}
                                    className="w-full px-4 py-3 rounded-xl border border-gray-200 focus:border-orange-500 outline-none"
                                    placeholder="Explique o que o aluno deve fazer..."
                                />
                            </div>
                        </div>
                    </div>
                )}
            </div>

            {/* Footer Actions */}
            <div className="pt-6 flex justify-end gap-4 border-t border-gray-100">
                <button
                    type="button"
                    onClick={onCancel}
                    className="px-6 py-3 rounded-xl font-bold text-gray-500 hover:bg-gray-100 transition-colors"
                    disabled={loading}
                >
                    Cancelar
                </button>
                <div className="flex gap-4">
                    <label className="flex items-center gap-2 cursor-pointer bg-gray-50 px-4 rounded-xl hover:bg-gray-100">
                        <input
                            type="radio"
                            name="status"
                            value="rascunho"
                            checked={formData.status === 'rascunho'}
                            onChange={() => setFormData({ ...formData, status: 'rascunho' })}
                            className="w-4 h-4 text-blue-600"
                        />
                        <span className="text-sm font-medium text-gray-700">Rascunho</span>
                    </label>
                    <button
                        type="submit"
                        className="px-6 py-3 rounded-xl font-bold bg-blue-600 text-white hover:bg-blue-700 transition-colors flex items-center gap-2 shadow-lg hover:shadow-xl translate-y-0 hover:-translate-y-0.5"
                        disabled={loading}
                        onClick={() => setFormData({ ...formData, status: 'publicada' })}
                    >
                        {loading && <Loader2 className="w-5 h-5 animate-spin" />}
                        Publicar Aula
                    </button>
                </div>
            </div>
        </form>
    );
}
