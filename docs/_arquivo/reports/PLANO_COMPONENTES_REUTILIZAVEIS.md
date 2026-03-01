# 🎯 PLANO ESTRUTURADO - SISTEMA DE COMPONENTES REUTILIZÁVEIS
*Reorganização e Padronização da Base de Componentes | 3 de Outubro de 2025*

---

## 📊 **ANÁLISE DA SITUAÇÃO ATUAL**

### ✅ **O QUE JÁ TEMOS (BOM)**
- Componentes base funcionais: `Button.jsx`, `Card.jsx`, `Input.jsx`, `Modal.jsx`
- Sistema oriental iniciado: `OrientalComponents.jsx`
- Tailwind configurado com cores Nipo School
- Estrutura de pastas organizada

### ❌ **PROBLEMAS IDENTIFICADOS**
- Componentes inconsistentes entre si
- CSS personalizado misturado com Tailwind
- Falta de design tokens centralizados
- Componentes orientais incompletos
- Sem documentação de uso

---

## 🏗️ **ESTRATÉGIA DE PADRONIZAÇÃO**

### **FASE 1: Design Tokens Centralizados** ⚡
Criar sistema unificado de cores, espacamentos, tipografia

### **FASE 2: Componentes Base Revisados** 🔧
Padronizar Button, Card, Input, Modal com design tokens

### **FASE 3: Sistema Oriental Completo** 🎌
Expandir componentes orientais seguindo documentação

### **FASE 4: Layout System** 📐
Grid responsivo e containers padronizados

---

## 🎨 **FASE 1: DESIGN TOKENS CENTRALIZADOS**

### **Arquivo: `src/shared/styles/design-tokens.js`**
```javascript
export const DesignTokens = {
  // Cores Nipo School (já definidas no Tailwind)
  colors: {
    primary: 'nipo-red-500',
    secondary: 'nipo-orange-500',
    neutral: 'nipo-zen-500',
    success: 'emerald-500',
    warning: 'amber-500',
    error: 'red-500',
    
    // Gradientes orientais
    gradients: {
      sakura: 'from-orange-50 via-red-50 to-pink-50',
      sunset: 'from-orange-500 to-red-500',
      zen: 'from-gray-50 to-gray-100'
    }
  },
  
  // Espaçamentos padronizados
  spacing: {
    xs: '0.5rem',   // 8px
    sm: '0.75rem',  // 12px  
    md: '1rem',     // 16px
    lg: '1.5rem',   // 24px
    xl: '2rem',     // 32px
    '2xl': '3rem',  // 48px
    '3xl': '4rem'   // 64px
  },
  
  // Bordas arredondadas
  radius: {
    sm: '0.25rem',    // 4px
    md: '0.5rem',     // 8px
    lg: '0.75rem',    // 12px
    xl: '1rem',       // 16px
    '2xl': '1.5rem'   // 24px - Oriental style
  },
  
  // Sombras
  shadows: {
    sm: '0 1px 2px 0 rgb(0 0 0 / 0.05)',
    md: '0 4px 6px -1px rgb(0 0 0 / 0.1)',
    lg: '0 10px 15px -3px rgb(0 0 0 / 0.1)',
    xl: '0 20px 25px -5px rgb(0 0 0 / 0.1)'
  },
  
  // Tipografia
  typography: {
    sizes: {
      xs: ['0.75rem', '1rem'],     // 12px
      sm: ['0.875rem', '1.25rem'], // 14px
      base: ['1rem', '1.5rem'],    // 16px
      lg: ['1.125rem', '1.75rem'], // 18px
      xl: ['1.25rem', '1.75rem']   // 20px
    },
    weights: {
      normal: '400',
      medium: '500',
      semibold: '600',
      bold: '700'
    }
  }
};
```

---

## 🔧 **FASE 2: COMPONENTES BASE PADRONIZADOS**

### **Componente Button Melhorado**
```jsx
// src/shared/components/base/Button.jsx
import { DesignTokens } from '../../styles/design-tokens';

const Button = ({ variant = 'primary', size = 'md', ...props }) => {
  const variants = {
    primary: `bg-${DesignTokens.colors.primary} hover:bg-nipo-red-600 text-white`,
    secondary: `bg-${DesignTokens.colors.secondary} hover:bg-nipo-orange-600 text-white`,
    outline: `border-2 border-${DesignTokens.colors.primary} text-${DesignTokens.colors.primary} hover:bg-nipo-red-50`,
    ghost: `text-${DesignTokens.colors.primary} hover:bg-nipo-red-50`,
    // Variante oriental especial
    oriental: `bg-gradient-to-r ${DesignTokens.colors.gradients.sunset} text-white hover:scale-105`
  };
  
  const sizes = {
    sm: `px-3 py-1.5 text-sm rounded-${DesignTokens.radius.md}`,
    md: `px-4 py-2 text-base rounded-${DesignTokens.radius.lg}`,
    lg: `px-6 py-3 text-lg rounded-${DesignTokens.radius.xl}`
  };
  
  return (
    <button 
      className={`
        ${variants[variant]} 
        ${sizes[size]} 
        font-medium transition-all duration-200 
        focus:outline-none focus:ring-2 focus:ring-nipo-red-300
        disabled:opacity-50 disabled:cursor-not-allowed
      `}
      {...props}
    />
  );
};
```

### **Componente Card Oriental**
```jsx
// src/shared/components/base/Card.jsx
const Card = ({ variant = 'default', children, ...props }) => {
  const variants = {
    default: 'bg-white border border-gray-200 shadow-sm',
    elevated: 'bg-white shadow-lg',
    oriental: `bg-white/90 backdrop-blur-sm border border-nipo-red-100 shadow-lg hover:shadow-xl`,
    glassmorphism: `bg-white/80 backdrop-blur-md border border-white/20 shadow-xl`
  };
  
  return (
    <div 
      className={`
        ${variants[variant]} 
        rounded-${DesignTokens.radius['2xl']} 
        p-${DesignTokens.spacing.lg} 
        transition-all duration-300
      `}
      {...props}
    >
      {children}
    </div>
  );
};
```

---

## 🎌 **FASE 3: SISTEMA ORIENTAL COMPLETO**

### **OrientalContainer (Container Principal)**
```jsx
// src/shared/components/oriental/OrientalContainer.jsx
const OrientalContainer = ({ children, theme = 'sakura', level = 'student' }) => {
  const themes = {
    sakura: `bg-gradient-to-br ${DesignTokens.colors.gradients.sakura}`,
    sunset: `bg-gradient-to-br ${DesignTokens.colors.gradients.sunset}`,
    zen: `bg-gradient-to-br ${DesignTokens.colors.gradients.zen}`
  };
  
  return (
    <div className={`min-h-screen ${themes[theme]} relative overflow-hidden`}>
      {children}
      <OrientalFloatingElements level={level} />
    </div>
  );
};
```

### **OrientalNavigation (Header Unificado)**
```jsx
// src/shared/components/oriental/OrientalNavigation.jsx
const OrientalNavigation = ({ 
  title, 
  logoChar = '鳥', 
  userType = 'student',
  onLogout 
}) => {
  return (
    <nav className="bg-white/90 backdrop-blur-md shadow-sm border-b border-nipo-red-100 sticky top-0 z-50">
      <div className="flex items-center justify-between px-6 py-4">
        {/* Logo Oriental */}
        <div className="flex items-center space-x-3">
          <div className={`
            w-12 h-12 bg-gradient-to-br ${DesignTokens.colors.gradients.sunset} 
            rounded-${DesignTokens.radius['2xl']} flex items-center justify-center 
            shadow-md
          `}>
            <span className="text-white text-lg font-bold">{logoChar}</span>
          </div>
          <div>
            <h1 className="text-lg font-semibold text-gray-900">{title}</h1>
            <p className="text-sm text-gray-600">Nipo School</p>
          </div>
        </div>
        
        {/* Logout Button Oriental */}
        <Button variant="oriental" size="sm" onClick={onLogout}>
          またね
        </Button>
      </div>
    </nav>
  );
};
```

---

## 📐 **FASE 4: LAYOUT SYSTEM**

### **OrientalGrid (Sistema de Grid)**
```jsx
// src/shared/components/layout/OrientalGrid.jsx
const OrientalGrid = ({ 
  columns = 'auto-fit', 
  gap = 'md', 
  children 
}) => {
  const gaps = {
    sm: DesignTokens.spacing.sm,
    md: DesignTokens.spacing.md,
    lg: DesignTokens.spacing.lg,
    xl: DesignTokens.spacing.xl
  };
  
  return (
    <div 
      className={`grid gap-${gaps[gap]}`}
      style={{
        gridTemplateColumns: columns === 'auto-fit' ? 
          'repeat(auto-fit, minmax(280px, 1fr))' : 
          `repeat(${columns}, 1fr)`
      }}
    >
      {children}
    </div>
  );
};
```

---

## 🚀 **CRONOGRAMA DE IMPLEMENTAÇÃO**

### **Semana 1: Fundação**
- **Dia 1:** Criar design-tokens.js
- **Dia 2:** Revisar Button e Card
- **Dia 3:** Implementar Input e Modal padronizados

### **Semana 2: Sistema Oriental**
- **Dia 4:** OrientalContainer e OrientalNavigation
- **Dia 5:** OrientalGrid e OrientalStatCard
- **Dia 6:** FloatingElements e microinterações

### **Semana 3: Integração**
- **Dia 7:** Documentação de componentes
- **Dia 8:** Testes e refinamentos
- **Dia 9:** Migração dos dashboards existentes

---

## ✅ **PRÓXIMO PASSO IMEDIATO**

**Começar com a criação do `design-tokens.js`** para centralizar todas as definições de estilo. Isso servirá como base para todos os componentes padronizados.

**Posso começar criando este arquivo agora?**