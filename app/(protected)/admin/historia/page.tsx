'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { BookOpen, Plus, Clock, Users, Music, Download, TrendingUp, Library, Sparkles, Calendar, Eye } from 'lucide-react';
import AdminPageLayout from '../_components/AdminPageLayout';
import { StatsCard, StatsGrid } from '../_components/StatsCard';
import { motion } from 'framer-motion';

export default function HistoriaMusicaPage() {
    const [periodos, setPeriodos] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        async function loadPeriodos() {
            try {
                const response = await fetch('/api/historia/periodos');
                const data = await response.json();
                setPeriodos(data);
            } catch (error) {
                console.error('Erro ao carregar períodos:', error);
            } finally {
                setLoading(false);
            }
        }
        loadPeriodos();
    }, []);

    if (loading) {
        return (
            <AdminPageLayout title="História da Música" icon={BookOpen}>
                <div className="admin-card p-8 text-center">
                    <p className="text-slate-600">Carregando...</p>
                </div>
            </AdminPageLayout>
        );
    }

    // Métricas executivas
    const totalCompositores = periodos.reduce((acc: number, p: any) => acc + (p.compositores?.[0]?.count || 0), 0);
    const totalObras = periodos.reduce((acc: number, p: any) => acc + (p.obras?.[0]?.count || 0), 0);
    const periodosAtivos = periodos.filter((p: any) => p.ativo).length;

    return (
        <AdminPageLayout
            title="História da Música"
            subtitle="Explore e gerencie a jornada musical através dos séculos"
            icon={BookOpen}
            badge={`${periodos.length} períodos`}
            actions={
                <>
                    <button className="px-4 py-2 bg-slate-100 text-slate-700 rounded-lg text-sm font-medium hover:bg-slate-200 transition-colors flex items-center gap-2">
                        <Download className="w-4 h-4" />
                        Exportar
                    </button>
                    <Link href="/admin/historia/timeline" className="px-4 py-2 bg-purple-50 text-purple-700 rounded-lg text-sm font-medium hover:bg-purple-100 transition-colors flex items-center gap-2 border border-purple-200">
                        <Clock className="w-4 h-4" />
                        Ver Timeline
                    </Link>
                    <Link href="/admin/historia/novo-periodo" className="admin-btn-primary flex items-center gap-2">
                        <Plus className="w-4 h-4" />
                        Novo Período
                    </Link>
                </>
            }
        >
            {/* KPIs Executivos - História da Música */}
            <StatsGrid cols={4}>
                <StatsCard
                    title="Períodos Históricos"
                    value={periodos.length}
                    icon={Calendar}
                    color="purple"
                    subtitle={`${periodosAtivos} ativos`}
                />
                <StatsCard
                    title="Total de Compositores"
                    value={totalCompositores}
                    icon={Users}
                    color="indigo"
                    trend={{ value: 12, isPositive: true }}
                    subtitle="Biografias catalogadas"
                />
                <StatsCard
                    title="Obras Musicais"
                    value={totalObras}
                    icon={Music}
                    color="blue"
                    trend={{ value: 8, isPositive: true }}
                    subtitle="Acervo completo"
                />
                <StatsCard
                    title="Biblioteca Digital"
                    value={`${Math.round((totalObras / (totalObras + 100)) * 100)}%`}
                    icon={Library}
                    color="emerald"
                    subtitle="Catalogação concluída"
                />
            </StatsGrid>

            {/* Atalhos Rápidos - Design Moderno */}
            <div className="mt-8 grid grid-cols-1 md:grid-cols-3 gap-5">
                <Link href="/admin/historia/compositores" className="group relative overflow-hidden">
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="admin-card p-6 hover:shadow-lg transition-all duration-300 relative overflow-hidden"
                    >
                        <div className="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-purple-500/10 to-transparent rounded-bl-full -mr-10 -mt-10 transition-transform group-hover:scale-110"></div>
                        <div className="relative z-10">
                            <div className="flex items-start justify-between mb-4">
                                <div className="p-3 bg-purple-50 text-purple-600 rounded-lg border border-purple-100 shadow-sm group-hover:scale-110 transition-transform">
                                    <Users className="w-6 h-6" strokeWidth={2} />
                                </div>
                                <span className="text-2xl font-bold text-slate-900">{totalCompositores}</span>
                            </div>
                            <h3 className="text-lg font-bold text-slate-900 mb-1 group-hover:text-purple-700 transition-colors">Compositores</h3>
                            <p className="text-sm text-slate-500">Gerenciar biografias e perfis históricos</p>
                        </div>
                    </motion.div>
                </Link>

                <Link href="/admin/historia/obras" className="group relative overflow-hidden">
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.1 }}
                        className="admin-card p-6 hover:shadow-lg transition-all duration-300 relative overflow-hidden"
                    >
                        <div className="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-blue-500/10 to-transparent rounded-bl-full -mr-10 -mt-10 transition-transform group-hover:scale-110"></div>
                        <div className="relative z-10">
                            <div className="flex items-start justify-between mb-4">
                                <div className="p-3 bg-blue-50 text-blue-600 rounded-lg border border-blue-100 shadow-sm group-hover:scale-110 transition-transform">
                                    <Music className="w-6 h-6" strokeWidth={2} />
                                </div>
                                <span className="text-2xl font-bold text-slate-900">{totalObras}</span>
                            </div>
                            <h3 className="text-lg font-bold text-slate-900 mb-1 group-hover:text-blue-700 transition-colors">Obras Musicais</h3>
                            <p className="text-sm text-slate-500">Catálogo completo com áudios e partituras</p>
                        </div>
                    </motion.div>
                </Link>

                <Link href="/admin/historia/timeline" className="group relative overflow-hidden">
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.2 }}
                        className="admin-card p-6 hover:shadow-lg transition-all duration-300 relative overflow-hidden"
                    >
                        <div className="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-amber-500/10 to-transparent rounded-bl-full -mr-10 -mt-10 transition-transform group-hover:scale-110"></div>
                        <div className="relative z-10">
                            <div className="flex items-start justify-between mb-4">
                                <div className="p-3 bg-amber-50 text-amber-600 rounded-lg border border-amber-100 shadow-sm group-hover:scale-110 transition-transform">
                                    <Clock className="w-6 h-6" strokeWidth={2} />
                                </div>
                                <Sparkles className="w-5 h-5 text-amber-500" />
                            </div>
                            <h3 className="text-lg font-bold text-slate-900 mb-1 group-hover:text-amber-700 transition-colors">Linha do Tempo</h3>
                            <p className="text-sm text-slate-500">Viagem interativa através dos séculos</p>
                        </div>
                    </motion.div>
                </Link>
            </div>

            {/* Timeline Moderna de Períodos */}
            <div className="mt-12">
                <div className="flex items-center justify-between mb-6">
                    <h2 className="text-2xl font-bold text-slate-900">Períodos Históricos</h2>
                    <span className="text-sm text-slate-500 font-medium">{periodos.length} períodos catalogados</span>
                </div>

                {periodos.length > 0 ? (
                    <div className="relative">
                        {/* Linha do tempo vertical */}
                        <div className="absolute left-8 top-0 bottom-0 w-0.5 bg-gradient-to-b from-purple-200 via-blue-200 to-purple-200 hidden lg:block"></div>

                        <div className="space-y-6">
                            {periodos.map((periodo: any, index: number) => (
                                <motion.div
                                    key={periodo.id}
                                    initial={{ opacity: 0, x: -20 }}
                                    animate={{ opacity: 1, x: 0 }}
                                    transition={{ delay: index * 0.1 }}
                                    className="relative"
                                >
                                    {/* Timeline dot */}
                                    <div className="absolute left-8 top-8 w-4 h-4 rounded-full bg-white border-4 border-purple-500 shadow-lg hidden lg:block z-10"></div>

                                    <div className="lg:ml-20 group">
                                        <div className="admin-card overflow-hidden hover:shadow-lg transition-all duration-300">
                                            <div className="flex flex-col md:flex-row">
                                                {/* Imagem/Cor do Período */}
                                                <div
                                                    className="w-full md:w-48 h-48 md:h-auto relative flex-shrink-0"
                                                    style={{ backgroundColor: periodo.cor_tematica || '#e5e7eb' }}
                                                >
                                                    {periodo.imagem_capa && (
                                                        <img src={periodo.imagem_capa} alt={periodo.nome} className="w-full h-full object-cover mix-blend-overlay opacity-50" />
                                                    )}
                                                    <div className="absolute inset-0 bg-gradient-to-br from-black/20 to-transparent"></div>
                                                    <div className="absolute top-4 left-4 bg-white/95 backdrop-blur px-3 py-1.5 rounded-lg shadow-lg">
                                                        <p className="text-xs text-slate-600 font-medium">Período</p>
                                                        <p className="text-sm font-bold text-slate-900">{periodo.data_inicio} - {periodo.data_fim || 'Presente'}</p>
                                                    </div>
                                                    {periodo.ativo && (
                                                        <div className="absolute bottom-4 right-4 flex items-center gap-1.5 bg-emerald-500 text-white px-2.5 py-1 rounded-full text-xs font-semibold shadow-lg">
                                                            <span className="w-1.5 h-1.5 bg-white rounded-full animate-pulse"></span>
                                                            Ativo
                                                        </div>
                                                    )}
                                                </div>

                                                {/* Conteúdo do Card */}
                                                <div className="flex-1 p-6">
                                                    <div className="flex items-start justify-between mb-3">
                                                        <div>
                                                            <h3 className="text-2xl font-bold text-slate-900 mb-2 group-hover:text-purple-700 transition-colors">
                                                                {periodo.nome}
                                                            </h3>
                                                            <p className="text-slate-600 text-sm leading-relaxed line-clamp-2">
                                                                {periodo.descricao || 'Sem descrição disponível.'}
                                                            </p>
                                                        </div>
                                                    </div>

                                                    {/* Métricas do Período */}
                                                    <div className="flex flex-wrap gap-4 mt-6 mb-6">
                                                        <div className="flex items-center gap-2 px-3 py-2 bg-purple-50 rounded-lg border border-purple-100">
                                                            <Users className="w-4 h-4 text-purple-600" strokeWidth={2} />
                                                            <span className="text-sm font-semibold text-slate-900">{periodo.compositores?.[0]?.count || 0}</span>
                                                            <span className="text-xs text-slate-600">compositores</span>
                                                        </div>
                                                        <div className="flex items-center gap-2 px-3 py-2 bg-blue-50 rounded-lg border border-blue-100">
                                                            <Music className="w-4 h-4 text-blue-600" strokeWidth={2} />
                                                            <span className="text-sm font-semibold text-slate-900">{periodo.obras?.[0]?.count || 0}</span>
                                                            <span className="text-xs text-slate-600">obras</span>
                                                        </div>
                                                    </div>

                                                    {/* Ações */}
                                                    <div className="flex gap-3 pt-4 border-t border-slate-100">
                                                        <Link
                                                            href={`/admin/historia/periodos/${periodo.id}`}
                                                            className="flex-1 text-center px-4 py-2.5 bg-purple-50 text-purple-700 font-semibold rounded-lg hover:bg-purple-100 transition-colors text-sm border border-purple-200 flex items-center justify-center gap-2"
                                                        >
                                                            <Eye className="w-4 h-4" strokeWidth={2} />
                                                            Gerenciar Período
                                                        </Link>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </motion.div>
                            ))}
                        </div>
                    </div>
                ) : (
                    <motion.div
                        initial={{ opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        className="admin-card p-16 text-center border-dashed"
                    >
                        <div className="w-20 h-20 bg-slate-50 rounded-full flex items-center justify-center mx-auto mb-4">
                            <BookOpen className="w-10 h-10 text-slate-300" strokeWidth={1.5} />
                        </div>
                        <h3 className="text-xl font-bold text-slate-900 mb-2">Nenhum período cadastrado</h3>
                        <p className="text-slate-500 mb-6 max-w-md mx-auto">Comece sua jornada histórica cadastrando os períodos musicais como Barroco, Clássico, Romântico, entre outros.</p>
                        <Link href="/admin/historia/novo-periodo" className="inline-flex items-center gap-2 px-6 py-3 bg-purple-600 text-white rounded-lg font-semibold hover:bg-purple-700 transition-colors shadow-sm">
                            <Plus className="w-5 h-5" />
                            Cadastrar Primeiro Período
                        </Link>
                    </motion.div>
                )}
            </div>
        </AdminPageLayout>
    );
}
