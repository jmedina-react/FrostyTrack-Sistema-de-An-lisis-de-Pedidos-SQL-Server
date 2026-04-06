-- ============================================================
-- FrostyTrack | Ejercicio 09 - Nivel Avanzado
-- Problema: La gerencia quiere segmentar clientes por nivel
--           de gasto para campanas personalizadas.
-- Tablas:   tb_cliente, tb_pedido, tb_detalle_pedido
-- Concepto: JOIN triple + COUNT DISTINCT + SUM + AVG
--           sobre expresion calculada
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    c.cod_cliente,
    c.des_apepaterno + ' ' + c.des_nombres      AS cliente,
    c.des_email,
    COUNT(DISTINCT p.cod_pedido)                AS num_pedidos,
    SUM(d.num_cantidad * d.num_precio_venta)    AS gasto_total,
    AVG(d.num_cantidad * d.num_precio_venta)    AS ticket_promedio
FROM tb_cliente c
INNER JOIN tb_pedido p         ON c.cod_cliente = p.cod_cliente
INNER JOIN tb_detalle_pedido d ON p.cod_pedido  = d.cod_pedido
GROUP BY c.cod_cliente, c.des_apepaterno, c.des_nombres, c.des_email
ORDER BY gasto_total DESC;
