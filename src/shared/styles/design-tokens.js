// 🎨 DESIGN TOKENS CENTRALIZADOS - NIPO SCHOOL
// Sistema unificado de cores, espacamentos, tipografia e componentes
// Base para todos os componentes reutilizáveis

export const DesignTokens = {
  // ═══════════════════════════════════════════════════════════════
  // 🎨 SISTEMA DE CORES
  // ═══════════════════════════════════════════════════════════════
  colors: {
    // Cores primárias Nipo School
    primary: {
      50: '#fef2f2',
      100: '#fee2e2',
      200: '#fecaca',
      300: '#fca5a5',
      400: '#f87171',
      500: '#ef4444',  // Cor principal
      600: '#dc2626',
      700: '#b91c1c',
      800: '#991b1b',
      900: '#7f1d1d'
    },
    
    // Cores secundárias (laranja oriental)
    secondary: {
      50: '#fff7ed',
      100: '#ffedd5',
      200: '#fed7aa',
      300: '#fdba74',
      400: '#fb923c',
      500: '#f97316',
      600: '#ea580c',
      700: '#c2410c',
      800: '#9a3412',
      900: '#7c2d12'
    },
    
    // Cores neutras (zen)
    neutral: {
      50: '#f8fafc',
      100: '#f1f5f9',
      200: '#e2e8f0',
      300: '#cbd5e1',
      400: '#94a3b8',
      500: '#64748b',
      600: '#475569',
      700: '#334155',
      800: '#1e293b',
      900: '#0f172a'
    },
    
    // Cores semânticas
    semantic: {
      success: '#10b981',
      warning: '#f59e0b',
      error: '#ef4444',
      info: '#3b82f6'
    },
    
    // Gradientes orientais
    gradients: {
      // Gradiente principal (sakura)
      sakura: 'from-orange-50 via-red-50 to-pink-50',
      
      // Gradientes de ação
      sunset: 'from-orange-500 to-red-500',
      sunrise: 'from-red-500 to-pink-500',
      zen: 'from-gray-50 to-gray-100',
      
      // Gradientes por tipo de usuário
      student: 'from-orange-100 to-red-100',
      teacher: 'from-orange-200 to-red-200', 
      admin: 'from-red-300 to-pink-300',
      
      // Gradientes especiais
      glass: 'from-white/80 to-white/40',
      backdrop: 'from-black/10 to-black/5'
    }
  },

  // ═══════════════════════════════════════════════════════════════
  // 📏 SISTEMA DE ESPAÇAMENTOS
  // ═══════════════════════════════════════════════════════════════
  spacing: {
    // Espaçamentos base (seguindo Tailwind)
    xs: '0.5rem',    // 8px
    sm: '0.75rem',   // 12px
    md: '1rem',      // 16px
    lg: '1.5rem',    // 24px
    xl: '2rem',      // 32px
    '2xl': '3rem',   // 48px
    '3xl': '4rem',   // 64px
    '4xl': '5rem',   // 80px
    
    // Espaçamentos semânticos
    component: '1rem',     // Espaçamento interno de componentes
    section: '2rem',       // Entre seções
    page: '3rem',          // Margens de página
    
    // Grid gaps
    grid: {
      tight: '0.5rem',
      normal: '1rem',
      loose: '1.5rem',
      comfortable: '2rem'
    }
  },

  // ═══════════════════════════════════════════════════════════════
  // 🔄 SISTEMA DE BORDAS E RAIOS
  // ═══════════════════════════════════════════════════════════════
  radius: {
    none: '0',
    sm: '0.25rem',    // 4px
    md: '0.5rem',     // 8px
    lg: '0.75rem',    // 12px
    xl: '1rem',       // 16px
    '2xl': '1.5rem',  // 24px - Estilo oriental
    '3xl': '2rem',    // 32px - Extra oriental
    full: '9999px',   // Circular
    
    // Raios semânticos
    button: '0.75rem',      // Botões
    card: '1.5rem',         // Cards orientais
    modal: '1rem',          // Modais
    input: '0.5rem'         // Inputs
  },

  // ═══════════════════════════════════════════════════════════════
  // 🌫️ SISTEMA DE SOMBRAS
  // ═══════════════════════════════════════════════════════════════
  shadows: {
    // Sombras base
    none: 'none',
    sm: '0 1px 2px 0 rgb(0 0 0 / 0.05)',
    md: '0 4px 6px -1px rgb(0 0 0 / 0.1)',
    lg: '0 10px 15px -3px rgb(0 0 0 / 0.1)',
    xl: '0 20px 25px -5px rgb(0 0 0 / 0.1)',
    '2xl': '0 25px 50px -12px rgb(0 0 0 / 0.25)',
    
    // Sombras orientais (mais suaves)
    oriental: {
      soft: '0 2px 8px rgb(239 68 68 / 0.08)',
      medium: '0 4px 12px rgb(239 68 68 / 0.12)',
      strong: '0 8px 24px rgb(239 68 68 / 0.16)'
    },
    
    // Sombras especiais
    glow: '0 0 20px rgb(239 68 68 / 0.3)',
    inset: 'inset 0 2px 4px 0 rgb(0 0 0 / 0.05)'
  },

  // ═══════════════════════════════════════════════════════════════
  // ✍️ SISTEMA DE TIPOGRAFIA
  // ═══════════════════════════════════════════════════════════════
  typography: {
    // Famílias de fonte
    fonts: {
      primary: "'Inter', system-ui, sans-serif",
      japanese: "'Noto Sans JP', sans-serif",
      display: "'Fredoka One', cursive"
    },
    
    // Tamanhos de texto
    sizes: {
      xs: ['0.75rem', { lineHeight: '1rem' }],      // 12px
      sm: ['0.875rem', { lineHeight: '1.25rem' }],  // 14px
      base: ['1rem', { lineHeight: '1.5rem' }],     // 16px
      lg: ['1.125rem', { lineHeight: '1.75rem' }],  // 18px
      xl: ['1.25rem', { lineHeight: '1.75rem' }],   // 20px
      '2xl': ['1.5rem', { lineHeight: '2rem' }],    // 24px
      '3xl': ['1.875rem', { lineHeight: '2.25rem' }], // 30px
      '4xl': ['2.25rem', { lineHeight: '2.5rem' }]  // 36px
    },
    
    // Pesos de fonte
    weights: {
      light: '300',
      normal: '400',
      medium: '500',
      semibold: '600',
      bold: '700',
      extrabold: '800'
    },
    
    // Hierarquia semântica
    hierarchy: {
      h1: ['2.25rem', { lineHeight: '2.5rem', fontWeight: '300' }],  // Light
      h2: ['1.875rem', { lineHeight: '2.25rem', fontWeight: '600' }], // Semibold
      h3: ['1.5rem', { lineHeight: '2rem', fontWeight: '600' }],
      h4: ['1.25rem', { lineHeight: '1.75rem', fontWeight: '600' }],
      body: ['1rem', { lineHeight: '1.5rem', fontWeight: '400' }],
      caption: ['0.875rem', { lineHeight: '1.25rem', fontWeight: '400' }],
      small: ['0.75rem', { lineHeight: '1rem', fontWeight: '400' }]
    }
  },

  // ═══════════════════════════════════════════════════════════════
  // ⚡ SISTEMA DE ANIMAÇÕES
  // ═══════════════════════════════════════════════════════════════
  animations: {
    // Durações
    durations: {
      fast: '150ms',
      normal: '200ms',
      slow: '300ms',
      slower: '500ms'
    },
    
    // Easing functions
    easing: {
      linear: 'linear',
      ease: 'ease',
      'ease-in': 'ease-in',
      'ease-out': 'ease-out',
      'ease-in-out': 'ease-in-out',
      // Easing oriental (mais suave)
      zen: 'cubic-bezier(0.25, 0.46, 0.45, 0.94)'
    },
    
    // Transformações comuns
    transforms: {
      'scale-up': 'scale(1.05)',
      'scale-down': 'scale(0.95)',
      'translate-up': 'translateY(-4px)',
      'translate-down': 'translateY(4px)'
    }
  },

  // ═══════════════════════════════════════════════════════════════
  // 📱 SISTEMA DE BREAKPOINTS
  // ═══════════════════════════════════════════════════════════════
  breakpoints: {
    sm: '640px',   // Mobile
    md: '768px',   // Tablet
    lg: '1024px',  // Desktop
    xl: '1280px',  // Large desktop
    '2xl': '1536px' // Extra large
  },

  // ═══════════════════════════════════════════════════════════════
  // 🎌 ELEMENTOS ORIENTAIS ESPECÍFICOS
  // ═══════════════════════════════════════════════════════════════
  oriental: {
    // Caracteres japoneses por contexto
    characters: {
      logo: '鳥',      // Tori (pássaro) - Logo principal
      student: '学',   // Gaku (aprender)
      teacher: '先',   // Sen (professor/mestre)
      admin: '師',     // Shi (mestre/especialista)
      improve: '改',   // Kai (melhoria/mudança)
      harmony: '和'    // Wa (harmonia)
    },
    
    // Saudações por período
    greetings: {
      morning: 'おはよう',     // Ohayou
      afternoon: 'こんにちは', // Konnichiwa
      evening: 'こんばんは',   // Konbanwa
      goodbye: 'またね'       // Mata ne
    },
    
    // Elementos flutuantes por tipo de usuário
    floatingElements: {
      student: ['🌸', '⭐', '🎓', '🎵', '📚'],
      teacher: ['🌸', '先', '🎓', '📊', '⚡'],
      admin: ['🌸', '師', '⚡', '👑', '📈']
    }
  }
};

// Helper functions para usar os tokens
export const getColor = (path) => {
  return path.split('.').reduce((obj, key) => obj?.[key], DesignTokens.colors);
};

export const getSpacing = (size) => {
  return DesignTokens.spacing[size] || size;
};

export const getRadius = (size) => {
  return DesignTokens.radius[size] || size;
};

export const getShadow = (type) => {
  return DesignTokens.shadows[type] || type;
};

// Classes CSS compiladas para usar diretamente
export const CompiledClasses = {
  // Containers orientais
  orientalContainer: `min-h-screen bg-gradient-to-br from-orange-50 via-red-50 to-pink-50`,
  
  // Cards orientais
  orientalCard: `bg-white/90 backdrop-blur-sm rounded-2xl shadow-lg border border-red-100 hover:shadow-xl transition-all duration-300`,
  
  // Botões orientais
  orientalButton: `bg-gradient-to-r from-red-500 to-red-600 text-white px-6 py-3 rounded-xl hover:from-red-600 hover:to-red-700 transition-all duration-200 font-medium shadow-lg hover:scale-105`,
  
  // Navegação oriental
  orientalNav: `bg-white/90 backdrop-blur-md shadow-sm border-b border-red-100 sticky top-0 z-50`,
  
  // Grid responsivo
  orientalGrid: `grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 lg:gap-6`
};

export default DesignTokens;