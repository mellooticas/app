'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { ArrowLeft, Heart, MessageCircle, Share2, Play, User } from 'lucide-react'
import Link from 'next/link'
import type { Tables } from '@/lib/supabase/database.types'

type Post = Tables<'v_feed_posts'>
type Comment = Tables<'v_feed_comments'>

export default function FeedPostPage() {
  const { id } = useParams<{ id: string }>()
  const [post, setPost] = useState<Post | null>(null)
  const [comments, setComments] = useState<Comment[]>([])
  const [loading, setLoading] = useState(true)
  const [newComment, setNewComment] = useState('')

  useEffect(() => {
    async function load() {
      try {
        const { data: p } = await supabase.from('v_feed_posts').select('*').eq('id', id).single()
        if (p) setPost(p as Post)

        const { data: c } = await supabase.from('v_feed_comments').select('*').eq('post_id', id).order('created_at')
        if (c) setComments(c as Comment[])
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  if (loading) return <div className="space-y-6 animate-pulse"><div className="h-64 bg-gray-200 rounded-2xl" /><div className="h-32 bg-gray-200 rounded-2xl" /></div>
  if (!post) return <div className="text-center py-16"><p className="text-gray-500">Post não encontrado.</p><Link href="/feed" className="text-pink-600 hover:underline mt-4 inline-block">Voltar</Link></div>

  return (
    <div className="space-y-6 max-w-2xl mx-auto">
      <Link href="/feed" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar ao Feed
      </Link>

      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
        {/* Author */}
        <div className="p-4 flex items-center gap-3">
          <div className="w-10 h-10 bg-gray-100 rounded-full flex items-center justify-center">
            {post.author_avatar ? (
              <img src={post.author_avatar} alt="" className="w-full h-full rounded-full object-cover" />
            ) : (
              <User className="w-5 h-5 text-gray-400" />
            )}
          </div>
          <div>
            <p className="font-bold text-sm text-gray-900">{post.author_display_name || post.author_name}</p>
            <p className="text-xs text-gray-400">{new Date(post.created_at).toLocaleDateString('pt-BR', { day: 'numeric', month: 'short', hour: '2-digit', minute: '2-digit' })}</p>
          </div>
        </div>

        {/* Media */}
        {post.media_url && (
          <div className="bg-black aspect-video flex items-center justify-center">
            {post.content_type === 'video' ? (
              <video controls className="w-full h-full" src={post.media_url} poster={post.thumbnail_url || undefined} />
            ) : post.content_type === 'audio' ? (
              <div className="w-full p-8">
                <audio controls className="w-full" src={post.media_url} />
              </div>
            ) : post.content_type === 'image' ? (
              <img src={post.media_url} alt="" className="w-full h-full object-contain" />
            ) : null}
          </div>
        )}

        {/* Caption */}
        <div className="p-4">
          {post.caption && <p className="text-sm text-gray-700 whitespace-pre-wrap">{post.caption}</p>}
          {post.challenge_title && (
            <p className="text-xs text-indigo-500 mt-2">Desafio: {post.challenge_title}</p>
          )}
        </div>

        {/* Actions */}
        <div className="px-4 pb-4 flex items-center gap-6 border-t border-gray-50 pt-3">
          <button className="flex items-center gap-2 text-sm text-gray-500 hover:text-red-500 transition-colors">
            <Heart className="w-5 h-5" />
            <span>{post.like_count || 0}</span>
          </button>
          <button className="flex items-center gap-2 text-sm text-gray-500 hover:text-blue-500 transition-colors">
            <MessageCircle className="w-5 h-5" />
            <span>{post.comment_count || 0}</span>
          </button>
        </div>
      </div>

      {/* Comments */}
      <div className="bg-white rounded-xl border border-gray-100 p-4">
        <h3 className="font-bold text-gray-900 mb-4">Comentários ({comments.length})</h3>

        <div className="flex items-start gap-3 mb-4">
          <input
            type="text"
            value={newComment}
            onChange={e => setNewComment(e.target.value)}
            placeholder="Escreva um comentário..."
            className="flex-1 px-4 py-2 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-pink-200"
          />
          <button className="px-4 py-2 bg-pink-600 text-white rounded-xl text-sm font-bold hover:bg-pink-700 transition-colors">
            Enviar
          </button>
        </div>

        {comments.length === 0 ? (
          <p className="text-sm text-gray-400 text-center py-4">Nenhum comentário ainda. Seja o primeiro!</p>
        ) : (
          <div className="space-y-3">
            {comments.map(c => (
              <div key={c.id} className="flex items-start gap-3">
                <div className="w-8 h-8 bg-gray-100 rounded-full flex items-center justify-center shrink-0">
                  <User className="w-4 h-4 text-gray-400" />
                </div>
                <div>
                  <p className="text-xs"><span className="font-bold text-gray-900">{c.author_display_name || c.author_name}</span> <span className="text-gray-400">{new Date(c.created_at).toLocaleDateString('pt-BR')}</span></p>
                  <p className="text-sm text-gray-600 mt-0.5">{c.content}</p>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}
