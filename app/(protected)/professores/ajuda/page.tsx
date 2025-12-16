'use client'

import { Construction } from 'lucide-react'
import { useRouter } from 'next/navigation'

export default function AjudaPage() {
    const router = useRouter()
    return (
        <div className="min-h-[60vh] flex flex-col items-center justify-center p-8 text-center bg-white rounded-3xl border border-gray-100 shadow-sm">
            <div className="bg-green-50 p-6 rounded-full mb-6 animate-pulse">
                <Construction className="w-12 h-12 text-green-600" />
            </div>
            <h1 className="text-2xl font-bold text-gray-900 mb-2">Ajuda & Suporte</h1>
            <p className="text-gray-500 max-w-md mb-8">
                Tutoriais e canal de suporte. Em breve.
            </p>
            <button onClick={() => router.back()} className="text-green-600 font-bold hover:underline">Voltar</button>
        </div>
    )
}
