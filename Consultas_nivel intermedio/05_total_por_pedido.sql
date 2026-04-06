-- ============================================================
-- FrostyTrack | Ejercicio 05 - Nivel Intermedio
-- Problema: Finanzas necesita el importe total de cada pedido
--           para cuadrar la caja diaria.
-- Tablas:   tb_detalle_pedido
-- Concepto: GROUP BY + expresion calculada (cantidad x precio)
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    cod_pedido,
    SUM(num_cantidad * num_precio_venta)    AS total_pedido,
    SUM(num_cantidad)                       AS total_unidades
FROM tb_detalle_pedido
GROUP BY cod_pedido
ORDER BY total_pedido DESC;
