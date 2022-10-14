<?php    // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$insert_alumno = "";


try {
    $sql_insert = $pdoConnection->prepare($insert_alumno);
    $sql_insert->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_insert = null;
$pdoConnection = null;