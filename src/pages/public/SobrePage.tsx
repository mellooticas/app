/**
 * ℹ️ SOBRE - Página Sobre o Nipo School
 * 
 * Informações sobre o centro de estudos
 */

import React from 'react'
import { Music, Users, Award, Heart } from 'lucide-react'
import { Link } from 'react-router-dom'
import { ROUTES } from '../../lib/constants/routes'
import { NipoButton } from '../../components/shared/NipoButton'
import { NipoCard, NipoCardBody } from '../../components/shared/NipoCard'

export const SobrePage: React.FC = () => {
  const values = [
    {
      icon: Music,
      title: 'Tradição',
      description: 'Preservamos e ensinamos a autêntica música tradicional japonesa.',
    },
    {
      icon: Users,
      title: 'Comunidade',
      description: 'Construímos uma comunidade forte de estudantes e mestres.',
    },
    {
      icon: Award,
      title: 'Excelência',
      description: 'Buscamos sempre os mais altos padrões de ensino.',
    },
    {
      icon: Heart,
      title: 'Paixão',
      description: 'Amamos a música japonesa e queremos compartilhar isso.',
    },
  ]

  return (
    <div className="bg-white">
      {/* Hero */}
      <section className="bg-gradient-to-br from-[var(--color-sakura)]/20 to-[var(--color-indigo)]/20 py-20">
        <div className="container mx-auto px-4">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-5xl font-bold text-gray-900 mb-6">
              Sobre o Nipo School
            </h1>
            <p className="text-xl text-gray-600">
              Centro de Estudos de Música Nipo-Brasileira dedicado a preservar e 
              ensinar a rica tradição musical japonesa no Brasil.
            </p>
          </div>
        </div>
      </section>

      {/* História */}
      <section className="py-20">
        <div className="container mx-auto px-4">
          <div className="max-w-4xl mx-auto">
            <h2 className="text-3xl font-bold text-gray-900 mb-6">Nossa História</h2>
            <div className="prose prose-lg text-gray-600">
              <p className="mb-4">
                O Nipo School nasceu da paixão pela música tradicional japonesa e do desejo 
                de preservar essa rica herança cultural para as futuras gerações.
              </p>
              <p className="mb-4">
                Fundado por mestres experientes em instrumentos tradicionais japoneses, 
                nosso centro de estudos oferece uma abordagem única que combina 
                técnicas tradicionais com recursos modernos de ensino.
              </p>
              <p>
                Hoje, somos uma comunidade vibrante de alunos, professores e entusiastas 
                da música japonesa, unidos pela paixão de aprender e compartilhar 
                conhecimento.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Valores */}
      <section className="py-20 bg-gray-50">
        <div className="container mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="text-3xl font-bold text-gray-900 mb-4">
              Nossos Valores
            </h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 max-w-6xl mx-auto">
            {values.map((value, index) => {
              const Icon = value.icon
              return (
                <NipoCard key={index}>
                  <NipoCardBody>
                    <div className="text-center">
                      <div className="w-16 h-16 rounded-full bg-gradient-to-br from-[var(--color-sakura)] to-[var(--color-indigo)] flex items-center justify-center mx-auto mb-4">
                        <Icon className="w-8 h-8 text-white" />
                      </div>
                      <h3 className="text-xl font-bold text-gray-900 mb-2">
                        {value.title}
                      </h3>
                      <p className="text-gray-600 text-sm">
                        {value.description}
                      </p>
                    </div>
                  </NipoCardBody>
                </NipoCard>
              )
            })}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-20">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">
            Quer fazer parte da nossa comunidade?
          </h2>
          <p className="text-xl text-gray-600 mb-8">
            Comece sua jornada musical conosco hoje mesmo.
          </p>
          <div className="flex gap-4 justify-center">
            <Link to={ROUTES.SIGNUP}>
              <NipoButton size="lg">Cadastrar</NipoButton>
            </Link>
            <Link to={ROUTES.CONTATO}>
              <NipoButton size="lg" variant="outline">Entre em Contato</NipoButton>
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}
