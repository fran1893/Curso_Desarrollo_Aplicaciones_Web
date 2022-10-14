<?php

require_once 'pdo_connection.php';

// Escribir la sentencia select
$select_alumno = "SELECT * FROM alumnos";

try{
    // Sintaxis PDO para select
$sql_select = $pdoConnection->prepare($select_alumno);
$sql_select->execute();

// Como recuperar multiples lineas utilizamos fetchAll()
$resultado = $sql_select->fetchAll();

// var_dump($resultado);        Puede printarse asi o con print_r como debajo
print_r($resultado);

} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

// Hay que cerrar la conexión al final de cada fichero para aprovechar recursos.
$sql_select = null;
$pdoConnection = null;