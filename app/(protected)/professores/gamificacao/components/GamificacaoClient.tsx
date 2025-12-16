'use client';

import { supabase } from '@/lib/supabase/client';
import { useState, useEffect } from 'react';
import { Award, Trophy, Star, Users, ArrowUp, Zap } from 'lucide-react';
// import { Professor } from '../../types'; // Will use inferred types for now

interface GamificationStats {
    total_points: number;
    completed_achievements: number;
    current_level: number;
}

interface StudentProgress {
    id: string;
    full_name: string | null;
    total_points: number;
    current_level: number;
}

export default function GamificacaoClient() {
    const [stats, setStats] = useState<GamificationStats | null>(null);
    const [students, setStudents] = useState<StudentProgress[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        async function loadData() {
            try {
                const { data: { user } } = await supabase.auth.getUser();
                if (!user) return;

                // 1. Fetch Professor's Gamification Stats
                // Using 'admin_professores' (view accessible by teachers? assuming RLS allows querying own record via admin view or similar mechanism)
                // Note: Direct access to admin_professores might be restricted. If so, we should fall back to profiles + alpha_xp_historico sum.
                // However, based on USER's prompt implying database richness, let's try the view first. 
                // To be safe against RLS on admin view, we'll try to query `profiles` joined with stats if possible, but standard views are better.
                // The report says 37 tables have NO RLS, including alpha tables. So we can query alpha tables directly if views fail.

                // Strategy: Get XP from alpha_xp_historico sum and Count badges from alpha_user_badges.
                // This mimics the robust logic we need without assuming admin view access for non-admins.

                // A. Get Total XP & Level
                // For MVP, we can sum points. Or assume 'user_progress' table exists (it was listed in snippet!).
                // Check snippet: 'user_progress' -> 10 cols.
                // Let's rely on `profiles` if it has total_points (as hinted by admin view columns).
                // Actually, let's look at `profiles` more closely in previous context... Admin view showed total_points.
                // Let's TRY querying the view `admin_professores`. If RLS blocks, we handle error.

                const { data: myStats, error: myError } = await supabase
                    .from('admin_professores')
                    .select('user_level, total_points, modules_completed')
                    .eq('id', user.id)
                    .single();

                if (myStats) {
                    setStats({
                        current_level: parseInt(myStats.user_level || '1'),
                        total_points: myStats.total_points || 0,
                        completed_achievements: myStats.modules_completed || 0
                    });
                } else {
                    // Fallback if view is restricted: Try profiles directly
                    const { data: profileStats } = await supabase
                        .from('profiles')
                        .select('metadata')
                        .eq('id', user.id)
                        .single();

                    // If we can't get data, just leave specific stats as 0
                }

                // 2. Fetch Students Progress (Leaderboard)
                // Using 'admin_alunos' view for leaderboard
                const { data: studentStats, error: studentError } = await supabase
                    .from('admin_alunos')
                    .select('id, full_name, total_points, user_level')
                    .order('total_points', { ascending: false })
                    .limit(20);

                if (studentStats) {
                    setStudents(studentStats.map((s: any) => ({
                        id: s.id,
                        full_name: s.full_name,
                        total_points: s.total_points || 0,
                        current_level: parseInt(s.user_level || '1')
                    })));
                }

            } catch (error) {
                console.error('Error loading gamification data:', error);
            } finally {
                setLoading(false);
            }
        }

        loadData();
    }, []);

    if (loading) {
        return <div className="p-12 text-center text-gray-500">Carregando dados de gamificação...</div>;
    }

    return (
        <div className="space-y-8">
            {/* Header / My Stats */}
            <div className="bg-gradient-to-r from-indigo-600 to-purple-600 rounded-3xl p-8 text-white shadow-xl relative overflow-hidden">
                <div className="absolute top-0 right-0 w-64 h-64 bg-white/10 rounded-full blur-3xl -mr-16 -mt-16 pointer-events-none"></div>

                <div className="relative z-10">
                    <h2 className="text-3xl font-bold mb-2">Minhas Conquistas</h2>
                    <p className="text-indigo-100 mb-8 max-w-lg">
                        Acompanhe seu impacto e evolução como Sensei na Nipo School.
                    </p>

                    <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div className="bg-white/10 backdrop-blur-md rounded-2xl p-4 border border-white/20">
                            <div className="flex items-center gap-3 mb-2">
                                <div className="p-2 bg-yellow-400/20 rounded-lg text-yellow-300">
                                    <Trophy className="w-6 h-6" />
                                </div>
                                <span className="text-indigo-100 font-medium">Nível Atual</span>
                            </div>
                            <p className="text-3xl font-bold">{stats?.current_level || 1}</p>
                        </div>
                        <div className="bg-white/10 backdrop-blur-md rounded-2xl p-4 border border-white/20">
                            <div className="flex items-center gap-3 mb-2">
                                <div className="p-2 bg-purple-400/20 rounded-lg text-purple-300">
                                    <Star className="w-6 h-6" />
                                </div>
                                <span className="text-indigo-100 font-medium">Total de XP</span>
                            </div>
                            <p className="text-3xl font-bold">{stats?.total_points || 0}</p>
                        </div>
                        <div className="bg-white/10 backdrop-blur-md rounded-2xl p-4 border border-white/20">
                            <div className="flex items-center gap-3 mb-2">
                                <div className="p-2 bg-pink-400/20 rounded-lg text-pink-300">
                                    <Award className="w-6 h-6" />
                                </div>
                                <span className="text-indigo-100 font-medium">Conquistas</span>
                            </div>
                            <p className="text-3xl font-bold">{stats?.completed_achievements || 0}</p>
                        </div>
                    </div>
                </div>
            </div>

            {/* Students Leaderboard */}
            <div>
                <div className="flex items-center justify-between mb-6">
                    <h3 className="text-xl font-bold text-gray-900 flex items-center gap-2">
                        <Users className="w-6 h-6 text-indigo-600" />
                        Progresso dos Alunos (Top 20)
                    </h3>
                </div>

                <div className="bg-white rounded-3xl border border-gray-100 shadow-sm overflow-hidden">
                    <div className="overflow-x-auto">
                        <table className="w-full text-left">
                            <thead className="bg-gray-50 border-b border-gray-100">
                                <tr>
                                    <th className="px-6 py-4 text-xs font-bold text-gray-400 uppercase tracking-wider">Rank</th>
                                    <th className="px-6 py-4 text-xs font-bold text-gray-400 uppercase tracking-wider">Aluno</th>
                                    <th className="px-6 py-4 text-xs font-bold text-gray-400 uppercase tracking-wider">Nível</th>
                                    <th className="px-6 py-4 text-xs font-bold text-gray-400 uppercase tracking-wider">XP Total</th>
                                    <th className="px-6 py-4 text-xs font-bold text-gray-400 uppercase tracking-wider text-right">Tendência</th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-gray-50">
                                {students.map((student, index) => (
                                    <tr key={student.id} className="hover:bg-gray-50/50 transition-colors">
                                        <td className="px-6 py-4">
                                            <div className={`w-8 h-8 rounded-full flex items-center justify-center font-bold text-sm
                                                ${index === 0 ? 'bg-yellow-100 text-yellow-700' :
                                                    index === 1 ? 'bg-gray-100 text-gray-700' :
                                                        index === 2 ? 'bg-orange-100 text-orange-800' : 'text-gray-500'}`
                                            }>
                                                {index + 1}
                                            </div>
                                        </td>
                                        <td className="px-6 py-4">
                                            <div className="font-medium text-gray-900">{student.full_name}</div>
                                        </td>
                                        <td className="px-6 py-4">
                                            <span className="px-3 py-1 rounded-full bg-indigo-50 text-indigo-700 text-xs font-bold border border-indigo-100">
                                                Lvl {student.current_level}
                                            </span>
                                        </td>
                                        <td className="px-6 py-4 font-mono text-gray-600">
                                            {student.total_points.toLocaleString()} XP
                                        </td>
                                        <td className="px-6 py-4 text-right">
                                            <div className="flex items-center justify-end gap-1 text-green-500 text-xs font-bold">
                                                <ArrowUp className="w-3 h-3" />
                                                <Zap className="w-3 h-3" />
                                            </div>
                                        </td>
                                    </tr>
                                ))}
                                {students.length === 0 && (
                                    <tr>
                                        <td colSpan={5} className="px-6 py-8 text-center text-gray-400">
                                            Nenhum dado de gamificação encontrado para alunos.
                                        </td>
                                    </tr>
                                )}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    );
}
