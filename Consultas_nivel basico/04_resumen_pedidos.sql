-- ============================================================
-- FrostyTrack | Ejercicio 04 - Nivel Basico
-- Problema: El supervisor quiere saber cuantos pedidos hay
--           en total y cuantos siguen pendientes de entrega.
-- Tablas:   tb_pedido
-- ind_estado: P=Pendiente, E=Entregado, C=Cancelado
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    COUNT(*)                                                AS total_pedidos,
    SUM(CASE WHEN ind_estado = 'P' THEN 1 ELSE 0 END)     AS pedidos_pendientes,
    SUM(CASE WHEN ind_estado = 'E' THEN 1 ELSE 0 END)     AS pedidos_entregados,
    SUM(CASE WHEN ind_estado = 'C' THEN 1 ELSE 0 END)     AS pedidos_cancelados
FROM tb_pedido;
