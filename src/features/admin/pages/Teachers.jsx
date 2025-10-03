import React from 'react';
import { Card, Button } from '../../../shared/components/base';

/**
 * Página de Gestão de Professores - Admin
 */
const AdminTeachers = () => {
  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-white shadow">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-6">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">
                👨‍🏫 Gestão de Professores
              </h1>
              <p className="mt-1 text-sm text-gray-600">
                Administre a equipe docente e suas especializações
              </p>
            </div>
            <Button variant="primary" size="sm">
              ➕ Novo Professor
            </Button>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <Card>
          <div className="text-center py-12">
            <h3 className="text-lg font-medium text-gray-900 mb-2">
              Página em Desenvolvimento
            </h3>
            <p className="text-gray-600">
              A gestão de professores será implementada em breve.
            </p>
          </div>
        </Card>
      </div>
    </div>
  );
};

export default AdminTeachers;