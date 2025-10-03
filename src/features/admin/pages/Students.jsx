import React, { useState } from 'react';
import { Card, Button, Input } from '../../../shared/components/base';

/**
 * Página de Gestão de Estudantes - Admin
 * 
 * Interface administrativa para gerenciar alunos do sistema.
 * Utiliza componentes reutilizáveis e design consistente.
 */
const AdminStudents = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedFilter, setSelectedFilter] = useState('all');

  // Mock data - em produção viria de uma API
  const students = [
    { 
      id: 1, 
      name: 'Ana Silva', 
      email: 'ana@email.com', 
      instrument: 'Piano', 
      level: 'Iniciante',
      status: 'Ativo',
      lastActivity: '2 horas atrás'
    },
    { 
      id: 2, 
      name: 'Carlos Santos', 
      email: 'carlos@email.com', 
      instrument: 'Violão', 
      level: 'Intermediário',
      status: 'Ativo',
      lastActivity: '1 dia atrás'
    },
    { 
      id: 3, 
      name: 'Mariana Costa', 
      email: 'mariana@email.com', 
      instrument: 'Flauta', 
      level: 'Avançado',
      status: 'Inativo',
      lastActivity: '1 semana atrás'
    },
    { 
      id: 4, 
      name: 'Pedro Oliveira', 
      email: 'pedro@email.com', 
      instrument: 'Violino', 
      level: 'Iniciante',
      status: 'Ativo',
      lastActivity: '30 min atrás'
    }
  ];

  const filteredStudents = students.filter(student => {
    const matchesSearch = student.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         student.email.toLowerCase().includes(searchTerm.toLowerCase());
    const matchesFilter = selectedFilter === 'all' || student.status.toLowerCase() === selectedFilter;
    return matchesSearch && matchesFilter;
  });

  const getLevelColor = (level) => {
    switch (level) {
      case 'Iniciante': return 'bg-green-100 text-green-800';
      case 'Intermediário': return 'bg-yellow-100 text-yellow-800';
      case 'Avançado': return 'bg-red-100 text-red-800';
      default: return 'bg-gray-100 text-gray-800';
    }
  };

  const getStatusColor = (status) => {
    return status === 'Ativo' ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800';
  };

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white shadow">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-6">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">
                👥 Gestão de Estudantes
              </h1>
              <p className="mt-1 text-sm text-gray-600">
                Gerencie alunos, acompanhe progresso e configure permissões
              </p>
            </div>
            <div className="flex space-x-3">
              <Button variant="outline" size="sm">
                📊 Relatório
              </Button>
              <Button variant="primary" size="sm">
                ➕ Novo Aluno
              </Button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <Card variant="elevated" size="md">
            <div className="text-center">
              <p className="text-3xl font-bold text-blue-600">245</p>
              <p className="text-sm text-gray-600">Total de Alunos</p>
            </div>
          </Card>
          <Card variant="elevated" size="md">
            <div className="text-center">
              <p className="text-3xl font-bold text-green-600">198</p>
              <p className="text-sm text-gray-600">Alunos Ativos</p>
            </div>
          </Card>
          <Card variant="elevated" size="md">
            <div className="text-center">
              <p className="text-3xl font-bold text-yellow-600">32</p>
              <p className="text-sm text-gray-600">Novos este Mês</p>
            </div>
          </Card>
          <Card variant="elevated" size="md">
            <div className="text-center">
              <p className="text-3xl font-bold text-purple-600">15</p>
              <p className="text-sm text-gray-600">Instrumentos</p>
            </div>
          </Card>
        </div>

        {/* Filters and Search */}
        <Card className="mb-8">
          <div className="flex flex-col md:flex-row gap-4 items-center justify-between">
            <div className="flex-1 max-w-md">
              <Input
                placeholder="Buscar por nome ou email..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                icon="🔍"
              />
            </div>
            <div className="flex gap-2">
              <Button 
                variant={selectedFilter === 'all' ? 'primary' : 'outline'} 
                size="sm"
                onClick={() => setSelectedFilter('all')}
              >
                Todos
              </Button>
              <Button 
                variant={selectedFilter === 'ativo' ? 'primary' : 'outline'} 
                size="sm"
                onClick={() => setSelectedFilter('ativo')}
              >
                Ativos
              </Button>
              <Button 
                variant={selectedFilter === 'inativo' ? 'primary' : 'outline'} 
                size="sm"
                onClick={() => setSelectedFilter('inativo')}
              >
                Inativos
              </Button>
            </div>
          </div>
        </Card>

        {/* Students Table */}
        <Card>
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Aluno
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Instrumento
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Nível
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Status
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Última Atividade
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Ações
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {filteredStudents.map((student) => (
                  <tr key={student.id} className="hover:bg-gray-50">
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div className="flex items-center">
                        <div className="flex-shrink-0 h-10 w-10">
                          <div className="h-10 w-10 rounded-full bg-primary-100 flex items-center justify-center">
                            <span className="text-primary-600 font-medium text-sm">
                              {student.name.split(' ').map(n => n[0]).join('')}
                            </span>
                          </div>
                        </div>
                        <div className="ml-4">
                          <div className="text-sm font-medium text-gray-900">
                            {student.name}
                          </div>
                          <div className="text-sm text-gray-500">
                            {student.email}
                          </div>
                        </div>
                      </div>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div className="text-sm text-gray-900">🎼 {student.instrument}</div>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className={`inline-flex px-2 py-1 text-xs font-semibold rounded-full ${getLevelColor(student.level)}`}>
                        {student.level}
                      </span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className={`inline-flex px-2 py-1 text-xs font-semibold rounded-full ${getStatusColor(student.status)}`}>
                        {student.status}
                      </span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {student.lastActivity}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium">
                      <div className="flex space-x-2">
                        <Button variant="ghost" size="xs">
                          👁️ Ver
                        </Button>
                        <Button variant="ghost" size="xs">
                          ✏️ Editar
                        </Button>
                        <Button variant="ghost" size="xs">
                          📊 Relatório
                        </Button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          {filteredStudents.length === 0 && (
            <div className="text-center py-12">
              <p className="text-gray-500">Nenhum aluno encontrado com os filtros aplicados.</p>
            </div>
          )}
        </Card>
      </div>
    </div>
  );
};

export default AdminStudents;