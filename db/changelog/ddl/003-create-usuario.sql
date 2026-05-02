-- liquibase formatted sql

-- changeset estudiante:003-create-usuario
CREATE TABLE usuario (
    id           SERIAL       PRIMARY KEY,
    username     VARCHAR(80)  NOT NULL UNIQUE,
    password     VARCHAR(255) NOT NULL,
    persona_id   INTEGER      NOT NULL,
    rol_id       INTEGER      NOT NULL,
    activo       BOOLEAN      NOT NULL DEFAULT TRUE,
    ultimo_login TIMESTAMP,
    created_at   TIMESTAMP    NOT NULL DEFAULT NOW(),
    updated_at   TIMESTAMP    NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_usuario_persona FOREIGN KEY (persona_id)
        REFERENCES persona (id) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_usuario_rol FOREIGN KEY (rol_id)
        REFERENCES rol (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE INDEX idx_usuario_persona ON usuario (persona_id);
CREATE INDEX idx_usuario_rol     ON usuario (rol_id);

-- rollback DROP INDEX IF EXISTS idx_usuario_rol;
-- rollback DROP INDEX IF EXISTS idx_usuario_persona;
-- rollback DROP TABLE IF EXISTS usuario;