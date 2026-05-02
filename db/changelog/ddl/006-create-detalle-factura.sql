-- liquibase formatted sql

-- changeset estudiante:006-create-detalle-factura
CREATE TABLE detalle_factura (
    id              SERIAL         PRIMARY KEY,
    factura_id      INTEGER        NOT NULL,
    producto_id     INTEGER        NOT NULL,
    cantidad        INTEGER        NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(12, 2) NOT NULL CHECK (precio_unitario >= 0),
    descuento_item  NUMERIC(12, 2) NOT NULL DEFAULT 0,
    subtotal_item   NUMERIC(14, 2) GENERATED ALWAYS AS
                        ((cantidad * precio_unitario) - descuento_item) STORED,
    created_at      TIMESTAMP      NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_detalle_factura FOREIGN KEY (factura_id)
        REFERENCES factura (id) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_detalle_producto FOREIGN KEY (producto_id)
        REFERENCES producto (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE INDEX idx_detalle_factura  ON detalle_factura (factura_id);
CREATE INDEX idx_detalle_producto ON detalle_factura (producto_id);

-- rollback DROP INDEX IF EXISTS idx_detalle_producto;
-- rollback DROP INDEX IF EXISTS idx_detalle_factura;
-- rollback DROP TABLE IF EXISTS detalle_factura;