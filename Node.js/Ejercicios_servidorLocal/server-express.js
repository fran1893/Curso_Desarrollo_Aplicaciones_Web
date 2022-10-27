// Carga el package en memoria
const express = require('express');
const fs = require('fs')
// Asignamos la función a una variable
const app = express();

// Asignación del puerto de conexión
// Sintaxis 1
// const {PUERTO = 3000} = process.env;

// Sintaxis 2
const PUERTO = process.env.PORT || 3000;


// Importación de los datos para la API
const datosEmpresa = JSON.parse(fs.readFileSync('./datos/datos-empresa.json', 'utf-8'));

app.get('/', (req, res) => {
  // Enviar un texto en la raiz del sitio
  //res.send('Hello World')

  // Enviar el fichero index.html del carrito (página principal)
  res.sendFile('./static/index.html', { root: __dirname })
})


app.get('/clientes', (req, res) => {
  // Enviar el fichero clientes.html
  res.sendFile('./static/clientes.html', { root: __dirname })
})



 // Muestra el objeto con todos los clientes y todas las frutas
app.get('/api', (req, res) => {
  res.send(JSON.stringify(datosEmpresa));
})


// Muestra el objeto con todas las frutas
app.get('/api/frutas', (req, res) => {
  res.send(JSON.stringify(datosEmpresa.productos));
})



// Buscar clientes por nombre
app.get('/api/clientes/:nombreClienteParam', (req, res) => {
  const nombreCliente = req.params.nombreClienteParam

  const resultado = datosEmpresa.clientes.filter((clientes) => clientes.nombre == nombreCliente)

  // Para ordenar a los clientes alfabeticamente por ciudad
  if(req.query.ordenar === 'ciudad'){
    const resultadoOrdenadoCiudad = resultado.sort((a,b) => a.ciudad.localeCompare(b.ciudad))
    return res.send(JSON.stringify(resultadoOrdenadoCiudad))
  }

  // Chequeo que exista el cliente
  if (resultado != 0) {
    res.send(JSON.stringify(resultado))
  } else {
    res.send(`<p>El cliente de nombre <span style="color: red;font-size: 30px">${nombreCliente}</span> no existe</p>`)
  }
})




// Buscar clientes por ciudad
app.get('/api/ciudad/:ciudadCliente', (req, res) => {
  const ciudadCliente = req.params.ciudadCliente

  const resultadoCiudad = datosEmpresa.clientes.filter((clientes) => clientes.ciudad == ciudadCliente)

  // Chequeo que exista la ciudad
  if (resultadoCiudad != 0) {
    res.send(JSON.stringify(resultadoCiudad))
  } else {
    res.send(`<p>No existe cliente en la ciudad de <span style="color: red; font-size: 30px">${ciudadCliente}</span></p>`)
  }
})




// Buscar clientes por ciudad y nombre
app.get('/api/nombreyciudad/:nombreClienteParam/:nombreCiudadParam', (req, res) => {
  const nombreCliente = req.params.nombreClienteParam
  const ciudadCliente = req.params.nombreCiudadParam

  const resultadoCiudadyNombre = datosEmpresa.clientes.filter((clientes) => clientes.ciudad == ciudadCliente && clientes.nombre == nombreCliente)

  // Chequeo que exista el cliente con ese nombre y que viva en esa ciudad
  if (resultadoCiudadyNombre != 0) {
    res.send(JSON.stringify(resultadoCiudadyNombre))
  } else {
    res.send(`<p>El cliente de nombre <span style="color: red;font-size: 30px">${nombreCliente}</span> no existe en la ciduad de <span style="color: red;font-size: 30px">${ciudadCliente}</span></p>`)
  }
})


app.get('/api/ciudad/:ciudadCliente', (req, res) => {
  const ciudadCliente = req.params.ciudadCliente

  const resultadoCiudad = datosEmpresa.clientes.filter((clientes) => clientes.ciudad == ciudadCliente)

  // Chequeo que exista la ciudad
  if (resultadoCiudad != 0) {
    res.send(JSON.stringify(resultadoCiudad))
  } else {
    res.send(`<p>No existe cliente en la ciudad de <span style="color: red; font-size: 30px">${ciudadCliente}</span></p>`)
  }
})



// Buscar frutas por temporada
app.get('/api/frutas/:temporada', (req, res) => {
  const temporada = req.params.temporada

  const resultadoTemporada = datosEmpresa.frutas.filter((frutas) => frutas.temporada == temporada)

  // Chequeo que existan frutas de esa temporada
  if (resultadoTemporada != 0) {
    res.send(JSON.stringify(resultadoTemporada))
  } else {
    res.send(`<p>No tenemos frutas de <span style="color: red; font-size: 30px">${temporada}</span></p>`)
  }
})


// Obtenemos el directorio de los ficheros estáticos: css, js, imágenes....
app.use(express.static('static'))


app.use((req, res) => {
  res.status(404).sendFile('./static/404.html', { root: __dirname })
})

app.listen(PUERTO, () => {
  console.log(`Escuchando en http://localhost:${PUERTO}....`)
})