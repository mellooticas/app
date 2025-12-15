import { createClient } from '@/lib/supabase/server';
import { NextResponse } from 'next/server';

export async function GET() {
    try {
        const supabase = await createClient();

        // Primeiro tenta query simples para verificar se a tabela existe
        const { data, error } = await supabase
            .from('turmas')
            .select('*');

        if (error) {
            console.error('Erro ao buscar turmas:', error);
            return NextResponse.json({ 
                error: error.message,
                details: error.details,
                hint: error.hint,
                code: error.code 
            }, { status: 500 });
        }

        return NextResponse.json(data || []);
    } catch (error: any) {
        console.error('Erro na API turmas:', error);
        return NextResponse.json({ 
            error: error?.message || 'Erro interno',
            stack: process.env.NODE_ENV === 'development' ? error?.stack : undefined
        }, { status: 500 });
    }
}
