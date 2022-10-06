-- A 10 registros sin fecha de nacimiento ponerle fecha < 2004
UPDATE persona SET fecha_nacimiento = "2015-04-13" WHERE id_alumno = 25;
UPDATE persona SET fecha_nacimiento = "2016-07-15" WHERE id_alumno = 26;
UPDATE persona SET fecha_nacimiento = "2017-10-01" WHERE id_alumno = 27;
UPDATE persona SET fecha_nacimiento = "2018-04-13" WHERE id_alumno = 28;
UPDATE persona SET fecha_nacimiento = "2005-05-20" WHERE id_alumno = 29;
UPDATE persona SET fecha_nacimiento = "2006-08-02" WHERE id_alumno = 30;
UPDATE persona SET fecha_nacimiento = "2007-01-18" WHERE id_alumno = 31;
UPDATE persona SET fecha_nacimiento = "2008-06-21" WHERE id_alumno = 32;
UPDATE persona SET fecha_nacimiento = "2009-04-11" WHERE id_alumno = 33;
UPDATE persona SET fecha_nacimiento = "2010-03-02" WHERE id_alumno = 34;




-- a) Ordenar de mayor a menor los que tengan fecha
 SELECT nombre, apellido1, fecha_nacimiento FROM persona WHERE fecha_nacimiento !='null' ORDER BY fecha_nacimiento;
 
 
 
 
 
-- b) nombre,apellido1 "eres mayor de edad" o "eres menor de edad"

SELECT nombre, apellido1, YEAR(CURDATE())-YEAR(persona.fecha_nacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') >
 DATE_FORMAT(persona.fecha_nacimiento,'%m-%d'), 0 , -1 ) AS edad_actual, 
 CASE
  	WHEN YEAR(CURDATE())-YEAR(persona.fecha_nacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') > 
          DATE_FORMAT(persona.fecha_nacimiento,'%m-%d'), 0 , -1 ) > 18
 		THEN 'Eres mayor de edad'
 	ELSE 'Eres menor de edad'
 END
FROM persona WHERE id_alumno=25;






-- b) RESPUESTA CON PRECEDURE:

DELIMITER //

CREATE PROCEDURE mayoriaEdad (IN id INT(3))

BEGIN

SELECT nombre, apellido1, YEAR(CURDATE())-YEAR(persona.fecha_nacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') >
 DATE_FORMAT(persona.fecha_nacimiento,'%m-%d'), 0 , -1 ) AS edad_actual, 
 CASE
  	WHEN YEAR(CURDATE())-YEAR(persona.fecha_nacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') > 
          DATE_FORMAT(persona.fecha_nacimiento,'%m-%d'), 0 , -1 ) > 18
 		THEN 'Eres mayor de edad'
 	ELSE 'Eres menor de edad'
 END
FROM persona WHERE id_alumno=id AND fecha_nacimiento IS NOT NULL AND fecha_nacimiento != '';

END//

DELIMITER;