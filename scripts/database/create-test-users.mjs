// create-test-users.mjs
// Script para criar usuários de teste no Supabase

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

// Carregar variáveis de ambiente
dotenv.config();

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseAnonKey = process.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  console.error('❌ Variáveis de ambiente não encontradas!');
  console.log('Certifique-se de que VITE_SUPABASE_URL e VITE_SUPABASE_ANON_KEY estão no .env');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseAnonKey);

// Usuários de teste
const testUsers = [
  {
    email: 'admin@gmail.com',
    password: 'admin123',
    userData: {
      fullName: 'Administrador Sistema',
      dob: '1990-01-01',
      instrument: 'Piano',
      tipo_usuario: 'admin'
    }
  },
  {
    email: 'professor@gmail.com',
    password: 'prof123',
    userData: {
      fullName: 'Maria Silva Professor',
      dob: '1985-05-15',
      instrument: 'Violão',
      tipo_usuario: 'professor'
    }
  },
  {
    email: 'aluno@gmail.com',
    password: 'aluno123',
    userData: {
      fullName: 'João Santos Aluno',
      dob: '2000-08-20',
      instrument: 'Flauta',
      tipo_usuario: 'aluno'
    }
  }
];

async function createTestUser(email, password, userData) {
  try {
    console.log(`🔧 Criando usuário: ${email}...`);

    // 1. Criar usuário no Auth
    const { data: authData, error: authError } = await supabase.auth.signUp({
      email: email.trim(),
      password: password
    });

    if (authError) {
      if (authError.message.includes('already registered')) {
        console.log(`⚠️  Usuário ${email} já existe`);
        return;
      }
      throw authError;
    }

    if (!authData.user) {
      throw new Error('Usuário não foi criado');
    }

    console.log(`✅ Usuário criado no Auth: ${authData.user.id}`);

    // 2. Criar perfil na tabela profiles
    const { error: profileError } = await supabase
      .from('profiles')
      .insert({
        id: authData.user.id,
        email: email.trim(),
        full_name: userData.fullName.trim(),
        dob: userData.dob,
        instrument: userData.instrument,
        tipo_usuario: userData.tipo_usuario,
        user_level: 'beginner',
        total_points: 0,
        current_streak: 0,
        best_streak: 0,
        lessons_completed: 0,
        modules_completed: 0,
        joined_at: new Date().toISOString(),
        last_active: new Date().toISOString()
      });

    if (profileError) {
      console.error(`❌ Erro ao criar perfil para ${email}:`, profileError);
      return;
    }

    console.log(`✅ Perfil criado para ${email} como ${userData.tipo_usuario}`);
    
  } catch (error) {
    console.error(`❌ Erro ao criar ${email}:`, error.message);
  }
}

async function main() {
  console.log('🚀 Iniciando criação de usuários de teste...\n');

  for (const user of testUsers) {
    await createTestUser(user.email, user.password, user.userData);
    console.log(''); // linha em branco
  }

  console.log('✅ Processo concluído!');
  console.log('\n📝 Credenciais dos usuários de teste:');
  console.log('Admin: admin@gmail.com / admin123');
  console.log('Professor: professor@gmail.com / prof123');
  console.log('Aluno: aluno@gmail.com / aluno123');

  process.exit(0);
}

main().catch(console.error);