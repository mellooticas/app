'use client'

import { useState, useEffect } from 'react'
import { supabase } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'
import { ArrowLeft, Save, Calendar, Check, X, User, Star } from 'lucide-react'
import Link from 'next/link'

interface Student {
    id: string
    full_name: string | null
    avatar_url: string | null
}

interface Matricula {
    id: string
    aluno: Student
    status: string
}

export default function NotasClient({ turmaId }: { turmaId: string }) {
    const router = useRouter()
    const [loading, setLoading] = useState(true)
    const [saving, setSaving] = useState(false)
    const [matriculas, setMatriculas] = useState<Matricula[]>([])
    const [date, setDate] = useState(new Date().toISOString().split('T')[0])
    const [grades, setGrades] = useState<Record<string, string>>({}) // string to handle input easily
    const [feedbacks, setFeedbacks] = useState<Record<string, string>>({})

    useEffect(() => {
        fetchStudents()
    }, [turmaId])

    const fetchStudents = async () => {
        try {
            const { data, error } = await supabase
                .from('matriculas')
                .select(`
          id,
          status,
          aluno:profiles!aluno_id(id, full_name, avatar_url)
        `)
                .eq('turma_id', turmaId)
                .eq('status', 'ativa')
                .order('aluno(full_name)')

            if (error) throw error

            if (data) {
                // @ts-ignore
                setMatriculas(data)
                // Initialize
                const initialGrades: Record<string, string> = {}
                const initialFeedbacks: Record<string, string> = {}
                // @ts-ignore
                data.forEach(m => {
                    initialGrades[m.aluno.id] = ''
                    initialFeedbacks[m.aluno.id] = ''
                })
                setGrades(initialGrades)
                setFeedbacks(initialFeedbacks)
            }
        } catch (error) {
            console.error('Error fetching students:', error)
        } finally {
            setLoading(false)
        }
    }

    const handleGradeChange = (studentId: string, value: string) => {
        setGrades(prev => ({ ...prev, [studentId]: value }))
    }

    const handleFeedbackChange = (studentId: string, value: string) => {
        setFeedbacks(prev => ({ ...prev, [studentId]: value }))
    }

    const handleSave = async () => {
        setSaving(true)
        try {
            const user = (await supabase.auth.getUser()).data.user
            if (!user) throw new Error('Not authenticated')

            // 1. Create or Get Aula
            const { data: aula, error: aulaError } = await supabase
                .from('aulas')
                .insert({
                    titulo: `Avaliação - Aula ${new Date(date).toLocaleDateString('pt-BR')}`,
                    data_inicio: date,
                    responsavel_id: user.id,
                })
                .select()
                .single()

            if (aulaError) throw aulaError

            const newAulaId = aula.id

            // 2. Insert Avaliacoes
            // Filter out students with empty grades? Or save with null?
            // We'll save only those with values.
            const evaluationsToInsert = matriculas
                .filter(m => grades[m.aluno.id] !== '')
                .map(m => ({
                    aula_id: newAulaId,
                    aluno_id: m.aluno.id,
                    nota: parseFloat(grades[m.aluno.id]),
                    feedback: feedbacks[m.aluno.id]
                }))

            if (evaluationsToInsert.length > 0) {
                const { error: evalError } = await supabase
                    .from('aula_avaliacoes')
                    .insert(evaluationsToInsert)

                if (evalError) throw evalError
            }

            alert('Notas lançadas com sucesso!')
            router.push(`/professores/turmas/${turmaId}`)

        } catch (error) {
            console.error('Error saving grades:', error)
            alert('Erro ao lançar notas. Tente novamente.')
        } finally {
            setSaving(false)
        }
    }

    return (
        <div className="space-y-6">
            <div className="flex items-center gap-4">
                <Link
                    href={`/professores/turmas/${turmaId}`}
                    className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
                >
                    <ArrowLeft className="w-5 h-5 text-gray-500" />
                </Link>
                <div>
                    <h1 className="text-2xl font-bold text-gray-900">Lançar Notas</h1>
                    <p className="text-gray-500">Avalie o desempenho dos alunos</p>
                </div>
            </div>

            <div className="bg-white p-6 rounded-xl border border-gray-200 shadow-sm space-y-6">
                <div className="flex items-center gap-4">
                    <div className="relative">
                        <Calendar className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                        <input
                            type="date"
                            value={date}
                            onChange={(e) => setDate(e.target.value)}
                            className="pl-9 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none"
                        />
                    </div>
                    <span className="text-sm text-gray-500">Data da Avaliação</span>
                </div>

                <div className="border rounded-xl overflow-hidden">
                    <table className="w-full text-left">
                        <thead className="bg-gray-50 border-b border-gray-200">
                            <tr>
                                <th className="px-6 py-4 font-semibold text-gray-700">Aluno</th>
                                <th className="px-6 py-4 font-semibold text-gray-700 w-32">Nota (0-10)</th>
                                <th className="px-6 py-4 font-semibold text-gray-700">Feedback</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-gray-100">
                            {matriculas.map((matricula) => (
                                <tr key={matricula.id} className="hover:bg-gray-50 transition-colors">
                                    <td className="px-6 py-4">
                                        <div className="flex items-center gap-3">
                                            <div className="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-gray-500 overflow-hidden">
                                                {matricula.aluno.avatar_url ? (
                                                    <img src={matricula.aluno.avatar_url} alt="" className="w-full h-full object-cover" />
                                                ) : (
                                                    <User className="w-4 h-4" />
                                                )}
                                            </div>
                                            <span className="font-medium text-gray-900">{matricula.aluno.full_name}</span>
                                        </div>
                                    </td>
                                    <td className="px-6 py-4">
                                        <input
                                            type="number"
                                            min="0"
                                            max="10"
                                            step="0.1"
                                            placeholder="-"
                                            value={grades[matricula.aluno.id]}
                                            onChange={(e) => handleGradeChange(matricula.aluno.id, e.target.value)}
                                            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 outline-none text-center"
                                        />
                                    </td>
                                    <td className="px-6 py-4">
                                        <input
                                            type="text"
                                            placeholder="Comentário opcional..."
                                            value={feedbacks[matricula.aluno.id]}
                                            onChange={(e) => handleFeedbackChange(matricula.aluno.id, e.target.value)}
                                            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 outline-none"
                                        />
                                    </td>
                                </tr>
                            ))}
                            {matriculas.length === 0 && !loading && (
                                <tr>
                                    <td colSpan={3} className="px-6 py-8 text-center text-gray-500">
                                        Nenhum aluno encontrado nesta turma.
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>

                <div className="flex justify-end gap-3 pt-4 border-t border-gray-100">
                    <Link
                        href={`/professores/turmas/${turmaId}`}
                        className="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 font-medium"
                    >
                        Cancelar
                    </Link>
                    <button
                        onClick={handleSave}
                        disabled={saving || matriculas.length === 0}
                        className="flex items-center gap-2 px-6 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 font-medium disabled:opacity-50 disabled:cursor-not-allowed shadow-sm transition-all active:scale-95"
                    >
                        {saving ? 'Salvando...' : (
                            <>
                                <Save className="w-4 h-4" />
                                Lançar Notas
                            </>
                        )}
                    </button>
                </div>
            </div>
        </div>
    )
}
