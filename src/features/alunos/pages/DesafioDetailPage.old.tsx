import { ArrowLeft, Award, Calendar, Clock, Target, Upload } from 'lucide-react'
import { useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { NipoButton } from '../../../components/design/NipoButton'

interface Desafio {
  id: string
  titulo: string
  descricao: string
  dificuldade: 'iniciante' | 'intermediario' | 'avancado'
  pontos: number
  prazo: string
  instrumento: string
  status: 'disponivel' | 'em_andamento' | 'concluido' | 'expirado'
  objetivos: string[]
  rubrica: {
    criterio: string
    peso: number
    descricao: string
  }[]
  materiaisApoio: {
    titulo: string
    url: string
    tipo: 'pdf' | 'video' | 'audio'
  }[]
}

export default function DesafioDetailPage() {
  const { id } = useParams()
  const navigate = useNavigate()
  const [submissao, setSubmissao] = useState('')
  const [arquivoSelecionado, setArquivoSelecionado] = useState<File | null>(null)

  // Mock data - substituir por hook useDesafio(id)
  const desafio: Desafio = {
    id: id || '1',
    titulo: 'Escalas Maiores em Todas as Tonalidades',
    descricao:
      'Demonstre domínio das escalas maiores em todas as 12 tonalidades. Execute cada escala de forma fluída, mantendo tempo constante e articulação clara.',
    dificuldade: 'iniciante',
    pontos: 50,
    prazo: '2025-02-15',
    instrumento: 'Violão',
    status: 'disponivel',
    objetivos: [
      'Executar escalas maiores em todas as tonalidades',
      'Manter tempo constante de 60 BPM',
      'Demonstrar articulação clara em cada nota',
      'Aplicar digitação correta',
    ],
    rubrica: [
      {
        criterio: 'Precisão Técnica',
        peso: 40,
        descricao: 'Execução correta das notas, digitação e postura',
      },
      {
        criterio: 'Controle de Tempo',
        peso: 30,
        descricao: 'Manutenção de tempo constante e regular',
      },
      {
        criterio: 'Articulação',
        peso: 20,
        descricao: 'Clareza e consistência na articulação',
      },
      {
        criterio: 'Musicalidade',
        peso: 10,
        descricao: 'Expressão musical e dinâmica',
      },
    ],
    materiaisApoio: [
      {
        titulo: 'Guia de Escalas Maiores',
        url: '#',
        tipo: 'pdf',
      },
      {
        titulo: 'Vídeo Demonstrativo',
        url: '#',
        tipo: 'video',
      },
    ],
  }

  const getDificuldadeColor = (dificuldade: string) => {
    switch (dificuldade) {
      case 'iniciante':
        return 'bg-green-100 text-green-700'
      case 'intermediario':
        return 'bg-yellow-100 text-yellow-700'
      case 'avancado':
        return 'bg-red-100 text-red-700'
      default:
        return 'bg-gray-100 text-gray-700'
    }
  }

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      setArquivoSelecionado(e.target.files[0])
    }
  }

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    // TODO: Integrar com Supabase
    console.log('Submetendo desafio:', { submissao, arquivo: arquivoSelecionado })
    alert('Desafio submetido com sucesso!')
    navigate(-1)
  }

  const diasRestantes = Math.ceil(
    (new Date(desafio.prazo).getTime() - new Date().getTime()) / (1000 * 60 * 60 * 24)
  )

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
            <h1 className="text-3xl font-bold text-gray-900 mb-2">{desafio.titulo}</h1>
            <div className="flex items-center gap-3">
              <span className={`px-3 py-1 rounded-full text-sm font-medium ${getDificuldadeColor(desafio.dificuldade)}`}>
                {desafio.dificuldade}
              </span>
              <span className="text-gray-600">{desafio.instrumento}</span>
            </div>
          </div>
          <div className="text-right">
            <div className="flex items-center gap-2 text-2xl font-bold text-blue-600 mb-1">
              <Award className="w-6 h-6" />
              {desafio.pontos} pts
            </div>
            <div className="text-sm text-gray-600">
              {diasRestantes > 0 ? `${diasRestantes} dias restantes` : 'Prazo expirado'}
            </div>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {/* Conteúdo Principal */}
        <div className="lg:col-span-2 space-y-8">
          {/* Descrição */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <h2 className="text-xl font-bold text-gray-900 mb-4">Descrição</h2>
            <p className="text-gray-700 leading-relaxed">{desafio.descricao}</p>
          </div>

          {/* Objetivos */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <h2 className="text-xl font-bold text-gray-900 mb-4">Objetivos de Aprendizagem</h2>
            <ul className="space-y-3">
              {desafio.objetivos.map((objetivo, index) => (
                <li key={index} className="flex items-start gap-3">
                  <Target className="w-5 h-5 text-blue-600 mt-0.5 flex-shrink-0" />
                  <span className="text-gray-700">{objetivo}</span>
                </li>
              ))}
            </ul>
          </div>

          {/* Rubrica de Avaliação */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <h2 className="text-xl font-bold text-gray-900 mb-4">Rubrica de Avaliação</h2>
            <div className="space-y-4">
              {desafio.rubrica.map((item, index) => (
                <div key={index} className="border-l-4 border-blue-500 pl-4">
                  <div className="flex items-center justify-between mb-1">
                    <h3 className="font-semibold text-gray-900">{item.criterio}</h3>
                    <span className="text-sm font-medium text-blue-600">{item.peso}%</span>
                  </div>
                  <p className="text-sm text-gray-600">{item.descricao}</p>
                </div>
              ))}
            </div>
          </div>

          {/* Formulário de Submissão */}
          {desafio.status !== 'concluido' && desafio.status !== 'expirado' && (
            <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
              <h2 className="text-xl font-bold text-gray-900 mb-4">Submeter Desafio</h2>
              <form onSubmit={handleSubmit} className="space-y-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Descrição da Submissão
                  </label>
                  <textarea
                    value={submissao}
                    onChange={(e) => setSubmissao(e.target.value)}
                    rows={4}
                    className="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent resize-none"
                    placeholder="Descreva sua execução, desafios enfrentados e aprendizados..."
                    required
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Arquivo (vídeo ou áudio)
                  </label>
                  <div className="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center hover:border-blue-400 transition-colors">
                    <input
                      type="file"
                      accept="video/*,audio/*"
                      onChange={handleFileChange}
                      className="hidden"
                      id="file-upload"
                    />
                    <label htmlFor="file-upload" className="cursor-pointer">
                      <Upload className="w-12 h-12 text-gray-400 mx-auto mb-2" />
                      <p className="text-sm text-gray-600">
                        {arquivoSelecionado ? arquivoSelecionado.name : 'Clique para selecionar arquivo'}
                      </p>
                      <p className="text-xs text-gray-500 mt-1">MP4, MP3, WAV (máx. 100MB)</p>
                    </label>
                  </div>
                </div>
                <div className="flex justify-end gap-3">
                  <NipoButton type="button" variant="secondary" onClick={() => navigate(-1)}>
                    Cancelar
                  </NipoButton>
                  <NipoButton type="submit">Submeter Desafio</NipoButton>
                </div>
              </form>
            </div>
          )}
        </div>

        {/* Sidebar */}
        <div className="space-y-6">
          {/* Informações */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <h3 className="font-bold text-gray-900 mb-4">Informações</h3>
            <div className="space-y-3">
              <div className="flex items-start gap-3">
                <Calendar className="w-5 h-5 text-gray-400 mt-0.5" />
                <div>
                  <p className="text-sm text-gray-600">Prazo</p>
                  <p className="font-medium text-gray-900">{new Date(desafio.prazo).toLocaleDateString('pt-BR')}</p>
                </div>
              </div>
              <div className="flex items-start gap-3">
                <Clock className="w-5 h-5 text-gray-400 mt-0.5" />
                <div>
                  <p className="text-sm text-gray-600">Status</p>
                  <p className="font-medium text-gray-900 capitalize">{desafio.status.replace('_', ' ')}</p>
                </div>
              </div>
              <div className="flex items-start gap-3">
                <Award className="w-5 h-5 text-gray-400 mt-0.5" />
                <div>
                  <p className="text-sm text-gray-600">Pontuação</p>
                  <p className="font-medium text-gray-900">{desafio.pontos} pontos</p>
                </div>
              </div>
            </div>
          </div>

          {/* Materiais de Apoio */}
          {desafio.materiaisApoio.length > 0 && (
            <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
              <h3 className="font-bold text-gray-900 mb-4">Materiais de Apoio</h3>
              <div className="space-y-2">
                {desafio.materiaisApoio.map((material, index) => (
                  <a
                    key={index}
                    href={material.url}
                    className="flex items-center gap-2 text-blue-600 hover:text-blue-700 text-sm"
                  >
                    <span>{material.tipo === 'pdf' ? '📄' : material.tipo === 'video' ? '🎥' : '🎵'}</span>
                    {material.titulo}
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
