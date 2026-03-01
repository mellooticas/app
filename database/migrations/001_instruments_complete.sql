-- =============================================
-- Migration: 001_instruments_complete.sql
-- Table: core.instruments
-- Source CSV: instrumentos_rows.csv
-- Generated: 2026-02-28T16:15:02.720Z
-- Rows: 69
-- =============================================

BEGIN;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0b9c8c6b-0e47-471c-b83b-01c931410692', $$Bongôs$$, $$Percussão de Mão$$, $$Percussão$$, $$Par de pequenos tambores unidos, um agudo e um grave. Som seco e rápido, essencial na música latina.$$, $$Originados da fusão de tradições africanas e espanholas em Cuba. Jack Costanzo os popularizou nos EUA nos anos 1950.$$, $$Cuba, final do século XIX$$, 1, $$https://images.unsplash.com/photo-1569173675173-ec69723149f3?w=1200&q=80$$, 202, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '0e52514e-58c3-463a-a6e4-f71a1439f9b7', $$Harmônica (Gaita)$$, $$Aerofone de Palheta Livre$$, $$Sopro$$, $$Pequeno instrumento de palhetas livres. Som do blues, country e rock. Bob Dylan a tornou icônica.$$, $$Little Walter revolucionou a harmônica amplificada no blues. Bob Dylan a usou extensivamente. Stevie Wonder é virtuose.$$, $$Alemanha/Áustria, início século XIX$$, 1, $$https://images.unsplash.com/photo-1591006509090-b43d9e1bcc36?w=1200&q=80$$, 404, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '11a7bc0c-232f-40dc-92ac-4d15aebd2d52', $$Reco-Reco$$, $$Percussão de Raspagem$$, $$Percussão$$, $$Instrumento de raspagem com ranhuras. Som característico do samba e choro.$$, $$Usado no samba e choro. Pode ser de bambu, metal ou madeira entalhada.$$, $$Brasil$$, 1, $$https://images.unsplash.com/photo-1578516978406-a57e83b3b8fd?w=1200&q=80$$, 305, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '13912e91-7b48-4a8d-82b7-b59515c2a0d3', $$Gaita de Foles (Bagpipe)$$, $$Aerofone de Palheta$$, $$Sopro$$, $$Instrumento de palhetas com reservatório de ar. Som icônico da Escócia e Irlanda.$$, $$Símbolo da cultura escocesa. AC/DC usou em It s a Long Way to the Top. Usado em cerimônias militares.$$, $$Escócia/Irlanda (origem antiga)$$, 3, $$https://images.unsplash.com/photo-1619018086942-265ed48a5fcd?w=1200&q=80$$, 601, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '174f6ed4-3c21-444a-acfa-5149f53f2ca0', $$Tuba$$, $$A definir$$, $$sopro$$, $$🎺 Instrumento de sopro da família dos metais$$, $$História resumida do instrumento Tuba (a completar).$$, $$Origem a completar (região e contexto histórico).$$, NULL, $$https://images.unsplash.com/photo-1589439460791-ca0e010c5bd8?w=1200&q=80$$, 16, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2026-02-13 16:40:07.288861+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1b699036-0f72-4c48-9801-e01f6f25e165', $$Saxofone Tenor$$, $$Madeiras$$, $$Sopro$$, $$Saxofone grave, com som rouco e expressivo. John Coltrane e Stan Getz são mestres do instrumento.$$, $$John Coltrane levou o sax tenor a níveis espirituais. Stan Getz popularizou a bossa nova nos EUA.$$, $$Bélgica, 1840 (Adolphe Sax)$$, 2, $$https://images.unsplash.com/photo-1551798507-629020c81463?w=1200&q=80$$, 50, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '1f8c0a22-f3fc-4f51-8938-6e1cc6e24f85', $$Flauta de Pã (Panflute)$$, $$Sopro Livre$$, $$Sopro$$, $$Conjunto de tubos de diferentes tamanhos. Som pastoral, usado na música andina.$$, $$Instrumento de Pã na mitologia grega. Zamfir a popularizou. Essencial na música andina (siku).$$, $$Grécia Antiga / Andes$$, 2, $$https://images.unsplash.com/photo-1563330232-57114bb0823c?w=1200&q=80$$, 602, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '26cadf44-6d7b-4f9b-85d6-6b2c40715f45', $$Saxofone$$, $$Madeiras$$, $$sopro$$, $$🎷 Instrumento de sopro da família das madeiras, famoso em jazz e música popular.$$, $$O saxofone foi inventado por Adolphe Sax em 1840 na Bélgica. Inicialmente concebido para bandas militares, tornou-se símbolo do jazz e da música popular no século XX.$$, $$Bélgica$$, NULL, $$https://images.unsplash.com/photo-1589196799937-ea0c9c2b9b8d?w=1200&q=80$$, 9, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '2abbd218-b737-410e-934b-f9c8f3d2b806', $$Alfaia$$, $$Percussão de Membrana$$, $$Percussão$$, $$Tambor grande do maracatu pernambucano. Som grave e poderoso.$$, $$Tambor do maracatu nação. Chico Science a levou ao rock com Nação Zumbi.$$, $$Pernambuco, Brasil$$, 2, $$https://images.unsplash.com/photo-1519892300165-cb5542fb47c7?w=1200&q=80$$, 306, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '32705505-7727-4d27-b7bd-b08e7c90c233', $$Dulcimer Apalachiano$$, $$Cordas Dedilhadas$$, $$Corda$$, $$Cítara americana de corpo estreito, tocada no colo. Som doce da música folk dos Apalaches.$$, $$Desenvolvido pelos colonos dos Apalaches. Joni Mitchell o usou em algumas músicas. Som característico do folk americano.$$, $$Estados Unidos, século XVIII$$, 1, $$https://images.unsplash.com/photo-1511192336575-5a79af67a629?w=1200&q=80$$, 104, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '34f9e29b-3d22-464a-b31c-c3f4fbb73328', $$Agogô$$, $$Percussão de Metal$$, $$Percussão$$, $$Duas campânulas de metal unidas. Som agudo e marcante, usado no samba e candomblé.$$, $$Instrumento de origem iorubá, essencial no samba e na música afro-brasileira. Tem duas ou mais campânulas.$$, $$África/Brasil$$, 1, $$https://images.unsplash.com/photo-1590736969955-71cc94901144?w=1200&q=80$$, 304, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '35aff373-706c-47d8-8004-d8edcddb1e0c', $$Baixo$$, $$Cordas$$, $$corda$$, $$🎸 Instrumento de cordas elétrico, essencial para linhas de baixo em diversos estilos musicais.$$, $$O baixo elétrico foi desenvolvido no século XX, tendo Leo Fender como um de seus criadores em 1951. Tornou-se o alicerce rítmico e harmônico de bandas em estilos como rock, funk, jazz e pop.$$, $$Estados Unidos$$, NULL, $$https://images.unsplash.com/photo-1612225330812-0bcb36db11e1?w=1200&q=80$$, 7, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '35da6877-2528-4f37-9ab4-b44893ad1dbf', $$Corne Inglês$$, $$Madeiras$$, $$Sopro$$, $$Oboé contralto, mais grave e com som mais aveludado. Não é inglês nem tem forma de corno.$$, $$Famoso pelo solo na abertura do Guilherme Tell de Rossini. Dvorák o usou na Sinfonia do Novo Mundo.$$, $$Europa, século XVIII$$, 3, $$https://images.unsplash.com/photo-1618846835584-5e0c2e0362e7?w=1200&q=80$$, 46, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '36040329-1aa6-428a-ad39-cd85de03493e', $$Acordeão$$, $$Aerofone de Palheta Livre$$, $$Teclado$$, $$Instrumento de teclas com fole, usado em música folclórica mundial. Som nostálgico do tango, forró e música francesa.$$, $$Dominguinhos e Luiz Gonzaga o tornaram símbolo do forró. Astor Piazzolla revolucionou o tango com o bandoneón.$$, $$Alemanha, 1822$$, 2, $$https://images.unsplash.com/photo-1605020420620-20c943cc4669?w=1200&q=80$$, 403, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '36b9d36d-f65b-4ba1-89be-4ab3707e874c', $$Fagote$$, $$Madeiras$$, $$sopro$$, $$🎶 Instrumento de sopro da família das madeiras, de som grave e encorpado, utilizado em orquestras e música de câmara.$$, $$O fagote surgiu no período renascentista, evoluindo de instrumentos como a dulciana. Tornou-se essencial em orquestras sinfônicas por seu timbre único e capacidade de cobrir linhas graves e melódicas.$$, $$Europa$$, NULL, $$https://images.unsplash.com/photo-1565551808976-d3b5e03f8a09?w=1200&q=80$$, 12, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3702e3f9-bc82-42b6-ae32-c770081b3ec2', $$Congas$$, $$Percussão de Mão$$, $$Percussão$$, $$Par ou trio de tambores afro-cubanos de diferentes alturas. Essenciais na salsa, rumba e música latina.$$, $$Desenvolvidas em Cuba a partir de tambores africanos. Mongo Santamaría e Tito Puente são mestres das congas.$$, $$Cuba, século XIX$$, 2, $$https://images.unsplash.com/photo-1541689592655-f5f52825a3b8?w=1200&q=80$$, 201, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3957c464-86dc-4aa2-9f09-57b5eb2a6c6a', $$Zabumba$$, $$Percussão de Membrana$$, $$Percussão$$, $$Tambor grande de duas pel es tocado com baqueta e mão. Base rítmica do forró nordestino.$$, $$Essencial no forró e baião. Luiz Gonzaga a popularizou. Tocada com baqueta em um lado e mão no outro.$$, $$Nordeste do Brasil$$, 1, $$https://images.unsplash.com/photo-1519892300165-cb5542fb47c7?w=1200&q=80$$, 302, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '3e02292d-bd2f-46ed-9b9e-a0c8b0acd996', $$Drum Machine$$, $$Eletrônico$$, $$Eletrônico$$, $$Bateria eletrônica programável. Definiu o som do hip-hop, house e música eletrônica.$$, $$Roland TR-808 é a mais icônica. Afrika Bambaataa usou no Planet Rock. Definiu o som do hip-hop.$$, $$Estados Unidos, anos 1970$$, 2, $$https://images.unsplash.com/photo-1519892300165-cb5542fb47c7?w=1200&q=80$$, 502, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '412c40b6-f4fc-4379-9d6f-5ce0ec2d669d', $$Violoncelo$$, $$A definir$$, $$corda$$, $$🎻 Instrumento de corda tocado com arco$$, $$História resumida do instrumento Violoncelo (a completar).$$, $$Origem a completar (região e contexto histórico).$$, NULL, $$https://images.unsplash.com/photo-1572164686349-27f940692440?w=1200&q=80$$, 20, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2026-02-13 16:40:07.288861+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4445b5c9-dcdf-4dd3-8ce6-bb04a22127ce', $$Triângulo$$, $$Percussão de Metal$$, $$Percussão$$, $$Barra de metal dobrada em triângulo. Som metálico e brilhante, essencial no forró.$$, $$Usado em orquestras e no forró. No Nordeste ganhou técnica própria com abafamentos rítmicos complexos.$$, $$Europa medieval, abrasileirado no Nordeste$$, 1, $$https://images.unsplash.com/photo-1519678099-b33d85863f9b?w=1200&q=80$$, 303, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '453ca164-6f0e-4554-b008-dd68bf4586c2', $$Sampler$$, $$Eletrônico$$, $$Eletrônico$$, $$Equipamento que grava e reproduz sons. Base do hip-hop, permitiu samplear discos antigos.$$, $$Fairlight CMI foi o primeiro sampler famoso. Public Enemy e DJ Shadow são mestres do sampling.$$, $$Estados Unidos, anos 1970$$, 3, $$https://images.unsplash.com/photo-1598653222000-6b7b7a552625?w=1200&q=80$$, 503, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '492f792b-8d0c-46b7-a195-c8c32114696d', $$Clarinete Baixo$$, $$Madeiras$$, $$Sopro$$, $$Versão grave do clarinete, com tubo curvo e campana voltada para cima. Som escuro e misterioso.$$, $$Usado para texturas graves e misteriosas. Destaca-se em trilhas sonoras de filmes de terror.$$, $$Europa, século XIX$$, 3, $$https://images.unsplash.com/photo-1619018086942-265ed48a5fcd?w=1200&q=80$$, 44, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4bc1c064-fa97-43f5-b6d7-d466ca66635d', $$Sintetizador$$, $$Eletrônico$$, $$Eletrônico$$, $$Instrumento eletrônico que sintetiza sons. Revolucionou a música pop, rock progressivo e eletrônica.$$, $$Robert Moog criou o sintetizador moderno. Wendy Carlos usou em Switched-On Bach. Keith Emerson o levou ao rock progressivo.$$, $$Estados Unidos, 1964 (Robert Moog)$$, 2, $$https://images.unsplash.com/photo-1563330232-57114bb0823c?w=1200&q=80$$, 501, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4c61dc18-2b1e-48c8-8a2e-2c730679d4a5', $$Cuíca$$, $$Percussão de Fricção$$, $$Percussão$$, $$Tambor de fricção com haste interna. Som característico do samba carioca, imita o som de um macaco.$$, $$Usada no samba desde o início. Som único e inconfundível, essencial nas escolas de samba.$$, $$Brasil, século XVIII (origem africana)$$, 3, $$https://images.unsplash.com/photo-1578516978406-a57e83b3b8fd?w=1200&q=80$$, 301, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '4d78c5a4-04bf-452d-b326-83e7c72c10ef', $$Sitar$$, $$Cordas Dedilhadas$$, $$Corda$$, $$Instrumento de cordas dedilhadas indiano com 18-21 cordas. Som hipnótico e vibrante, usado na música clássica indiana e rock psicodélico.$$, $$Ravi Shankar popularizou o sitar no Ocidente. George Harrison dos Beatles o usou em Norwegian Wood. Tem cordas simpáticas que vibram por ressonância.$$, $$Índia, século XIII$$, 3, $$https://images.unsplash.com/photo-1603048588665-791ca8aea617?w=1200&q=80$$, 100, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '509d6a26-159a-4976-aa46-83f914f930aa', $$Trompete$$, $$Metais$$, $$sopro$$, $$🎺 Instrumento de sopro da família dos metais, presente em diversos estilos musicais.$$, $$O trompete tem origens antigas, com registros de instrumentos similares no Egito e Roma. O modelo moderno com válvulas surgiu no século XIX e tornou-se essencial em orquestras, bandas e no jazz.$$, $$Europa$$, NULL, $$https://images.unsplash.com/photo-1595428773991-a46c1fdc2a2d?w=1200&q=80$$, 14, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '56e32061-7ed6-495d-9bc1-00cdb345b02e', $$Cajón$$, $$Percussão de Mão$$, $$Percussão$$, $$Caixa de madeira peruana tocada sentado sobre ela. Som versátil, usado no flamenco e música popular.$$, $$Criado por escravos africanos no Peru. Paco de Lucía o introduziu no flamenco nos anos 1970. Pode simular bateria completa.$$, $$Peru, século XVIII$$, 1, $$https://images.unsplash.com/photo-1565551808976-d3b5e03f8a09?w=1200&q=80$$, 203, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '56f643e0-a3e2-4067-84ac-334c454426f8', $$Marimba$$, $$Percussão Melódica$$, $$Percussão$$, $$Xilofone grande com ressonadores tubulares. Som quente e rico, usado em música clássica e latina.$$, $$Origem africana, desenvolvida na Guatemala e México. Tem tubos de ressonância abaixo das teclas. Pode ter até 5 oitavas.$$, $$África/América Central$$, 3, $$https://images.unsplash.com/photo-1593697821252-0c9137d9fc45?w=1200&q=80$$, 207, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '57d10b2f-c49f-460d-8fab-3da3065c15c2', $$Theremin$$, $$Eletrônico$$, $$Eletrônico$$, $$Instrumento eletrônico tocado sem contato físico. Som etéreo de ficção científica.$$, $$Inventado por Léon Theremin em 1920. Usado em trilhas de terror e ficção científica. Clara Rockmore foi virtuose.$$, $$Rússia, 1920$$, 3, $$https://images.unsplash.com/photo-1598653222000-6b7b7a552625?w=1200&q=80$$, 500, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '63ebeaeb-be5d-4c26-a5cf-f59b71423401', $$Alaúde$$, $$Cordas Dedilhadas$$, $$Corda$$, $$Instrumento renascentista com corpo em forma de pera. Popular na música medieval e renascentista europeia.$$, $$Chegou à Europa via mundo árabe. Bach transcreveu obras para alaúde. Sting gravou álbum inteiro de músicas de John Dowland.$$, $$Mesopotâmia, aperfeiçoado na Europa medieval$$, 3, $$https://images.unsplash.com/photo-1558037148-28d5b7a3b6c7?w=1200&q=80$$, 102, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '64b94e98-6ad2-4e7f-9aa0-b57f6bb58df1', $$Outro$$, $$A definir$$, $$outros$$, $$🎵 Outros instrumentos$$, $$História resumida do instrumento Outro (a completar).$$, $$Origem a completar (região e contexto histórico).$$, NULL, $$PENDENTE_UPLOAD$$, 23, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2026-02-13 16:40:07.288861+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6925f61b-ba48-473a-b69a-e3548036c1df', $$Glockenspiel$$, $$Percussão Melódica$$, $$Percussão$$, $$Xilofone de metal com som de sinos. Som cristalino e brilhante, usado em orquestras e bandas.$$, $$Nome alemão significa jogo de sinos. Mozart usou em A Flauta Mágica. Som duas oitavas acima do escrito.$$, $$Europa, século XVIII$$, 1, $$https://images.unsplash.com/photo-1564186763535-ebb21ef5277f?w=1200&q=80$$, 208, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '6b11dc1a-295f-4458-9c08-2bcec09ff3ec', $$Hang Drum (Handpan)$$, $$Percussão Melódica$$, $$Percussão$$, $$Instrumento moderno de metal em forma de disco côncavo. Som etéreo e meditativo, tocado com as mãos.$$, $$Inventado em 2000 por Felix Rohner e Sabina Schärer. Som similar ao steel pan mas tocado com as mãos. Virou fenômeno viral.$$, $$Suíça, 2000$$, 2, $$https://images.unsplash.com/photo-1614963385733-eb25382d1d3e?w=1200&q=80$$, 205, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '750450cf-e14e-4f02-944e-b3c1bb0f87a4', $$Violão$$, $$Cordofones$$, $$corda$$, $$🎸 Instrumento de corda dedilhada$$, $$O violão tem suas origens na Antiguidade, evoluindo da lira e do alaúde. O violão moderno de 6 cordas foi padronizado no século XIX pelo luthier espanhol Antonio de Torres Jurado. Chegou ao Brasil no século XVI com os colonizadores portugueses e se tornou o instrumento símbolo da música popular brasileira.$$, $$Espanha/Mediterrâneo$$, NULL, $$https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=1200&q=80$$, 5, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '761a3318-9a5e-46f3-88f2-62159b96100c', $$Piccolo$$, $$Madeiras$$, $$Sopro$$, $$Flauta transversal pequena, oitava acima da flauta. É o instrumento mais agudo da orquestra.$$, $$Usado para efeitos brilhantes e militares na orquestra. Destaca-se em Sousa e Tchaikovsky.$$, $$Europa, século XVIII$$, 3, $$https://images.unsplash.com/photo-1619018086942-265ed48a5fcd?w=1200&q=80$$, 42, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '794f42a6-619a-4ca3-8f1b-c3ac7a9e7a08', $$Flauta$$, $$A definir$$, $$sopro$$, $$🎶 Instrumento de sopro da família das madeiras$$, $$História resumida do instrumento Flauta (a completar).$$, $$Origem a completar (região e contexto histórico).$$, NULL, $$https://images.unsplash.com/photo-1563330232-57114bb0823c?w=1200&q=80$$, 13, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2026-02-13 16:40:07.288861+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '7b6ae164-dfdf-452d-a5c3-d01554861444', $$Berimbau$$, $$Percussão de Corda$$, $$Percussão$$, $$Arco musical afro-brasileiro com cabaça como ressonador. Som característico da capoeira.$$, $$Trazido por escravos africanos, tornou-se símbolo da capoeira. Mestre Bimba e Mestre Pastinha o consagraram.$$, $$África/Brasil colonial$$, 2, $$https://images.unsplash.com/photo-1571327073757-71d13c24de30?w=1200&q=80$$, 300, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '80436b4f-15c1-452f-9442-34e42b5117e4', $$Violino$$, $$Cordas friccionadas$$, $$corda$$, $$🎻 Instrumento de corda tocado com arco$$, $$O violino surgiu na Itália no século XVI, evoluindo de instrumentos medievais como a fidula e a rabeca. Andrea Amati criou os primeiros violinos modernos em Cremona por volta de 1550. Antonio Stradivarius e Giuseppe Guarneri del Gesù posteriormente elevaram a arte da luteria a níveis nunca antes vistos. O violino tornou-se o líder da família das cordas e protagonista da música clássica, sendo essencial em orquestras, música de câmara e como instrumento solista. Sua versatilidade permitiu que conquistasse também o folk, jazz, rock e música popular mundial.$$, $$Itália (Cremona)$$, NULL, $$https://images.unsplash.com/photo-1520523839897-bd0b52f945a0?w=1200&q=80$$, 18, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '82052c70-0a9d-4d94-873e-3b402e032f55', $$Saxofone Barítono$$, $$Madeiras$$, $$Sopro$$, $$O saxofone mais grave comumente usado. Som poderoso e rico, base harmônica no jazz.$$, $$Gerry Mulligan revolucionou o uso do sax barítono no jazz cool. Pepper Adams foi mestre do bebop no barítono.$$, $$Bélgica, 1840 (Adolphe Sax)$$, 3, $$https://images.unsplash.com/photo-1599415098267-1f61b8adf37c?w=1200&q=80$$, 52, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '850c53c4-2ed6-4a12-a4ff-3fbaecd6bf73', $$Trombone$$, $$Metais$$, $$sopro$$, $$🎶 Instrumento de sopro da família dos metais, caracterizado por sua vara deslizante que permite a execução de glissandos e grande flexibilidade sonora.$$, $$O trombone tem origens no século XV, evoluindo do sacabuche. Desde o Renascimento é utilizado em conjuntos sacros, orquestras, bandas e mais tarde no jazz e música popular.$$, $$Europa$$, NULL, $$https://images.unsplash.com/photo-1519677100203-a0e668c92439?w=1200&q=80$$, 15, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '86f83611-c0db-470c-87e7-31ee81b1a009', $$Bateria$$, $$Percussão$$, $$percussao$$, $$🥁 Conjunto de instrumentos de percussão$$, $$A bateria moderna surgiu no final do século XIX em New Orleans, quando músicos começaram a combinar diferentes instrumentos de percussão africanos, europeus e americanos em um único setup. O pedal de bumbo foi inventado por William Ludwig em 1909, revolucionando o instrumento. Durante a era do jazz (1920-1940), a bateria se consolidou como base rítmica das big bands. Nos anos 1960, com o rock'n'roll, ganhou protagonismo e técnicas mais agressivas. Hoje é fundamental em praticamente todos os gêneros musicais modernos.$$, $$Estados Unidos (New Orleans)$$, NULL, $$https://images.unsplash.com/photo-1519892300165-cb5542fb47c7?w=1200&q=80$$, 3, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '87ee66bf-bb70-4e70-9aa3-4bff514ced4e', $$Canto$$, $$A definir$$, $$vocal$$, $$Descrição introdutória do instrumento Canto.$$, $$História resumida do instrumento Canto (a completar).$$, $$Origem a completar (região e contexto histórico).$$, NULL, $$https://images.unsplash.com/photo-1516280440614-37939bbacd81?w=1200&q=80$$, 0, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2026-02-13 16:40:07.288861+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8bd473f1-7b35-4b9e-869a-17fb73c6e047', $$Teclado$$, $$A definir$$, $$teclado$$, $$🎹 Instrumento eletrônico de teclado$$, $$História resumida do instrumento Teclado (a completar).$$, $$Origem a completar (região e contexto histórico).$$, NULL, $$https://images.unsplash.com/photo-1563330232-57114bb0823c?w=1200&q=80$$, 1, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2026-02-13 16:40:07.288861+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8ddb4eea-18b9-4b8f-bb85-16a1f5474f87', $$Saxofone Soprano$$, $$Madeiras$$, $$Sopro$$, $$O saxofone mais agudo, reto ou curvo. Som penetrante, popularizado por Sidney Bechet e Kenny G.$$, $$Sidney Bechet foi pioneiro no jazz. John Coltrane gravou My Favorite Things no soprano. Kenny G o popularizou no smooth jazz.$$, $$Bélgica, 1840 (Adolphe Sax)$$, 3, $$https://images.unsplash.com/photo-1598546667318-8bc75e0e48b1?w=1200&q=80$$, 51, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '8fbba87d-39e1-4542-b8bb-7c815fdc2b9a', $$Eufônio$$, $$A definir$$, $$sopro$$, $$🎺 Instrumento de sopro da família dos metais$$, $$História resumida do instrumento Eufônio (a completar).$$, $$Origem a completar (região e contexto histórico).$$, NULL, $$PENDENTE_UPLOAD$$, 17, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2026-02-13 16:40:07.288861+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '92ecdeff-3480-4f27-85cd-86f12622cf9f', $$Melódica$$, $$Aerofone de Palheta Livre$$, $$Teclado$$, $$Teclado portátil de sopro. Usada no ensino musical e por Augustus Pablo no reggae.$$, $$Hohner criou a melodica em 1958. Augustus Pablo a usou no reggae. Muito usada no ensino musical.$$, $$Alemanha, 1958$$, 1, $$https://images.unsplash.com/photo-1563330232-57114bb0823c?w=1200&q=80$$, 405, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '96b547b5-e685-40f8-952c-9dfce2ad4dc6', $$Contrafagote$$, $$Madeiras$$, $$Sopro$$, $$O instrumento mais grave da família das madeiras. Soa uma oitava abaixo do fagote.$$, $$Usado para reforçar as notas mais graves da orquestra. Brahms e Ravel o usaram magistralmente.$$, $$Europa, século XVII$$, 3, $$https://images.unsplash.com/photo-1565551808976-d3b5e03f8a09?w=1200&q=80$$, 48, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9a5e0eac-114e-4173-90af-32b55c870675', $$Percussão Erudita$$, $$A definir$$, $$percussao$$, $$🥁 Instrumentos de percussão clássica$$, $$História resumida do instrumento Percussão Erudita (a completar).$$, $$Origem a completar (região e contexto histórico).$$, NULL, $$PENDENTE_UPLOAD$$, 4, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2026-02-13 16:40:07.288861+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9b42a23b-ac7f-42e1-8a04-bde4c525fbde', $$Oboé$$, $$Madeiras$$, $$sopro$$, $$🎶 Instrumento de sopro da família das madeiras, conhecido por seu timbre brilhante e expressivo, essencial em orquestras e música de câmara.$$, $$O oboé surgiu no século XVII na França, evoluindo do shawm medieval. Rapidamente se tornou indispensável nas orquestras barrocas e clássicas, famoso por afinar toda a orquestra com seu "Lá" puro e estável.$$, $$França$$, NULL, $$https://images.unsplash.com/photo-1551798507-629020c81463?w=1200&q=80$$, 11, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9c3a903d-8750-4ded-9341-c876a6d6de93', $$Flauta Doce (Recorder)$$, $$Madeiras$$, $$Sopro$$, $$Flauta vertical de madeira ou plástico. Muito usada no ensino musical e na música antiga/barroca.$$, $$Popular na Renascença e Barroco. Carl Orff a incluiu em seu método pedagógico. Voltou à moda no século XX.$$, $$Europa Medieval$$, 1, $$https://images.unsplash.com/photo-1591006509090-b43d9e1bcc36?w=1200&q=80$$, 41, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', '9edff4db-9ef5-43fc-970a-7d2086de223b', $$Viola Clássica$$, $$cordas friccionadas$$, $$corda$$, $$🎻 Instrumento de corda tocado com arco$$, $$A viola consolidou-se como a voz média das cordas; no séc. XX ganhou concertos de Walton e Bartók.$$, $$Europa (Renascença)$$, NULL, $$https://images.unsplash.com/photo-1589320611604-3c5b3f3f4c03?w=1200&q=80$$, 19, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'a0f53672-7d87-4ab4-a64f-b551fc1a380d', $$Vibrafone$$, $$Percussão Melódica$$, $$Percussão$$, $$Xilofone de metal com motor que cria vibrato. Som característico do jazz, usado por Lionel Hampton e Gary Burton.$$, $$Inventado para vaudeville, tornou-se essencial no jazz. Lionel Hampton o popularizou. Gary Burton revolucionou a técnica com 4 baquetas.$$, $$Estados Unidos, 1921$$, 3, $$https://images.unsplash.com/photo-1563330232-57114bb0823c?w=1200&q=80$$, 209, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ab9720a5-1973-484e-9a44-d4aa62594336', $$Piano$$, $$Cordofones percutidos$$, $$teclado$$, $$🎹 Instrumento de teclado e cordas$$, $$O piano foi inventado por Bartolomeo Cristofori em 1700 na Itália. Originalmente chamado "gravicembalo col piano e forte" (cravo com suave e forte), revolucionou a música por permitir dinâmicas variadas. O piano moderno desenvolveu-se no século XIX com a adição do sistema de escape duplo e o uso de ferro fundido.$$, $$Itália$$, NULL, $$https://images.unsplash.com/photo-1520523839897-bd0b52f945a0?w=1200&q=80$$, 2, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ac116dcb-4fd4-4ef6-b6fb-f4ff1287bf68', $$Saxofone Alto$$, $$Madeiras$$, $$Sopro$$, $$Saxofone médio-agudo, o mais popular da família. Essencial no jazz, usado também em música clássica.$$, $$Charlie Parker revolucionou o jazz com o sax alto. Cannonball Adderley e Paul Desmond são lendas do instrumento.$$, $$Bélgica, 1840 (Adolphe Sax)$$, 2, $$https://images.unsplash.com/photo-1589196799937-ea0c9c2b9b8d?w=1200&q=80$$, 49, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b73f1d80-3d73-487e-89b8-ab35274a8dd4', $$Contrabaixo Acústico$$, $$Cordas Friccionadas$$, $$corda$$, $$🎻 Instrumento de cordas friccionadas com som grave e profundo, essencial em orquestras e jazz.$$, $$O contrabaixo acústico surgiu no final do século XVI como membro da família do violino. Tornou-se fundamental em orquestras sinfônicas, música de câmara e, mais tarde, no jazz e na música popular.$$, $$Europa$$, NULL, $$https://images.unsplash.com/photo-1612225330812-0bcb36db11e1?w=1200&q=80$$, 21, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'b7425269-f2bb-454c-8c61-e3e9d028c9b4', $$Koto$$, $$Cordas Dedilhadas$$, $$Corda$$, $$Cítara japonesa de 13 cordas estendidas sobre ponte móvel. Som delicado e zen, essencial na música tradicional japonesa.$$, $$Usado na música da corte imperial japonesa. Cada ponte pode ser movida para ajustar a afinação. Michio Miyagi foi um mestre compositor.$$, $$Japão, século VIII$$, 3, $$https://images.unsplash.com/photo-1608452964553-9b4d97b2752f?w=1200&q=80$$, 101, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bc665a4e-e301-44d3-b8bf-decb09422d71', $$Steel Drum (Steel Pan)$$, $$Percussão Melódica$$, $$Percussão$$, $$Tambor melódico de metal de Trinidad. Som caribenho alegre, usado em bandas de calipso e soca.$$, $$Único instrumento acústico invent ado no século XX. Feito de barris de petróleo martelados. Som característico do Caribe.$$, $$Trinidad e Tobago, anos 1930$$, 3, $$https://images.unsplash.com/photo-1519892300165-cb5542fb47c7?w=1200&q=80$$, 206, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'bee0f63a-e248-4f2c-9325-0a23cb3c5a8e', $$Ocarina$$, $$Sopro Livre$$, $$Sopro$$, $$Pequeno instrumento ovo de cerâmica. Som doce, popularizada pelo jogo Zelda.$$, $$Existe em várias culturas. Giuseppe Donati criou versão moderna em 1853. Zelda: Ocarina of Time a popularizou.$$, $$China/Itália, antiguidade$$, 1, $$https://images.unsplash.com/photo-1591006509090-b43d9e1bcc36?w=1200&q=80$$, 603, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'c75fe646-ff86-4420-98f0-a0f25d39de45', $$Celesta$$, $$Teclado de Percussão$$, $$Teclado$$, $$Teclado que percute lâminas de metal. Som de caixa de música, usado por Tchaikovsky e John Williams.$$, $$Inventada em 1886. Tchaikovsky a usou na Dança da Fada Açucarada. John Williams a usa extensivamente em Harry Potter.$$, $$França, 1886$$, 2, $$https://images.unsplash.com/photo-1564186763535-ebb21ef5277f?w=1200&q=80$$, 402, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'cca87ab1-8ad4-4876-a8d8-190f85927952', $$Teoria Musical$$, $$A definir$$, $$teoria$$, $$📘 Estudo teórico da música$$, $$História resumida do instrumento Teoria Musical (a completar).$$, $$Origem a completar (região e contexto histórico).$$, NULL, $$https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=1200&q=80$$, 22, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2026-02-13 16:40:07.288861+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'd7c80fe1-ab43-4920-b2aa-d9b4f3ace166', $$Clarinete$$, $$Madeiras$$, $$sopro$$, $$🎶 Instrumento de sopro da família das madeiras$$, $$O clarinete foi desenvolvido no final do século XVII na Alemanha, evoluindo do chalumeau. Com melhorias feitas por Johann Christoph Denner, ganhou chave de registro que permitiu sua ampla tessitura. É utilizado em orquestras, bandas sinfônicas, música popular e jazz.$$, $$Alemanha$$, NULL, $$https://images.unsplash.com/photo-1575384147023-78e8086f98db?w=1200&q=80$$, 10, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'df168c2e-275a-44ed-9ee7-af356bf724e5', $$Balalaica$$, $$Cordas Dedilhadas$$, $$Corda$$, $$Instrumento russo triangular de 3 cordas. Som característico da música folclórica russa.$$, $$Símbolo da música folclórica russa. Existe em vários tamanhos, do piccolo ao contrabaixo. Usado em orquestras de balalicas.$$, $$Rússia, século XVIII$$, 2, $$https://images.unsplash.com/photo-1614963385733-eb25382d1d3e?w=1200&q=80$$, 103, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'df42056c-8a3e-454c-aeca-73b4d608b85c', $$Didgeridoo$$, $$Sopro Livre$$, $$Sopro$$, $$Instrumento aborígene australiano, tubo longo que produz drone hipnótico. Técnica de respiração circular.$$, $$Instrumento sagrado dos aborígenes australianos. Feito de tronco escavado por cupins. Requer respiração circular.$$, $$Austrália (aborígenes), mais de 1500 anos$$, 3, $$https://images.unsplash.com/photo-1565551808976-d3b5e03f8a09?w=1200&q=80$$, 600, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'df49fd27-9bcd-4462-a0f8-b36f0ff9f97f', $$Guitarra$$, $$Cordas dedilhadas amplificadas$$, $$corda$$, $$🎸 Instrumento de corda elétrica$$, $$A guitarra elétrica moderna nasceu na década de 1930, mas suas raízes remontam ao século XVI com a vihuela espanhola. Leo Fender revolucionou o instrumento em 1950 com a Telecaster, seguida pela icônica Stratocaster em 1954. Gibson contribuiu com a Les Paul em 1952. A guitarra tornou-se o símbolo do rock and roll, blues, jazz e música popular mundial. Desde Hendrix até Eddie Van Halen, passando por B.B. King e Eric Clapton, a guitarra definiu gerações e estilos musicais, sendo o instrumento mais versátil da música moderna.$$, $$Espanha (século XVI) / EUA (moderna)$$, NULL, $$https://images.unsplash.com/photo-1516924962500-2b4b3b99ea02?w=1200&q=80$$, 6, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e48ad87b-d237-45e4-a707-05374c4240fa', $$Cravo$$, $$Teclado de Cordas$$, $$Teclado$$, $$Instrumento barroco de cordas pinçadas por plectros. Som cristalino e delicado, muito usado por Bach.$$, $$Principal instrumento de teclado do Barroco. Bach, Handel e Scarlatti compuseram extensamente para ele. Wanda Landowska o reviveu no século XX.$$, $$Europa, século XIV$$, 3, $$https://images.unsplash.com/photo-1563330232-57114bb0823c?w=1200&q=80$$, 400, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'e54b748d-3b1b-48ba-b65e-ec1e476e94ad', $$Tabla$$, $$Percussão de Mão$$, $$Percussão$$, $$Par de tambores indianos, um de metal (bayan) e outro de madeira (dayan). Usado na música clássica indiana.$$, $$Instrumento principal da música clássica do norte da Índia. Zakir Hussain é o maior tablista contemporâneo. Tem linguagem rítmica complexa.$$, $$Índia, século XVIII$$, 3, $$https://images.unsplash.com/photo-1610993541035-08cc7c8fe1b6?w=1200&q=80$$, 204, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'ee709f67-e4e4-4f9c-9001-7574e4d8dfa0', $$Shakuhachi$$, $$Sopro Livre$$, $$Sopro$$, $$Flauta japonesa de bambu com apenas 5 furos. Som meditativo do zen budismo.$$, $$Usada por monges zen para meditação (suizen). Tem apenas 5 furos. Som pode imitar vento.$$, $$Japão, século XVII$$, 3, $$https://images.unsplash.com/photo-1563330232-57114bb0823c?w=1200&q=80$$, 604, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'f8653cdb-e2e7-479a-bfff-c8643859b866', $$Djembe$$, $$Percussão de Mão$$, $$Percussão$$, $$Tambor africano em forma de cálice, tocado com as mãos. Som poderoso e versátil, usado em cerimônias e música contemporânea.$$, $$Originário do Império do Mali no século XII. Pode produzir três tons distintos: grave, médio e agudo dependendo da região percutida.$$, $$África Ocidental (Mali, Guiné)$$, 1, $$https://images.unsplash.com/photo-1563330232-57114bb0823c?w=1200&q=80$$, 200, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

INSERT INTO core.instruments (tenant_id, id, name, family, category, description, detailed_description, origin, difficulty_level, image_url, display_order, is_active, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 'fb125188-c48e-4d89-a46e-11c3b600dabd', $$Clavicórdio$$, $$Teclado de Cordas$$, $$Teclado$$, $$Antecessor do piano com som muito suave. Único teclado antigo que permitia controle de dinâmica.$$, $$Bach o preferia para compor. Som intimista, apenas para ambientes pequenos. Permite vibrato com a tecla.$$, $$Europa Medieval$$, 3, $$https://images.unsplash.com/photo-1520523839897-bd0b52f945a0?w=1200&q=80$$, 401, true, '2025-12-16 00:04:52.501355+00'::timestamptz, '2025-12-16 00:04:52.501355+00'::timestamptz)
ON CONFLICT (id) DO NOTHING;

COMMIT;