-- Facturas con datos completos de cliente y cajero
SELECT
    f.numero,
    f.fecha_emision::DATE                AS fecha,
    pc.nombres || ' ' || pc.apellidos   AS cliente,
    pu.nombres || ' ' || pu.apellidos   AS cajero,
    f.subtotal,
    f.descuento,
    f.impuesto,
    f.total,
    f.estado
FROM factura f
INNER JOIN persona  pc ON pc.id = f.cliente_id
INNER JOIN usuario  u  ON u.id  = f.usuario_id
INNER JOIN persona  pu ON pu.id = u.persona_id
ORDER BY f.fecha_emision;

-- Resumen de ventas por estado
SELECT
    estado,
    COUNT(*)   AS cantidad_facturas,
    SUM(total) AS total_vendido
FROM factura
GROUP BY estado
ORDER BY total_vendido DESC;

-- Factura con mayor valor
SELECT numero, total, estado
FROM factura
ORDER BY total DESC
LIMIT 1;