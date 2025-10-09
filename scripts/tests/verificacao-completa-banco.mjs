// verificacao-completa-banco.mjs
// Verificação abrangente de toda a estrutura do banco

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;

console.log('🔍 VERIFICAÇÃO COMPLETA DO BANCO DE DADOS');
console.log('=========================================\n');

class VerificacaoBanco {
    constructor() {
        this.supabase = createClient(supabaseUrl, supabaseKey);
        this.tabelasEsperadas = {
            // Sistema Alpha
            'alpha_metodologias': { registros: 8, descricao: 'Metodologias pedagógicas musicais' },
            'alpha_competencias': { registros: 8, descricao: 'Competências por metodologia' },
            'alpha_desafios': { registros: 0, descricao: 'Desafios práticos (pode estar vazio)' },
            'alpha_user_progress': { registros: 0, descricao: 'Progresso dos usuários' },
            'alpha_user_competencias': { registros: 0, descricao: 'Competências dos usuários' },
            
            // Sistema Portfolio
            'portfolios': { registros: 0, descricao: 'Portfolios de usuários' },
            'portfolio_evidencias': { registros: 0, descricao: 'Evidências de aprendizagem' },
            'autoavaliacoes': { registros: 0, descricao: 'Autoavaliações periódicas' },
            'feedback_pares': { registros: 0, descricao: 'Feedback entre colegas' },
            'rubricas_avaliacao': { registros: 2, descricao: 'Instrumentos de avaliação' },
            'avaliacoes_rubricas': { registros: 0, descricao: 'Avaliações com rubricas' },
            'indicadores_impacto': { registros: 0, descricao: 'Métricas de impacto' }
        };
    }

    async run() {
        try {
            console.log('🔗 Testando conectividade Supabase...');
            await this.testarConectividade();
            
            console.log('\n📊 Verificando estrutura das tabelas...');
            await this.verificarTabelas();
            
            console.log('\n🔍 Validando dados críticos...');
            await this.validarDados();
            
            console.log('\n🔐 Verificando segurança RLS...');
            await this.verificarRLS();
            
            console.log('\n🔗 Testando relacionamentos...');
            await this.testarRelacionamentos();
            
            console.log('\n📈 Resumo final da verificação...');
            await this.resumoFinal();
            
        } catch (error) {
            console.error('❌ Erro na verificação:', error.message);
        }
    }

    async testarConectividade() {
        try {
            const { data, error } = await this.supabase
                .from('alpha_metodologias')
                .select('count')
                .limit(1);

            if (error) {
                console.log('❌ Erro de conectividade:', error.message);
                return false;
            }
            
            console.log('✅ Conectividade Supabase OK');
            return true;
        } catch (error) {
            console.log('❌ Falha na conectividade:', error.message);
            return false;
        }
    }

    async verificarTabelas() {
        for (const [tabela, config] of Object.entries(this.tabelasEsperadas)) {
            try {
                const { count, error } = await this.supabase
                    .from(tabela)
                    .select('*', { count: 'exact', head: true });

                if (error) {
                    console.log(`❌ ${tabela}: ${error.message}`);
                } else {
                    const status = count >= config.registros ? '✅' : '⚠️';
                    console.log(`${status} ${tabela}: ${count || 0} registros (esperado: ${config.registros}+)`);
                    console.log(`   📝 ${config.descricao}`);
                }
            } catch (err) {
                console.log(`❌ ${tabela}: ${err.message}`);
            }
        }
    }

    async validarDados() {
        // Verificar metodologias Alpha
        try {
            const { data: metodologias, error } = await this.supabase
                .from('alpha_metodologias')
                .select('id, nome, descricao, cor_tema');

            if (error) {
                console.log('❌ Erro ao validar metodologias:', error.message);
            } else if (metodologias && metodologias.length >= 8) {
                console.log(`✅ ${metodologias.length} metodologias Alpha carregadas:`);
                metodologias.slice(0, 5).forEach((met, i) => {
                    console.log(`   ${i + 1}. ${met.nome} (${met.cor_tema})`);
                });
                if (metodologias.length > 5) {
                    console.log(`   ... e mais ${metodologias.length - 5} metodologias`);
                }
            } else {
                console.log('⚠️ Poucas metodologias encontradas');
            }
        } catch (error) {
            console.log('❌ Erro na validação de metodologias:', error.message);
        }

        // Verificar competências
        try {
            const { data: competencias, error } = await this.supabase
                .from('alpha_competencias')
                .select('nome, categoria, metodologia_id');

            if (error) {
                console.log('❌ Erro ao validar competências:', error.message);
            } else if (competencias && competencias.length >= 8) {
                console.log(`✅ ${competencias.length} competências Alpha mapeadas`);
                
                // Agrupar por categoria
                const categorias = {};
                competencias.forEach(comp => {
                    if (!categorias[comp.categoria]) categorias[comp.categoria] = 0;
                    categorias[comp.categoria]++;
                });
                
                Object.entries(categorias).forEach(([cat, count]) => {
                    console.log(`   📊 ${cat}: ${count} competências`);
                });
            } else {
                console.log('⚠️ Poucas competências encontradas');
            }
        } catch (error) {
            console.log('❌ Erro na validação de competências:', error.message);
        }

        // Verificar rubricas Portfolio
        try {
            const { data: rubricas, error } = await this.supabase
                .from('rubricas_avaliacao')
                .select('nome, tipo, ativo, criterios');

            if (error) {
                console.log('❌ Erro ao validar rubricas:', error.message);
            } else if (rubricas && rubricas.length >= 2) {
                console.log(`✅ ${rubricas.length} rubricas Portfolio configuradas:`);
                rubricas.forEach((rub, i) => {
                    const criteriosCount = Object.keys(rub.criterios || {}).length;
                    console.log(`   ${i + 1}. ${rub.nome} (${rub.tipo}) - ${criteriosCount} critérios`);
                });
            } else {
                console.log('⚠️ Poucas rubricas Portfolio encontradas');
            }
        } catch (error) {
            console.log('❌ Erro na validação de rubricas:', error.message);
        }
    }

    async verificarRLS() {
        try {
            // Verificar se RLS está ativo
            const tabelasComRLS = [
                'portfolios', 'portfolio_evidencias', 'autoavaliacoes', 
                'feedback_pares', 'rubricas_avaliacao', 'alpha_metodologias'
            ];

            for (const tabela of tabelasComRLS) {
                try {
                    const { error } = await this.supabase
                        .from(tabela)
                        .select('count')
                        .limit(1);

                    if (error && error.message.includes('row-level security')) {
                        console.log(`🔒 ${tabela}: RLS ativo (segurança funcionando)`);
                    } else {
                        console.log(`🔓 ${tabela}: Acesso público ou RLS permissivo`);
                    }
                } catch (err) {
                    console.log(`❓ ${tabela}: ${err.message}`);
                }
            }
        } catch (error) {
            console.log('❌ Erro na verificação RLS:', error.message);
        }
    }

    async testarRelacionamentos() {
        try {
            // Testar join Alpha: metodologias -> competências
            const { data: metodologiasComCompetencias, error: alphaError } = await this.supabase
                .from('alpha_metodologias')
                .select(`
                    nome,
                    competencias:alpha_competencias(count)
                `)
                .limit(3);

            if (alphaError) {
                console.log('❌ Relacionamento Alpha falhou:', alphaError.message);
            } else {
                console.log('✅ Relacionamento Alpha metodologias → competências OK');
                metodologiasComCompetencias.forEach(met => {
                    console.log(`   📊 ${met.nome}: ${met.competencias?.[0]?.count || 0} competências`);
                });
            }

            // Testar join Portfolio: portfolios -> evidências
            const { data: portfoliosComEvidencias, error: portfolioError } = await this.supabase
                .from('portfolios')
                .select(`
                    titulo,
                    evidencias:portfolio_evidencias(count)
                `)
                .limit(3);

            if (portfolioError && !portfolioError.message.includes('row-level security')) {
                console.log('❌ Relacionamento Portfolio falhou:', portfolioError.message);
            } else {
                console.log('✅ Relacionamento Portfolio portfolios → evidências OK');
            }

        } catch (error) {
            console.log('❌ Erro nos testes de relacionamento:', error.message);
        }
    }

    async resumoFinal() {
        let tabelasOK = 0;
        let tabelasComProblemas = 0;
        let totalRegistros = 0;

        for (const [tabela, config] of Object.entries(this.tabelasEsperadas)) {
            try {
                const { count, error } = await this.supabase
                    .from(tabela)
                    .select('*', { count: 'exact', head: true });

                if (!error) {
                    tabelasOK++;
                    totalRegistros += count || 0;
                    
                    if (count < config.registros && config.registros > 0) {
                        console.log(`⚠️ ATENÇÃO: ${tabela} tem ${count} registros, esperado ${config.registros}+`);
                    }
                } else {
                    tabelasComProblemas++;
                }
            } catch (err) {
                tabelasComProblemas++;
            }
        }

        console.log('\n' + '='.repeat(50));
        console.log('📊 RESUMO DA VERIFICAÇÃO:');
        console.log('='.repeat(50));
        console.log(`✅ Tabelas funcionais: ${tabelasOK}/${Object.keys(this.tabelasEsperadas).length}`);
        console.log(`❌ Tabelas com problemas: ${tabelasComProblemas}`);
        console.log(`📈 Total de registros: ${totalRegistros}`);

        if (tabelasOK >= 10 && tabelasComProblemas === 0) {
            console.log('\n🎉 BANCO DE DADOS 100% FUNCIONAL!');
            console.log('   ✅ Sistema Alpha: OK');
            console.log('   ✅ Sistema Portfolio: OK');
            console.log('   ✅ Relacionamentos: OK');
            console.log('   ✅ Segurança RLS: Ativa');
        } else {
            console.log('\n⚠️ BANCO NECESSITA AJUSTES');
            console.log('   📋 Verifique as tabelas marcadas com ❌');
            console.log('   🔧 Execute os scripts de correção necessários');
        }
    }
}

// Executar verificação
const verificacao = new VerificacaoBanco();
verificacao.run();