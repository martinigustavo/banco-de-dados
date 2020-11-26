	CREATE TABLE IF NOT EXISTS ator (
		id INT NOT NULL,
		nome VARCHAR(200) NOT NULL,
		genero CHAR(1),
		nacionalidade VARCHAR(45),
		CONSTRAINT pk_ator PRIMARY KEY (id)
	);

	CREATE TABLE IF NOT EXISTS diretor (
		id INT NOT NULL,
		nome VARCHAR(200) NOT NULL,
		genero CHAR(1),
		nacionalidade VARCHAR(45),
		CONSTRAINT pk_diretor PRIMARY KEY (id)
	);

	CREATE TABLE IF NOT EXISTS exibicao (
		id INT NOT NULL,
		data_inicio DATE,
		data_fim DATE,
		CONSTRAINT pk_exibicao PRIMARY KEY (id)
	);

	CREATE TABLE IF NOT EXISTS funcionario (
		id INT NOT NULL,
		nome VARCHAR(200) NOT NULL,
		telefone VARCHAR(200),
		CONSTRAINT pk_funcionario PRIMARY KEY (id)
	);

	CREATE TABLE IF NOT EXISTS genero (
		id INT NOT NULL,
		descricao VARCHAR(45) NOT NULL,
		CONSTRAINT pk_genero PRIMARY KEY (id)
	);

	CREATE TABLE IF NOT EXISTS sala (
		id INT NOT NULL,
		capacidade INT,
		CONSTRAINT pk_sala PRIMARY KEY (id)
	);

	CREATE TABLE IF NOT EXISTS filme (
		id INT NOT NULL,
		nome VARCHAR(200) NOT NULL,
		duracao INT,
		ano INT,
		dublado CHAR(1),
		id_diretor INT NOT NULL,
		id_exibicao INT NOT NULL,
		CONSTRAINT pk_filme PRIMARY KEY (id),
		CONSTRAINT fk_id_diretor_filme FOREIGN KEY (id_diretor) REFERENCES diretor,
		CONSTRAINT fk_id_exibicao_filme FOREIGN KEY (id_exibicao) REFERENCES exibicao
	);

	CREATE TABLE IF NOT EXISTS filmeator (
		id_filme INT NOT NULL,
		id_ator INT NOT NULL,
		CONSTRAINT fk_id_filme_elenco FOREIGN KEY(id_filme) REFERENCES filme,
		CONSTRAINT fk_id_ator_elenco FOREIGN KEY(id_ator) REFERENCES ator
	);

	CREATE TABLE IF NOT EXISTS generofilme (
		id_genero INT NOT NULL,
		id_filme INT NOT NULL,
		CONSTRAINT fk_id_genero_generofilme FOREIGN KEY (id_genero) REFERENCES genero,
		CONSTRAINT fk_id_filme_generofilme FOREIGN KEY (id_filme) REFERENCES filme
	);

	CREATE TABLE IF NOT EXISTS sessao (
		id INT NOT NULL,
		horario TIME,
		id_filme INT NOT NULL,
		CONSTRAINT pk_sessao PRIMARY KEY (id),
		CONSTRAINT fk_id_filme_sessao FOREIGN KEY (id_filme) REFERENCES filme
	);

	CREATE TABLE IF NOT EXISTS ingresso (
		id INT NOT NULL,
		preco FLOAT NOT NULL,
		cadeira VARCHAR(45) NOT NULL,
		id_sessao INT NOT NULL,
		id_sala INT NOT NULL,
		CONSTRAINT pk_ingresso PRIMARY KEY (id),
		CONSTRAINT fk_id_sessao_ingresso FOREIGN KEY (id_sessao) REFERENCES sessao,
		CONSTRAINT fk_id_sala_ingresso FOREIGN KEY (id_sala) REFERENCES sala
	);

	CREATE TABLE IF NOT EXISTS bilheteria (
		id INT NOT NULL,
		id_funcionario INT NOT NULL,
		CONSTRAINT pk_bilheteria PRIMARY KEY (id),
		CONSTRAINT fk_id_funcionario_bilheteria FOREIGN KEY (id_funcionario) REFERENCES funcionario
	);

	CREATE TABLE IF NOT EXISTS bilheteriaingresso (
		id_ingresso INT NOT NULL,
		id_bilheteria INT NOT NULL,
		CONSTRAINT fk_id_ingresso_bilheteriaingresso FOREIGN KEY (id_ingresso) REFERENCES ingresso,
		CONSTRAINT fk_id_bilheteria_bilheteriaingresso FOREIGN KEY (id_bilheteria) REFERENCES bilheteria
	);