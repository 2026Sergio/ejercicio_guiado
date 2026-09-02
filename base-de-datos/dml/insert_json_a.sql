CREATE TEMP TABLE temporal_json (data JSONB);

\copy temporal_json(data)
FROM PROGRAM 'tr -d "\r\n" < /data/categorias.json';

INSERT INTO categorias(codigo, nombre, descripcion)
SELECT 
    e->> 'codigo',
    e->>'nombre',
    e->>'descripcion'
FROM temporal_json AS t 
CROSS JOIN LATERAL jsonb_array_elements(t.data) AS e;

SELECT * FROM temporal_json;