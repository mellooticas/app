/**
 * 📧 CONTATO - Página de Contato
 * 
 * Formulário de contato para visitantes
 */

import React, { useState } from 'react'
import { Mail, Phone, MapPin, Send } from 'lucide-react'
import { NipoCard, NipoCardBody } from '../../components/shared/NipoCard'
import { NipoInput, NipoTextarea } from '../../components/shared/NipoInput'
import { NipoButton } from '../../components/shared/NipoButton'

export const ContatoPage: React.FC = () => {
  const [formData, setFormData] = useState({
    nome: '',
    email: '',
    assunto: '',
    mensagem: '',
  })
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [submitted, setSubmitted] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsSubmitting(true)

    // Mock submission - em produção chamaria a API
    await new Promise(resolve => setTimeout(resolve, 1500))

    setIsSubmitting(false)
    setSubmitted(true)
    setFormData({ nome: '', email: '', assunto: '', mensagem: '' })

    // Reset success message após 5 segundos
    setTimeout(() => setSubmitted(false), 5000)
  }

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) => {
    setFormData(prev => ({
      ...prev,
      [e.target.name]: e.target.value,
    }))
  }

  return (
    <div className="bg-gray-50 min-h-screen py-12">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-12">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">Entre em Contato</h1>
          <p className="text-xl text-gray-600">
            Tem alguma dúvida? Envie-nos uma mensagem!
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 max-w-6xl mx-auto">
          {/* Informações de contato */}
          <div className="space-y-6">
            <NipoCard>
              <NipoCardBody>
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 rounded-full bg-[var(--color-indigo)]/10 flex items-center justify-center flex-shrink-0">
                    <Mail className="w-6 h-6 text-[var(--color-indigo)]" />
                  </div>
                  <div>
                    <h3 className="font-semibold text-gray-900 mb-1">Email</h3>
                    <p className="text-gray-600">contato@niposchool.com.br</p>
                  </div>
                </div>
              </NipoCardBody>
            </NipoCard>

            <NipoCard>
              <NipoCardBody>
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 rounded-full bg-[var(--color-indigo)]/10 flex items-center justify-center flex-shrink-0">
                    <Phone className="w-6 h-6 text-[var(--color-indigo)]" />
                  </div>
                  <div>
                    <h3 className="font-semibold text-gray-900 mb-1">Telefone</h3>
                    <p className="text-gray-600">(11) 1234-5678</p>
                  </div>
                </div>
              </NipoCardBody>
            </NipoCard>

            <NipoCard>
              <NipoCardBody>
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 rounded-full bg-[var(--color-indigo)]/10 flex items-center justify-center flex-shrink-0">
                    <MapPin className="w-6 h-6 text-[var(--color-indigo)]" />
                  </div>
                  <div>
                    <h3 className="font-semibold text-gray-900 mb-1">Localização</h3>
                    <p className="text-gray-600">São Paulo - SP, Brasil</p>
                  </div>
                </div>
              </NipoCardBody>
            </NipoCard>
          </div>

          {/* Formulário */}
          <div className="lg:col-span-2">
            <NipoCard title="Envie sua Mensagem">
              <NipoCardBody>
                {submitted && (
                  <div className="mb-6 p-4 bg-green-50 border border-green-200 rounded-lg">
                    <p className="text-green-800 font-medium">
                      ✓ Mensagem enviada com sucesso! Responderemos em breve.
                    </p>
                  </div>
                )}

                <form onSubmit={handleSubmit} className="space-y-6">
                  <NipoInput
                    label="Nome"
                    name="nome"
                    value={formData.nome}
                    onChange={handleChange}
                    placeholder="Seu nome completo"
                    isRequired
                    disabled={isSubmitting}
                  />

                  <NipoInput
                    label="Email"
                    name="email"
                    type="email"
                    value={formData.email}
                    onChange={handleChange}
                    placeholder="seu@email.com"
                    isRequired
                    disabled={isSubmitting}
                  />

                  <NipoInput
                    label="Assunto"
                    name="assunto"
                    value={formData.assunto}
                    onChange={handleChange}
                    placeholder="Sobre o que deseja falar?"
                    isRequired
                    disabled={isSubmitting}
                  />

                  <NipoTextarea
                    label="Mensagem"
                    name="mensagem"
                    value={formData.mensagem}
                    onChange={handleChange}
                    placeholder="Digite sua mensagem..."
                    rows={6}
                    isRequired
                    disabled={isSubmitting}
                  />

                  <NipoButton
                    type="submit"
                    fullWidth
                    isLoading={isSubmitting}
                    rightIcon={<Send className="w-4 h-4" />}
                  >
                    Enviar Mensagem
                  </NipoButton>
                </form>
              </NipoCardBody>
            </NipoCard>
          </div>
        </div>
      </div>
    </div>
  )
}
