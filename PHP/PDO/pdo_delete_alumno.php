<?php

require_once 'pdo_connection.php';

$delete_alumno = "DELETE FROM alumnos WHERE nif = '11111111Z';";


try {
    $sql_delete = $pdoConnection->prepare($delete_alumno);
    $sql_delete->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_delete = null;
$pdoConnection = null;
