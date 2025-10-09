-- AJUSTES PARA SISTEMA PORTFOLIO
-- Execute após o script principal

-- Adicionar coluna configuracoes na tabela portfolios
ALTER TABLE portfolios ADD COLUMN IF NOT EXISTS configuracoes jsonb DEFAULT '{}'::jsonb;

-- Verificar estrutura da tabela rubricas_avaliacao
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'rubricas_avaliacao' 
AND table_schema = 'public'
ORDER BY ordinal_position;

-- Adicionar coluna niveis_desempenho se não existir
ALTER TABLE rubricas_avaliacao 
ADD COLUMN IF NOT EXISTS niveis_desempenho jsonb NOT NULL DEFAULT '{}'::jsonb;

-- Verificar se as rubricas foram inseridas
SELECT nome, tipo, ativo FROM rubricas_avaliacao;

-- Se não houver rubricas, executar inserções novamente:
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, metodologia_id, criterios, niveis_desempenho) 
SELECT 
    'Avaliação Orff Schulwerk',
    'Rubrica para avaliar desenvolvimento musical através da metodologia Orff',
    'metodologia',
    id,
    '{"expressao_corporal": {"peso": 25, "descricao": "Capacidade de expressar música através do movimento"}, "criatividade_musical": {"peso": 25, "descricao": "Improviso e criação musical"}, "trabalho_colaborativo": {"peso": 25, "descricao": "Participação em atividades coletivas"}, "dominio_instrumental": {"peso": 25, "descricao": "Uso de instrumentos de percussão Orff"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Necessita apoio constante"}, "em_desenvolvimento": {"faixa": "26-50", "descricao": "Demonstra compreensão básica"}, "proficiente": {"faixa": "51-75", "descricao": "Aplica conceitos adequadamente"}, "avancado": {"faixa": "76-100", "descricao": "Demonstra maestria e criatividade"}}'::jsonb
FROM alpha_metodologias WHERE nome = 'Orff Schulwerk'
ON CONFLICT DO NOTHING;

INSERT INTO rubricas_avaliacao (nome, descricao, tipo, metodologia_id, criterios, niveis_desempenho) 
SELECT 
    'Avaliação Kodály',
    'Rubrica para desenvolvimento da literacia musical através do método Kodály',
    'metodologia',
    id,
    '{"solfejos": {"peso": 30, "descricao": "Precisão na entoação usando dó móvel"}, "leitura_musical": {"peso": 25, "descricao": "Capacidade de ler partituras"}, "manossolfa": {"peso": 25, "descricao": "Uso correto dos gestos manuais"}, "patrimonio_folclorico": {"peso": 20, "descricao": "Conhecimento do repertório tradicional"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Reconhece elementos básicos"}, "em_desenvolvimento": {"faixa": "26-50", "descricao": "Aplica conceitos com orientação"}, "proficiente": {"faixa": "51-75", "descricao": "Usa ferramentas independentemente"}, "avancado": {"faixa": "76-100", "descricao": "Demonstra fluência e ensina outros"}}'::jsonb
FROM alpha_metodologias WHERE nome = 'Kodály'
ON CONFLICT DO NOTHING;

INSERT INTO rubricas_avaliacao (nome, descricao, tipo, metodologia_id, criterios, niveis_desempenho) 
SELECT 
    'Avaliação Dalcroze',
    'Rubrica para euritmia e desenvolvimento rítmico-corporal',
    'metodologia',
    id,
    '{"coordenacao_ritmica": {"peso": 30, "descricao": "Sincronização corpo-música"}, "expressividade": {"peso": 25, "descricao": "Comunicação através do movimento"}, "improvisacao": {"peso": 25, "descricao": "Criação espontânea de movimentos"}, "consciencia_espacial": {"peso": 20, "descricao": "Uso adequado do espaço"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Movimentos básicos e hesitantes"}, "em_desenvolvimento": {"faixa": "26-50", "descricao": "Coordenação emergente"}, "proficiente": {"faixa": "51-75", "descricao": "Fluidez e expressividade"}, "avancado": {"faixa": "76-100", "descricao": "Maestria artística e liderança"}}'::jsonb
FROM alpha_metodologias WHERE nome = 'Dalcroze'
ON CONFLICT DO NOTHING;

INSERT INTO rubricas_avaliacao (nome, descricao, tipo, criterios, niveis_desempenho) VALUES 
(
    'Avaliação de Competências Musicais',
    'Rubrica geral para avaliar competências musicais transversais',
    'competencia',
    '{"criatividade": {"peso": 20, "descricao": "Originalidade e inovação"}, "colaboracao": {"peso": 20, "descricao": "Trabalho em equipe efetivo"}, "comunicacao": {"peso": 20, "descricao": "Expressão clara de ideias musicais"}, "pensamento_critico": {"peso": 20, "descricao": "Análise e reflexão musical"}, "autonomia": {"peso": 20, "descricao": "Independência na aprendizagem"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Habilidades emergentes"}, "em_desenvolvimento": {"faixa": "26-50", "descricao": "Progresso consistente"}, "proficiente": {"faixa": "51-75", "descricao": "Competência estabelecida"}, "avancado": {"faixa": "76-100", "descricao": "Excelência e liderança"}}'::jsonb
) ON CONFLICT DO NOTHING;

INSERT INTO rubricas_avaliacao (nome, descricao, tipo, criterios, niveis_desempenho) VALUES 
(
    'Avaliação entre Pares',
    'Estrutura para feedback construtivo entre estudantes',
    'peer_review',
    '{"feedback_construtivo": {"peso": 25, "descricao": "Qualidade dos comentários oferecidos"}, "especificidade": {"peso": 25, "descricao": "Detalhamento das observações"}, "encorajamento": {"peso": 25, "descricao": "Positividade e motivação"}, "sugestoes_praticas": {"peso": 25, "descricao": "Propostas viáveis de melhoria"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Comentários superficiais"}, "em_desenvolvimento": {"faixa": "26-50", "descricao": "Observações úteis básicas"}, "proficiente": {"faixa": "51-75", "descricao": "Feedback detalhado e construtivo"}, "avancado": {"faixa": "76-100", "descricao": "Mentoria excepcional"}}'::jsonb
) ON CONFLICT DO NOTHING;