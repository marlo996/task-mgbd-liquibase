-- liquibase formatted sql

-- changeset estudiante:101-insert-roles
INSERT INTO rol (nombre, descripcion) VALUES
    ('ADMIN',      'Administrador con acceso completo al sistema'),
    ('CAJERO',     'Operador de punto de venta y facturación'),
    ('BODEGUERO',  'Encargado de gestión de inventario y productos'),
    ('CLIENTE',    'Persona registrada que realiza compras');

-- rollback DELETE FROM rol WHERE nombre IN ('ADMIN','CAJERO','BODEGUERO','CLIENTE');

-- changeset estudiante:102-insert-personas
INSERT INTO persona (tipo_doc, numero_doc, nombres, apellidos, email, telefono, direccion, fecha_nac) VALUES
    ('CC', '1075000001', 'Carlos',   'Ramírez Torres',   'carlos.ramirez@corhuila.edu.co', '3101234567', 'Calle 5 # 10-20, Neiva',    '1985-03-15'),
    ('CC', '1075000002', 'Laura',    'González Perdomo', 'laura.gonzalez@corhuila.edu.co', '3202345678', 'Carrera 8 # 12-34, Neiva',  '1990-07-22'),
    ('CC', '1075000003', 'Andrés',   'Medina Lara',      'andres.medina@corhuila.edu.co',  '3003456789', 'Avenida 15 # 5-67, Neiva',  '1988-11-01'),
    ('CC', '1075000004', 'Sofía',    'Vargas Nieto',     'sofia.vargas@gmail.com',         '3154567890', 'Calle 20 # 3-45, Pitalito', '1995-04-18'),
    ('CC', '1075000005', 'Miguel',   'Castro Rivera',    'miguel.castro@hotmail.com',      '3005678901', 'Carrera 3 # 7-89, Garzón',  '1992-09-30'),
    ('CC', '1075000006', 'Patricia', 'Ortega Silva',     'patricia.ortega@yahoo.com',      '3116789012', 'Calle 10 # 2-11, Neiva',    '1987-12-05'),
    ('TI', '1006000001', 'Juanita',  'Morales Díaz',     'juanita.morales@gmail.com',      '3207890123', 'Carrera 12 # 6-78, Neiva',  '2005-02-14');

-- rollback DELETE FROM persona WHERE numero_doc IN ('1075000001','1075000002','1075000003','1075000004','1075000005','1075000006','1006000001');

-- changeset estudiante:103-insert-usuarios
INSERT INTO usuario (username, password, persona_id, rol_id) VALUES
    ('admin.carlos',   '$2b$12$hashAdminCarlos000placeholder',
        (SELECT id FROM persona WHERE numero_doc = '1075000001'),
        (SELECT id FROM rol     WHERE nombre     = 'ADMIN')),
    ('cajero.laura',   '$2b$12$hashCajeroLaura000placeholder',
        (SELECT id FROM persona WHERE numero_doc = '1075000002'),
        (SELECT id FROM rol     WHERE nombre     = 'CAJERO')),
    ('bodega.andres',  '$2b$12$hashBodegaAndres00placeholder',
        (SELECT id FROM persona WHERE numero_doc = '1075000003'),
        (SELECT id FROM rol     WHERE nombre     = 'BODEGUERO')),
    ('cliente.sofia',  '$2b$12$hashClienteSofia0placeholder',
        (SELECT id FROM persona WHERE numero_doc = '1075000004'),
        (SELECT id FROM rol     WHERE nombre     = 'CLIENTE')),
    ('cliente.miguel', '$2b$12$hashClienteMiguel0placeholder',
        (SELECT id FROM persona WHERE numero_doc = '1075000005'),
        (SELECT id FROM rol     WHERE nombre     = 'CLIENTE'));

-- rollback DELETE FROM usuario WHERE username IN ('admin.carlos','cajero.laura','bodega.andres','cliente.sofia','cliente.miguel');

-- changeset estudiante:104-insert-productos
INSERT INTO producto (codigo, nombre, descripcion, precio_unitario, stock, unidad_medida) VALUES
    ('PROD-001', 'Cuaderno universitario 100 hojas', 'Cuaderno rayado tapa dura 100 hojas',        4500.00,  80, 'UND'),
    ('PROD-002', 'Lápiz HB Norma #2',                'Lápiz de madera grafito HB punta media',      500.00, 200, 'UND'),
    ('PROD-003', 'Resma papel carta 75g',             'Resma 500 hojas papel bond blanco 75g',     18000.00,  35, 'UND'),
    ('PROD-004', 'Bolígrafo azul Kilometrico',        'Bolígrafo punta fina tinta azul',             800.00, 150, 'UND'),
    ('PROD-005', 'Calculadora Casio FX-82',           'Calculadora científica 240 funciones',      55000.00,  20, 'UND'),
    ('PROD-006', 'Marcador permanente negro',         'Marcador tinta permanente punta gruesa',     2500.00,  60, 'UND'),
    ('PROD-007', 'Carpeta plástica oficio',           'Carpeta con gancho plástico tamaño oficio',  3200.00,  45, 'UND'),
    ('PROD-008', 'USB 32GB Kingston',                 'Memoria USB 3.0 32GB color negro',          28000.00,  25, 'UND');

-- rollback DELETE FROM producto WHERE codigo IN ('PROD-001','PROD-002','PROD-003','PROD-004','PROD-005','PROD-006','PROD-007','PROD-008');

-- changeset estudiante:105-insert-facturas
INSERT INTO factura (numero, cliente_id, usuario_id, subtotal, descuento, impuesto, total, estado, observaciones) VALUES
    ('FAC-2024-001',
        (SELECT id FROM persona WHERE numero_doc = '1075000004'),
        (SELECT id FROM usuario WHERE username   = 'cajero.laura'),
        89400.00, 0.00, 16986.00, 106386.00, 'PAGADA', 'Primera compra registrada'),
    ('FAC-2024-002',
        (SELECT id FROM persona WHERE numero_doc = '1075000005'),
        (SELECT id FROM usuario WHERE username   = 'cajero.laura'),
        55000.00, 5500.00, 9405.00, 58905.00, 'PAGADA', 'Descuento especial estudiante'),
    ('FAC-2024-003',
        (SELECT id FROM persona WHERE numero_doc = '1075000006'),
        (SELECT id FROM usuario WHERE username   = 'cajero.laura'),
        28000.00, 0.00, 5320.00, 33320.00, 'EMITIDA', NULL);

-- rollback DELETE FROM factura WHERE numero IN ('FAC-2024-001','FAC-2024-002','FAC-2024-003');

-- changeset estudiante:106-insert-detalle-factura
INSERT INTO detalle_factura (factura_id, producto_id, cantidad, precio_unitario, descuento_item) VALUES
    ((SELECT id FROM factura  WHERE numero = 'FAC-2024-001'),
     (SELECT id FROM producto WHERE codigo = 'PROD-001'), 4, 4500.00, 0.00),
    ((SELECT id FROM factura  WHERE numero = 'FAC-2024-001'),
     (SELECT id FROM producto WHERE codigo = 'PROD-003'), 2, 18000.00, 0.00),
    ((SELECT id FROM factura  WHERE numero = 'FAC-2024-001'),
     (SELECT id FROM producto WHERE codigo = 'PROD-002'), 8, 500.00, 0.00),
    ((SELECT id FROM factura  WHERE numero = 'FAC-2024-002'),
     (SELECT id FROM producto WHERE codigo = 'PROD-005'), 1, 55000.00, 5500.00),
    ((SELECT id FROM factura  WHERE numero = 'FAC-2024-003'),
     (SELECT id FROM producto WHERE codigo = 'PROD-008'), 1, 28000.00, 0.00);

-- rollback DELETE FROM detalle_factura WHERE factura_id IN (SELECT id FROM factura WHERE numero IN ('FAC-2024-001','FAC-2024-002','FAC-2024-003'));