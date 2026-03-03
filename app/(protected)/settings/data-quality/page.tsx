'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { PermissionGate } from '@/components/auth/PermissionGate'
import { Database, AlertTriangle, CheckCircle, BarChart3 } from 'lucide-react'

interface TableMetrics {
  total: number
  completeness_pct: number
  [key: string]: any
}

interface CompletenessReport {
  profiles: TableMetrics
  lessons: TableMetrics
  challenge_submissions: TableMetrics & { pending_grade: number }
  portfolios: TableMetrics & { missing_feedback: number }
  ai_content: { total: number; errors: number; health_pct: number }
  user_roles: { total: number; inactive: number }
}

export default function DataQualityPage() {
  const [report, setReport] = useState<CompletenessReport | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchReport() {
      try {
        const { data: { session } } = await supabase.auth.getSession()
        if (!session?.access_token) {
          setError('Não autenticado')
          return
        }

        const claims = JSON.parse(atob(session.access_token.split('.')[1]))
        const tenantId = claims.tenant_id

        const { data, error: rpcError } = await (supabase as any).rpc(
          'rpc_data_completeness_report',
          { p_tenant_id: tenantId }
        )

        if (rpcError) {
          setError(rpcError.message)
          return
        }

        if (data?.error) {
          setError(data.error)
          return
        }

        setReport(data)
      } catch (e) {
        setError('Erro ao carregar relatório')
      } finally {
        setLoading(false)
      }
    }

    fetchReport()
  }, [])

  return (
    <PermissionGate
      permission="settings.manage"
      fallback={<div className="text-center py-16"><p className="text-gray-500">Sem permissão.</p></div>}
    >
      <div className="max-w-5xl mx-auto space-y-6">
        <div className="flex items-center justify-between">
          <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
            <Database className="w-6 h-6 text-blue-600" />
            Qualidade de Dados
          </h1>
        </div>

        {loading && (
          <div className="text-center py-16">
            <div className="animate-spin w-8 h-8 border-2 border-blue-600 border-t-transparent rounded-full mx-auto" />
            <p className="text-gray-500 mt-4">Analisando dados...</p>
          </div>
        )}

        {error && (
          <div className="bg-red-50 border border-red-200 rounded-lg p-4 flex items-center gap-3">
            <AlertTriangle className="w-5 h-5 text-red-600 shrink-0" />
            <p className="text-red-800">{error}</p>
          </div>
        )}

        {report && (
          <div className="space-y-6">
            {/* Overall Score */}
            <OverallScore report={report} />

            {/* Table Cards */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
              <MetricCard
                title="Perfis"
                total={report.profiles.total}
                pct={report.profiles.completeness_pct}
                issues={[
                  { label: 'Sem nome', count: report.profiles.missing_name },
                  { label: 'Sem avatar', count: report.profiles.missing_avatar },
                ]}
              />
              <MetricCard
                title="Aulas"
                total={report.lessons.total}
                pct={report.lessons.completeness_pct}
                issues={[
                  { label: 'Sem objetivo', count: report.lessons.missing_objective },
                  { label: 'Sem descrição', count: report.lessons.missing_description },
                ]}
              />
              <MetricCard
                title="Submissões"
                total={report.challenge_submissions.total}
                pct={report.challenge_submissions.completeness_pct}
                issues={[
                  { label: 'Sem nota', count: report.challenge_submissions.pending_grade },
                ]}
              />
              <MetricCard
                title="Portfólios"
                total={report.portfolios.total}
                pct={report.portfolios.completeness_pct}
                issues={[
                  { label: 'Sem feedback', count: report.portfolios.missing_feedback },
                ]}
              />
              <MetricCard
                title="Conteúdo IA"
                total={report.ai_content.total}
                pct={report.ai_content.health_pct}
                issues={[
                  { label: 'Com erro', count: report.ai_content.errors },
                ]}
              />
              <MetricCard
                title="Roles Atribuídos"
                total={report.user_roles.total}
                pct={report.user_roles.inactive === 0 ? 100 : Math.round(((report.user_roles.total - report.user_roles.inactive) / report.user_roles.total) * 100)}
                issues={[
                  { label: 'Inativos', count: report.user_roles.inactive },
                ]}
              />
            </div>
          </div>
        )}
      </div>
    </PermissionGate>
  )
}

function OverallScore({ report }: { report: CompletenessReport }) {
  const scores = [
    report.profiles.completeness_pct,
    report.lessons.completeness_pct,
    report.challenge_submissions.completeness_pct,
    report.portfolios.completeness_pct,
    report.ai_content.health_pct,
  ]
  const avg = Math.round(scores.reduce((a, b) => a + b, 0) / scores.length)
  const color = avg >= 90 ? 'green' : avg >= 70 ? 'yellow' : 'red'

  return (
    <div className={`bg-${color}-50 border border-${color}-200 rounded-xl p-6 flex items-center gap-4`}>
      <div className={`w-16 h-16 rounded-full flex items-center justify-center bg-${color}-100`}>
        {avg >= 90 ? (
          <CheckCircle className={`w-8 h-8 text-${color}-600`} />
        ) : (
          <BarChart3 className={`w-8 h-8 text-${color}-600`} />
        )}
      </div>
      <div>
        <p className="text-3xl font-bold text-gray-900">{avg}%</p>
        <p className="text-sm text-gray-600">
          Completude geral dos dados
          {avg >= 90 ? ' — Excelente!' : avg >= 70 ? ' — Boa, mas pode melhorar' : ' — Atenção necessária'}
        </p>
      </div>
    </div>
  )
}

function MetricCard({ title, total, pct, issues }: {
  title: string
  total: number
  pct: number
  issues: { label: string; count: number }[]
}) {
  const color = pct >= 90 ? 'green' : pct >= 70 ? 'yellow' : 'red'

  return (
    <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-5">
      <div className="flex items-center justify-between mb-3">
        <h3 className="font-semibold text-gray-900">{title}</h3>
        <span className="text-xs text-gray-500">{total} registros</span>
      </div>

      {/* Progress bar */}
      <div className="w-full h-2 bg-gray-100 rounded-full mb-3">
        <div
          className={`h-2 rounded-full bg-${color}-500 transition-all`}
          style={{ width: `${pct}%` }}
        />
      </div>

      <div className="flex items-center justify-between mb-2">
        <span className={`text-lg font-bold text-${color}-600`}>{pct}%</span>
        <span className="text-xs text-gray-500">completo</span>
      </div>

      {/* Issues */}
      {issues.filter(i => i.count > 0).length > 0 && (
        <div className="space-y-1 mt-3 pt-3 border-t border-gray-100">
          {issues.filter(i => i.count > 0).map(issue => (
            <div key={issue.label} className="flex items-center justify-between text-sm">
              <span className="text-gray-600">{issue.label}</span>
              <span className="text-orange-600 font-medium">{issue.count}</span>
            </div>
          ))}
        </div>
      )}

      {issues.filter(i => i.count > 0).length === 0 && (
        <p className="text-xs text-green-600 mt-2 flex items-center gap-1">
          <CheckCircle className="w-3 h-3" /> Todos os campos obrigatórios preenchidos
        </p>
      )}
    </div>
  )
}
