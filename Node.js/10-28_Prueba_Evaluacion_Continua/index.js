// Francisco Diaz


// Carga el package en memoria
const { argv } = require("process");
const express = require('express');
const fs = require('fs');
const app = express();
const PUERTO = process.env.PORT || argv[2];
const dirHTML = 'public';
const datosEstudiantes = require('./datos/estudiantes.json');



// Vamos a la pagina principal con el archivo index.html
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/' + dirHTML + '/index.html');
});






app.get('/api/estudiantes', (req, res) => {


    // Muestra estudiantes con nota mayor a la query
    // Como hacer la query en el navegador :
    //localhost:3000/api/estudiantes?mayor=5
    if (req.query.mayor) {
        const notaQuery = req.query.mayor;
        const resultado = datosEstudiantes.filter(estudiante => estudiante.nota > notaQuery)
        console.log(`\n${resultado.length} alumnos tienen mayor nota que ${notaQuery}`)
        return res.json(resultado)
    };

    // Muestra estudiantes que tengan menor nota que la Query y ordenados por edad de mayor a menor
    // Como hacer la query en el navegador :
    //localhost:3000/api/estudiantes?notaCorte=5
    if (req.query.notaCorte) {
        const notaCorteQuery = req.query.notaCorte;
        const resultado = datosEstudiantes.filter(estudiante => estudiante.nota < notaCorteQuery)
        const ordenEdad = resultado.sort(
            function (a, b) {
                if (a.edad > b.edad) {
                    return -1;
                }
                if (a.edad < b.edad) {
                    return 1;
                }
                return 0;
            })
        return res.json(ordenEdad);
    };



    //Muestra los estudiantes ordenados alfabeticamente por apellido
    datosEstudiantes.sort(
        function (a, b) {
            if (a.apellidos > b.apellidos) {
                return 1;
            }
            if (a.apellidos < b.apellidos) {
                return -1;
            }
            return 0;
        });

    res.json(datosEstudiantes);

});



// Busca estudiantes por su email
app.get('/:mailEstudianteParam', (req, res) => {
    const mailEstudiante = req.params.mailEstudianteParam;

    const resultado = datosEstudiantes.filter((estudiante) => estudiante.email == mailEstudiante)


    // Chequeo que exista el alumno con ese mail
    if (resultado != 0) {
        res.json(resultado)
    } else {
        res.send(`<p>El estudiante con mail:  <span style="color: red;font-size: 30px">${mailEstudiante}</span> no existe</p>`)
    }
});




// Muestra estudiantes ordenados por nota de mayor a menor en caso de empate se ordenaran por edad de mayor a menor
app.get('/api/estudiantes/ranking', (req, res) => {

    datosEstudiantes.sort(
        function (a, b) {
            if (a.nota > b.nota) {
                return -1;
            }
            if (a.nota < b.nota) {
                return 1;
            }
            else {
                if (a.edad > b.edad) {
                    return -1;
                }
                if (a.edad < b.edad) {
                    return 1;
                }
                return 0;
            }
        })
    return res.json(datosEstudiantes);
});








app.use(express.static(dirHTML));

app.get('*', (req, res) => {
    res.status(404).sendFile('./' + dirHTML + '/404.html', { root: __dirname })
});


app.listen(PUERTO, () => {
    console.log(`Escuchando en http://localhost:${PUERTO}....`)
});