import React, { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase/supabaseClient';
import { useAuth } from '../contexts/working-auth-context';
import { Card, Button } from '../shared/components/base';

/**
 * Página de Diagnóstico da Conexão com Supabase
 * 
 * Testa conexão, autenticação e operações básicas do banco
 */
const DatabaseDiagnostic = () => {
  const { user: authUser, userProfile: authProfile, logout } = useAuth();
  const [tests, setTests] = useState({
    connection: { status: 'pending', message: 'Testando...' },
    auth: { status: 'pending', message: 'Testando...' },
    profiles: { status: 'pending', message: 'Testando...' },
    user: { status: 'pending', message: 'Testando...' }
  });

  const [currentUser, setCurrentUser] = useState(null);
  const [userProfile, setUserProfile] = useState(null);

  useEffect(() => {
    runDiagnostic();
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  const updateTest = (testName, status, message, data = null) => {
    setTests(prev => ({
      ...prev,
      [testName]: { status, message, data }
    }));
  };

  const runDiagnostic = async () => {
    console.log('🔍 Iniciando diagnóstico completo...');
    let sessionUser = null; // Variável local para o usuário da sessão
    
    // 1. Teste de Conexão Básica
    try {
      console.log('📡 Testando conexão básica...');
      const { error } = await supabase.from('profiles').select('count').limit(1);
      
      if (error && error.code === 'PGRST116') {
        updateTest('connection', 'warning', 'Conectado, mas tabela profiles não encontrada');
      } else if (error) {
        updateTest('connection', 'error', `Erro de conexão: ${error.message}`);
      } else {
        updateTest('connection', 'success', 'Conexão estabelecida com sucesso');
      }
    } catch (error) {
      updateTest('connection', 'error', `Falha na conexão: ${error.message}`);
    }

    // 2. Teste de Autenticação
    try {
      console.log('🔐 Testando autenticação...');
      const { data: { session }, error } = await supabase.auth.getSession();
      
      if (error) {
        updateTest('auth', 'error', `Erro de autenticação: ${error.message}`);
      } else if (session?.user) {
        sessionUser = session.user; // Armazenar na variável local
        setCurrentUser(session.user);
        updateTest('auth', 'success', `Usuário autenticado: ${session.user.email}`);
      } else {
        updateTest('auth', 'warning', 'Nenhuma sessão ativa');
      }
    } catch (error) {
      updateTest('auth', 'error', `Falha na autenticação: ${error.message}`);
    }

    // 3. Teste de Acesso à Tabela Profiles
    try {
      console.log('👤 Testando acesso à tabela profiles...');
      const { data, error } = await supabase
        .from('profiles')
        .select('id, email, full_name, tipo_usuario')
        .limit(5);
      
      if (error) {
        updateTest('profiles', 'error', `Erro ao acessar profiles: ${error.message}`);
      } else {
        updateTest('profiles', 'success', `${data?.length || 0} perfis encontrados`, data);
      }
    } catch (error) {
      updateTest('profiles', 'error', `Falha ao acessar profiles: ${error.message}`);
    }

    // 4. Teste de Perfil do Usuário Atual
    try {
      if (sessionUser) { // Usar a variável local em vez do state
        console.log('🔍 Buscando perfil do usuário atual...');
        const { data, error } = await supabase
          .from('profiles')
          .select('*')
          .eq('id', sessionUser.id)
          .single();
        
        if (error) {
          updateTest('user', 'error', `Erro ao buscar perfil: ${error.message}`);
        } else if (data) {
          setUserProfile(data);
          updateTest('user', 'success', `Perfil encontrado: ${data.tipo_usuario}`, data);
        } else {
          updateTest('user', 'warning', 'Perfil não encontrado no banco');
        }
      } else {
        updateTest('user', 'warning', 'Nenhum usuário logado para testar');
      }
    } catch (error) {
      updateTest('user', 'error', `Falha ao buscar perfil: ${error.message}`);
    }
  };

  const getStatusIcon = (status) => {
    switch (status) {
      case 'success': return '✅';
      case 'error': return '❌';
      case 'warning': return '⚠️';
      case 'pending': return '⏳';
      default: return '❓';
    }
  };

  const getStatusColor = (status) => {
    switch (status) {
      case 'success': return 'text-green-600 bg-green-50';
      case 'error': return 'text-red-600 bg-red-50';
      case 'warning': return 'text-yellow-600 bg-yellow-50';
      case 'pending': return 'text-blue-600 bg-blue-50';
      default: return 'text-gray-600 bg-gray-50';
    }
  };

  const handleLogout = async () => {
    try {
      await logout();
      console.log('✅ Logout realizado com sucesso');
      window.location.reload();
    } catch (error) {
      console.error('❌ Erro no logout:', error);
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-4xl mx-auto">
        {/* Header com informações do usuário */}
        {authUser && (
          <Card className="mb-6">
            <div className="flex items-center justify-between">
              <div className="flex items-center space-x-4">
                <div className="w-12 h-12 bg-green-500 rounded-full flex items-center justify-center text-white font-bold">
                  {authUser.email?.charAt(0).toUpperCase()}
                </div>
                <div>
                  <h3 className="font-semibold text-gray-900">{authProfile?.full_name || 'Usuário'}</h3>
                  <p className="text-sm text-gray-600">{authUser.email}</p>
                  {authProfile && (
                    <p className="text-xs text-green-600 font-medium">
                      {authProfile.tipo_usuario === 'admin' ? '👑 Administrador' :
                       authProfile.tipo_usuario === 'teacher' ? '👨‍🏫 Professor' :
                       authProfile.tipo_usuario === 'student' ? '👨‍🎓 Estudante' :
                       authProfile.tipo_usuario}
                    </p>
                  )}
                </div>
              </div>
              <Button onClick={handleLogout} variant="danger">
                🚪 Logout
              </Button>
            </div>
          </Card>
        )}
        
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-gray-900 mb-4">
            🔍 Diagnóstico de Conexão - Supabase
          </h1>
          <p className="text-gray-600">
            Verificação completa da conectividade e funcionalidade do banco de dados
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
          {Object.entries(tests).map(([testName, result]) => (
            <Card key={testName} variant="elevated">
              <div className={`p-4 rounded-lg ${getStatusColor(result.status)}`}>
                <div className="flex items-center justify-between mb-2">
                  <h3 className="font-semibold capitalize">
                    {testName === 'profiles' ? 'Tabela Profiles' : 
                     testName === 'auth' ? 'Autenticação' :
                     testName === 'user' ? 'Perfil do Usuário' : 'Conexão'}
                  </h3>
                  <span className="text-2xl">{getStatusIcon(result.status)}</span>
                </div>
                <p className="text-sm">{result.message}</p>
                {result.data && (
                  <details className="mt-2">
                    <summary className="cursor-pointer text-xs opacity-75">
                      Ver dados ({Array.isArray(result.data) ? result.data.length : 1} items)
                    </summary>
                    <pre className="text-xs mt-1 p-2 bg-black bg-opacity-10 rounded overflow-auto max-h-32">
                      {JSON.stringify(result.data, null, 2)}
                    </pre>
                  </details>
                )}
              </div>
            </Card>
          ))}
        </div>

        {/* Informações do Sistema */}
        <Card>
          <h2 className="text-xl font-semibold mb-4">📊 Informações do Sistema</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
            <div>
              <h3 className="font-medium text-gray-900 mb-2">Configuração Supabase</h3>
              <p><strong>URL:</strong> {import.meta.env.VITE_SUPABASE_URL}</p>
              <p><strong>Anon Key:</strong> {import.meta.env.VITE_SUPABASE_ANON_KEY?.substring(0, 20)}...</p>
            </div>
            <div>
              <h3 className="font-medium text-gray-900 mb-2">Usuário Atual</h3>
              {currentUser ? (
                <>
                  <p><strong>Email:</strong> {currentUser.email}</p>
                  <p><strong>ID:</strong> {currentUser.id.substring(0, 8)}...</p>
                  <p><strong>Criado em:</strong> {new Date(currentUser.created_at).toLocaleDateString()}</p>
                </>
              ) : (
                <p className="text-gray-500">Nenhum usuário logado</p>
              )}
            </div>
          </div>
        </Card>

        {/* Perfil Detalhado */}
        {userProfile && (
          <Card className="mt-6">
            <h2 className="text-xl font-semibold mb-4">👤 Perfil Completo</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
              <div>
                <p><strong>Nome:</strong> {userProfile.full_name || 'Não informado'}</p>
                <p><strong>Tipo:</strong> {userProfile.tipo_usuario || 'Não definido'}</p>
                <p><strong>Instrumento:</strong> {userProfile.instrument || 'Não informado'}</p>
                <p><strong>Votou:</strong> {userProfile.has_voted ? 'Sim' : 'Não'}</p>
              </div>
              <div>
                <p><strong>Pontos:</strong> {userProfile.total_points || 0}</p>
                <p><strong>Nível:</strong> {userProfile.user_level || 'Iniciante'}</p>
                <p><strong>Sequência:</strong> {userProfile.current_streak || 0} dias</p>
                <p><strong>Última atividade:</strong> {userProfile.last_active ? new Date(userProfile.last_active).toLocaleDateString() : 'Nunca'}</p>
              </div>
            </div>
          </Card>
        )}

        <div className="text-center mt-8">
          <Button onClick={runDiagnostic} variant="primary">
            🔄 Executar Diagnóstico Novamente
          </Button>
        </div>
      </div>
    </div>
  );
};

export default DatabaseDiagnostic;