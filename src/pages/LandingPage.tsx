// src/pages/LandingPage.tsx
// Landing Page Premium - Nipo School
// Design inspirado em: Linear, Vercel, Stripe

import React, { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ROUTES } from '../lib/constants/routes'

const LandingPage: React.FC = () => {
  const navigate = useNavigate()
  const [scrolled, setScrolled] = useState(false)

  useEffect(() => {
    const handleScroll = () => setScrolled(window.scrollY > 50)
    window.addEventListener('scroll', handleScroll)
    return () => window.removeEventListener('scroll', handleScroll)
  }, [])

  return (
    <div className="min-h-screen bg-gray-950 text-white overflow-x-hidden">
      
      {/* ========================================
          NAVBAR PREMIUM
      ======================================== */}
      <nav className={`fixed top-0 w-full z-50 transition-all duration-300 ${
        scrolled 
          ? 'bg-gray-950/80 backdrop-blur-xl border-b border-gray-800' 
          : 'bg-transparent'
      }`}>
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            {/* Logo Premium */}
            <div className="flex items-center space-x-3 group cursor-pointer">
              <div className="relative">
                <div className="absolute inset-0 bg-gradient-to-r from-red-500 to-orange-500 rounded-xl blur-sm opacity-75 group-hover:opacity-100 transition-opacity"></div>
                <div className="relative w-10 h-10 bg-gradient-to-br from-red-500 to-orange-600 rounded-xl flex items-center justify-center text-xl font-bold">
                  🎵
                </div>
              </div>
              <div>
                <h1 className="text-xl font-bold bg-gradient-to-r from-red-400 to-orange-400 bg-clip-text text-transparent">
                  Nipo School
                </h1>
                <p className="text-[10px] text-gray-500 font-mono">#NipoSchoolOn</p>
              </div>
            </div>

            {/* Nav Links */}
            <div className="hidden md:flex items-center space-x-8">
              <a href="#features" className="text-sm text-gray-400 hover:text-white transition-colors">
                Recursos
              </a>
              <a href="#metodologias" className="text-sm text-gray-400 hover:text-white transition-colors">
                Metodologias
              </a>
              <a href="#sistema" className="text-sm text-gray-400 hover:text-white transition-colors">
                Como Funciona
              </a>
              <a href="#pricing" className="text-sm text-gray-400 hover:text-white transition-colors">
                Planos
              </a>
            </div>

            {/* CTA */}
            <div className="flex items-center space-x-4">
              <button 
                onClick={() => navigate(ROUTES.LOGIN)}
                className="text-sm text-gray-400 hover:text-white transition-colors"
              >
                Entrar
              </button>
              <button 
                onClick={() => navigate(ROUTES.SIGNUP)}
                className="px-4 py-2 bg-gradient-to-r from-red-500 to-orange-500 rounded-lg text-sm font-medium hover:shadow-lg hover:shadow-red-500/50 transition-all"
              >
                Começar Grátis
              </button>
            </div>
          </div>
        </div>
      </nav>

      {/* ========================================
          HERO SECTION - IMPACTO MÁXIMO
      ======================================== */}
      <section className="relative min-h-screen flex items-center justify-center px-4 sm:px-6 lg:px-8 pt-16">
        {/* Grid Background */}
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#80808012_1px,transparent_1px),linear-gradient(to_bottom,#80808012_1px,transparent_1px)] bg-[size:24px_24px]"></div>
        
        {/* Gradient Orbs */}
        <div className="absolute top-1/4 left-1/4 w-96 h-96 bg-red-500/20 rounded-full blur-3xl animate-pulse"></div>
        <div className="absolute bottom-1/4 right-1/4 w-96 h-96 bg-orange-500/20 rounded-full blur-3xl animate-pulse" style={{animationDelay: '1s'}}></div>

        <div className="relative max-w-6xl mx-auto text-center z-10">
          {/* Badge */}
          <div className="inline-flex items-center px-4 py-1.5 bg-gradient-to-r from-red-500/10 to-orange-500/10 border border-red-500/20 rounded-full mb-8 backdrop-blur-sm">
            <span className="text-xs font-medium bg-gradient-to-r from-red-400 to-orange-400 bg-clip-text text-transparent">
              ✨ Sistema Educacional Enterprise • 68 Tabelas • 10+ Metodologias
            </span>
          </div>

          {/* Main Headline */}
          <h1 className="text-5xl sm:text-7xl lg:text-8xl font-bold mb-6 leading-tight">
            <span className="bg-gradient-to-r from-white via-gray-200 to-gray-400 bg-clip-text text-transparent">
              Educação Musical
            </span>
            <br />
            <span className="bg-gradient-to-r from-red-400 via-orange-400 to-pink-400 bg-clip-text text-transparent">
              Revolucionária
            </span>
          </h1>

          {/* Subheadline */}
          <p className="text-xl sm:text-2xl text-gray-400 mb-12 max-w-3xl mx-auto leading-relaxed">
            Plataforma que integra <strong className="text-white">Orff-Schulwerk</strong>, 
            <strong className="text-white"> Suzuki</strong>, 
            <strong className="text-white"> Kodály</strong> e <strong className="text-white">mais 7 metodologias</strong> em 
            um sistema gamificado enterprise-grade
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-16">
            <button 
              onClick={() => navigate(ROUTES.DASHBOARD)}
              className="group px-8 py-4 bg-gradient-to-r from-red-500 to-orange-500 rounded-xl font-semibold hover:shadow-2xl hover:shadow-red-500/50 transition-all duration-300 relative overflow-hidden"
            >
              <span className="relative z-10 flex items-center justify-center gap-2">
                🚀 Acessar Plataforma
                <svg className="w-5 h-5 group-hover:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" />
                </svg>
              </span>
            </button>
            
            <button 
              onClick={() => navigate('#demo')}
              className="px-8 py-4 bg-white/5 border border-white/10 rounded-xl font-semibold hover:bg-white/10 transition-all backdrop-blur-sm"
            >
              📹 Ver Demonstração
            </button>
          </div>

          {/* Stats Bar */}
          <div className="grid grid-cols-2 sm:grid-cols-4 gap-4 max-w-4xl mx-auto">
            <div className="bg-white/5 backdrop-blur-sm border border-white/10 rounded-2xl p-6">
              <div className="text-3xl font-bold bg-gradient-to-r from-red-400 to-orange-400 bg-clip-text text-transparent mb-2">
                10+
              </div>
              <div className="text-sm text-gray-400">Metodologias Pedagógicas</div>
            </div>
            
            <div className="bg-white/5 backdrop-blur-sm border border-white/10 rounded-2xl p-6">
              <div className="text-3xl font-bold bg-gradient-to-r from-orange-400 to-pink-400 bg-clip-text text-transparent mb-2">
                68
              </div>
              <div className="text-sm text-gray-400">Tabelas Funcionais</div>
            </div>
            
            <div className="bg-white/5 backdrop-blur-sm border border-white/10 rounded-2xl p-6">
              <div className="text-3xl font-bold bg-gradient-to-r from-pink-400 to-red-400 bg-clip-text text-transparent mb-2">
                23+
              </div>
              <div className="text-sm text-gray-400">Instrumentos Musicais</div>
            </div>
            
            <div className="bg-white/5 backdrop-blur-sm border border-white/10 rounded-2xl p-6">
              <div className="text-3xl font-bold bg-gradient-to-r from-red-400 to-orange-400 bg-clip-text text-transparent mb-2">
                100%
              </div>
              <div className="text-sm text-gray-400">Gamificado</div>
            </div>
          </div>
        </div>

        {/* Scroll Indicator */}
        <div className="absolute bottom-8 left-1/2 -translate-x-1/2 animate-bounce">
          <svg className="w-6 h-6 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 14l-7 7m0 0l-7-7m7 7V3" />
          </svg>
        </div>
      </section>

      {/* ========================================
          FEATURES - O QUE VOCÊ GANHA
      ======================================== */}
      <section id="features" className="relative py-32 px-4 sm:px-6 lg:px-8">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-20">
            <h2 className="text-4xl sm:text-6xl font-bold mb-6">
              <span className="bg-gradient-to-r from-white to-gray-400 bg-clip-text text-transparent">
                Tudo que você precisa
              </span>
              <br />
              <span className="bg-gradient-to-r from-red-400 to-orange-400 bg-clip-text text-transparent">
                em um só lugar
              </span>
            </h2>
            <p className="text-xl text-gray-400 max-w-2xl mx-auto">
              Sistema completo de educação musical com tecnologia enterprise-grade
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {/* Feature 1 */}
            <div className="group relative bg-gradient-to-br from-white/5 to-white/0 border border-white/10 rounded-2xl p-8 hover:border-red-500/50 transition-all duration-300">
              <div className="absolute inset-0 bg-gradient-to-br from-red-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
              <div className="relative">
                <div className="w-14 h-14 bg-gradient-to-br from-red-500/20 to-orange-500/20 rounded-xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <span className="text-3xl">🎮</span>
                </div>
                <h3 className="text-xl font-bold mb-3">Gamificação Completa</h3>
                <p className="text-gray-400 leading-relaxed">
                  Sistema de conquistas, pontos, badges e níveis que mantém o engajamento alto. 
                  5 tipos de achievements automáticos.
                </p>
              </div>
            </div>

            {/* Feature 2 */}
            <div className="group relative bg-gradient-to-br from-white/5 to-white/0 border border-white/10 rounded-2xl p-8 hover:border-orange-500/50 transition-all duration-300">
              <div className="absolute inset-0 bg-gradient-to-br from-orange-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
              <div className="relative">
                <div className="w-14 h-14 bg-gradient-to-br from-orange-500/20 to-pink-500/20 rounded-xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <span className="text-3xl">📚</span>
                </div>
                <h3 className="text-xl font-bold mb-3">Desafios Alpha</h3>
                <p className="text-gray-400 leading-relaxed">
                  Sistema pedagógico avançado com desafios estruturados, submissões de evidências 
                  e avaliação por rubricas.
                </p>
              </div>
            </div>

            {/* Feature 3 */}
            <div className="group relative bg-gradient-to-br from-white/5 to-white/0 border border-white/10 rounded-2xl p-8 hover:border-pink-500/50 transition-all duration-300">
              <div className="absolute inset-0 bg-gradient-to-br from-pink-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
              <div className="relative">
                <div className="w-14 h-14 bg-gradient-to-br from-pink-500/20 to-red-500/20 rounded-xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <span className="text-3xl">🎨</span>
                </div>
                <h3 className="text-xl font-bold mb-3">Portfólio Digital</h3>
                <p className="text-gray-400 leading-relaxed">
                  Construa seu portfólio musical com evidências multimídia, autoavaliações 
                  e feedback colaborativo.
                </p>
              </div>
            </div>

            {/* Feature 4 */}
            <div className="group relative bg-gradient-to-br from-white/5 to-white/0 border border-white/10 rounded-2xl p-8 hover:border-blue-500/50 transition-all duration-300">
              <div className="absolute inset-0 bg-gradient-to-br from-blue-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
              <div className="relative">
                <div className="w-14 h-14 bg-gradient-to-br from-blue-500/20 to-indigo-500/20 rounded-xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <span className="text-3xl">🎻</span>
                </div>
                <h3 className="text-xl font-bold mb-3">Biblioteca Interativa</h3>
                <p className="text-gray-400 leading-relaxed">
                  23+ instrumentos musicais documentados com anatomia, técnicas, sons 
                  e curiosidades históricas.
                </p>
              </div>
            </div>

            {/* Feature 5 */}
            <div className="group relative bg-gradient-to-br from-white/5 to-white/0 border border-white/10 rounded-2xl p-8 hover:border-purple-500/50 transition-all duration-300">
              <div className="absolute inset-0 bg-gradient-to-br from-purple-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
              <div className="relative">
                <div className="w-14 h-14 bg-gradient-to-br from-purple-500/20 to-pink-500/20 rounded-xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <span className="text-3xl">📋</span>
                </div>
                <h3 className="text-xl font-bold mb-3">Sistema Kanban</h3>
                <p className="text-gray-400 leading-relaxed">
                  Gestão visual de aulas com quadros Kanban: To Do → Doing → Review → Done. 
                  Progressão clara e intuitiva.
                </p>
              </div>
            </div>

            {/* Feature 6 */}
            <div className="group relative bg-gradient-to-br from-white/5 to-white/0 border border-white/10 rounded-2xl p-8 hover:border-green-500/50 transition-all duration-300">
              <div className="absolute inset-0 bg-gradient-to-br from-green-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
              <div className="relative">
                <div className="w-14 h-14 bg-gradient-to-br from-green-500/20 to-emerald-500/20 rounded-xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <span className="text-3xl">👥</span>
                </div>
                <h3 className="text-xl font-bold mb-3">Multi-Role Dashboard</h3>
                <p className="text-gray-400 leading-relaxed">
                  Dashboards específicos para Aluno, Professor e Admin com RLS (Row Level Security) 
                  completo no banco.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* ========================================
          METODOLOGIAS - VISUAL PREMIUM
      ======================================== */}
      <section id="metodologias" className="relative py-32 px-4 sm:px-6 lg:px-8 bg-gradient-to-b from-transparent to-white/5">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-20">
            <h2 className="text-4xl sm:text-6xl font-bold mb-6">
              <span className="bg-gradient-to-r from-white to-gray-400 bg-clip-text text-transparent">
                10+ Metodologias
              </span>
              <br />
              <span className="bg-gradient-to-r from-red-400 to-orange-400 bg-clip-text text-transparent">
                Comprovadas Mundialmente
              </span>
            </h2>
            <p className="text-xl text-gray-400 max-w-3xl mx-auto">
              As melhores abordagens pedagógicas da Alemanha, Japão, Hungria, Inglaterra, Suíça e EUA
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {[
              {
                name: 'Orff-Schulwerk',
                country: 'Alemanha',
                author: 'Carl Orff',
                icon: '🎵',
                color: 'from-blue-500 to-cyan-500',
                description: 'Educação musical elementar através de movimento, ritmo e improvisação'
              },
              {
                name: 'Método Suzuki',
                country: 'Japão',
                author: 'Shinichi Suzuki',
                icon: '🎻',
                color: 'from-red-500 to-pink-500',
                description: 'Talento não é inato, mas educado. Aprendizagem pela língua materna musical'
              },
              {
                name: 'Método Kodály',
                country: 'Hungria',
                author: 'Zoltán Kodály',
                icon: '🎼',
                color: 'from-green-500 to-emerald-500',
                description: 'Desenvolvimento auditivo através do folclore, solfejo relativo e manossolfa'
              },
              {
                name: 'Musical Futures',
                country: 'Inglaterra',
                author: 'Paul Hallam',
                icon: '🎸',
                color: 'from-purple-500 to-violet-500',
                description: 'Aprendizagem musical informal através de bandas escolares e música popular'
              },
              {
                name: 'Dalcroze',
                country: 'Suíça',
                author: 'Émile Jaques-Dalcroze',
                icon: '💃',
                color: 'from-pink-500 to-rose-500',
                description: 'Euritmia - música através do movimento corporal e expressão física'
              },
              {
                name: 'Music Learning Theory',
                country: 'EUA',
                author: 'Edwin Gordon',
                icon: '🎹',
                color: 'from-indigo-500 to-blue-500',
                description: 'Audiação e desenvolvimento sequencial da aptidão musical'
              }
            ].map((metodologia, index) => (
              <div 
                key={index}
                className="group relative bg-gradient-to-br from-white/5 to-white/0 border border-white/10 rounded-2xl p-8 hover:scale-105 transition-all duration-300"
              >
                <div className={`absolute inset-0 bg-gradient-to-br ${metodologia.color} opacity-0 group-hover:opacity-10 transition-opacity rounded-2xl`}></div>
                <div className="relative">
                  <div className={`w-16 h-16 bg-gradient-to-br ${metodologia.color} rounded-2xl flex items-center justify-center mb-6 text-3xl`}>
                    {metodologia.icon}
                  </div>
                  <h3 className="text-2xl font-bold mb-2">{metodologia.name}</h3>
                  <div className="flex items-center gap-2 mb-4">
                    <span className={`text-sm bg-gradient-to-r ${metodologia.color} bg-clip-text text-transparent font-semibold`}>
                      {metodologia.country}
                    </span>
                    <span className="text-gray-600">•</span>
                    <span className="text-sm text-gray-400">{metodologia.author}</span>
                  </div>
                  <p className="text-gray-400 leading-relaxed">
                    {metodologia.description}
                  </p>
                </div>
              </div>
            ))}
          </div>

          <div className="text-center mt-12">
            <p className="text-gray-400 mb-6">
              <strong className="text-white">+4 metodologias:</strong> Waldorf-Steiner • Berklee Contemporânea • Lincoln Center Education • PRESTO
            </p>
            <button className="px-6 py-3 bg-white/5 border border-white/10 rounded-xl text-sm font-medium hover:bg-white/10 transition-all backdrop-blur-sm">
              Ver todas as 10+ metodologias →
            </button>
          </div>
        </div>
      </section>

      {/* ========================================
          COMO FUNCIONA - SISTEMA VISUAL
      ======================================== */}
      <section id="sistema" className="relative py-32 px-4 sm:px-6 lg:px-8">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-20">
            <h2 className="text-4xl sm:text-6xl font-bold mb-6">
              <span className="bg-gradient-to-r from-white to-gray-400 bg-clip-text text-transparent">
                Como Funciona
              </span>
              <br />
              <span className="bg-gradient-to-r from-red-400 to-orange-400 bg-clip-text text-transparent">
                Arquitetura Enterprise
              </span>
            </h2>
          </div>

          {/* Fluxo Visual */}
          <div className="relative">
            {/* Linha conectora */}
            <div className="absolute top-1/2 left-0 right-0 h-0.5 bg-gradient-to-r from-transparent via-red-500/50 to-transparent hidden lg:block"></div>

            <div className="grid lg:grid-cols-4 gap-8 relative">
              {[
                {
                  step: '01',
                  title: 'Cadastro & Role',
                  description: 'Sistema detecta automaticamente se é Aluno, Professor ou Admin',
                  icon: '🔐'
                },
                {
                  step: '02',
                  title: 'Dashboard Personalizado',
                  description: 'Interface única para cada tipo de usuário com RLS no banco',
                  icon: '📊'
                },
                {
                  step: '03',
                  title: 'Progressão Gamificada',
                  description: 'Conquistas, pontos e badges são calculados automaticamente',
                  icon: '🎯'
                },
                {
                  step: '04',
                  title: 'Portfólio & Certificação',
                  description: 'Evidências documentadas e avaliação contínua baseada em rubricas',
                  icon: '🏆'
                }
              ].map((item, index) => (
                <div key={index} className="relative">
                  <div className="bg-gradient-to-br from-white/5 to-white/0 border border-white/10 rounded-2xl p-8 hover:border-red-500/50 transition-all">
                    {/* Step Number */}
                    <div className="text-6xl font-bold bg-gradient-to-br from-red-500/20 to-transparent bg-clip-text text-transparent mb-4">
                      {item.step}
                    </div>
                    
                    {/* Icon */}
                    <div className="w-12 h-12 bg-gradient-to-br from-red-500/20 to-orange-500/20 rounded-xl flex items-center justify-center mb-4 text-2xl">
                      {item.icon}
                    </div>

                    {/* Content */}
                    <h3 className="text-xl font-bold mb-3">{item.title}</h3>
                    <p className="text-gray-400 leading-relaxed">{item.description}</p>
                  </div>

                  {/* Connector (desktop only) */}
                  {index < 3 && (
                    <div className="hidden lg:block absolute top-1/2 -right-4 w-8 h-8">
                      <svg className="w-full h-full text-red-500/50" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
                      </svg>
                    </div>
                  )}
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* ========================================
          PRICING - PLANOS
      ======================================== */}
      <section id="pricing" className="relative py-32 px-4 sm:px-6 lg:px-8 bg-gradient-to-b from-white/5 to-transparent">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-20">
            <h2 className="text-4xl sm:text-6xl font-bold mb-6">
              <span className="bg-gradient-to-r from-white to-gray-400 bg-clip-text text-transparent">
                Escolha seu plano
              </span>
            </h2>
            <p className="text-xl text-gray-400">
              Acesso completo para escolas e instituições
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-8 max-w-6xl mx-auto">
            {/* Starter */}
            <div className="bg-gradient-to-br from-white/5 to-white/0 border border-white/10 rounded-2xl p-8">
              <h3 className="text-2xl font-bold mb-2">Starter</h3>
              <p className="text-gray-400 mb-6">Para educadores individuais</p>
              <div className="mb-8">
                <span className="text-5xl font-bold">R$ 49</span>
                <span className="text-gray-400">/mês</span>
              </div>
              <ul className="space-y-4 mb-8">
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Até 30 alunos</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Gamificação completa</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Biblioteca de instrumentos</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Suporte por email</span>
                </li>
              </ul>
              <button className="w-full py-3 bg-white/10 border border-white/20 rounded-xl font-medium hover:bg-white/20 transition-all">
                Começar Grátis
              </button>
            </div>

            {/* Professional - Destaque */}
            <div className="relative bg-gradient-to-br from-red-500/10 to-orange-500/10 border-2 border-red-500/50 rounded-2xl p-8">
              <div className="absolute -top-4 left-1/2 -translate-x-1/2 px-4 py-1 bg-gradient-to-r from-red-500 to-orange-500 rounded-full text-sm font-semibold">
                Mais Popular
              </div>
              <h3 className="text-2xl font-bold mb-2">Professional</h3>
              <p className="text-gray-400 mb-6">Para escolas pequenas</p>
              <div className="mb-8">
                <span className="text-5xl font-bold">R$ 149</span>
                <span className="text-gray-400">/mês</span>
              </div>
              <ul className="space-y-4 mb-8">
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Até 100 alunos</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">5 professores</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Dashboard Admin completo</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Relatórios avançados</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Suporte prioritário</span>
                </li>
              </ul>
              <button className="w-full py-3 bg-gradient-to-r from-red-500 to-orange-500 rounded-xl font-semibold hover:shadow-lg hover:shadow-red-500/50 transition-all">
                Começar Teste Grátis
              </button>
            </div>

            {/* Enterprise */}
            <div className="bg-gradient-to-br from-white/5 to-white/0 border border-white/10 rounded-2xl p-8">
              <h3 className="text-2xl font-bold mb-2">Enterprise</h3>
              <p className="text-gray-400 mb-6">Para grandes instituições</p>
              <div className="mb-8">
                <span className="text-5xl font-bold">Custom</span>
              </div>
              <ul className="space-y-4 mb-8">
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Alunos ilimitados</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Professores ilimitados</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">White-label customizável</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Integração API</span>
                </li>
                <li className="flex items-center gap-3">
                  <span className="text-green-400">✓</span>
                  <span className="text-gray-300">Suporte 24/7</span>
                </li>
              </ul>
              <button className="w-full py-3 bg-white/10 border border-white/20 rounded-xl font-medium hover:bg-white/20 transition-all">
                Falar com Vendas
              </button>
            </div>
          </div>
        </div>
      </section>

      {/* ========================================
          CTA FINAL - IMPACTO MÁXIMO
      ======================================== */}
      <section className="relative py-32 px-4 sm:px-6 lg:px-8">
        <div className="max-w-4xl mx-auto text-center relative z-10">
          {/* Gradient Orb */}
          <div className="absolute inset-0 bg-gradient-to-r from-red-500/30 via-orange-500/30 to-pink-500/30 blur-3xl"></div>

          <div className="relative bg-gradient-to-br from-white/10 to-white/5 border border-white/20 rounded-3xl p-12 backdrop-blur-xl">
            <h2 className="text-4xl sm:text-5xl font-bold mb-6">
              Pronto para revolucionar sua
              <br />
              <span className="bg-gradient-to-r from-red-400 to-orange-400 bg-clip-text text-transparent">
                educação musical?
              </span>
            </h2>
            <p className="text-xl text-gray-400 mb-8 max-w-2xl mx-auto">
              Junte-se a centenas de escolas que já transformaram o ensino musical 
              com o Nipo School
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <button 
                onClick={() => navigate(ROUTES.SIGNUP)}
                className="px-8 py-4 bg-gradient-to-r from-red-500 to-orange-500 rounded-xl text-lg font-semibold hover:shadow-2xl hover:shadow-red-500/50 transition-all"
              >
                🚀 Começar Grátis Agora
              </button>
              <button 
                onClick={() => navigate('#demo')}
                className="px-8 py-4 bg-white/10 border border-white/20 rounded-xl text-lg font-semibold hover:bg-white/20 transition-all"
              >
                📅 Agendar Demo
              </button>
            </div>
          </div>
        </div>
      </section>

      {/* ========================================
          FOOTER PREMIUM
      ======================================== */}
      <footer className="relative border-t border-white/10 py-16 px-4 sm:px-6 lg:px-8">
        <div className="max-w-7xl mx-auto">
          <div className="grid md:grid-cols-4 gap-12 mb-12">
            {/* Brand */}
            <div className="md:col-span-2">
              <div className="flex items-center space-x-3 mb-6">
                <div className="w-10 h-10 bg-gradient-to-br from-red-500 to-orange-600 rounded-xl flex items-center justify-center text-xl font-bold">
                  🎵
                </div>
                <span className="text-2xl font-bold">Nipo School</span>
              </div>
              <p className="text-gray-400 mb-6 max-w-md leading-relaxed">
                Plataforma educacional revolucionária que integra 10+ metodologias pedagógicas 
                mundialmente comprovadas em um sistema enterprise-grade gamificado.
              </p>
              <div className="flex gap-4">
                <a href="#" className="w-10 h-10 bg-white/10 rounded-lg flex items-center justify-center hover:bg-white/20 transition-all">
                  <span className="text-xl">📘</span>
                </a>
                <a href="#" className="w-10 h-10 bg-white/10 rounded-lg flex items-center justify-center hover:bg-white/20 transition-all">
                  <span className="text-xl">📸</span>
                </a>
                <a href="#" className="w-10 h-10 bg-white/10 rounded-lg flex items-center justify-center hover:bg-white/20 transition-all">
                  <span className="text-xl">🐦</span>
                </a>
              </div>
            </div>

            {/* Links 1 */}
            <div>
              <h3 className="font-bold mb-4">Produto</h3>
              <ul className="space-y-3 text-gray-400">
                <li><a href="#features" className="hover:text-white transition-colors">Recursos</a></li>
                <li><a href="#metodologias" className="hover:text-white transition-colors">Metodologias</a></li>
                <li><a href="#pricing" className="hover:text-white transition-colors">Preços</a></li>
                <li><a href="#" className="hover:text-white transition-colors">Roadmap</a></li>
              </ul>
            </div>

            {/* Links 2 */}
            <div>
              <h3 className="font-bold mb-4">Empresa</h3>
              <ul className="space-y-3 text-gray-400">
                <li><a href="#" className="hover:text-white transition-colors">Sobre</a></li>
                <li><a href="#" className="hover:text-white transition-colors">Blog</a></li>
                <li><a href="#" className="hover:text-white transition-colors">Carreiras</a></li>
                <li><a href="#" className="hover:text-white transition-colors">Contato</a></li>
              </ul>
            </div>
          </div>

          {/* Bottom Bar */}
          <div className="border-t border-white/10 pt-8 flex flex-col md:flex-row justify-between items-center gap-4 text-sm text-gray-400">
            <p>© 2025 Nipo School. Todos os direitos reservados.</p>
            <div className="flex gap-6">
              <a href="#" className="hover:text-white transition-colors">Privacidade</a>
              <a href="#" className="hover:text-white transition-colors">Termos</a>
              <a href="#" className="hover:text-white transition-colors">Cookies</a>
            </div>
          </div>
        </div>
      </footer>

      {/* Floating Scroll to Top */}
      <button 
        onClick={() => window.scrollTo({ top: 0, behavior: 'smooth' })}
        className="fixed bottom-8 right-8 w-12 h-12 bg-gradient-to-br from-red-500 to-orange-500 rounded-full flex items-center justify-center shadow-lg hover:shadow-red-500/50 transition-all group"
      >
        <svg className="w-6 h-6 group-hover:-translate-y-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 10l7-7m0 0l7 7m-7-7v18" />
        </svg>
      </button>
    </div>
  )
}

export default LandingPage