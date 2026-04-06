-- ============================================================
-- FrostyTrack | Ejercicio 14 - Subquery con EXISTS
-- Problema: Operaciones necesita una lista de clientes que
--           tienen al menos un pedido sin repartidor asignado
--           para alertar al equipo antes de que venza el plazo.
-- Tablas:   tb_cliente, tb_pedido
-- Concepto: Correlated subquery con EXISTS
--           (referencia la tabla externa en el WHERE interno)
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    c.cod_cliente,
    c.des_apepaterno + ' ' + c.des_nombres  AS cliente,
    c.des_telefono,
    c.des_email
FROM tb_cliente c
WHERE EXISTS (
    -- Subquery correlacionada: existe algun pedido sin repartidor para este cliente
    SELECT 1
    FROM tb_pedido p
    WHERE p.cod_cliente    = c.cod_cliente   -- referencia tabla externa
      AND p.cod_repartidor IS NULL
)
ORDER BY c.des_apepaterno;
