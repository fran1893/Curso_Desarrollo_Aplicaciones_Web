// Cargamos el modulo http
const http = require('http')

// console.log(http.STATUS_CODES)

// Creamos el servidor con createServer
http.createServer((request, response) =>{
    // Última instrucción para el servidor
    response.end('Hola')
}).listen(3000)                    // Puerto de conexión