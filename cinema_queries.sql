-- VIEW 1 -- filmes com atores
CREATE OR REPLACE VIEW v_filmes_atores AS
SELECT f.id AS id_filme, a.id AS id_ator
FROM filme f, ator a, filmeator fa
WHERE f.id = fa.id_filme AND fa.id_ator = a.id
ORDER BY f.id;

-- VIEW 2 -- FILMES com genero e diretor
CREATE OR REPLACE VIEW v_filmes_diretores AS
SELECT f.id AS id_filme, d.id AS id_diretor
FROM filme f, diretor d
WHERE f.id_diretor = d.id;

-- VIEW 3 -- numero de filmes por genero


-- QUERY 1: 
-- Descobrir qual o gênero com a maior quantidade de filmes que já foram exibidos no cinema.
-- Mostrar a quantidade de filmes para cada gênero ordenando do maior para o menor e a descrição de cada um.
SELECT COUNT(*) qtde_filmes_gen, g.descricao
FROM generofilme gf, genero g
WHERE gf.id_genero = g.id
GROUP BY g.descricao
ORDER BY qtde_filmes_gen DESC;

-- QUERY 2:
-- O cinema quer homenagear o diretor que já teve mais filmes em cartaz, para isso, realize uma query
-- para mostrar o nome do diretor, o país e quantidade de filmes dirigidos pelo mesmo.
SELECT COUNT(*) qtde_filmes_diretor, d.nome, d.nacionalidade
FROM filme f, diretor d
WHERE f.id_diretor = d.id
GROUP BY d.nome, d.nacionalidade
ORDER BY qtde_filmes_diretor DESC;

-- QUERY 3:
-- Descobrir o filme campeão em bilheteria desta unidade de cinema.
-- Mostrar a quantidade de ingressos vendidos pra cada filme, o nome do filme, ano de lançamento e o nome do diretor.
SELECT COUNT(*) qtde_ingresso_filme, f.nome AS filme, f.ano, d.nome AS diretor
FROM filme f, sessao s, ingresso i, diretor d
WHERE f.id = s.id_filme AND i.id_sessao = s.id AND f.id_diretor = d.id
GROUP BY f.nome, f.ano, d.nome
ORDER BY qtde_ingresso_filme DESC;

-- QUERY 4:
-- O funcionario que mais vendeu ingressos receberá um adicional no salário.
-- Mostrar a lista de funcionários e, para cada um, mostrar a quantidade de ingressos vendidos pelo mesmo, seu nome,
-- a bilheteria em que trabalha e o valor total arrecadado na bilheteria, ordenando pelo numero total de ingressos vendidos.
SELECT COUNT(*) qtde_ingresso_func, f.nome AS func, b.id AS bilheteria, SUM(i.preco)
FROM funcionario f, bilheteria b, bilheteriaingresso bi, ingresso i
WHERE f.id = b.id_funcionario AND b.id = bi.id_bilheteria AND bi.id_ingresso = i.id
GROUP BY f.nome, b.id
ORDER BY qtde_ingresso_func DESC;

-- QUERY 5:
-- Para
-- criar procedure pra mostrar o valor arrecadado por bilheteria em algum ano

-- QUERY 6:
-- genero dos atores, usar view pra ver atores sexo F de cada filme


-- QUERY 7:
-- ...


-- QUERY 8:
-- ...


-- QUERY 9:
-- ...


-- QUERY 10:
-- ...
