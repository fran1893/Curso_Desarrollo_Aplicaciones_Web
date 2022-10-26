// Cargamos el modulo http
const http = require('http')

const puerto = 4000

// Creamos el servidor con createServer
const server = http.createServer((req, res) => {

    // console.log('url :', req.url);
    // console.log('method:', req.method);             // Metodos básicos para trabajar con el request o req
    // console.log('headers:', req.headers);

    console.log('status: ', res.statusCode);
    res.statusCode = 404;
    // Última instrucción para el servidor
    res.end('Hola')
});

// Puerto de conexión
server.listen(puerto, () => {
    console.log(`Escuchando en http://localhost:${puerto}`);
});