import { jsx as _jsx, jsxs as _jsxs } from "react/jsx-runtime";
/**
 * 🏗️ PROTECTED LAYOUT - Layout para Páginas Autenticadas
 *
 * Layout usado para páginas que requerem autenticação:
 * - Dashboards (Aluno, Professor, Admin)
 * - Todas as páginas protegidas por role
 */
import { useState } from 'react';
import { Outlet } from 'react-router-dom';
import { Sidebar } from './Sidebar';
import { Breadcrumbs } from './Breadcrumbs';
import { Menu } from 'lucide-react';
export const ProtectedLayout = () => {
    const [sidebarOpen, setSidebarOpen] = useState(false);
    return (_jsxs("div", { className: "min-h-screen bg-gray-50", children: [sidebarOpen && (_jsx("div", { className: "fixed inset-0 bg-black bg-opacity-50 z-20 lg:hidden", onClick: () => setSidebarOpen(false) })), _jsx(Sidebar, { isOpen: sidebarOpen, onClose: () => setSidebarOpen(false) }), _jsxs("div", { className: "lg:pl-64", children: [_jsx("div", { className: "sticky top-0 z-10 bg-white shadow-sm", children: _jsxs("div", { className: "flex items-center justify-between px-4 py-3", children: [_jsx("button", { onClick: () => setSidebarOpen(true), className: "lg:hidden p-2 rounded-md text-gray-600 hover:bg-gray-100", children: _jsx(Menu, { className: "w-6 h-6" }) }), _jsx("div", { className: "flex-1", children: _jsx(Breadcrumbs, {}) }), _jsx("div", { className: "flex items-center gap-4" })] }) }), _jsx("main", { className: "p-6", children: _jsx(Outlet, {}) })] })] }));
};
