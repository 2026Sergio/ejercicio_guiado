SELECT c.codigo AS categoria_codigo, c.nombre AS categoria_nombre, COUNT(j.juego_id) AS total_juegos
FROM categorias c
LEFT JOIN juegos j ON c.categoria_id = j.categoria_id
GROUP BY c.categoria_id, c.codigo, c.nombre;