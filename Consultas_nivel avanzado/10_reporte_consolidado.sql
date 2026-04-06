-- ============================================================
-- FrostyTrack | Ejercicio 10 - Nivel Avanzado
-- Problema: El area comercial necesita un reporte consolidado
--           con cliente, distrito, horario preferido y gasto.
-- Tablas:   tb_cliente, tb_ubigeo, tb_pedido,
--           tb_horario, tb_detalle_pedido
-- Concepto: 5 tablas con INNER JOIN + GROUP BY multi-columna
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    c.des_apepaterno + ' ' + c.des_nombres      AS cliente,
    u.des_ubigeo                                AS distrito,
    h.des_horario                               AS horario_preferido,
    COUNT(p.cod_pedido)                         AS total_pedidos,
    SUM(d.num_cantidad * d.num_precio_venta)    AS gasto_total
FROM tb_cliente c
INNER JOIN tb_ubigeo           u ON c.cod_ubigeo   = u.cod_ubigeo
INNER JOIN tb_pedido           p ON c.cod_cliente  = p.cod_cliente
INNER JOIN tb_horario          h ON p.cod_horario  = h.cod_horario
INNER JOIN tb_detalle_pedido   d ON p.cod_pedido   = d.cod_pedido
GROUP BY
    c.des_apepaterno, c.des_nombres,
    u.des_ubigeo,
    h.des_horario
ORDER BY gasto_total DESC;
