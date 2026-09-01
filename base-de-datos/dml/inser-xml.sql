CREATE TEMP TABLE temporal_xml(data XML);


\COPY temporal_xml(data) FROM PROGRAM 'tr -d "\r\n" < /home/camper/postgresdata/juegos.xml';


INSERT INTO juegos (codigo, titulo, precio, fecha_lanzamiento, categoria_id)
SELECT
   unnest(xpath('/juegos/juego/codigo/text()', data::XML))::TEXT AS codigo,
   unnest(xpath('/juegos/juego/titulo/text()', data::XML))::TEXT AS titulo,
   unnest(xpath('/juegos/juego/precio/text()', data::XML))::TEXT::NUMERIC AS precio,
   unnest(xpath('/juegos/juego/fecha_lanzamiento/text()', data::XML))::TEXT::DATE AS fecha_lanzamiento,
   unnest(xpath('/juegos/juego/categoria_id/text()', data::XML))::TEXT::INT AS categoria_id
FROM temporal_xml;

SELECT * FROM juegos;

