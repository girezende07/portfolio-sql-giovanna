-- Listar clientes

SELECT *
FROM cliente;

-- Listar técnicos

SELECT *
FROM tecnico;

-- Listar serviços

SELECT *
FROM servico;

-- Consultar ordens de serviço e clientes

SELECT
    o.IdOrdemServico,
    c.Nome,
    o.Equipamento,
    o.Estado
FROM ordemservico o
INNER JOIN cliente c
ON o.IdCliente = c.IdCliente;

-- Quantidade de ordens por técnico

SELECT
    t.Nome,
    COUNT(o.IdOrdemServico) AS TotalOrdens
FROM tecnico t
INNER JOIN ordemservico o
ON t.IdTecnico = o.IdTecnico
GROUP BY t.Nome;
