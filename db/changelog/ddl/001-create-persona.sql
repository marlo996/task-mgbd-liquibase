-- liquibase formatted sql

-- changeset estudiante:001-create-persona
CREATE TABLE persona (
    id          SERIAL          PRIMARY KEY,
    tipo_doc    VARCHAR(10)     NOT NULL,
    numero_doc  VARCHAR(20)     NOT NULL UNIQUE,
    nombres     VARCHAR(100)    NOT NULL,
    apellidos   VARCHAR(100)    NOT NULL,
    email       VARCHAR(150)    NOT NULL UNIQUE,
    telefono    VARCHAR(20),
    direccion   VARCHAR(200),
    fecha_nac   DATE,
    activo      BOOLEAN         NOT NULL DEFAULT TRUE,
    created_at  TIMESTAMP       NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- rollback DROP TABLE IF EXISTS persona;