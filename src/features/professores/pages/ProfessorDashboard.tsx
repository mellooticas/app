/**
 * 👨‍🏫 DASHBOARD DO PROFESSOR
 * 
 * Painel principal do professor com:
 * - Estatísticas de turmas e alunos
 * - Submissões pendentes de avaliação
 * - Calendário de aulas próximas
 * - Materiais recentes
 */

import React from 'react'
import { Users, FileText, Calendar, BookOpen, Clock, CheckCircle, AlertCircle } from 'lucide-react'
import { Link } from 'react-router-dom'
import { ROUTES } from '../../../lib/constants/routes'
import { NipoCard, NipoCardBody, NipoCardStat } from '../../../components/shared/NipoCard'
import { NipoButton } from '../../../components/shared/NipoButton'

export const ProfessorDashboard: React.FC = () => {
  // Mock data - em produção virá da API
  const stats = {
    totalTurmas: 5,
    totalAlunos: 48,
    submissoesPendentes: 12,
    aulasSemana: 8,
  }

  const submissoesPendentes = [
    { 
      id: 1, 
      aluno: 'Yuki Tanaka', 
      desafio: 'Técnicas de Shamisen', 
      data: '2024-01-14',
      tempo: '2 dias atrás'
    },
    { 
      id: 2, 
      aluno: 'Kenji Suzuki', 
      desafio: 'História do Koto', 
      data: '2024-01-13',
      tempo: '3 dias atrás'
    },
    { 
      id: 3, 
      aluno: 'Sakura Yamamoto', 
      desafio: 'Afinação Tradicional', 
      data: '2024-01-12',
      tempo: '4 dias atrás'
    },
  ]

  const proximasAulas = [
    { 
      id: 1, 
      turma: 'Shamisen Básico', 
      horario: 'Hoje, 14:00', 
      alunos: 12,
      sala: 'Sala 101'
    },
    { 
      id: 2, 
      turma: 'Koto Intermediário', 
      horario: 'Amanhã, 15:30', 
      alunos: 10,
      sala: 'Sala 203'
    },
    { 
      id: 3, 
      turma: 'Shakuhachi Avançado', 
      horario: 'Ter, 16:00', 
      alunos: 8,
      sala: 'Sala 305'
    },
  ]

  const materiaisRecentes = [
    { id: 1, titulo: 'Partituras de Sakura Sakura', tipo: 'PDF', data: '2024-01-15' },
    { id: 2, titulo: 'Vídeo: Técnica de Arco', tipo: 'Vídeo', data: '2024-01-14' },
    { id: 3, titulo: 'Áudio: Exemplo de Ritmo', tipo: 'Áudio', data: '2024-01-13' },
  ]

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-3xl font-bold text-gray-900 mb-2">
          Área do Professor 👨‍🏫
        </h1>
        <p className="text-gray-600">
          Gerencie suas turmas, avalie submissões e acompanhe o progresso dos alunos.
        </p>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <NipoCardStat
          label="Turmas Ativas"
          value={stats.totalTurmas.toString()}
          icon={<Users className="w-6 h-6" />}
        />
        <NipoCardStat
          label="Total de Alunos"
          value={stats.totalAlunos.toString()}
          icon={<Users className="w-6 h-6" />}
          trend="up"
          trendValue="+3 este mês"
        />
        <NipoCardStat
          label="Submissões Pendentes"
          value={stats.submissoesPendentes.toString()}
          icon={<AlertCircle className="w-6 h-6" />}
          trend="down"
          trendValue="Requer atenção"
        />
        <NipoCardStat
          label="Aulas esta Semana"
          value={stats.aulasSemana.toString()}
          icon={<Calendar className="w-6 h-6" />}
        />
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Submissões Pendentes */}
        <NipoCard title="Submissões para Avaliar">
          <NipoCardBody>
            <div className="space-y-3">
              {submissoesPendentes.map((submissao) => (
                <div
                  key={submissao.id}
                  className="flex items-start justify-between p-3 bg-amber-50 border border-amber-200 rounded-lg hover:bg-amber-100 transition-colors"
                >
                  <div className="flex items-start gap-3 flex-1">
                    <div className="w-10 h-10 rounded-full bg-amber-500/20 flex items-center justify-center flex-shrink-0">
                      <FileText className="w-5 h-5 text-amber-700" />
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="font-medium text-gray-900">{submissao.aluno}</p>
                      <p className="text-sm text-gray-600 truncate">{submissao.desafio}</p>
                      <p className="text-xs text-gray-500 mt-1">
                        <Clock className="w-3 h-3 inline mr-1" />
                        {submissao.tempo}
                      </p>
                    </div>
                  </div>
                  <NipoButton size="sm" variant="primary">
                    Avaliar
                  </NipoButton>
                </div>
              ))}
            </div>
            <div className="mt-4 pt-4 border-t">
              <Link to={ROUTES.PROFESSOR.SUBMISSIONS}>
                <NipoButton variant="outline" fullWidth>
                  Ver Todas as Submissões ({stats.submissoesPendentes})
                </NipoButton>
              </Link>
            </div>
          </NipoCardBody>
        </NipoCard>

        {/* Próximas Aulas */}
        <NipoCard title="Próximas Aulas">
          <NipoCardBody>
            <div className="space-y-3">
              {proximasAulas.map((aula) => (
                <div
                  key={aula.id}
                  className="flex items-start justify-between p-3 bg-blue-50 border border-blue-200 rounded-lg hover:bg-blue-100 transition-colors"
                >
                  <div className="flex items-start gap-3 flex-1">
                    <div className="w-10 h-10 rounded-full bg-blue-500/20 flex items-center justify-center flex-shrink-0">
                      <Calendar className="w-5 h-5 text-blue-700" />
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="font-medium text-gray-900">{aula.turma}</p>
                      <p className="text-sm text-gray-600">{aula.horario}</p>
                      <p className="text-xs text-gray-500 mt-1">
                        {aula.alunos} alunos • {aula.sala}
                      </p>
                    </div>
                  </div>
                  <NipoButton size="sm" variant="ghost">
                    Ver
                  </NipoButton>
                </div>
              ))}
            </div>
            <div className="mt-4 pt-4 border-t">
              <Link to={ROUTES.PROFESSOR.CALENDAR}>
                <NipoButton variant="outline" fullWidth>
                  Ver Calendário Completo
                </NipoButton>
              </Link>
            </div>
          </NipoCardBody>
        </NipoCard>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Materiais Recentes */}
        <NipoCard title="Materiais Recentes">
          <NipoCardBody>
            <div className="space-y-3">
              {materiaisRecentes.map((material) => (
                <div
                  key={material.id}
                  className="flex items-center justify-between p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors"
                >
                  <div className="flex items-center gap-3 flex-1 min-w-0">
                    <div className="w-10 h-10 rounded-full bg-[var(--color-indigo)]/10 flex items-center justify-center flex-shrink-0">
                      <BookOpen className="w-5 h-5 text-[var(--color-indigo)]" />
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="font-medium text-gray-900 truncate">{material.titulo}</p>
                      <p className="text-sm text-gray-500">
                        {material.tipo} • {material.data}
                      </p>
                    </div>
                  </div>
                  <NipoButton size="sm" variant="ghost">
                    Abrir
                  </NipoButton>
                </div>
              ))}
            </div>
            <div className="mt-4 pt-4 border-t">
              <Link to={ROUTES.PROFESSOR.MATERIALS}>
                <NipoButton variant="outline" fullWidth>
                  Ver Todos os Materiais
                </NipoButton>
              </Link>
            </div>
          </NipoCardBody>
        </NipoCard>

        {/* Quick Actions */}
        <NipoCard title="Ações Rápidas">
          <NipoCardBody>
            <div className="space-y-3">
              <Link to={ROUTES.PROFESSOR.CLASSES}>
                <NipoButton variant="outline" fullWidth leftIcon={<Users className="w-4 h-4" />}>
                  Gerenciar Turmas
                </NipoButton>
              </Link>
              <Link to={ROUTES.PROFESSOR.SUBMISSIONS}>
                <NipoButton variant="outline" fullWidth leftIcon={<FileText className="w-4 h-4" />}>
                  Avaliar Submissões
                </NipoButton>
              </Link>
              <Link to={ROUTES.PROFESSOR.MATERIALS}>
                <NipoButton variant="outline" fullWidth leftIcon={<BookOpen className="w-4 h-4" />}>
                  Upload de Material
                </NipoButton>
              </Link>
              <Link to={ROUTES.PROFESSOR.REPORTS}>
                <NipoButton variant="outline" fullWidth leftIcon={<CheckCircle className="w-4 h-4" />}>
                  Relatórios de Progresso
                </NipoButton>
              </Link>
            </div>
          </NipoCardBody>
        </NipoCard>
      </div>
    </div>
  )
}
