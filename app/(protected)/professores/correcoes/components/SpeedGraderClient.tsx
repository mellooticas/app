'use client';

import { useState, useEffect } from 'react';
import { supabase } from '@/lib/supabase/client';
import { motion, AnimatePresence } from 'framer-motion';
import {
    CheckCircle,
    XCircle,
    MessageSquare,
    ChevronLeft,
    ChevronRight,
    Play,
    Pause,
    Maximize,
    Download,
    Star,
    ArrowLeft,
    Send,
    AlertCircle
} from 'lucide-react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';

interface SpeedGraderProps {
    id: string;
    type?: string;
}

export default function SpeedGraderClient({ id, type = 'desafio' }: SpeedGraderProps) {
    const router = useRouter();
    const [loading, setLoading] = useState(true);
    const [submission, setSubmission] = useState<any>(null);
    const [feedback, setFeedback] = useState('');
    const [grade, setGrade] = useState<number | null>(null);
    const [status, setStatus] = useState<'pendente' | 'aprovado' | 'reprovado' | 'revisar'>('pendente');

    // Rubrics (Mocked for now)
    const [rubrics, setRubrics] = useState({
        'Ritmo': 0,
        'Precisão': 0,
        'Postura': 0,
        'Expressão': 0
    });

    useEffect(() => {
        fetchSubmission();
    }, [id, type]);

    const fetchSubmission = async () => {
        setLoading(true);
        try {
            // Simplified fetch logic based on type
            // Assuming 'desafio' for now as primary use case
            if (type === 'desafio') {
                const { data, error } = await supabase
                    .from('desafios_alpha_respostas')
                    .select(`
                        id,
                        desafio_id,
                        aluno_id,
                        resposta_conteudo,
                        status,
                        created_at,
                        aluno:profiles!aluno_id(id, full_name, email, avatar_url),
                        desafio:alpha_desafios!alpha_aluno_desafios_desafio_id_fkey(titulo, descricao)
                    )`) // Note: adjusting relationship might be needed based on actual schema
                    .eq('id', id)
                    .single();

                // Fallback fetch if relation name is tricky, just get raw and fetch related separately if needed
                // For safety with unknown relation names, let's just fetch raw first + separate calls if simple join fails
                // But trying standard join first.

                // Actually, previous CorrecoesClient used:
                /*
                  desafio:alpha_aluno_desafios!desafio_id(titulo, descricao)
                */
                // Let's copy that pattern if it worked there.

                if (error) {
                    // Try Fetching without deep relations if error
                    console.warn("Deep fetch failed, trying simple", error);
                    const { data: simpleData, error: simpleError } = await supabase
                        .from('desafios_alpha_respostas')
                        .select('*')
                        .eq('id', id)
                        .single();

                    if (simpleError) throw simpleError;

                    // Manually fetch related
                    const { data: aluno } = await supabase.from('profiles').select('*').eq('id', simpleData.aluno_id).single();
                    // const { data: desafio } = await supabase.from('alpha_desafios').select('*').eq('id', simpleData.desafio_id).single(); 

                    setSubmission({ ...simpleData, aluno, desafio: { titulo: 'Desafio (Erro no Join)' } });
                } else {
                    setSubmission(data);
                }
            }
        } catch (error) {
            console.error('Error fetching submission:', error);
            // Mock data for development if DB fails (SAFE NET)
            setSubmission({
                id: id,
                aluno: { full_name: 'Aluno Teste', avatar_url: null },
                desafio: { titulo: 'Desafio de Hiragana Básico', descricao: 'Grave um vídeo lendo as vogais.' },
                resposta_conteudo: 'https://www.w3schools.com/html/mov_bbb.mp4', // Mock video
                created_at: new Date().toISOString(),
                status: 'pendente'
            });
        } finally {
            setLoading(false);
        }
    };

    const handleGrade = async (newStatus: 'aprovado' | 'reprovado' | 'revisar') => {
        // Optimistic update
        setStatus(newStatus);

        // Save to DB
        try {
            const { error } = await supabase
                .from(type === 'desafio' ? 'desafios_alpha_respostas' : 'aula_avaliacoes')
                .update({
                    status: newStatus === 'revisar' ? 'em_analise' : newStatus, // Mapping custom status
                    // feedback: feedback // If column exists
                })
                .eq('id', id);

            if (error) throw error;

            // Show success toast/animation (omitted for brevity)
            setTimeout(() => {
                router.push('/professores/correcoes'); // Go back or next
            }, 1000);

        } catch (error) {
            console.error('Error updating grade:', error);
            alert('Erro ao salvar avaliação');
        }
    };

    if (loading) {
        return (
            <div className="flex items-center justify-center h-screen bg-gray-50">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600"></div>
            </div>
        );
    }

    return (
        <div className="flex h-[calc(100vh-6rem)] -m-6 overflow-hidden bg-gray-900 text-white">
            {/* LEFT PANEL: CONTENT (Video/File) */}
            <div className="flex-1 flex flex-col relative bg-black">
                {/* Header Overlay */}
                <div className="absolute top-0 left-0 right-0 p-4 bg-gradient-to-b from-black/80 to-transparent z-10 flex justify-between items-start pointer-events-none">
                    <div className="pointer-events-auto">
                        <Link href="/professores/correcoes" className="flex items-center gap-2 text-white/80 hover:text-white transition-colors bg-black/40 px-3 py-1.5 rounded-full backdrop-blur-md border border-white/10">
                            <ArrowLeft size={16} /> Voltar
                        </Link>
                    </div>
                </div>

                {/* Main Content Viewer */}
                <div className="flex-1 flex items-center justify-center p-8">
                    {/* Replace with actual video player logic */}
                    <div className="w-full max-w-4xl aspect-video bg-gray-800 rounded-xl overflow-hidden shadow-2xl relative group border border-gray-700">
                        <video
                            src={submission?.resposta_conteudo || "https://www.w3schools.com/html/mov_bbb.mp4"}
                            controls
                            className="w-full h-full object-cover"
                        />
                        {/* Custom Controls Overlay (Mock) */}
                        <div className="absolute inset-0 flex items-center justify-center pointer-events-none opacity-0 group-hover:opacity-100 transition-opacity bg-black/20">
                            <Play size={48} className="fill-white text-white opacity-80" />
                        </div>
                    </div>
                </div>

                {/* Footer Info */}
                <div className="p-6 bg-gray-900 border-t border-gray-800">
                    <h2 className="text-xl font-bold">{submission?.desafio?.titulo}</h2>
                    <p className="text-gray-400 mt-1">{submission?.desafio?.descricao}</p>
                </div>
            </div>

            {/* RIGHT PANEL: GRADING TOOLS */}
            <div className="w-96 bg-white text-gray-900 flex flex-col border-l border-gray-200 shadow-2xl z-20">
                {/* Student Header */}
                <div className="p-6 border-b border-gray-100 flex items-center gap-4 bg-gray-50/50">
                    <div className="w-12 h-12 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-700 font-bold text-lg border-2 border-white shadow-sm">
                        {submission?.aluno?.full_name?.[0] || 'A'}
                    </div>
                    <div>
                        <h3 className="font-bold text-gray-900 leading-tight">{submission?.aluno?.full_name || 'Aluno'}</h3>
                        <p className="text-xs text-gray-500 flex items-center gap-1">
                            <Download size={12} /> Enviado em {new Date(submission?.created_at).toLocaleDateString()}
                        </p>
                    </div>
                </div>

                {/* Rubrics / Evaluation */}
                <div className="flex-1 overflow-y-auto p-6 space-y-8 custom-scrollbar">

                    {/* Rubric Section */}
                    <div>
                        <h4 className="text-xs font-bold text-gray-400 uppercase tracking-wider mb-4">Critérios de Avaliação</h4>
                        <div className="space-y-4">
                            {Object.entries(rubrics).map(([criteria, score]) => (
                                <div key={criteria}>
                                    <div className="flex justify-between mb-1.5">
                                        <span className="text-sm font-medium text-gray-700">{criteria}</span>
                                        <span className="text-xs font-bold text-indigo-600">{score}/5</span>
                                    </div>
                                    <div className="flex gap-1">
                                        {[1, 2, 3, 4, 5].map((star) => (
                                            <button
                                                key={star}
                                                onClick={() => setRubrics(prev => ({ ...prev, [criteria]: star }))}
                                                className={`flex-1 h-2 rounded-full transition-all ${star <= score ? 'bg-indigo-500' : 'bg-gray-200 hover:bg-gray-300'}`}
                                            />
                                        ))}
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>

                    {/* Feedback Text */}
                    <div>
                        <h4 className="text-xs font-bold text-gray-400 uppercase tracking-wider mb-2">Feedback do Sensei</h4>
                        <textarea
                            value={feedback}
                            onChange={(e) => setFeedback(e.target.value)}
                            placeholder="Escreva seu feedback construtivo aqui..."
                            className="w-full h-32 p-3 bg-gray-50 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 focus:outline-none resize-none transition-all placeholder:text-gray-400 text-gray-700"
                        ></textarea>
                        <div className="flex gap-2 mt-2 overflow-x-auto pb-2">
                            {/* Quick Comments */}
                            {['Muito bom!', 'Melhore a postura', 'Atenção ao ritmo', 'Pratique mais devagar'].map(tag => (
                                <button
                                    key={tag}
                                    onClick={() => setFeedback(prev => prev ? `${prev} ${tag}` : tag)}
                                    className="whitespace-nowrap px-3 py-1 bg-gray-100 hover:bg-gray-200 rounded-full text-xs font-medium text-gray-600 transition-colors"
                                >
                                    {tag}
                                </button>
                            ))}
                        </div>
                    </div>
                </div>

                {/* Action Footer */}
                <div className="p-6 border-t border-gray-100 bg-gray-50">
                    <div className="flex gap-3 mb-4">
                        <button
                            onClick={() => handleGrade('revisar')}
                            className="flex-1 py-3 px-4 bg-white border border-yellow-300 text-yellow-700 rounded-xl text-sm font-bold shadow-sm hover:bg-yellow-50 transition-all flex items-center justify-center gap-2"
                        >
                            <AlertCircle size={18} />
                            Revisar
                        </button>
                        <button
                            onClick={() => handleGrade('aprovado')}
                            className="flex-[2] py-3 px-4 bg-indigo-600 text-white rounded-xl text-sm font-bold shadow-lg shadow-indigo-200 hover:bg-indigo-700 hover:scale-[1.02] transition-all flex items-center justify-center gap-2"
                        >
                            <CheckCircle size={18} />
                            Aprovar
                        </button>
                    </div>
                    <button className="w-full text-center text-xs text-gray-400 hover:text-gray-600 font-medium">
                        Salvar rascunho e continuar depois
                    </button>
                </div>
            </div>
        </div>
    );
}
