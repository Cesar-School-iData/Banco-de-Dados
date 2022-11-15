INSERT INTO unidade(nome_predio)
VALUES ("Brum"), ("Bom Jesus"), ("Tiradentes");

INSERT INTO ambiente(andar, espaco, numero, unidade_id)
VALUES (1, "Sala", 10, 1), (2, "Auditorio", 0, 2), (1, "Auditorio", 0, 2);

INSERT INTO usuario(email)
VALUES ("marcoantonio16092003@gmail.com"), ("marcoantonio1609@gmail.com"), ("marcoantonio16@gmail.com"), ("Andre@cesar.org");

INSERT INTO reportador(problemas_reportados, usuario_id)
VALUES (10, 1), (40, 2), (50, 3);

INSERT INTO administrador(senha, usuario_id)
VALUES ("admin1234", 4);

INSERT INTO problema(categoria, especificacao, status, administrador_id, ambiente_id)
VALUES ("Mobilia", "luz", 0, 4, 2), ("Mobilia", "Ar condicionado", 0, 4, 1), ("Eletronico", "Extensão", 0, 4, 3);

UPDATE problema
SET status = 1
WHERE id > 0;

DELETE FROM problema 
WHERE id < 4;

SELECT *
FROM unidade
ORDER BY id;

SELECT *
FROM ambiente
ORDER BY id;

SELECT *
FROM usuario
ORDER BY id;

SELECT *
FROM reportador
ORDER BY usuario_id;

SELECT *
FROM administrador
ORDER BY usuario_id;

SELECT *
FROM problema
ORDER BY id;