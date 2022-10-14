<?php

$servername = "localhost";
$dbname = "curso_web";
$usuario = "root";
$password = "";


// La conexión puede fallar, por eso la ponemos dentro de un try catch
try {
    $pdoConnection = new PDO("mysql:host=$servername;dbname=$dbname", $usuario, $password);
    // Prueba de la conexion correcta
    //echo "Conectado !!";
    //foreach ($mbd->query('SELECT * from colores') as $fila) {
    //    print_r($fila);
    //}
    // $mbd = null;
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}
