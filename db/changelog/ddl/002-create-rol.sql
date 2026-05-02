-- liquibase formatted sql

-- changeset estudiante:002-create-rol
CREATE TABLE rol (
    id          SERIAL          PRIMARY KEY,
    nombre      VARCHAR(50)     NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    activo      BOOLEAN         NOT NULL DEFAULT TRUE,
    created_at  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- rollback DROP TABLE IF EXISTS rol;