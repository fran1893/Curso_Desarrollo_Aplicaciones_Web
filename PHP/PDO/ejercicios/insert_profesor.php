<?php    // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$insert_profesor = "INSERT INTO profesores(`nif`, `nombre`, `apellido1`, `ciudad`, `fecha_nacimiento`, `sexo`, `id_matricula`) VALUES ('11111178G','Jhon','Le Carre','Paris','1979-08-19','H','0');
UPDATE `asignatura` SET `id_profesor`= (SELECT id_profesor FROM profesores WHERE nif = '11111178G') WHERE nombre = 'NODE.JS';";


try {
    $sql_insert = $pdoConnection->prepare($insert_profesor);
    $sql_insert->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_insert = null;
$pdoConnection = null;