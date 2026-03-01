'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import {
  GraduationCap, Search, ChevronLeft, X, Check, Users,
  Music, BookOpen, UserPlus, Trash2, Plus, Phone, Mail, Lock, User, Loader2,
  Pencil, Building2,
} from 'lucide-react'
import { supabase } from '@/lib/supabase/client'
import { PermissionGate } from '@/components/auth/PermissionGate'
import { enrollStudent, unenrollStudent } from '@/app/actions/course-actions'
import { createStudent, updateProfile } from '@/app/actions/rbac-admin-actions'

interface Instrument {
  id: string
  name: string
}

interface Unit {
  id: string
  name: string
  city: string | null
  is_active: boolean
}

interface ProfileInstrument {
  id: string
  user_id: string
  instrument_id: string
  is_primary: boolean
  instrument_name: string
}

interface Student {
  id: string
  user_id: string
  full_name: string
  display_name: string | null
  avatar_url: string | null
  phone: string | null
  instrument_name: string | null
  primary_instrument_id: string | null
  unit_id: string | null
  unit_name: string | null
  is_active: boolean
  roles: Array<{ slug: string; display_name: string }>
}

interface Enrollment {
  id: string
  course_id: string
  student_id: string
  status: string
  enrolled_at: string
  course_name: string
  student_name: string
}

interface Course {
  id: string
  name: string
  instrument_name: string | null
  teacher_name: string | null
  schedule: string | null
  level: string
  max_students: number | null
  active_students: number
  is_active: boolean
}

export default function EnrollmentsPage() {
  const router = useRouter()
  const [students, setStudents] = useState<Student[]>([])
  const [enrollments, setEnrollments] = useState<Enrollment[]>([])
  const [courses, setCourses] = useState<Course[]>([])
  const [instruments, setInstruments] = useState<Instrument[]>([])
  const [units, setUnits] = useState<Unit[]>([])
  const [profileInstruments, setProfileInstruments] = useState<ProfileInstrument[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [filterStatus, setFilterStatus] = useState<'all' | 'enrolled' | 'not_enrolled'>('all')
  const [filterInstrument, setFilterInstrument] = useState<string>('all')
  const [saving, setSaving] = useState(false)
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  // Enroll modal state
  const [showEnrollModal, setShowEnrollModal] = useState(false)
  const [selectedStudent, setSelectedStudent] = useState<Student | null>(null)
  const [selectedCourseId, setSelectedCourseId] = useState('')

  // Create student modal state
  const [showCreateModal, setShowCreateModal] = useState(false)
  const [newName, setNewName] = useState('')
  const [newEmail, setNewEmail] = useState('')
  const [newPhone, setNewPhone] = useState('')
  const [newPassword, setNewPassword] = useState('')
  const [newInstrumentId, setNewInstrumentId] = useState('')
  const [newRole, setNewRole] = useState<'student' | 'teacher'>('student')

  // Edit profile modal state
  const [showEditModal, setShowEditModal] = useState(false)
  const [editStudent, setEditStudent] = useState<Student | null>(null)
  const [editName, setEditName] = useState('')
  const [editDisplayName, setEditDisplayName] = useState('')
  const [editPhone, setEditPhone] = useState('')
  const [editUnitId, setEditUnitId] = useState('')
  const [editInstrumentIds, setEditInstrumentIds] = useState<string[]>([])

  useEffect(() => {
    loadData()
  }, [])

  async function loadData() {
    setLoading(true)
    const [studentsRes, enrollmentsRes, coursesRes, instrumentsRes, unitsRes, profInstRes] = await Promise.all([
      supabase.from('v_profiles').select('*').order('full_name'),
      supabase.from('v_enrollments').select('*').order('enrolled_at', { ascending: false }),
      supabase.from('v_courses').select('*').eq('is_active', true).order('name'),
      supabase.from('instruments').select('id, name').eq('is_active', true).order('name'),
      supabase.from('units').select('id, name, city, is_active').eq('is_active', true).order('name'),
      supabase.from('v_profile_instruments').select('*'),
    ])

    if (studentsRes.data) {
      const allProfiles = studentsRes.data as Student[]
      setStudents(
        allProfiles.filter(u =>
          u.roles?.some(r => r.slug === 'student') &&
          !/^Aluno (Seed )?\d+$/.test(u.full_name || '')
        )
      )
    }
    if (enrollmentsRes.data) setEnrollments(enrollmentsRes.data as Enrollment[])
    if (coursesRes.data) setCourses(coursesRes.data as Course[])
    if (instrumentsRes.data) setInstruments(instrumentsRes.data as Instrument[])
    if (unitsRes.data) setUnits(unitsRes.data as Unit[])
    if (profInstRes.data) setProfileInstruments(profInstRes.data as ProfileInstrument[])

    setLoading(false)
  }

  function showMsg(type: 'success' | 'error', text: string) {
    setMessage({ type, text })
    setTimeout(() => setMessage(null), 4000)
  }

  function getStudentEnrollments(studentId: string) {
    return enrollments.filter(e => e.student_id === studentId && e.status === 'active')
  }

  const instrumentOptions = [...new Set(students.map(s => s.instrument_name).filter(Boolean))] as string[]

  const filtered = students.filter(s => {
    const matchesSearch = search === '' ||
      s.full_name?.toLowerCase().includes(search.toLowerCase()) ||
      s.display_name?.toLowerCase().includes(search.toLowerCase())

    const studentEnrollments = getStudentEnrollments(s.user_id)
    const matchesStatus =
      filterStatus === 'all' ||
      (filterStatus === 'enrolled' && studentEnrollments.length > 0) ||
      (filterStatus === 'not_enrolled' && studentEnrollments.length === 0)

    const matchesInstrument =
      filterInstrument === 'all' ||
      s.instrument_name === filterInstrument

    return matchesSearch && matchesStatus && matchesInstrument
  })

  async function handleEnroll() {
    if (!selectedStudent || !selectedCourseId) return
    setSaving(true)
    const result = await enrollStudent({
      course_id: selectedCourseId,
      student_id: selectedStudent.user_id,
    })
    if ('error' in result) {
      showMsg('error', result.error)
    } else {
      showMsg('success', result.message || 'Aluno matriculado com sucesso')
      setShowEnrollModal(false)
      setSelectedStudent(null)
      setSelectedCourseId('')
      await loadData()
    }
    setSaving(false)
  }

  async function handleUnenroll(enrollmentId: string) {
    setSaving(true)
    const result = await unenrollStudent({ enrollment_id: enrollmentId })
    if ('error' in result) {
      showMsg('error', result.error)
    } else {
      showMsg('success', result.message || 'Matrícula cancelada')
      await loadData()
    }
    setSaving(false)
  }

  function openEnrollModal(student: Student) {
    setSelectedStudent(student)
    setSelectedCourseId('')
    setShowEnrollModal(true)
  }

  function openCreateModal() {
    setNewName('')
    setNewEmail('')
    setNewPhone('')
    setNewPassword('')
    setNewInstrumentId('')
    setNewRole('student')
    setShowCreateModal(true)
  }

  async function handleCreateStudent() {
    if (!newName || !newEmail || !newPassword) return
    setSaving(true)
    const result = await createStudent({
      fullName: newName,
      email: newEmail,
      password: newPassword,
      phone: newPhone || undefined,
      instrumentId: newInstrumentId || undefined,
      roleSlug: newRole,
    })
    if ('error' in result) {
      showMsg('error', result.error)
    } else {
      showMsg('success', result.message || 'Cadastro realizado com sucesso')
      setShowCreateModal(false)
      await loadData()
    }
    setSaving(false)
  }

  function openEditModal(student: Student) {
    setEditStudent(student)
    setEditName(student.full_name || '')
    setEditDisplayName(student.display_name || '')
    setEditPhone(student.phone || '')
    setEditUnitId(student.unit_id || '')
    const userInsts = profileInstruments
      .filter(pi => pi.user_id === student.user_id)
      .map(pi => pi.instrument_id)
    setEditInstrumentIds(userInsts.length > 0 ? userInsts : student.primary_instrument_id ? [student.primary_instrument_id] : [])
    setShowEditModal(true)
  }

  async function handleEditSave() {
    if (!editStudent || !editName.trim()) return
    setSaving(true)
    const result = await updateProfile({
      userId: editStudent.user_id,
      fullName: editName.trim(),
      displayName: editDisplayName.trim() || undefined,
      phone: editPhone.trim() || undefined,
      unitId: editUnitId || null,
      instrumentIds: editInstrumentIds,
    })
    if ('error' in result) {
      showMsg('error', result.error)
    } else {
      showMsg('success', result.message || 'Perfil atualizado')
      setShowEditModal(false)
      setEditStudent(null)
      await loadData()
    }
    setSaving(false)
  }

  function toggleEditInstrument(instrumentId: string) {
    setEditInstrumentIds(prev =>
      prev.includes(instrumentId)
        ? prev.filter(id => id !== instrumentId)
        : [...prev, instrumentId]
    )
  }

  const notEnrolledCount = students.filter(s => getStudentEnrollments(s.user_id).length === 0).length

  const LEVEL_LABELS: Record<string, string> = {
    beginner: 'Iniciante',
    intermediate: 'Intermediário',
    advanced: 'Avançado',
  }

  return (
    <PermissionGate permission="settings.view" fallback={<div className="text-center py-16"><p className="text-gray-500">Sem permissão.</p></div>}>
      <div className="max-w-5xl mx-auto space-y-6">
        {/* Header */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <button onClick={() => router.push('/settings')} className="p-2 hover:bg-gray-100 rounded-lg transition-colors">
              <ChevronLeft className="w-5 h-5 text-gray-500" />
            </button>
            <div>
              <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
                <GraduationCap className="w-6 h-6 text-green-600" />
                Matrículas
              </h1>
              <p className="text-sm text-gray-500 mt-1">
                {students.length} alunos &middot; {notEnrolledCount} sem matrícula
              </p>
            </div>
          </div>
          <button
            onClick={openCreateModal}
            className="flex items-center gap-2 px-4 py-2.5 bg-green-600 text-white rounded-xl font-bold text-sm hover:bg-green-700 transition-colors shadow-sm"
          >
            <Plus className="w-4 h-4" />
            Cadastrar Aluno
          </button>
        </div>

        {/* Toast */}
        {message && (
          <div className={`px-4 py-3 rounded-xl text-sm font-medium ${
            message.type === 'success' ? 'bg-green-50 text-green-700 border border-green-200' : 'bg-red-50 text-red-700 border border-red-200'
          }`}>
            {message.text}
          </div>
        )}

        {/* Stats Cards */}
        <div className="grid grid-cols-3 gap-4">
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-4 text-center">
            <p className="text-2xl font-bold text-gray-900">{students.length}</p>
            <p className="text-xs text-gray-500 mt-1">Total de Alunos</p>
          </div>
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-4 text-center">
            <p className="text-2xl font-bold text-green-600">{students.length - notEnrolledCount}</p>
            <p className="text-xs text-gray-500 mt-1">Matriculados</p>
          </div>
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-4 text-center">
            <p className="text-2xl font-bold text-amber-600">{notEnrolledCount}</p>
            <p className="text-xs text-gray-500 mt-1">Sem Matrícula</p>
          </div>
        </div>

        {/* Filters */}
        <div className="flex flex-col sm:flex-row gap-3">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
            <input
              type="text"
              placeholder="Buscar aluno por nome..."
              value={search}
              onChange={e => setSearch(e.target.value)}
              className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-green-200 focus:border-green-400 outline-none"
            />
          </div>
          <select
            value={filterStatus}
            onChange={e => setFilterStatus(e.target.value as any)}
            className="px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-green-200 focus:border-green-400 outline-none bg-white"
          >
            <option value="all">Todos os status</option>
            <option value="enrolled">Matriculados</option>
            <option value="not_enrolled">Sem matrícula</option>
          </select>
          {instrumentOptions.length > 0 && (
            <select
              value={filterInstrument}
              onChange={e => setFilterInstrument(e.target.value)}
              className="px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-green-200 focus:border-green-400 outline-none bg-white"
            >
              <option value="all">Todos os instrumentos</option>
              {instrumentOptions.map(inst => (
                <option key={inst} value={inst}>{inst}</option>
              ))}
            </select>
          )}
        </div>

        {/* Students List */}
        {loading ? (
          <div className="space-y-3">
            {[...Array(5)].map((_, i) => (
              <div key={i} className="bg-white rounded-xl border border-gray-100 p-4 animate-pulse">
                <div className="flex items-center gap-4">
                  <div className="w-10 h-10 bg-gray-200 rounded-full" />
                  <div className="flex-1 space-y-2">
                    <div className="h-4 bg-gray-200 rounded w-1/3" />
                    <div className="h-3 bg-gray-100 rounded w-1/4" />
                  </div>
                </div>
              </div>
            ))}
          </div>
        ) : filtered.length === 0 ? (
          <div className="text-center py-16 bg-white rounded-xl border border-gray-100">
            <Users className="w-12 h-12 text-gray-300 mx-auto mb-3" />
            <p className="text-gray-500">Nenhum aluno encontrado</p>
          </div>
        ) : (
          <div className="space-y-2">
            {filtered.map(student => {
              const studentEnrollments = getStudentEnrollments(student.user_id)
              const isEnrolled = studentEnrollments.length > 0

              return (
                <div
                  key={student.id}
                  className="bg-white rounded-xl border border-gray-100 shadow-sm p-4 hover:shadow-md transition-all"
                >
                  <div className="flex items-center gap-4">
                    {/* Avatar */}
                    <div className="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center text-green-600 font-bold flex-shrink-0">
                      {student.avatar_url ? (
                        <img src={student.avatar_url} alt="" className="w-10 h-10 rounded-full object-cover" />
                      ) : (
                        student.full_name?.[0]?.toUpperCase() || '?'
                      )}
                    </div>

                    {/* Info */}
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2">
                        <span className="font-bold text-gray-900 truncate">{student.full_name}</span>
                        {!isEnrolled && (
                          <span className="px-1.5 py-0.5 rounded text-[10px] font-bold bg-amber-100 text-amber-700 uppercase whitespace-nowrap">
                            Sem matrícula
                          </span>
                        )}
                      </div>
                      <div className="flex items-center gap-2 text-xs text-gray-500">
                        {(() => {
                          const userInsts = profileInstruments.filter(pi => pi.user_id === student.user_id)
                          if (userInsts.length > 0) {
                            return (
                              <span className="flex items-center gap-1">
                                <Music className="w-3 h-3" />
                                {userInsts.map(pi => pi.instrument_name).join(', ')}
                              </span>
                            )
                          }
                          if (student.instrument_name) {
                            return (
                              <span className="flex items-center gap-1">
                                <Music className="w-3 h-3" />
                                {student.instrument_name}
                              </span>
                            )
                          }
                          return null
                        })()}
                        {student.unit_name && (
                          <span className="flex items-center gap-1">
                            <Building2 className="w-3 h-3" />
                            {student.unit_name}
                          </span>
                        )}
                        {student.phone && (
                          <span>&middot; {student.phone}</span>
                        )}
                      </div>
                    </div>

                    {/* Enrollments */}
                    <div className="flex items-center gap-1.5 flex-shrink-0">
                      {studentEnrollments.map(enrollment => (
                        <div key={enrollment.id} className="flex items-center gap-1">
                          <span className="inline-flex items-center gap-1 px-2 py-1 rounded-lg text-xs font-bold bg-green-100 text-green-700">
                            <BookOpen className="w-3 h-3" />
                            {enrollment.course_name}
                          </span>
                          <button
                            onClick={() => handleUnenroll(enrollment.id)}
                            disabled={saving}
                            title="Cancelar matrícula"
                            className="p-1 rounded-lg text-red-400 hover:text-red-600 hover:bg-red-50 transition-all"
                          >
                            <Trash2 className="w-3 h-3" />
                          </button>
                        </div>
                      ))}
                    </div>

                    {/* Edit + Enroll buttons */}
                    <div className="flex items-center gap-1 flex-shrink-0">
                      <button
                        onClick={() => openEditModal(student)}
                        disabled={saving}
                        title="Editar dados"
                        className="p-2 rounded-lg text-gray-400 hover:text-blue-600 hover:bg-blue-50 transition-all"
                      >
                        <Pencil className="w-4 h-4" />
                      </button>
                      <button
                        onClick={() => openEnrollModal(student)}
                        disabled={saving}
                        title="Matricular em turma"
                        className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-sm font-bold text-green-700 bg-green-50 hover:bg-green-100 transition-all"
                      >
                        <UserPlus className="w-4 h-4" />
                        Matricular
                      </button>
                    </div>
                  </div>
                </div>
              )
            })}
          </div>
        )}

        {/* Enroll Modal */}
        {showEnrollModal && selectedStudent && (
          <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4" onClick={() => setShowEnrollModal(false)}>
            <div className="bg-white rounded-2xl shadow-xl w-full max-w-lg p-6 space-y-4" onClick={e => e.stopPropagation()}>
              <div className="flex items-center justify-between">
                <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
                  <UserPlus className="w-5 h-5 text-green-600" />
                  Matricular Aluno
                </h2>
                <button onClick={() => setShowEnrollModal(false)} className="p-1 hover:bg-gray-100 rounded-lg">
                  <X className="w-5 h-5 text-gray-400" />
                </button>
              </div>

              {/* Student Info */}
              <div className="flex items-center gap-3 p-3 bg-gray-50 rounded-xl">
                <div className="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center text-green-600 font-bold">
                  {selectedStudent.full_name?.[0]?.toUpperCase() || '?'}
                </div>
                <div>
                  <p className="font-bold text-gray-900">{selectedStudent.full_name}</p>
                  <p className="text-xs text-gray-500">
                    {selectedStudent.instrument_name || 'Sem instrumento definido'}
                  </p>
                </div>
              </div>

              {/* Course Select */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Selecione a Turma</label>
                <select
                  value={selectedCourseId}
                  onChange={e => setSelectedCourseId(e.target.value)}
                  className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-green-200 focus:border-green-400 outline-none bg-white"
                >
                  <option value="">Escolha uma turma...</option>
                  {courses.map(course => {
                    const alreadyEnrolled = enrollments.some(
                      e => e.course_id === course.id && e.student_id === selectedStudent.user_id && e.status === 'active'
                    )
                    const isFull = course.max_students ? course.active_students >= course.max_students : false
                    return (
                      <option
                        key={course.id}
                        value={course.id}
                        disabled={alreadyEnrolled || isFull}
                      >
                        {course.name}
                        {course.instrument_name ? ` (${course.instrument_name})` : ''}
                        {course.teacher_name ? ` — ${course.teacher_name}` : ''}
                        {alreadyEnrolled ? ' [Já matriculado]' : ''}
                        {isFull ? ' [Turma cheia]' : ''}
                      </option>
                    )
                  })}
                </select>
              </div>

              {/* Selected course details */}
              {selectedCourseId && (() => {
                const course = courses.find(c => c.id === selectedCourseId)
                if (!course) return null
                return (
                  <div className="p-3 bg-green-50 rounded-xl space-y-1 text-sm">
                    <p className="font-bold text-green-800">{course.name}</p>
                    <div className="flex flex-wrap gap-3 text-green-700">
                      {course.teacher_name && <span>Professor: {course.teacher_name}</span>}
                      {course.instrument_name && <span>Instrumento: {course.instrument_name}</span>}
                      <span>Nível: {LEVEL_LABELS[course.level] || course.level}</span>
                      {course.schedule && <span>Horário: {course.schedule}</span>}
                      <span>
                        Vagas: {course.active_students}{course.max_students ? `/${course.max_students}` : ''}
                      </span>
                    </div>
                  </div>
                )
              })()}

              <div className="flex justify-end gap-2 pt-2">
                <button
                  onClick={() => setShowEnrollModal(false)}
                  className="px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-100 rounded-xl transition-colors"
                >
                  Cancelar
                </button>
                <button
                  onClick={handleEnroll}
                  disabled={saving || !selectedCourseId}
                  className="flex items-center gap-2 px-4 py-2 bg-green-600 text-white rounded-xl text-sm font-bold hover:bg-green-700 transition-colors disabled:opacity-50"
                >
                  <Check className="w-4 h-4" />
                  Confirmar Matrícula
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Create Student Modal */}
        {showCreateModal && (
          <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4" onClick={() => setShowCreateModal(false)}>
            <div className="bg-white rounded-2xl shadow-xl w-full max-w-md p-6 space-y-4" onClick={e => e.stopPropagation()}>
              <div className="flex items-center justify-between">
                <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
                  <Plus className="w-5 h-5 text-green-600" />
                  Cadastrar Aluno
                </h2>
                <button onClick={() => setShowCreateModal(false)} className="p-1 hover:bg-gray-100 rounded-lg">
                  <X className="w-5 h-5 text-gray-400" />
                </button>
              </div>

              {/* Role Toggle */}
              <div className="flex rounded-xl border border-gray-200 overflow-hidden">
                <button
                  type="button"
                  onClick={() => setNewRole('student')}
                  className={`flex-1 flex items-center justify-center gap-2 py-2.5 text-sm font-bold transition-all ${
                    newRole === 'student'
                      ? 'bg-green-600 text-white'
                      : 'bg-white text-gray-500 hover:bg-gray-50'
                  }`}
                >
                  <Music className="w-4 h-4" />
                  Aluno
                </button>
                <button
                  type="button"
                  onClick={() => setNewRole('teacher')}
                  className={`flex-1 flex items-center justify-center gap-2 py-2.5 text-sm font-bold transition-all ${
                    newRole === 'teacher'
                      ? 'bg-blue-600 text-white'
                      : 'bg-white text-gray-500 hover:bg-gray-50'
                  }`}
                >
                  <GraduationCap className="w-4 h-4" />
                  Professor
                </button>
              </div>

              <div className="space-y-3">
                {/* Name */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Nome Completo</label>
                  <div className="relative">
                    <User className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <input
                      type="text"
                      value={newName}
                      onChange={e => setNewName(e.target.value)}
                      placeholder="Nome do aluno"
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-green-200 focus:border-green-400 outline-none"
                    />
                  </div>
                </div>

                {/* Email */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
                  <div className="relative">
                    <Mail className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <input
                      type="email"
                      value={newEmail}
                      onChange={e => setNewEmail(e.target.value)}
                      placeholder="email@exemplo.com"
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-green-200 focus:border-green-400 outline-none"
                    />
                  </div>
                </div>

                {/* Phone */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Telefone <span className="text-gray-400 font-normal">(opcional)</span>
                  </label>
                  <div className="relative">
                    <Phone className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <input
                      type="tel"
                      value={newPhone}
                      onChange={e => setNewPhone(e.target.value)}
                      placeholder="(11) 99999-9999"
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-green-200 focus:border-green-400 outline-none"
                    />
                  </div>
                </div>

                {/* Instrument */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Instrumento</label>
                  <div className="relative">
                    <Music className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <select
                      value={newInstrumentId}
                      onChange={e => setNewInstrumentId(e.target.value)}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-green-200 focus:border-green-400 outline-none bg-white appearance-none"
                    >
                      <option value="">Selecione um instrumento</option>
                      {instruments.map(inst => (
                        <option key={inst.id} value={inst.id}>{inst.name}</option>
                      ))}
                    </select>
                  </div>
                </div>

                {/* Password */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Senha</label>
                  <div className="relative">
                    <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <input
                      type="password"
                      value={newPassword}
                      onChange={e => setNewPassword(e.target.value)}
                      placeholder="Mínimo 6 caracteres"
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-green-200 focus:border-green-400 outline-none"
                    />
                  </div>
                </div>
              </div>

              <div className="flex justify-end gap-2 pt-2">
                <button
                  onClick={() => setShowCreateModal(false)}
                  className="px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-100 rounded-xl transition-colors"
                >
                  Cancelar
                </button>
                <button
                  onClick={handleCreateStudent}
                  disabled={saving || !newName.trim() || !newEmail.trim() || newPassword.length < 6}
                  className="flex items-center gap-2 px-4 py-2 bg-green-600 text-white rounded-xl text-sm font-bold hover:bg-green-700 transition-colors disabled:opacity-50"
                >
                  {saving ? (
                    <Loader2 className="w-4 h-4 animate-spin" />
                  ) : (
                    <Check className="w-4 h-4" />
                  )}
                  Cadastrar
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Edit Profile Modal */}
        {showEditModal && editStudent && (
          <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4" onClick={() => setShowEditModal(false)}>
            <div className="bg-white rounded-2xl shadow-xl w-full max-w-md p-6 space-y-4" onClick={e => e.stopPropagation()}>
              <div className="flex items-center justify-between">
                <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
                  <Pencil className="w-5 h-5 text-blue-600" />
                  Editar Perfil
                </h2>
                <button onClick={() => setShowEditModal(false)} className="p-1 hover:bg-gray-100 rounded-lg">
                  <X className="w-5 h-5 text-gray-400" />
                </button>
              </div>

              {/* Student Info */}
              <div className="flex items-center gap-3 p-3 bg-gray-50 rounded-xl">
                <div className="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center text-green-600 font-bold">
                  {editStudent.full_name?.[0]?.toUpperCase() || '?'}
                </div>
                <div>
                  <p className="font-bold text-gray-900">{editStudent.full_name}</p>
                  <p className="text-xs text-gray-500">
                    {editStudent.roles?.map(r => r.display_name).join(', ') || 'Aluno'}
                  </p>
                </div>
              </div>

              <div className="space-y-3">
                {/* Name */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Nome Completo</label>
                  <input
                    type="text"
                    value={editName}
                    onChange={e => setEditName(e.target.value)}
                    className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none"
                  />
                </div>

                {/* Display Name */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Apelido <span className="text-gray-400 font-normal">(opcional)</span>
                  </label>
                  <input
                    type="text"
                    value={editDisplayName}
                    onChange={e => setEditDisplayName(e.target.value)}
                    placeholder="Nome de exibição"
                    className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none"
                  />
                </div>

                {/* Phone */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Telefone <span className="text-gray-400 font-normal">(opcional)</span>
                  </label>
                  <div className="relative">
                    <Phone className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <input
                      type="tel"
                      value={editPhone}
                      onChange={e => setEditPhone(e.target.value)}
                      placeholder="(11) 99999-9999"
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none"
                    />
                  </div>
                </div>

                {/* Unit */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Unidade</label>
                  <div className="relative">
                    <Building2 className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <select
                      value={editUnitId}
                      onChange={e => setEditUnitId(e.target.value)}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400 outline-none bg-white appearance-none"
                    >
                      <option value="">Sem unidade</option>
                      {units.map(unit => (
                        <option key={unit.id} value={unit.id}>
                          {unit.name}{unit.city ? ` (${unit.city})` : ''}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>

                {/* Instruments (multi-select checkboxes) */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Instrumentos <span className="text-gray-400 font-normal">(selecione um ou mais)</span>
                  </label>
                  <div className="grid grid-cols-2 gap-2 max-h-40 overflow-y-auto">
                    {instruments.map(inst => (
                      <label
                        key={inst.id}
                        className={`flex items-center gap-2 px-3 py-2 rounded-lg border cursor-pointer transition-all text-sm ${
                          editInstrumentIds.includes(inst.id)
                            ? 'border-blue-300 bg-blue-50 text-blue-700 font-medium'
                            : 'border-gray-200 hover:border-gray-300 text-gray-600'
                        }`}
                      >
                        <input
                          type="checkbox"
                          checked={editInstrumentIds.includes(inst.id)}
                          onChange={() => toggleEditInstrument(inst.id)}
                          className="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
                        />
                        {inst.name}
                      </label>
                    ))}
                  </div>
                </div>
              </div>

              <div className="flex justify-end gap-2 pt-2">
                <button
                  onClick={() => setShowEditModal(false)}
                  className="px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-100 rounded-xl transition-colors"
                >
                  Cancelar
                </button>
                <button
                  onClick={handleEditSave}
                  disabled={saving || !editName.trim()}
                  className="flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-xl text-sm font-bold hover:bg-blue-700 transition-colors disabled:opacity-50"
                >
                  {saving ? (
                    <Loader2 className="w-4 h-4 animate-spin" />
                  ) : (
                    <Check className="w-4 h-4" />
                  )}
                  Salvar
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </PermissionGate>
  )
}
