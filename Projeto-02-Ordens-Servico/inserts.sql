-- Inserção de clientes

INSERT INTO cliente
(Nome, Telefone, Email, Endereco, DataCadastro)
VALUES
('João Silva','21999999999',
'joao@email.com',
'Rua A, 100',
'2026-01-10');

-- Inserção de técnicos

INSERT INTO tecnico
(Nome, Telefone, Email, Endereco, Especialidade, DataAdmissao)
VALUES
('Carlos Souza',
'21988888888',
'carlos@email.com',
'Rua B, 200',
'Informática',
'2026-01-15');

-- Inserção de serviços

INSERT INTO servico
(Descricao, ValorPadrao, TempoEstimado)
VALUES
('Manutenção Preventiva',
150.00,
'02:00:00');
