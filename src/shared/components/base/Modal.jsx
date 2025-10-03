import React, { useEffect } from 'react';
import Button from './Button';

/**
 * Componente Modal reutilizável - Base para todos os modais do sistema
 * @param {Object} props
 * @param {boolean} props.isOpen - Controla se o modal está aberto
 * @param {Function} props.onClose - Função para fechar o modal
 * @param {React.ReactNode} props.children - Conteúdo do modal
 * @param {string} props.title - Título do modal
 * @param {string} props.size - Tamanho: 'sm' | 'md' | 'lg' | 'xl' | 'full'
 * @param {boolean} props.closeOnOverlayClick - Fecha ao clicar no overlay (padrão: true)
 * @param {boolean} props.showCloseButton - Mostra botão X (padrão: true)
 * @param {Object} props.footer - Configuração do footer: { cancelText, confirmText, onCancel, onConfirm }
 * @param {string} props.className - Classes CSS adicionais para o conteúdo
 */
const Modal = ({
  isOpen,
  onClose,
  children,
  title,
  size = 'md',
  closeOnOverlayClick = true,
  showCloseButton = true,
  footer,
  className = '',
  ...props
}) => {
  // Fecha modal com ESC
  useEffect(() => {
    const handleEsc = (e) => {
      if (e.key === 'Escape') {
        onClose?.();
      }
    };

    if (isOpen) {
      document.addEventListener('keydown', handleEsc);
      document.body.style.overflow = 'hidden';
    }

    return () => {
      document.removeEventListener('keydown', handleEsc);
      document.body.style.overflow = 'unset';
    };
  }, [isOpen, onClose]);

  if (!isOpen) return null;

  const sizeClasses = {
    sm: 'max-w-md',
    md: 'max-w-lg',
    lg: 'max-w-2xl',
    xl: 'max-w-4xl',
    full: 'max-w-7xl'
  };

  const handleOverlayClick = (e) => {
    if (e.target === e.currentTarget && closeOnOverlayClick) {
      onClose?.();
    }
  };

  return (
    <div className="fixed inset-0 z-50 overflow-y-auto">
      {/* Overlay */}
      <div 
        className="fixed inset-0 bg-black bg-opacity-50 transition-opacity"
        onClick={handleOverlayClick}
      />
      
      {/* Modal Container */}
      <div className="flex min-h-full items-center justify-center p-4">
        <div 
          className={`
            relative w-full ${sizeClasses[size]} 
            bg-white rounded-lg shadow-xl transform transition-all
            ${className}
          `}
          {...props}
        >
          {/* Header */}
          {(title || showCloseButton) && (
            <div className="flex items-center justify-between p-6 pb-4 border-b border-gray-200">
              {title && (
                <h3 className="text-lg font-semibold text-gray-900">
                  {title}
                </h3>
              )}
              
              {showCloseButton && (
                <button
                  onClick={onClose}
                  className="text-gray-400 hover:text-gray-600 transition-colors p-1 rounded-full hover:bg-gray-100"
                  aria-label="Fechar modal"
                >
                  <svg className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              )}
            </div>
          )}
          
          {/* Content */}
          <div className="p-6">
            {children}
          </div>
          
          {/* Footer */}
          {footer && (
            <div className="flex items-center justify-end gap-3 p-6 pt-4 border-t border-gray-200">
              {footer.cancelText && (
                <Button
                  variant="outline"
                  onClick={footer.onCancel || onClose}
                >
                  {footer.cancelText}
                </Button>
              )}
              
              {footer.confirmText && (
                <Button
                  variant="primary"
                  onClick={footer.onConfirm}
                >
                  {footer.confirmText}
                </Button>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default Modal;