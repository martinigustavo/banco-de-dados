-- tabela diretor
INSERT INTO diretor VALUES (1, 'Sofia Coppola', 'F', 'Estados Unidos');
INSERT INTO diretor VALUES (2, 'Clint Eastwood', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (3, 'David Fincher', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (4, 'Christopher Nolan', 'M', 'Inglaterra');
INSERT INTO diretor VALUES (5, 'Quentin Tarantino', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (6, 'Martin Scorsese', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (7, 'Guillermo del Toro', 'M', 'México');
INSERT INTO diretor VALUES (8, 'Bong Joon Ho', 'M', 'Coréia do Sul');
INSERT INTO diretor VALUES (9, 'Kathryn Bigelow', 'F', 'Estados Unidos');
INSERT INTO diretor VALUES (10, 'Greta Gerwig', 'F', 'Estados Unidos');
INSERT INTO diretor VALUES (11, 'Steven Spielberg', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (12, 'James Cameron', 'M', 'Canadá');
INSERT INTO diretor VALUES (13, 'Alfonso Cuarón', 'M', 'México');
INSERT INTO diretor VALUES (14, 'Alejandro G. Iñárrity', 'M', 'México');
INSERT INTO diretor VALUES (15, 'Matt Reeves', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (16, 'Denis Villeneuve', 'M', 'Canadá');
INSERT INTO diretor VALUES (17, 'James Gunn', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (18, 'Patty Jenkins', 'F', 'Estados Unidos');
INSERT INTO diretor VALUES (19, 'Antonio Campos', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (20, 'Niki Caro', 'F', 'Nova Zelândia');
INSERT INTO diretor VALUES (21, 'Leigh Whannell', 'M', 'Austrália');
INSERT INTO diretor VALUES (22, 'Sam Mendes', 'M', 'Inglaterra');
INSERT INTO diretor VALUES (23, 'Taika Waititi', 'M', 'Nova Zelândia');
INSERT INTO diretor VALUES (24, 'Rian Johnson', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (25, 'Todd Phillips', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (26, 'Ari Aster', 'M', 'Estados Unidos');
INSERT INTO diretor VALUES (27, 'Kleber Mendonça Filho', 'M', 'Brasil');
INSERT INTO diretor VALUES (28, 'Edgar Wright', 'M', 'Inglaterra');
INSERT INTO diretor VALUES (29, 'Alfred Hitchcock', 'M', 'Inglaterra');
INSERT INTO diretor VALUES (30, 'José Padilha', 'M', 'Brasil');
INSERT INTO diretor VALUES (31, 'Fernando Meirelles', 'M', 'Brasil');
INSERT INTO diretor VALUES (32, 'Pedro Almodóvar', 'M', 'Espanha');

-- tabela ator
INSERT INTO ator VALUES (1, 'Robert De Niro', 'M', 'Estados Unidos');
INSERT INTO ator VALUES (2, 'Al Pacino', 'M', 'Estados Unidos');
INSERT INTO ator VALUES (3, 'Leonardo DiCaprio', 'M', 'Estados Unidos');
INSERT INTO ator VALUES (4, 'Jonah Hill', 'M', 'Estados Unidos');
INSERT INTO ator VALUES (5, 'Margot Robbie', 'F', 'Austrália');
INSERT INTO ator VALUES (6, 'Idris Elba', 'M', 'Inglaterra');
INSERT INTO ator VALUES (7, 'Alice Braga', 'F', 'Brasil');
INSERT INTO ator VALUES (8, 'Viola Davis', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (9, 'Matthew McConaughey', 'M', 'Estados Unidos');
INSERT INTO ator VALUES (10, 'Maria Bakalova', 'F', 'Bulgária');
INSERT INTO ator VALUES (11, 'Victoria Pedretti', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (12, 'Sacha Baron Cohen', 'M', 'Inglaterra');
INSERT INTO ator VALUES (13, 'Millie Bobby Brown', 'F', 'Espanha');
INSERT INTO ator VALUES (14, 'Dan Levy', 'M', 'Canadá');
INSERT INTO ator VALUES (15, 'Alison Brie', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (16, 'Mackenzie Davis', 'F', 'Canadá');
INSERT INTO ator VALUES (17, 'Kristen Stewart', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (18, 'Aubrey Plaza', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (19, 'Linda Hamilton', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (20, 'Arnold Schwarzenegger', 'M', 'Áustria');
INSERT INTO ator VALUES (21, 'Robert Pattinson', 'M', 'Inglaterra');
INSERT INTO ator VALUES (22, 'Colin Farrell', 'M', 'Irlanda');
INSERT INTO ator VALUES (23, 'Zoë Kravitz', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (24, 'Timothée Chalamet', 'M', 'Estados Unidos');
INSERT INTO ator VALUES (25, 'Rebecca Ferguson', 'F', 'Suécia');
INSERT INTO ator VALUES (26, 'Zendaya', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (27, 'Jason Momoa', 'M', 'Estados Unidos');
INSERT INTO ator VALUES (28, 'Pedro Pascal', 'M', 'Chile');
INSERT INTO ator VALUES (29, 'Gal Gadot', 'F', 'Israel');
INSERT INTO ator VALUES (30, 'Robin Wright', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (31, 'Kristen Wiig', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (32, 'Chloë Grace Moretz', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (33, 'Meryl Streep', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (34, 'Amanda Seyfried', 'F', 'Estados Unidos');
INSERT INTO ator VALUES (35, 'Lily Collins', 'F', 'Inglaterra');

-- tabela exibicao
INSERT INTO exibicao VALUES (generate_series(1, 40),
							 generate_series('01/01/2010'::date, CURRENT_DATE, '100 days'),
							 generate_series('08/01/2010'::date, CURRENT_DATE, '100 days'));

-- tabela filme
INSERT INTO filme VALUES (1, 'O Poderoso Chefão', '175', '1972', 'S', 31, 22);
INSERT INTO filme VALUES (2, 'Esqueceram de Mim', '103', '1990', 'S', 14, 8);
INSERT INTO filme VALUES (3, 'Titanic', '194', '1997', 'S', 21, 18);
INSERT INTO filme VALUES (4, 'Harry Potter e a Pedra Filosofal', '152', '2001', 'S', 4, 12);
INSERT INTO filme VALUES (5, 'O Senhor dos Anéis', '178', '2001', 'N', 11, 10);
INSERT INTO filme VALUES (6, 'Batman: O Cavaleiro das Trevas', '152', '2008', 'N', 22, 19);
INSERT INTO filme VALUES (7, 'Bastardos Inglórios', '153', '2009', 'S', 2, 1);
INSERT INTO filme VALUES (8, 'O Lobo de Wall Street', '180', '2013', 'N', 18, 40);
INSERT INTO filme VALUES (9, 'Interestelar', '169', '2014', 'S', 27, 18);
INSERT INTO filme VALUES (10, 'A Bruxa', '92', '2015', 'N', 20, 20);
INSERT INTO filme VALUES (11, 'Deadpool', '108', '2016', 'S', 32, 23);
INSERT INTO filme VALUES (12, 'Thor: Ragnarok', '130', '2017', 'S', 23, 8);
INSERT INTO filme VALUES (13, 'Homem-Aranha no Aranhaverso', '117', '2018', 'S', 26, 24);
INSERT INTO filme VALUES (14, 'Vingadores: Ultimato', '181', '2019', 'S', 23, 26);
INSERT INTO filme VALUES (15, 'Parasita', '132', '2019', 'N', 1, 9);
INSERT INTO filme VALUES (16, 'Era uma Vez Em... Hollywood', '161', '2019', 'N', 15, 20);
INSERT INTO filme VALUES (17, 'Midsommar', '148', '2019', 'N', 32, 12);
INSERT INTO filme VALUES (18, 'Coringa', '122', '2019', 'S', 13, 22);
INSERT INTO filme VALUES (19, 'Entre Facas e Segredos', '130', '2019', 'S', 5, 27);
INSERT INTO filme VALUES (20, 'Jojo Rabbit', '108', '2019', 'S', 30, 4);
INSERT INTO filme VALUES (21, 'O Homem Invisível', '124', '2020', 'N', 1, 26);

-- tabela filmeator
INSERT INTO filmeator (id_filme, id_ator)
SELECT (i - 1) % 21 + 1,
		ceil(random() * 35)
FROM generate_series(1, 84) s(i);

-- tabela genero
INSERT INTO genero VALUES (1, 'terror');
INSERT INTO genero VALUES (2, 'comédia');
INSERT INTO genero VALUES (3, 'ação');
INSERT INTO genero VALUES (4, 'suspense');
INSERT INTO genero VALUES (5, 'romance');
INSERT INTO genero VALUES (6, 'drama');
INSERT INTO genero VALUES (7, 'fantasia');
INSERT INTO genero VALUES (8, 'aventura');

-- tabela generofilme
INSERT INTO generofilme (id_genero, id_filme)
SELECT ceil(random() * 8),
			(i - 1) % 21 + 1
FROM generate_series(1, 21) s(i);

-- tabela sessao
INSERT INTO sessao VALUES (
	generate_series(1, 7),
	'14:00:00',
	ceil(random() * 21)
);

INSERT INTO sessao VALUES (
	generate_series(8, 14),
	'17:00:00',
	ceil(random() * 21)
);

INSERT INTO sessao VALUES (
	generate_series(15, 21),
	'20:00:00',
	ceil(random() * 21)
);

-- tabela sala
INSERT INTO sala VALUES (1, 50);
INSERT INTO sala VALUES (2, 45);
INSERT INTO sala VALUES (3, 45);
INSERT INTO sala VALUES (4, 50);
INSERT INTO sala VALUES (5, 45);
INSERT INTO sala VALUES (6, 50);

-- tabela ingresso
INSERT INTO ingresso VALUES (
	generate_series(1, 180),
	round((random() * (50-25)) / 5) * 5 + 25,
	ceil(random() * 50),
	ceil(random() * 21),
	ceil(random() * 6)
);

-- tabela funcionario
INSERT INTO funcionario VALUES (1, 'Paulo', '999996666');
INSERT INTO funcionario VALUES (2, 'Marcos', '999996666');
INSERT INTO funcionario VALUES (3, 'Sara', '999996666');
INSERT INTO funcionario VALUES (4, 'Bruna', '999996666');
INSERT INTO funcionario VALUES (5, 'David', '999996666');
INSERT INTO funcionario VALUES (6, 'Glória', '999996666');

-- tabela bilheteria
INSERT INTO bilheteria VALUES (
	generate_series(1, 6),
	generate_series(1, 6)
);

-- tabela bilheteriaingresso
INSERT INTO bilheteriaingresso (id_ingresso, id_bilheteria)
SELECT ceil(random() * 180),
		ceil(random() * 6)		
FROM generate_series(1, 180);