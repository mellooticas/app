# Nipo School - Sistema Oriental de Ensino Musical

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)
![Next.js](https://img.shields.io/badge/Next.js-16-black)
![React](https://img.shields.io/badge/React-19-blue)
![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.4-cyan)

## Sobre o Projeto

**Nipo School** é uma plataforma de ensino musical que combina a disciplina e excelência da **pedagogia japonesa** com a criatividade do método **Orff-Schulwerk**, criando uma experiência educacional única e envolvente.

### Metodologias Integradas

- **Orff Schulwerk** - Aprendizado através do movimento e criatividade
- **Método Suzuki** - Aprendizado natural como uma língua materna
- **Musical Futures** - Aprendizado informal e colaborativo
- **Kodály** - Desenvolvimento da musicalidade interior

## Tecnologias

### Frontend
- **Next.js 16** - App Router (React 19)
- **TypeScript 5** - Tipagem estática
- **TailwindCSS 3.4** - Estilização utilitária
- **Lucide React** - Ícones
- **React Query** - Gerenciamento de dados assíncronos
- **React Hook Form + Zod** - Formulários e validação
- **Framer Motion** - Animações

### Backend / Infraestrutura
- **Supabase** - Auth + PostgreSQL + Storage + Realtime
- **OpenAI** - Geração de materiais e feedback (GPT-4o / GPT-4o-mini)
- **Vercel** - Deploy e hosting

### Arquitetura
- Multi-tenant (schemas: `iam`, `core`, `internal`, `public`)
- RBAC com permissões granulares via JWT custom claims
- Navegação 100% database-driven
- Server Actions com Zod validation
- Proxy de autenticação (`proxy.ts`, convenção Next.js 16)

## Quick Start

### Pré-requisitos

- Node.js 18+
- npm
- Conta Supabase

### Instalação

```bash
git clone <repo-url>
cd nipo_school
npm install

# Configure as variáveis de ambiente
cp .env.local.example .env.local
# Edite .env.local com suas credenciais

npm run dev
```

Acesse: `http://localhost:4000`

## Estrutura do Projeto

```
nipo_school/
├── app/                       # Next.js App Router
│   ├── (auth)/                # Login / registro
│   ├── (protected)/           # Rotas protegidas (RBAC)
│   │   ├── lessons/           # Aulas e atividades
│   │   ├── challenges/        # Desafios
│   │   ├── portfolio/         # Portfólio do aluno
│   │   ├── academic/          # Currículo e biblioteca
│   │   ├── settings/          # Configurações e admin
│   │   └── ...
│   ├── actions/               # Server Actions (17 arquivos)
│   └── providers/             # Context providers
├── lib/                       # Bibliotecas e utilitários
│   ├── supabase/              # Clientes Supabase (server/client/admin)
│   ├── ai/                    # AI client, prompts, curriculum context
│   ├── auth/                  # Permission checks
│   ├── validations/           # Zod schemas
│   ├── types/                 # TypeScript types
│   └── utils/                 # Action context, response helpers
├── database/                  # Schema SQL e migrações
│   ├── schema/                # DDL (00-16)
│   └── migrations/            # Migrações incrementais (001-055d)
├── docs/                      # Documentação de arquitetura
├── __tests__/                 # Testes (Vitest)
└── proxy.ts                   # Middleware de autenticação (Next.js 16)
```

## Scripts

```bash
npm run dev          # Desenvolvimento (localhost:4000)
npm run build        # Build de produção
npm run start        # Servidor de produção
npm run lint         # ESLint
npm run type-check   # TypeScript sem emitir
npm run test         # Testes (Vitest)
```

## Documentação

- [Estado Atual da Arquitetura](./docs/arquitetura/ESTADO_ATUAL.md)

## Contato

**ADNIPO Suzano**
- Website: [niposchool.com](https://niposchool.com)
- Email: contato@niposchool.com

---

*"Se não for divertido, ninguém aprende. Se não for fácil, ninguém começa."* - Filosofia Nipo School
