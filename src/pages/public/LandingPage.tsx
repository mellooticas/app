/**
 * 🏠 LANDING PAGE - Página Inicial
 * 
 * Página de boas-vindas para visitantes não autenticados
 * - Hero section
 * - Features
 * - CTA
 */

import React from 'react'
import { Link } from 'react-router-dom'
import { Music, Trophy, Users, BookOpen, Award, Calendar } from 'lucide-react'
import { ROUTES } from '../../lib/constants/routes'
import { NipoButton } from '../../components/shared/NipoButton'
import { NipoCard, NipoCardBody } from '../../components/shared/NipoCard'

export const LandingPage: React.FC = () => {
  const features = [
    {
      icon: Music,
      title: 'Instrumentos Tradicionais',
      description: 'Aprenda shamisen, koto, shakuhachi e outros instrumentos japoneses.',
    },
    {
      icon: BookOpen,
      title: 'História da Música',
      description: 'Explore a rica história musical japonesa através dos períodos.',
    },
    {
      icon: Trophy,
      title: 'Sistema de Conquistas',
      description: 'Ganhe pontos, badges e evolua no seu aprendizado.',
    },
    {
      icon: Users,
      title: 'Turmas Virtuais',
      description: 'Estude em grupo com professores experientes.',
    },
    {
      icon: Award,
      title: 'Desafios Alpha',
      description: 'Participe de desafios semanais e mensais.',
    },
    {
      icon: Calendar,
      title: 'Calendário Integrado',
      description: 'Organize suas aulas e eventos facilmente.',
    },
  ]

  return (
    <div className="bg-white">
      {/* Hero Section */}
      <section className="relative overflow-hidden bg-gradient-to-br from-[var(--color-sakura)]/20 via-[var(--color-indigo)]/20 to-[var(--color-matcha)]/20">
        <div className="container mx-auto px-4 py-24 lg:py-32">
          <div className="max-w-4xl mx-auto text-center">
            <h1 className="text-5xl lg:text-7xl font-bold text-gray-900 mb-6">
              Bem-vindo ao
              <span className="block bg-gradient-to-r from-[var(--color-sakura)] via-[var(--color-indigo)] to-[var(--color-matcha)] bg-clip-text text-transparent">
                Nipo School
              </span>
            </h1>
            <p className="text-xl lg:text-2xl text-gray-600 mb-8">
              Centro de Estudos de Música Nipo-Brasileira
            </p>
            <p className="text-lg text-gray-600 mb-12 max-w-2xl mx-auto">
              Aprenda música japonesa tradicional com professores experientes, 
              conquiste badges, participe de desafios e preserve essa rica tradição cultural.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Link to={ROUTES.SIGNUP}>
                <NipoButton size="lg" className="min-w-[200px]">
                  Começar Agora
                </NipoButton>
              </Link>
              <Link to={ROUTES.SOBRE}>
                <NipoButton size="lg" variant="outline" className="min-w-[200px]">
                  Saiba Mais
                </NipoButton>
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-20 bg-gray-50">
        <div className="container mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">
              O que você vai encontrar
            </h2>
            <p className="text-xl text-gray-600">
              Recursos completos para seu aprendizado musical
            </p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {features.map((feature, index) => {
              const Icon = feature.icon
              return (
                <NipoCard key={index} hoverable>
                  <NipoCardBody>
                    <div className="flex flex-col items-center text-center">
                      <div className="w-16 h-16 rounded-full bg-gradient-to-br from-[var(--color-sakura)] to-[var(--color-indigo)] flex items-center justify-center mb-4">
                        <Icon className="w-8 h-8 text-white" />
                      </div>
                      <h3 className="text-xl font-bold text-gray-900 mb-2">
                        {feature.title}
                      </h3>
                      <p className="text-gray-600">
                        {feature.description}
                      </p>
                    </div>
                  </NipoCardBody>
                </NipoCard>
              )
            })}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-gradient-to-r from-[var(--color-indigo)] to-[var(--color-sakura)]">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-4xl font-bold text-white mb-6">
            Pronto para começar sua jornada musical?
          </h2>
          <p className="text-xl text-white/90 mb-8 max-w-2xl mx-auto">
            Junte-se a centenas de alunos que já estão aprendendo música japonesa conosco.
          </p>
          <Link to={ROUTES.SIGNUP}>
            <NipoButton size="lg" variant="secondary" className="min-w-[200px]">
              Criar Conta Grátis
            </NipoButton>
          </Link>
        </div>
      </section>
    </div>
  )
}
