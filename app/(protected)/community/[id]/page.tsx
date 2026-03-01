'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { MessageSquare, ArrowLeft, User, Heart, Clock, Send, Loader2 } from 'lucide-react'
import Link from 'next/link'
import { replyToTopic, likeTopic } from '@/app/actions/community-actions'
import type { Tables } from '@/lib/supabase/database.types'

type Topic = Tables<'v_forum_topics'>

export default function TopicDetailPage() {
  const { id } = useParams<{ id: string }>()
  const [topic, setTopic] = useState<Topic | null>(null)
  const [replies, setReplies] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [newReply, setNewReply] = useState('')
  const [sending, setSending] = useState(false)
  const [error, setError] = useState('')

  async function loadData() {
    try {
      const { data: t } = await supabase.from('v_forum_topics').select('*').eq('id', id).single()
      if (t) setTopic(t as Topic)

      const { data: r } = await supabase
        .from('forum_replies')
        .select('*, profiles:author_id(full_name, display_name)')
        .eq('topic_id', id)
        .order('created_at', { ascending: true })
      if (r) setReplies(r)
    } catch (error) {
      console.error('Error:', error)
    }
  }

  useEffect(() => {
    if (id) loadData().finally(() => setLoading(false))
  }, [id])

  async function handleReply(e: React.FormEvent) {
    e.preventDefault()
    if (!newReply.trim()) return
    setSending(true)
    setError('')

    const result = await replyToTopic({
      topic_id: id,
      content: newReply.trim(),
    })

    if ('error' in result) {
      setError(result.error)
    } else {
      setNewReply('')
      await loadData()
    }
    setSending(false)
  }

  async function handleLike() {
    await likeTopic(id)
    await loadData()
  }

  if (loading) return <div className="space-y-6 animate-pulse"><div className="h-48 bg-gray-200 rounded-2xl" /><div className="h-64 bg-gray-200 rounded-2xl" /></div>
  if (!topic) return <div className="text-center py-16"><p className="text-gray-500">Tópico não encontrado.</p><Link href="/community" className="text-orange-600 hover:underline mt-4 inline-block">Voltar</Link></div>

  return (
    <div className="space-y-6 max-w-3xl mx-auto">
      <Link href="/community" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar ao Fórum
      </Link>

      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
        <div className="flex items-start gap-4 mb-4">
          <div className="w-12 h-12 bg-orange-50 rounded-full flex items-center justify-center shrink-0">
            {topic.author_avatar ? (
              <img src={topic.author_avatar} alt="" className="w-full h-full rounded-full object-cover" />
            ) : (
              <User className="w-6 h-6 text-orange-400" />
            )}
          </div>
          <div className="flex-1">
            <h1 className="text-xl font-bold text-gray-900">{topic.title}</h1>
            <div className="flex items-center gap-3 mt-1 text-xs text-gray-400">
              <span>{topic.author_name}</span>
              <span className="flex items-center gap-1"><Clock className="w-3 h-3" />{new Date(topic.created_at).toLocaleDateString('pt-BR')}</span>
              {topic.category && <span className="bg-orange-50 text-orange-600 px-2 py-0.5 rounded font-medium">{topic.category}</span>}
            </div>
          </div>
        </div>

        <div className="text-sm text-gray-600 whitespace-pre-wrap border-t border-gray-100 pt-4">
          {topic.content}
        </div>

        <div className="flex items-center gap-4 mt-4 pt-4 border-t border-gray-100">
          <button onClick={handleLike} className="flex items-center gap-2 text-sm text-gray-500 hover:text-red-500 transition-colors">
            <Heart className="w-4 h-4" /> {topic.like_count || 0}
          </button>
          <span className="flex items-center gap-2 text-sm text-gray-500">
            <MessageSquare className="w-4 h-4" /> {topic.reply_count || 0} respostas
          </span>
        </div>
      </div>

      {/* Replies */}
      <div>
        <h2 className="text-lg font-bold text-gray-900 mb-4">Respostas</h2>

        {replies.length === 0 ? (
          <div className="text-center py-8 bg-white rounded-xl border border-gray-100">
            <MessageSquare className="w-8 h-8 text-gray-300 mx-auto mb-2" />
            <p className="text-sm text-gray-500">Nenhuma resposta ainda. Seja o primeiro!</p>
          </div>
        ) : (
          <div className="space-y-3">
            {replies.map((r: any) => (
              <div key={r.id} className="bg-white rounded-xl border border-gray-100 p-4">
                <div className="flex items-center gap-3 mb-2">
                  <div className="w-8 h-8 bg-gray-100 rounded-full flex items-center justify-center">
                    <User className="w-4 h-4 text-gray-400" />
                  </div>
                  <span className="font-bold text-sm text-gray-900">{r.profiles?.full_name || r.profiles?.display_name || 'Anônimo'}</span>
                  <span className="text-xs text-gray-400">{new Date(r.created_at).toLocaleDateString('pt-BR')}</span>
                </div>
                <p className="text-sm text-gray-600 ml-11">{r.content}</p>
              </div>
            ))}
          </div>
        )}

        {error && <div className="bg-red-50 text-red-700 border border-red-200 rounded-xl px-4 py-3 text-sm mt-4">{error}</div>}

        <form onSubmit={handleReply} className="mt-4 bg-white rounded-xl border border-gray-100 p-4 flex items-start gap-3">
          <textarea
            value={newReply}
            onChange={e => setNewReply(e.target.value)}
            placeholder="Escreva sua resposta..."
            rows={2}
            className="flex-1 px-4 py-2 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-orange-200"
          />
          <button
            type="submit"
            disabled={!newReply.trim() || sending}
            className="px-4 py-2 bg-orange-600 text-white rounded-xl font-bold hover:bg-orange-700 transition-colors disabled:opacity-50 flex items-center gap-2"
          >
            {sending ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
            Responder
          </button>
        </form>
      </div>
    </div>
  )
}
