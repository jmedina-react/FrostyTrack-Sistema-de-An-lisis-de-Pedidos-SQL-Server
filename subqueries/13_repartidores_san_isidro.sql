-- ============================================================
-- FrostyTrack | Ejercicio 13 - Subquery con IN anidado
-- Problema: Logistica quiere saber que repartidores atendieron
--           pedidos de clientes ubicados en San Isidro,
--           para asignarles esa zona de forma permanente.
-- Tablas:   tb_repartidor, tb_pedido, tb_cliente, tb_ubigeo
-- Concepto: Subquery con IN de dos niveles (doble anidamiento)
-- ============================================================

USE BD_HELADERIA;
GO

SELECT DISTINCT
    r.cod_repartidor,
    r.des_appaterno + ' ' + r.des_nombres   AS repartidor
FROM tb_repartidor r
WHERE r.cod_repartidor IN (
    -- Nivel 1: pedidos atendidos a clientes de San Isidro
    SELECT p.cod_repartidor
    FROM tb_pedido p
    INNER JOIN tb_cliente c ON p.cod_cliente = c.cod_cliente
    WHERE c.cod_ubigeo IN (
        -- Nivel 2: ubigeos del distrito San Isidro
        SELECT cod_ubigeo
        FROM tb_ubigeo
        WHERE des_ubigeo LIKE '%SAN ISIDRO%'
    )
)
ORDER BY repartidor;
