-- =============================================
-- PATCH: Atualizar achievements para português
-- Executar no Supabase SQL Editor
-- =============================================

UPDATE core.achievements SET name = 'Primeiro Passo',           description = 'Completou sua primeira aula'                WHERE name = 'First Step';
UPDATE core.achievements SET name = 'Começando a Jornada',      description = 'Completou 5 aulas'                          WHERE name = 'Getting Started';
UPDATE core.achievements SET name = 'Aluno Dedicado',           description = 'Completou 10 aulas'                         WHERE name = 'Dedicated Student';
UPDATE core.achievements SET name = 'Buscador de Conhecimento', description = 'Completou 25 aulas'                         WHERE name = 'Knowledge Seeker';
UPDATE core.achievements SET name = 'Mestre da Música',         description = 'Completou todas as 30 aulas'                WHERE name = 'Music Master';
UPDATE core.achievements SET name = 'Fogo Sagrado',             description = 'Manteve sequência de 3 dias'                WHERE name = 'Sacred Fire';
UPDATE core.achievements SET name = 'Disciplina',               description = 'Manteve sequência de 7 dias'                WHERE name = 'Discipline';
UPDATE core.achievements SET name = 'Vontade de Ferro',         description = 'Manteve sequência de 30 dias'               WHERE name = 'Iron Will';
UPDATE core.achievements SET name = 'Centenário',               description = 'Alcançou 100 pontos no total'               WHERE name = 'Century';
UPDATE core.achievements SET name = 'Meio Milhar',              description = 'Alcançou 500 pontos no total'               WHERE name = 'Half Thousand';
UPDATE core.achievements SET name = 'Milenário',                description = 'Alcançou 1000 pontos no total'              WHERE name = 'Millennial';
UPDATE core.achievements SET name = 'Grande Total',             description = 'Alcançou 5000 pontos no total'              WHERE name = 'Grand Total';
UPDATE core.achievements SET name = 'Aprendiz',                 description = 'Alcançou o nível 2'                         WHERE name = 'Apprentice';
UPDATE core.achievements SET name = 'Praticante',               description = 'Alcançou o nível 3'                         WHERE name = 'Practitioner';
UPDATE core.achievements SET name = 'Experiente',               description = 'Alcançou o nível 4'                         WHERE name = 'Experienced';
UPDATE core.achievements SET name = 'Mestre',                   description = 'Alcançou o nível 5'                         WHERE name = 'Master';
UPDATE core.achievements SET name = 'Grão-Mestre',              description = 'Alcançou o nível 6'                         WHERE name = 'Grand Master';
UPDATE core.achievements SET name = 'Lenda',                    description = 'Alcançou o nível 7'                         WHERE name = 'Legend';
UPDATE core.achievements SET name = 'Primeiro Portfólio',       description = 'Enviou seu primeiro trabalho ao portfólio'  WHERE name = 'First Portfolio';
UPDATE core.achievements SET name = 'Colecionador',             description = 'Desbloqueou 5 conquistas'                   WHERE name = 'Collector';
UPDATE core.achievements SET name = 'Caçador de Conquistas',    description = 'Desbloqueou 10 conquistas'                  WHERE name = 'Achievement Hunter';
UPDATE core.achievements SET name = 'Completista',              description = 'Desbloqueou 20 conquistas'                  WHERE name = 'Completionist';
UPDATE core.achievements SET name = 'Explorador',               description = 'Experimentou todas as categorias de instrumentos' WHERE name = 'Explorer';
UPDATE core.achievements SET name = 'Membro da Comunidade',     description = 'Fez sua primeira publicação no fórum'       WHERE name = 'Community Member';

NOTIFY pgrst, 'reload schema';
