<?php
// Previamente hemos creado una base de datos llamada "crud_colores",
// una tabla llamada "colores"
// la tabla consta de tres columnas:
// id, tipo INT autoincremental de longitud 2,
// color, tipo VARCHAR de 20,
// background, tipo VARCHAR de 20   

// Parámetros de la conexión
$servername = "localhost";
$dbname = "crud_colores";
$usuario = "root";
$password = "";

// La conexión puede fallar, por eso la 
// ponemos dentro de un try / catch
try {
    $pdoConnection = new PDO("mysql:host=$servername;dbname=$dbname", $usuario, $password);
    
    // Pruebas de la conexión correcta
    // echo "Conectado !!";

    // foreach($mbd->query('SELECT * from colores') as $fila) {
    //     print_r($fila);
    // }
    // $mbd = null;

} catch (PDOException $e) {
    // Cuando la conexión ha fallado se ejecuta este código
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}