'use client'

import { useState, useEffect } from 'react'
import { supabase } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'
import { ArrowLeft, UserPlus, Trash2, Search, User, X } from 'lucide-react'
import Link from 'next/link'

interface Student {
    id: string
    full_name: string | null
    email: string | null
    avatar_url: string | null
}

interface Matricula {
    id: string
    status: string
    aluno: Student
}

export default function AlunosManagerClient({ turmaId }: { turmaId: string }) {
    const router = useRouter()
    const [loading, setLoading] = useState(true)
    const [matriculas, setMatriculas] = useState<Matricula[]>([])
    const [isAddModalOpen, setIsAddModalOpen] = useState(false)

    // Search state
    const [searchQuery, setSearchQuery] = useState('')
    const [searchResults, setSearchResults] = useState<Student[]>([])
    const [searching, setSearching] = useState(false)

    useEffect(() => {
        fetchMatriculas()
    }, [turmaId])

    const fetchMatriculas = async () => {
        setLoading(true)
        try {
            const { data, error } = await supabase
                .from('matriculas')
                .select(`
          id,
          status,
          aluno:profiles!aluno_id(id, full_name, email, avatar_url)
        `)
                .eq('turma_id', turmaId)
                .neq('status', 'cancelada') // Don't show cancelled? Or show distinct
                .order('aluno(full_name)')

            if (error) throw error
            // @ts-ignore
            setMatriculas(data || [])
        } catch (error) {
            console.error('Error fetching matriculas:', error)
        } finally {
            setLoading(false)
        }
    }

    const handleSearchStudents = async (query: string) => {
        setSearchQuery(query)
        if (query.length < 3) {
            setSearchResults([])
            return
        }

        setSearching(true)
        try {
            // Find students not already in the class
            const currentStudentIds = matriculas.map(m => m.aluno.id)

            const { data, error } = await supabase
                .from('profiles')
                .select('*')
                .or(`tipo_usuario.eq.aluno,role.eq.aluno`) // Handle both columns if schema varies
                .ilike('full_name', `%${query}%`)
                .limit(10)

            if (error) throw error

            // Filter out existing
            const filtered = (data || []).filter((s: any) => !currentStudentIds.includes(s.id))
            setSearchResults(filtered)
        } catch (error) {
            console.error('Error searching students:', error)
        } finally {
            setSearching(false)
        }
    }

    const handleAddStudent = async (studentId: string) => {
        try {
            const { error } = await supabase
                .from('matriculas')
                .insert({
                    turma_id: turmaId,
                    aluno_id: studentId,
                    status: 'ativa',
                    data_matricula: new Date().toISOString()
                })

            if (error) throw error

            alert('Aluno matriculado com sucesso!')
            setIsAddModalOpen(false)
            setSearchQuery('')
            setSearchResults([])
            fetchMatriculas() // Refresh list
        } catch (error) {
            console.error('Error adding student:', error)
            alert('Erro ao matricular aluno.')
        }
    }

    const handleRemoveStudent = async (matriculaId: string) => {
        if (!confirm('Tem certeza que deseja remover este aluno da turma?')) return

        try {
            // Soft delete: set status to 'cancelada'
            const { error } = await supabase
                .from('matriculas')
                .update({ status: 'cancelada' })
                .eq('id', matriculaId)

            if (error) throw error

            fetchMatriculas()
        } catch (error) {
            console.error('Error removing student:', error)
            alert('Erro ao remover aluno.')
        }
    }

    return (
        <div className="space-y-6">
            <div className="flex items-center justify-between">
                <div className="flex items-center gap-4">
                    <Link
                        href={`/professores/turmas/${turmaId}`}
                        className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
                    >
                        <ArrowLeft className="w-5 h-5 text-gray-500" />
                    </Link>
                    <div>
                        <h1 className="text-2xl font-bold text-gray-900">Gerenciar Alunos</h1>
                        <p className="text-gray-500">Adicione ou remova alunos desta turma</p>
                    </div>
                </div>
                <button
                    onClick={() => setIsAddModalOpen(true)}
                    className="flex items-center gap-2 px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 font-medium transition-colors shadow-sm"
                >
                    <UserPlus className="w-4 h-4" />
                    Adicionar Aluno
                </button>
            </div>

            <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                {loading ? (
                    <div className="p-8 text-center text-gray-500">Carregando alunos...</div>
                ) : matriculas.length > 0 ? (
                    <table className="w-full text-left">
                        <thead className="bg-gray-50 border-b border-gray-200">
                            <tr>
                                <th className="px-6 py-4 font-semibold text-gray-700">Aluno</th>
                                <th className="px-6 py-4 font-semibold text-gray-700">Email</th>
                                <th className="px-6 py-4 font-semibold text-gray-700">Status</th>
                                <th className="px-6 py-4 font-semibold text-gray-700 text-right">Ações</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-gray-100">
                            {matriculas.map((m) => (
                                <tr key={m.id} className="hover:bg-gray-50 transition-colors">
                                    <td className="px-6 py-4">
                                        <div className="flex items-center gap-3">
                                            <div className="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-gray-500 overflow-hidden">
                                                {m.aluno.avatar_url ? (
                                                    <img src={m.aluno.avatar_url} alt="" className="w-full h-full object-cover" />
                                                ) : (
                                                    <User className="w-4 h-4" />
                                                )}
                                            </div>
                                            <span className="font-medium text-gray-900">{m.aluno.full_name}</span>
                                        </div>
                                    </td>
                                    <td className="px-6 py-4 text-gray-600">{m.aluno.email}</td>
                                    <td className="px-6 py-4">
                                        <span className={`inline-flex px-2 py-1 text-xs font-semibold rounded-full capitalize ${m.status === 'ativa' ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-700'
                                            }`}>
                                            {m.status}
                                        </span>
                                    </td>
                                    <td className="px-6 py-4 text-right">
                                        <button
                                            onClick={() => handleRemoveStudent(m.id)}
                                            className="text-red-500 hover:text-red-700 p-2 hover:bg-red-50 rounded-lg transition-colors"
                                            title="Remover aluno"
                                        >
                                            <Trash2 className="w-4 h-4" />
                                        </button>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                ) : (
                    <div className="p-12 text-center text-gray-500">
                        <User className="w-12 h-12 mx-auto text-gray-300 mb-3" />
                        <p>Nenhum aluno matriculado nesta turma.</p>
                    </div>
                )}
            </div>

            {/* Add Student Modal */}
            {isAddModalOpen && (
                <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm p-4">
                    <div className="bg-white rounded-2xl w-full max-w-md p-6 shadow-2xl animate-fade-in relative">
                        <button
                            onClick={() => setIsAddModalOpen(false)}
                            className="absolute right-4 top-4 text-gray-400 hover:text-gray-600"
                        >
                            <X className="w-5 h-5" />
                        </button>

                        <h2 className="text-xl font-bold text-gray-900 mb-4">Adicionar Aluno</h2>

                        <div className="relative mb-6">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                            <input
                                type="text"
                                placeholder="Buscar por nome..."
                                value={searchQuery}
                                onChange={(e) => handleSearchStudents(e.target.value)}
                                autoFocus
                                className="w-full pl-9 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all"
                            />
                        </div>

                        <div className="space-y-2 max-h-60 overflow-y-auto pr-1 custom-scrollbar">
                            {searching ? (
                                <div className="text-center py-4 text-gray-500">Buscando...</div>
                            ) : searchResults.length > 0 ? (
                                searchResults.map(student => (
                                    <div key={student.id} className="flex items-center justify-between p-3 hover:bg-gray-50 rounded-lg border border-transparent hover:border-gray-100 transition-all">
                                        <div className="flex items-center gap-3">
                                            <div className="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-gray-500">
                                                {student.full_name?.[0]}
                                            </div>
                                            <div>
                                                <p className="font-medium text-gray-900 text-sm">{student.full_name}</p>
                                                <p className="text-xs text-gray-500">{student.email}</p>
                                            </div>
                                        </div>
                                        <button
                                            onClick={() => handleAddStudent(student.id)}
                                            className="px-3 py-1.5 bg-blue-600 text-white text-xs font-bold rounded-lg hover:bg-blue-700 transition-colors"
                                        >
                                            Adicionar
                                        </button>
                                    </div>
                                ))
                            ) : searchQuery.length >= 3 ? (
                                <div className="text-center py-4 text-gray-500">Nenhum aluno encontrado.</div>
                            ) : (
                                <div className="text-center py-4 text-gray-400 text-sm">Digite pelo menos 3 caracteres para buscar.</div>
                            )}
                        </div>
                    </div>
                </div>
            )}
        </div>
    )
}
