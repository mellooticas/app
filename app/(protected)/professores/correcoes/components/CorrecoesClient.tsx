'use client'

import { useState, useEffect } from 'react'
import { supabase } from '@/lib/supabase/client'
import { motion } from 'framer-motion'
import {
    CheckCircle,
    Clock,
    FileText,
    MessageSquare,
    Search,
    Filter,
    ChevronRight,
    AlertCircle
} from 'lucide-react'
import { DesafioResposta, AulaAvaliacao, AutoAvaliacao } from '../../types'

export default function CorrecoesClient() {
    const [activeTab, setActiveTab] = useState<'desafios' | 'avaliacoes' | 'autoavaliacoes'>('desafios')
    const [loading, setLoading] = useState(true)
    const [desafios, setDesafios] = useState<DesafioResposta[]>([])
    const [avaliacoes, setAvaliacoes] = useState<AulaAvaliacao[]>([])
    const [autoAvaliacoes, setAutoAvaliacoes] = useState<AutoAvaliacao[]>([])

    useEffect(() => {
        fetchData()
    }, [])

    const fetchData = async () => {
        setLoading(true)
        try {
            // Fetch Desafios Pendentes
            const { data: desafiosData, error: desafiosError } = await supabase
                .from('desafios_alpha_respostas' as any)
                .select(`
                    id,
                    desafio_id,
                    aluno_id,
                    resposta_conteudo,
                    status,
                    created_at,
                    aluno:profiles!aluno_id(id, full_name, email, avatar_url),
                    desafio:alpha_aluno_desafios!desafio_id(titulo, descricao)
                `)
                .eq('status', 'pendente');

            if (desafiosError) throw desafiosError;

            // Fetch Avaliações Pendentes
            const { data: avaliacoesData, error: avaliacoesError } = await supabase
                .from('aula_avaliacoes' as any)
                .select(`
                    id,
                    aula_id,
                    aluno_id,
                    status,
                    created_at,
                    aula:aulas(titulo),
                    aluno:profiles!aluno_id(id, full_name, email, avatar_url)
                `)
                .eq('status', 'pendente');

            if (avaliacoesError) throw avaliacoesError;

            // Fetch Autoavaliações (Assuming we want to see recent ones or specific query)
            // autoavaliacoes usually don't have 'status' like pending, but let's fetch recent ones.
            const { data: autoAvaliacoesData, error: autoError } = await supabase
                .from('autoavaliacoes' as any)
                .select(`
                    id,
                    aula_id,
                    aluno_id,
                    nota_compreensao,
                    nota_pratica,
                    duvidas,
                    created_at,
                    aula:aulas(titulo),
                    aluno:profiles!aluno_id(id, full_name, email, avatar_url)
                `)
                .order('created_at', { ascending: false })
                .limit(20);

            if (autoError) throw autoError;

            // Map to state
            if (desafiosData) setDesafios(desafiosData as any);
            if (avaliacoesData) setAvaliacoes(avaliacoesData as any);
            if (autoAvaliacoesData) setAutoAvaliacoes(autoAvaliacoesData as any);

        } catch (error) {
            console.error('Erro ao buscar correções:', error)
        } finally {
            setLoading(false)
        }
    }

    const containerVariants = {
        hidden: { opacity: 0 },
        visible: { opacity: 1, transition: { staggerChildren: 0.1 } }
    }

    const itemVariants = {
        hidden: { y: 20, opacity: 0 },
        visible: { y: 0, opacity: 1 }
    }

    return (
        <div className="space-y-6">
            {/* Header Stats */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div className="bg-gradient-to-br from-orange-500 to-red-500 rounded-2xl p-6 text-white shadow-lg">
                    <div className="flex justify-between items-start">
                        <div>
                            <p className="text-white/80 text-sm font-medium">Correções Pendentes</p>
                            <h3 className="text-3xl font-bold mt-1">{desafios.filter(d => d.status === 'pendente').length + avaliacoes.filter(a => a.status === 'pendente').length}</h3>
                        </div>
                        <div className="p-2 bg-white/20 rounded-lg">
                            <Clock className="w-6 h-6 text-white" />
                        </div>
                    </div>
                </div>

                <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100">
                    <div className="flex justify-between items-start">
                        <div>
                            <p className="text-gray-500 text-sm font-medium">Avaliações da Semana</p>
                            <h3 className="text-3xl font-bold mt-1 text-gray-800">12</h3>
                        </div>
                        <div className="p-2 bg-blue-50 rounded-lg">
                            <CheckCircle className="w-6 h-6 text-blue-500" />
                        </div>
                    </div>
                </div>

                <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100">
                    <div className="flex justify-between items-start">
                        <div>
                            <p className="text-gray-500 text-sm font-medium">Tempo Médio de Resposta</p>
                            <h3 className="text-3xl font-bold mt-1 text-gray-800">4h</h3>
                        </div>
                        <div className="p-2 bg-green-50 rounded-lg">
                            <Clock className="w-6 h-6 text-green-500" />
                        </div>
                    </div>
                </div>
            </div>

            {/* Tabs & Filters */}
            <div className="flex flex-col md:flex-row justify-between items-center gap-4 bg-white p-2 rounded-xl border border-gray-100 shadow-sm">
                <div className="flex gap-2">
                    {(['desafios', 'avaliacoes', 'autoavaliacoes'] as const).map((tab) => (
                        <button
                            key={tab}
                            onClick={() => setActiveTab(tab)}
                            className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${activeTab === tab
                                ? 'bg-blue-600 text-white shadow-md'
                                : 'text-gray-600 hover:bg-gray-50'
                                }`}
                        >
                            {tab.charAt(0).toUpperCase() + tab.slice(1)}
                        </button>
                    ))}
                </div>

                <div className="flex gap-2 w-full md:w-auto">
                    <div className="relative flex-1 md:w-64">
                        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                        <input
                            type="text"
                            placeholder="Buscar aluno ou atividade..."
                            className="w-full pl-9 pr-4 py-2 bg-gray-50 border border-gray-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
                        />
                    </div>
                    <button className="p-2 bg-gray-50 hover:bg-gray-100 border border-gray-200 rounded-lg text-gray-600">
                        <Filter className="w-4 h-4" />
                    </button>
                </div>
            </div>

            {/* Content List */}
            <motion.div
                variants={containerVariants}
                initial="hidden"
                animate="visible"
                className="space-y-4"
            >
                {loading ? (
                    <div className="text-center py-12 text-gray-500">
                        Carregando correções...
                    </div>
                ) : activeTab === 'desafios' && desafios.length > 0 ? (
                    desafios.map((item) => (
                        <motion.div
                            key={item.id}
                            variants={itemVariants}
                            className="bg-white p-5 rounded-xl border border-gray-100 shadow-sm hover:shadow-md transition-all group cursor-pointer"
                        >
                            <div className="flex justify-between items-start">
                                <div className="flex gap-4">
                                    <div className="w-12 h-12 rounded-full bg-gray-100 flex items-center justify-center text-gray-500 font-bold text-lg">
                                        {item.aluno?.full_name?.[0] || '?'}
                                    </div>
                                    <div>
                                        <h4 className="font-bold text-gray-900 group-hover:text-blue-600 transition-colors">
                                            {item.desafio?.titulo}
                                        </h4>
                                        <p className="text-sm text-gray-500 mb-2">
                                            Aluno: <span className="font-medium text-gray-700">{item.aluno?.full_name}</span> • Enviado em {new Date(item.created_at).toLocaleDateString('pt-BR')}
                                        </p>
                                        <div className="bg-gray-50 p-3 rounded-lg text-sm text-gray-600 border border-gray-100">
                                            {item.resposta_conteudo}
                                        </div>
                                    </div>
                                </div>

                                <div className="flex flex-col items-end gap-2">
                                    <span className={`px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wider ${item.status === 'pendente' ? 'bg-orange-100 text-orange-600' :
                                        item.status === 'em_analise' ? 'bg-blue-100 text-blue-600' :
                                            'bg-green-100 text-green-600'
                                        }`}>
                                        {item.status.replace('_', ' ')}
                                    </span>
                                    <Link
                                        href={`/professores/correcoes/${item.id}?type=desafio`}
                                        className="flex items-center gap-1 text-sm font-medium text-blue-600 hover:text-blue-700 mt-2"
                                    >
                                        Avaliar <ChevronRight className="w-4 h-4" />
                                    </Link>
                                </div>
                            </div>
                        </motion.div>
                    ))
                ) : (
                    <div className="flex flex-col items-center justify-center py-16 bg-white rounded-2xl border border-dashed border-gray-200">
                        <div className="w-16 h-16 bg-gray-50 rounded-full flex items-center justify-center mb-4">
                            <CheckCircle className="w-8 h-8 text-gray-300" />
                        </div>
                        <h3 className="text-lg font-bold text-gray-900">Tudo em dia!</h3>
                        <p className="text-gray-500">Não há correções pendentes nesta categoria.</p>
                    </div>
                )}
            </motion.div>
        </div>
    )
}
