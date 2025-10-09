/**
 * 🧭 NAVBAR - Barra de Navegação Pública
 * 
 * Navbar para páginas públicas
 * - Logo
 * - Links de navegação
 * - CTA Login/Registrar
 */

import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import { Menu, X } from 'lucide-react'
import { ROUTES } from '../../lib/constants/routes'
import { NipoButton } from '../shared/NipoButton'

export const Navbar: React.FC = () => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false)

  const navLinks = [
    { name: 'Início', path: ROUTES.HOME },
    { name: 'Sobre', path: ROUTES.SOBRE },
    { name: 'Contato', path: ROUTES.CONTATO },
  ]

  return (
    <nav className="bg-white shadow-sm sticky top-0 z-50">
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-between h-16">
          {/* Logo */}
          <Link to={ROUTES.HOME} className="flex items-center gap-2">
            <div className="w-8 h-8 bg-gradient-to-br from-[var(--color-sakura)] to-[var(--color-indigo)] rounded-lg flex items-center justify-center">
              <span className="text-white font-bold text-lg">N</span>
            </div>
            <span className="text-xl font-bold text-gray-900">Nipo School</span>
          </Link>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center gap-8">
            {navLinks.map((link) => (
              <Link
                key={link.path}
                to={link.path}
                className="text-gray-600 hover:text-[var(--color-indigo)] transition-colors"
              >
                {link.name}
              </Link>
            ))}
          </div>

          {/* Desktop CTA */}
          <div className="hidden md:flex items-center gap-3">
            <Link to={ROUTES.LOGIN}>
              <NipoButton variant="ghost">Entrar</NipoButton>
            </Link>
            <Link to={ROUTES.SIGNUP}>
              <NipoButton>Cadastrar</NipoButton>
            </Link>
          </div>

          {/* Mobile menu button */}
          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="md:hidden p-2 rounded-md text-gray-600 hover:bg-gray-100"
          >
            {mobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
          </button>
        </div>

        {/* Mobile Navigation */}
        {mobileMenuOpen && (
          <div className="md:hidden py-4 border-t">
            <div className="flex flex-col gap-4">
              {navLinks.map((link) => (
                <Link
                  key={link.path}
                  to={link.path}
                  className="text-gray-600 hover:text-[var(--color-indigo)] px-4 py-2 transition-colors"
                  onClick={() => setMobileMenuOpen(false)}
                >
                  {link.name}
                </Link>
              ))}
              <div className="flex flex-col gap-2 px-4 pt-4 border-t">
                <Link to={ROUTES.LOGIN} onClick={() => setMobileMenuOpen(false)}>
                  <NipoButton variant="ghost" fullWidth>Entrar</NipoButton>
                </Link>
                <Link to={ROUTES.SIGNUP} onClick={() => setMobileMenuOpen(false)}>
                  <NipoButton fullWidth>Cadastrar</NipoButton>
                </Link>
              </div>
            </div>
          </div>
        )}
      </div>
    </nav>
  )
}
