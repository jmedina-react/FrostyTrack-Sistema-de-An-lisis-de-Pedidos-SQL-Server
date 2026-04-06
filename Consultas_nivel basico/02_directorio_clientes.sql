-- ============================================================
-- FrostyTrack | Ejercicio 02 - Nivel Basico
-- Problema: El area de atencion necesita un directorio para
--           contactar clientes en caso de retraso en entrega.
-- Tablas:   tb_cliente
-- ============================================================

USE BD_HELADERIA;
GO

SELECT
    cod_cliente,
    des_apepaterno + ' ' + des_apematerno + ' ' + des_nombres AS nombre_completo,
    des_telefono,
    des_email,
    des_domicilio
FROM tb_cliente
ORDER BY des_apepaterno;
