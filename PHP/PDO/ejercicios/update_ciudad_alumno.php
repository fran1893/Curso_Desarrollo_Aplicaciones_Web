<?php    // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$update_ciudad_alumno = "UPDATE alumnos SET `ciudad` = 'Paris' WHERE nif = '79089577Y'";


try {
    $sql_update = $pdoConnection->prepare($update_ciudad_alumno);
    $sql_update->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_update = null;
$pdoConnection = null;
