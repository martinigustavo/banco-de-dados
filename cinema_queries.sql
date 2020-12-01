-- VIEWS
-- VIEW 1:
-- Retorna lista de filmes e respectivos atores.
CREATE OR REPLACE VIEW v_filmes_atores AS
SELECT f.id AS id_filme, a.id AS id_ator
FROM filme f, ator a, filmeator fa
WHERE f.id = fa.id_filme AND fa.id_ator = a.id
ORDER BY f.id;

-- VIEW 2:
-- Retorna lista de filmes e respectivos diretores.
CREATE OR REPLACE VIEW v_filmes_diretores AS
SELECT f.id AS id_filme, d.id AS id_diretor
FROM filme f, diretor d
WHERE f.id_diretor = d.id
ORDER BY f.id;

-- VIEW 3:
-- Retorna lista de filmes exibidos nas férias de janeiro.
CREATE OR REPLACE VIEW v_exibicao_janeiro AS
SELECT f.id AS id_filme, e.data_inicio
FROM filme f, exibicao e
WHERE f.id_exibicao = e.id AND extract(month from e.data_inicio) = '01';

-- QUERY 1: 
-- Descobrir qual o gênero com a maior quantidade de filmes que já foram exibidos neste cinema.
-- Mostrar a quantidade de filmes para cada gênero ordenando do maior para o menor e a descrição de cada um.
-- O resultado para está query será mostrado na primeira fileira.
SELECT COUNT(*) qtde_filmes_gen, g.descricao
FROM generofilme gf, genero g
WHERE gf.id_genero = g.id
GROUP BY g.descricao
ORDER BY qtde_filmes_gen DESC;

-- QUERY 2:
-- O cinema quer homenagear o diretor que já teve mais filmes em cartaz, para isso, realize uma query
-- para mostrar o nome do diretor, o país, quantidade de filmes dirigidos pelo mesmo e a primeira data de exibição 
-- do diretor neste cinema.
-- O resultado para está query será mostrado na primeira fileira.
-- Caso haja empate entre diretores, o diretor que tiver o filme com exibição mais antiga será homenageado.
SELECT d.nome, d.nacionalidade, COUNT(f.*) qtde_filmes_diretor, MIN(e.data_inicio) AS data_exib
FROM diretor d
LEFT JOIN v_filmes_diretores v ON v.id_diretor = d.id
LEFT JOIN filme f ON v.id_filme = f.id
LEFT JOIN exibicao e ON f.id_exibicao = e.id
GROUP BY d.nome, d.nacionalidade
ORDER BY qtde_filmes_diretor DESC, data_exib;

-- QUERY 3:
-- Descobrir o filme campeão em bilheteria desta unidade de cinema.
-- Mostrar a quantidade de ingressos vendidos pra cada filme, o nome do filme, ano de lançamento e o nome do diretor.
-- O resultado para está query será mostrado na primeira fileira.
SELECT COUNT(*) qtde_ingresso_filme, f.nome AS filme, f.ano, d.nome AS diretor
FROM filme f, sessao s, ingresso i, diretor d
WHERE f.id = s.id_filme AND i.id_sessao = s.id AND f.id_diretor = d.id
GROUP BY f.nome, f.ano, d.nome
ORDER BY qtde_ingresso_filme DESC;

-- QUERY 4:
-- O funcionario que mais vendeu ingressos receberá um adicional no salário.
-- Mostrar a lista de funcionários e, para cada um, mostrar a quantidade de ingressos vendidos pelo mesmo, seu nome,
-- a bilheteria em que trabalha e o valor total arrecadado na bilheteria, ordenando pelo numero total de ingressos vendidos.
-- O resultado para está query será mostrado na primeira fileira.
SELECT COUNT(*) qtde_ingresso_func, f.nome AS func, b.id AS bilheteria, SUM(i.preco)
FROM funcionario f, bilheteria b, bilheteriaingresso bi, ingresso i
WHERE f.id = b.id_funcionario AND b.id = bi.id_bilheteria AND bi.id_ingresso = i.id
GROUP BY f.nome, b.id
ORDER BY qtde_ingresso_func DESC;

-- QUERY 5:
-- Mostrar a quantidade de atores de cada gênero para cada filme já exibido.
-- Mostrar nome do filme, o ano de lançamento e a quantidade de atores de cada genero.
-- O resultado será agrupado pelo gênero Feminino e Masculino, com a contagem da quantidade de atores de cada gênero
-- ao lado.
SELECT f.nome AS filme, f.ano AS lancamento, a.genero, COUNT(a.genero) AS genero_count
FROM v_filmes_atores v, filme f, ator a
WHERE v.id_filme = f.id AND v.id_ator = a.id
GROUP BY a.genero, f.nome, f.ano
ORDER BY filme;

-- QUERY 6:
-- As férias no mês de janeiro é a época em que mais pessoas passam a frequentar o cinema.
-- Por isso, mostre os filmes que já foram exibidos no mês de janeiro de todos os anos.
-- Mostrar o nome do filme, o diretor, a data de exibicao e o valor arrecadado em bilheteria.
SELECT f.nome AS filme, d.nome AS diretor, v.data_inicio AS exibicao,SUM(i.preco) AS total_arrecadado
FROM v_exibicao_janeiro v
LEFT JOIN filme f ON v.id_filme = f.id
LEFT JOIN diretor d ON f.id_diretor = d.id
LEFT JOIN sessao s ON f.id = s.id_filme
LEFT JOIN ingresso i ON s.id = i.id_sessao
LEFT JOIN bilheteriaingresso bi ON bi.id_ingresso = i.id
GROUP BY f.id, d.nome, exibicao;

-- QUERY 7:
-- Verificar se o filme exibido que mais vendeu ingressos é o mesmo filme que possui maior valor arrecadado.
-- Mostrar a id do filme, o nome e o total arrecadado.
-- Se o filme for o mesmo nas duas consultas, ele será retornado no resultado, caso contrário
-- não terá nenhum retorno.
SELECT f.id AS id_filme, f.nome AS filme, SUM(i.preco) AS total_arrecadado
FROM filme f, sessao s, ingresso i, bilheteriaingresso bi
WHERE f.id = s.id_filme AND i.id_sessao = s.id AND bi.id_ingresso = i.id
		AND f.id IN (SELECT f.id
						FROM filme f, sessao s, ingresso i, bilheteriaingresso bi
						WHERE f.id = s.id_filme AND i.id_sessao = s.id AND bi.id_ingresso = i.id
						GROUP BY f.id
						ORDER BY COUNT(bi.*) DESC LIMIT 1)
GROUP BY f.id
ORDER BY total_arrecadado;

-- QUERY 8:
-- Utilizar a procedure f_ingressos_vendidos(DATE, DATE) para calcular o valor total dos ingressos vendidos
-- no ano de 2018 e qual foi o filme com mais ingressos vendidos.
SELECT SUM(f.preco) AS total_arrecadado_periodo, (SELECT f1.filme
					  FROM f_ingressos_vendidos('01/01/18', '31/12/18') f1
					  GROUP BY f1.filme
					  ORDER BY COUNT(f1.filme) DESC LIMIT 1
					 ) AS filme_campeao_bilh_periodo
FROM f_ingressos_vendidos('01/01/18', '31/12/18') f;

-- QUERY 9:
-- Utilizar a procedure f_atores_genero(CHAR(1)) para buscar os filmes que são estrelados somente por atores do
-- gênero feminino (F).
SELECT f.id AS id_filme, f.nome AS filme, COUNT(f1.genero) AS qtde_atrizes
FROM f_atores_genero('F') f1, filmeator fa, filme f
WHERE f1.id_ator = fa.id_ator AND f.id = fa.id_filme
GROUP BY f.id
HAVING COUNT(f1.genero) = 4
ORDER BY id_filme;

-- QUERY 10:
-- Para o cinema é muito importante saber quais os filmes que as pessoas não tem interesse em ver.
-- Procurar os filmes que não tiveram ingressos vendidos e mostrar seu nome, data de exibição e gênero do filme,
-- ordenando pelo gênero.
SELECT f.nome AS filme, e.data_inicio AS exibicao, g.descricao AS genero
FROM filme f, exibicao e, generofilme gf, genero g
WHERE f.id_exibicao = e.id AND gf.id_filme = f.id AND g.id = gf.id_genero
		AND f.id NOT IN (SELECT f.id
						FROM ingresso i, bilheteriaingresso bi, sessao s, filme f
						WHERE i.id = bi.id_ingresso AND i.id_sessao = s.id AND f.id = s.id_filme
						GROUP BY f.id
						ORDER BY COUNT(bi.*))
ORDER BY genero;

-- PROCEDURES COM PARÂMETROS
-- PROCEDURE 1:
-- Buscar ingressos vendidos em alguma faixa de tempo específica, passando como parâmetros a data inicial do período
-- e a data final.
CREATE OR REPLACE FUNCTION f_ingressos_vendidos(p_dataini DATE, p_datafim DATE)
RETURNS TABLE (ingresso INT, preco FLOAT, cadeira VARCHAR(45), sala INT, capacidade_sala INT, filme VARCHAR(200))
AS $$
BEGIN
	RETURN QUERY SELECT i.id, i.preco, i.cadeira, s.id, s.capacidade, f.nome
	FROM ingresso i, bilheteriaingresso bi, sala s, sessao ss, filme f, exibicao e
	WHERE i.id = bi.id_ingresso AND i.id_sala = s.id AND ss.id = i.id_sessao AND ss.id_filme = f.id AND e.id = f.id_exibicao
			AND e.data_inicio >= p_dataini AND e.data_inicio <= p_datafim;
END;
$$ LANGUAGE plpgsql;

-- PROCEDURE 2:
-- Buscar atores pelo gênero, passando como parâmetro o gênero.
CREATE OR REPLACE FUNCTION f_atores_genero(p_genero CHAR(1))
RETURNS TABLE (id_ator INT, nome VARCHAR(200), genero CHAR(1), nacionalidade VARCHAR(45))
AS $$
BEGIN
	RETURN QUERY SELECT *
	FROM ator a
	WHERE a.genero = p_genero;
END;
$$ LANGUAGE plpgsql;