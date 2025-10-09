/**
 * 👨‍💼 DASHBOARD ADMIN
 * 
 * Painel administrativo do sistema com:
 * - Estatísticas gerais (usuários, instrumentos, conquistas)
 * - Atividade recente
 * - Usuários recentes
 * - Ações administrativas rápidas
 */

import React from 'react'
import { Users, Music, Trophy, Award, UserPlus, TrendingUp, Activity, Shield } from 'lucide-react'
import { Link } from 'react-router-dom'
import { ROUTES } from '../../../lib/constants/routes'
import { NipoCard, NipoCardBody, NipoCardStat } from '../../../components/shared/NipoCard'
import { NipoButton } from '../../../components/shared/NipoButton'

export const AdminDashboard: React.FC = () => {
  // Mock data - em produção virá da API
  const stats = {
    totalUsuarios: 156,
    totalInstrumentos: 12,
    totalConquistas: 45,
    turmasAtivas: 18,
  }

  const atividadeRecente = [
    { 
      id: 1, 
      tipo: 'novo_usuario', 
      descricao: 'Novo aluno cadastrado: Yuki Tanaka', 
      tempo: '5 min atrás',
      icone: <UserPlus className="w-5 h-5 text-green-600" />
    },
    { 
      id: 2, 
      tipo: 'conquista', 
      descricao: 'Nova conquista desbloqueada por 3 alunos', 
      tempo: '1 hora atrás',
      icone: <Trophy className="w-5 h-5 text-yellow-600" />
    },
    { 
      id: 3, 
      tipo: 'sistema', 
      descricao: 'Backup automático concluído com sucesso', 
      tempo: '2 horas atrás',
      icone: <Shield className="w-5 h-5 text-blue-600" />
    },
    { 
      id: 4, 
      tipo: 'instrumento', 
      descricao: 'Novo instrumento adicionado: Biwa', 
      tempo: '3 horas atrás',
      icone: <Music className="w-5 h-5 text-purple-600" />
    },
  ]

  const usuariosRecentes = [
    { 
      id: 1, 
      nome: 'Yuki Tanaka', 
      role: 'Aluno', 
      status: 'Ativo',
      cadastro: '2024-01-15'
    },
    { 
      id: 2, 
      nome: 'Prof. Kenji Suzuki', 
      role: 'Professor', 
      status: 'Ativo',
      cadastro: '2024-01-14'
    },
    { 
      id: 3, 
      nome: 'Sakura Yamamoto', 
      role: 'Aluno', 
      status: 'Ativo',
      cadastro: '2024-01-13'
    },
  ]

  const getRoleBadgeColor = (role: string) => {
    switch (role) {
      case 'Admin': return 'bg-red-100 text-red-800'
      case 'Professor': return 'bg-blue-100 text-blue-800'
      case 'Aluno': return 'bg-green-100 text-green-800'
      default: return 'bg-gray-100 text-gray-800'
    }
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-3xl font-bold text-gray-900 mb-2">
          Painel Administrativo 👨‍💼
        </h1>
        <p className="text-gray-600">
          Gerencie usuários, instrumentos, conquistas e monitore a atividade do sistema.
        </p>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <NipoCardStat
          label="Total de Usuários"
          value={stats.totalUsuarios.toString()}
          icon={<Users className="w-6 h-6" />}
          trend="up"
          trendValue="+12 este mês"
        />
        <NipoCardStat
          label="Instrumentos"
          value={stats.totalInstrumentos.toString()}
          icon={<Music className="w-6 h-6" />}
        />
        <NipoCardStat
          label="Conquistas"
          value={stats.totalConquistas.toString()}
          icon={<Trophy className="w-6 h-6" />}
        />
        <NipoCardStat
          label="Turmas Ativas"
          value={stats.turmasAtivas.toString()}
          icon={<Activity className="w-6 h-6" />}
          trend="up"
          trendValue="+2 esta semana"
        />
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Atividade Recente */}
        <NipoCard title="Atividade Recente">
          <NipoCardBody>
            <div className="space-y-3">
              {atividadeRecente.map((atividade) => (
                <div
                  key={atividade.id}
                  className="flex items-start gap-3 p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors"
                >
                  <div className="w-10 h-10 rounded-full bg-white flex items-center justify-center flex-shrink-0 border border-gray-200">
                    {atividade.icone}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm text-gray-900">{atividade.descricao}</p>
                    <p className="text-xs text-gray-500 mt-1">{atividade.tempo}</p>
                  </div>
                </div>
              ))}
            </div>
            <div className="mt-4 pt-4 border-t">
              <Link to={ROUTES.ADMIN.AUDIT}>
                <NipoButton variant="outline" fullWidth>
                  Ver Log Completo
                </NipoButton>
              </Link>
            </div>
          </NipoCardBody>
        </NipoCard>

        {/* Usuários Recentes */}
        <NipoCard title="Usuários Recentes">
          <NipoCardBody>
            <div className="space-y-3">
              {usuariosRecentes.map((usuario) => (
                <div
                  key={usuario.id}
                  className="flex items-center justify-between p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors"
                >
                  <div className="flex items-center gap-3 flex-1 min-w-0">
                    <div className="w-10 h-10 rounded-full bg-gradient-to-br from-[var(--color-sakura)] to-[var(--color-indigo)] flex items-center justify-center flex-shrink-0">
                      <span className="text-white font-bold text-sm">
                        {usuario.nome.charAt(0)}
                      </span>
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="font-medium text-gray-900 truncate">{usuario.nome}</p>
                      <div className="flex items-center gap-2 mt-1">
                        <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${getRoleBadgeColor(usuario.role)}`}>
                          {usuario.role}
                        </span>
                        <span className="text-xs text-gray-500">{usuario.cadastro}</span>
                      </div>
                    </div>
                  </div>
                  <NipoButton size="sm" variant="ghost">
                    Ver
                  </NipoButton>
                </div>
              ))}
            </div>
            <div className="mt-4 pt-4 border-t">
              <Link to={ROUTES.ADMIN.USERS}>
                <NipoButton variant="outline" fullWidth>
                  Ver Todos os Usuários ({stats.totalUsuarios})
                </NipoButton>
              </Link>
            </div>
          </NipoCardBody>
        </NipoCard>
      </div>

      {/* Quick Actions Grid */}
      <NipoCard title="Gestão do Sistema">
        <NipoCardBody>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
            <Link to={ROUTES.ADMIN.USER_NEW}>
              <NipoButton variant="primary" fullWidth leftIcon={<UserPlus className="w-4 h-4" />}>
                Novo Usuário
              </NipoButton>
            </Link>
            <Link to={ROUTES.ADMIN.INSTRUMENTS}>
              <NipoButton variant="outline" fullWidth leftIcon={<Music className="w-4 h-4" />}>
                Instrumentos
              </NipoButton>
            </Link>
            <Link to={ROUTES.ADMIN.ACHIEVEMENTS}>
              <NipoButton variant="outline" fullWidth leftIcon={<Trophy className="w-4 h-4" />}>
                Conquistas
              </NipoButton>
            </Link>
            <Link to={ROUTES.ADMIN.CHALLENGES}>
              <NipoButton variant="outline" fullWidth leftIcon={<Award className="w-4 h-4" />}>
                Desafios
              </NipoButton>
            </Link>
          </div>
        </NipoCardBody>
      </NipoCard>

      {/* Analytics Summary */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <NipoCard title="Engajamento">
          <NipoCardBody>
            <div className="space-y-4">
              <div className="flex items-center justify-between">
                <span className="text-sm text-gray-600">Taxa de Conclusão</span>
                <span className="text-lg font-bold text-green-600">78%</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div className="bg-green-500 h-2 rounded-full" style={{ width: '78%' }}></div>
              </div>
              
              <div className="flex items-center justify-between mt-4">
                <span className="text-sm text-gray-600">Usuários Ativos (7d)</span>
                <span className="text-lg font-bold text-blue-600">124</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div className="bg-blue-500 h-2 rounded-full" style={{ width: '80%' }}></div>
              </div>
            </div>
          </NipoCardBody>
        </NipoCard>

        <NipoCard title="Crescimento">
          <NipoCardBody>
            <div className="space-y-4">
              <div className="flex items-center gap-3">
                <TrendingUp className="w-8 h-8 text-green-500" />
                <div>
                  <p className="text-sm text-gray-600">Este Mês</p>
                  <p className="text-2xl font-bold text-gray-900">+24%</p>
                </div>
              </div>
              <p className="text-sm text-gray-500 mt-2">
                12 novos alunos e 2 novos professores cadastrados neste mês.
              </p>
            </div>
          </NipoCardBody>
        </NipoCard>

        <NipoCard title="Ações Necessárias">
          <NipoCardBody>
            <div className="space-y-3">
              <div className="flex items-center justify-between p-2 bg-amber-50 rounded">
                <span className="text-sm text-gray-700">Submissões pendentes</span>
                <span className="text-sm font-bold text-amber-600">8</span>
              </div>
              <div className="flex items-center justify-between p-2 bg-blue-50 rounded">
                <span className="text-sm text-gray-700">Novos cadastros</span>
                <span className="text-sm font-bold text-blue-600">3</span>
              </div>
              <div className="flex items-center justify-between p-2 bg-green-50 rounded">
                <span className="text-sm text-gray-700">Sistema OK</span>
                <span className="text-sm font-bold text-green-600">✓</span>
              </div>
            </div>
          </NipoCardBody>
        </NipoCard>
      </div>
    </div>
  )
}
