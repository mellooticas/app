import React, { useState, useEffect } from 'react';
import { DesignTokens } from '../../styles/design-tokens';
import Button from '../base/Button';
import { LogOut, Menu, X } from 'lucide-react';

/**
 * 🎌 OrientalNavigation - Header unificado com identidade visual japonesa
 * 
 * @param {Object} props
 * @param {string} props.title - Título da página/seção
 * @param {string} props.logoChar - Caractere japonês para o logo (default: 鳥)
 * @param {string} props.userType - Tipo de usuário: 'student' | 'teacher' | 'admin'
 * @param {Object} props.user - Dados do usuário logado
 * @param {Function} props.onLogout - Função de logout
 * @param {Array} props.menuItems - Items do menu (opcional)
 * @param {string} props.className - Classes CSS adicionais
 */
const OrientalNavigation = ({
  title = 'Nipo School',
  logoChar,
  userType = 'student',
  user,
  onLogout,
  menuItems = [],
  className = '',
  ...props
}) => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [greeting, setGreeting] = useState('');

  // Configurações por tipo de usuário
  const userConfig = {
    student: {
      char: '学',  // Gaku (aprender)
      subtitle: 'Área do Estudante',
      color: 'from-orange-500 to-red-500'
    },
    teacher: {
      char: '先',  // Sen (professor/mestre)
      subtitle: 'Área do Professor',
      color: 'from-red-500 to-pink-500'
    },
    admin: {
      char: '師',  // Shi (mestre/especialista)
      subtitle: 'Painel Administrativo',
      color: 'from-red-600 to-pink-600'
    }
  };

  const config = userConfig[userType] || userConfig.student;
  const finalLogoChar = logoChar || config.char;

  // Saudação dinâmica em japonês
  useEffect(() => {
    const updateGreeting = () => {
      const hour = new Date().getHours();
      const greetings = DesignTokens.oriental.greetings;
      
      if (hour < 12) {
        setGreeting(greetings.morning);      // おはよう
      } else if (hour < 18) {
        setGreeting(greetings.afternoon);    // こんにちは
      } else {
        setGreeting(greetings.evening);      // こんばんは
      }
    };

    updateGreeting();
    const interval = setInterval(updateGreeting, 60000); // Atualiza a cada minuto
    
    return () => clearInterval(interval);
  }, []);

  const handleLogout = () => {
    if (window.confirm('Tem certeza que deseja sair?')) {
      onLogout?.();
    }
  };

  const renderUserInfo = () => {
    if (!user) return null;

    return (
      <div className="flex items-center space-x-3">
        {/* Avatar */}
        <div className="w-8 h-8 rounded-full bg-gradient-to-r from-red-400 to-red-500 flex items-center justify-center">
          <span className="text-white text-sm font-medium">
            {user.full_name?.charAt(0).toUpperCase() || user.email?.charAt(0).toUpperCase()}
          </span>
        </div>
        
        {/* Info do usuário */}
        <div className="hidden sm:block">
          <p className="text-sm font-medium text-gray-900">
            {greeting} {user.full_name || 'Usuário'}!
          </p>
          <p className="text-xs text-gray-600">
            {config.subtitle}
          </p>
        </div>
      </div>
    );
  };

  const renderMobileMenu = () => {
    if (!isMenuOpen) return null;

    return (
      <div className="sm:hidden">
        <div className="px-4 pt-2 pb-3 space-y-1 bg-white border-t border-red-100">
          {/* User info mobile */}
          {user && (
            <div className="px-3 py-2 border-b border-gray-100 mb-2">
              <p className="text-sm font-medium text-gray-900">
                {greeting} {user.full_name || 'Usuário'}!
              </p>
              <p className="text-xs text-gray-600">
                {config.subtitle}
              </p>
            </div>
          )}
          
          {/* Menu items mobile */}
          {menuItems.map((item, index) => (
            <button
              key={index}
              onClick={() => {
                item.onClick?.();
                setIsMenuOpen(false);
              }}
              className="w-full text-left px-3 py-2 text-sm text-gray-700 hover:bg-red-50 hover:text-red-600 rounded-md transition-colors"
            >
              {item.label}
            </button>
          ))}
          
          {/* Logout mobile */}
          <button
            onClick={() => {
              handleLogout();
              setIsMenuOpen(false);
            }}
            className="w-full text-left px-3 py-2 text-sm text-red-600 hover:bg-red-50 rounded-md transition-colors flex items-center"
          >
            <LogOut className="w-4 h-4 mr-2" />
            {DesignTokens.oriental.greetings.goodbye} {/* またね */}
          </button>
        </div>
      </div>
    );
  };

  return (
    <>
      <nav 
        className={`
          bg-white/90 backdrop-blur-md shadow-sm border-b border-red-100 
          sticky top-0 z-50
          ${className}
        `}
        {...props}
      >
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-16">
            
            {/* Logo e título */}
            <div className="flex items-center space-x-3">
              {/* Logo oriental */}
              <div className={`
                w-10 h-10 sm:w-12 sm:h-12 
                bg-gradient-to-br ${config.color}
                rounded-2xl flex items-center justify-center 
                shadow-md hover:scale-105 transition-transform
              `}>
                <span className="text-white text-lg sm:text-xl font-bold">
                  {finalLogoChar}
                </span>
              </div>
              
              {/* Título */}
              <div className="hidden sm:block">
                <h1 className="text-lg font-semibold text-gray-900">
                  {title}
                </h1>
                <p className="text-xs text-gray-600">
                  Sistema de Ensino Musical
                </p>
              </div>
            </div>

            {/* Desktop: User info e menu */}
            <div className="hidden sm:flex items-center space-x-4">
              {/* Menu items */}
              {menuItems.length > 0 && (
                <div className="flex items-center space-x-2">
                  {menuItems.map((item, index) => (
                    <Button
                      key={index}
                      variant="ghost"
                      size="sm"
                      onClick={item.onClick}
                      className="text-gray-700 hover:text-red-600"
                    >
                      {item.label}
                    </Button>
                  ))}
                </div>
              )}
              
              {/* User info */}
              {renderUserInfo()}
              
              {/* Logout button */}
              {onLogout && (
                <Button
                  variant="oriental"
                  size="sm"
                  onClick={handleLogout}
                  icon={<LogOut />}
                  iconPosition="left"
                >
                  <span className="hidden lg:inline">
                    {DesignTokens.oriental.greetings.goodbye}
                  </span>
                  <span className="lg:hidden">Sair</span>
                </Button>
              )}
            </div>

            {/* Mobile: Menu hamburger */}
            <div className="sm:hidden">
              <Button
                variant="ghost"
                size="sm"
                onClick={() => setIsMenuOpen(!isMenuOpen)}
                icon={isMenuOpen ? <X /> : <Menu />}
              />
            </div>
          </div>
        </div>

        {/* Mobile menu */}
        {renderMobileMenu()}
      </nav>
    </>
  );
};

/**
 * 🎋 OrientalBreadcrumb - Breadcrumb oriental
 */
export const OrientalBreadcrumb = ({
  items = [],
  separator = '/',
  className = '',
  ...props
}) => {
  if (items.length === 0) return null;

  return (
    <nav 
      className={`flex items-center space-x-2 text-sm text-gray-600 ${className}`}
      {...props}
    >
      {items.map((item, index) => (
        <React.Fragment key={index}>
          {index > 0 && (
            <span className="text-gray-400">{separator}</span>
          )}
          
          {item.href ? (
            <a
              href={item.href}
              className="hover:text-red-600 transition-colors"
              onClick={item.onClick}
            >
              {item.label}
            </a>
          ) : (
            <span className={index === items.length - 1 ? 'text-gray-900 font-medium' : ''}>
              {item.label}
            </span>
          )}
        </React.Fragment>
      ))}
    </nav>
  );
};

export default OrientalNavigation;