'use client'

import { useMemo, useState } from 'react'
import QRCode from 'qrcode'
import { QrCode, Download, Link as LinkIcon, CheckCircle2 } from 'lucide-react'
import { PermissionGate } from '@/components/auth/PermissionGate'

type QRKind = 'attendance' | 'materials' | 'challenge'

const PRESETS: Record<QRKind, { label: string; hint: string; path: string }> = {
  attendance: {
    label: 'Presenca',
    hint: 'Use para abrir um registro de aula ou chamada.',
    path: '/schedule',
  },
  materials: {
    label: 'Materiais',
    hint: 'Use para levar o aluno a recursos e biblioteca.',
    path: '/documents',
  },
  challenge: {
    label: 'Desafio',
    hint: 'Use para iniciar um desafio ou atividade orientada.',
    path: '/challenges',
  },
}

export default function QRManagePage() {
  const [kind, setKind] = useState<QRKind>('attendance')
  const [title, setTitle] = useState('')
  const [path, setPath] = useState(PRESETS.attendance.path)
  const [qrUrl, setQrUrl] = useState('')
  const [generatedUrl, setGeneratedUrl] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)

  const siteUrl = useMemo(() => {
    if (typeof window !== 'undefined') return window.location.origin
    return process.env.NEXT_PUBLIC_SITE_URL || ''
  }, [])

  function handleKindChange(next: QRKind) {
    setKind(next)
    setPath(PRESETS[next].path)
  }

  async function handleGenerate() {
    setLoading(true)
    setError('')

    try {
      const safePath = path.startsWith('/') ? path : `/${path}`
      const targetUrl = `${siteUrl}${safePath}`
      const dataUrl = await QRCode.toDataURL(targetUrl, {
        width: 320,
        margin: 2,
        errorCorrectionLevel: 'M',
        color: {
          dark: '#111827',
          light: '#FFFFFF',
        },
      })

      setGeneratedUrl(targetUrl)
      setQrUrl(dataUrl)
    } catch (err: any) {
      setError(err?.message || 'Nao foi possivel gerar o QR code')
    } finally {
      setLoading(false)
    }
  }

  function handleDownload() {
    if (!qrUrl) return
    const link = document.createElement('a')
    link.href = qrUrl
    link.download = `${kind}-${title.trim() || 'qr-code'}.png`
    link.click()
  }

  return (
    <PermissionGate permission='admin.access' fallback={<p className='text-center py-16 text-gray-500'>Acesso restrito a administradores.</p>}>
      <div className='space-y-6'>
        <div className='flex items-center justify-between'>
          <h1 className='text-2xl font-bold text-gray-900 flex items-center gap-2'>
            <QrCode className='w-6 h-6 text-gray-700' />
            QR Codes
          </h1>
          <button
            onClick={handleGenerate}
            disabled={loading || !path.trim() || !siteUrl}
            className='flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-xl font-bold hover:bg-gray-800 transition-colors disabled:opacity-50'
          >
            <QrCode className='w-4 h-4' />
            {loading ? 'Gerando...' : 'Gerar QR Code'}
          </button>
        </div>

        <div className='grid gap-6 lg:grid-cols-[1.1fr,0.9fr]'>
          <div className='bg-white rounded-xl border border-gray-100 p-6 space-y-5'>
            <div>
              <label className='block text-sm font-medium text-gray-700 mb-2'>Tipo</label>
              <div className='grid grid-cols-1 md:grid-cols-3 gap-3'>
                {(Object.keys(PRESETS) as QRKind[]).map((preset) => (
                  <button
                    key={preset}
                    type='button'
                    onClick={() => handleKindChange(preset)}
                    className={`text-left rounded-xl border p-4 transition-colors ${kind === preset ? 'border-gray-900 bg-gray-900 text-white' : 'border-gray-200 bg-gray-50 text-gray-700 hover:border-gray-300'}`}
                  >
                    <p className='font-bold text-sm mb-1'>{PRESETS[preset].label}</p>
                    <p className={`text-xs ${kind === preset ? 'text-gray-200' : 'text-gray-500'}`}>{PRESETS[preset].hint}</p>
                  </button>
                ))}
              </div>
            </div>

            <div>
              <label className='block text-sm font-medium text-gray-700 mb-2'>Titulo interno</label>
              <input
                value={title}
                onChange={e => setTitle(e.target.value)}
                placeholder='Ex: Aula de cordas - turma B'
                className='w-full px-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-gray-200'
              />
            </div>

            <div>
              <label className='block text-sm font-medium text-gray-700 mb-2'>Caminho de destino</label>
              <div className='relative'>
                <LinkIcon className='absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400' />
                <input
                  value={path}
                  onChange={e => setPath(e.target.value)}
                  placeholder='/challenges'
                  className='w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-gray-200'
                />
              </div>
              <p className='mt-2 text-xs text-gray-500'>O QR vai apontar para `site_url + caminho`. Use rotas reais do app.</p>
            </div>

            {error && (
              <div className='rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700'>
                {error}
              </div>
            )}

            {siteUrl && (
              <div className='rounded-xl border border-gray-200 bg-gray-50 px-4 py-3 text-sm text-gray-600'>
                Base atual: <span className='font-medium text-gray-900'>{siteUrl}</span>
              </div>
            )}
          </div>

          <div className='bg-white rounded-xl border border-gray-100 p-6'>
            {qrUrl ? (
              <div className='space-y-4 text-center'>
                <div className='flex items-center justify-center gap-2 text-emerald-700 text-sm font-medium'>
                  <CheckCircle2 className='w-4 h-4' />
                  QR code pronto
                </div>
                <img src={qrUrl} alt='QR code gerado' className='mx-auto rounded-2xl border border-gray-100' />
                <div className='text-sm text-gray-600 break-all rounded-xl bg-gray-50 p-3'>
                  {generatedUrl}
                </div>
                <button
                  onClick={handleDownload}
                  className='w-full inline-flex items-center justify-center gap-2 px-4 py-3 bg-emerald-600 text-white rounded-xl font-bold hover:bg-emerald-700 transition-colors'
                >
                  <Download className='w-4 h-4' />
                  Baixar PNG
                </button>
              </div>
            ) : (
              <div className='h-full min-h-[380px] flex flex-col items-center justify-center text-center text-gray-500'>
                <QrCode className='w-16 h-16 text-gray-300 mb-4' />
                <h3 className='text-lg font-bold text-gray-900 mb-2'>Gerador de QR Codes</h3>
                <p className='text-sm max-w-sm'>
                  Gere QR codes para presenca, materiais e desafios usando rotas reais do app.
                </p>
              </div>
            )}
          </div>
        </div>
      </div>
    </PermissionGate>
  )
}