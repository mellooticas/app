'use client'

import { QrCode, Plus, Download, Trash2 } from 'lucide-react'
import { PermissionGate } from '@/components/auth/PermissionGate'

export default function QRManagePage() {
  return (
    <PermissionGate permission="admin.access" fallback={<p className="text-center py-16 text-gray-500">Acesso restrito a administradores.</p>}>
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
            <QrCode className="w-6 h-6 text-gray-700" />
            QR Codes
          </h1>
          <button className="flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-xl font-bold hover:bg-gray-800 transition-colors">
            <Plus className="w-4 h-4" />
            Gerar QR Code
          </button>
        </div>

        <div className="bg-white rounded-xl border border-gray-100 p-8 text-center">
          <QrCode className="w-16 h-16 text-gray-300 mx-auto mb-4" />
          <h3 className="text-lg font-bold text-gray-900 mb-2">Gerador de QR Codes</h3>
          <p className="text-sm text-gray-500 max-w-md mx-auto mb-6">
            Gere QR codes para facilitar o acesso dos alunos a aulas, desafios e materiais.
          </p>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4 max-w-2xl mx-auto">
            <div className="bg-gray-50 rounded-xl p-4">
              <h4 className="font-bold text-sm text-gray-700 mb-1">Presença</h4>
              <p className="text-xs text-gray-500">QR para registro de frequência</p>
            </div>
            <div className="bg-gray-50 rounded-xl p-4">
              <h4 className="font-bold text-sm text-gray-700 mb-1">Materiais</h4>
              <p className="text-xs text-gray-500">QR para acessar recursos digitais</p>
            </div>
            <div className="bg-gray-50 rounded-xl p-4">
              <h4 className="font-bold text-sm text-gray-700 mb-1">Desafios</h4>
              <p className="text-xs text-gray-500">QR para iniciar desafios Alpha</p>
            </div>
          </div>
        </div>
      </div>
    </PermissionGate>
  )
}
