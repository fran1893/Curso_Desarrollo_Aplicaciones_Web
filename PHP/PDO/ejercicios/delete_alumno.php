<?php    // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$delete_alumno_asignatura = "DELETE FROM `alumno_asignatura_curso` WHERE id_alumno = 1;";   
$delete_alumno = "DELETE FROM `alumnos` WHERE nif = '26902806M'";

try {
    $sql_delete = $pdoConnection->prepare($delete_alumno_asignatura);
    $sql_delete->execute();
    $sql_delete2 = $pdoConnection->prepare($delete_alumno);
    $sql_delete2->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_delete2 = null;
$sql_delete = null;
$pdoConnection = null;