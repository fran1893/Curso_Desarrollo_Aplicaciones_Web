<?php    // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$insert_asignaturas = "INSERT INTO asignatura(`nombre`, `creditos`, `tipo`, `id_profesor`, `id_grado`, `id_departamento`) VALUES ('NODE.JS',6,'básica',(SELECT id_profesor FROM profesores WHERE nombre = 'Esther' AND apellido1 = 'Spencer'),2,1),('Servidores',6,'básica',(SELECT id_profesor FROM profesores WHERE nombre = 'Esther' AND apellido1 = 'Spencer'),2,1),('Criptografía',6,'básica',(SELECT id_profesor FROM profesores WHERE nombre = 'Esther' AND apellido1 = 'Spencer'),2,1);";


try {
    $sql_insert = $pdoConnection->prepare($insert_asignaturas);
    $sql_insert->execute();
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_insert = null;
$pdoConnection = null;