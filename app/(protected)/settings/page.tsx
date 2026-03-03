'use client'

import { PermissionGate } from '@/components/auth/PermissionGate'
import { Settings, Users, Building2, Shield, Lock, GraduationCap, ShieldCheck, Database } from 'lucide-react'
import Link from 'next/link'

export default function SettingsPage() {
  return (
    <PermissionGate permission="settings.view" fallback={<div className="text-center py-16"><p className="text-gray-500">Sem permissão para acessar configurações.</p></div>}>
      <div className="max-w-3xl mx-auto space-y-6">
        <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
          <Settings className="w-6 h-6 text-gray-500" />
          Configurações
        </h1>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <SettingsCard
            href="/settings/users"
            icon={Users}
            title="Usuários"
            desc="Gerenciar usuários, roles e permissões"
            color="purple"
          />
          <SettingsCard
            href="/settings/school"
            icon={Building2}
            title="Escola"
            desc="Dados da escola, unidades e configurações gerais"
            color="blue"
          />
          <SettingsCard
            href="/settings/enrollments"
            icon={GraduationCap}
            title="Matrículas"
            desc="Gerenciar matrículas de alunos em turmas"
            color="green"
          />
          <SettingsCard
            href="/settings/roles"
            icon={Lock}
            title="Roles e Permissões"
            desc="Gerenciar roles, permissões e navegação por role"
            color="indigo"
          />
          <SettingsCard
            href="/settings/users"
            icon={Shield}
            title="Segurança"
            desc="Políticas de acesso e autenticação"
            color="red"
          />
          <SettingsCard
            href="/settings/superadmin"
            icon={ShieldCheck}
            title="Superadmin"
            desc="Saúde do sistema, custos IA e auditoria"
            color="slate"
          />
          <SettingsCard
            href="/settings/data-quality"
            icon={Database}
            title="Qualidade de Dados"
            desc="Completude e integridade dos dados"
            color="cyan"
          />
        </div>
      </div>
    </PermissionGate>
  )
}

function SettingsCard({ href, icon: Icon, title, desc, color }: {
  href: string; icon: any; title: string; desc: string; color: string
}) {
  return (
    <Link href={href} className="group">
      <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 hover:shadow-md hover:border-gray-200 transition-all">
        <div className={`w-10 h-10 bg-${color}-50 rounded-lg flex items-center justify-center text-${color}-600 mb-4`}>
          <Icon className="w-5 h-5" />
        </div>
        <h3 className="font-bold text-gray-900 mb-1 group-hover:text-gray-700">{title}</h3>
        <p className="text-sm text-gray-500">{desc}</p>
      </div>
    </Link>
  )
}
