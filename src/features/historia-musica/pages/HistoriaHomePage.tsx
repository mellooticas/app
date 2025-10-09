/**
 * 📚 HISTÓRIA DA MÚSICA - HOME PAGE
 * 
 * Dashboard principal do módulo de História da Música
 * Mostra períodos históricos, compositores, obras e progresso do usuário
 */

import React from 'react'
import { Link } from 'react-router-dom'
import { Clock, Users, Music, Calendar, Trophy, Book } from 'lucide-react'
import { useAuth } from '../../../features/auth/AuthContext'
import { useHistoriaPeriodos, useHistoriaProgresso } from '../hooks/useHistoria'

export default function HistoriaHomePage() {
  const { user } = useAuth()
  const { data: periodos, isLoading: loadingPeriodos } = useHistoriaPeriodos()
  const { data: progresso } = useHistoriaProgresso(user?.id)

  const progressoTotal = progresso?.filter((p: any) => p.concluido).length || 0
  const totalConteudo = 100 // Mock - seria calculado dinamicamente
  const porcentagemGeral = (progressoTotal / totalConteudo) * 100
  const minutosEstudados = progresso?.reduce((acc: number, p: any) => acc + (p.tempo_estudado_minutos || 0), 0) || 0

  return (
    <div className="min-h-screen bg-gradient-to-b from-indigo-50 to-white">
      {/* Hero Section */}
      <section className="relative overflow-hidden bg-gradient-to-r from-indigo-600 to-purple-600 text-white py-20">
        <div className="container mx-auto px-4">
          <h1 className="text-5xl font-bold mb-4">
            📚 História da Música
          </h1>
          <p className="text-xl opacity-90 max-w-2xl">
            Explore séculos de evolução musical através de compositores, obras e movimentos que moldaram a música que conhecemos hoje.
          </p>

          {/* Stats do usuário */}
          {user && (
            <div className="mt-8 grid grid-cols-1 md:grid-cols-4 gap-4">
              <div className="bg-white/10 backdrop-blur rounded-lg p-4">
                <div className="text-3xl font-bold">{progressoTotal}</div>
                <div className="text-sm opacity-80">Conteúdos Concluídos</div>
              </div>
              <div className="bg-white/10 backdrop-blur rounded-lg p-4">
                <div className="text-3xl font-bold">{porcentagemGeral.toFixed(0)}%</div>
                <div className="text-sm opacity-80">Progresso Total</div>
              </div>
              <div className="bg-white/10 backdrop-blur rounded-lg p-4">
                <div className="text-3xl font-bold">{minutosEstudados}</div>
                <div className="text-sm opacity-80">Minutos Estudados</div>
              </div>
              <div className="bg-white/10 backdrop-blur rounded-lg p-4">
                <div className="text-3xl font-bold">{periodos?.length || 0}</div>
                <div className="text-sm opacity-80">Períodos Disponíveis</div>
              </div>
            </div>
          )}
        </div>
      </section>

      {/* Menu de Navegação */}
      <section className="py-12">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-gray-900 mb-8">Explore o Acervo</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <NavCard
              icon={<Clock className="w-8 h-8" />}
              title="Períodos Históricos"
              description="Do Medieval ao Contemporâneo"
              href="/historia/periodos"
              gradient="from-purple-500 to-pink-500"
            />
            <NavCard
              icon={<Users className="w-8 h-8" />}
              title="Compositores"
              description="Conheça os mestres da música"
              href="/historia/compositores"
              gradient="from-blue-500 to-cyan-500"
            />
            <NavCard
              icon={<Music className="w-8 h-8" />}
              title="Obras Imortais"
              description="Catálogo de obras-primas"
              href="/historia/obras"
              gradient="from-orange-500 to-red-500"
            />
            <NavCard
              icon={<Calendar className="w-8 h-8" />}
              title="Linha do Tempo"
              description="Navegue pela história"
              href="/historia/timeline"
              gradient="from-green-500 to-teal-500"
            />
            <NavCard
              icon={<Trophy className="w-8 h-8" />}
              title="Gêneros Musicais"
              description="Estilos e suas origens"
              href="/historia/generos"
              gradient="from-indigo-500 to-purple-500"
            />
            <NavCard
              icon={<Book className="w-8 h-8" />}
              title="Teoria Musical"
              description="Conceitos e fundamentos"
              href="/historia/teoria"
              gradient="from-pink-500 to-rose-500"
            />
          </div>
        </div>
      </section>

      {/* Períodos em destaque */}
      <section className="py-12 bg-gray-50">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-gray-900 mb-8">Períodos Históricos</h2>
          
          {loadingPeriodos ? (
            <div className="text-center py-12">
              <div className="animate-spin w-12 h-12 border-4 border-indigo-600 border-t-transparent rounded-full mx-auto"></div>
              <p className="mt-4 text-gray-600">Carregando períodos...</p>
            </div>
          ) : periodos && periodos.length > 0 ? (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {periodos.map((periodo: any) => (
                <PeriodoCard key={periodo.id} periodo={periodo} />
              ))}
            </div>
          ) : (
            <div className="text-center py-12 bg-white rounded-lg shadow">
              <p className="text-gray-600 text-lg mb-2">
                📚 Acervo em construção
              </p>
              <p className="text-gray-500 text-sm">
                Os períodos históricos serão adicionados em breve
              </p>
            </div>
          )}
        </div>
      </section>
    </div>
  )
}

// ============================================
// COMPONENTES AUXILIARES
// ============================================

interface NavCardProps {
  icon: React.ReactNode
  title: string
  description: string
  href: string
  gradient: string
}

function NavCard({ icon, title, description, href, gradient }: NavCardProps) {
  return (
    <Link to={href} className="block group">
      <div
        className={`relative overflow-hidden rounded-xl bg-gradient-to-br ${gradient} p-6 text-white transition-transform hover:scale-105 shadow-lg`}
      >
        <div className="mb-4">{icon}</div>
        <h3 className="text-2xl font-bold mb-2">{title}</h3>
        <p className="text-sm opacity-90">{description}</p>
        <div className="absolute top-0 right-0 w-32 h-32 bg-white/10 rounded-full -mr-16 -mt-16" />
      </div>
    </Link>
  )
}

interface PeriodoCardProps {
  periodo: {
    id: string
    nome: string
    periodo_inicio: number
    periodo_fim: number
    descricao_curta: string
    cor_tematica: string
    imagem_capa_url: string | null
  }
}

function PeriodoCard({ periodo }: PeriodoCardProps) {
  return (
    <Link
      to={`/historia/periodos/${periodo.id}`}
      className="block bg-white rounded-xl shadow-md overflow-hidden hover:shadow-xl transition-shadow"
    >
      <div
        className="h-32 bg-cover bg-center"
        style={{
          backgroundColor: periodo.cor_tematica,
          backgroundImage: periodo.imagem_capa_url
            ? `url(${periodo.imagem_capa_url})`
            : undefined,
        }}
      />
      <div className="p-5">
        <h3 className="text-xl font-bold text-gray-900 mb-2">{periodo.nome}</h3>
        <p className="text-sm text-gray-600 mb-3">
          {periodo.periodo_inicio} - {periodo.periodo_fim}
        </p>
        <p className="text-sm text-gray-700 line-clamp-3">{periodo.descricao_curta}</p>
      </div>
    </Link>
  )
}
