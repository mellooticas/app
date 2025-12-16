
import { getTurmaById, getAlunosTurma } from '@/src/lib/supabase/queries/users_turmas';
import { ArrowLeft, User, Mail, Calendar, CheckCircle, XCircle } from 'lucide-react';
import Link from 'next/link';
import { notFound } from 'next/navigation';

interface PageProps {
    params: {
        id: string;
    };
}

export default async function DetalhesTurmaPage({ params }: PageProps) {
    const turma = await getTurmaById(params.id);

    if (!turma) {
        notFound();
    }

    const matriculas = await getAlunosTurma(params.id);

    return (
        <div className="p-6 lg:p-8 space-y-8">
            {/* Header */}
            <div className="flex flex-col gap-4">
                <Link href="/professores/turmas" className="flex items-center text-sm text-gray-500 hover:text-gray-900 transition-colors bg-white w-fit px-3 py-1.5 rounded-lg shadow-sm border border-gray-200">
                    <ArrowLeft className="w-4 h-4 mr-2" />
                    Voltar para Turmas
                </Link>

                <div className="bg-white rounded-xl p-6 shadow-sm border border-gray-200 flex flex-col md:flex-row justify-between md:items-center gap-6">
                    <div>
                        <h1 className="text-3xl font-bold text-gray-900">{turma.nome}</h1>
                        <div className="flex flex-wrap gap-4 mt-2 text-sm text-gray-600">
                            <span className="flex items-center gap-1 bg-gray-100 px-2 py-1 rounded">
                                <Calendar className="w-4 h-4" />
                                {turma.horario_padrao}
                            </span>
                            <span className="bg-gray-100 px-2 py-1 rounded">
                                Sala: {turma.sala}
                            </span>
                            <span className="bg-gray-100 px-2 py-1 rounded capitalize">
                                Nível: {turma.nivel}
                            </span>
                        </div>
                    </div>
                    <div className="flex gap-3">
                        <Link
                            href={`/professores/turmas/${params.id}/frequencia`}
                            className="px-4 py-2 bg-indigo-600 hover:bg-indigo-700 text-white rounded-lg font-medium transition-colors shadow-sm text-center"
                        >
                            Lançar Frequência
                        </Link>
                        <Link
                            href={`/professores/turmas/${params.id}/notas`}
                            className="px-4 py-2 bg-white border border-indigo-200 text-indigo-700 hover:bg-indigo-50 rounded-lg font-medium transition-colors shadow-sm text-center"
                        >
                            Lançar Notas
                        </Link>
                        <Link
                            href={`/professores/turmas/${params.id}/alunos`}
                            className="px-4 py-2 bg-white border border-indigo-200 text-gray-700 hover:bg-gray-50 rounded-lg font-medium transition-colors shadow-sm text-center flex items-center gap-2"
                        >
                            <User className="w-4 h-4" />
                            Gerenciar Alunos
                        </Link>
                    </div>
                </div>
            </div>

            {/* Lista de Alunos */}
            <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div className="p-6 border-b border-gray-200 flex justify-between items-center">
                    <h2 className="text-xl font-bold text-gray-900">Alunos Matriculados</h2>
                    <span className="text-sm text-gray-500">{matriculas.length} alunos</span>
                </div>

                <div className="overflow-x-auto">
                    <table className="w-full text-left text-sm text-gray-600">
                        <thead className="bg-gray-50 text-gray-900 font-semibold border-b border-gray-200">
                            <tr>
                                <th className="px-6 py-4">Nome do Aluno</th>
                                <th className="px-6 py-4">Nível & XP</th>
                                <th className="px-6 py-4">Status</th>
                                <th className="px-6 py-4">Frequência</th>
                                <th className="px-6 py-4 text-right">Ações</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-gray-100">
                            {matriculas.length > 0 ? (
                                matriculas.map((matricula) => (
                                    <tr key={matricula.id} className="hover:bg-gray-50 transition-colors group">
                                        <td className="px-6 py-4">
                                            <div className="flex items-center gap-3">
                                                <div className="relative">
                                                    <div className="w-10 h-10 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-700 font-bold text-sm ring-2 ring-white shadow-md overflow-hidden">
                                                        {matricula.aluno?.avatar_url ? (
                                                            <img src={matricula.aluno.avatar_url} alt="" className="w-full h-full object-cover" />
                                                        ) : (
                                                            matricula.aluno?.full_name?.charAt(0) || 'A'
                                                        )}
                                                    </div>
                                                    {/* Online Status Dot */}
                                                    <div className="absolute -bottom-1 -right-1 w-3.5 h-3.5 bg-green-500 border-2 border-white rounded-full"></div>
                                                </div>
                                                <div>
                                                    <div className="font-bold text-gray-900">{matricula.aluno?.full_name || 'Desconhecido'}</div>
                                                    <div className="text-xs text-gray-500 font-mono">#{matricula.aluno?.matricula || '---'}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td className="px-6 py-4">
                                            <div className="w-32">
                                                <div className="flex justify-between items-center mb-1">
                                                    <span className="text-xs font-bold text-indigo-600 uppercase tracking-wider">
                                                        {(matricula.aluno as any)?.user_level || 'Novato'}
                                                    </span>
                                                    <span className="text-[10px] text-gray-400 font-bold">
                                                        {(matricula.aluno as any)?.total_points || 0} XP
                                                    </span>
                                                </div>
                                                <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
                                                    <div
                                                        className="h-full bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full"
                                                        style={{ width: `${Math.min(((matricula.aluno as any)?.total_points || 0) / 10, 100)}%` }} // Simple calc for demo
                                                    ></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td className="px-6 py-4">
                                            <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-bold capitalize
                        ${matricula.status === 'ativo' ? 'bg-green-100 text-green-700' : ''}
                        ${matricula.status === 'trancado' ? 'bg-yellow-100 text-yellow-700' : ''}
                        ${matricula.status === 'reprovado' ? 'bg-red-100 text-red-700' : ''}
                      `}>
                                                {matricula.status}
                                            </span>
                                        </td>
                                        <td className="px-6 py-4">
                                            <div className="flex items-center gap-2">
                                                <div className="w-16 bg-gray-100 rounded-full h-2">
                                                    <div
                                                        className={`h-2 rounded-full ${params.id ? 'bg-green-500' : 'bg-gray-300'}`}
                                                        style={{ width: `${matricula.frequencia_porcentagem || 0}%` }}
                                                    ></div>
                                                </div>
                                                <span className="text-xs font-bold text-gray-600">{matricula.frequencia_porcentagem || 0}%</span>
                                            </div>
                                        </td>
                                        <td className="px-6 py-4 text-right">
                                            <button className="text-gray-400 hover:text-indigo-600 transition-colors p-2 hover:bg-indigo-50 rounded-lg">
                                                <User className="w-4 h-4" />
                                            </button>
                                        </td>
                                    </tr>
                                ))
                            ) : (
                                <tr>
                                    <td colSpan={5} className="px-6 py-12 text-center text-gray-500">
                                        <User className="w-12 h-12 mx-auto text-gray-300 mb-3" />
                                        <p>Nenhum aluno matriculado nesta turma.</p>
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
}
