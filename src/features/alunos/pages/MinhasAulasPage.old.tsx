import { Calendar, Clock, MapPin, User, Loader2 } from 'lucide-react'
import { useAulas } from '../hooks'

export default function MinhasAulasPage() {
  // Hooks para dados reais
  const { aulas, loading, error } = useAulas()

  // Loading state
  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="w-12 h-12 text-indigo-600 animate-spin mx-auto mb-4" />
          <p className="text-gray-600 font-medium">Carregando aulas...</p>
        </div>
      </div>
    )
  }

  // Error state
  if (error) {
    return (
      <div className="min-h-screen bg-gray-50 p-6 flex items-center justify-center">
        <div className="text-center">
          <Calendar className="w-16 h-16 text-red-400 mx-auto mb-4" />
          <p className="text-red-600 font-medium">Erro ao carregar aulas</p>
          <p className="text-gray-600 text-sm mt-2">{error}</p>
        </div>
      </div>
    )
  }

  // Mapear aulas para formato do componente
  const aulasFormatadas = aulas.map((aula) => {
    // Status baseado na data e presença
    const dataAula = new Date(aula.data_aula)
    const hoje = new Date()
    let status: 'agendada' | 'concluida' | 'cancelada' = 'agendada'

    if (dataAula < hoje) {
      status = 'concluida'
    }

    return {
      id: aula.id,
      titulo: aula.titulo,
      professor: 'Professor', // TODO: buscar nome do professor
      data: aula.data_aula,
      horario: `${aula.horario_inicio} - ${aula.horario_fim}`,
      local: 'Sala', // TODO: adicionar campo local no schema
      status,
      turma: aula.turma?.nome || 'Turma',
      presente: aula.presente,
    }
  })

  // Separar aulas
  const aulasProximas = aulasFormatadas.filter((a) => a.status === 'agendada')
  const aulasConcluidas = aulasFormatadas.filter((a) => a.status === 'concluida')

  // Calcular taxa de presença
  const aulasComPresenca = aulasConcluidas.filter((a) => a.presente !== undefined)
  const presencas = aulasConcluidas.filter((a) => a.presente === true).length
  const taxaPresenca =
    aulasComPresenca.length > 0 ? Math.round((presencas / aulasComPresenca.length) * 100) : 0

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'agendada':
        return 'bg-blue-100 text-blue-700'
      case 'concluida':
        return 'bg-green-100 text-green-700'
      case 'cancelada':
        return 'bg-red-100 text-red-700'
      default:
        return 'bg-gray-100 text-gray-700'
    }
  }

  const getStatusLabel = (status: string) => {
    switch (status) {
      case 'agendada':
        return 'Agendada'
      case 'concluida':
        return 'Concluída'
      case 'cancelada':
        return 'Cancelada'
      default:
        return status
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Minhas Aulas</h1>
        <p className="text-gray-600">Acompanhe seu calendário de aulas e presenças</p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <p className="text-sm text-gray-600 mb-1">Próximas Aulas</p>
          <p className="text-3xl font-bold text-gray-900">{aulasProximas.length}</p>
        </div>
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <p className="text-sm text-gray-600 mb-1">Aulas Concluídas</p>
          <p className="text-3xl font-bold text-gray-900">{aulasConcluidas.length}</p>
        </div>
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <p className="text-sm text-gray-600 mb-1">Taxa de Presença</p>
          <p className="text-3xl font-bold text-gray-900">{taxaPresenca}%</p>
        </div>
      </div>

      {/* Próximas Aulas */}
      {aulasProximas.length > 0 && (
        <div className="mb-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Próximas Aulas</h2>
          <div className="space-y-4">
            {aulasProximas.map((aula) => (
              <div
                key={aula.id}
                className="bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md transition-all"
              >
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <h3 className="text-xl font-bold text-gray-900 mb-1">{aula.titulo}</h3>
                    <p className="text-gray-600">{aula.turma}</p>
                  </div>
                  <span className={`px-3 py-1 rounded-full text-sm font-medium ${getStatusColor(aula.status)}`}>
                    {getStatusLabel(aula.status)}
                  </span>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                  <div className="flex items-center gap-2 text-gray-600">
                    <Calendar className="w-4 h-4" />
                    <span className="text-sm">{new Date(aula.data).toLocaleDateString('pt-BR')}</span>
                  </div>
                  <div className="flex items-center gap-2 text-gray-600">
                    <Clock className="w-4 h-4" />
                    <span className="text-sm">{aula.horario}</span>
                  </div>
                  <div className="flex items-center gap-2 text-gray-600">
                    <MapPin className="w-4 h-4" />
                    <span className="text-sm">{aula.local}</span>
                  </div>
                  <div className="flex items-center gap-2 text-gray-600">
                    <User className="w-4 h-4" />
                    <span className="text-sm">{aula.professor}</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Histórico */}
      {aulasConcluidas.length > 0 && (
        <div>
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Histórico de Aulas</h2>
          <div className="space-y-4">
            {aulasConcluidas.map((aula) => (
              <div
                key={aula.id}
                className="bg-white rounded-xl shadow-sm border border-gray-200 p-6 opacity-75"
              >
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <h3 className="text-xl font-bold text-gray-900 mb-1">{aula.titulo}</h3>
                    <p className="text-gray-600">{aula.turma}</p>
                  </div>
                  <span className={`px-3 py-1 rounded-full text-sm font-medium ${getStatusColor(aula.status)}`}>
                    {getStatusLabel(aula.status)}
                  </span>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                  <div className="flex items-center gap-2 text-gray-600">
                    <Calendar className="w-4 h-4" />
                    <span className="text-sm">{new Date(aula.data).toLocaleDateString('pt-BR')}</span>
                  </div>
                  <div className="flex items-center gap-2 text-gray-600">
                    <Clock className="w-4 h-4" />
                    <span className="text-sm">{aula.horario}</span>
                  </div>
                  <div className="flex items-center gap-2 text-gray-600">
                    <MapPin className="w-4 h-4" />
                    <span className="text-sm">{aula.local}</span>
                  </div>
                  <div className="flex items-center gap-2 text-gray-600">
                    <User className="w-4 h-4" />
                    <span className="text-sm">{aula.professor}</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Empty State */}
      {aulasFormatadas.length === 0 && (
        <div className="text-center py-16">
          <Calendar className="w-16 h-16 text-gray-400 mx-auto mb-4" />
          <h3 className="text-xl font-semibold text-gray-900 mb-2">Nenhuma aula agendada</h3>
          <p className="text-gray-600">Suas aulas aparecerão aqui quando forem agendadas</p>
        </div>
      )}
    </div>
  )
}
