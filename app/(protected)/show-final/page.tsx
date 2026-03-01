'use client'

import { Star, Calendar, Music, Users } from 'lucide-react'

export default function ShowFinalPage() {
  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
        <Star className="w-6 h-6 text-yellow-500" />
        Show Final
      </h1>

      <div className="bg-gradient-to-br from-yellow-400 via-amber-500 to-orange-600 rounded-2xl p-8 text-white shadow-xl">
        <div className="flex items-center gap-4 mb-6">
          <div className="w-16 h-16 bg-white/20 rounded-2xl flex items-center justify-center">
            <Music className="w-8 h-8" />
          </div>
          <div>
            <h2 className="text-2xl font-bold">Apresentação Final</h2>
            <p className="text-amber-100">O grande momento de mostrar tudo o que você aprendeu!</p>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div className="bg-white rounded-xl border border-gray-100 p-6 text-center">
          <Calendar className="w-8 h-8 text-blue-500 mx-auto mb-3" />
          <h3 className="font-bold text-gray-900 mb-1">Data</h3>
          <p className="text-sm text-gray-500">A ser definida</p>
        </div>
        <div className="bg-white rounded-xl border border-gray-100 p-6 text-center">
          <Users className="w-8 h-8 text-green-500 mx-auto mb-3" />
          <h3 className="font-bold text-gray-900 mb-1">Participantes</h3>
          <p className="text-sm text-gray-500">Todos os alunos</p>
        </div>
        <div className="bg-white rounded-xl border border-gray-100 p-6 text-center">
          <Star className="w-8 h-8 text-amber-500 mx-auto mb-3" />
          <h3 className="font-bold text-gray-900 mb-1">Repertório</h3>
          <p className="text-sm text-gray-500">Obras do semestre</p>
        </div>
      </div>

      <div className="bg-white rounded-xl border border-gray-100 p-6">
        <h3 className="font-bold text-gray-900 mb-4">Como se Preparar</h3>
        <ul className="space-y-3 text-sm text-gray-600">
          <li className="flex items-start gap-3">
            <span className="w-6 h-6 bg-amber-100 rounded-full flex items-center justify-center text-amber-700 font-bold text-xs shrink-0">1</span>
            Pratique as peças selecionadas diariamente
          </li>
          <li className="flex items-start gap-3">
            <span className="w-6 h-6 bg-amber-100 rounded-full flex items-center justify-center text-amber-700 font-bold text-xs shrink-0">2</span>
            Complete os desafios semanais para ganhar confiança
          </li>
          <li className="flex items-start gap-3">
            <span className="w-6 h-6 bg-amber-100 rounded-full flex items-center justify-center text-amber-700 font-bold text-xs shrink-0">3</span>
            Grave suas práticas e revise com seu professor
          </li>
          <li className="flex items-start gap-3">
            <span className="w-6 h-6 bg-amber-100 rounded-full flex items-center justify-center text-amber-700 font-bold text-xs shrink-0">4</span>
            Divirta-se! A música é para ser compartilhada
          </li>
        </ul>
      </div>
    </div>
  )
}
