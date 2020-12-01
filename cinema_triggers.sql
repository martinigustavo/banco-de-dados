-- TRIGGERS
-- TRIGGER 1 (ON INSERT & UPDATE):
-- Ao adicionar ou atualizar um ingresso, o valor não poderá ser menor que 25 reais.
-- Caso o valor for menor, o ingresso será atualizado/inserido na tabela com o valor mínimo de 25 reais.
CREATE OR REPLACE FUNCTION f_validapreco_ingresso()
RETURNS TRIGGER
AS $$
DECLARE
	vpreco INT;
BEGIN
	vpreco := 25;
	
	IF NEW.preco < vpreco THEN
		NEW.preco := vpreco;
		UPDATE ingresso SET preco = NEW.preco
		WHERE id = NEW.id;
	END IF;
	
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_validapreco_ingresso
AFTER UPDATE OR INSERT ON ingresso
FOR EACH ROW
EXECUTE PROCEDURE f_validapreco_ingresso();

-- TRIGGER 2 (ON DELETE):
-- O gênero de um filme só poderá ser removido se o filme tiver mais de um gênero cadastrado,
-- caso contrário retornará uma exceção.
CREATE OR REPLACE FUNCTION f_removegenero_filme()
RETURNS TRIGGER
AS $$
DECLARE
	vgencount INT;
BEGIN
	
	SELECT COUNT(*) INTO vgencount
	FROM generofilme
	WHERE id_filme = OLD.id_filme
	GROUP BY id_filme;

	IF vgencount <= 1 THEN
		RAISE EXCEPTION 'Este filme possui apenas UM gênero e não pode ser removido.';
	END IF;	
	
	RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_removegenero_filme
BEFORE DELETE ON generofilme
FOR EACH ROW
EXECUTE PROCEDURE f_removegenero_filme();
