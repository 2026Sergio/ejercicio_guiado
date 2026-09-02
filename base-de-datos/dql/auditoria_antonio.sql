
-- Auditoria cantidad de juegos por categoria
SELECT
    c.categoria_id,
    c.codigo,
    c.nombre,
    COUNT(j.juego_id) AS cantidad_juegos
FROM categorias c
LEFT JOIN juegos j
    ON j.categoria_id = c.categoria_id
GROUP BY
    c.categoria_id,
    c.codigo,
    c.nombre
ORDER BY c.categoria_id;