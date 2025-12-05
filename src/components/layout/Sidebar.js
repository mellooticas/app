import { jsx as _jsx, jsxs as _jsxs, Fragment as _Fragment } from "react/jsx-runtime";
import { Link, useLocation } from 'react-router-dom';
import { X, Home, BookOpen, Trophy, Briefcase, Users, Settings, HelpCircle, Music, Calendar, Award, Library, TrendingUp } from 'lucide-react';
import { ROUTES } from '../../lib/constants/routes';
import { useAuth } from '../../contexts/AuthContext';
import clsx from 'clsx';
export const Sidebar = ({ isOpen, onClose }) => {
    const location = useLocation();
    const { user } = useAuth();
    // 🔧 CORRIGIDO: Usar role do contexto AuthContext
    const userRole = user?.role || 'aluno';
    console.log('🗂️ Sidebar - Papel do usuário:', userRole, user);
    const isActive = (path) => {
        return location.pathname === path || location.pathname.startsWith(path + '/');
    };
    // Navegação baseada no role
    const getNavigationItems = () => {
        const common = [
            { name: 'Ajuda', path: '/ajuda', icon: HelpCircle },
            { name: 'Configurações', path: '/configuracoes', icon: Settings },
        ];
        if (userRole === 'aluno') {
            return [
                { name: 'Dashboard', path: '/alunos', icon: Home },
                { name: 'Portfólio', path: '/alunos/portfolio', icon: Briefcase },
                { name: 'Conquistas', path: '/alunos/conquistas', icon: Trophy },
                { name: 'Desafios', path: '/alunos/desafios', icon: Award },
                { name: 'Instrumentos', path: '/alunos/instrumentos', icon: Music },
                { name: 'Minhas Aulas', path: '/alunos/aulas', icon: Calendar },
                { name: 'Progresso', path: '/alunos/progresso', icon: TrendingUp },
                { name: 'História da Música', path: '/historia-musica', icon: BookOpen },
                ...common,
            ];
        }
        if (userRole === 'professor') {
            return [
                { name: 'Dashboard', path: '/professores', icon: Home },
                { name: 'Turmas', path: '/professores/turmas', icon: Users },
                { name: 'Conteúdos', path: '/professores/conteudos', icon: Library },
                { name: 'Avaliações', path: '/professores/avaliacoes', icon: Award },
                ...common,
            ];
        }
        if (userRole === 'admin') {
            return [
                { name: 'Dashboard', path: '/admin', icon: Home },
                { name: 'Banco de Dados', path: '/admin/database', icon: Users },
                { name: 'Diagnóstico', path: '/admin/diagnostic', icon: Music },
                ...common,
            ];
        }
        return common;
    };
    const navigationItems = getNavigationItems();
    return (_jsx(_Fragment, { children: _jsxs("aside", { className: clsx('fixed inset-y-0 left-0 z-30 w-64 bg-white shadow-lg transform transition-transform duration-300 ease-in-out', 'lg:translate-x-0', isOpen ? 'translate-x-0' : '-translate-x-full'), children: [_jsxs("div", { className: "flex items-center justify-between px-6 py-4 border-b", children: [_jsxs(Link, { to: ROUTES.HOME, className: "flex items-center gap-2", children: [_jsx("div", { className: "w-8 h-8 bg-gradient-to-br from-sakura-500 to-cherry-500 rounded-xl flex items-center justify-center shadow-lg", children: _jsx("span", { className: "text-white font-bold text-lg", children: "\u97F3" }) }), _jsx("span", { className: "text-xl font-zen font-bold text-gray-900", children: "Nipo School" })] }), _jsx("button", { onClick: onClose, className: "lg:hidden p-2 rounded-md text-gray-600 hover:bg-gray-100 transition-colors", children: _jsx(X, { className: "w-5 h-5" }) })] }), _jsxs("nav", { className: "p-4 space-y-1", children: [process.env.NODE_ENV === 'development' && (_jsxs("div", { className: "mb-4 p-3 bg-blue-50 rounded-lg border border-blue-200", children: [_jsx("p", { className: "text-xs text-blue-700 font-medium", children: "Debug Info:" }), _jsxs("p", { className: "text-xs text-blue-600", children: ["Role: ", userRole] }), _jsxs("p", { className: "text-xs text-blue-600", children: ["Email: ", user?.email] }), _jsxs("p", { className: "text-xs text-blue-600", children: ["Items: ", navigationItems.length] })] })), navigationItems.map((item) => {
                            const Icon = item.icon;
                            const active = isActive(item.path);
                            return (_jsxs(Link, { to: item.path, onClick: onClose, className: clsx('flex items-center gap-3 px-4 py-3 rounded-lg transition-colors', active
                                    ? 'bg-[var(--color-indigo)] text-white'
                                    : 'text-gray-700 hover:bg-gray-100'), children: [_jsx(Icon, { className: "w-5 h-5" }), _jsx("span", { className: "font-medium", children: item.name })] }, item.path));
                        })] })] }) }));
};
