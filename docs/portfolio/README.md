# Sistema Portfolio - Nipo School

## Visão Geral

O Sistema Portfolio é uma aplicação completa para gestão de portfolios educacionais digitais, desenvolvida como parte da Nipo School. Permite aos estudantes documentar, refletir e compartilhar suas jornadas de aprendizagem musical.

## Estrutura dos Componentes

### Componentes Principais

- **PortfolioApp**: Aplicação principal com roteamento
- **PortfolioList**: Lista e gestão de portfolios
- **PortfolioDashboard**: Dashboard detalhado do portfolio
- **EvidenceViewer**: Visualização e gestão de evidências
- **EvidenceForm**: Formulário para adicionar evidências
- **AutoavaliacaoForm**: Formulário para autoavaliações

### API Integration

- **PortfolioAPI**: Classe completa para comunicação com backend
  - Gestão de portfolios
  - Upload e gestão de evidências
  - Sistema de autoavaliações
  - Feedback entre pares
  - Rubricas e indicadores
  - Analytics e relatórios

## Funcionalidades

### 1. Gestão de Portfolios
- Criação e edição de portfolios
- Status tracking (ativo/inativo)
- Busca e filtros
- Estatísticas e métricas

### 2. Sistema de Evidências
- Upload de múltiplos tipos de arquivo (texto, foto, vídeo, áudio)
- Reflexões pessoais estruturadas
- Categorização por metodologia
- Sistema de busca e filtros
- Visualização em grid com paginação

### 3. Autoavaliações
- Escala de 1-5 com descrições detalhadas
- Avaliação por competências musicais
- Reflexões sobre processo de aprendizagem
- Planejamento de desenvolvimento
- Histórico de progressão

### 4. Dashboard Interativo
- Visão geral com estatísticas
- Progresso visual com barras
- Atividade recente
- Navegação por abas
- Dados em tempo real

### 5. Interface Responsiva
- Design mobile-first
- Componentes acessíveis
- Estados de loading
- Feedback visual
- Drag & drop para uploads

## Tecnologias Utilizadas

- **React 18**: Componentes funcionais com hooks
- **React Router**: Navegação entre páginas
- **Heroicons**: Ícones consistentes
- **Tailwind CSS**: Estilização responsiva
- **Supabase**: Backend e storage
- **JavaScript ES6+**: Sintaxe moderna

## Estrutura de Dados

### Portfolio
```javascript
{
  id: uuid,
  titulo: string,
  descricao: string,
  usuario_id: uuid,
  status: 'ativo' | 'inativo',
  data_criacao: timestamp,
  data_atualizacao: timestamp
}
```

### Evidência
```javascript
{
  id: uuid,
  portfolio_id: uuid,
  titulo: string,
  descricao: string,
  tipo_evidencia: 'texto' | 'foto' | 'video' | 'audio' | 'arquivo',
  arquivo_url: string,
  metodologia_relacionada: string,
  reflexao_pessoal: string,
  contexto_criacao: string,
  impacto_aprendizagem: string,
  data_submissao: timestamp
}
```

### Autoavaliação
```javascript
{
  id: uuid,
  portfolio_id: uuid,
  competencia_avaliada: string,
  nivel_autoavaliado: 1-5,
  justificativa: string,
  evidencias_relacionadas: string,
  objetivos_melhoria: string,
  plano_desenvolvimento: string,
  reflexao_processo: string,
  data_avaliacao: timestamp
}
```

## Como Usar

### Instalação
```bash
npm install
```

### Desenvolvimento
```bash
npm run dev
```

### Uso dos Componentes
```javascript
import { PortfolioApp } from './components/Portfolio';

function App() {
  return <PortfolioApp />;
}
```

### API Usage
```javascript
import PortfolioAPI from './api/portfolioAPI';

// Listar portfolios
const portfolios = await PortfolioAPI.getUserPortfolios(userId);

// Criar portfolio
const newPortfolio = await PortfolioAPI.createPortfolio(portfolioData);

// Adicionar evidência
const evidence = await PortfolioAPI.addEvidencia(evidenciaData);
```

## Próximos Passos

1. **Sistema de Feedback**: Implementar comentários entre pares
2. **Rubricas**: Sistema de avaliação estruturada
3. **Relatórios**: Analytics avançados e exportação
4. **Gamificação**: Badges e conquistas
5. **Colaboração**: Portfolios compartilhados
6. **Integração**: Conexão com outros sistemas da Nipo School

## Metodologias Suportadas

- Orff-Schulwerk
- Suzuki
- Kodály
- Musical Futures
- Dalcroze
- Edwin Gordon
- Waldorf-Steiner
- Berklee Contemporary
- Lincoln Center Education

## Contribuição

O sistema foi desenvolvido seguindo as melhores práticas de React e é totalmente extensível. Novos tipos de evidência, competências e funcionalidades podem ser facilmente adicionados através da estrutura modular existente.