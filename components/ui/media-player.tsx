'use client'

import { useState, useRef } from 'react'
import { Play, Pause, Volume2, VolumeX, Download, FileText, Music2, Video } from 'lucide-react'
import YouTubeEmbed from './youtube-embed'

type MediaType = 'youtube' | 'video' | 'audio' | 'pdf' | 'image' | 'unknown'

interface MediaPlayerProps {
  url: string
  title?: string
  type?: MediaType
  className?: string
}

function detectMediaType(url: string): MediaType {
  if (!url) return 'unknown'
  const lower = url.toLowerCase()

  // YouTube
  if (lower.includes('youtube.com') || lower.includes('youtu.be')) return 'youtube'

  // By extension
  if (/\.(mp4|webm|mov|avi)(\?|$)/i.test(lower)) return 'video'
  if (/\.(mp3|wav|ogg|m4a|flac|aac)(\?|$)/i.test(lower)) return 'audio'
  if (/\.pdf(\?|$)/i.test(lower)) return 'pdf'
  if (/\.(jpg|jpeg|png|gif|webp|svg|avif)(\?|$)/i.test(lower)) return 'image'

  // By MIME hint in Supabase Storage URLs
  if (lower.includes('audio/') || lower.includes('/audio')) return 'audio'
  if (lower.includes('video/') || lower.includes('/video')) return 'video'
  if (lower.includes('/image') || lower.includes('image/')) return 'image'

  return 'unknown'
}

export default function MediaPlayer({ url, title, type, className = '' }: MediaPlayerProps) {
  const mediaType = type || detectMediaType(url)

  switch (mediaType) {
    case 'youtube':
      return <YouTubeEmbed url={url} title={title} className={className} />
    case 'video':
      return <VideoDisplay url={url} title={title} className={className} />
    case 'audio':
      return <AudioDisplay url={url} title={title} className={className} />
    case 'pdf':
      return <PDFDisplay url={url} title={title} className={className} />
    case 'image':
      return <ImageDisplay url={url} title={title} className={className} />
    default:
      return <FallbackDisplay url={url} title={title} className={className} />
  }
}

function VideoDisplay({ url, title, className }: { url: string; title?: string; className: string }) {
  return (
    <div className={`rounded-xl overflow-hidden bg-black ${className}`}>
      <video
        src={url}
        controls
        preload="metadata"
        className="w-full aspect-video"
        title={title}
      >
        Seu navegador não suporta vídeo HTML5.
      </video>
    </div>
  )
}

function AudioDisplay({ url, title, className }: { url: string; title?: string; className: string }) {
  const [isPlaying, setIsPlaying] = useState(false)
  const [progress, setProgress] = useState(0)
  const [duration, setDuration] = useState(0)
  const [currentTime, setCurrentTime] = useState(0)
  const audioRef = useRef<HTMLAudioElement>(null)

  function togglePlay() {
    const audio = audioRef.current
    if (!audio) return
    if (isPlaying) {
      audio.pause()
    } else {
      audio.play()
    }
    setIsPlaying(!isPlaying)
  }

  function handleTimeUpdate() {
    const audio = audioRef.current
    if (!audio) return
    setCurrentTime(audio.currentTime)
    setProgress(audio.duration ? (audio.currentTime / audio.duration) * 100 : 0)
  }

  function handleSeek(e: React.MouseEvent<HTMLDivElement>) {
    const audio = audioRef.current
    if (!audio || !audio.duration) return
    const rect = e.currentTarget.getBoundingClientRect()
    const pct = (e.clientX - rect.left) / rect.width
    audio.currentTime = pct * audio.duration
  }

  function formatTime(s: number) {
    const m = Math.floor(s / 60)
    const sec = Math.floor(s % 60)
    return `${m}:${sec.toString().padStart(2, '0')}`
  }

  return (
    <div className={`bg-gradient-to-r from-indigo-50 to-purple-50 border border-indigo-100 rounded-xl p-4 ${className}`}>
      <audio
        ref={audioRef}
        src={url}
        preload="metadata"
        onTimeUpdate={handleTimeUpdate}
        onLoadedMetadata={() => { if (audioRef.current) setDuration(audioRef.current.duration) }}
        onEnded={() => setIsPlaying(false)}
      />
      <div className="flex items-center gap-3">
        <button
          onClick={togglePlay}
          className="w-10 h-10 flex-shrink-0 rounded-full bg-indigo-600 hover:bg-indigo-700 text-white flex items-center justify-center transition-colors"
        >
          {isPlaying ? <Pause className="w-4 h-4" /> : <Play className="w-4 h-4 ml-0.5" />}
        </button>
        <div className="flex-1 min-w-0">
          {title && <p className="text-sm font-medium text-gray-900 truncate mb-1">{title}</p>}
          <div className="flex items-center gap-2">
            <div className="flex-1 h-2 bg-indigo-100 rounded-full cursor-pointer" onClick={handleSeek}>
              <div
                className="h-full bg-indigo-500 rounded-full transition-all"
                style={{ width: `${progress}%` }}
              />
            </div>
            <span className="text-xs text-gray-500 flex-shrink-0 tabular-nums">
              {formatTime(currentTime)} / {formatTime(duration)}
            </span>
          </div>
        </div>
        <Music2 className="w-5 h-5 text-indigo-400 flex-shrink-0" />
      </div>
    </div>
  )
}

function PDFDisplay({ url, title, className }: { url: string; title?: string; className: string }) {
  return (
    <div className={`rounded-xl border border-gray-200 overflow-hidden ${className}`}>
      <div className="bg-gray-50 px-4 py-3 flex items-center justify-between border-b border-gray-200">
        <div className="flex items-center gap-2 min-w-0">
          <FileText className="w-4 h-4 text-red-500 flex-shrink-0" />
          <span className="text-sm font-medium text-gray-700 truncate">{title || 'Documento PDF'}</span>
        </div>
        <a
          href={url}
          target="_blank"
          rel="noopener noreferrer"
          className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-bold text-gray-600 hover:text-gray-900 bg-white border border-gray-200 rounded-lg hover:shadow-sm transition-all"
        >
          <Download className="w-3.5 h-3.5" />
          Baixar
        </a>
      </div>
      <iframe
        src={url}
        className="w-full h-[500px]"
        title={title || 'PDF'}
      />
    </div>
  )
}

function ImageDisplay({ url, title, className }: { url: string; title?: string; className: string }) {
  return (
    <div className={`rounded-xl overflow-hidden ${className}`}>
      <img
        src={url}
        alt={title || 'Imagem'}
        className="w-full h-auto object-contain max-h-[600px]"
        loading="lazy"
      />
    </div>
  )
}

function FallbackDisplay({ url, title, className }: { url: string; title?: string; className: string }) {
  return (
    <a
      href={url}
      target="_blank"
      rel="noopener noreferrer"
      className={`flex items-center gap-3 p-4 bg-gray-50 border border-gray-200 rounded-xl hover:bg-gray-100 transition-colors ${className}`}
    >
      <Download className="w-5 h-5 text-gray-500" />
      <div className="min-w-0">
        <p className="text-sm font-medium text-gray-900 truncate">{title || 'Arquivo'}</p>
        <p className="text-xs text-gray-500 truncate">{url}</p>
      </div>
    </a>
  )
}

export { detectMediaType }
export type { MediaType }
