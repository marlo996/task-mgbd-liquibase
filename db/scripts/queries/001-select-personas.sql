-- Listado completo de personas registradas
SELECT
    id,
    tipo_doc,
    numero_doc,
    nombres || ' ' || apellidos AS nombre_completo,
    email,
    telefono,
    activo
FROM persona
ORDER BY id;

-- Total de personas por tipo de documento
SELECT
    tipo_doc,
    COUNT(*) AS cantidad
FROM persona
GROUP BY tipo_doc
ORDER BY cantidad DESC;

-- Personas vinculadas a un usuario del sistema
SELECT
    p.numero_doc,
    p.nombres || ' ' || p.apellidos AS nombre_completo,
    u.username,
    r.nombre AS rol
FROM persona p
INNER JOIN usuario u ON u.persona_id = p.id
INNER JOIN rol     r ON r.id         = u.rol_id
ORDER BY r.nombre, p.apellidos;