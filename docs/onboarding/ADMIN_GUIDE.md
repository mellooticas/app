# Guia do Administrador — Nipo School

## 1. Primeiro Acesso

1. Acesse o sistema pelo link fornecido (ex: `https://niposchool.vercel.app`)
2. Faça login com email e senha fornecidos pelo desenvolvedor
3. Você será redirecionado para o **Dashboard**

## 2. Configuração Inicial

### 2.1 Dados da Escola
- Acesse **Configurações → Escola**
- Preencha: nome, endereço, telefone, logo
- Configure as unidades (sedes)

### 2.2 Criação de Usuários
- Acesse **Configurações → Usuários**
- Clique **Convidar Usuário** ou **Criar Aluno/Professor**
- Para convite: informe email + role → o usuário recebe link de acesso
- Para criação direta: informe nome, email, senha, instrumento

### 2.3 Roles e Permissões
- Acesse **Configurações → Roles e Permissões**
- 3 roles padrão: `student`, `teacher`, `admin`
- Para cada role, configure:
  - **Permissões**: quais ações o role pode executar
  - **Navegação**: quais páginas aparecem no menu lateral

### 2.4 Matrículas
- Acesse **Configurações → Matrículas**
- Crie turmas (Cursos) com professor, instrumento, nível e horário
- Matricule alunos nas turmas

## 3. Gestão do Conteúdo

### 3.1 Aulas
- Acesse **Aulas** para listar por módulo
- Crie novas aulas com título, objetivo, atividades e materiais
- Publique quando pronto (status: draft → published)

### 3.2 Geração de Material IA
- Acesse **Configurações → Conteúdo IA**
- Selecione aulas e clique **Gerar Material**
- O sistema cria automaticamente: material de apoio + exercícios
- Monitore custos em **Configurações → Superadmin**

### 3.3 Biblioteca Acadêmica
- Acesse **Acadêmico → Biblioteca**
- 24 capítulos de currículo pré-carregados
- Pode adicionar novos itens se necessário

## 4. Monitoramento

### 4.1 Superadmin Dashboard
- Acesse **Configurações → Superadmin**
- Visualize: requisições IA, custos, erros, latência
- Alertas automáticos para anomalias

### 4.2 Qualidade de Dados
- Acesse **Configurações → Qualidade de Dados**
- Veja campos obrigatórios faltando em perfis, aulas, submissões

## 5. Feature Flags
- Módulos podem ser ligados/desligados por fase do piloto
- Flags configurados no banco de dados (`feature_flags`)
- Contate o desenvolvedor para ativar/desativar módulos

## 6. Suporte
- Problemas técnicos: contate Junior (junior.sax@gmail.com)
- Bugs: registre em https://github.com/[repo]/issues
