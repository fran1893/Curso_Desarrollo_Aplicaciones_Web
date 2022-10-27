// Modulos requeridos
const { createServer } = require('http');
const { createReadStream } = require('fs');
const path = require('path');
const { count } = require('console');

// Puerto de conexión
const { puerto = 4000 } = process.env;     // En el caso de que el puerto 3000 no este disponible buscara otro.


// Tipo de fichero a enviar
const HTML_CONTENT_TYPE = 'text/html';
const CSS_CONTENT_TYPE = 'text/css';
const JS_CONTENT_TYPE = 'application/javascript';
const IMG_CONTENT_TYPE_JPG = 'image/jpeg';
const IMG_CONTENT_TYPE_PNG = 'image/png';


// Construir la ruta de los ficheros a devolver con la petición
const DIR_HTML = path.join(__dirname, 'static');
console.log(DIR_HTML);


// Creamos el servidor
const server = createServer((req, res) => {
    // Obtener la ruta
    const { url } = req;
    // Caso de respuesta correcta
    let statusCode = 200;
    // Empezamos por el fichero HTML
    let contentType = HTML_CONTENT_TYPE;
    // Preparamos el flujo para la lectura de los ficheros
    let stream;
    let contadorPeticiones = 1;
    // Inicio desde la ruta raíz
    if (url === '/') {
        console.log("Peticiones: ", contadorPeticiones++)
        // Creamos el flujo para la lectura del fichero html
        stream = createReadStream(`${DIR_HTML}/index.html`)
    }
    else if (url.match("\.css$")) {
        contentType = CSS_CONTENT_TYPE;
        // Creamos el flujo para la lectura del fichero css
        stream = createReadStream(`${DIR_HTML}${url}`)
    }
    else if (url.match("\.js$")) {
        contentType = JS_CONTENT_TYPE;
        // Creamos el flujo para la lectura del fichero css
        stream = createReadStream(`${DIR_HTML}${url}`)
    }
    else if (url.match("\.jpg$")) {
        contentType = IMG_CONTENT_TYPE_JPG;
        // Creamos el flujo para la lectura de los ficheros imagenes JPG
        stream = createReadStream(`${DIR_HTML}${url}`)
    }
    else if (url.match("\.png$")) {
        contentType = IMG_CONTENT_TYPE_PNG;
        // Creamos el flujo para la lectura de los ficheros imagenes PNG
        stream = createReadStream(`${DIR_HTML}${url}`)
    }
    else {
        // Si llega aquí es que no encuentra el recurso
        statusCode = 404
    }

    // Creamos la cabecera
    res.writeHead(statusCode, { 'Content-Type': contentType });

    // Enviamos el flujo como respuesta
    if (stream) {
        stream.pipe(res);    // Si tiene un stream lo envía como respuesta
    }
    else {
        return res.end("No he encontrado el recurso")  // No tiene nada para enviar
    }

});

server.listen(puerto, () => {
    console.log(`Servidor escuchando por http:/localhost:${puerto}`)
})