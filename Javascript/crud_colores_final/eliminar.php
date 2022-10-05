<?php

// Llamar al fichero conexion.php
include_once("conexion.php");

// Recuperamos el id
$id = $_GET['id'];

// Sentencia SQL para el borrado
$sql_delete = "DELETE FROM colores WHERE id=?";

// La conexión puede fallar, por eso la 
// ponemos dentro de un try / catch
try {
    $eliminar_fila = $pdoConnection->prepare($sql_delete);
    $eliminar_fila->execute(array($id));
} catch (Exception $e) {
    // Cuando la conexión ha fallado se ejecuta este código
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}

// Vaciamos la conexión y la consulta
$eliminar_fila = null;
$pdoConnection = null;
// Vuelve a la página que muestra la información
header("location: index.php");

