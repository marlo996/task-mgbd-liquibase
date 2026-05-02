# Evidencias de Ejecución

## 1. Levantar el contenedor
**Comando:**
```bash
docker compose up -d db
```
**Salida obtenida:**
```
✔ Container mgbd_postgres  Started
```

## 2. Validar el changelog
**Comando:**
```bash
docker compose run --rm liquibase validate
```
**Salida obtenida:**
```
No validation errors found.
Liquibase command 'validate' was executed successfully.
```

## 3. Ejecutar migraciones
**Comando:**
```bash
docker compose run --rm liquibase update
```
**Salida obtenida:**
```
Run:                19
Previously run:      0
Liquibase command 'update' was executed successfully.
```

## 4. Verificar tablas creadas
**Comando:**
```bash
docker compose exec db psql -U postgres -d mgbd_liquibase -c "\dt"
```
**Salida obtenida:**
```
 Schema |       Name            | Type  |  Owner
--------+-----------------------+-------+----------
 public | detalle_factura       | table | postgres
 public | factura               | table | postgres
 public | persona               | table | postgres
 public | producto              | table | postgres
 public | rol                   | table | postgres
 public | usuario               | table | postgres
(6 rows)
```

## 5. Consulta de personas
**Comando:**
```bash
docker compose exec db psql -U postgres -d mgbd_liquibase -c "SELECT * FROM persona;"
```
**Salida obtenida:**
```
 id | tipo_doc |  numero_doc | nombres  |    apellidos     |              email
----+----------+-------------+----------+------------------+--------------------------------
  1 | CC       | 1075000001  | Carlos   | Ramírez Torres   | carlos.ramirez@corhuila.edu.co
  2 | CC       | 1075000002  | Laura    | González Perdomo | laura.gonzalez@corhuila.edu.co
  3 | CC       | 1075000003  | Andrés   | Medina Lara      | andres.medina@corhuila.edu.co
  4 | CC       | 1075000004  | Sofía    | Vargas Nieto     | sofia.vargas@gmail.com
  5 | CC       | 1075000005  | Miguel   | Castro Rivera    | miguel.castro.rivera@gmail.com
  6 | CC       | 1075000006  | Patricia | Ortega Silva     | patricia.ortega@yahoo.com
(6 rows)
```

## 6. Consulta de facturas
**Comando:**
```bash
docker compose exec db psql -U postgres -d mgbd_liquibase -c "SELECT numero, total, estado FROM factura;"
```
**Salida obtenida:**
```
    numero    |   total   | estado
--------------+-----------+--------
 FAC-2024-001 | 106386.00 | PAGADA
 FAC-2024-002 |  58905.00 | PAGADA
 FAC-2024-003 |  33320.00 | PAGADA
(3 rows)
```