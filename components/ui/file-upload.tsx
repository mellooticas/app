'use client'

import { useState, useRef, useCallback } from 'react'
import { Upload, X, CheckCircle2, AlertCircle, Loader2, FileText, Music2, Video, Image as ImageIcon } from 'lucide-react'
import { supabase } from '@/lib/supabase/client'

interface FileUploadProps {
  bucket: string
  /** Path prefix inside bucket, e.g. "portfolios" or "challenges" */
  pathPrefix?: string
  /** Accepted MIME types, e.g. ['image/*', 'audio/*', 'video/*', 'application/pdf'] */
  accept?: string[]
  maxSizeMB?: number
  onUpload: (url: string, meta: { fileName: string; fileType: string; fileSize: number }) => void
  onRemove?: () => void
  /** Show current uploaded URL */
  currentUrl?: string
  label?: string
  hint?: string
  compact?: boolean
}

const TYPE_ICONS: Record<string, typeof FileText> = {
  audio: Music2,
  video: Video,
  image: ImageIcon,
  application: FileText,
}

function getFileIcon(type: string) {
  const prefix = type.split('/')[0]
  return TYPE_ICONS[prefix] || FileText
}

function formatSize(bytes: number) {
  if (bytes === 0) return '0 B'
  const k = 1024
  const sizes = ['B', 'KB', 'MB', 'GB']
  const i = Math.floor(Math.log(bytes) / Math.log(k))
  return `${(bytes / Math.pow(k, i)).toFixed(1)} ${sizes[i]}`
}

export default function FileUpload({
  bucket,
  pathPrefix = '',
  accept = ['image/*', 'audio/*', 'video/*', 'application/pdf'],
  maxSizeMB = 50,
  onUpload,
  onRemove,
  currentUrl,
  label = 'Upload de Arquivo',
  hint,
  compact = false,
}: FileUploadProps) {
  const [file, setFile] = useState<File | null>(null)
  const [uploading, setUploading] = useState(false)
  const [progress, setProgress] = useState(0)
  const [error, setError] = useState<string | null>(null)
  const [uploadedUrl, setUploadedUrl] = useState<string | null>(currentUrl || null)
  const [isDragging, setIsDragging] = useState(false)
  const inputRef = useRef<HTMLInputElement>(null)

  const validate = useCallback((f: File): string | null => {
    const maxBytes = maxSizeMB * 1024 * 1024
    if (f.size > maxBytes) return `Arquivo muito grande. Máximo: ${maxSizeMB}MB`

    // Check MIME type against accept patterns
    const accepted = accept.some(pattern => {
      if (pattern.endsWith('/*')) {
        return f.type.startsWith(pattern.replace('/*', '/'))
      }
      return f.type === pattern
    })
    if (!accepted) return 'Formato de arquivo não suportado'

    return null
  }, [accept, maxSizeMB])

  function handleFileSelect(selected: File) {
    setError(null)
    const err = validate(selected)
    if (err) {
      setError(err)
      return
    }
    setFile(selected)
  }

  function handleDrop(e: React.DragEvent) {
    e.preventDefault()
    setIsDragging(false)
    const dropped = e.dataTransfer.files[0]
    if (dropped) handleFileSelect(dropped)
  }

  async function handleUpload() {
    if (!file) return
    setUploading(true)
    setProgress(10)
    setError(null)

    try {
      // Get current user ID for path
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) {
        setError('Não autenticado')
        setUploading(false)
        return
      }

      const timestamp = Date.now()
      const safeName = file.name.replace(/[^a-zA-Z0-9._-]/g, '_')
      const prefix = pathPrefix ? `${pathPrefix}/` : ''
      const filePath = `${prefix}${user.id}/${timestamp}-${safeName}`

      setProgress(30)

      const { data, error: uploadError } = await supabase.storage
        .from(bucket)
        .upload(filePath, file, {
          cacheControl: '3600',
          upsert: false,
        })

      if (uploadError) {
        setError(uploadError.message)
        setUploading(false)
        return
      }

      setProgress(80)

      // Get public URL
      const { data: { publicUrl } } = supabase.storage
        .from(bucket)
        .getPublicUrl(data.path)

      setProgress(100)
      setUploadedUrl(publicUrl)
      onUpload(publicUrl, {
        fileName: file.name,
        fileType: file.type,
        fileSize: file.size,
      })
    } catch (err: any) {
      setError(err.message || 'Erro ao fazer upload')
    } finally {
      setUploading(false)
    }
  }

  function handleRemove() {
    setFile(null)
    setUploadedUrl(null)
    setProgress(0)
    setError(null)
    if (inputRef.current) inputRef.current.value = ''
    onRemove?.()
  }

  // Already uploaded state
  if (uploadedUrl && !file) {
    const Icon = getFileIcon(currentUrl || uploadedUrl)
    return (
      <div className="flex items-center gap-3 bg-green-50 border border-green-200 rounded-xl p-3">
        <CheckCircle2 className="w-5 h-5 text-green-600 flex-shrink-0" />
        <div className="flex-1 min-w-0">
          <p className="text-sm font-medium text-green-800 truncate">Arquivo enviado</p>
          <p className="text-xs text-green-600 truncate">{uploadedUrl}</p>
        </div>
        <button onClick={handleRemove} className="p-1.5 hover:bg-green-100 rounded-lg transition-colors">
          <X className="w-4 h-4 text-green-600" />
        </button>
      </div>
    )
  }

  // File selected but not yet uploaded
  if (file) {
    const Icon = getFileIcon(file.type)
    return (
      <div className="space-y-3">
        <div className="bg-white border border-gray-200 rounded-xl p-4">
          <div className="flex items-center gap-3 mb-3">
            <div className="p-2 bg-indigo-50 rounded-lg">
              <Icon className="w-5 h-5 text-indigo-600" />
            </div>
            <div className="flex-1 min-w-0">
              <p className="text-sm font-medium text-gray-900 truncate">{file.name}</p>
              <p className="text-xs text-gray-500">{formatSize(file.size)}</p>
            </div>
            {!uploading && (
              <button onClick={handleRemove} className="p-1.5 hover:bg-gray-100 rounded-lg transition-colors">
                <X className="w-4 h-4 text-gray-500" />
              </button>
            )}
          </div>

          {uploading && (
            <div className="mb-3">
              <div className="flex justify-between text-xs text-gray-500 mb-1">
                <span>Enviando...</span>
                <span>{progress}%</span>
              </div>
              <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
                <div
                  className="h-full bg-indigo-500 rounded-full transition-all duration-300"
                  style={{ width: `${progress}%` }}
                />
              </div>
            </div>
          )}

          {!uploading && (
            <button
              onClick={handleUpload}
              className="w-full py-2.5 bg-indigo-600 text-white rounded-lg text-sm font-bold hover:bg-indigo-700 transition-colors flex items-center justify-center gap-2"
            >
              <Upload className="w-4 h-4" />
              Enviar
            </button>
          )}
        </div>

        {error && (
          <div className="flex items-center gap-2 text-red-600 bg-red-50 border border-red-200 rounded-lg p-3 text-sm">
            <AlertCircle className="w-4 h-4 flex-shrink-0" />
            <span>{error}</span>
          </div>
        )}
      </div>
    )
  }

  // Drop zone
  return (
    <div className="space-y-2">
      <div
        onDragOver={e => { e.preventDefault(); setIsDragging(true) }}
        onDragLeave={e => { e.preventDefault(); setIsDragging(false) }}
        onDrop={handleDrop}
        onClick={() => inputRef.current?.click()}
        className={`border-2 border-dashed rounded-xl text-center cursor-pointer transition-all ${
          compact ? 'p-4' : 'p-6'
        } ${
          isDragging
            ? 'border-indigo-400 bg-indigo-50'
            : 'border-gray-200 bg-gray-50 hover:border-indigo-300 hover:bg-indigo-50/50'
        }`}
      >
        <input
          ref={inputRef}
          type="file"
          accept={accept.join(',')}
          onChange={e => { const f = e.target.files?.[0]; if (f) handleFileSelect(f) }}
          className="hidden"
        />
        <Upload className={`mx-auto mb-2 ${compact ? 'w-6 h-6' : 'w-8 h-8'} ${isDragging ? 'text-indigo-500' : 'text-gray-400'}`} />
        <p className={`font-medium text-gray-700 ${compact ? 'text-xs' : 'text-sm'}`}>
          {isDragging ? 'Solte o arquivo aqui' : label}
        </p>
        <p className={`text-gray-400 mt-1 ${compact ? 'text-[10px]' : 'text-xs'}`}>
          {hint || `Arraste ou clique para selecionar (máx ${maxSizeMB}MB)`}
        </p>
      </div>

      {error && (
        <div className="flex items-center gap-2 text-red-600 bg-red-50 border border-red-200 rounded-lg p-3 text-sm">
          <AlertCircle className="w-4 h-4 flex-shrink-0" />
          <span>{error}</span>
        </div>
      )}
    </div>
  )
}
