/**
 * Alert system for the Superadmin dashboard.
 * Checks for anomalies and returns active alerts.
 */

export interface Alert {
  id: string
  severity: 'critical' | 'warning' | 'info'
  title: string
  message: string
  timestamp: string
}

interface UsageSummary {
  day: string
  request_count: number
  total_tokens: number
  total_cost_usd: number
  error_count: number
  avg_duration_ms: number
}

/**
 * Check all alert conditions and return active alerts
 */
export function evaluateAlerts(
  todaySummary: UsageSummary | null,
  weekAvg: { avgCost: number; avgErrors: number } | null
): Alert[] {
  const alerts: Alert[] = []
  const now = new Date().toISOString()

  if (!todaySummary) return alerts

  // AI cost spike: today > 200% of 7-day average
  if (weekAvg && weekAvg.avgCost > 0) {
    const costRatio = todaySummary.total_cost_usd / weekAvg.avgCost
    if (costRatio > 2) {
      alerts.push({
        id: 'ai-cost-spike',
        severity: 'warning',
        title: 'Pico de custo IA',
        message: `Custo hoje ($${todaySummary.total_cost_usd.toFixed(4)}) é ${Math.round(costRatio * 100)}% da média semanal ($${weekAvg.avgCost.toFixed(4)})`,
        timestamp: now,
      })
    }
  }

  // High error rate: > 10% of requests errored
  if (todaySummary.request_count > 5 && todaySummary.error_count > 0) {
    const errorRate = todaySummary.error_count / todaySummary.request_count
    if (errorRate > 0.1) {
      alerts.push({
        id: 'high-error-rate',
        severity: 'critical',
        title: 'Taxa alta de erros IA',
        message: `${todaySummary.error_count} erros em ${todaySummary.request_count} requisições (${Math.round(errorRate * 100)}%)`,
        timestamp: now,
      })
    }
  }

  // Slow responses: avg > 10s
  if (todaySummary.avg_duration_ms && todaySummary.avg_duration_ms > 10000) {
    alerts.push({
      id: 'slow-ai-responses',
      severity: 'warning',
      title: 'Respostas IA lentas',
      message: `Tempo médio de resposta: ${Math.round(todaySummary.avg_duration_ms / 1000)}s (limite: 10s)`,
      timestamp: now,
    })
  }

  // High token usage: > 80% of daily limit (500k default)
  if (todaySummary.total_tokens > 400000) {
    alerts.push({
      id: 'high-token-usage',
      severity: 'info',
      title: 'Uso alto de tokens',
      message: `${todaySummary.total_tokens.toLocaleString()} tokens usados hoje (limite: 500.000)`,
      timestamp: now,
    })
  }

  return alerts
}
