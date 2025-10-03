import React from 'react';
import { DesignTokens } from '../../styles/design-tokens';

/**
 * 🎌 OrientalGrid - Sistema de grid responsivo oriental
 * 
 * @param {Object} props
 * @param {React.ReactNode} props.children - Componentes filhos
 * @param {string|number} props.columns - Número de colunas: 'auto-fit' | 1 | 2 | 3 | 4 | 6
 * @param {string} props.gap - Espaçamento: 'sm' | 'md' | 'lg' | 'xl'
 * @param {string} props.className - Classes CSS adicionais
 */
const OrientalGrid = ({
  children,
  columns = 'auto-fit',
  gap = 'md',
  className = '',
  ...props
}) => {
  // Classes de gap baseadas nos design tokens
  const gapClasses = {
    sm: 'gap-3',   // 12px
    md: 'gap-4',   // 16px
    lg: 'gap-6',   // 24px
    xl: 'gap-8'    // 32px
  };

  // Classes de colunas responsivas
  const getColumnClasses = (cols) => {
    if (cols === 'auto-fit') {
      return 'grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4';
    }
    
    const responsiveColumns = {
      1: 'grid-cols-1',
      2: 'grid-cols-1 sm:grid-cols-2',
      3: 'grid-cols-1 sm:grid-cols-2 lg:grid-cols-3',
      4: 'grid-cols-1 sm:grid-cols-2 lg:grid-cols-4',
      6: 'grid-cols-2 sm:grid-cols-3 lg:grid-cols-6'
    };
    
    return responsiveColumns[cols] || responsiveColumns[4];
  };

  const gridClasses = `
    grid ${getColumnClasses(columns)} ${gapClasses[gap] || gapClasses.md}
    ${className}
  `.replace(/\s+/g, ' ').trim();

  return (
    <div className={gridClasses} {...props}>
      {children}
    </div>
  );
};

/**
 * 🎯 OrientalStatsGrid - Grid específico para estatísticas
 */
export const OrientalStatsGrid = ({
  children,
  layout = 'dashboard',
  className = '',
  ...props
}) => {
  const layoutClasses = {
    dashboard: 'grid-cols-2 lg:grid-cols-4', // 2x2 mobile, 4x1 desktop
    profile: 'grid-cols-1 sm:grid-cols-3',   // 1x3 mobile, 3x1 desktop
    compact: 'grid-cols-2 sm:grid-cols-4'    // 2x2 mobile, 4x1 tablet
  };

  return (
    <div 
      className={`
        grid gap-4 lg:gap-6
        ${layoutClasses[layout] || layoutClasses.dashboard}
        ${className}
      `}
      {...props}
    >
      {children}
    </div>
  );
};

/**
 * 📐 OrientalFlex - Container flex oriental
 */
export const OrientalFlex = ({
  children,
  direction = 'row',
  align = 'center',
  justify = 'start',
  wrap = false,
  gap = 'md',
  className = '',
  ...props
}) => {
  const directionClasses = {
    row: 'flex-row',
    'row-reverse': 'flex-row-reverse',
    col: 'flex-col',
    'col-reverse': 'flex-col-reverse'
  };

  const alignClasses = {
    start: 'items-start',
    center: 'items-center',
    end: 'items-end',
    stretch: 'items-stretch'
  };

  const justifyClasses = {
    start: 'justify-start',
    center: 'justify-center',
    end: 'justify-end',
    between: 'justify-between',
    around: 'justify-around',
    evenly: 'justify-evenly'
  };

  const gapClasses = {
    sm: 'gap-2',
    md: 'gap-4',
    lg: 'gap-6',
    xl: 'gap-8'
  };

  const flexClasses = `
    flex
    ${directionClasses[direction] || directionClasses.row}
    ${alignClasses[align] || alignClasses.center}
    ${justifyClasses[justify] || justifyClasses.start}
    ${wrap ? 'flex-wrap' : ''}
    ${gapClasses[gap] || gapClasses.md}
    ${className}
  `.replace(/\s+/g, ' ').trim();

  return (
    <div className={flexClasses} {...props}>
      {children}
    </div>
  );
};

/**
 * 📱 OrientalStack - Stack vertical com espaçamento oriental
 */
export const OrientalStack = ({
  children,
  spacing = 'md',
  className = '',
  ...props
}) => {
  const spacingClasses = {
    xs: 'space-y-2',  // 8px
    sm: 'space-y-3',  // 12px
    md: 'space-y-4',  // 16px
    lg: 'space-y-6',  // 24px
    xl: 'space-y-8'   // 32px
  };

  return (
    <div 
      className={`
        ${spacingClasses[spacing] || spacingClasses.md}
        ${className}
      `}
      {...props}
    >
      {children}
    </div>
  );
};

/**
 * 🎪 OrientalCenter - Centralizador universal
 */
export const OrientalCenter = ({
  children,
  minHeight = 'screen',
  className = '',
  ...props
}) => {
  const heightClasses = {
    screen: 'min-h-screen',
    full: 'h-full',
    auto: 'h-auto'
  };

  return (
    <div 
      className={`
        flex items-center justify-center
        ${heightClasses[minHeight] || heightClasses.screen}
        ${className}
      `}
      {...props}
    >
      {children}
    </div>
  );
};

/**
 * 📦 OrientalContainer responsivo - Layout principal
 */
export const OrientalMainLayout = ({
  children,
  maxWidth = '7xl',
  padding = 'responsive',
  className = '',
  ...props
}) => {
  const maxWidthClasses = {
    sm: 'max-w-sm',
    md: 'max-w-md',
    lg: 'max-w-lg',
    xl: 'max-w-xl',
    '2xl': 'max-w-2xl',
    '4xl': 'max-w-4xl',
    '6xl': 'max-w-6xl',
    '7xl': 'max-w-7xl',
    full: 'max-w-full'
  };

  const paddingClasses = {
    none: '',
    sm: 'px-4 py-4',
    md: 'px-6 py-6',
    lg: 'px-8 py-8',
    responsive: 'px-4 sm:px-6 lg:px-8 py-6 lg:py-8'
  };

  return (
    <div 
      className={`
        w-full mx-auto
        ${maxWidthClasses[maxWidth] || maxWidthClasses['7xl']}
        ${paddingClasses[padding] || paddingClasses.responsive}
        ${className}
      `}
      {...props}
    >
      {children}
    </div>
  );
};

export default OrientalGrid;