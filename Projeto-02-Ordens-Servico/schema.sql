CREATE DATABASE empresa;
USE empresa;

CREATE TABLE cliente (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE tecnico (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE servico (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(150) NOT NULL,
    valor DECIMAL(10,2),
    PRIMARY KEY (id)
);

CREATE TABLE ordemservico (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cliente_id INT UNSIGNED NOT NULL,
    tecnico_id INT UNSIGNED NOT NULL,
    dataAbertura DATE,
    status VARCHAR(30),
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (tecnico_id) REFERENCES tecnico(id)
);

CREATE TABLE ordemservico_servico (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ordemservico_id INT UNSIGNED NOT NULL,
    servico_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ordemservico_id) REFERENCES ordemservico(id),
    FOREIGN KEY (servico_id) REFERENCES servico(id)
);

CREATE TABLE finalizacao (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ordemservico_id INT UNSIGNED NOT NULL,
    dataFinalizacao DATE,
    observacao VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (ordemservico_id) REFERENCES ordemservico(id)
);
