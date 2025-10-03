import React, { useState } from 'react';
import { Card, Button, Input, Modal } from '../shared/components/base';

/**
 * Página de Showcase/Modelos - Para aprovação visual dos componentes
 * Esta página permite visualizar todos os componentes base do sistema
 * em diferentes variações e estados
 */
const ComponentShowcase = () => {
  const [modalOpen, setModalOpen] = useState(false);
  const [inputValue, setInputValue] = useState('');
  const [loading, setLoading] = useState(false);

  const handleLoadingDemo = () => {
    setLoading(true);
    setTimeout(() => setLoading(false), 2000);
  };

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="text-center mb-12">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">
            🎨 Nipo School - Showcase de Componentes
          </h1>
          <p className="text-lg text-gray-600 max-w-3xl mx-auto">
            Esta página apresenta todos os componentes base do sistema para aprovação visual.
            Cada componente é reutilizável e segue o design system do projeto.
          </p>
        </div>

        {/* Navigation */}
        <nav className="mb-8">
          <div className="flex flex-wrap gap-4 justify-center">
            <a href="#cards" className="px-4 py-2 bg-primary-100 text-primary-700 rounded-lg hover:bg-primary-200 transition-colors">
              Cards
            </a>
            <a href="#buttons" className="px-4 py-2 bg-primary-100 text-primary-700 rounded-lg hover:bg-primary-200 transition-colors">
              Botões
            </a>
            <a href="#inputs" className="px-4 py-2 bg-primary-100 text-primary-700 rounded-lg hover:bg-primary-200 transition-colors">
              Inputs
            </a>
            <a href="#modals" className="px-4 py-2 bg-primary-100 text-primary-700 rounded-lg hover:bg-primary-200 transition-colors">
              Modais
            </a>
          </div>
        </nav>

        {/* Cards Section */}
        <section id="cards" className="mb-16">
          <h2 className="text-3xl font-bold text-gray-900 mb-8">📋 Cards</h2>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
            {/* Card Default */}
            <Card>
              <h3 className="text-lg font-semibold mb-2">Card Padrão</h3>
              <p className="text-gray-600">
                Este é um card básico com estilo padrão. Ideal para conteúdo geral.
              </p>
            </Card>

            {/* Card Elevated */}
            <Card variant="elevated">
              <h3 className="text-lg font-semibold mb-2">Card Elevado</h3>
              <p className="text-gray-600">
                Card com sombra mais pronunciada para destacar conteúdo importante.
              </p>
            </Card>

            {/* Card Outlined */}
            <Card variant="outlined">
              <h3 className="text-lg font-semibold mb-2">Card Contornado</h3>
              <p className="text-gray-600">
                Card com borda destacada, ideal para seções especiais.
              </p>
            </Card>

            {/* Card com Header */}
            <Card 
              header={{
                title: "Card com Header",
                subtitle: "Subtitle do card",
                actions: <Button size="sm">Ação</Button>
              }}
            >
              <p className="text-gray-600">
                Card com header estruturado, incluindo título, subtitle e ações.
              </p>
            </Card>

            {/* Card Clicável */}
            <Card 
              variant="elevated"
              onClick={() => alert('Card clicado!')}
            >
              <h3 className="text-lg font-semibold mb-2">Card Clicável</h3>
              <p className="text-gray-600">
                Este card é clicável e tem hover effects. Clique para testar!
              </p>
            </Card>

            {/* Card Loading */}
            <Card loading={true}>
              <h3 className="text-lg font-semibold mb-2">Card Loading</h3>
              <p className="text-gray-600">Estado de carregamento</p>
            </Card>
          </div>

          {/* Card Sizes */}
          <h3 className="text-xl font-semibold mb-4">Tamanhos dos Cards</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <Card size="sm">
              <p className="text-sm">Card Pequeno (sm)</p>
            </Card>
            <Card size="md">
              <p className="text-sm">Card Médio (md)</p>
            </Card>
            <Card size="lg">
              <p className="text-sm">Card Grande (lg)</p>
            </Card>
            <Card size="xl">
              <p className="text-sm">Card Extra Grande (xl)</p>
            </Card>
          </div>
        </section>

        {/* Buttons Section */}
        <section id="buttons" className="mb-16">
          <h2 className="text-3xl font-bold text-gray-900 mb-8">🔘 Botões</h2>
          
          {/* Button Variants */}
          <div className="mb-8">
            <h3 className="text-xl font-semibold mb-4">Variações de Botões</h3>
            <div className="flex flex-wrap gap-4">
              <Button variant="primary">Primary</Button>
              <Button variant="secondary">Secondary</Button>
              <Button variant="outline">Outline</Button>
              <Button variant="ghost">Ghost</Button>
              <Button variant="danger">Danger</Button>
            </div>
          </div>

          {/* Button Sizes */}
          <div className="mb-8">
            <h3 className="text-xl font-semibold mb-4">Tamanhos de Botões</h3>
            <div className="flex flex-wrap gap-4 items-center">
              <Button size="xs">Extra Small</Button>
              <Button size="sm">Small</Button>
              <Button size="md">Medium</Button>
              <Button size="lg">Large</Button>
              <Button size="xl">Extra Large</Button>
            </div>
          </div>

          {/* Button States */}
          <div className="mb-8">
            <h3 className="text-xl font-semibold mb-4">Estados dos Botões</h3>
            <div className="flex flex-wrap gap-4">
              <Button>Normal</Button>
              <Button loading={loading} onClick={handleLoadingDemo}>
                {loading ? 'Carregando...' : 'Loading Demo'}
              </Button>
              <Button disabled>Desabilitado</Button>
              <Button icon="📱">Com Ícone</Button>
              <Button icon="➡️" iconPosition="right">Ícone Direita</Button>
            </div>
          </div>

          {/* Full Width Button */}
          <div className="mb-8">
            <h3 className="text-xl font-semibold mb-4">Botão Full Width</h3>
            <Button fullWidth variant="primary">
              Botão que ocupa toda a largura
            </Button>
          </div>
        </section>

        {/* Inputs Section */}
        <section id="inputs" className="mb-16">
          <h2 className="text-3xl font-bold text-gray-900 mb-8">📝 Campos de Entrada</h2>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="space-y-6">
              <Input
                label="Campo Básico"
                placeholder="Digite algo aqui..."
                value={inputValue}
                onChange={(e) => setInputValue(e.target.value)}
              />
              
              <Input
                label="Campo Obrigatório"
                placeholder="Campo obrigatório"
                required
                hint="Este campo é obrigatório"
              />
              
              <Input
                label="Campo com Erro"
                placeholder="Campo com erro"
                error="Este campo possui um erro"
                value="valor inválido"
              />
              
              <Input
                label="Campo Desabilitado"
                placeholder="Campo desabilitado"
                disabled
                value="Campo desabilitado"
              />
            </div>
            
            <div className="space-y-6">
              <Input
                label="Email"
                type="email"
                placeholder="seu@email.com"
                icon="📧"
              />
              
              <Input
                label="Senha"
                type="password"
                placeholder="Sua senha"
                icon="🔒"
              />
              
              <Input
                label="Busca"
                placeholder="Buscar..."
                icon="🔍"
                iconPosition="right"
              />
              
              <Input
                label="Campo Grande"
                size="lg"
                placeholder="Campo de tamanho grande"
              />
            </div>
          </div>
        </section>

        {/* Modals Section */}
        <section id="modals" className="mb-16">
          <h2 className="text-3xl font-bold text-gray-900 mb-8">🗔 Modais</h2>
          
          <div className="flex flex-wrap gap-4">
            <Button onClick={() => setModalOpen(true)}>
              Abrir Modal de Exemplo
            </Button>
          </div>
        </section>

        {/* Footer */}
        <footer className="text-center py-8 border-t border-gray-200">
          <p className="text-gray-600">
            🎨 Nipo School Design System - Componentes Base Reutilizáveis
          </p>
          <p className="text-sm text-gray-500 mt-2">
            Desenvolvido com foco em reutilização e consistência visual
          </p>
        </footer>
      </div>

      {/* Modal Example */}
      <Modal
        isOpen={modalOpen}
        onClose={() => setModalOpen(false)}
        title="Modal de Exemplo"
        footer={{
          cancelText: "Cancelar",
          confirmText: "Confirmar",
          onCancel: () => setModalOpen(false),
          onConfirm: () => {
            alert('Confirmado!');
            setModalOpen(false);
          }
        }}
      >
        <div className="space-y-4">
          <p>Este é um modal de exemplo com todos os elementos padrão:</p>
          <ul className="list-disc list-inside space-y-1 text-gray-600">
            <li>Header com título e botão de fechar</li>
            <li>Conteúdo personalizável</li>
            <li>Footer com botões de ação</li>
            <li>Overlay com blur</li>
            <li>Fechamento com ESC</li>
          </ul>
          
          <Input 
            label="Campo dentro do modal"
            placeholder="Teste de input no modal"
          />
        </div>
      </Modal>
    </div>
  );
};

export default ComponentShowcase;