'use client';

import { ArrowLeft } from 'lucide-react';
import Link from 'next/link';
import RepertorioForm from '../../components/RepertorioForm';

export default function NovoRepertorioPage() {
    return (
        <div className="max-w-3xl mx-auto">
            <div className="mb-8 flex items-center gap-4">
                <Link
                    href="/professores/repertorio"
                    className="p-2 bg-white rounded-full hover:bg-gray-100 transition-colors"
                >
                    <ArrowLeft className="w-5 h-5 text-gray-600" />
                </Link>
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Novo Material</h1>
                    <p className="text-gray-600">Adicione uma nova música ou exercício ao repertório</p>
                </div>
            </div>

            <RepertorioForm />
        </div>
    );
}
