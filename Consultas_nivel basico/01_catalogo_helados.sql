-- ============================================================
-- FrostyTrack | Ejercicio 01 - Nivel Basico
-- Problema: El gerente necesita imprimir el menu completo
--           con precios actuales para el local.
-- Tablas:   tb_helado
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    cod_helado          AS codigo,
    des_helado          AS helado,
    num_precio          AS precio_unitario,
    num_stock_actual    AS stock_disponible
FROM tb_helado
ORDER BY des_helado;
