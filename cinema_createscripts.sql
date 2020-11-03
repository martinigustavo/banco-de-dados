CREATE TABLE IF NOT EXISTS ator (
	id INT NOT NULL PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
	genero CHAR(1),
	nacionalidade VARCHAR(45),
	oscar_winner CHAR(1)
)

CREATE TABLE IF NOT EXISTS elenco (
	id INT NOT NULL PRIMARY KEY,
	CONSTRAINT fk_id_ator_elenco FOREIGN KEY(id) REFERENCES ator
)

CREATE TABLE IF NOT EXISTS diretor (
	id INT NOT NULL PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
	genero CHAR(1),
	nacionalidade VARCHAR(45)
)

CREATE TABLE IF NOT EXISTS exibicao (
	id INT NOT NULL PRIMARY KEY,
	data_inicio DATE,
	data_fim DATE
)

CREATE TABLE IF NOT EXISTS filme (
	id INT NOT NULL PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
	sinopse TEXT,
	duracao INT,
	ano INT,
	lingua VARCHAR(45),
	nacionalidade VARCHAR(45),
	website VARCHAR(45),
	CONSTRAINT fk_id_diretor_filme FOREIGN KEY (id) REFERENCES diretor,
	CONSTRAINT fk_id_elenco_filme FOREIGN KEY (id) REFERENCES elenco,
	CONSTRAINT fk_id_exibicao_filme FOREIGN KEY (id) REFERENCES exibicao
)