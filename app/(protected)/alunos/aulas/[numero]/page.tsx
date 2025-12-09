import { Suspense } from 'react'
import { notFound } from 'next/navigation'
import { 
  Calendar, 
  Clock, 
  Target, 
  Award, 
  BookOpen, 
  Music, 
  Video, 
  FileText,
  ChevronLeft,
  ChevronRight,
  CheckCircle,
  PlayCircle,
  Download
} from 'lucide-react'
import Link from 'next/link'
import { 
  getAulaPorNumero,
  getMetodologiasAula,
  getInstrumentosAula,
  getRepertorioAula,
  getVideosAula,
  getPreRequisitosAula,
  getProximasAulas,
  getProgressoAula
} from '@/src/lib/supabase/queries/aulas'
import { STATUS_CONFIG } from '@/src/lib/types/aulas'

interface PageProps {
  params: Promise<{ numero: string }>
}

/**
 * 📖 DETALHES DA AULA - Método Alpha
 * Página completa com todos os recursos de aprendizado
 */

export async function generateMetadata({ params }: PageProps) {
  const resolvedParams = await params
  const numero = parseInt(resolvedParams.numero)
  const aula = await getAulaPorNumero(numero)
  
  return {
    title: aula ? `Aula ${numero}: ${aula.titulo} | Nipo School` : 'Aula não encontrada',
    description: aula?.objetivo_didatico || 'Aprenda música com o Método Alpha',
  }
}

async function AulaDetalhesContent({ numero }: { numero: number }) {
  // Buscar todos os dados da aula
  const aula = await getAulaPorNumero(numero)
  
  if (!aula) {
    notFound()
  }

  // Buscar recursos complementares
  const [metodologias, instrumentos, repertorio, videos, preRequisitos, proximasAulas] = await Promise.all([
    getMetodologiasAula(aula.id),
    getInstrumentosAula(aula.id),
    getRepertorioAula(aula.id),
    getVideosAula(aula.id),
    getPreRequisitosAula(aula.id),
    getProximasAulas(numero)
  ])

  // Configuração do status
  const statusConfig = STATUS_CONFIG[aula.status as keyof typeof STATUS_CONFIG]
  const StatusIcon = statusConfig?.icon || CheckCircle

  return (
    <div className="space-y-6">
      {/* Header da Aula */}
      <div className="bg-gradient-to-r from-blue-600 to-indigo-600 rounded-xl p-8 text-white">
        <div className="flex items-start justify-between mb-4">
          <div className="flex-1">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-12 h-12 bg-white/20 rounded-xl flex items-center justify-center font-bold text-xl">
                {numero}
              </div>
              <div>
                <div className="text-sm text-blue-100 mb-1">Aula {numero} de 29</div>
                <h1 className="text-3xl font-bold">{aula.titulo}</h1>
              </div>
            </div>
            
            <div className="flex flex-wrap items-center gap-4 mt-4">
              {/* Data */}
              {aula.data_programada && (
                <div className="flex items-center gap-2 bg-white/10 px-4 py-2 rounded-lg">
                  <Calendar className="w-4 h-4" />
                  <span className="text-sm">
                    {new Date(aula.data_programada).toLocaleDateString('pt-BR', {
                      day: '2-digit',
                      month: 'short',
                      year: 'numeric'
                    })}
                  </span>
                </div>
              )}

              {/* Formato */}
              {aula.formato && (
                <div className="bg-white/10 px-4 py-2 rounded-lg">
                  <span className="text-sm capitalize">{aula.formato}</span>
                </div>
              )}

              {/* Status */}
              {statusConfig && (
                <div 
                  className="flex items-center gap-2 px-4 py-2 rounded-lg"
                  style={{ backgroundColor: `${statusConfig.color}20` }}
                >
                  <StatusIcon className="w-4 h-4" />
                  <span className="text-sm">{statusConfig.label}</span>
                </div>
              )}

              {/* Desafio Alpha */}
              {aula.desafio_alpha && (
                <div className="flex items-center gap-2 bg-purple-500/30 px-4 py-2 rounded-lg">
                  <Award className="w-4 h-4" />
                  <span className="text-sm">Desafio Alpha</span>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Coluna Principal */}
        <div className="lg:col-span-2 space-y-6">
          {/* Objetivo Didático */}
          <div className="bg-white rounded-xl border border-gray-200 p-6">
            <div className="flex items-center gap-3 mb-4">
              <div className="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center">
                <Target className="w-5 h-5 text-blue-600" />
              </div>
              <h2 className="text-xl font-bold text-gray-900">Objetivo da Aula</h2>
            </div>
            <p className="text-gray-700 leading-relaxed">
              {aula.objetivo_didatico}
            </p>
          </div>

          {/* Resumo de Atividades */}
          {aula.resumo_atividades && (
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <div className="flex items-center gap-3 mb-4">
                <div className="w-10 h-10 bg-green-100 rounded-lg flex items-center justify-center">
                  <BookOpen className="w-5 h-5 text-green-600" />
                </div>
                <h2 className="text-xl font-bold text-gray-900">Atividades</h2>
              </div>
              <div className="prose prose-sm max-w-none">
                <p className="text-gray-700 leading-relaxed whitespace-pre-wrap">
                  {aula.resumo_atividades}
                </p>
              </div>
            </div>
          )}

          {/* Vídeos Educativos */}
          {videos && videos.length > 0 && (
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <div className="flex items-center gap-3 mb-4">
                <div className="w-10 h-10 bg-red-100 rounded-lg flex items-center justify-center">
                  <Video className="w-5 h-5 text-red-600" />
                </div>
                <h2 className="text-xl font-bold text-gray-900">
                  Vídeos ({videos.length})
                </h2>
              </div>
              <div className="space-y-4">
                {videos.map((video: any) => (
                  <div key={video.id} className="border border-gray-200 rounded-lg overflow-hidden hover:border-blue-300 transition-colors">
                    <div className="aspect-video bg-gray-900 relative group cursor-pointer">
                      {video.thumbnail_url ? (
                        <img 
                          src={video.thumbnail_url} 
                          alt={video.titulo}
                          className="w-full h-full object-cover"
                        />
                      ) : (
                        <div className="w-full h-full flex items-center justify-center">
                          <PlayCircle className="w-16 h-16 text-white/80" />
                        </div>
                      )}
                      <div className="absolute inset-0 bg-black/40 group-hover:bg-black/50 transition-colors flex items-center justify-center">
                        <PlayCircle className="w-16 h-16 text-white opacity-80 group-hover:opacity-100 group-hover:scale-110 transition-all" />
                      </div>
                      {video.duracao && (
                        <div className="absolute bottom-2 right-2 bg-black/80 px-2 py-1 rounded text-white text-xs">
                          {Math.floor(video.duracao / 60)}:{(video.duracao % 60).toString().padStart(2, '0')}
                        </div>
                      )}
                    </div>
                    <div className="p-4">
                      <h3 className="font-semibold text-gray-900 mb-1">{video.titulo}</h3>
                      {video.descricao && (
                        <p className="text-sm text-gray-600 line-clamp-2">{video.descricao}</p>
                      )}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Repertório */}
          {repertorio && repertorio.length > 0 && (
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <div className="flex items-center gap-3 mb-4">
                <div className="w-10 h-10 bg-purple-100 rounded-lg flex items-center justify-center">
                  <Music className="w-5 h-5 text-purple-600" />
                </div>
                <h2 className="text-xl font-bold text-gray-900">
                  Repertório ({repertorio.length})
                </h2>
              </div>
              <div className="space-y-3">
                {repertorio.map((musica: any) => (
                  <div key={musica.id} className="border border-gray-200 rounded-lg p-4 hover:border-purple-300 transition-colors">
                    <div className="flex items-start justify-between">
                      <div className="flex-1">
                        <h3 className="font-semibold text-gray-900">{musica.titulo}</h3>
                        {musica.compositor && (
                          <p className="text-sm text-gray-600">Compositor: {musica.compositor}</p>
                        )}
                        {musica.tonalidade && (
                          <p className="text-xs text-gray-500 mt-1">
                            Tom: {musica.tonalidade} | Andamento: {musica.andamento}
                          </p>
                        )}
                      </div>
                      <div className="flex gap-2">
                        {musica.partitura_url && (
                          <a 
                            href={musica.partitura_url}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="p-2 bg-blue-100 hover:bg-blue-200 rounded-lg transition-colors"
                            title="Baixar Partitura"
                          >
                            <FileText className="w-4 h-4 text-blue-600" />
                          </a>
                        )}
                        {musica.playback_url && (
                          <a 
                            href={musica.playback_url}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="p-2 bg-green-100 hover:bg-green-200 rounded-lg transition-colors"
                            title="Ouvir Playback"
                          >
                            <PlayCircle className="w-4 h-4 text-green-600" />
                          </a>
                        )}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Instrumentos */}
          {instrumentos && instrumentos.length > 0 && (
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <div className="flex items-center gap-3 mb-4">
                <div className="w-10 h-10 bg-orange-100 rounded-lg flex items-center justify-center">
                  <Music className="w-5 h-5 text-orange-600" />
                </div>
                <h2 className="text-xl font-bold text-gray-900">
                  Instrumentos Utilizados ({instrumentos.length})
                </h2>
              </div>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {instrumentos.map((instrumento: any) => (
                  <div key={instrumento.id} className="border border-gray-200 rounded-lg p-4 hover:border-orange-300 transition-colors">
                    <div className="flex gap-4">
                      {instrumento.imagem_url && (
                        <img 
                          src={instrumento.imagem_url} 
                          alt={instrumento.nome}
                          className="w-20 h-20 object-cover rounded-lg"
                        />
                      )}
                      <div className="flex-1">
                        <h3 className="font-semibold text-gray-900 mb-1">{instrumento.nome}</h3>
                        {instrumento.origem && (
                          <p className="text-xs text-gray-500 mb-2">Origem: {instrumento.origem}</p>
                        )}
                        {instrumento.curiosidades && (
                          <p className="text-sm text-gray-600 line-clamp-2">{instrumento.curiosidades}</p>
                        )}
                        {instrumento.disponivel_escola && (
                          <div className="mt-2 inline-flex items-center gap-1 bg-green-100 text-green-700 px-2 py-1 rounded text-xs">
                            <CheckCircle className="w-3 h-3" />
                            Disponível na escola
                          </div>
                        )}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Metodologias */}
          {metodologias && metodologias.length > 0 && (
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <div className="flex items-center gap-3 mb-4">
                <div className="w-10 h-10 bg-indigo-100 rounded-lg flex items-center justify-center">
                  <BookOpen className="w-5 h-5 text-indigo-600" />
                </div>
                <h2 className="text-xl font-bold text-gray-900">
                  Metodologias Aplicadas
                </h2>
              </div>
              <div className="space-y-4">
                {metodologias.map((metodologia: any) => (
                  <div key={metodologia.id} className="border border-gray-200 rounded-lg p-4">
                    <h3 className="font-semibold text-gray-900 mb-2">{metodologia.nome}</h3>
                    <p className="text-sm text-gray-600 mb-3">{metodologia.resumo}</p>
                    {metodologia.principios && Array.isArray(metodologia.principios) && (
                      <div className="flex flex-wrap gap-2">
                        {metodologia.principios.slice(0, 3).map((principio: string, idx: number) => (
                          <span key={idx} className="text-xs bg-indigo-100 text-indigo-700 px-2 py-1 rounded">
                            {principio}
                          </span>
                        ))}
                      </div>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Desafio Alpha */}
          {aula.desafio_alpha && (
            <div className="bg-gradient-to-r from-purple-50 to-pink-50 rounded-xl border border-purple-200 p-6">
              <div className="flex items-center gap-3 mb-4">
                <div className="w-10 h-10 bg-purple-600 rounded-lg flex items-center justify-center">
                  <Award className="w-5 h-5 text-white" />
                </div>
                <h2 className="text-xl font-bold text-gray-900">Desafio Alpha</h2>
              </div>
              <p className="text-gray-700 leading-relaxed mb-4">
                {aula.desafio_alpha}
              </p>
              <button className="w-full bg-purple-600 hover:bg-purple-700 text-white font-semibold py-3 px-6 rounded-lg transition-colors flex items-center justify-center gap-2">
                <Download className="w-5 h-5" />
                Enviar Minha Resposta
              </button>
            </div>
          )}
        </div>

        {/* Sidebar */}
        <div className="space-y-6">
          {/* Navegação entre Aulas */}
          <div className="bg-white rounded-xl border border-gray-200 p-6">
            <h3 className="font-bold text-gray-900 mb-4">Navegação</h3>
            <div className="space-y-2">
              {numero > 0 && (
                <Link 
                  href={`/alunos/aulas/${numero - 1}`}
                  className="flex items-center gap-2 p-3 bg-gray-50 hover:bg-gray-100 rounded-lg transition-colors"
                >
                  <ChevronLeft className="w-5 h-5 text-gray-600" />
                  <span className="text-sm text-gray-700">Aula {numero - 1}</span>
                </Link>
              )}
              {numero < 29 && (
                <Link 
                  href={`/alunos/aulas/${numero + 1}`}
                  className="flex items-center justify-between gap-2 p-3 bg-blue-50 hover:bg-blue-100 rounded-lg transition-colors"
                >
                  <span className="text-sm text-blue-700 font-medium">Próxima Aula {numero + 1}</span>
                  <ChevronRight className="w-5 h-5 text-blue-600" />
                </Link>
              )}
            </div>
          </div>

          {/* Pré-requisitos */}
          {preRequisitos && preRequisitos.length > 0 && (
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <h3 className="font-bold text-gray-900 mb-4">Pré-requisitos</h3>
              <div className="space-y-2">
                {preRequisitos.map((pre: any) => (
                  <Link
                    key={pre.id}
                    href={`/alunos/aulas/${pre.aula_prerequisito?.numero}`}
                    className="block p-3 bg-gray-50 hover:bg-gray-100 rounded-lg transition-colors"
                  >
                    <div className="text-sm font-medium text-gray-900">
                      Aula {pre.aula_prerequisito?.numero}
                    </div>
                    <div className="text-xs text-gray-600 line-clamp-1">
                      {pre.aula_prerequisito?.titulo}
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          )}

          {/* Próximas Aulas */}
          {proximasAulas && proximasAulas.length > 0 && (
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <h3 className="font-bold text-gray-900 mb-4">Continue Aprendendo</h3>
              <div className="space-y-2">
                {proximasAulas.map((proxima: any) => (
                  <Link
                    key={proxima.id}
                    href={`/alunos/aulas/${proxima.numero}`}
                    className="block p-3 bg-green-50 hover:bg-green-100 rounded-lg transition-colors"
                  >
                    <div className="text-sm font-medium text-gray-900">
                      Aula {proxima.numero}
                    </div>
                    <div className="text-xs text-gray-600 line-clamp-1">
                      {proxima.titulo}
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          )}

          {/* Materiais Extras */}
          {aula.materiais && aula.materiais.length > 0 && (
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <h3 className="font-bold text-gray-900 mb-4">Materiais</h3>
              <div className="space-y-2">
                {aula.materiais.map((material: any) => (
                  <a
                    key={material.id}
                    href={material.url || material.arquivo_path}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center gap-3 p-3 bg-gray-50 hover:bg-gray-100 rounded-lg transition-colors"
                  >
                    <FileText className="w-5 h-5 text-gray-600" />
                    <div className="flex-1 min-w-0">
                      <div className="text-sm font-medium text-gray-900 truncate">
                        {material.titulo}
                      </div>
                      <div className="text-xs text-gray-600 capitalize">
                        {material.tipo}
                      </div>
                    </div>
                    <Download className="w-4 h-4 text-gray-400" />
                  </a>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

export default async function AulaDetalhesPage({ params }: PageProps) {
  const resolvedParams = await params
  const numero = parseInt(resolvedParams.numero)

  if (isNaN(numero) || numero < 0 || numero > 29) {
    notFound()
  }

  return (
    <Suspense fallback={
      <div className="flex items-center justify-center min-h-screen">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Carregando aula...</p>
        </div>
      </div>
    }>
      <AulaDetalhesContent numero={numero} />
    </Suspense>
  )
}
