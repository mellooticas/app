'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'
import { PermissionGate } from '@/components/auth/PermissionGate'
import { evaluateAlerts, type Alert } from '@/lib/monitoring/alerts'
import { ShieldCheck, Activity, DollarSign, FileText, AlertTriangle, CheckCircle, XCircle, Clock } from 'lucide-react'

interface DailySummary {
  day: string
  request_count: number
  total_tokens: number
  total_cost_usd: number
  error_count: number
  avg_duration_ms: number
}

interface AuditEvent {
  id: string
  actor_name: string
  event_type: string
  target_type: string
  created_at: string
  new_value: any
  old_value: any
}

export default function SuperadminPage() {
  const [dailySummaries, setDailySummaries] = useState<DailySummary[]>([])
  const [auditEvents, setAuditEvents] = useState<AuditEvent[]>([])
  const [alerts, setAlerts] = useState<Alert[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchData() {
      try {
        // Fetch AI usage summary (last 30 days)
        const { data: summaries } = await (supabase as any)
          .from('v_ai_usage_summary')
          .select('*')
          .order('day', { ascending: false })
          .limit(30)

        setDailySummaries(summaries || [])

        // Fetch audit events (last 50)
        const { data: events } = await (supabase as any)
          .from('v_audit_events')
          .select('*')
          .order('created_at', { ascending: false })
          .limit(50)

        setAuditEvents(events || [])

        // Evaluate alerts
        const today = (summaries || [])[0] || null
        const last7 = (summaries || []).slice(1, 8)
        const weekAvg = last7.length > 0
          ? {
              avgCost: last7.reduce((s: number, d: DailySummary) => s + Number(d.total_cost_usd || 0), 0) / last7.length,
              avgErrors: last7.reduce((s: number, d: DailySummary) => s + Number(d.error_count || 0), 0) / last7.length,
            }
          : null
        setAlerts(evaluateAlerts(today, weekAvg))
      } catch (e) {
        console.error('Superadmin load error:', e)
      } finally {
        setLoading(false)
      }
    }

    fetchData()
  }, [])

  const today = dailySummaries[0]
  const monthTotal = dailySummaries.reduce((s, d) => s + Number(d.total_cost_usd || 0), 0)

  return (
    <PermissionGate
      permission="settings.manage"
      fallback={<div className="text-center py-16"><p className="text-gray-500">Sem permissão.</p></div>}
    >
      <div className="max-w-6xl mx-auto space-y-6">
        <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
          <ShieldCheck className="w-6 h-6 text-indigo-600" />
          Superadmin
        </h1>

        {loading && (
          <div className="text-center py-16">
            <div className="animate-spin w-8 h-8 border-2 border-indigo-600 border-t-transparent rounded-full mx-auto" />
            <p className="text-gray-500 mt-4">Carregando...</p>
          </div>
        )}

        {!loading && (
          <>
            {/* Alerts Banner */}
            {alerts.length > 0 && (
              <div className="space-y-2">
                {alerts.map(alert => (
                  <div
                    key={alert.id}
                    className={`flex items-center gap-3 p-4 rounded-lg border ${
                      alert.severity === 'critical'
                        ? 'bg-red-50 border-red-200'
                        : alert.severity === 'warning'
                        ? 'bg-yellow-50 border-yellow-200'
                        : 'bg-blue-50 border-blue-200'
                    }`}
                  >
                    <AlertTriangle className={`w-5 h-5 shrink-0 ${
                      alert.severity === 'critical' ? 'text-red-600' : alert.severity === 'warning' ? 'text-yellow-600' : 'text-blue-600'
                    }`} />
                    <div>
                      <p className="font-semibold text-gray-900">{alert.title}</p>
                      <p className="text-sm text-gray-600">{alert.message}</p>
                    </div>
                  </div>
                ))}
              </div>
            )}

            {/* System Health Summary */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
              <StatCard
                icon={Activity}
                label="Requisições Hoje"
                value={today?.request_count?.toString() || '0'}
                color="blue"
              />
              <StatCard
                icon={DollarSign}
                label="Custo Hoje (USD)"
                value={`$${Number(today?.total_cost_usd || 0).toFixed(4)}`}
                color="green"
              />
              <StatCard
                icon={DollarSign}
                label="Custo Mensal (USD)"
                value={`$${monthTotal.toFixed(4)}`}
                color="indigo"
              />
              <StatCard
                icon={Clock}
                label="Latência Média"
                value={today?.avg_duration_ms ? `${Math.round(today.avg_duration_ms)}ms` : 'N/A'}
                color="purple"
              />
            </div>

            {/* Error vs Success */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <StatCard
                icon={CheckCircle}
                label="Sucesso Hoje"
                value={String(Number(today?.request_count || 0) - Number(today?.error_count || 0))}
                color="green"
              />
              <StatCard
                icon={XCircle}
                label="Erros Hoje"
                value={today?.error_count?.toString() || '0'}
                color="red"
              />
            </div>

            {/* Daily Cost Table */}
            <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6">
              <h2 className="text-lg font-semibold text-gray-900 mb-4 flex items-center gap-2">
                <DollarSign className="w-5 h-5 text-green-600" />
                Custo IA por Dia
              </h2>
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="border-b border-gray-100">
                      <th className="text-left py-2 px-3 text-gray-500 font-medium">Data</th>
                      <th className="text-right py-2 px-3 text-gray-500 font-medium">Requisições</th>
                      <th className="text-right py-2 px-3 text-gray-500 font-medium">Tokens</th>
                      <th className="text-right py-2 px-3 text-gray-500 font-medium">Custo (USD)</th>
                      <th className="text-right py-2 px-3 text-gray-500 font-medium">Erros</th>
                      <th className="text-right py-2 px-3 text-gray-500 font-medium">Latência</th>
                    </tr>
                  </thead>
                  <tbody>
                    {dailySummaries.slice(0, 14).map(d => (
                      <tr key={d.day} className="border-b border-gray-50 hover:bg-gray-50">
                        <td className="py-2 px-3 text-gray-900">{new Date(d.day).toLocaleDateString('pt-BR')}</td>
                        <td className="py-2 px-3 text-right text-gray-700">{d.request_count}</td>
                        <td className="py-2 px-3 text-right text-gray-700">{Number(d.total_tokens).toLocaleString()}</td>
                        <td className="py-2 px-3 text-right text-gray-700">${Number(d.total_cost_usd).toFixed(4)}</td>
                        <td className="py-2 px-3 text-right">
                          <span className={Number(d.error_count) > 0 ? 'text-red-600 font-medium' : 'text-gray-400'}>
                            {d.error_count}
                          </span>
                        </td>
                        <td className="py-2 px-3 text-right text-gray-700">
                          {d.avg_duration_ms ? `${Math.round(Number(d.avg_duration_ms))}ms` : '-'}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              {dailySummaries.length === 0 && (
                <p className="text-center text-gray-500 py-8">Nenhum dado de uso IA registrado.</p>
              )}
            </div>

            {/* Audit Log */}
            <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6">
              <h2 className="text-lg font-semibold text-gray-900 mb-4 flex items-center gap-2">
                <FileText className="w-5 h-5 text-indigo-600" />
                Auditoria
              </h2>
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="border-b border-gray-100">
                      <th className="text-left py-2 px-3 text-gray-500 font-medium">Data</th>
                      <th className="text-left py-2 px-3 text-gray-500 font-medium">Ator</th>
                      <th className="text-left py-2 px-3 text-gray-500 font-medium">Evento</th>
                      <th className="text-left py-2 px-3 text-gray-500 font-medium">Alvo</th>
                    </tr>
                  </thead>
                  <tbody>
                    {auditEvents.map(e => (
                      <tr key={e.id} className="border-b border-gray-50 hover:bg-gray-50">
                        <td className="py-2 px-3 text-gray-500 text-xs">{new Date(e.created_at).toLocaleString('pt-BR')}</td>
                        <td className="py-2 px-3 text-gray-900">{e.actor_name || 'Sistema'}</td>
                        <td className="py-2 px-3">
                          <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-indigo-50 text-indigo-700">
                            {e.event_type}
                          </span>
                        </td>
                        <td className="py-2 px-3 text-gray-600">{e.target_type}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              {auditEvents.length === 0 && (
                <p className="text-center text-gray-500 py-8">Nenhum evento de auditoria registrado.</p>
              )}
            </div>
          </>
        )}
      </div>
    </PermissionGate>
  )
}

function StatCard({ icon: Icon, label, value, color }: {
  icon: any; label: string; value: string; color: string
}) {
  return (
    <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-5">
      <div className="flex items-center gap-3">
        <div className={`w-10 h-10 rounded-lg flex items-center justify-center bg-${color}-50`}>
          <Icon className={`w-5 h-5 text-${color}-600`} />
        </div>
        <div>
          <p className="text-xs text-gray-500 uppercase tracking-wide">{label}</p>
          <p className="text-xl font-bold text-gray-900">{value}</p>
        </div>
      </div>
    </div>
  )
}
