'use client';

import { ArrowLeft, Video, Calendar } from 'lucide-react';
import Link from 'next/link';
import { useState } from 'react';
import { NovaAulaForm } from '../../components/NovaAulaForm';

export default function NovaAulaPage() {
    const [selectedType, setSelectedType] = useState<'gravada' | 'ao_vivo' | null>(null);

    return (
        <div className="max-w-4xl mx-auto">
            <div className="mb-8 flex items-center gap-4">
                <Link
                    href="/professores"
                    className="p-2 bg-white rounded-full hover:bg-gray-100 transition-colors"
                >
                    <ArrowLeft className="w-5 h-5 text-gray-600" />
                </Link>
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Nova Aula</h1>
                    <p className="text-gray-600">Prepare e publique conteúdo para suas turmas</p>
                </div>
            </div>

            {selectedType ? (
                <NovaAulaForm
                    initialType={selectedType}
                    onCancel={() => setSelectedType(null)}
                />
            ) : (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6 animate-in fade-in slide-in-from-bottom-4">
                    <div
                        onClick={() => setSelectedType('gravada')}
                        className="bg-white p-8 rounded-3xl border border-gray-100 shadow-sm hover:shadow-md transition-all cursor-pointer group"
                    >
                        <div className="w-16 h-16 bg-blue-50 rounded-2xl flex items-center justify-center mb-6 text-blue-600 group-hover:scale-110 transition-transform">
                            <Video size={32} />
                        </div>
                        <h2 className="text-xl font-bold text-gray-900 mb-2">Aula Gravada</h2>
                        <p className="text-gray-500 mb-6">
                            Faça upload de vídeos ou grave diretamente do navegador para disponibilizar assincronamente.
                        </p>
                        <button className="w-full py-3 bg-blue-600 text-white rounded-xl font-bold hover:bg-blue-700 transition-colors">
                            Criar Aula
                        </button>
                    </div>

                    <div
                        onClick={() => setSelectedType('ao_vivo')}
                        className="bg-white p-8 rounded-3xl border border-gray-100 shadow-sm hover:shadow-md transition-all cursor-pointer group"
                    >
                        <div className="w-16 h-16 bg-purple-50 rounded-2xl flex items-center justify-center mb-6 text-purple-600 group-hover:scale-110 transition-transform">
                            <Calendar size={32} />
                        </div>
                        <h2 className="text-xl font-bold text-gray-900 mb-2">Agendar Live</h2>
                        <p className="text-gray-500 mb-6">
                            Marque uma aula ao vivo via Zoom/Meet integrada ao calendário da turma.
                        </p>
                        <button className="w-full py-3 bg-white text-purple-600 border-2 border-purple-100 rounded-xl font-bold hover:bg-purple-50 transition-colors">
                            Agendar
                        </button>
                    </div>
                </div>
            )}
        </div>
    );
}
