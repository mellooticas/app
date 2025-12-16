'use client';

import { supabase } from '@/lib/supabase/client';
import { motion } from 'framer-motion';
import {
    Users,
    BookOpen,
    CheckCircle,
    Calendar,
    Plus,
    GraduationCap,
    Video,
    Music,
    FileText,
    Clock,
    ArrowRight,
    Play
} from 'lucide-react';
import Link from 'next/link';
import { useEffect, useState } from 'react';

interface DashboardStats {
    activeStudents: number;
    activeClasses: number;
    approvalRate: number;
}

interface ClassSession {
    id: string;
    time: string;
    title: string;
    turma: string;
    students: number;
    status: string;
}

const WEEKDAYS = ['domingo', 'segunda', 'terca', 'quarta', 'quinta', 'sexta', 'sabado'];

export function ProfessorDashboardClient() {
    const [stats, setStats] = useState<DashboardStats>({
        activeStudents: 0,
        activeClasses: 0,
        approvalRate: 98 // Placeholder for now as calculation is complex
    });
    const [todayClasses, setTodayClasses] = useState<ClassSession[]>([]);
    const [loading, setLoading] = useState(true);
    const [userName, setUserName] = useState('');

    useEffect(() => {
        const fetchData = async () => {
            try {
                const { data: { user } } = await supabase.auth.getUser();
                if (!user) return;

                // Fetch User Profile Name
                const { data: profile } = await supabase
                    .from('profiles')
                    .select('nome') // Using 'nome' as per SQL investigation
                    .eq('id', user.id)
                    .single();

                if (profile) setUserName(profile.nome || '');

                const { count: studentsCount } = await supabase
                    .from('profiles')
                    .select('*', { count: 'exact', head: true })
                    .eq('tipo_usuario', 'aluno');

                const { data: myTurmas, count: myTurmasCount } = await supabase
                    .from('turmas')
                    .select('*') // Need all fields to parse horarios
                    .eq('professor_id', user.id)
                    .eq('ativo', true);

                setStats(prev => ({
                    ...prev,
                    activeStudents: studentsCount || 0,
                    activeClasses: myTurmasCount || (myTurmas ? myTurmas.length : 0)
                }));

                // Process Today's Classes
                if (myTurmas) {
                    const todayIndex = new Date().getDay();
                    const todaySlug = WEEKDAYS[todayIndex];

                    const sessions: ClassSession[] = [];

                    myTurmas.forEach((turma: any) => {
                        const horarios = turma.horarios; // Assuming it's already a JSON object/array from Supabase client
                        if (Array.isArray(horarios)) {
                            horarios.forEach((h: any) => {
                                if (h.dia === todaySlug) {
                                    sessions.push({
                                        id: turma.id,
                                        time: h.hora_inicio || '00:00',
                                        title: turma.descricao || turma.nome, // Use description or name
                                        turma: turma.nome,
                                        students: turma.capacidade || 0, // Ideally count enrollments
                                        status: 'Confirmado'
                                    });
                                }
                            });
                        }
                    });

                    // Sort by time
                    sessions.sort((a, b) => a.time.localeCompare(b.time));
                    setTodayClasses(sessions);
                }

            } catch (error) {
                console.error('Error fetching dashboard data:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, []);

    const nextClass = todayClasses.length > 0 ? todayClasses[0] : null;

    const container = {
        hidden: { opacity: 0 },
        show: {
            opacity: 1,
            transition: {
                staggerChildren: 0.1
            }
        }
    };

    const item = {
        hidden: { opacity: 0, y: 20 },
        show: { opacity: 1, y: 0 }
    };

    return (
        <div className="space-y-6">
            <motion.h1
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                className="text-2xl font-bold text-gray-900 flex items-center gap-2"
            >
                👋 {loading ? 'Sensei...' : userName ? `Olá, ${userName}` : 'Sensei'}
            </motion.h1>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">

                {/* 1. HERO WIDGET: Next Class (Central de Comando) */}
                <div className="lg:col-span-2">
                    {nextClass ? (
                        <motion.div
                            initial={{ opacity: 0, y: 20 }}
                            animate={{ opacity: 1, y: 0 }}
                            className="bg-gradient-to-br from-indigo-600 to-purple-700 rounded-3xl p-8 text-white shadow-xl relative overflow-hidden h-full flex flex-col justify-between"
                        >
                            {/* Background Elements */}
                            <div className="absolute top-0 right-0 w-64 h-64 bg-white/10 rounded-full -mr-16 -mt-16 blur-3xl"></div>
                            <div className="absolute bottom-0 left-0 w-48 h-48 bg-black/10 rounded-full -ml-10 -mb-10 blur-2xl"></div>

                            <div className="relative z-10">
                                <span className="inline-block px-3 py-1 bg-white/20 backdrop-blur-md rounded-full text-xs font-bold uppercase tracking-wider mb-4 border border-white/10">
                                    Próxima Aula • {nextClass.time}
                                </span>
                                <h2 className="text-4xl font-black mb-2 leading-tight">{nextClass.title}</h2>
                                <p className="text-indigo-100 text-lg flex items-center gap-2 mb-8">
                                    <Users className="w-5 h-5" />
                                    Turma {nextClass.turma} • {nextClass.students} Alunos
                                </p>
                            </div>

                            <div className="relative z-10 flex gap-4">
                                <button className="flex-1 bg-white text-indigo-600 py-4 rounded-xl font-bold text-lg shadow-lg hover:bg-gray-50 hover:scale-[1.02] transition-all flex items-center justify-center gap-2">
                                    <Play className="w-5 h-5 fill-current" />
                                    Iniciar Aula Agora
                                </button>
                                <Link href={`/professores/turmas/${nextClass.id}`} className="px-6 py-4 bg-white/10 backdrop-blur-md border border-white/20 rounded-xl font-bold hover:bg-white/20 transition-all flex items-center justify-center">
                                    Ver Detalhes
                                </Link>
                            </div>
                        </motion.div>
                    ) : (
                        <motion.div
                            initial={{ opacity: 0, y: 20 }}
                            animate={{ opacity: 1, y: 0 }}
                            className="bg-gradient-to-br from-gray-800 to-gray-900 rounded-3xl p-8 text-white shadow-xl relative overflow-hidden h-full flex flex-col justify-center items-center text-center"
                        >
                            <div className="bg-white/10 p-4 rounded-full mb-4">
                                <Calendar className="w-8 h-8 text-white/80" />
                            </div>
                            <h2 className="text-2xl font-bold mb-2">Sem aulas hoje</h2>
                            <p className="text-gray-400 max-w-md">
                                Aproveite o dia para preparar conteúdos ou corrigir atividades pendentes.
                            </p>
                        </motion.div>
                    )}
                </div>

                {/* 2. ACTIONABLE CARDS: Speed Grader Lite (Correções) */}
                <div className="bg-white rounded-3xl border border-gray-100 shadow-sm p-6 flex flex-col h-full">
                    <div className="flex items-center justify-between mb-6">
                        <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
                            <CheckCircle className="w-5 h-5 text-green-500" />
                            Correções
                        </h2>
                        <span className="bg-red-100 text-red-600 text-xs font-bold px-2 py-1 rounded-full">4 Pendentes</span>
                    </div>

                    <div className="flex-1 space-y-4 overflow-y-auto pr-2 custom-scrollbar">
                        {[1, 2, 3, 4].map((i) => (
                            <div key={i} className="flex gap-3 p-3 hover:bg-gray-50 rounded-xl transition-all cursor-pointer group border border-transparent hover:border-gray-100">
                                <div className="w-10 h-10 rounded-full bg-gray-200 flex-shrink-0 overflow-hidden relative">
                                    {/* Mock Avatar */}
                                    <div className="absolute inset-0 bg-gradient-to-tr from-gray-300 to-gray-100"></div>
                                    <span className="absolute inset-0 flex items-center justify-center font-bold text-gray-500 text-xs">
                                        AL
                                    </span>
                                </div>
                                <div className="flex-1 min-w-0">
                                    <div className="flex justify-between items-start">
                                        <h3 className="font-bold text-gray-900 text-sm truncate">Aluno Exemplo {i}</h3>
                                        <span className="text-[10px] text-gray-400 font-medium">2h atrás</span>
                                    </div>
                                    <p className="text-xs text-gray-500 truncate mb-2">Exercício de Hiragana Básico</p>

                                    <div className="flex gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
                                        <button className="flex-1 bg-green-50 text-green-700 text-[10px] font-bold py-1.5 rounded hover:bg-green-100 transition-colors">
                                            Aprovar
                                        </button>
                                        <button className="flex-1 bg-indigo-50 text-indigo-700 text-[10px] font-bold py-1.5 rounded hover:bg-indigo-100 transition-colors">
                                            Ver Vídeo
                                        </button>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                    <Link href="/professores/correcoes" className="mt-4 w-full py-3 text-center text-sm font-bold text-gray-500 border-t border-gray-100 hover:text-indigo-600 transition-colors">
                        Ver todas as correções
                    </Link>
                </div>
            </div>

            {/* 3. ROW 2: Essential Tools (Quick Access) */}
            <h2 className="text-lg font-bold text-gray-900 mt-8 mb-4">Acesso Rápido</h2>
            <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
                <Link href="/professores/gamificacao" className="group">
                    <div className="bg-white p-4 rounded-2xl border border-gray-100 shadow-sm hover:shadow-md hover:border-yellow-200 transition-all text-center h-full flex flex-col items-center justify-center gap-3">
                        <div className="w-12 h-12 bg-yellow-50 rounded-full flex items-center justify-center group-hover:scale-110 transition-transform">
                            <span className="text-2xl">🏆</span>
                        </div>
                        <div>
                            <h3 className="font-bold text-gray-900">Gamificação</h3>
                            <p className="text-xs text-gray-500">Rankings e XP</p>
                        </div>
                    </div>
                </Link>

                <Link href="/professores/repertorio" className="group">
                    <div className="bg-white p-4 rounded-2xl border border-gray-100 shadow-sm hover:shadow-md hover:border-pink-200 transition-all text-center h-full flex flex-col items-center justify-center gap-3">
                        <div className="w-12 h-12 bg-pink-50 rounded-full flex items-center justify-center group-hover:scale-110 transition-transform">
                            <Music className="w-6 h-6 text-pink-500" />
                        </div>
                        <div>
                            <h3 className="font-bold text-gray-900">Repertório</h3>
                            <p className="text-xs text-gray-500">Partituras e Cifras</p>
                        </div>
                    </div>
                </Link>

                <Link href="/professores/aulas/nova" className="group">
                    <div className="bg-white p-4 rounded-2xl border border-gray-100 shadow-sm hover:shadow-md hover:border-blue-200 transition-all text-center h-full flex flex-col items-center justify-center gap-3">
                        <div className="w-12 h-12 bg-blue-50 rounded-full flex items-center justify-center group-hover:scale-110 transition-transform">
                            <Video className="w-6 h-6 text-blue-500" />
                        </div>
                        <div>
                            <h3 className="font-bold text-gray-900">Nova Aula</h3>
                            <p className="text-xs text-gray-500">Criar Conteúdo</p>
                        </div>
                    </div>
                </Link>

                <Link href="/professores/turmas" className="group">
                    <div className="bg-white p-4 rounded-2xl border border-gray-100 shadow-sm hover:shadow-md hover:border-cyan-200 transition-all text-center h-full flex flex-col items-center justify-center gap-3">
                        <div className="w-12 h-12 bg-cyan-50 rounded-full flex items-center justify-center group-hover:scale-110 transition-transform">
                            <Users className="w-6 h-6 text-cyan-500" />
                        </div>
                        <div>
                            <h3 className="font-bold text-gray-900">Minhas Turmas</h3>
                            <p className="text-xs text-gray-500">Alunos e Notas</p>
                        </div>
                    </div>
                </Link>
            </div>

            {/* 4. UPCOMING SCHEDULE LIST (Simplified) */}
            {todayClasses.length > 1 && (
                <div className="mt-8">
                    <div className="flex items-center justify-between mb-4">
                        <h2 className="text-lg font-bold text-gray-900">Restante do Dia</h2>
                        <Link href="/professores/agenda" className="text-sm font-bold text-indigo-600 hover:underline">Ver agenda completa</Link>
                    </div>
                    <div className="space-y-3">
                        {todayClasses.slice(1).map((aula, idx) => (
                            <div key={idx} className="flex items-center gap-4 p-4 bg-white rounded-xl border border-gray-100">
                                <span className="font-bold text-gray-500 w-16 text-center">{aula.time}</span>
                                <div className="h-8 w-[1px] bg-gray-100"></div>
                                <div>
                                    <h3 className="font-bold text-gray-900">{aula.title}</h3>
                                    <p className="text-xs text-gray-500">Turma {aula.turma}</p>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            )}

        </div>
    );
}
