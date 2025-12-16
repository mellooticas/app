import { createClient } from '@/lib/supabase/server'
import { FileText, Download, Briefcase } from 'lucide-react'
import Link from 'next/link'

export default async function DocumentosPage() {
    const supabase = await createClient()

    // Fetch documents
    const { data: documentos } = await supabase
        .from('documentos_institucionais')
        .select('*')
        .order('categoria', { ascending: true }); // Default sort

    // Group by category for better UI
    const groupedDocs: Record<string, any[]> = {};
    if (documentos) {
        documentos.forEach((doc: any) => {
            const cat = doc.categoria || 'Geral';
            if (!groupedDocs[cat]) groupedDocs[cat] = [];
            groupedDocs[cat].push(doc);
        });
    }

    const categories = Object.keys(groupedDocs).sort();

    return (
        <div className="space-y-8">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-3xl font-bold text-gray-900">Documentos Institucionais</h1>
                    <p className="text-gray-500">Modelos, regulamentos e materiais administrativos.</p>
                </div>
            </div>

            {categories.length > 0 ? (
                <div className="space-y-12">
                    {categories.map(category => (
                        <div key={category}>
                            <h2 className="text-xl font-bold text-gray-800 mb-4 flex items-center gap-2 border-b pb-2">
                                <Briefcase className="w-5 h-5 text-indigo-600" />
                                {category}
                            </h2>
                            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                                {groupedDocs[category].map((doc: any) => (
                                    <div key={doc.id} className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm hover:shadow-md transition-shadow group">
                                        <div className="flex items-start justify-between mb-4">
                                            <div className="p-3 bg-gray-50 rounded-lg group-hover:bg-indigo-50 transition-colors">
                                                <FileText className="w-8 h-8 text-gray-400 group-hover:text-indigo-600" />
                                            </div>
                                        </div>
                                        <h3 className="font-bold text-gray-900 mb-2 group-hover:text-indigo-600 transition-colors">
                                            {doc.titulo}
                                        </h3>
                                        <p className="text-sm text-gray-500 line-clamp-3 mb-6">
                                            {doc.descricao || 'Sem descrição.'}
                                        </p>

                                        {doc.url_arquivo ? (
                                            <Link
                                                href={doc.url_arquivo}
                                                target="_blank"
                                                className="inline-flex items-center gap-2 text-sm font-medium text-indigo-600 hover:text-indigo-800"
                                            >
                                                <Download className="w-4 h-4" />
                                                Baixar Arquivo
                                            </Link>
                                        ) : (
                                            <span className="text-sm text-gray-400 italic">Arquivo indisponível</span>
                                        )}
                                    </div>
                                ))}
                            </div>
                        </div>
                    ))}
                </div>
            ) : (
                <div className="text-center py-12 text-gray-500 bg-white rounded-xl border border-dashed">
                    Nenhum documento institucional encontrado.
                </div>
            )}
        </div>
    )
}
