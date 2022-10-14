<?php    // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$update_nombre_profesor = "UPDATE `profesores` SET `nombre`='Paco' WHERE nombre = 'Manolo';";


try {
    $sql_update = $pdoConnection->prepare($update_nombre_profesor);
    $sql_update->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_update = null;
$pdoConnection = null;
