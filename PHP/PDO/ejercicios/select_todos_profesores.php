<?php       // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$select_profesores = "SELECT nombre, apellido1 FROM profesores;";

try {
    $sql_select = $pdoConnection->prepare($select_profesores);
    $sql_select->execute();

    $resultado = $sql_select->fetchAll(PDO::FETCH_ASSOC);

    print_r($resultado);
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_select = null;
$pdoConnection = null;
