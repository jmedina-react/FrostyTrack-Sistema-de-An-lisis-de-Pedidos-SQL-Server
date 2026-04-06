-- ============================================================
-- FrostyTrack | Ejercicio 12 - Subquery Escalar
-- Problema: Identificar clientes del segmento premium:
--           aquellos que gastaron mas que el promedio general.
-- Tablas:   tb_cliente, tb_pedido, tb_detalle_pedido
-- Concepto: Subquery escalar en HAVING + derived table
--           para calcular el promedio de gastos por cliente
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    c.cod_cliente,
    c.des_apepaterno + ' ' + c.des_nombres      AS cliente,
    c.des_email,
    SUM(d.num_cantidad * d.num_precio_venta)    AS gasto_total
FROM tb_cliente c
INNER JOIN tb_pedido p         ON c.cod_cliente = p.cod_cliente
INNER JOIN tb_detalle_pedido d ON p.cod_pedido  = d.cod_pedido
GROUP BY c.cod_cliente, c.des_apepaterno, c.des_nombres, c.des_email
HAVING SUM(d.num_cantidad * d.num_precio_venta) >
    (
        -- Subquery: promedio de gasto total por cliente
        SELECT AVG(sub.total)
        FROM (
            SELECT SUM(d2.num_cantidad * d2.num_precio_venta) AS total
            FROM tb_pedido p2
            INNER JOIN tb_detalle_pedido d2 ON p2.cod_pedido = d2.cod_pedido
            GROUP BY p2.cod_cliente
        ) sub
    )
ORDER BY gasto_total DESC;
