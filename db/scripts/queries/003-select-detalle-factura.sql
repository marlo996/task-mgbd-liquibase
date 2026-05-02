-- Detalle completo de todas las facturas
SELECT
    f.numero                            AS factura,
    p.codigo                            AS cod_producto,
    p.nombre                            AS producto,
    df.cantidad,
    df.precio_unitario,
    df.descuento_item,
    df.subtotal_item
FROM detalle_factura df
INNER JOIN factura  f ON f.id = df.factura_id
INNER JOIN producto p ON p.id = df.producto_id
ORDER BY f.numero, df.id;

-- Productos más vendidos por unidades
SELECT
    p.codigo,
    p.nombre,
    SUM(df.cantidad)      AS unidades_vendidas,
    SUM(df.subtotal_item) AS ingreso_total
FROM detalle_factura df
INNER JOIN producto p ON p.id = df.producto_id
GROUP BY p.id, p.codigo, p.nombre
ORDER BY unidades_vendidas DESC;

-- Stock restante después de las ventas
SELECT
    codigo,
    nombre,
    stock  AS stock_actual,
    activo
FROM producto
ORDER BY stock ASC;