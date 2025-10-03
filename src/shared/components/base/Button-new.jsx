import React from 'react';
import { DesignTokens } from '../../styles/design-tokens';

/**
 * 🎌 Componente Button Padronizado - Sistema Oriental Nipo School
 * 
 * @param {Object} props
 * @param {React.ReactNode} props.children - Conteúdo do botão
 * @param {string} props.variant - Variante: 'primary' | 'secondary' | 'outline' | 'ghost' | 'oriental' | 'danger'
 * @param {string} props.size - Tamanho: 'xs' | 'sm' | 'md' | 'lg' | 'xl'
 * @param {boolean} props.loading - Estado de carregamento
 * @param {boolean} props.disabled - Estado desabilitado
 * @param {React.ReactNode} props.icon - Ícone (componente React)
 * @param {string} props.iconPosition - Posição do ícone: 'left' | 'right'
 * @param {boolean} props.fullWidth - Botão ocupar toda largura
 * @param {string} props.className - Classes CSS adicionais
 */
const Button = ({
  children,
  variant = 'primary',
  size = 'md',
  loading = false,
  disabled = false,
  icon,
  iconPosition = 'left',
  fullWidth = false,
  className = '',
  onClick,
  type = 'button',
  ...props
}) => {
  // Classes base usando design tokens
  const baseClasses = 'inline-flex items-center justify-center font-medium transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed';
  
  // Variantes usando design tokens
  const variantClasses = {
    primary: 'bg-red-500 text-white hover:bg-red-600 hover:scale-105 focus:ring-red-300 shadow-md hover:shadow-lg',
    secondary: 'bg-orange-500 text-white hover:bg-orange-600 hover:scale-105 focus:ring-orange-300 shadow-md hover:shadow-lg',
    outline: 'border-2 border-red-500 text-red-500 bg-transparent hover:bg-red-50 hover:border-red-600 hover:text-red-600 focus:ring-red-300',
    ghost: 'text-red-500 bg-transparent hover:bg-red-50 hover:text-red-600 focus:ring-red-300',
    oriental: 'bg-gradient-to-r from-red-500 to-red-600 text-white hover:from-red-600 hover:to-red-700 hover:scale-105 focus:ring-red-300 shadow-lg hover:shadow-xl font-medium',
    danger: 'bg-red-600 text-white hover:bg-red-700 hover:scale-105 focus:ring-red-300 shadow-md hover:shadow-lg'
  };

  // Tamanhos usando design tokens
  const sizeClasses = {
    xs: 'px-2 py-1 text-xs rounded-md',
    sm: 'px-3 py-1.5 text-sm rounded-lg',
    md: 'px-4 py-2 text-sm rounded-lg',
    lg: 'px-6 py-3 text-base rounded-xl',
    xl: 'px-8 py-4 text-lg rounded-xl'
  };

  const fullWidthClasses = fullWidth ? 'w-full' : '';
  
  // Classes compiladas finais
  const buttonClasses = `
    ${baseClasses}
    ${variantClasses[variant] || variantClasses.primary}
    ${sizeClasses[size] || sizeClasses.md}
    ${fullWidthClasses}
    ${className}
  `.replace(/\s+/g, ' ').trim();

  const handleClick = (e) => {
    if (disabled || loading) return;
    onClick?.(e);
  };

  const renderIcon = () => {
    if (!icon && !loading) return null;
    
    const iconClasses = `
      ${children && iconPosition === 'left' ? 'mr-2' : ''}
      ${children && iconPosition === 'right' ? 'ml-2' : ''}
      ${loading ? 'animate-spin' : ''}
    `.trim();

    if (loading) {
      return (
        <svg
          className={`w-4 h-4 ${iconClasses}`}
          fill="none"
          viewBox="0 0 24 24"
        >
          <circle
            className="opacity-25"
            cx="12"
            cy="12"
            r="10"
            stroke="currentColor"
            strokeWidth="4"
          />
          <path
            className="opacity-75"
            fill="currentColor"
            d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
          />
        </svg>
      );
    }

    if (icon) {
      return React.cloneElement(icon, {
        className: `w-4 h-4 ${iconClasses}`
      });
    }

    return null;
  };

  const renderContent = () => {
    if (loading && !children) {
      return <span>Carregando...</span>;
    }

    return (
      <>
        {iconPosition === 'left' && renderIcon()}
        {children && <span>{children}</span>}
        {iconPosition === 'right' && renderIcon()}
      </>
    );
  };

  return (
    <button
      type={type}
      className={buttonClasses}
      onClick={handleClick}
      disabled={disabled || loading}
      {...props}
    >
      {renderContent()}
    </button>
  );
};

export default Button;