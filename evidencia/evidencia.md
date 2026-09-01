## 
CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    codigo CHAR(3) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(250)
);
CREATE TABLE
campus=# CREATE TABLE juegos (
    juego_id SERIAL PRIMARY KEY,
    codigo CHAR(3) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    precio NUMERIC(8, 2) NOT NULL,
    fecha_lanzamiento DATE,
    categoria_id INT NOT NULL
);


## 
CREATE TABLE temporal_json(data JSONB);

##
\COPY temporal_json(data) FROM PROGRAM 'tr -d "\r\n" < /home/camper/postgresdata/categorias.json';

## 
INSERT INTO categorias(codigo, nombre, descripcion)
SELECT 
     e->> 'codigo',
     e->>'nombre',
     e->>'descripcion'
FROM temporal_json AS t 
CROSS JOIN LATERAL  jsonb_array_elements(t.data) AS e;

##
SELECT * FROM temporal_json;

![Evidencia](evidencia.png)

