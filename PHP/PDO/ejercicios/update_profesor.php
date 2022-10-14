<?php    // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$update_profesor = "UPDATE `asignatura` SET `id_profesor`= (SELECT id_profesor FROM profesores WHERE nif = '11111178G') WHERE nombre = 'Criptografia';";


try {
    $sql_update = $pdoConnection->prepare($update_profesor);
    $sql_update->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_update = null;
$pdoConnection = null;
