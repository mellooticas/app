import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, Save, Upload } from 'lucide-react'
import { ROUTES } from '@/lib/constants/routes'
import { NipoButton } from '@/components/design-system/NipoButton'
import { NipoInput } from '@/components/design-system/NipoInput'

export default function PortfolioCreatePage() {
  const navigate = useNavigate()
  const [isLoading, setIsLoading] = useState(false)
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    visibility: 'turma' as 'public' | 'private' | 'turma',
  })

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)

    try {
      // TODO: Implementar hook usePortfolio para criar no Supabase
      await new Promise((resolve) => setTimeout(resolve, 1000))
      
      // Redirecionar para lista
      navigate(ROUTES.ALUNO.PORTFOLIO.INDEX)
    } catch (error) {
      console.error('Erro ao criar portfólio:', error)
    } finally {
      setIsLoading(false)
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
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Criar Novo Portfólio</h1>
        <p className="text-gray-600">Organize suas evidências de aprendizado em um portfólio</p>
      </div>

      {/* Form */}
      <div className="max-w-2xl">
        <form onSubmit={handleSubmit} className="bg-white rounded-xl shadow-sm border border-gray-200 p-8">
          {/* Título */}
          <div className="mb-6">
            <NipoInput
              label="Título do Portfólio"
              placeholder="Ex: Meu Progresso no Violão"
              value={formData.title}
              onChange={(e) => setFormData({ ...formData, title: e.target.value })}
              required
            />
          </div>

          {/* Descrição */}
          <div className="mb-6">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Descrição
            </label>
            <textarea
              rows={4}
              className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
              placeholder="Descreva o que você vai registrar neste portfólio..."
              value={formData.description}
              onChange={(e) => setFormData({ ...formData, description: e.target.value })}
              required
            />
          </div>

          {/* Visibilidade */}
          <div className="mb-8">
            <label className="block text-sm font-medium text-gray-700 mb-3">
              Quem pode ver este portfólio?
            </label>
            <div className="space-y-3">
              <label className="flex items-start gap-3 p-4 border-2 border-gray-200 rounded-lg cursor-pointer hover:border-indigo-300 transition-colors">
                <input
                  type="radio"
                  name="visibility"
                  value="turma"
                  checked={formData.visibility === 'turma'}
                  onChange={(e) => setFormData({ ...formData, visibility: e.target.value as any })}
                  className="mt-1"
                />
                <div>
                  <div className="font-medium text-gray-900">Apenas minha turma</div>
                  <div className="text-sm text-gray-600">Visível para professores e colegas da turma</div>
                </div>
              </label>

              <label className="flex items-start gap-3 p-4 border-2 border-gray-200 rounded-lg cursor-pointer hover:border-indigo-300 transition-colors">
                <input
                  type="radio"
                  name="visibility"
                  value="public"
                  checked={formData.visibility === 'public'}
                  onChange={(e) => setFormData({ ...formData, visibility: e.target.value as any })}
                  className="mt-1"
                />
                <div>
                  <div className="font-medium text-gray-900">Público</div>
                  <div className="text-sm text-gray-600">Qualquer pessoa pode ver</div>
                </div>
              </label>

              <label className="flex items-start gap-3 p-4 border-2 border-gray-200 rounded-lg cursor-pointer hover:border-indigo-300 transition-colors">
                <input
                  type="radio"
                  name="visibility"
                  value="private"
                  checked={formData.visibility === 'private'}
                  onChange={(e) => setFormData({ ...formData, visibility: e.target.value as any })}
                  className="mt-1"
                />
                <div>
                  <div className="font-medium text-gray-900">Privado</div>
                  <div className="text-sm text-gray-600">Apenas eu posso ver</div>
                </div>
              </label>
            </div>
          </div>

          {/* Actions */}
          <div className="flex gap-4">
            <NipoButton
              type="submit"
              variant="primary"
              isLoading={isLoading}
              icon={<Save className="w-5 h-5" />}
              className="flex-1"
            >
              Criar Portfólio
            </NipoButton>
            <NipoButton
              type="button"
              variant="outline"
              onClick={() => navigate(-1)}
              disabled={isLoading}
            >
              Cancelar
            </NipoButton>
          </div>
        </form>
      </div>
    </div>
  )
}
