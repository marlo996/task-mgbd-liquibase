-- liquibase formatted sql

-- changeset estudiante:201-update-stock-productos
UPDATE producto SET stock = stock - 4,  updated_at = NOW() WHERE codigo = 'PROD-001';
UPDATE producto SET stock = stock - 2,  updated_at = NOW() WHERE codigo = 'PROD-003';
UPDATE producto SET stock = stock - 8,  updated_at = NOW() WHERE codigo = 'PROD-002';
UPDATE producto SET stock = stock - 1,  updated_at = NOW() WHERE codigo = 'PROD-005';
UPDATE producto SET stock = stock - 1,  updated_at = NOW() WHERE codigo = 'PROD-008';

-- rollback UPDATE producto SET stock = stock + 4 WHERE codigo = 'PROD-001';
-- rollback UPDATE producto SET stock = stock + 2 WHERE codigo = 'PROD-003';
-- rollback UPDATE producto SET stock = stock + 8 WHERE codigo = 'PROD-002';
-- rollback UPDATE producto SET stock = stock + 1 WHERE codigo = 'PROD-005';
-- rollback UPDATE producto SET stock = stock + 1 WHERE codigo = 'PROD-008';

-- changeset estudiante:202-update-factura-pagada
UPDATE factura SET estado = 'PAGADA' WHERE numero = 'FAC-2024-003';

-- rollback UPDATE factura SET estado = 'EMITIDA' WHERE numero = 'FAC-2024-003';

-- changeset estudiante:203-update-email-cliente
UPDATE persona
SET    email      = 'miguel.castro.rivera@gmail.com',
       updated_at = NOW()
WHERE  numero_doc = '1075000005';

-- rollback UPDATE persona SET email = 'miguel.castro@hotmail.com', updated_at = NOW() WHERE numero_doc = '1075000005';

-- changeset estudiante:204-update-ultimo-login
UPDATE usuario SET ultimo_login = NOW() WHERE username IN ('admin.carlos', 'cajero.laura');

-- rollback UPDATE usuario SET ultimo_login = NULL WHERE username IN ('admin.carlos','cajero.laura');