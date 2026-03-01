# 🧪 Guia de Testes - Estrutura Limpa

## ✅ Checklist de Validação

Execute todos os testes abaixo para garantir que a estrutura limpa está funcional.

---

## 1️⃣ Teste de Compilação

### Verificar que não há erros TypeScript
```bash
cd /d/projetos/nipo_school
npm run type-check  # Se disponível
```

### Iniciar servidor dev
```bash
npm run dev
```

**Resultado Esperado:**
```
✅ VITE v5.0.8  ready in XXX ms
✅ Local:   http://localhost:3001/
✅ No compilation errors
```

---

## 2️⃣ Teste de Rotas Públicas

### Teste 1: Landing Page
1. Acesse: `http://localhost:3001/`
2. Verificar:
   - ✅ Página carrega sem erros
   - ✅ Header com logo "Nipo School"
   - ✅ Hero section com estatísticas
   - ✅ Seção de metodologias
   - ✅ Footer completo

### Teste 2: Navegação Landing → Login
1. Na Landing, clique "Entrar" (header)
2. Verificar:
   - ✅ Redireciona para `/login`
   - ✅ Formulário de login aparece
   - ✅ Campos: Email, Senha
   - ✅ Link "Cadastre-se" funciona

### Teste 3: Navegação Landing → Signup
1. Na Landing, clique "Criar Conta Gratuita"
2. Verificar:
   - ✅ Redireciona para `/cadastro`
   - ✅ Formulário completo aparece
   - ✅ Campos: Nome, Email, Tipo, Senha, Confirmar
   - ✅ Seletor de tipo (Aluno/Professor)

---

## 3️⃣ Teste de Autenticação

### Teste 4: Cadastro de Novo Usuário

#### Criar conta de Aluno
```
1. Acesse: http://localhost:3001/cadastro
2. Preencha:
   - Nome: João Silva
   - Email: joao@teste.com
   - Tipo: Aluno
   - Senha: teste123
   - Confirmar: teste123
3. Clique "Criar Conta"
```

**Resultado Esperado:**
- ✅ Mensagem "Conta criada com sucesso!"
- ✅ Redirecionamento automático para `/login` (2s)

#### Criar conta de Professor
```
1. Repita processo
2. Email: maria@professor.com
3. Tipo: Professor
```

### Teste 5: Login com Conta Criada

```
1. Acesse: http://localhost:3001/login
2. Email: joao@teste.com
3. Senha: teste123
4. Clique "Entrar"
```

**Resultado Esperado:**
- ✅ Loading state ("Entrando...")
- ✅ Redirecionamento para `/dashboard`
- ✅ SmartRedirect detecta tipo "aluno"
- ✅ Redireciona automático para `/aluno`
- ✅ Dashboard do aluno carrega

### Teste 6: Validações de Login

#### Senha incorreta
```
1. Login: joao@teste.com
2. Senha: senhaerrada
3. Clique "Entrar"
```
**Resultado:** ✅ Mensagem de erro exibida

#### Email não existe
```
1. Login: naoexiste@teste.com
2. Senha: qualquer
3. Clique "Entrar"
```
**Resultado:** ✅ Mensagem de erro exibida

---

## 4️⃣ Teste de Dashboards

### Teste 7: Dashboard do Aluno
```
1. Login como aluno (joao@teste.com)
2. Deve carregar: /aluno
```

**Verificar:**
- ✅ Header "Dashboard do Aluno"
- ✅ 3 Cards de estatísticas (Pontos, Streak, Lições)
- ✅ Seção "Conquistas Recentes"
- ✅ Seção "Desafios Alpha Ativos"
- ✅ 2 Quick Actions (Ver Instrumentos, Ver Desafios)

### Teste 8: Dashboard do Professor
```
1. Logout
2. Login como professor (maria@professor.com)
3. Deve carregar: /professor
```

**Verificar:**
- ✅ Header "Dashboard do Professor"
- ✅ 4 Cards de métricas (Turmas, Alunos, Avaliações, Presença)
- ✅ Seção "Minhas Turmas"
- ✅ Seção "Submissões Recentes"
- ✅ 3 Quick Actions (Criar Turma, Criar Desafio, Ver Relatórios)

### Teste 9: Dashboard do Admin
```
1. Necessário ter conta admin no banco
2. Login como admin
3. Deve carregar: /admin
```

**Verificar:**
- ✅ Header "Dashboard Administrativo"
- ✅ 4 Cards globais (Usuários, Alunos, Professores, Pontos)
- ✅ Seção "Atividades Recentes"
- ✅ Gráficos de engajamento
- ✅ 4 Quick Actions

---

## 5️⃣ Teste de Proteção de Rotas

### Teste 10: Acesso Sem Login
```
1. Logout (se logado)
2. Tente acessar: http://localhost:3001/aluno
```

**Resultado Esperado:**
- ✅ ProtectedRoute detecta não autenticado
- ✅ Redireciona para `/login`
- ✅ LoadingScreen aparece durante verificação

### Teste 11: Acesso com Role Incorreto
```
1. Login como aluno (joao@teste.com)
2. Tente acessar: http://localhost:3001/professor
```

**Resultado Esperado:**
- ✅ ProtectedRoute detecta role incompatível
- ✅ Redireciona para `/aluno` (dashboard correto)

### Teste 12: Admin Acessa Tudo
```
1. Login como admin
2. Acesse: /aluno
```

**Resultado:** ✅ Admin consegue acessar (tem permissão total)

```
3. Acesse: /professor
```

**Resultado:** ✅ Admin consegue acessar

```
4. Acesse: /admin
```

**Resultado:** ✅ Admin consegue acessar

---

## 6️⃣ Teste de SmartRedirect

### Teste 13: Redirecionamento Automático
```
1. Login como aluno
2. Acesse diretamente: http://localhost:3001/dashboard
```

**Resultado Esperado:**
- ✅ SmartRedirect detecta tipo_usuario = 'aluno'
- ✅ Redireciona automaticamente para `/aluno`

```
3. Logout e login como professor
4. Acesse: http://localhost:3001/dashboard
```

**Resultado:** ✅ Redireciona para `/professor`

---

## 7️⃣ Teste de Componentes Compartilhados

### Teste 14: LoadingScreen
```
1. Acesse qualquer rota protegida
2. Observe estado inicial
```

**Resultado:** ✅ LoadingScreen aparece com spinner animado

### Teste 15: ErrorBoundary
```
1. Forçar erro (remover temporariamente import necessário)
2. Recarregar página
```

**Resultado:**
- ✅ ErrorBoundary captura erro
- ✅ Mensagem amigável exibida
- ✅ Botão "Voltar para Home" funciona

---

## 8️⃣ Teste de Performance

### Teste 16: Tempo de Carregamento
```
1. Abra DevTools → Network
2. Recarregue landing page
3. Observe métricas
```

**Resultado Esperado:**
- ✅ First Contentful Paint < 1.5s
- ✅ Time to Interactive < 3s
- ✅ Bundle size < 500KB (gzipped)

### Teste 17: Hot Module Replacement (HMR)
```
1. Servidor dev rodando
2. Edite src/pages/LandingPage.jsx
3. Mude texto do título
4. Salve
```

**Resultado:** ✅ Página atualiza instantaneamente sem reload completo

---

## 9️⃣ Teste de Build

### Teste 18: Build de Produção
```bash
npm run build
```

**Resultado Esperado:**
```
✅ vite v5.0.8 building for production...
✅ ✓ XXX modules transformed.
✅ dist/index.html                  XX kB
✅ dist/assets/index-XXXXX.js       XX kB │ gzip: XX kB
✅ dist/assets/index-XXXXX.css      XX kB │ gzip: XX kB
✅ ✓ built in XXXms
```

### Teste 19: Preview do Build
```bash
npm run preview
```

**Resultado:** ✅ Aplicação roda em modo produção sem erros

---

## 🔟 Teste de Integração Supabase

### Teste 20: Verificar Conexão
```
1. Login com usuário válido
2. Abra DevTools → Console
3. Observe logs
```

**Resultado Esperado:**
- ✅ Sem erros de conexão Supabase
- ✅ Token JWT armazenado
- ✅ Profile carregado corretamente

### Teste 21: Queries Funcionais
```javascript
// No Console do navegador
localStorage.getItem('supabase.auth.token')
```

**Resultado:** ✅ Token JWT presente e válido

---

## ✅ Checklist Final

Execute todos os testes e marque:

### Compilação e Servidor
- [ ] Servidor dev inicia sem erros
- [ ] TypeScript compila sem erros
- [ ] Build de produção funciona

### Rotas Públicas
- [ ] Landing page carrega
- [ ] Navegação Landing → Login funciona
- [ ] Navegação Landing → Signup funciona

### Autenticação
- [ ] Cadastro de aluno funciona
- [ ] Cadastro de professor funciona
- [ ] Login funciona
- [ ] Validações de erro funcionam
- [ ] Logout funciona

### Dashboards
- [ ] Dashboard aluno carrega
- [ ] Dashboard professor carrega
- [ ] Dashboard admin carrega (se tiver conta)

### Proteção de Rotas
- [ ] Acesso sem login redireciona para login
- [ ] Acesso com role errado redireciona
- [ ] Admin acessa todas as rotas

### SmartRedirect
- [ ] Redireciona aluno para /aluno
- [ ] Redireciona professor para /professor
- [ ] Redireciona admin para /admin

### Componentes
- [ ] LoadingScreen aparece
- [ ] ErrorBoundary funciona

### Performance
- [ ] Carregamento < 3s
- [ ] HMR funciona
- [ ] Bundle size otimizado

### Integração
- [ ] Supabase conecta
- [ ] Queries funcionam
- [ ] Token JWT salvo

---

## 📊 Resultados Esperados

Se todos os testes passarem:

✅ **33/33 arquivos funcionais**  
✅ **Zero erros de compilação**  
✅ **Sistema de rotas 100% funcional**  
✅ **Autenticação integrada**  
✅ **Dashboards renderizando**  
✅ **Proteção de rotas ativa**  

---

## 🐛 Troubleshooting

### Erro: "Cannot find module"
```bash
npm install
npm run dev
```

### Erro: "Port 3001 already in use"
```bash
# Windows
netstat -ano | findstr :3001
taskkill /PID <PID> /F

# Ou mude a porta no vite.config.js
```

### Erro: Supabase não conecta
1. Verifique `.env` ou `.env.local`
2. Confirme `VITE_SUPABASE_URL` e `VITE_SUPABASE_ANON_KEY`
3. Teste conexão no Supabase Dashboard

### Erro: TypeScript types
```bash
# Regenerar types
npx supabase gen types typescript --project-id YOUR_ID > src/lib/supabase/database.types.ts
```

---

**🎉 Se todos os testes passarem, a estrutura limpa está 100% funcional! 🎉**
