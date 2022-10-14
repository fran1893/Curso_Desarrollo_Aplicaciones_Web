
DELIMITER //

CREATE PROCEDURE cuentaPalabra (IN palabra VARCHAR(20))
BEGIN
	select COUNT(*) FROM persona where nombre = palabra GROUP BY (nombre);

END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE cuentaPalabra2 (IN palabra VARCHAR(20), OUT contador INT)

BEGIN
	select COUNT(*) FROM persona where nombre = palabra GROUP BY (nombre) into contador;

END//

DELIMITER;


SET @num_nombres = 0;
call cuentaPalabra2 ('Juan', @num_nombres);

SELECT concat('La palabra Juan aparece ', @num_nombres, ' veces');


DELIMITER //
CREATE FUNCTION funcionPalabras (palabra VARCHAR(40)) RETURNS INT
BEGIN
DECLARE resultado int;
SELECT COUNT(nombre) FROM persona WHERE nombre = palabra INTO resultado;
RETURN resultado
END //

DELIMITER;





DELIMITER //

CREATE PROCEDURE alumnosPorAnyo (IN anyo YEAR(4))

BEGIN

SELECT DISTINCT nombre, apellido1 FROM persona P JOIN alumno_se_matricula_asignatura A ON P.id = A.id_alumno JOIN curso_escolar C ON A.id_curso_escolar = C.id_curso_escolar WHERE C.anyo_inicio = anyo;

END //

DELIMITER;



insert into tipo_asignatura (tipo)
SELECT DISTINCT(tipo) from asignatura;




DELIMITER //

CREATE FUNCTION cuantosAnyos (id INT(10)) RETURNS INT
BEGIN
DECLARE resultado int;
SELECT persona.nombre, YEAR(CURDATE())-YEAR(persona.fecha_nacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') >
 DATE_FORMAT(persona.fecha_nacimiento,'%m-%d'), 0 , -1 ) AS edad_actual FROM persona WHERE id_alumno=id;
RETURN resultado;
END //

DELIMITER;



DELIMITER //
CREATE FUNCTION cuantosAnyos (id INT(10)) RETURNS INT
BEGIN
DECLARE resultado INT;
SELECT YEAR(CURDATE())-YEAR(persona.fecha_nacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') >
 DATE_FORMAT(persona.fecha_nacimiento,'%m-%d'), 0 , -1 ) AS edad_actual FROM persona WHERE id_alumno=id INTO resultado;
RETURN resultado;
END //

DELIMITER;



SELECT persona.nombre, persona.appelido1 YEAR(CURDATE())-YEAR(persona.fecha_nacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') >
 DATE_FORMAT(persona.fecha_nacimiento,'%m-%d'), 0 , -1 ) AS edad_actual FROM persona WHERE id_alumno=1;