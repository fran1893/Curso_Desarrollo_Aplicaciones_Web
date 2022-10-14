<?php

require_once 'pdo_connection.php';

$insert_alumno = "INSERT INTO alumnos (`nif`, `nombre`, `apellido`, `ciudad`, `fecha_nacimiento`, `sexo`)
                VALUES ('11111111Z','Jhon','Doe','New York','1999-09-09','H');";


try {
    $sql_insert = $pdoConnection->prepare($insert_alumno);
    $sql_insert->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_insert = null;
$pdoConnection = null;
