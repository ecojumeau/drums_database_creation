-- How many records do I have in the table 'baterias'?
SELECT COUNT(*)
FROM baterias;

-- What are the brands of my database?
SELECT nombre
FROM marcas;

-- Weight of the drum parts
SELECT nombre, peso
FROM piezas
ORDER BY peso DESC;

-- Heavier drum parts (above 2,5 kg)
SELECT nombre, peso
FROM piezas
WHERE peso > '2,5 kg';

-- What are the countries in which I have distribuitors?
SELECT DISTINCT pais
FROM distribuidores;

-- What distribuitors are based in Colombia?
SELECT nombre, pais
FROM distribuidores
WHERE pais = 'Colombia';

-- What distribuitors are based in Mexico and Peru?
SELECT nombre, pais
FROM distribuidores
WHERE pais = 'México' OR pais = 'Perú';

-- What country produce most drums?
SELECT pais, COUNT(pais) AS cantidad
FROM baterias
INNER JOIN marcas ON baterias.marca_id = marcas.id
GROUP BY pais
ORDER BY cantidad DESC;

-- How many drums are there of any type?
SELECT tipo, COUNT(tipo)
FROM baterias
GROUP BY tipo;

-- What distribuitor has most drums?
SELECT nombre, COUNT(nombre) AS baterias
FROM baterias
INNER JOIN distribuidores ON baterias.distribuidor_id = distribuidores.id
GROUP BY nombre
ORDER BY baterias DESC;

-- Acording to the last query, let´s find where is based the Plaza Music store
SELECT *
FROM distribuidores
WHERE nombre = 'Plaza Music';