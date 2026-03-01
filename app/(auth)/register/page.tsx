'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import Image from 'next/image'
import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { z } from 'zod'
import { Mail, Lock, User, AlertCircle, ArrowLeft, Phone, Music, GraduationCap, Building2 } from 'lucide-react'
import { useAuth } from '@/app/providers/AuthProvider'
import { supabase } from '@/lib/supabase/client'

const registerSchema = z.object({
  name: z.string().min(3, 'Nome deve ter no mínimo 3 caracteres'),
  email: z.string().min(1, 'Email é obrigatório').email('Email inválido'),
  phone: z.string().optional(),
  password: z.string().min(6, 'Senha deve ter no mínimo 6 caracteres'),
  confirmPassword: z.string(),
  instrumentIds: z.array(z.string()),
  unitId: z.string().optional(),
  role: z.enum(['student', 'teacher']),
}).refine((data) => data.password === data.confirmPassword, {
  message: "Senhas não conferem",
  path: ["confirmPassword"],
})

type RegisterFormData = z.infer<typeof registerSchema>

interface Instrument {
  id: string
  name: string
}

interface Unit {
  id: string
  name: string
  city: string | null
}

export default function RegisterPage() {
  const router = useRouter()
  const { signUp } = useAuth()
  const [isLoading, setIsLoading] = useState(false)
  const [apiError, setApiError] = useState<string | null>(null)
  const [instruments, setInstruments] = useState<Instrument[]>([])
  const [units, setUnits] = useState<Unit[]>([])

  const {
    register,
    handleSubmit,
    watch,
    setValue,
    formState: { errors },
  } = useForm<RegisterFormData>({
    resolver: zodResolver(registerSchema),
    defaultValues: { role: 'student', instrumentIds: [] },
  })

  const selectedRole = watch('role')
  const selectedInstrumentIds = watch('instrumentIds') || []

  useEffect(() => {
    async function loadData() {
      const [instRes, unitsRes] = await Promise.all([
        supabase.from('instruments').select('id, name').eq('is_active', true).order('name'),
        supabase.from('units').select('id, name, city').eq('is_active', true).order('name'),
      ])
      if (instRes.data) setInstruments(instRes.data)
      if (unitsRes.data) setUnits(unitsRes.data)
    }
    loadData()
  }, [])

  function toggleInstrument(instrumentId: string) {
    const current = selectedInstrumentIds || []
    if (current.includes(instrumentId)) {
      setValue('instrumentIds', current.filter(id => id !== instrumentId))
    } else {
      setValue('instrumentIds', [...current, instrumentId])
    }
  }

  const onSubmit = async (data: RegisterFormData) => {
    setIsLoading(true)
    setApiError(null)

    try {
      await signUp(data.email, data.password, {
        full_name: data.name,
        role: data.role,
        phone: data.phone || null,
        primary_instrument_id: data.instrumentIds?.[0] || null,
        unit_id: data.unitId || null,
      })

      router.push('/login?registered=true')
    } catch (error: any) {
      console.error('Register error:', error)
      setApiError(error.message || 'Erro ao criar conta. Tente novamente.')
      setIsLoading(false)
    }
  }

  return (
    <div className="bg-white rounded-2xl shadow-xl p-8 border border-gray-100">

      {/* Header */}
      <div className="mb-8">
        <Link href="/" className="inline-flex items-center text-sm text-gray-500 hover:text-gray-700 mb-4 transition-colors">
          <ArrowLeft className="w-4 h-4 mr-1" />
          Voltar
        </Link>
        <div className="text-center">
          <div className="flex justify-center mb-4">
            <Image
              src="/logo.svg"
              alt="Nipo School"
              width={180}
              height={45}
              priority
            />
          </div>
          <p className="text-gray-600">
            Junte-se ao Nipo School
          </p>
        </div>
      </div>

      {/* API Error */}
      {apiError && (
        <div className="mb-6 p-4 bg-red-50 border border-red-200 rounded-lg flex items-start gap-3 animate-shake">
          <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
          <p className="text-sm text-red-600">{apiError}</p>
        </div>
      )}

      {/* Role Toggle */}
      <div className="mb-6">
        <div className="flex rounded-xl border border-gray-200 overflow-hidden">
          <button
            type="button"
            onClick={() => setValue('role', 'student')}
            className={`flex-1 flex items-center justify-center gap-2 py-3 text-sm font-bold transition-all ${
              selectedRole === 'student'
                ? 'bg-red-600 text-white'
                : 'bg-white text-gray-500 hover:bg-gray-50'
            }`}
          >
            <Music className="w-4 h-4" />
            Sou Aluno
          </button>
          <button
            type="button"
            onClick={() => setValue('role', 'teacher')}
            className={`flex-1 flex items-center justify-center gap-2 py-3 text-sm font-bold transition-all ${
              selectedRole === 'teacher'
                ? 'bg-blue-600 text-white'
                : 'bg-white text-gray-500 hover:bg-gray-50'
            }`}
          >
            <GraduationCap className="w-4 h-4" />
            Sou Professor
          </button>
        </div>
      </div>

      {/* Form */}
      <form onSubmit={handleSubmit(onSubmit)} className="space-y-5">
        {/* Name */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">Nome Completo</label>
          <div className="relative group">
            <User className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400 group-focus-within:text-red-500 transition-colors" />
            <input
              type="text"
              placeholder="Seu nome"
              {...register('name')}
              className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all"
            />
          </div>
          {errors.name && <p className="mt-1 text-sm text-red-600">{errors.name.message}</p>}
        </div>

        {/* Email */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">Email</label>
          <div className="relative group">
            <Mail className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400 group-focus-within:text-red-500 transition-colors" />
            <input
              type="email"
              placeholder="seu@email.com"
              {...register('email')}
              className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all"
            />
          </div>
          {errors.email && <p className="mt-1 text-sm text-red-600">{errors.email.message}</p>}
        </div>

        {/* Phone */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Telefone <span className="text-gray-400 font-normal">(opcional)</span>
          </label>
          <div className="relative group">
            <Phone className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400 group-focus-within:text-red-500 transition-colors" />
            <input
              type="tel"
              placeholder="(11) 99999-9999"
              {...register('phone')}
              className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all"
            />
          </div>
        </div>

        {/* Unit */}
        {units.length > 0 && (
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">Unidade</label>
            <div className="relative group">
              <Building2 className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400 group-focus-within:text-red-500 transition-colors" />
              <select
                {...register('unitId')}
                className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all bg-white appearance-none"
              >
                <option value="">Selecione a unidade</option>
                {units.map(unit => (
                  <option key={unit.id} value={unit.id}>
                    {unit.name}{unit.city ? ` (${unit.city})` : ''}
                  </option>
                ))}
              </select>
            </div>
          </div>
        )}

        {/* Instruments (multi-select) */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">
            {selectedRole === 'teacher' ? 'Instrumentos que leciona' : 'Instrumentos de interesse'}
            <span className="text-gray-400 font-normal ml-1">(selecione um ou mais)</span>
          </label>
          <div className="grid grid-cols-2 gap-2">
            {instruments.map(inst => (
              <label
                key={inst.id}
                className={`flex items-center gap-2 px-3 py-2.5 rounded-lg border cursor-pointer transition-all text-sm ${
                  selectedInstrumentIds.includes(inst.id)
                    ? selectedRole === 'teacher'
                      ? 'border-blue-300 bg-blue-50 text-blue-700 font-medium'
                      : 'border-red-300 bg-red-50 text-red-700 font-medium'
                    : 'border-gray-200 hover:border-gray-300 text-gray-600'
                }`}
              >
                <input
                  type="checkbox"
                  checked={selectedInstrumentIds.includes(inst.id)}
                  onChange={() => toggleInstrument(inst.id)}
                  className={`rounded border-gray-300 ${
                    selectedRole === 'teacher'
                      ? 'text-blue-600 focus:ring-blue-500'
                      : 'text-red-600 focus:ring-red-500'
                  }`}
                />
                <Music className="w-3.5 h-3.5" />
                {inst.name}
              </label>
            ))}
          </div>
        </div>

        {/* Password */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">Senha</label>
          <div className="relative group">
            <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400 group-focus-within:text-red-500 transition-colors" />
            <input
              type="password"
              placeholder="••••••••"
              {...register('password')}
              className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all"
            />
          </div>
          {errors.password && <p className="mt-1 text-sm text-red-600">{errors.password.message}</p>}
        </div>

        {/* Confirm Password */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">Confirmar Senha</label>
          <div className="relative group">
            <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400 group-focus-within:text-red-500 transition-colors" />
            <input
              type="password"
              placeholder="••••••••"
              {...register('confirmPassword')}
              className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all"
            />
          </div>
          {errors.confirmPassword && <p className="mt-1 text-sm text-red-600">{errors.confirmPassword.message}</p>}
        </div>

        <button
          type="submit"
          disabled={isLoading}
          className={`w-full bg-gradient-to-r ${
            selectedRole === 'teacher'
              ? 'from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700'
              : 'from-red-600 to-orange-600 hover:from-red-700 hover:to-orange-700'
          } text-white font-bold py-3 px-4 rounded-lg transition-all shadow-md hover:shadow-lg transform hover:-translate-y-0.5 disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center`}
        >
          {isLoading ? (
            <div className="w-6 h-6 border-2 border-white border-t-transparent rounded-full animate-spin" />
          ) : (
            'Criar Conta'
          )}
        </button>
      </form>

      {/* Footer */}
      <div className="mt-8 text-center">
        <p className="text-gray-600">
          Já tem uma conta?{' '}
          <Link href="/login" className="text-red-600 hover:text-red-700 font-medium transition-colors">
            Fazer login
          </Link>
        </p>
      </div>
    </div>
  )
}
