-- ============================================================
-- FrostyTrack | Ejercicio 07 - Nivel Intermedio
-- Problema: El jefe de produccion quiere saber que sabores
--           priorizar en la proxima tanda de produccion.
-- Tablas:   tb_helado, tb_detalle_pedido
-- Concepto: INNER JOIN + GROUP BY + TOP + ORDER BY
-- ============================================================

USE BD_HELADERIA;
GO

SELECT TOP 5
    h.cod_helado,
    h.des_helado,
    SUM(d.num_cantidad)                         AS unidades_vendidas,
    SUM(d.num_cantidad * d.num_precio_venta)    AS ingreso_total
FROM tb_detalle_pedido d
INNER JOIN tb_helado h ON d.cod_helado = h.cod_helado
GROUP BY h.cod_helado, h.des_helado
ORDER BY unidades_vendidas DESC;
