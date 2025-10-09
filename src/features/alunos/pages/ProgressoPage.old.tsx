import { TrendingUp, Target, Award, Calendar } from 'lucide-react'

export default function ProgressoPage() {
  // Mock data - substituir por hook useAlunoStats()
  const stats = {
    pontosTotal: 1250,
    nivel: 8,
    proximoNivel: 1500,
    conquistas: 12,
    desafiosConcluidos: 24,
    diasConsecutivos: 7,
    horasEstudo: 45,
  }

  const progressoParaProximoNivel = ((stats.pontosTotal / stats.proximoNivel) * 100).toFixed(0)

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Meu Progresso</h1>
        <p className="text-gray-600">Acompanhe sua evolução no aprendizado musical</p>
      </div>

      {/* Level Progress */}
      <div className="bg-gradient-to-br from-indigo-600 to-purple-600 rounded-xl shadow-lg p-8 mb-8 text-white">
        <div className="flex items-center justify-between mb-4">
          <div>
            <p className="text-indigo-100 mb-1">Nível Atual</p>
            <p className="text-5xl font-bold">{stats.nivel}</p>
          </div>
          <div className="text-right">
            <p className="text-indigo-100 mb-1">Próximo Nível</p>
            <p className="text-2xl font-bold">{stats.nivel + 1}</p>
          </div>
        </div>

        <div className="mb-3">
          <div className="flex justify-between text-sm mb-2">
            <span>{stats.pontosTotal} pts</span>
            <span>{stats.proximoNivel} pts</span>
          </div>
          <div className="w-full bg-indigo-800 rounded-full h-4 overflow-hidden">
            <div
              className="bg-gradient-to-r from-yellow-400 to-orange-500 h-full transition-all duration-500 rounded-full"
              style={{ width: `${progressoParaProximoNivel}%` }}
            />
          </div>
        </div>

        <p className="text-indigo-100 text-sm">
          Faltam {stats.proximoNivel - stats.pontosTotal} pontos para o próximo nível
        </p>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-3">
            <div className="p-3 bg-yellow-100 rounded-lg">
              <Award className="w-6 h-6 text-yellow-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600">Conquistas</p>
              <p className="text-2xl font-bold text-gray-900">{stats.conquistas}</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-3">
            <div className="p-3 bg-green-100 rounded-lg">
              <Target className="w-6 h-6 text-green-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600">Desafios Completos</p>
              <p className="text-2xl font-bold text-gray-900">{stats.desafiosConcluidos}</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-3">
            <div className="p-3 bg-orange-100 rounded-lg">
              <TrendingUp className="w-6 h-6 text-orange-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600">Sequência</p>
              <p className="text-2xl font-bold text-gray-900">{stats.diasConsecutivos} dias</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-3">
            <div className="p-3 bg-blue-100 rounded-lg">
              <Calendar className="w-6 h-6 text-blue-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600">Horas de Estudo</p>
              <p className="text-2xl font-bold text-gray-900">{stats.horasEstudo}h</p>
            </div>
          </div>
        </div>
      </div>

      {/* Charts Placeholder */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Progresso Semanal */}
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <h3 className="text-lg font-bold text-gray-900 mb-4">Progresso Semanal</h3>
          <div className="h-64 flex items-end justify-between gap-2">
            {[40, 65, 55, 80, 70, 90, 85].map((height, index) => (
              <div key={index} className="flex-1 flex flex-col items-center gap-2">
                <div
                  className="w-full bg-gradient-to-t from-indigo-600 to-indigo-400 rounded-t-lg transition-all hover:opacity-80"
                  style={{ height: `${height}%` }}
                />
                <span className="text-xs text-gray-500">
                  {['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'][index]}
                </span>
              </div>
            ))}
          </div>
        </div>

        {/* Distribuição por Categoria */}
        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-200">
          <h3 className="text-lg font-bold text-gray-900 mb-4">Tempo por Categoria</h3>
          <div className="space-y-4">
            {[
              { name: 'Teoria Musical', value: 35, color: 'bg-blue-500' },
              { name: 'Prática Instrumental', value: 45, color: 'bg-green-500' },
              { name: 'Repertório', value: 25, color: 'bg-purple-500' },
              { name: 'Improvisação', value: 20, color: 'bg-orange-500' },
            ].map((item) => (
              <div key={item.name}>
                <div className="flex justify-between text-sm mb-2">
                  <span className="text-gray-700">{item.name}</span>
                  <span className="text-gray-900 font-medium">{item.value}%</span>
                </div>
                <div className="w-full bg-gray-200 rounded-full h-2">
                  <div
                    className={`${item.color} h-full rounded-full transition-all duration-500`}
                    style={{ width: `${item.value}%` }}
                  />
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}
