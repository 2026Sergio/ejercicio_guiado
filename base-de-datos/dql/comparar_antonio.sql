-- Selección de los juegos qu e estén por encima del promedio global
SELECT
    codigo,
    titulo,
    precio
FROM juegos
WHERE precio > (
    SELECT AVG(precio)
    FROM juegos
)
ORDER BY precio DESC;

-- Al ejecutar el comando anterior, Postgres nos indica que se encontraron 8 registros (8 rows)
-- Conteo de los juegos que están por encima del promedio global
SELECT COUNT(*) AS juegos_sobre_promedio_global
FROM juegos
WHERE precio > (
    SELECT AVG(precio)
    FROM juegos
);


-- Consulta de los 10 juegos que están por encima del promedio de su categoria
WITH juegos_promedio AS (
    SELECT
        j.codigo,
        j.titulo,
        j.precio,
        j.categoria_id,
        AVG(j.precio) OVER (
            PARTITION BY j.categoria_id
        ) AS promedio_categoria
    FROM juegos j
)
SELECT
    codigo,
    titulo,
    precio,
    categoria_id,
    promedio_categoria
FROM juegos_promedio
WHERE precio > promedio_categoria
ORDER BY categoria_id, precio DESC;