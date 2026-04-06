-- ============================================================
-- FrostyTrack | Ejercicio 06 - Nivel Intermedio
-- Problema: Marketing quiere identificar clientes frecuentes
--           (3 o mas pedidos) para ofrecerles fidelizacion.
-- Tablas:   tb_cliente, tb_pedido
-- Concepto: INNER JOIN + GROUP BY + HAVING
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    c.cod_cliente,
    c.des_apepaterno + ' ' + c.des_nombres  AS cliente,
    c.des_email,
    COUNT(p.cod_pedido)                     AS total_pedidos
FROM tb_cliente c
INNER JOIN tb_pedido p ON c.cod_cliente = p.cod_cliente
GROUP BY c.cod_cliente, c.des_apepaterno, c.des_nombres, c.des_email
HAVING COUNT(p.cod_pedido) >= 3
ORDER BY total_pedidos DESC;
