import React from 'react';
import { DesignTokens } from '../../styles/design-tokens';

/**
 * 🎌 Componente Card Padronizado - Sistema Oriental Nipo School
 * 
 * @param {Object} props
 * @param {React.ReactNode} props.children - Conteúdo do card
 * @param {string} props.variant - Variante: 'default' | 'elevated' | 'outlined' | 'oriental' | 'glassmorphism'
 * @param {string} props.size - Tamanho: 'sm' | 'md' | 'lg' | 'xl'
 * @param {string} props.className - Classes CSS adicionais
 * @param {Function} props.onClick - Função de clique (torna o card clicável)
 * @param {boolean} props.loading - Estado de carregamento
 * @param {Object} props.header - Configuração do header: { title, subtitle, actions }
 * @param {boolean} props.hoverable - Se deve ter efeito hover
 */
const Card = ({
  children,
  variant = 'default',
  size = 'md',
  className = '',
  onClick,
  loading = false,
  header,
  hoverable = false,
  ...props
}) => {
  // Classes base usando design tokens
  const baseClasses = 'transition-all duration-300';
  
  // Variantes usando design tokens orientais
  const variantClasses = {
    default: 'bg-white border border-gray-200 shadow-sm',
    elevated: 'bg-white shadow-lg border-0',
    outlined: 'bg-transparent border-2 border-red-200',
    filled: 'bg-red-50 border border-red-100',
    
    // Variantes orientais especiais
    oriental: 'bg-white/90 backdrop-blur-sm border border-red-100 shadow-lg hover:shadow-xl',
    glassmorphism: 'bg-white/80 backdrop-blur-md border border-white/20 shadow-xl',
    
    // Variantes por tipo de usuário
    student: 'bg-gradient-to-br from-orange-50 to-red-50 border border-orange-100 shadow-md',
    teacher: 'bg-gradient-to-br from-red-50 to-pink-50 border border-red-100 shadow-md',
    admin: 'bg-gradient-to-br from-red-100 to-pink-100 border border-red-200 shadow-lg'
  };

  // Tamanhos usando design tokens
  const sizeClasses = {
    sm: 'p-3 rounded-lg',
    md: 'p-4 rounded-xl',
    lg: 'p-6 rounded-2xl',
    xl: 'p-8 rounded-2xl'
  };

  // Classes de hover e interação
  const interactionClasses = onClick || hoverable ? 
    'cursor-pointer hover:scale-[1.02] hover:shadow-lg active:scale-[0.98]' : '';
  
  const loadingClasses = loading ? 'animate-pulse pointer-events-none' : '';
  
  // Classes compiladas finais
  const cardClasses = `
    ${baseClasses}
    ${variantClasses[variant] || variantClasses.default}
    ${sizeClasses[size] || sizeClasses.md}
    ${interactionClasses}
    ${loadingClasses}
    ${className}
  `.replace(/\s+/g, ' ').trim();

  const handleClick = (e) => {
    if (loading) return;
    onClick?.(e);
  };

  const renderHeader = () => {
    if (!header) return null;

    const { title, subtitle, actions } = header;

    return (
      <div className="flex items-start justify-between mb-4 pb-3 border-b border-gray-100">
        <div className="flex-1">
          {title && (
            <h3 className="text-lg font-semibold text-gray-900 mb-1">
              {title}
            </h3>
          )}
          {subtitle && (
            <p className="text-sm text-gray-600">
              {subtitle}
            </p>
          )}
        </div>
        {actions && (
          <div className="flex items-center space-x-2 ml-4">
            {actions}
          </div>
        )}
      </div>
    );
  };

  const renderLoadingState = () => {
    if (!loading) return children;

    return (
      <div className="space-y-3">
        <div className="h-4 bg-gray-200 rounded w-3/4 animate-pulse"></div>
        <div className="h-4 bg-gray-200 rounded w-1/2 animate-pulse"></div>
        <div className="h-4 bg-gray-200 rounded w-2/3 animate-pulse"></div>
      </div>
    );
  };

  return (
    <div
      className={cardClasses}
      onClick={handleClick}
      {...props}
    >
      {renderHeader()}
      {renderLoadingState()}
    </div>
  );
};

// Componente StatCard específico para estatísticas orientais
export const StatCard = ({
  icon,
  value,
  label,
  trend,
  trendValue,
  color = 'red',
  size = 'md',
  className = '',
  ...props
}) => {
  const iconColorClasses = {
    red: 'text-red-500',
    orange: 'text-orange-500',
    amber: 'text-amber-500',
    emerald: 'text-emerald-500',
    blue: 'text-blue-500',
    purple: 'text-purple-500'
  };

  return (
    <Card
      variant="oriental"
      size={size}
      className={`text-center ${className}`}
      hoverable
      {...props}
    >
      {/* Ícone */}
      {icon && (
        <div className={`w-8 h-8 mx-auto mb-3 ${iconColorClasses[color]}`}>
          {React.cloneElement(icon, { className: 'w-8 h-8' })}
        </div>
      )}
      
      {/* Valor principal */}
      <p className="text-2xl font-bold text-gray-900 mb-1">
        {value}
      </p>
      
      {/* Label */}
      <p className="text-xs text-gray-600 mb-2">
        {label}
      </p>
      
      {/* Trend (se existir) */}
      {trend && trendValue && (
        <div className={`
          flex items-center justify-center text-xs
          ${trend === 'up' ? 'text-emerald-600' : 'text-red-600'}
        `}>
          <span className="mr-1">
            {trend === 'up' ? '↗' : '↘'}
          </span>
          {trendValue}
        </div>
      )}
    </Card>
  );
};

// Componente ActionCard para ações rápidas
export const ActionCard = ({
  icon,
  title,
  description,
  onClick,
  color = 'red',
  className = '',
  ...props
}) => {
  const colorClasses = {
    red: 'from-red-500 to-red-600',
    orange: 'from-orange-500 to-orange-600',
    blue: 'from-blue-500 to-blue-600',
    emerald: 'from-emerald-500 to-emerald-600'
  };

  return (
    <Card
      variant="oriental"
      onClick={onClick}
      className={`cursor-pointer group ${className}`}
      hoverable
      {...props}
    >
      <div className="text-center">
        {/* Ícone com gradiente */}
        {icon && (
          <div className={`
            w-12 h-12 mx-auto mb-4
            bg-gradient-to-r ${colorClasses[color]}
            rounded-xl flex items-center justify-center
            group-hover:scale-110 transition-transform
          `}>
            {React.cloneElement(icon, { 
              className: 'w-6 h-6 text-white' 
            })}
          </div>
        )}
        
        {/* Título */}
        <h3 className="text-sm font-semibold text-gray-900 mb-2">
          {title}
        </h3>
        
        {/* Descrição */}
        {description && (
          <p className="text-xs text-gray-600">
            {description}
          </p>
        )}
      </div>
    </Card>
  );
};

export default Card;