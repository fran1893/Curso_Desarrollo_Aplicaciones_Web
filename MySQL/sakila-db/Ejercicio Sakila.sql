use sakila;

-- 1) Actores que tienen el primer nombre "Gary"
select * from actor where first_name = "Gary";

-- 2) Actores que tiene de primer apellido "Streep"
select * from actor where last_name = "Streep";

-- 3) Actores que contengan una "o" en su nombre
select * from actor where upper(first_name) like '%O%';

-- 4) Actores que contengan una "a" en su nombre y una "e" en su apellido
select * from actor where upper(first_name) like '%A%' and upper(last_name) like '%E%';

-- 5) Actores que contengan dos "o" en su nombre y una "a" en su apellido
select * from actor where upper(first_name) like '%O%O%' and upper(last_name) like '%A%';

-- 6) Actores cuya tercera letra del nombre sea "b"
select * from actor where upper(first_name) like '__B%';

-- 7) Ciudades qu eempiezan por "a"
select * from city where upper(city) like 'A%';

-- 8) Ciudades que acban por "s"
select * from city where upper(city) like '%S';

-- 9) Ciudades del country "Spain"
select * from city where country_id = (select country_id from country where upper(country) = 'Spain');

-- 10) Ciudades con nombres compuestos (como New York)
select * from city where upper(city) like '% %';

-- 11) películas con una duración entre 80 y 100 m.
select * from film where length between 80 and 100;

-- 12) películas con un rental_rate entre 1 y 3
select * from film where rental_rate >=1 and rental_rate <=3;
select * from film where rental_rate between 1 and 3;

-- 13) películas con un título de más de 11 letras.
select * from film where length(title) > 11;

-- 14) películas con un rating de PG o G.
 select * from film where rating = 'PG' or rating = 'G';
 
-- 15) ¿Cuantas ciudades tiene el country ‘France’? 
select count(*) from city where country_id = (select country_id from country where upper(country) = 'France');

-- 16) Películas que no tengan un rating de NC-17
select * from film where rating != 'NC-17';

-- 17) Películas con un rating PG y duración de más de 120.
select * from film where rating = 'PG' and length > 120;

-- 18) ¿Cuantos actores hay?
select count(*) from actor;

-- 19) Película con mayor duración.
select title from film where length = (select max(length) from film);

-- 20) ¿Cuantos countries hay que empiezan por ‘a’? 
select count(*) from country where upper(country) like 'A%';

-- 21) Visualiza los 10 actores que han participado en más películas


-- 22) Visualiza los clientes de países que empiezan por S
select * from customer_list where upper(country) like 'S%';

-- 23) Visualiza el top-10 de países con más clientes

-- 24) Saca las 10 primeras películas alfabéticamente y el número de copias que se disponen de cada una de ellas

-- 25) Saca todas las películas que ha alquilado el cliente Deborah Walker
