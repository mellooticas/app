import { Suspense } from 'react'
import { getTodasAulas } from '@/src/lib/supabase/queries/aulas'
import { Calendar, Clock } from 'lucide-react'
import { STATUS_CONFIG } from '@/src/lib/types/aulas'

/**
 * 📊 ADMIN - KANBAN DE AULAS
 * Visualização em kanban das 30 aulas por status
 */

export const metadata = {
  title: 'Aulas - Kanban | Admin | Nipo School',
  description: 'Gerenciar aulas em formato kanban',
}

async function AulasKanbanContent() {
  const aulas = await getTodasAulas()

  // Agrupar aulas por status
  const aulasPorStatus = Object.keys(STATUS_CONFIG).reduce((acc, status) => {
    acc[status] = aulas.filter(aula => aula.status === status)
    return acc
  }, {} as Record<string, typeof aulas>)

  return (
    <div className="space-y-6">
      {/* Header com resumo */}
      <div className="bg-white rounded-xl border border-gray-200 p-6">
        <h2 className="text-xl font-bold text-gray-900 mb-4">
          Visão Geral - {aulas.length} Aulas
        </h2>
        <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
          {Object.entries(STATUS_CONFIG).map(([key, config]) => {
            const count = aulasPorStatus[key]?.length || 0
            return (
              <div key={key} className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg">
                <div 
                  className="w-3 h-3 rounded-full" 
                  style={{ backgroundColor: config.color }}
                />
                <div>
                  <p className="text-lg font-bold text-gray-900">{count}</p>
                  <p className="text-xs text-gray-600">{config.label}</p>
                </div>
              </div>
            )
          })}
        </div>
      </div>

      {/* Kanban Board */}
      <div className="flex gap-4 overflow-x-auto pb-4">
        {Object.entries(STATUS_CONFIG).map(([statusKey, config]) => {
          const aulasColuna = aulasPorStatus[statusKey] || []
          const StatusIcon = config.icon

          return (
            <div 
              key={statusKey}
              className="flex-shrink-0 w-80 bg-gray-50 rounded-xl border border-gray-200"
            >
              {/* Cabeçalho da coluna */}
              <div 
                className="p-4 border-b border-gray-200"
                style={{ backgroundColor: `${config.color}10` }}
              >
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <StatusIcon 
                      className="w-5 h-5" 
                      style={{ color: config.color }}
                    />
                    <h3 
                      className="font-bold text-sm"
                      style={{ color: config.color }}
                    >
                      {config.label}
                    </h3>
                  </div>
                  <span 
                    className="px-2 py-1 text-xs font-bold rounded"
                    style={{ 
                      backgroundColor: config.color,
                      color: 'white'
                    }}
                  >
                    {aulasColuna.length}
                  </span>
                </div>
              </div>

              {/* Cards das aulas */}
              <div className="p-3 space-y-2 max-h-[600px] overflow-y-auto">
                {aulasColuna.length === 0 ? (
                  <div className="text-center py-8 text-gray-400 text-sm">
                    Nenhuma aula
                  </div>
                ) : (
                  aulasColuna.map((aula) => (
                    <div
                      key={aula.id}
                      className="bg-white rounded-lg border border-gray-200 p-3 hover:shadow-md transition-shadow cursor-pointer"
                    >
                      <div className="flex items-start justify-between mb-2">
                        <span className="text-xs font-bold text-gray-500">
                          Aula {aula.numero}
                        </span>
                        {aula.formato && (
                          <span className="text-xs px-2 py-0.5 bg-blue-50 text-blue-600 rounded">
                            {aula.formato}
                          </span>
                        )}
                      </div>
                      
                      <h4 className="font-semibold text-gray-900 text-sm mb-2 line-clamp-2">
                        {aula.titulo}
                      </h4>
                      
                      <p className="text-xs text-gray-600 mb-3 line-clamp-2">
                        {aula.objetivo_didatico}
                      </p>
                      
                      <div className="flex items-center gap-2 text-xs text-gray-500">
                        <Calendar className="w-3 h-3" />
                        {new Date(aula.data_programada).toLocaleDateString('pt-BR', {
                          day: '2-digit',
                          month: 'short'
                        })}
                      </div>

                      {aula.desafio_alpha && (
                        <div className="mt-2 pt-2 border-t border-gray-100">
                          <p className="text-xs text-purple-600 font-medium">
                            🎯 Desafio Alpha
                          </p>
                        </div>
                      )}
                    </div>
                  ))
                )}
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}

export default function AdminAulasPage() {
  return (
    <div className="p-6 lg:p-8">
      <div className="mb-6">
        <h1 className="text-3xl font-bold text-gray-900">📊 Aulas - Kanban</h1>
        <p className="text-gray-600 mt-2">
          Gerencie as aulas do Método Alpha em formato kanban
        </p>
      </div>

      <Suspense fallback={
        <div className="bg-white rounded-xl border border-gray-200 p-8">
          <div className="flex items-center justify-center">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600" />
            <span className="ml-3 text-gray-600">Carregando kanban...</span>
          </div>
        </div>
      }>
        <AulasKanbanContent />
      </Suspense>
    </div>
  )
}
