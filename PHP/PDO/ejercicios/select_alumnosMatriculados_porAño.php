<?php       // FRANCISCO DIAZ SALERNO

require_once '../pdo_connection.php';

$select_alumnos_matriculados = "SELECT DISTINCT A.nombre, A.apellido, C.anyo_inicio FROM alumnos A JOIN alumno_asignatura_curso ASI ON A.id_alumno = ASI.id_alumno JOIN curso_escolar C ON ASI.id_curso = C.id_curso ORDER BY C.anyo_inicio DESC;";

try {
    $sql_select = $pdoConnection->prepare($select_alumnos_matriculados);
    $sql_select->execute();

    $resultado = $sql_select->fetchAll();

    print_r($resultado);
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

$sql_select = null;
$pdoConnection = null;