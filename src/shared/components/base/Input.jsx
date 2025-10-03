import React from 'react';

/**
 * Componente Input reutilizável - Base para todos os campos de entrada
 * @param {Object} props
 * @param {string} props.label - Label do campo
 * @param {string} props.type - Tipo do input: 'text' | 'email' | 'password' | 'number' | 'tel' | 'url'
 * @param {string} props.placeholder - Texto de placeholder
 * @param {string} props.value - Valor do input
 * @param {Function} props.onChange - Função de mudança de valor
 * @param {string} props.error - Mensagem de erro
 * @param {string} props.hint - Texto de ajuda
 * @param {boolean} props.required - Campo obrigatório
 * @param {boolean} props.disabled - Campo desabilitado
 * @param {string} props.size - Tamanho: 'sm' | 'md' | 'lg'
 * @param {string} props.icon - Ícone do campo
 * @param {string} props.iconPosition - Posição do ícone: 'left' | 'right'
 * @param {string} props.className - Classes CSS adicionais
 */
const Input = ({
  label,
  type = 'text',
  placeholder,
  value,
  onChange,
  error,
  hint,
  required = false,
  disabled = false,
  size = 'md',
  icon,
  iconPosition = 'left',
  className = '',
  id,
  name,
  ...props
}) => {
  const inputId = id || name || `input-${Math.random().toString(36).substr(2, 9)}`;
  
  const baseClasses = 'block w-full rounded-lg border transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-offset-1';
  
  const sizeClasses = {
    sm: 'px-3 py-1.5 text-sm',
    md: 'px-4 py-2 text-sm',
    lg: 'px-4 py-3 text-base'
  };

  const stateClasses = error 
    ? 'border-red-300 focus:border-red-500 focus:ring-red-500' 
    : 'border-gray-300 focus:border-primary-500 focus:ring-primary-500';
    
  const disabledClasses = disabled ? 'bg-gray-50 text-gray-500 cursor-not-allowed' : 'bg-white';
  
  const iconClasses = icon ? (iconPosition === 'left' ? 'pl-10' : 'pr-10') : '';
  
  const inputClasses = `
    ${baseClasses}
    ${sizeClasses[size]}
    ${stateClasses}
    ${disabledClasses}
    ${iconClasses}
    ${className}
  `.trim();

  return (
    <div className="space-y-1">
      {label && (
        <label 
          htmlFor={inputId}
          className="block text-sm font-medium text-gray-700"
        >
          {label}
          {required && <span className="text-red-500 ml-1">*</span>}
        </label>
      )}
      
      <div className="relative">
        {icon && iconPosition === 'left' && (
          <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <span className="text-gray-400 text-sm">
              {icon}
            </span>
          </div>
        )}
        
        <input
          id={inputId}
          name={name}
          type={type}
          className={inputClasses}
          placeholder={placeholder}
          value={value}
          onChange={onChange}
          disabled={disabled}
          required={required}
          {...props}
        />
        
        {icon && iconPosition === 'right' && (
          <div className="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
            <span className="text-gray-400 text-sm">
              {icon}
            </span>
          </div>
        )}
      </div>
      
      {error && (
        <p className="text-sm text-red-600 flex items-center">
          <span className="mr-1">⚠️</span>
          {error}
        </p>
      )}
      
      {hint && !error && (
        <p className="text-sm text-gray-500">
          {hint}
        </p>
      )}
    </div>
  );
};

export default Input;