<?php
// Llamar al fichero conexion.php
include_once("conexion.php");

// Variables recogidas del $_GET
$id = $_GET['id'];
$color = $_GET['color'];
$background = $_GET['background'];

// Sentencia SQL para la modificación de los valores
$sql_update = "UPDATE colores SET color=?, background=? WHERE id=?";

// La conexión puede fallar, por eso la 
// ponemos dentro de un try / catch
try {
$editar_bd = $pdoConnection->prepare($sql_update);
$editar_bd->execute(array($color, $background, $id));
} catch (Exception $e) {
    // Cuando la conexión ha fallado se ejecuta este código
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

// Vaciamos la conexión y la consulta
$editar_bd = null;
$pdoConnection = null;
// Vuelve a la página que muestra la información
header("location: index.php");