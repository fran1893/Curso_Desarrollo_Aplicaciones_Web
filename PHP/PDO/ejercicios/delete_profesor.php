<?php    // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$delete_profesor = "DELETE FROM `profesores` WHERE nombre = 'Alejandro' AND apellido1 = 'Kohler';";


try {
    $sql_delete = $pdoConnection->prepare($delete_profesor);
    $sql_delete->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_delete = null;
$pdoConnection = null;