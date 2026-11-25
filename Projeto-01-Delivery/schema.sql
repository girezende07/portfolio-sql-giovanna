CREATE DATABASE delivery_db;
USE delivery_db;

CREATE TABLE tipoproduto (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(50) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE estado (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(100) NULL,
  sigla CHAR(2) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE statusPedido (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(30) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE usuario (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(100) NULL,
  senha VARCHAR(20) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE produto (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  tipoproduto_id INT UNSIGNED NOT NULL,
  descricao VARCHAR(150) NULL,
  valorUnitario DECIMAL(8,2) NULL,
  estoque INT UNSIGNED NULL,
  tipo VARCHAR(100) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (tipoproduto_id) REFERENCES tipoproduto(id)
);

CREATE TABLE cidade (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  estado_id INT UNSIGNED NOT NULL,
  descricao VARCHAR(100) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (estado_id) REFERENCES estado(id)
);

CREATE TABLE entregador (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  cidade_id INT UNSIGNED NOT NULL,
  cnh VARCHAR(20) NULL,
  nome VARCHAR(50) NULL,
  endereco VARCHAR(100) NULL,
  telefone VARCHAR(20) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE cliente (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  cidade_id INT UNSIGNED NOT NULL,
  usuario_id INT UNSIGNED NOT NULL,
  nome VARCHAR(150) NULL,
  telefone VARCHAR(20) NULL,
  dataNascimento DATE NULL,
  genero VARCHAR(20) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE restaurante (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  cidade_id INT UNSIGNED NOT NULL,
  razaoSocial VARCHAR(150) NULL,
  nomeFantasia VARCHAR(150) NULL,
  telefone VARCHAR(30) NULL,
  endereco VARCHAR(150) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE endereco (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  cliente_id INT UNSIGNED NOT NULL,
  rua VARCHAR(100) NULL,
  numeroImovel VARCHAR(10) NULL,
  complemento VARCHAR(30) NULL,
  bairro VARCHAR(50) NULL,
  cep VARCHAR(10) NULL,
  pontoReferencia VARCHAR(100) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE funcionario (
  usuario_id INT UNSIGNED NOT NULL,
  restaurante_id INT UNSIGNED NOT NULL,
  cidade_id INT UNSIGNED NULL,
  nome VARCHAR(150) NULL,
  dataAdmissao DATE NULL,
  dataNascimento DATE NULL,
  endereco VARCHAR(100) NULL,
  telefone VARCHAR(30) NULL,
  PRIMARY KEY (usuario_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (restaurante_id) REFERENCES restaurante(id),
  FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE pedido (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  statusPedido_id INT UNSIGNED NOT NULL,
  entregador_id INT UNSIGNED NOT NULL,
  restaurante_id INT UNSIGNED NOT NULL,
  cliente_id INT UNSIGNED NOT NULL,
  endereco_id INT UNSIGNED NOT NULL,
  dataPedido DATE NULL,
  valorPedido DECIMAL(10,2) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (endereco_id) REFERENCES endereco(id),
  FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  FOREIGN KEY (restaurante_id) REFERENCES restaurante(id),
  FOREIGN KEY (entregador_id) REFERENCES entregador(id),
  FOREIGN KEY (statusPedido_id) REFERENCES statusPedido(id)
);

CREATE TABLE pedidoproduto (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  produto_id INT UNSIGNED NOT NULL,
  pedido_id INT UNSIGNED NOT NULL,
  quantidadeProduto INT UNSIGNED NULL,
  valorUnitario DECIMAL(10,2) NULL,
  desconto DECIMAL(10,2) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pedido_id) REFERENCES pedido(id),
  FOREIGN KEY (produto_id) REFERENCES produto(id)
);
