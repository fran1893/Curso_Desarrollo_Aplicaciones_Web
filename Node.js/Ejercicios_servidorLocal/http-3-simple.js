// Cargamos el modulo http
const http = require('http')

//Puerto de conexión
const puerto = 4000

// Creamos el servidor con createServer
const server = http.createServer((req, res) => {


    let contenido = '';
    if (req.url == '/') {
        contenido ="<h1>Estoy en el inicio</h1>"
    } else if (req.url == '/productos') {
        contenido = "<h1>Estoy en la página productos</h1>"
    }
    else {
        contenido ="<h1>No encontrado</h1>"
    }

    res.write(`
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index</title>
    </head>
    <body>
        ${contenido}
    </body>
    </html>`)

    // Última instrucción para el servidor
    res.end()
});

// Puerto de conexión
// El callback devuelve un mensaje si el puerto funciona correctamente
server.listen(puerto, () => {
    console.log(`Escuchando en http://localhost:${puerto}`);
});