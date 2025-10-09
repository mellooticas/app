/**
 * 🦶 FOOTER - Rodapé do Site
 * 
 * Footer para páginas públicas
 * - Links importantes
 * - Redes sociais
 * - Copyright
 */

import React from 'react'
import { Link } from 'react-router-dom'
import { Mail, Phone, MapPin, Facebook, Instagram, Youtube } from 'lucide-react'
import { ROUTES } from '@/lib/constants/routes'

export const Footer: React.FC = () => {
  const currentYear = new Date().getFullYear()

  return (
    <footer className="bg-gray-900 text-gray-300">
      <div className="container mx-auto px-4 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          {/* Logo e descrição */}
          <div className="col-span-1 md:col-span-2">
            <div className="flex items-center gap-2 mb-4">
              <div className="w-8 h-8 bg-gradient-to-br from-[var(--color-sakura)] to-[var(--color-indigo)] rounded-lg flex items-center justify-center">
                <span className="text-white font-bold text-lg">N</span>
              </div>
              <span className="text-xl font-bold text-white">Nipo School</span>
            </div>
            <p className="text-gray-400 mb-4 max-w-md">
              Centro de Estudos de Música Nipo-Brasileira. Preservando e ensinando a tradição musical japonesa no Brasil.
            </p>
            <div className="flex gap-4">
              <a href="#" className="hover:text-white transition-colors" aria-label="Facebook">
                <Facebook className="w-5 h-5" />
              </a>
              <a href="#" className="hover:text-white transition-colors" aria-label="Instagram">
                <Instagram className="w-5 h-5" />
              </a>
              <a href="#" className="hover:text-white transition-colors" aria-label="YouTube">
                <Youtube className="w-5 h-5" />
              </a>
            </div>
          </div>

          {/* Links rápidos */}
          <div>
            <h3 className="text-white font-semibold mb-4">Links Rápidos</h3>
            <ul className="space-y-2">
              <li>
                <Link to={ROUTES.HOME} className="hover:text-white transition-colors">
                  Início
                </Link>
              </li>
              <li>
                <Link to={ROUTES.SOBRE} className="hover:text-white transition-colors">
                  Sobre
                </Link>
              </li>
              <li>
                <Link to={ROUTES.CONTATO} className="hover:text-white transition-colors">
                  Contato
                </Link>
              </li>
              <li>
                <Link to={ROUTES.LOGIN} className="hover:text-white transition-colors">
                  Entrar
                </Link>
              </li>
            </ul>
          </div>

          {/* Contato */}
          <div>
            <h3 className="text-white font-semibold mb-4">Contato</h3>
            <ul className="space-y-3">
              <li className="flex items-start gap-2">
                <Mail className="w-5 h-5 mt-0.5 flex-shrink-0" />
                <span>contato@niposchool.com.br</span>
              </li>
              <li className="flex items-start gap-2">
                <Phone className="w-5 h-5 mt-0.5 flex-shrink-0" />
                <span>(11) 1234-5678</span>
              </li>
              <li className="flex items-start gap-2">
                <MapPin className="w-5 h-5 mt-0.5 flex-shrink-0" />
                <span>São Paulo - SP, Brasil</span>
              </li>
            </ul>
          </div>
        </div>

        {/* Copyright */}
        <div className="border-t border-gray-800 mt-8 pt-8 text-center text-gray-500">
          <p>© {currentYear} Nipo School. Todos os direitos reservados.</p>
        </div>
      </div>
    </footer>
  )
}
