use cine;


-- 1 
SELECT Pe.nombre, Pe.apellido, Pr.profesion, G.genero, Pe.oscars, Pe.fecha_nacimiento 
FROM people Pe JOIN genero G ON Pe.genero = G.id_genero JOIN profesion Pr ON Pe.profesion = Pr.id_profesion
WHERE Pe.apellido = 'Hepburn';


-- 2
SELECT nombre, apellido, oscars FROM people WHERE genero = 1;     -- opcion 1

SELECT nombre, apellido, oscars FROM people Pe JOIN genero G ON Pe.genero = G.id_genero WHERE G.genero = 'mujer';  -- opcion 2


-- 3
SELECT nombre, apellido, fecha_nacimiento FROM people WHERE nombre LIKE 'J%';


-- 4
SELECT nombre, apellido, Pr.profesion, Ge.genero, oscars, fecha_nacimiento 
FROM people Pe JOIN Genero Ge ON Pe.genero = Ge.id_genero JOIN profesion Pr ON Pe.profesion = Pr.id_profesion
WHERE oscars = 1;


-- 5
SELECT nombre, apellido, Pr.profesion, Ge.genero, oscars, fecha_nacimiento 
FROM people Pe JOIN Genero Ge ON Pe.genero = Ge.id_genero JOIN profesion Pr ON Pe.profesion = Pr.id_profesion
WHERE Pr.profesion = 'director';


-- 6
SELECT nombre, apellido, fecha_nacimiento from people WHERE fecha_nacimiento > 1910 ORDER BY apellido ASC;


-- 7
INSERT INTO people(`nombre`, `apellido`, `profesion`, `genero`, `oscars`, `fecha_nacimiento`) VALUES ('Woody','Allen', 1, 2, 4 , 1935), ('Groucho', 'Marx', 2, 2, 1, 1890);


-- 8
UPDATE people SET `fecha_nacimiento`= 1932 WHERE nombre = 'John' AND apellido = 'Williams';    -- Opcion 1

UPDATE people SET `fecha_nacimiento`= 1932 WHERE id=18;                                        -- Opcion 2

-- 9
DELETE FROM `people` WHERE nombre = 'Arthur' AND apellido = 'Rubinstein';   -- Opcion 1

DELETE FROM people WHERE id_people = 19;                                    -- Opcion 2


-- 10
CREATE VIEW actores_oscars AS
SELECT nombre, apellido, oscars
FROM people;


