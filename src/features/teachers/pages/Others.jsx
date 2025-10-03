import React from 'react';
import { Card } from '../../../shared/components/base';

const TeacherContent = () => (
  <div className="min-h-screen bg-gray-50 p-8">
    <Card><div className="text-center py-12">
      <h2 className="text-xl font-bold mb-4">📚 Gestão de Conteúdo</h2>
      <p>Página em desenvolvimento...</p>
    </div></Card>
  </div>
);

const TeacherClasses = () => (
  <div className="min-h-screen bg-gray-50 p-8">
    <Card><div className="text-center py-12">
      <h2 className="text-xl font-bold mb-4">🎯 Minhas Turmas</h2>
      <p>Página em desenvolvimento...</p>
    </div></Card>
  </div>
);

const TeacherStudents = () => (
  <div className="min-h-screen bg-gray-50 p-8">
    <Card><div className="text-center py-12">
      <h2 className="text-xl font-bold mb-4">👥 Meus Alunos</h2>
      <p>Página em desenvolvimento...</p>
    </div></Card>
  </div>
);

const TeacherReports = () => (
  <div className="min-h-screen bg-gray-50 p-8">
    <Card><div className="text-center py-12">
      <h2 className="text-xl font-bold mb-4">📊 Relatórios</h2>
      <p>Página em desenvolvimento...</p>
    </div></Card>
  </div>
);

const TeacherProfile = () => (
  <div className="min-h-screen bg-gray-50 p-8">
    <Card><div className="text-center py-12">
      <h2 className="text-xl font-bold mb-4">👤 Meu Perfil</h2>
      <p>Página em desenvolvimento...</p>
    </div></Card>
  </div>
);

export { TeacherContent as Content };
export { TeacherClasses as Classes };
export { TeacherStudents as Students };
export { TeacherReports as Reports };
export { TeacherProfile as Profile };