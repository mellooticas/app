import { Target, Clock, CheckCircle, XCircle } from 'lucide-react'
import { Link } from 'react-router-dom'
import { useDesafios } from '../hooks'

export default function DesafiosListPage() {
  const { desafios, loading, error } = useDesafios()

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
          <p className="text-gray-600 mt-4">Carregando desafios...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center text-red-600">
          <p>Erro ao carregar desafios: {error}</p>
        </div>
      </div>
    )
  }

  // Mapear desafios do Supabase para formato do componente
  const desafiosFormatados = desafios.map((d) => {
    let status: 'disponivel' | 'em_andamento' | 'concluido' | 'expirado' = 'disponivel'
    
    if (d.minha_submissao) {
      if (d.minha_submissao.status === 'aprovado') {
        status = 'concluido'
      } else {
        status = 'em_andamento'
      }
    }

    return {
      id: d.id,
      titulo: d.titulo,
      descricao: d.descricao,
      dificuldade: d.dificuldade === 1 ? 'iniciante' : d.dificuldade <= 3 ? 'intermediario' : 'avancado',
      pontos: d.pontos_base,
      prazo: undefined, // TODO: adicionar prazo no schema
      status,
      instrumento: d.metodologia?.nome || 'Geral',
    }
  }) as Array<{
    id: string
    titulo: string
    descricao: string
    dificuldade: 'iniciante' | 'intermediario' | 'avancado'
    pontos: number
    prazo?: string
    status: 'disponivel' | 'em_andamento' | 'concluido' | 'expirado'
    instrumento: string
  }>

  const getDificuldadeColor = (dificuldade: string) => {
    switch (dificuldade) {
      case 'iniciante':
        return 'bg-green-100 text-green-700'
      case 'intermediario':
        return 'bg-yellow-100 text-yellow-700'
      case 'avancado':
        return 'bg-red-100 text-red-700'
      default:
        return 'bg-gray-100 text-gray-700'
    }
  }

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'concluido':
        return <CheckCircle className="w-5 h-5 text-green-600" />
      case 'expirado':
        return <XCircle className="w-5 h-5 text-red-600" />
      case 'em_andamento':
        return <Clock className="w-5 h-5 text-yellow-600" />
      default:
        return <Target className="w-5 h-5 text-indigo-600" />
    }
  }

  const stats = {
    total: desafiosFormatados.length,
    emAndamento: desafiosFormatados.filter((d) => d.status === 'em_andamento').length,
    concluidos: desafiosFormatados.filter((d) => d.status === 'concluido').length,
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Desafios DNA Alpha</h1>
        <p className="text-gray-600">Complete desafios pedagógicos e ganhe pontos!</p>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <div className="flex items-center gap-3">
            <div className="p-3 bg-indigo-100 rounded-lg">
              <Target className="w-6 h-6 text-indigo-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600">Disponíveis</p>
              <p className="text-2xl font-bold text-gray-900">{stats.total}</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <div className="flex items-center gap-3">
            <div className="p-3 bg-yellow-100 rounded-lg">
              <Clock className="w-6 h-6 text-yellow-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600">Em Andamento</p>
              <p className="text-2xl font-bold text-gray-900">{stats.emAndamento}</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <div className="flex items-center gap-3">
            <div className="p-3 bg-green-100 rounded-lg">
              <CheckCircle className="w-6 h-6 text-green-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600">Concluídos</p>
              <p className="text-2xl font-bold text-gray-900">{stats.concluidos}</p>
            </div>
          </div>
        </div>
      </div>

      {/* Desafios List */}
      <div className="space-y-4">
        {desafiosFormatados.map((desafio) => (
          <Link
            key={desafio.id}
            to={`/app/aluno/desafios/${desafio.id}`}
            className="block bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md transition-all group"
          >
            <div className="flex items-start justify-between">
              <div className="flex-1">
                <div className="flex items-center gap-3 mb-3">
                  {getStatusIcon(desafio.status)}
                  <h3 className="text-xl font-bold text-gray-900 group-hover:text-indigo-600 transition-colors">
                    {desafio.titulo}
                  </h3>
                  <span className={`px-3 py-1 rounded-full text-xs font-medium ${getDificuldadeColor(desafio.dificuldade)}`}>
                    {desafio.dificuldade.charAt(0).toUpperCase() + desafio.dificuldade.slice(1)}
                  </span>
                </div>

                <p className="text-gray-600 mb-4">{desafio.descricao}</p>

                <div className="flex items-center gap-6 text-sm">
                  <span className="flex items-center gap-2 text-gray-600">
                    <span className="font-medium">Instrumento:</span>
                    {desafio.instrumento}
                  </span>
                  <span className="flex items-center gap-2 text-indigo-600 font-medium">
                    +{desafio.pontos} pontos
                  </span>
                  {desafio.prazo && (
                    <span className="flex items-center gap-2 text-gray-600">
                      <Clock className="w-4 h-4" />
                      {new Date(desafio.prazo).toLocaleDateString('pt-BR')}
                    </span>
                  )}
                </div>
              </div>

              <div className="ml-4">
                <button className="px-6 py-2 bg-indigo-600 text-white rounded-lg font-medium hover:bg-indigo-700 transition-colors">
                  {desafio.status === 'em_andamento' ? 'Continuar' : 'Iniciar'}
                </button>
              </div>
            </div>
          </Link>
        ))}
      </div>

      {/* Empty State */}
      {desafiosFormatados.length === 0 && (
        <div className="text-center py-16">
          <Target className="w-16 h-16 text-gray-400 mx-auto mb-4" />
          <h3 className="text-xl font-semibold text-gray-900 mb-2">Nenhum desafio disponível</h3>
          <p className="text-gray-600">Novos desafios serão publicados em breve!</p>
        </div>
      )}
    </div>
  )
}
