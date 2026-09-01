# Reto: Pipeline de Datos en PostgreSQL

Repositorio para la práctica guiada de importación, transformación y análisis de datos en PostgreSQL utilizando formatos estructurados (`JSON` y `XML`).

## Descripción del Ejercicio
El pipeline está dividido en cuatro fases principales orientadas a la manipulación de bases de datos relacionales:
1. **Importación JSON:** Carga y normalización de un conjunto de categorías.
2. **Importación XML:** Carga y procesamiento de un catálogo de juegos enlazados a sus respectivas categorías.
3. **Comparación Analítica:** Consultas para filtrar juegos situados por encima del promedio global y del promedio específico de su categoría.
4. **Auditoría:** Verificación de integridad mediante uniones externas (`LEFT JOIN`) para el conteo de elementos por categoría.

## Estructura del Proyecto
- `categorias.json`: Fuente de datos JSON con la información de las categorías.
- `juegos.xml`: Fuente de datos XML con el inventario de juegos.
- `pipeline.sql`: Script contenedor con la estructura DDL, inserciones y consultas de auditoría.
