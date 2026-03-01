'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { User, ArrowLeft, Trophy, BookOpen, Flame, Star, Target, Award } from 'lucide-react'
import Link from 'next/link'
import type { Tables } from '@/lib/supabase/database.types'

type Profile = Tables<'v_profiles'>
type Progress = Tables<'v_user_progress'>
type UserAchievement = Tables<'v_user_achievements'>

export default function StudentDetailPage() {
  const { id } = useParams<{ id: string }>()
  const [profile, setProfile] = useState<Profile | null>(null)
  const [progress, setProgress] = useState<Progress | null>(null)
  const [achievements, setAchievements] = useState<UserAchievement[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const { data: p } = await supabase.from('v_profiles').select('*').eq('user_id', id).single()
        if (p) setProfile(p as Profile)

        const { data: prog } = await supabase.from('v_user_progress').select('*').eq('user_id', id).single()
        if (prog) setProgress(prog as Progress)

        const { data: ach } = await supabase.from('v_user_achievements').select('*').eq('user_id', id).eq('is_completed', true).order('completed_at', { ascending: false })
        if (ach) setAchievements(ach as UserAchievement[])
      } catch (error) {
        console.error('Error:', error)
      } finally {
        setLoading(false)
      }
    }
    if (id) load()
  }, [id])

  if (loading) return <div className="space-y-6 animate-pulse"><div className="h-48 bg-gray-200 rounded-2xl" /><div className="h-64 bg-gray-200 rounded-2xl" /></div>
  if (!profile) return <div className="text-center py-16"><p className="text-gray-500">Aluno não encontrado.</p><Link href="/students" className="text-blue-600 hover:underline mt-4 inline-block">Voltar</Link></div>

  const prog = progress || {} as Progress

  return (
    <div className="space-y-6">
      <Link href="/students" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" /> Voltar
      </Link>

      {/* Profile Header */}
      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
        <div className="flex items-center gap-4">
          <div className="w-16 h-16 bg-blue-50 rounded-full flex items-center justify-center">
            {profile.avatar_url ? (
              <img src={profile.avatar_url} alt="" className="w-full h-full rounded-full object-cover" />
            ) : (
              <User className="w-8 h-8 text-blue-400" />
            )}
          </div>
          <div>
            <h1 className="text-2xl font-bold text-gray-900">{profile.full_name || profile.display_name}</h1>
            {profile.display_name && profile.full_name && profile.display_name !== profile.full_name && (
              <p className="text-sm text-gray-500">{profile.display_name}</p>
            )}
          </div>
        </div>
      </div>

      {/* Progress */}
      {progress && (
        <>
          <div className="bg-gradient-to-br from-amber-500 to-orange-600 rounded-2xl p-6 text-white">
            <div className="flex items-center gap-4">
              <div className="w-14 h-14 bg-white/20 rounded-2xl flex items-center justify-center text-2xl font-black">
                {prog.level || 1}
              </div>
              <div>
                <h2 className="text-xl font-bold">{prog.level_name || 'Iniciante'}</h2>
                <p className="text-orange-100">{prog.total_points || 0} pontos</p>
              </div>
              {prog.current_streak > 0 && (
                <div className="ml-auto flex items-center gap-1 bg-white/20 px-3 py-1.5 rounded-xl">
                  <Flame className="w-5 h-5 text-yellow-300" />
                  <span className="font-bold">{prog.current_streak}</span>
                </div>
              )}
            </div>
          </div>

          <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
            <StatBox icon={Target} value={prog.lessons_completed || 0} label="Aulas" />
            <StatBox icon={Award} value={prog.achievements_unlocked || 0} label="Conquistas" />
            <StatBox icon={Star} value={prog.badges_earned || 0} label="Badges" />
            <StatBox icon={Flame} value={prog.longest_streak || 0} label="Maior Streak" />
          </div>
        </>
      )}

      {/* Achievements */}
      {achievements.length > 0 && (
        <div>
          <h2 className="text-lg font-bold text-gray-900 mb-4">Conquistas Recentes</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
            {achievements.slice(0, 6).map(a => (
              <div key={a.id} className="bg-white rounded-xl border border-amber-200 p-3 flex items-center gap-3">
                <div className="w-10 h-10 bg-amber-100 rounded-full flex items-center justify-center">
                  <Trophy className="w-5 h-5 text-amber-600" />
                </div>
                <div>
                  <p className="font-bold text-sm text-gray-900">{a.achievement_name}</p>
                  <p className="text-xs text-amber-600">+{a.points_reward} pts</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}

function StatBox({ icon: Icon, value, label }: { icon: any; value: number; label: string }) {
  return (
    <div className="bg-white rounded-xl p-4 border border-gray-100 text-center">
      <Icon className="w-5 h-5 text-gray-400 mx-auto mb-2" />
      <p className="text-2xl font-bold text-gray-900">{value}</p>
      <p className="text-xs text-gray-500">{label}</p>
    </div>
  )
}
