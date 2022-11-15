CREATE SCHEMA db_idata2;

CREATE TABLE unidade(
	id BIGINT NOT NULL AUTO_INCREMENT,
    nome_predio VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE(nome_predio)
);

CREATE TABLE ambiente(
	id BIGINT NOT NULL AUTO_INCREMENT,
    andar INTEGER NOT NULL,
    espaco VARCHAR(255) NOT NULL,
    numero INTEGER NOT NULL,
    unidade_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (unidade_id) REFERENCES unidade(id)
);

CREATE TABLE usuario(
	id BIGINT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
)ENGINE = InnoDB;

CREATE TABLE administrador(
	senha VARCHAR(255) NOT NULL,
    usuario_id BIGINT NOT NULL,
    PRIMARY KEY (usuario_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;

CREATE TABLE reportador(
	problemas_reportados BIGINT NOT NULL,
    usuario_id BIGINT NOT NULL,
    PRIMARY KEY (usuario_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;

CREATE TABLE problema(
	id BIGINT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(255) NOT NULL,
    especificacao VARCHAR(255) NOT NULL,
    status INTEGER NOT NULL,
    administrador_id BIGINT,
    ambiente_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (administrador_id) REFERENCES administrador (usuario_id),
    FOREIGN KEY (ambiente_id) REFERENCES ambiente (id)
);

CREATE TABLE reporta(
	data_hora DATETIME(6) NOT NULL,
    observação VARCHAR(255),
    reportador_id BIGINT NOT NULL,
    problema_id BIGINT NOT NULL,
    FOREIGN KEY (reportador_id) REFERENCES reportador (usuario_id),
    FOREIGN KEY (problema_id) REFERENCES problema (id),
    PRIMARY KEY (problema_id, reportador_id)
);