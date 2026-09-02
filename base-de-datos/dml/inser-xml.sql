CREATE TEMP TABLE temporal_xml(data XML);

\copy temporal_xml(data)
FROM PROGRAM 'tr -d "\r\n" < /data/juegos.xml';

INSERT INTO juegos (codigo, titulo, precio, fecha_lanzamiento, categoria_id)
SELECT
    x.codigo,
    x.titulo,
    x.precio,
    x.fecha_lanzamiento,
    x.categoria_id
FROM temporal_xml AS t
CROSS JOIN LATERAL XMLTABLE(
    '/juegos/juego'
    PASSING t.data
    COLUMNS
        codigo CHAR(3) PATH 'codigo',
        titulo VARCHAR(150) PATH 'titulo',
        precio NUMERIC(8,2) PATH 'precio',
        fecha_lanzamiento DATE PATH 'fecha_lanzamiento',
        categoria_id INT PATH 'categoria_id'
) AS x;

SELECT * FROM juegos;