SELECT * FROM produto;

SELECT * FROM pedidoproduto;

SELECT
    p.id AS pedido,
    pr.descricao AS produto,
    pp.quantidadeProduto
FROM pedidoproduto pp
JOIN produto pr ON pp.produto_id = pr.id
JOIN pedido p ON pp.pedido_id = p.id;

SELECT * FROM cliente;
