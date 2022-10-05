select * from mysql.user;
create user cliente identified by '1234';                                -- Crear  un usuario

grant select, insert on universidad_francisco.* to cliente;              -- Privilegios de select e insert
grant usage on universidad_francisco.* to cliente;

grant all privileges on universidad_francisco.* to cliente;              -- Todos los privilegios

revoke all privileges on universidad_francisco.* from cliente;           -- Quitar todos los privilegios


grant select, insert, update, delete on universidad_francisco.* to cliente;    -- Privilegios de select, insert, update y delete


flush privileges;      -- Actualizar/Refrescar los privilegios

show grants for cliente;     -- Muestra los privilegios del usuario

drop user cliente;          -- Elimina el usuario

grant usage on universidad_francisco.* to cliente@localhost;      -- Lo que viene luego de la @ es desde donde se puede conectar el usuario, puede ser una IP determinada o en este caso solo desde el servidor local

