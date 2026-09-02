## CREACION DE TABLAS

```sql
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
```
## insercion de datos.xml

#### comandos utilizados
```sql
CREATE TABLE temporal_json(data JSONB);
```
##
```sql
\COPY temporal_json(data) FROM PROGRAM 'tr -d "\r\n" < /home/camper/postgresdata/categorias.json';
```
## 
```sql
INSERT INTO categorias(codigo, nombre, descripcion)
SELECT 
     e->> 'codigo',
     e->>'nombre',
     e->>'descripcion'
FROM temporal_json AS t 
CROSS JOIN LATERAL  jsonb_array_elements(t.data) AS e;
```
##

```sql
SELECT * FROM temporal_json;
```
![Evidencia](evidencia.png)

## insercion de datos.xml

#### comandos utilizados
```sql
CREATE TEMP TABLE temporal_xml(data XML);
```

```sql

\COPY temporal_xml(data) FROM PROGRAM 'tr -d "\r\n" < /home/camper/postgresdata/juegos.xml';
```
```sql
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
```
```sql
SELECT * FROM juegos;
```

![alt text](image.png)

## obten los 8 juegos sobre el promedio global y los 10 sobre su categoria 


###### consulta 1

![alt text](image-1.png)

###### consulta 2

![alt text](image-2.png)


## auditoria: cuenta juegos por categoria con LEFT JOIN el resultado es 5 en cada una

![alt text](image-3.png)