'use client';

import { useEffect, useState } from 'react';
import { Music2, Plus, Download, FileMusic, TrendingUp, Award, Disc } from 'lucide-react';
import Link from 'next/link';
import AdminPageLayout from '../_components/AdminPageLayout';
import { StatsCard, StatsGrid } from '../_components/StatsCard';
import { ViewToggle, useViewMode } from '../_components/ViewToggle';
import { Pagination, usePagination } from '../_components/Pagination';
import { RepertorioList } from './_components/RepertorioList';
import { motion } from 'framer-motion';

export default function AdminRepertorioPage() {
    const [repertorio, setRepertorio] = useState([]);
    const [loading, setLoading] = useState(true);
    const [viewMode, setViewMode] = useViewMode('admin-repertorio-view', 'table');

    const {
        currentPage,
        setCurrentPage,
        itemsPerPage,
        setItemsPerPage,
        totalPages,
        getPaginatedItems,
    } = usePagination(repertorio.length, 12);

    useEffect(() => {
        async function loadRepertorio() {
            try {
                const response = await fetch('/api/repertorio');
                const data = await response.json();
                setRepertorio(data);
            } catch (error) {
                console.error('Erro ao carregar repertório:', error);
            } finally {
                setLoading(false);
            }
        }
        loadRepertorio();
    }, []);

    if (loading) {
        return (
            <AdminPageLayout title="Gestão de Repertório" icon={Music2}>
                <div className="admin-card p-8 text-center">
                    <p className="text-slate-600">Carregando...</p>
                </div>
            </AdminPageLayout>
        );
    }

    // Métricas executivas
    const totalMusicas = repertorio.length;
    const musicasAtivas = repertorio.filter((m: any) => m.ativo).length;
    const comPartituras = repertorio.filter((m: any) => m.partitura_url).length;
    const comRecursos = repertorio.filter((m: any) =>
        m.partitura_url || m.letra_url || m.playback_url || m.video_tutorial_url
    ).length;

    // Dados paginados
    const paginatedRepertorio = getPaginatedItems(repertorio);

    return (
        <AdminPageLayout
            title="Gestão de Repertório"
            subtitle="Acervo completo de músicas, partituras e materiais didáticos"
            icon={Music2}
            badge={`${totalMusicas} ${totalMusicas === 1 ? 'música' : 'músicas'}`}
            actions={
                <>
                    <ViewToggle
                        currentView={viewMode}
                        onViewChange={setViewMode}
                        storageKey="admin-repertorio-view"
                    />
                    <button className="px-4 py-2 bg-slate-100 text-slate-700 rounded-lg text-sm font-medium hover:bg-slate-200 transition-colors flex items-center gap-2">
                        <Download className="w-4 h-4" />
                        Exportar
                    </button>
                    <Link href="/admin/repertorio/nova" className="admin-btn-primary flex items-center gap-2">
                        <Plus className="w-4 h-4" />
                        Nova Música
                    </Link>
                </>
            }
        >
            {/* KPIs Executivos - Repertório */}
            <StatsGrid cols={4}>
                <StatsCard
                    title="Total de Músicas"
                    value={totalMusicas}
                    icon={Music2}
                    color="purple"
                    subtitle={`${musicasAtivas} ativas`}
                />
                <StatsCard
                    title="Com Partituras"
                    value={comPartituras}
                    icon={FileMusic}
                    color="blue"
                    trend={{ value: 15, isPositive: true }}
                    subtitle="PDFs disponíveis"
                />
                <StatsCard
                    title="Recursos Completos"
                    value={comRecursos}
                    icon={Disc}
                    color="emerald"
                    subtitle="Com materiais anexados"
                />
                <StatsCard
                    title="Taxa de Completude"
                    value={`${Math.round((comRecursos / totalMusicas) * 100)}%`}
                    icon={Award}
                    color="orange"
                    trend={{ value: 8, isPositive: true }}
                    subtitle="Catálogo completo"
                />
            </StatsGrid>

            {/* Visualizações do Repertório */}
            <div className="mt-8">
                {viewMode === 'table' && (
                    <div className="space-y-5">
                        <RepertorioList repertorio={paginatedRepertorio} />
                        <div className="admin-card p-0 overflow-hidden">
                            <Pagination
                                currentPage={currentPage}
                                totalPages={totalPages}
                                totalItems={totalMusicas}
                                itemsPerPage={itemsPerPage}
                                onPageChange={setCurrentPage}
                                onItemsPerPageChange={setItemsPerPage}
                            />
                        </div>
                    </div>
                )}

                {viewMode === 'cards' && (
                    <>
                        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
                            {paginatedRepertorio.map((musica: any) => (
                                <motion.div
                                    key={musica.id}
                                    initial={{ opacity: 0, y: 20 }}
                                    animate={{ opacity: 1, y: 0 }}
                                    className="group bg-white rounded-xl p-6 shadow-sm border border-slate-200/80 hover:shadow-lg hover:border-purple-200 transition-all duration-300 relative overflow-hidden"
                                >
                                    {/* Gradiente decorativo */}
                                    <div className="absolute top-0 right-0 w-24 h-24 bg-gradient-to-br from-purple-500/10 to-transparent rounded-bl-full -mr-8 -mt-8"></div>

                                    <div className="relative z-10">
                                        <div className="flex items-start gap-4 mb-4">
                                            <div className="w-14 h-14 rounded-xl bg-gradient-to-br from-purple-100 to-purple-50 flex items-center justify-center text-purple-600 text-2xl border-2 border-purple-200 overflow-hidden shadow-sm flex-shrink-0 group-hover:scale-110 transition-transform">
                                                <Music2 className="w-7 h-7" strokeWidth={2} />
                                            </div>
                                            <div className="flex-1 min-w-0">
                                                <h3 className="font-bold text-slate-900 text-lg mb-1 truncate group-hover:text-purple-700 transition-colors">
                                                    {musica.titulo}
                                                </h3>
                                                <p className="text-sm text-slate-500 truncate">{musica.compositor || 'Compositor desconhecido'}</p>
                                            </div>
                                        </div>

                                        <div className="space-y-2.5 mb-4">
                                            <div className="flex items-center justify-between">
                                                <span className="text-xs text-slate-500 font-medium">Categoria:</span>
                                                <span className="inline-flex items-center px-2.5 py-1 rounded-lg text-xs font-semibold bg-slate-100 text-slate-700 border border-slate-200">
                                                    {musica.categoria?.nome || 'Geral'}
                                                </span>
                                            </div>
                                            <div className="flex items-center justify-between">
                                                <span className="text-xs text-slate-500 font-medium">Nível:</span>
                                                <span className={`inline-flex items-center px-2.5 py-1 rounded-lg text-xs font-semibold ${
                                                    musica.nivel_dificuldade === 'avançado' ? 'bg-red-50 text-red-700 border border-red-200' :
                                                    musica.nivel_dificuldade === 'intermediário' ? 'bg-orange-50 text-orange-700 border border-orange-200' :
                                                    'bg-emerald-50 text-emerald-700 border border-emerald-200'
                                                }`}>
                                                    {musica.nivel_dificuldade || 'Iniciante'}
                                                </span>
                                            </div>
                                        </div>

                                        {/* Recursos disponíveis */}
                                        <div className="flex flex-wrap gap-2 mb-4">
                                            {musica.partitura_url && (
                                                <span className="px-2 py-1 bg-blue-50 text-blue-700 rounded text-xs font-semibold border border-blue-200">Partitura</span>
                                            )}
                                            {musica.letra_url && (
                                                <span className="px-2 py-1 bg-yellow-50 text-yellow-700 rounded text-xs font-semibold border border-yellow-200">Letra</span>
                                            )}
                                            {musica.playback_url && (
                                                <span className="px-2 py-1 bg-pink-50 text-pink-700 rounded text-xs font-semibold border border-pink-200">Playback</span>
                                            )}
                                            {musica.video_tutorial_url && (
                                                <span className="px-2 py-1 bg-red-50 text-red-700 rounded text-xs font-semibold border border-red-200">Vídeo</span>
                                            )}
                                        </div>

                                        <div className="pt-3 border-t border-slate-100 flex items-center justify-between">
                                            <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-semibold ${
                                                musica.ativo
                                                    ? 'bg-emerald-50 text-emerald-700 border border-emerald-200'
                                                    : 'bg-slate-100 text-slate-600 border border-slate-200'
                                            }`}>
                                                {musica.ativo ? 'Ativo' : 'Inativo'}
                                            </span>
                                            <Link
                                                href={`/admin/repertorio/${musica.id}`}
                                                className="px-3 py-1.5 bg-purple-50 text-purple-600 rounded-lg text-xs font-semibold hover:bg-purple-100 transition-colors border border-purple-200"
                                            >
                                                Ver Detalhes
                                            </Link>
                                        </div>
                                    </div>
                                </motion.div>
                            ))}
                        </div>
                        <div className="admin-card p-0 overflow-hidden mt-5">
                            <Pagination
                                currentPage={currentPage}
                                totalPages={totalPages}
                                totalItems={totalMusicas}
                                itemsPerPage={itemsPerPage}
                                onPageChange={setCurrentPage}
                                onItemsPerPageChange={setItemsPerPage}
                            />
                        </div>
                    </>
                )}

                {viewMode === 'grid' && (
                    <>
                        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-4">
                            {paginatedRepertorio.map((musica: any) => (
                                <motion.div
                                    key={musica.id}
                                    initial={{ opacity: 0, scale: 0.9 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    className="group bg-white rounded-xl p-4 shadow-sm border border-slate-200/80 hover:shadow-lg hover:border-purple-200 transition-all duration-300 text-center"
                                >
                                    <Link href={`/admin/repertorio/${musica.id}`} className="block">
                                        <div className="w-16 h-16 mx-auto rounded-xl bg-gradient-to-br from-purple-100 to-purple-50 flex items-center justify-center text-purple-600 border-2 border-purple-200 overflow-hidden shadow-sm mb-3 group-hover:scale-110 transition-transform">
                                            <Music2 className="w-8 h-8" strokeWidth={2} />
                                        </div>
                                        <h3 className="font-semibold text-slate-900 text-sm mb-1 truncate group-hover:text-purple-700 transition-colors">
                                            {musica.titulo}
                                        </h3>
                                        <p className="text-xs text-slate-500 truncate mb-2">{musica.compositor || '-'}</p>
                                        <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-semibold ${
                                            musica.ativo
                                                ? 'bg-emerald-50 text-emerald-700 border border-emerald-200'
                                                : 'bg-slate-100 text-slate-600 border border-slate-200'
                                        }`}>
                                            {musica.ativo ? 'Ativo' : 'Inativo'}
                                        </span>
                                    </Link>
                                </motion.div>
                            ))}
                        </div>
                        <div className="admin-card p-0 overflow-hidden mt-5">
                            <Pagination
                                currentPage={currentPage}
                                totalPages={totalPages}
                                totalItems={totalMusicas}
                                itemsPerPage={itemsPerPage}
                                onPageChange={setCurrentPage}
                                onItemsPerPageChange={setItemsPerPage}
                            />
                        </div>
                    </>
                )}
            </div>
        </AdminPageLayout>
    );
}
