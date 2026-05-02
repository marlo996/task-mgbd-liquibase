# Investigación: Liquibase y Control de Cambios en Base de Datos

## 1. ¿Qué es Liquibase?
Liquibase es una herramienta de código abierto para el control de versiones
de esquemas de base de datos. Permite gestionar, rastrear y aplicar cambios
en la estructura y los datos de una base de datos de manera ordenada y
reproducible, similar a como Git controla el código fuente.

## 2. Conceptos fundamentales

### Changelog
Archivo raíz que define el orden en que se aplican los cambios.
Puede estar en formato YAML, XML, JSON o SQL.

### Changeset
Unidad mínima de cambio. Tiene un id, un autor y las instrucciones SQL.
Liquibase lo registra en la tabla DATABASECHANGELOG para no ejecutarlo dos veces.

```sql
-- changeset estudiante:001-create-persona
CREATE TABLE persona ( ... );
```

### Rollback
Permite deshacer un changeset ya aplicado.
```sql
-- rollback DROP TABLE IF EXISTS persona;
```

## 3. DDL vs DML

| Categoría | Significado | Ejemplos |
|---|---|---|
| DDL | Define o modifica la estructura | CREATE TABLE, ALTER TABLE |
| DML | Manipula los datos | INSERT, UPDATE, DELETE |
| DQL | Consulta los datos | SELECT |

## 4. ¿Qué es Docker Compose?
Herramienta para definir y ejecutar aplicaciones multi-contenedor.
Se configura con docker-compose.yml donde se declaran los servicios,
imágenes, puertos y dependencias.

## 5. Migraciones de base de datos
Un cambio versionado y rastreable aplicado sobre una base de datos.
Permiten reproducir el mismo esquema en cualquier ambiente y revertir
cambios de forma controlada.

## 6. Comandos Liquibase más usados

| Comando | Descripción |
|---|---|
| liquibase validate | Valida la sintaxis del changelog |
| liquibase update | Aplica todos los changesets pendientes |
| liquibase status --verbose | Muestra changesets sin aplicar |
| liquibase rollbackCount N | Revierte los últimos N changesets |
| liquibase history | Muestra el historial de ejecución |

## 7. Referencias
- Documentación oficial: https://docs.liquibase.com
- Imagen Docker: https://hub.docker.com/r/liquibase/liquibase
- PostgreSQL 15: https://www.postgresql.org/docs/15/