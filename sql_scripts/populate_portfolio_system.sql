-- DADOS INICIAIS PARA SISTEMA DE PORTFOLIO
-- ==========================================
-- Baseado no Capítulo15—Avaliacao_Portfolio_e_Impacto.md

-- INSERIR RUBRICAS DE AVALIAÇÃO PADRÃO

-- Rubrica para Apresentação Musical Coletiva (baseada no Capítulo 15)
INSERT INTO rubricas_avaliacao (
    nome, 
    descricao, 
    tipo, 
    criterios, 
    escala_maxima
) VALUES (
    'Apresentação Musical Coletiva',
    'Avaliação para apresentações em grupo baseada em participação, criatividade, técnica e cooperação',
    'apresentacao',
    '{
        "participacao_empenho": {
            "nome": "Participação e Empenho",
            "niveis": {
                "3": "Ativo, colabora e incentiva colegas",
                "2": "Participa, mas pouco engajado", 
                "1": "Pouco envolvimento"
            }
        },
        "criatividade_expressao": {
            "nome": "Criatividade/Expressão",
            "niveis": {
                "3": "Traz ideias originais, expressivo",
                "2": "Segue roteiro, pouca inovação",
                "1": "Reproduz sem expressão"
            }
        },
        "tecnica_musical": {
            "nome": "Técnica Musical", 
            "niveis": {
                "3": "Execução precisa e confiante",
                "2": "Alguns erros, mas bom controle",
                "1": "Muitos erros ou insegurança"
            }
        },
        "cooperacao_grupo": {
            "nome": "Cooperação em Grupo",
            "niveis": {
                "3": "Ótima integração, respeita o grupo",
                "2": "Coopera, mas com conflitos",
                "1": "Dificuldade de integração"
            }
        }
    }',
    3
);

-- Rubrica para Projetos Individuais
INSERT INTO rubricas_avaliacao (
    nome,
    descricao,
    tipo,
    criterios,
    escala_maxima
) VALUES (
    'Projeto Individual',
    'Avaliação de projetos pessoais focando em criatividade, preparação e apresentação',
    'projeto',
    '{
        "clareza_proposta": {
            "nome": "Clareza da Proposta",
            "niveis": {
                "3": "Proposta muito clara e bem definida",
                "2": "Proposta compreensível com pequenas lacunas",
                "1": "Proposta confusa ou pouco clara"
            }
        },
        "criatividade_originalidade": {
            "nome": "Criatividade e Originalidade",
            "niveis": {
                "3": "Muito criativo e original",
                "2": "Algumas ideias criativas",
                "1": "Pouca criatividade"
            }
        },
        "preparacao_organizacao": {
            "nome": "Preparação e Organização",
            "niveis": {
                "3": "Muito bem preparado e organizado",
                "2": "Adequadamente preparado",
                "1": "Preparação insuficiente"
            }
        },
        "apresentacao_final": {
            "nome": "Qualidade da Apresentação",
            "niveis": {
                "3": "Apresentação excelente",
                "2": "Boa apresentação",
                "1": "Apresentação básica"
            }
        }
    }',
    3
);

-- Rubrica para Colaboração e Trabalho em Equipe
INSERT INTO rubricas_avaliacao (
    nome,
    descricao,
    tipo,
    criterios,
    escala_maxima
) VALUES (
    'Colaboração e Trabalho em Equipe',
    'Avaliação específica para habilidades colaborativas',
    'colaboracao',
    '{
        "comunicacao": {
            "nome": "Comunicação",
            "niveis": {
                "3": "Comunica-se claramente e escuta ativamente",
                "2": "Boa comunicação na maior parte do tempo",
                "1": "Dificuldades de comunicação"
            }
        },
        "respeito_diversidade": {
            "nome": "Respeito à Diversidade",
            "niveis": {
                "3": "Valoriza e inclui diferentes perspectivas",
                "2": "Geralmente respeitoso com diferenças",
                "1": "Pouco sensível às diferenças"
            }
        },
        "resolucao_conflitos": {
            "nome": "Resolução de Conflitos",
            "niveis": {
                "3": "Resolve conflitos de forma construtiva",
                "2": "Lida adequadamente com conflitos",
                "1": "Evita ou agrava conflitos"
            }
        },
        "lideranca_compartilhada": {
            "nome": "Liderança Compartilhada",
            "niveis": {
                "3": "Lidera quando necessário e segue quando apropriado",
                "2": "Mostra algumas habilidades de liderança",
                "1": "Raramente assume responsabilidade"
            }
        }
    }',
    3
);

-- Rubrica para Habilidades Técnicas Musicais
INSERT INTO rubricas_avaliacao (
    nome,
    descricao,
    tipo,
    criterios,
    escala_maxima
) VALUES (
    'Habilidades Técnicas Musicais',
    'Avaliação de aspectos técnicos da performance musical',
    'tecnica',
    '{
        "precisao_ritmica": {
            "nome": "Precisão Rítmica",
            "niveis": {
                "3": "Ritmo consistente e preciso",
                "2": "Geralmente no tempo com pequenos desvios",
                "1": "Dificuldades rítmicas frequentes"
            }
        },
        "afinacao_entonacao": {
            "nome": "Afinação/Entonação",
            "niveis": {
                "3": "Afinação precisa e consistente",
                "2": "Afinação adequada com ajustes ocasionais",
                "1": "Problemas frequentes de afinação"
            }
        },
        "controle_dinamico": {
            "nome": "Controle Dinâmico",
            "niveis": {
                "3": "Excelente controle de dinâmicas",
                "2": "Bom controle com variações apropriadas",
                "1": "Controle dinâmico limitado"
            }
        },
        "fluencia_instrumental": {
            "nome": "Fluência Instrumental",
            "niveis": {
                "3": "Domínio técnico do instrumento",
                "2": "Competência técnica adequada",
                "1": "Habilidades técnicas básicas"
            }
        }
    }',
    3
);

-- Rubrica para Criatividade e Expressão
INSERT INTO rubricas_avaliacao (
    nome,
    descricao,
    tipo,
    criterios,
    escala_maxima
) VALUES (
    'Criatividade e Expressão Musical',
    'Avaliação focada em aspectos criativos e expressivos',
    'criatividade',
    '{
        "originalidade": {
            "nome": "Originalidade",
            "niveis": {
                "3": "Ideias muito originais e inovadoras",
                "2": "Algumas ideias originais",
                "1": "Reprodução de ideias conhecidas"
            }
        },
        "expressividade": {
            "nome": "Expressividade",
            "niveis": {
                "3": "Muito expressivo e envolvente",
                "2": "Boa expressividade",
                "1": "Expressão limitada"
            }
        },
        "experimentacao": {
            "nome": "Experimentação",
            "niveis": {
                "3": "Explora ativamente novas possibilidades",
                "2": "Mostra alguma disposição para experimentar",
                "1": "Relutante em experimentar"
            }
        },
        "conexao_emocional": {
            "nome": "Conexão Emocional",
            "niveis": {
                "3": "Conecta-se profundamente com a música",
                "2": "Boa conexão emocional",
                "1": "Conexão emocional superficial"
            }
        }
    }',
    3
);

-- CRIAR PORTFOLIOS DE EXEMPLO (Para demonstração)

-- Exemplo de Portfolio Pessoal
INSERT INTO portfolios (
    user_id,
    titulo,
    descricao,
    tipo,
    status,
    visibilidade,
    objetivos,
    reflexoes_iniciais,
    tags
) VALUES (
    '00000000-0000-0000-0000-000000000000', -- ID fictício para exemplo
    'Minha Jornada Musical 2024',
    'Portfolio pessoal documentando meu desenvolvimento musical ao longo do ano',
    'pessoal',
    'ativo',
    'privado',
    ARRAY[
        'Desenvolver habilidades de improvisação',
        'Aprender 3 instrumentos diferentes',
        'Compor minha primeira música',
        'Apresentar em público'
    ],
    'Estou iniciando minha jornada musical com muita curiosidade e vontade de aprender. Nunca toquei um instrumento antes, mas tenho muito interesse em música.',
    ARRAY['música', 'aprendizado', 'criatividade', 'desafio']
);

-- DADOS DE EXEMPLO PARA INDICADORES DE IMPACTO
INSERT INTO indicadores_impacto (
    user_id,
    tipo_indicador,
    valor_inicial,
    valor_atual,
    observacoes,
    metodo_coleta
) VALUES 
(
    '00000000-0000-0000-0000-000000000000',
    'autoestima',
    2.5,
    4.0,
    'Aumento significativo na confiança para se expressar musicalmente',
    'Autoavaliação em escala 1-5'
),
(
    '00000000-0000-0000-0000-000000000000',
    'engajamento',
    3.0,
    4.5,
    'Participação mais ativa nas atividades de grupo',
    'Observação do educador'
),
(
    '00000000-0000-0000-0000-000000000000',
    'autonomia',
    2.0,
    3.5,
    'Começou a praticar por conta própria e a buscar novos materiais',
    'Relatório de atividades autônomas'
),
(
    '00000000-0000-0000-0000-000000000000',
    'cooperacao',
    3.5,
    4.0,
    'Melhor colaboração em projetos de grupo',
    'Avaliação entre pares'
),
(
    '00000000-0000-0000-0000-000000000000',
    'criatividade',
    3.0,
    4.2,
    'Demonstra mais originalidade em composições e improvisações',
    'Análise de portfólio'
);

-- VERIFICAR INSERÇÃO
SELECT 
    (SELECT COUNT(*) FROM rubricas_avaliacao) as rubricas,
    (SELECT COUNT(*) FROM portfolios) as portfolios,
    (SELECT COUNT(*) FROM indicadores_impacto) as indicadores;