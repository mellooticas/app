import React from 'react';
import { DesignTokens } from '../../styles/design-tokens';

/**
 * 🎌 OrientalContainer - Container principal com identidade visual oriental
 * 
 * @param {Object} props
 * @param {React.ReactNode} props.children - Conteúdo do container
 * @param {string} props.theme - Tema: 'sakura' | 'sunset' | 'zen' | 'student' | 'teacher' | 'admin'
 * @param {string} props.userLevel - Nível do usuário: 'student' | 'teacher' | 'admin'
 * @param {boolean} props.withFloatingElements - Se deve mostrar elementos flutuantes
 * @param {string} props.className - Classes CSS adicionais
 */
const OrientalContainer = ({
  children,
  theme = 'sakura',
  userLevel = 'student',
  withFloatingElements = true,
  className = '',
  ...props
}) => {
  // Temas de background baseados nos design tokens
  const themeClasses = {
    sakura: 'bg-gradient-to-br from-orange-50 via-red-50 to-pink-50',
    sunset: 'bg-gradient-to-br from-orange-500 via-red-500 to-pink-500',
    zen: 'bg-gradient-to-br from-gray-50 to-gray-100',
    student: 'bg-gradient-to-br from-orange-100 to-red-100',
    teacher: 'bg-gradient-to-br from-orange-200 to-red-200',
    admin: 'bg-gradient-to-br from-red-300 to-pink-300'
  };

  const containerClasses = `
    min-h-screen relative overflow-hidden
    ${themeClasses[theme] || themeClasses.sakura}
    ${className}
  `.replace(/\s+/g, ' ').trim();

  return (
    <div className={containerClasses} {...props}>
      {children}
      
      {/* Elementos flutuantes orientais */}
      {withFloatingElements && (
        <OrientalFloatingElements userLevel={userLevel} />
      )}
    </div>
  );
};

/**
 * 🌸 Elementos flutuantes orientais por nível de usuário
 */
const OrientalFloatingElements = ({ userLevel = 'student' }) => {
  const elementsByLevel = {
    student: [
      { icon: '🌸', position: 'top-1/4 left-4', delay: '0s', size: 'text-xl' },
      { icon: '⭐', position: 'top-1/3 right-8', delay: '1s', size: 'text-lg' },
      { icon: '🎓', position: 'bottom-1/3 left-8', delay: '2s', size: 'text-xl' },
      { icon: '🎵', position: 'bottom-1/4 right-4', delay: '3s', size: 'text-lg' },
      { icon: '📚', position: 'top-2/3 left-1/4', delay: '4s', size: 'text-base' }
    ],
    teacher: [
      { icon: '🌸', position: 'top-1/4 left-4', delay: '0s', size: 'text-xl' },
      { icon: '先', position: 'top-1/3 right-8', delay: '1s', size: 'text-lg' },
      { icon: '🎓', position: 'bottom-1/3 left-8', delay: '2s', size: 'text-xl' },
      { icon: '📊', position: 'bottom-1/4 right-4', delay: '3s', size: 'text-lg' },
      { icon: '⚡', position: 'top-2/3 left-1/4', delay: '4s', size: 'text-base' }
    ],
    admin: [
      { icon: '🌸', position: 'top-1/4 left-4', delay: '0s', size: 'text-xl' },
      { icon: '師', position: 'top-1/3 right-8', delay: '1s', size: 'text-lg' },
      { icon: '⚡', position: 'bottom-1/3 left-8', delay: '2s', size: 'text-xl' },
      { icon: '👑', position: 'bottom-1/4 right-4', delay: '3s', size: 'text-lg' },
      { icon: '📈', position: 'top-2/3 left-1/4', delay: '4s', size: 'text-base' }
    ]
  };

  const elements = elementsByLevel[userLevel] || elementsByLevel.student;

  return (
    <>
      {elements.map((element, index) => (
        <div
          key={index}
          className={`
            fixed ${element.position} ${element.size}
            text-orange-200 animate-bounce opacity-30 
            pointer-events-none z-0
          `}
          style={{ 
            animationDelay: element.delay,
            animationDuration: '3s'
          }}
        >
          {element.icon}
        </div>
      ))}
    </>
  );
};

/**
 * 🎨 OrientalSection - Seção com espaçamento oriental
 */
export const OrientalSection = ({
  children,
  spacing = 'normal',
  className = '',
  ...props
}) => {
  const spacingClasses = {
    tight: 'py-4 px-4',
    normal: 'py-6 px-6',
    loose: 'py-8 px-8',
    comfortable: 'py-12 px-6'
  };

  return (
    <section 
      className={`
        ${spacingClasses[spacing] || spacingClasses.normal}
        ${className}
      `}
      {...props}
    >
      {children}
    </section>
  );
};

/**
 * 🏮 OrientalWrapper - Wrapper com backdrop blur
 */
export const OrientalWrapper = ({
  children,
  blur = true,
  className = '',
  ...props
}) => {
  const blurClasses = blur ? 'backdrop-blur-sm bg-white/90' : 'bg-white';
  
  return (
    <div 
      className={`
        ${blurClasses} rounded-2xl shadow-lg border border-red-100
        ${className}
      `}
      {...props}
    >
      {children}
    </div>
  );
};

export default OrientalContainer;