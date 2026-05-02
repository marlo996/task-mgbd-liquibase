-- liquibase formatted sql

-- changeset estudiante:005-create-factura
CREATE TABLE factura (
    id            SERIAL         PRIMARY KEY,
    numero        VARCHAR(20)    NOT NULL UNIQUE,
    fecha_emision TIMESTAMP      NOT NULL DEFAULT NOW(),
    cliente_id    INTEGER        NOT NULL,
    usuario_id    INTEGER        NOT NULL,
    subtotal      NUMERIC(14, 2) NOT NULL DEFAULT 0,
    descuento     NUMERIC(14, 2) NOT NULL DEFAULT 0,
    impuesto      NUMERIC(14, 2) NOT NULL DEFAULT 0,
    total         NUMERIC(14, 2) NOT NULL DEFAULT 0,
    estado        VARCHAR(20)    NOT NULL DEFAULT 'EMITIDA',
    observaciones TEXT,
    created_at    TIMESTAMP      NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_factura_cliente FOREIGN KEY (cliente_id)
        REFERENCES persona (id) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_factura_usuario FOREIGN KEY (usuario_id)
        REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE INDEX idx_factura_cliente ON factura (cliente_id);
CREATE INDEX idx_factura_usuario ON factura (usuario_id);
CREATE INDEX idx_factura_fecha   ON factura (fecha_emision);

-- rollback DROP INDEX IF EXISTS idx_factura_fecha;
-- rollback DROP INDEX IF EXISTS idx_factura_usuario;
-- rollback DROP INDEX IF EXISTS idx_factura_cliente;
-- rollback DROP TABLE IF EXISTS factura;