CREATE DATABASE empresa;
USE empresa;

CREATE TABLE cliente (
  IdCliente int NOT NULL AUTO_INCREMENT,
  Nome varchar(50) DEFAULT NULL,
  Telefone varchar(20) DEFAULT NULL,
  Email varchar(50) DEFAULT NULL,
  Endereco varchar(100) DEFAULT NULL,
  DataCadastro date DEFAULT NULL,
  PRIMARY KEY (IdCliente)
);

CREATE TABLE tecnico (
  IdTecnico int NOT NULL AUTO_INCREMENT,
  Nome varchar(50) NOT NULL,
  Telefone varchar(20) DEFAULT NULL,
  Email varchar(50) DEFAULT NULL,
  Endereco varchar(100) DEFAULT NULL,
  Especialidade varchar(50) DEFAULT NULL,
  DataAdmissao date DEFAULT NULL,
  PRIMARY KEY (IdTecnico)
);

CREATE TABLE servico (
  IdServico int NOT NULL AUTO_INCREMENT,
  Descricao varchar(100) NOT NULL,
  ValorPadrao decimal(7,2) DEFAULT NULL,
  TempoEstimado time DEFAULT NULL,
  PRIMARY KEY (IdServico)
);

CREATE TABLE ordemservico (
  IdOrdemServico int NOT NULL AUTO_INCREMENT,
  DataAbertura datetime NOT NULL,
  Equipamento varchar(50) DEFAULT NULL,
  Problema varchar(100) DEFAULT NULL,
  Observacao varchar(200) DEFAULT NULL,
  Prioridade enum('Baixa','Média','Alta') DEFAULT NULL,
  Estado enum('Aberta','Em execução','Concluída') DEFAULT NULL,
  IdCliente int DEFAULT NULL,
  IdTecnico int DEFAULT NULL,
  IdFinalizacao int DEFAULT NULL,
  PRIMARY KEY (IdOrdemServico),
  KEY IdTecnico (IdTecnico),
  KEY IdCliente (IdCliente),
  CONSTRAINT ordemservico_ibfk_1
    FOREIGN KEY (IdTecnico)
    REFERENCES tecnico (IdTecnico),
  CONSTRAINT ordemservico_ibfk_2
    FOREIGN KEY (IdCliente)
    REFERENCES cliente (IdCliente)
);

CREATE TABLE finalizacao (
  IdFinalizacao int NOT NULL AUTO_INCREMENT,
  IdOrdemServico int DEFAULT NULL,
  DataFinalizacao datetime DEFAULT NULL,
  DataEntrega date DEFAULT NULL,
  ValorTotal decimal(7,2) DEFAULT NULL,
  FormaPagamento enum('Dinheiro','Cartão','Pix') DEFAULT NULL,
  GarantiaDias int DEFAULT NULL,
  Observacao varchar(200) DEFAULT NULL,
  PRIMARY KEY (IdFinalizacao),
  KEY IdOrdemServico (IdOrdemServico),
  CONSTRAINT finalizacao_ibfk_1
    FOREIGN KEY (IdOrdemServico)
    REFERENCES ordemservico (IdOrdemServico)
);

CREATE TABLE ordemservico_servico (
  IdOrdemServico int NOT NULL,
  IdServico int NOT NULL,
  Quantidade int DEFAULT NULL,
  ValorUnitário decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (IdOrdemServico, IdServico),
  KEY IdServico (IdServico),
  CONSTRAINT ordemservico_servico_ibfk_1
    FOREIGN KEY (IdOrdemServico)
    REFERENCES ordemservico (IdOrdemServico),
  CONSTRAINT ordemservico_servico_ibfk_2
    FOREIGN KEY (IdServico)
    REFERENCES servico (IdServico)
);
