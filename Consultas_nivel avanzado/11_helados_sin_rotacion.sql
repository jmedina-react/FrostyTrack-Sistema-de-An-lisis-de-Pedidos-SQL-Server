-- ============================================================
-- FrostyTrack | Ejercicio 11 - Nivel Avanzado
-- Problema: El almacen quiere depurar helados que nunca
--           fueron pedidos y ocupan espacio en frio.
-- Tablas:   tb_helado, tb_detalle_pedido
-- Concepto: LEFT JOIN + IS NULL para detectar ausencias
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    h.cod_helado,
    h.des_helado,
    h.num_stock_actual  AS stock_sin_salida,
    h.num_precio        AS precio
FROM tb_helado h
LEFT JOIN tb_detalle_pedido d ON h.cod_helado = d.cod_helado
WHERE d.cod_helado IS NULL
ORDER BY h.num_stock_actual DESC;
