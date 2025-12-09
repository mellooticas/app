import { Suspense } from 'react'
import { Calendar, Clock, Trophy, BookOpen } from 'lucide-react'
import { getTodasAulas, getProgressoGeralAluno, getEstatisticasProgresso } from '@/src/lib/supabase/queries/aulas'
import { AulaCard } from '@/src/components/aulas/AulaCard'
import { StatsCard } from '@/src/components/aulas/StatsCard'

/**
 * 📚 MINHAS AULAS - Método Alpha (Progressão Contínua)
 * Lista completa de 30 aulas sequenciais (0-29)
 * Maio a Dezembro 2025
 */

export const metadata = {
  title: 'Minhas Aulas | Nipo School',
  description: 'Acompanhe sua jornada musical com o Método Alpha - 30 aulas progressivas de música',
}

async function AulasContent() {
  // Buscar todas as aulas e progresso do aluno
  const aulas = await getTodasAulas()
  const progresso = await getProgressoGeralAluno('user-id') // TODO: pegar ID real do usuário
  const estatisticas = await getEstatisticasProgresso('user-id')

  return (
    <div className="space-y-6">
      {/* Estatísticas */}
      <StatsCard
        totalAulas={estatisticas?.totalAulas || 30}
        concluidas={estatisticas?.concluidas || 0}
        emAndamento={estatisticas?.emAndamento || 0}
        desafiosAprovados={estatisticas?.desafiosAprovados || 0}
      />

      {/* Info sobre o Método Alpha */}
      <div className="bg-gradient-to-r from-blue-50 to-indigo-50 rounded-xl p-6 border border-blue-100">
        <div className="flex items-start gap-4">
          <div className="w-12 h-12 bg-blue-600 rounded-xl flex items-center justify-center flex-shrink-0">
            <BookOpen className="w-6 h-6 text-white" />
          </div>
          <div className="flex-1">
            <h2 className="text-xl font-bold text-gray-900 mb-2">
              Método Alpha - Aprendizado Progressivo
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              No Método Alpha, você cresce musicalmente de forma contínua e natural. 
              Cada aula se constrói sobre a anterior, sem divisões artificiais por níveis. 
              Avance no seu ritmo e desenvolva suas habilidades gradualmente!
            </p>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div className="flex items-center gap-3 bg-white/50 rounded-lg p-3">
                <Calendar className="w-5 h-5 text-blue-600" />
                <div>
                  <div className="text-sm font-medium text-gray-900">30 Aulas</div>
                  <div className="text-xs text-gray-600">Mai - Dez 2025</div>
                </div>
              </div>
              <div className="flex items-center gap-3 bg-white/50 rounded-lg p-3">
                <Clock className="w-5 h-5 text-blue-600" />
                <div>
                  <div className="text-sm font-medium text-gray-900">Progressão Natural</div>
                  <div className="text-xs text-gray-600">Seu próprio ritmo</div>
                </div>
              </div>
              <div className="flex items-center gap-3 bg-white/50 rounded-lg p-3">
                <Trophy className="w-5 h-5 text-blue-600" />
                <div>
                  <div className="text-sm font-medium text-gray-900">Show Final</div>
                  <div className="text-xs text-gray-600">20 Dezembro</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Lista de Aulas */}
      <div>
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-2xl font-bold text-gray-900">
            Todas as Aulas
          </h2>
          <div className="text-sm text-gray-600">
            {estatisticas?.concluidas || 0} de {estatisticas?.totalAulas || 30} concluídas
          </div>
        </div>

        {aulas && aulas.length > 0 ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {aulas.map((aula) => {
              const progressoAula = progresso?.find(p => p.aula_id === aula.id)
              return (
                <AulaCard
                  key={aula.id}
                  aula={aula}
                  progresso={progressoAula}
                />
              )
            })}
          </div>
        ) : (
          <div className="text-center py-12 bg-gray-50 rounded-xl border-2 border-dashed border-gray-200">
            <Calendar className="w-12 h-12 text-gray-400 mx-auto mb-3" />
            <p className="text-gray-600 font-medium">Nenhuma aula disponível ainda</p>
            <p className="text-sm text-gray-500 mt-1">
              As aulas serão liberadas em breve. Aguarde!
            </p>
          </div>
        )}
      </div>

      {/* Próxima Aula Recomendada */}
      {estatisticas && estatisticas.proximaAula && (
        <div className="bg-gradient-to-r from-green-50 to-emerald-50 rounded-xl p-6 border border-green-100">
          <div className="flex items-center gap-3 mb-3">
            <div className="w-10 h-10 bg-green-600 rounded-lg flex items-center justify-center">
              <Trophy className="w-5 h-5 text-white" />
            </div>
            <div>
              <h3 className="font-bold text-gray-900">Próxima Aula Recomendada</h3>
              <p className="text-sm text-gray-600">Continue sua jornada musical</p>
            </div>
          </div>
          <div className="bg-white/70 rounded-lg p-4">
            <div className="font-semibold text-gray-900 mb-1">
              Aula {estatisticas.proximaAula.numero}: {estatisticas.proximaAula.titulo}
            </div>
            <div className="text-sm text-gray-600">
              {estatisticas.proximaAula.descricao_curta}
            </div>
          </div>
        </div>
      )}
    </div>
  )
}

export default function AulasPage() {
  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="bg-gradient-to-r from-blue-600 to-indigo-600 rounded-xl p-8 text-white">
        <h1 className="text-3xl font-bold mb-2">Minhas Aulas 📚</h1>
        <p className="text-blue-100 text-lg">
          Sua jornada musical com o Método Alpha
        </p>
      </div>

      {/* Content */}
      <Suspense fallback={
        <div className="text-center py-12">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
          <p className="text-gray-600 mt-4">Carregando aulas...</p>
        </div>
      }>
        <AulasContent />
      </Suspense>
    </div>
  )
}
