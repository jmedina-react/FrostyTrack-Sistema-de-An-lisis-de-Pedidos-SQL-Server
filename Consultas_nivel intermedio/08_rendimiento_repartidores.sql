-- ============================================================
-- FrostyTrack | Ejercicio 08 - Nivel Intermedio
-- Problema: RRHH quiere evaluar el rendimiento de los
--           repartidores segun pedidos entregados.
-- Tablas:   tb_repartidor, tb_pedido
-- Concepto: LEFT JOIN (incluye repartidores sin pedidos)
--           + filtro en JOIN para no perder registros
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    r.cod_repartidor,
    r.des_appaterno + ' ' + r.des_nombres   AS repartidor,
    COUNT(p.cod_pedido)                     AS pedidos_entregados
FROM tb_repartidor r
LEFT JOIN tb_pedido p ON r.cod_repartidor = p.cod_repartidor
                     AND p.ind_estado = 'E'
GROUP BY r.cod_repartidor, r.des_appaterno, r.des_nombres
ORDER BY pedidos_entregados DESC;
