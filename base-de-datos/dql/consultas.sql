-- obten los 8 juegos sobre el promedio global y los 10 sobre su categoria 
-- consulta 1
SELECT *
FROM juegos
WHERE precio > (SELECT AVG(precio) FROM juegos)
ORDER BY precio DESC;

-- consulta 2
WITH juegos_con_promedio_categoria AS (
    SELECT *,
           AVG(precio) OVER (PARTITION BY categoria_id) AS promedio_categoria
    FROM juegos
)
SELECT juego_id, codigo, titulo, precio, fecha_lanzamiento, categoria_id, ROUND(promedio_categoria, 2) AS promedio_categoria
FROM juegos_con_promedio_categoria
WHERE precio > promedio_categoria
ORDER BY categoria_id, precio DESC;