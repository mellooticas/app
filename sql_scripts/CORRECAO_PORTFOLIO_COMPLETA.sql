-- CORREÇÃO COMPLETA - SISTEMA PORTFOLIO
-- Execute este script inteiro no Supabase SQL Editor

-- PASSO 1: Verificar e corrigir estrutura das tabelas
-- ================================================

-- Adicionar coluna configuracoes na tabela portfolios
ALTER TABLE portfolios ADD COLUMN IF NOT EXISTS configuracoes jsonb DEFAULT '{}'::jsonb;

-- Verificar se a coluna niveis_desempenho existe na tabela rubricas_avaliacao
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'rubricas_avaliacao' 
        AND column_name = 'niveis_desempenho'
        AND table_schema = 'public'
    ) THEN
        ALTER TABLE rubricas_avaliacao 
        ADD COLUMN niveis_desempenho jsonb NOT NULL DEFAULT '{}'::jsonb;
    END IF;
END $$;

-- PASSO 2: Inserir rubricas de avaliação
-- ======================================

-- Limpar rubricas existentes (se houver problemas)
-- DELETE FROM rubricas_avaliacao; -- Descomente se necessário

-- Rubrica para Metodologia Orff
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, metodologia_id, criterios, niveis_desempenho) 
SELECT 
    'Avaliação Orff Schulwerk',
    'Rubrica para avaliar desenvolvimento musical através da metodologia Orff',
    'metodologia',
    id,
    jsonb_build_object(
        'expressao_corporal', jsonb_build_object('peso', 25, 'descricao', 'Capacidade de expressar música através do movimento'),
        'criatividade_musical', jsonb_build_object('peso', 25, 'descricao', 'Improviso e criação musical'),
        'trabalho_colaborativo', jsonb_build_object('peso', 25, 'descricao', 'Participação em atividades coletivas'),
        'dominio_instrumental', jsonb_build_object('peso', 25, 'descricao', 'Uso de instrumentos de percussão Orff')
    ),
    jsonb_build_object(
        'iniciante', jsonb_build_object('faixa', '0-25', 'descricao', 'Necessita apoio constante'),
        'em_desenvolvimento', jsonb_build_object('faixa', '26-50', 'descricao', 'Demonstra compreensão básica'),
        'proficiente', jsonb_build_object('faixa', '51-75', 'descricao', 'Aplica conceitos adequadamente'),
        'avancado', jsonb_build_object('faixa', '76-100', 'descricao', 'Demonstra maestria e criatividade')
    )
FROM alpha_metodologias WHERE nome = 'Orff Schulwerk'
ON CONFLICT DO NOTHING;

-- Rubrica para Metodologia Kodály
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, metodologia_id, criterios, niveis_desempenho) 
SELECT 
    'Avaliação Kodály',
    'Rubrica para desenvolvimento da literacia musical através do método Kodály',
    'metodologia',
    id,
    jsonb_build_object(
        'solfejos', jsonb_build_object('peso', 30, 'descricao', 'Precisão na entoação usando dó móvel'),
        'leitura_musical', jsonb_build_object('peso', 25, 'descricao', 'Capacidade de ler partituras'),
        'manossolfa', jsonb_build_object('peso', 25, 'descricao', 'Uso correto dos gestos manuais'),
        'patrimonio_folclorico', jsonb_build_object('peso', 20, 'descricao', 'Conhecimento do repertório tradicional')
    ),
    jsonb_build_object(
        'iniciante', jsonb_build_object('faixa', '0-25', 'descricao', 'Reconhece elementos básicos'),
        'em_desenvolvimento', jsonb_build_object('faixa', '26-50', 'descricao', 'Aplica conceitos com orientação'),
        'proficiente', jsonb_build_object('faixa', '51-75', 'descricao', 'Usa ferramentas independentemente'),
        'avancado', jsonb_build_object('faixa', '76-100', 'descricao', 'Demonstra fluência e ensina outros')
    )
FROM alpha_metodologias WHERE nome = 'Kodály'
ON CONFLICT DO NOTHING;

-- Rubrica para Dalcroze
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, metodologia_id, criterios, niveis_desempenho) 
SELECT 
    'Avaliação Dalcroze',
    'Rubrica para euritmia e desenvolvimento rítmico-corporal',
    'metodologia',
    id,
    jsonb_build_object(
        'coordenacao_ritmica', jsonb_build_object('peso', 30, 'descricao', 'Sincronização corpo-música'),
        'expressividade', jsonb_build_object('peso', 25, 'descricao', 'Comunicação através do movimento'),
        'improvisacao', jsonb_build_object('peso', 25, 'descricao', 'Criação espontânea de movimentos'),
        'consciencia_espacial', jsonb_build_object('peso', 20, 'descricao', 'Uso adequado do espaço')
    ),
    jsonb_build_object(
        'iniciante', jsonb_build_object('faixa', '0-25', 'descricao', 'Movimentos básicos e hesitantes'),
        'em_desenvolvimento', jsonb_build_object('faixa', '26-50', 'descricao', 'Coordenação emergente'),
        'proficiente', jsonb_build_object('faixa', '51-75', 'descricao', 'Fluidez e expressividade'),
        'avancado', jsonb_build_object('faixa', '76-100', 'descricao', 'Maestria artística e liderança')
    )
FROM alpha_metodologias WHERE nome = 'Dalcroze'
ON CONFLICT DO NOTHING;

-- Rubrica Geral para Competências
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, criterios, niveis_desempenho) VALUES 
(
    'Avaliação de Competências Musicais',
    'Rubrica geral para avaliar competências musicais transversais',
    'competencia',
    jsonb_build_object(
        'criatividade', jsonb_build_object('peso', 20, 'descricao', 'Originalidade e inovação'),
        'colaboracao', jsonb_build_object('peso', 20, 'descricao', 'Trabalho em equipe efetivo'),
        'comunicacao', jsonb_build_object('peso', 20, 'descricao', 'Expressão clara de ideias musicais'),
        'pensamento_critico', jsonb_build_object('peso', 20, 'descricao', 'Análise e reflexão musical'),
        'autonomia', jsonb_build_object('peso', 20, 'descricao', 'Independência na aprendizagem')
    ),
    jsonb_build_object(
        'iniciante', jsonb_build_object('faixa', '0-25', 'descricao', 'Habilidades emergentes'),
        'em_desenvolvimento', jsonb_build_object('faixa', '26-50', 'descricao', 'Progresso consistente'),
        'proficiente', jsonb_build_object('faixa', '51-75', 'descricao', 'Competência estabelecida'),
        'avancado', jsonb_build_object('faixa', '76-100', 'descricao', 'Excelência e liderança')
    )
) ON CONFLICT DO NOTHING;

-- Rubrica para Peer Review
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, criterios, niveis_desempenho) VALUES 
(
    'Avaliação entre Pares',
    'Estrutura para feedback construtivo entre estudantes',
    'peer_review',
    jsonb_build_object(
        'feedback_construtivo', jsonb_build_object('peso', 25, 'descricao', 'Qualidade dos comentários oferecidos'),
        'especificidade', jsonb_build_object('peso', 25, 'descricao', 'Detalhamento das observações'),
        'encorajamento', jsonb_build_object('peso', 25, 'descricao', 'Positividade e motivação'),
        'sugestoes_praticas', jsonb_build_object('peso', 25, 'descricao', 'Propostas viáveis de melhoria')
    ),
    jsonb_build_object(
        'iniciante', jsonb_build_object('faixa', '0-25', 'descricao', 'Comentários superficiais'),
        'em_desenvolvimento', jsonb_build_object('faixa', '26-50', 'descricao', 'Observações úteis básicas'),
        'proficiente', jsonb_build_object('faixa', '51-75', 'descricao', 'Feedback detalhado e construtivo'),
        'avancado', jsonb_build_object('faixa', '76-100', 'descricao', 'Mentoria excepcional')
    )
) ON CONFLICT DO NOTHING;

-- PASSO 3: Verificação final
-- ==========================

-- Mostrar rubricas inseridas
SELECT 
    nome, 
    tipo, 
    ativo,
    CASE WHEN metodologia_id IS NOT NULL THEN 
        (SELECT nome FROM alpha_metodologias WHERE id = rubricas_avaliacao.metodologia_id)
    ELSE 'Geral' END as metodologia
FROM rubricas_avaliacao 
ORDER BY tipo, nome;

-- Mostrar contagem por tipo
SELECT 
    tipo, 
    COUNT(*) as quantidade 
FROM rubricas_avaliacao 
WHERE ativo = true
GROUP BY tipo
ORDER BY tipo;