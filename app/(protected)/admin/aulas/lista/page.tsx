import { Suspense } from 'react'
import { getTodasAulas } from '@/src/lib/supabase/queries/aulas'
import { Calendar, Clock, CheckCircle, AlertCircle } from 'lucide-react'
import { STATUS_CONFIG } from '@/src/lib/types/aulas'

/**
 * 📋 ADMIN - LISTA DE AULAS
 * Lista completa de todas as 30 aulas do Método Alpha
 */

export const metadata = {
  title: 'Aulas - Lista | Admin | Nipo School',
  description: 'Gerenciar todas as aulas do Método Alpha',
}

async function AulasListaContent() {
  const aulas = await getTodasAulas()

  return (
    <div className="space-y-4">
      {/* Cabeçalho */}
      <div className="bg-white rounded-xl border border-gray-200 p-6">
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-2xl font-bold text-gray-900">
              Todas as Aulas ({aulas.length})
            </h2>
            <p className="text-gray-600 mt-1">
              Método Alpha - 31 Mai a 20 Dez 2025
            </p>
          </div>
          <div className="flex gap-2">
            {Object.entries(STATUS_CONFIG).map(([key, config]) => (
              <div key={key} className="flex items-center gap-2 px-3 py-1 bg-gray-50 rounded-lg">
                <div 
                  className="w-3 h-3 rounded-full" 
                  style={{ backgroundColor: config.color }}
                />
                <span className="text-xs font-medium text-gray-600">
                  {aulas.filter(a => a.status === key).length}
                </span>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Tabela de Aulas */}
      <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  #
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Aula
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Data
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Status
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Objetivo
                </th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-200">
              {aulas.map((aula) => {
                const statusConfig = STATUS_CONFIG[aula.status as keyof typeof STATUS_CONFIG]
                const StatusIcon = statusConfig?.icon || AlertCircle
                
                return (
                  <tr 
                    key={aula.id} 
                    className="hover:bg-gray-50 transition-colors"
                  >
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className="text-sm font-bold text-gray-900">
                        {aula.numero}
                      </span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col">
                        <span className="text-sm font-medium text-gray-900">
                          {aula.titulo}
                        </span>
                        {aula.formato && (
                          <span className="text-xs text-gray-500 mt-1">
                            {aula.formato}
                          </span>
                        )}
                      </div>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div className="flex items-center gap-2 text-sm text-gray-600">
                        <Calendar className="w-4 h-4" />
                        {new Date(aula.data_programada).toLocaleDateString('pt-BR')}
                      </div>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div className="flex items-center gap-2">
                        <StatusIcon 
                          className="w-4 h-4" 
                          style={{ color: statusConfig?.color || '#6B7280' }}
                        />
                        <span 
                          className="text-xs font-medium px-2 py-1 rounded"
                          style={{ 
                            backgroundColor: `${statusConfig?.color}20`,
                            color: statusConfig?.color || '#6B7280'
                          }}
                        >
                          {statusConfig?.label || aula.status}
                        </span>
                      </div>
                    </td>
                    <td className="px-6 py-4">
                      <p className="text-sm text-gray-600 line-clamp-2">
                        {aula.objetivo_didatico}
                      </p>
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </div>
      </div>

      {/* Resumo */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div className="bg-white rounded-xl border border-gray-200 p-4">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center">
              <Calendar className="w-5 h-5 text-blue-600" />
            </div>
            <div>
              <p className="text-2xl font-bold text-gray-900">{aulas.length}</p>
              <p className="text-xs text-gray-600">Total de Aulas</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl border border-gray-200 p-4">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-green-100 rounded-lg flex items-center justify-center">
              <CheckCircle className="w-5 h-5 text-green-600" />
            </div>
            <div>
              <p className="text-2xl font-bold text-gray-900">
                {aulas.filter(a => a.status === 'Concluída').length}
              </p>
              <p className="text-xs text-gray-600">Concluídas</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl border border-gray-200 p-4">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-yellow-100 rounded-lg flex items-center justify-center">
              <Clock className="w-5 h-5 text-yellow-600" />
            </div>
            <div>
              <p className="text-2xl font-bold text-gray-900">
                {aulas.filter(a => a.status === 'A Fazer').length}
              </p>
              <p className="text-xs text-gray-600">Pendentes</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl border border-gray-200 p-4">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-purple-100 rounded-lg flex items-center justify-center">
              <AlertCircle className="w-5 h-5 text-purple-600" />
            </div>
            <div>
              <p className="text-2xl font-bold text-gray-900">
                {aulas.filter(a => a.status === 'Em Preparação').length}
              </p>
              <p className="text-xs text-gray-600">Em Preparação</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default function AdminAulasListaPage() {
  return (
    <div className="p-6 lg:p-8">
      <div className="mb-6">
        <h1 className="text-3xl font-bold text-gray-900">📋 Aulas - Lista</h1>
        <p className="text-gray-600 mt-2">
          Visualização em lista de todas as aulas do Método Alpha
        </p>
      </div>

      <Suspense fallback={
        <div className="bg-white rounded-xl border border-gray-200 p-8">
          <div className="flex items-center justify-center">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600" />
            <span className="ml-3 text-gray-600">Carregando aulas...</span>
          </div>
        </div>
      }>
        <AulasListaContent />
      </Suspense>
    </div>
  )
}
