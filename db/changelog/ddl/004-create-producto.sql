-- liquibase formatted sql

-- changeset estudiante:004-create-producto
CREATE TABLE producto (
    id              SERIAL         PRIMARY KEY,
    codigo          VARCHAR(30)    NOT NULL UNIQUE,
    nombre          VARCHAR(150)   NOT NULL,
    descripcion     TEXT,
    precio_unitario NUMERIC(12, 2) NOT NULL CHECK (precio_unitario >= 0),
    stock           INTEGER        NOT NULL DEFAULT 0 CHECK (stock >= 0),
    unidad_medida   VARCHAR(20)    NOT NULL DEFAULT 'UND',
    activo          BOOLEAN        NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMP      NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP      NOT NULL DEFAULT NOW()
);

-- rollback DROP TABLE IF EXISTS producto;