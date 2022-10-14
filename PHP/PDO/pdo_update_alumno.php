<?php

require_once 'pdo_connection.php';

$update_alumno = "UPDATE alumnos SET ciudad = 'Miami' WHERE nif = '11111111Z';";


try {
    $sql_update = $pdoConnection->prepare($update_alumno);
    $sql_update->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_update = null;
$pdoConnection = null;
