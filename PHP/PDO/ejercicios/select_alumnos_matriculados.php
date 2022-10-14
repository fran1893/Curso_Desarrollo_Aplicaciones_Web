<?php       // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$select_alumnos_matriculados = "SELECT DISTINCT nombre, apellido FROM alumnos A JOIN alumno_asignatura_curso ASI ON A.id_alumno = ASI.id_alumno;";

try {
    $sql_select = $pdoConnection->prepare($select_alumnos_matriculados);
    $sql_select->execute();

    $resultado = $sql_select->fetchAll(PDO::FETCH_ASSOC);

    print_r($resultado);
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_select = null;
$pdoConnection = null;