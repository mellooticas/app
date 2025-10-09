# 🎌 Nipo School - Sistema Oriental de Ensino Musical

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)
![React](https://img.shields.io/badge/React-18.2.0-blue)
![Vite](https://img.shields.io/badge/Vite-5.4.19-purple)
![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.4.0-cyan)

## 📋 Sobre o Projeto

**Nipo School** é uma plataforma revolucionária de ensino musical que combina a disciplina e excelência da **pedagogia japonesa** com a criatividade do método **Orff-Schulwerk**, criando uma experiência educacional única e envolvente.

### 🎯 Metodologias Integradas

- 🎭 **Orff Schulwerk** - Aprendizado através do movimento e criatividade
- 🎎 **Método Suzuki** - Aprendizado natural como uma língua materna
- 🎪 **Musical Futures** - Aprendizado informal e colaborativo
- 🎨 **Kodály** - Desenvolvimento da musicalidade interior

## 🚀 Quick Start

### Pré-requisitos

- Node.js 18+ 
- npm ou yarn
- Conta Supabase (para autenticação)

### Instalação

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/nipo_school.git

# Entre na pasta
cd nipo_school

# Instale as dependências
npm install

# Configure as variáveis de ambiente
cp .env.example .env
# Edite o .env com suas credenciais Supabase

# Inicie o servidor de desenvolvimento
npm run dev
```

Acesse: `http://localhost:3000`

## 📁 Estrutura do Projeto

```
nipo_school/
├── 📂 src/                    # Código fonte
│   ├── pages/                 # Páginas da aplicação
│   ├── components/            # Componentes reutilizáveis
│   ├── shared/                # Componentes compartilhados
│   ├── contexts/              # React Contexts
│   ├── router/                # Sistema de rotas
│   └── styles/                # Estilos globais
├── 📂 docs/                   # Documentação completa
├── 📂 scripts/                # Scripts de desenvolvimento
│   ├── tests/                 # Scripts de teste
│   └── database/              # Scripts de banco de dados
├── 📂 public/                 # Assets públicos
└── 📄 ESTRUTURA.md            # Documentação detalhada da estrutura
```

📖 **[Ver estrutura completa](./ESTRUTURA.md)**

## 🛠️ Scripts Disponíveis

```bash
# Desenvolvimento
npm run dev              # Servidor de desenvolvimento (localhost:3000)

# Build
npm run build            # Build de produção
npm run preview          # Preview do build

# Linting
npm run lint             # Executar ESLint
```

## 🎨 Design System

O projeto segue um **Design System completo** documentado em:
- **[Sistema de Design e Normativas UX/UI](./docs/Nipo_School-Sistema_de_Design_e_Normativas_UX_UI.md)**

### Cores Principais
- 🔴 Vermelho Nipo: `#ef4444`
- 🟠 Laranja: `#f97316`
- ⚪ Cinza Zen: `#64748b`

### Tipografia
- **Principal**: Inter (Google Fonts)
- **Japonesa**: Noto Sans JP

## 📚 Documentação

- 📖 [Documentação Completa](./docs/DOCUMENTACAO_COMPLETA_NIPO_SCHOOL.md)
- 🏗️ [Estrutura do Projeto](./ESTRUTURA.md)
- 🎨 [Design System](./docs/Nipo_School-Sistema_de_Design_e_Normativas_UX_UI.md)
- 📋 [Plano de Desenvolvimento](./docs/plano_completo.md)

## 🔧 Tecnologias

### Frontend
- **React 18.2.0** - Biblioteca UI
- **Vite 5.4.19** - Build tool
- **TailwindCSS 3.4.0** - Estilização
- **React Router** - Roteamento
- **Lucide React** - Ícones

### Backend
- **Supabase** - Database + Auth + Real-time
- **PostgreSQL** - Banco de dados

### DevOps
- **Vercel** - Deploy e hosting
- **GitHub** - Controle de versão

## 🎯 Features Implementadas

### ✅ Fase 1 - Foundation
- [x] Landing page institucional
- [x] Design System completo
- [x] Estrutura base do projeto
- [x] Configuração de ambientes

### 🔄 Fase 2 - Em Desenvolvimento
- [ ] Sistema de autenticação
- [ ] Dashboards por tipo de usuário
- [ ] Módulos educacionais

### 📋 Fase 3 - Planejado
- [ ] Sistema de gamificação
- [ ] Centro de estudos
- [ ] Portfolio de alunos
- [ ] Sistema de conquistas

## 👥 Contribuindo

Contribuições são bem-vindas! Por favor:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📞 Contato

**ADNIPO Suzano**
- Website: [niposchool.com](https://niposchool.com)
- Email: contato@niposchool.com

---

⭐ **"Se não for divertido, ninguém aprende. Se não for fácil, ninguém começa."**

*Filosofia Nipo School*

