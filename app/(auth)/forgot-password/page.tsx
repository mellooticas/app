'use client'

import { useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { ArrowLeft, Mail, AlertCircle, CheckCircle2, Send } from 'lucide-react'
import { supabase } from '@/lib/supabase/client'

export default function ForgotPasswordPage() {
  const [email, setEmail] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [sentTo, setSentTo] = useState('')

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!email.trim()) return

    setLoading(true)
    setError('')

    try {
      const redirectTo = `${window.location.origin}/auth/callback?next=/set-password`
      const { error } = await supabase.auth.resetPasswordForEmail(email.trim(), { redirectTo })

      if (error) {
        setError(error.message)
        return
      }

      setSentTo(email.trim())
      setEmail('')
    } catch (err: any) {
      setError(err?.message || 'Erro ao enviar email de recuperacao')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="bg-white rounded-2xl shadow-xl p-8 border border-gray-100">
      <div className="mb-8">
        <Link href="/login" className="inline-flex items-center text-sm text-gray-500 hover:text-gray-700 mb-4 transition-colors">
          <ArrowLeft className="w-4 h-4 mr-1" />
          Voltar para login
        </Link>
        <div className="text-center">
          <div className="flex justify-center mb-4">
            <Image src="/logo.svg" alt="Nipo School" width={180} height={45} priority />
          </div>
          <p className="text-gray-600">Recupere o acesso da sua conta</p>
        </div>
      </div>

      {sentTo ? (
        <div className="space-y-6">
          <div className="p-4 bg-green-50 border border-green-200 rounded-lg flex items-start gap-3">
            <CheckCircle2 className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
            <div className="text-sm text-green-700">
              <p className="font-medium mb-1">Email enviado</p>
              <p>Se existir uma conta para <span className="font-semibold">{sentTo}</span>, voce recebera um link para redefinir a senha.</p>
            </div>
          </div>

          <button
            type="button"
            onClick={() => setSentTo('')}
            className="w-full py-3 bg-gray-900 text-white rounded-lg font-semibold hover:bg-gray-800 transition-colors"
          >
            Enviar para outro email
          </button>
        </div>
      ) : (
        <form onSubmit={handleSubmit} className="space-y-5">
          {error && (
            <div className="p-4 bg-red-50 border border-red-200 rounded-lg flex items-start gap-3">
              <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
              <p className="text-sm text-red-600">{error}</p>
            </div>
          )}

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">Email</label>
            <div className="relative group">
              <Mail className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400 group-focus-within:text-red-500 transition-colors" />
              <input
                type="email"
                value={email}
                onChange={e => setEmail(e.target.value)}
                placeholder="seu@email.com"
                required
                className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all"
              />
            </div>
            <p className="mt-2 text-sm text-gray-500">
              Enviaremos um link seguro para voce criar uma nova senha.
            </p>
          </div>

          <button
            type="submit"
            disabled={loading || !email.trim()}
            className="w-full py-3 bg-gradient-to-r from-red-600 to-orange-600 text-white font-semibold rounded-lg hover:from-red-700 hover:to-orange-700 disabled:opacity-50 disabled:cursor-not-allowed transition-all shadow-md hover:shadow-lg flex items-center justify-center gap-2"
          >
            <Send className="w-4 h-4" />
            {loading ? 'Enviando...' : 'Enviar link de recuperacao'}
          </button>
        </form>
      )}
    </div>
  )
}
