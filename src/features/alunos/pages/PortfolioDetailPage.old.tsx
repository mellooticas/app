import { ArrowLeft, Edit, Eye, Globe, Lock, Plus, Trash2 } from 'lucide-react'
import { useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { NipoButton } from '../../../components/design/NipoButton'

interface Evidencia {
  id: string
  titulo: string
  tipo: 'video' | 'audio' | 'imagem' | 'documento'
  url: string
  dataUpload: string
  descricao?: string
}

interface Portfolio {
  id: string
  titulo: string
  descricao: string
  visibilidade: 'turma' | 'publico' | 'privado'
  evidencias: Evidencia[]
  dataCriacao: string
  dataAtualizacao: string
}

export default function PortfolioDetailPage() {
  const { id } = useParams()
  const navigate = useNavigate()

  // Mock data - substituir por hook usePortfolio(id)
  const [portfolio] = useState<Portfolio>({
    id: id || '1',
    titulo: 'Minha Evolução no Violão',
    descricao: 'Registro da minha jornada aprendendo violão clássico, incluindo técnicas, peças e apresentações.',
    visibilidade: 'turma',
    dataCriacao: '2025-01-15',
    dataAtualizacao: '2025-02-01',
    evidencias: [
      {
        id: '1',
        titulo: 'Primeira Música Completa',
        tipo: 'video',
        url: 'https://example.com/video1',
        dataUpload: '2025-01-20',
        descricao: 'Execução de Asa Branca no violão',
      },
      {
        id: '2',
        titulo: 'Estudo de Escalas',
        tipo: 'audio',
        url: 'https://example.com/audio1',
        dataUpload: '2025-01-25',
        descricao: 'Prática de escala maior em todas as posições',
      },
      {
        id: '3',
        titulo: 'Partitura Anotada',
        tipo: 'imagem',
        url: 'https://example.com/img1',
        dataUpload: '2025-01-30',
        descricao: 'Partitura do Choro nº1 com anotações de dinâmica',
      },
    ],
  })

  const [isEditing, setIsEditing] = useState(false)

  const getVisibilityIcon = (visibilidade: string) => {
    switch (visibilidade) {
      case 'publico':
        return <Globe className="w-5 h-5" />
      case 'privado':
        return <Lock className="w-5 h-5" />
      case 'turma':
        return <Eye className="w-5 h-5" />
      default:
        return null
    }
  }

  const getVisibilityLabel = (visibilidade: string) => {
    switch (visibilidade) {
      case 'publico':
        return 'Público'
      case 'privado':
        return 'Privado'
      case 'turma':
        return 'Turma'
      default:
        return visibilidade
    }
  }

  const getTipoIcon = (tipo: string) => {
    switch (tipo) {
      case 'video':
        return '🎥'
      case 'audio':
        return '🎵'
      case 'imagem':
        return '🖼️'
      case 'documento':
        return '📄'
      default:
        return '📎'
    }
  }

  const handleDeleteEvidencia = (evidenciaId: string) => {
    if (confirm('Deseja realmente excluir esta evidência?')) {
      // TODO: Integrar com Supabase
      console.log('Deletando evidência:', evidenciaId)
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      {/* Header */}
      <div className="mb-8">
        <button
          onClick={() => navigate(-1)}
          className="flex items-center gap-2 text-gray-600 hover:text-gray-900 mb-4"
        >
          <ArrowLeft className="w-5 h-5" />
          Voltar
        </button>
        <div className="flex items-start justify-between">
          <div>
            <h1 className="text-3xl font-bold text-gray-900 mb-2">{portfolio.titulo}</h1>
            <div className="flex items-center gap-4 text-sm text-gray-600">
              <div className="flex items-center gap-1">
                {getVisibilityIcon(portfolio.visibilidade)}
                <span>{getVisibilityLabel(portfolio.visibilidade)}</span>
              </div>
              <span>Criado em {new Date(portfolio.dataCriacao).toLocaleDateString('pt-BR')}</span>
              <span>Atualizado em {new Date(portfolio.dataAtualizacao).toLocaleDateString('pt-BR')}</span>
            </div>
          </div>
          <div className="flex gap-2">
            <NipoButton variant="secondary" onClick={() => setIsEditing(!isEditing)}>
              <Edit className="w-4 h-4" />
              {isEditing ? 'Cancelar' : 'Editar'}
            </NipoButton>
          </div>
        </div>
      </div>

      {/* Descrição */}
      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6 mb-8">
        <h2 className="text-xl font-bold text-gray-900 mb-3">Descrição</h2>
        {isEditing ? (
          <textarea
            className="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent resize-none"
            rows={4}
            defaultValue={portfolio.descricao}
          />
        ) : (
          <p className="text-gray-700">{portfolio.descricao}</p>
        )}
      </div>

      {/* Evidências */}
      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl font-bold text-gray-900">
            Evidências ({portfolio.evidencias.length})
          </h2>
          <NipoButton>
            <Plus className="w-4 h-4" />
            Adicionar Evidência
          </NipoButton>
        </div>

        {portfolio.evidencias.length > 0 ? (
          <div className="space-y-4">
            {portfolio.evidencias.map((evidencia) => (
              <div
                key={evidencia.id}
                className="border border-gray-200 rounded-lg p-4 hover:border-blue-300 transition-colors"
              >
                <div className="flex items-start justify-between">
                  <div className="flex gap-4 flex-1">
                    <div className="w-16 h-16 bg-gray-100 rounded-lg flex items-center justify-center text-3xl">
                      {getTipoIcon(evidencia.tipo)}
                    </div>
                    <div className="flex-1">
                      <h3 className="font-semibold text-gray-900 mb-1">{evidencia.titulo}</h3>
                      <p className="text-sm text-gray-600 mb-2">{evidencia.descricao}</p>
                      <div className="flex items-center gap-4 text-xs text-gray-500">
                        <span className="capitalize">{evidencia.tipo}</span>
                        <span>Enviado em {new Date(evidencia.dataUpload).toLocaleDateString('pt-BR')}</span>
                      </div>
                    </div>
                  </div>
                  {isEditing && (
                    <button
                      onClick={() => handleDeleteEvidencia(evidencia.id)}
                      className="text-red-600 hover:text-red-700"
                    >
                      <Trash2 className="w-5 h-5" />
                    </button>
                  )}
                </div>
              </div>
            ))}
          </div>
        ) : (
          <div className="text-center py-12 text-gray-500">
            <p>Nenhuma evidência adicionada ainda</p>
          </div>
        )}
      </div>

      {/* Save Button (quando editando) */}
      {isEditing && (
        <div className="mt-6 flex justify-end">
          <NipoButton onClick={() => setIsEditing(false)}>
            Salvar Alterações
          </NipoButton>
        </div>
      )}
    </div>
  )
}
