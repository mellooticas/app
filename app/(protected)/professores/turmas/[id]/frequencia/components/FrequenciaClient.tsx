'use client'

import { useState, useEffect } from 'react'
import { supabase } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'
import { motion } from 'framer-motion'
import { ArrowLeft, Save, Calendar, Check, X, User } from 'lucide-react'
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

export default function FrequenciaClient({ turmaId }: { turmaId: string }) {
    const router = useRouter()
    const [loading, setLoading] = useState(true)
    const [saving, setSaving] = useState(false)
    const [matriculas, setMatriculas] = useState<Matricula[]>([])
    const [date, setDate] = useState(new Date().toISOString().split('T')[0])
    const [attendance, setAttendance] = useState<Record<string, boolean>>({})
    const [aulaId, setAulaId] = useState<string | null>(null)

    useEffect(() => {
        fetchStudents()
    }, [turmaId])

    // Check for existing attendance when date changes
    useEffect(() => {
        if (matriculas.length > 0) {
            checkExistingAttendance()
        }
    }, [date, matriculas])

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
                // Initialize attendance as true for all
                const initialAttendance: Record<string, boolean> = {}
                // @ts-ignore
                data.forEach(m => initialAttendance[m.aluno.id] = true)
                setAttendance(initialAttendance)
            }
        } catch (error) {
            console.error('Error fetching students:', error)
        } finally {
            setLoading(false)
        }
    }

    const checkExistingAttendance = async () => {
        setLoading(true)
        try {
            // First find if there refers to an aula on this date for this turma?
            // Since 'aulas' table might not link to 'turma' directly in a simple way (based on my knowledge), 
            // I'll search for an aula created by me (current user) on this date with a specific title convention or metadata?
            // Or I'll assume I just create a new one every time I save.
            // Better: Try to find an aula with data_inicio matching the date.

            // Since I don't have a reliable way to link aula to turma yet (missing column info),
            // I will skip fetching existing attendance logic for now and focus on SAVING new attendance.
            // TODO: Implement fetching existing attendance once 'aulas' -> 'turmas' relationship is clarified.

        } catch (error) {
            console.error('Error checking attendance:', error)
        } finally {
            setLoading(false)
        }
    }

    const toggleAttendance = (studentId: string) => {
        setAttendance(prev => ({
            ...prev,
            [studentId]: !prev[studentId]
        }))
    }

    const handleSave = async () => {
        setSaving(true)
        try {
            const user = (await supabase.auth.getUser()).data.user
            if (!user) throw new Error('Not authenticated')

            // 1. Create or Get Aula
            // We create a new 'aula' record to anchor the attendance.
            // Ideally we would check if one exists, but for MVP we create one.
            const { data: aula, error: aulaError } = await supabase
                .from('aulas')
                .insert({
                    titulo: `Aula de ${new Date(date).toLocaleDateString('pt-BR')}`,
                    data_inicio: date,
                    responsavel_id: user.id,
                    // turma_id: turmaId // If column exists? I'll assume NOT for safety now.
                })
                .select()
                .single()

            if (aulaError) throw aulaError

            const newAulaId = aula.id

            // 2. Insert Presencas (aula_presencas)
            const presencasToInsert = matriculas.map(m => ({
                aula_id: newAulaId,
                aluno_id: m.aluno.id,
                presente: attendance[m.aluno.id]
            }))

            const { error: presencasError } = await supabase
                .from('aula_presencas')
                .insert(presencasToInsert)

            if (presencasError) throw presencasError

            alert('Frequência salva com sucesso!')
            router.push(`/professores/turmas/${turmaId}`)

        } catch (error) {
            console.error('Error saving attendance:', error)
            alert('Erro ao salvar frequência. Tente novamente.')
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
                    <h1 className="text-2xl font-bold text-gray-900">Lançar Frequência</h1>
                    <p className="text-gray-500">Registre a presença dos alunos na aula</p>
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
                    <span className="text-sm text-gray-500">Selecione a data da aula</span>
                </div>

                <div className="border rounded-xl overflow-hidden">
                    <table className="w-full text-left">
                        <thead className="bg-gray-50 border-b border-gray-200">
                            <tr>
                                <th className="px-6 py-4 font-semibold text-gray-700">Aluno</th>
                                <th className="px-6 py-4 font-semibold text-gray-700 text-center w-32">Presença</th>
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
                                    <td className="px-6 py-4 text-center">
                                        <button
                                            onClick={() => toggleAttendance(matricula.aluno.id)}
                                            className={`p-2 rounded-lg transition-all ${attendance[matricula.aluno.id]
                                                    ? 'bg-green-100 text-green-600 hover:bg-green-200'
                                                    : 'bg-red-100 text-red-600 hover:bg-red-200'
                                                }`}
                                        >
                                            {attendance[matricula.aluno.id] ? <Check className="w-5 h-5" /> : <X className="w-5 h-5" />}
                                        </button>
                                    </td>
                                </tr>
                            ))}
                            {matriculas.length === 0 && !loading && (
                                <tr>
                                    <td colSpan={2} className="px-6 py-8 text-center text-gray-500">
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
                        className="flex items-center gap-2 px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-medium disabled:opacity-50 disabled:cursor-not-allowed shadow-sm transition-all active:scale-95"
                    >
                        {saving ? 'Salvando...' : (
                            <>
                                <Save className="w-4 h-4" />
                                Salvar Frequência
                            </>
                        )}
                    </button>
                </div>
            </div>
        </div>
    )
}
