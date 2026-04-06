-- ============================================================
-- FrostyTrack | Ejercicio 03 - Nivel Basico
-- Problema: El almacen debe identificar productos con stock
--           menor a 10 unidades para reposicion urgente.
-- Tablas:   tb_helado
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    cod_helado,
    des_helado,
    num_stock_actual    AS stock_actual,
    num_precio          AS precio
FROM tb_helado
WHERE num_stock_actual < 10
ORDER BY num_stock_actual ASC;
