-- liquibase formatted sql

-- changeset estudiante:301-delete-usuario-inactivo
UPDATE usuario
SET    activo     = FALSE,
       updated_at = NOW()
WHERE  username = 'bodega.andres';

-- rollback UPDATE usuario SET activo = TRUE, updated_at = NOW() WHERE username = 'bodega.andres';

-- changeset estudiante:302-delete-producto-descontinuado
UPDATE producto
SET    activo     = FALSE,
       updated_at = NOW()
WHERE  codigo = 'PROD-006';

-- rollback UPDATE producto SET activo = TRUE, updated_at = NOW() WHERE codigo = 'PROD-006';

-- changeset estudiante:303-delete-persona-test
DELETE FROM persona
WHERE tipo_doc   = 'TI'
  AND numero_doc = '1006000001'
  AND NOT EXISTS (
      SELECT 1 FROM usuario WHERE persona_id = (
          SELECT id FROM persona WHERE numero_doc = '1006000001'
      )
  );

-- rollback INSERT INTO persona (tipo_doc, numero_doc, nombres, apellidos, email, telefono, direccion, fecha_nac)
-- rollback VALUES ('TI','1006000001','Juanita','Morales Díaz','juanita.morales@gmail.com','3207890123','Carrera 12 # 6-78, Neiva','2005-02-14');