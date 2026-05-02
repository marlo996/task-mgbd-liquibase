# Evidencias de Ejecución

## 1. Levantar el contenedor
**Comando:**
```bash
docker compose up -d db
```
**Salida obtenida:**
 Schema |         Name          | Type  |  Owner   
--------+-----------------------+-------+----------
 public | databasechangelog     | table | postgres
 public | databasechangeloglock | table | postgres
 public | detalle_factura       | table | postgres
 public | factura               | table | postgres
 public | persona               | table | postgres
 public | producto              | table | postgres
 public | rol                   | table | postgres
 public | usuario               | table | postgres  

 **Salida obtenida:**
  id | tipo_doc | numero_doc | nombres  |    apellidos     |             email              |  telefono  |         direccion         | fecha_nac  | activo |        created_at         |         updated_at         
----+----------+------------+----------+------------------+--------------------------------+------------+---------------------------+------------+--------+---------------------------+----------------------------
  1 | CC       | 1075000001 | Carlos   | Ramírez Torres   | carlos.ramirez@corhuila.edu.co | 3101234567 | Calle 5 # 10-20, Neiva    | 1985-03-15 | t      | 2026-05-02 17:46:47.63365 | 2026-05-02 17:46:47.63365
  2 | CC       | 1075000002 | Laura    | González Perdomo | laura.gonzalez@corhuila.edu.co | 3202345678 | Carrera 8 # 12-34, Neiva  | 1990-07-22 | t      | 2026-05-02 17:46:47.63365 | 2026-05-02 17:46:47.63365
  3 | CC       | 1075000003 | Andrés   | Medina Lara      | andres.medina@corhuila.edu.co  | 3003456789 | Avenida 15 # 5-67, Neiva  | 1988-11-01 | t      | 2026-05-02 17:46:47.63365 | 2026-05-02 17:46:47.63365
  4 | CC       | 1075000004 | Sofía    | Vargas Nieto     | sofia.vargas@gmail.com         | 3154567890 | Calle 20 # 3-45, Pitalito | 1995-04-18 | t      | 2026-05-02 17:46:47.63365 | 2026-05-02 17:46:47.63365
  6 | CC       | 1075000006 | Patricia | Ortega Silva     | patricia.ortega@yahoo.com      | 3116789012 | Calle 10 # 2-11, Neiva    | 1987-12-05 | t      | 2026-05-02 17:46:47.63365 | 2026-05-02 17:46:47.63365
  5 | CC       | 1075000005 | Miguel   | Castro Rivera    | miguel.castro.rivera@gmail.com | 3005678901 | Carrera 3 # 7-89, Garzón  | 1992-09-30 | t      | 2026-05-02 17:46:47.63365 | 2026-05-02 17:46:47.729802

   **Salida obtenida:**
       numero    |   total   | estado 
--------------+-----------+--------
 FAC-2024-001 | 106386.00 | PAGADA
 FAC-2024-002 |  58905.00 | PAGADA
 FAC-2024-003 |  33320.00 | PAGADA