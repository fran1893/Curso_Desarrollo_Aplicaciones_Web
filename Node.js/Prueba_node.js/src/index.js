// Francisco Diaz

const { argv } = require("process");
const express = require('express');
const fs = require('fs');
const app = express();
const PUERTO = process.env.PORT || argv[2];
const dirHTML = 'public';
const dirCarpetaPractica = process.cwd();
const datosPacientes = require('../data/pacientes.json');
const arrayPacientes = datosPacientes[2].data


// Vamos a la pagina principal con el archivo index.html
app.get('/', (req, res) => {
    res.sendFile(dirCarpetaPractica + '/' + dirHTML + '/index.html');
});



// 2) Mostrar los pacientes ordenados alfabeticamente solo nombres y apellidos
app.get('/api/pacientes', (req, res) => {

    arrayPacientes.sort(
        function (a, b) {
            if (a.apellido > b.apellido) {
                return 1;
            }
            if (a.apellido < b.apellido) {
                return -1;
            }
            return 0;
        });

    let nombresYapellidosOrdenados = '';

    arrayPacientes.forEach((paciente) => {
        nombresYapellidosOrdenados += paciente.apellido + ', ' + paciente.nombre + '<br>';

    })
    res.send(nombresYapellidosOrdenados);
});


// 3) Filtrar pacientes por servicio brindado
app.get('/servicio/:tipoServicio', (req, res) => {

    const servicioPaciente = req.params.tipoServicio;

    const resultado = arrayPacientes.filter((paciente) => paciente.servicio == servicioPaciente)


    // Chequeo que exista el servicio
    if (resultado != 0) {
        res.json(resultado)
    } else {
        res.send(`<p>No existe servicio con el nombre:  <span style="color: red;font-size: 30px">${servicioPaciente}</span></p>`)
    }
});


// 4) Filtrar pacientes por su NIF/NIE
app.get('/api/pacientes/:nif', (req, res) => {
    const nifPaciente = req.params.nif;

    const resultado = arrayPacientes.filter((paciente) => paciente.nif == nifPaciente)


    // Chequeo que exista el paciente con ese NIF/NIE
    if (resultado != 0) {
        res.json(resultado)
    } else {
        res.send(`<p>El paciente con nif:  <span style="color: red;font-size: 30px">${nifPaciente}</span> no existe</p>`)
    }
});


// 5) Lista de pacientes ordenados por ciudades
app.get('/api/ciudades', (req, res) => {
    arrayPacientes.sort(
        function (a, b) {
            if (a.ciudad > b.ciudad) {
                return 1;
            }
            if (a.ciudad < b.ciudad) {
                return -1;
            }
            return 0;
        });

    res.json(arrayPacientes);
});


// 6) Filtrar pacientes por ciudades
app.get('/api/ciudades/:ciudad', (req, res) => {
    const ciudadPaciente = req.params.ciudad;

    const resultado = arrayPacientes.filter((paciente) => paciente.ciudad == ciudadPaciente)


    // Chequeo que exista el paciente en esa ciudad
    if (resultado != 0) {
        res.json(resultado)
    } else {
        res.send(`<p>No consta ningun paciente de  <span style="color: red;font-size: 30px">${ciudadPaciente}</span></p>`)
    }
});


// 7) Mostrar cuantos pacientes hay en cada ciudad
app.get('/api/pacientes_ciudad', (req, res) => {
    // Creamos el array ciudades donde almacenaremos todas las ciudades que tengamos en el array "arrayPacientes"
    let ciudades = [];
    // Creamos la variable cantidadPersonasCiudad para alamacenar el resultado que queremos mostrar en el navegador
    let cantidadPersonasCiudad = '';

    // Con este bucle for recorremos el array "arrayPacientes" y inyectamos la ciudad en el array "ciudades"
    // siempre y cuando esta no exista ya en el mismo, asi logramos que almacene todas las ciudades que existen en "arrayPacientes"
    for (i = 0; i <= arrayPacientes.length - 1; i++) {
        if (ciudades.includes(arrayPacientes[i].ciudad) == false) {
            ciudades.push(arrayPacientes[i].ciudad)
        }
    };
    // Este bucle nos sirve para sacar la cantidad de pacientes por cada ciudad que haya en el array "ciudades"
    // y inyectar  esto con el nombre de la ciudad a la variable "cantidadPersonasCiudad" que es lo que mandaremos al navegador
    for (i = 0; i <= ciudades.length - 1; i++) {
        let cantidadCiudad = arrayPacientes.filter((paciente) => paciente.ciudad == ciudades[i]).length


        cantidadPersonasCiudad += ciudades[i] + ': ' + cantidadCiudad + '<br>'
    };
    res.send(cantidadPersonasCiudad)
})



app.use(express.static(dirHTML));

// 8) Mostramos la página 404.html cuando la url introducida no exista
app.get('*', (req, res) => {
    res.status(404).sendFile('./' + dirHTML + '/404.html', { root: dirCarpetaPractica })
});


app.listen(PUERTO, () => {
    console.log(`Escuchando en http://localhost:${PUERTO}....`)
});