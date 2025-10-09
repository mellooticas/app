-- DIAGNÓSTICO E CORREÇÃO DIRETA
-- Execute linha por linha no Supabase para entender o problema

-- 1. Verificar se a tabela existe
SELECT EXISTS (
    SELECT 1 FROM information_schema.tables 
    WHERE table_name = 'rubricas_avaliacao' 
    AND table_schema = 'public'
);

-- 2. Ver todas as colunas da tabela
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns 
WHERE table_name = 'rubricas_avaliacao' 
AND table_schema = 'public'
ORDER BY ordinal_position;

-- 3. Se a tabela não tem a estrutura correta, recriar completamente
DROP TABLE IF EXISTS rubricas_avaliacao CASCADE;

CREATE TABLE rubricas_avaliacao (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    nome varchar(200) NOT NULL,
    descricao text,
    tipo varchar(50) CHECK (tipo IN ('metodologia', 'competencia', 'geral', 'peer_review')) NOT NULL,
    metodologia_id uuid REFERENCES alpha_metodologias(id) ON DELETE SET NULL,
    criterios jsonb NOT NULL DEFAULT '{}'::jsonb,
    niveis_desempenho jsonb NOT NULL DEFAULT '{}'::jsonb,
    peso_total integer DEFAULT 100,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- 4. Recriar índices
CREATE INDEX IF NOT EXISTS idx_rubricas_tipo ON rubricas_avaliacao(tipo);
CREATE INDEX IF NOT EXISTS idx_rubricas_ativo ON rubricas_avaliacao(ativo);

-- 5. Recriar RLS
ALTER TABLE rubricas_avaliacao ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Rubricas são acessíveis para leitura" 
ON rubricas_avaliacao FOR SELECT 
USING (ativo = true);

-- 6. Inserir as 5 rubricas usando sintaxe mais simples
INSERT INTO rubricas_avaliacao (nome, descricao, tipo, criterios, niveis_desempenho) VALUES 
(
    'Avaliação de Competências Musicais',
    'Rubrica geral para avaliar competências musicais transversais',
    'competencia',
    '{"criatividade": {"peso": 20, "descricao": "Originalidade e inovação"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Habilidades emergentes"}}'::jsonb
);

INSERT INTO rubricas_avaliacao (nome, descricao, tipo, criterios, niveis_desempenho) VALUES 
(
    'Avaliação entre Pares',
    'Estrutura para feedback construtivo entre estudantes',
    'peer_review',
    '{"feedback_construtivo": {"peso": 25, "descricao": "Qualidade dos comentários oferecidos"}}'::jsonb,
    '{"iniciante": {"faixa": "0-25", "descricao": "Comentários superficiais"}}'::jsonb
);

-- 7. Verificar inserção
SELECT id, nome, tipo, ativo FROM rubricas_avaliacao;

-- 8. Testar uma consulta completa
SELECT 
    nome, 
    tipo, 
    criterios,
    niveis_desempenho,
    ativo
FROM rubricas_avaliacao 
WHERE ativo = true;


| nome                               | tipo        | criterios                                                                               | niveis_desempenho                                                     | ativo |
| ---------------------------------- | ----------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------- | ----- |
| Avaliação de Competências Musicais | competencia | {"criatividade":{"peso":20,"descricao":"Originalidade e inovação"}}                     | {"iniciante":{"faixa":"0-25","descricao":"Habilidades emergentes"}}   | true  |
| Avaliação entre Pares              | peer_review | {"feedback_construtivo":{"peso":25,"descricao":"Qualidade dos comentários oferecidos"}} | {"iniciante":{"faixa":"0-25","descricao":"Comentários superficiais"}} | true  |