<?php
// Llamar al fichero conexion.php
include_once("conexion.php");

// Consulta de las filas en la tabla
$sql_select = "SELECT * FROM colores";

// La conexión puede fallar, por eso la 
// ponemos dentro de un try / catch
try {
    // Sintaxis PDO para select
    $sql_datos = $pdoConnection->prepare($sql_select);
    $sql_datos->execute();
    // como recupera múltiples líneas utilizamos fetchAll()
    $resultado = $sql_datos->fetchAll();
} catch (Exception $e) {
    // En caso de fallar la consulta se ejecutará el
    // código siguiente
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}


// Muestra el contenido del array
//var_dump($resultado);

// Cuando se crea el array $_POST (con el formulario !$_GET)
if ($_POST) {

    $color = $_POST['color'];
    $background = $_POST['background'];

    $sql_insert = "INSERT INTO colores (color, background) VALUES (?,?)";

    // La conexión puede fallar, por eso la 
    // ponemos dentro de un try / catch
    try {
        // Sintaxis PDO para insert
        $agregar_bd = $pdoConnection->prepare($sql_insert);
        $agregar_bd->execute(array($color, $background));
    } catch (Exception $e) {
        print "¡Error!: " . $e->getMessage() . "<br/>";
        die();
    }

    // cerramos la conexión al acabar
    $pdoConnection = null;
    // al rellamar la página provocamos la recarga
    header("location: index.php");
}

// Cuando se cree el array $_GET (con la E de cada línea)
if ($_GET) {

    $id = $_GET['id'];
    // recuperamos los valores correspondientes al id
    $sql_color = "SELECT * FROM colores WHERE id=?";

    // La conexión puede fallar, por eso la 
    // ponemos dentro de un try / catch
    try {
        $consulta_color = $pdoConnection->prepare($sql_color);
        $consulta_color->execute(array($id));
         // como recupera una sola línea utilizamos fetch()
        $resultado_color = $consulta_color->fetch();
    } catch (Exception $e) {
        print "¡Error!: " . $e->getMessage() . "<br/>";
        die();
    }


    // var_dump($resultado_color);

}



?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crud PHP</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="container">
        <div id="left">
            <!-- Recupera la información de cada fila -->
            <?php foreach ($resultado as $fila) :  ?>

                <!-- en el div reproduce el color y fondo capturados de la BD -->
                <div class="filas" style="
                color:<?= $fila["color"] ?>; 
                background-color:<?= $fila["background"] ?>;
                ">
                    <p>
                        <!-- Botón para Editar el color y el fondo, creando $_GET -->
                        <a href="index.php?id=<?= $fila["id"] ?>">E</a>
                        <!-- Botón para borrar el div a partir de su id -->
                        <a href="eliminar.php?id=<?= $fila["id"] ?>">B</a>
                        Color:<?= $fila["color"] ?> - Fondo: <?= $fila["background"] ?>
                    </p>
                </div>
            <?php endforeach ?>
        </div>
        <div id="right">
            <?php if (!$_GET) : ?>
                <!-- Formulario para añadir filas por el método POST-->
                <form method="POST">
                    <fieldset>
                        <legend>Agregar fila</legend>
                        <label for="color">Color:</label>
                        <input id="color" type="text" name="color">
                        <br><br>
                        <label for="background">Fondo:</label>
                        <input id="background" type="text" name="background">
                        <br><br>
                        <button class="boton">Agregar fila</button>
                    </fieldset>
                </form>
            <?php endif ?>

            <!-- Este formulario se mostrará cuando se oprima un botón E  -->
            <?php if ($_GET) : ?>
                 <!-- Formulario para editar filas por el método GET-->
                <form method="GET" action="editar.php">
                    <fieldset>
                        <legend>Editar fila</legend>
                        <label for="color">Color:</label>
                        <input id="color" type="text" name="color" value="<?= $resultado_color['color'] ?>">
                        <br><br>
                        <label for="background">Fondo:</label>
                        <input id="background" type="text" name="background" value="<?= $resultado_color['background'] ?>">
                        <br><br>
                        <input type="hidden" name="id" value="<?= $resultado_color['id'] ?>">
                        <button class="boton">Editar fila</button>
                    </fieldset>
                </form>
            <?php endif ?>


        </div>

    </div>
</body>

</html>