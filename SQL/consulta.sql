CREATE TABLE sugerencia (
    id_sugerencia INT(5) PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT(5) NOT NULL,
    titulo_sugerencia VARCHAR (100) NOT NULL,
    rating_sugerencia ENUM('1','2','3','4','5') DEFAULT '1',
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
)


INSERT INTO USUARIOS (nombre_usuario, apellido_usuario, email_usuario, num_consultas, num_prestamos, num_dias_falta) VALUES('Bill', 'Gates', 'bill.gates@gmail.com', 12, 5, 0),
('Jeff', 'Bezos', 'jeff.bezos@gmail.com', 1, 5, 5);