-- ============================================================
-- FrostyTrack | Ejercicio 15 - CTE + Funcion de Ventana
-- Problema: El gerente quiere un ranking mensual de helados
--           por ingreso generado para destacarlos en la pizarra
--           del local y en redes sociales.
-- Tablas:   tb_helado, tb_detalle_pedido
-- Concepto: CTE (WITH) + RANK() OVER (funcion de ventana)
--           El CTE permite reutilizar el resultado intermedio
--           y filtrar sobre el sin repetir codigo.
-- ============================================================

USE BD_HELADERIA;
GO

-- Paso 1: CTE calcula ingreso y ranking por helado
WITH ingresos_por_helado AS (
    SELECT
        h.cod_helado,
        h.des_helado,
        SUM(d.num_cantidad * d.num_precio_venta)    AS ingreso_total,
        SUM(d.num_cantidad)                         AS unidades_vendidas,
        RANK() OVER (
            ORDER BY SUM(d.num_cantidad * d.num_precio_venta) DESC
        )                                           AS ranking
    FROM tb_helado h
    INNER JOIN tb_detalle_pedido d ON h.cod_helado = d.cod_helado
    GROUP BY h.cod_helado, h.des_helado
)
-- Paso 2: filtrar solo el Top 3
SELECT
    ranking,
    des_helado          AS helado,
    ingreso_total,
    unidades_vendidas
FROM ingresos_por_helado
WHERE ranking <= 3
ORDER BY ranking;
