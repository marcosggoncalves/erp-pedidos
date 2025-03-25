SELECT 
  C.NOME, 
  SUM(P.TOTAL) AS VALOR_GASTO,
  COUNT(P.ID) AS QUANTIDADE_PEDIDOS
FROM PEDIDO P
INNER JOIN CLIENTE C ON C.ID = P.CLIENTE_ID
WHERE P.DATA_PEDIDO BETWEEN '22.03.2025' AND '25.03.2025'
GROUP BY C.ID, C.NOME;
