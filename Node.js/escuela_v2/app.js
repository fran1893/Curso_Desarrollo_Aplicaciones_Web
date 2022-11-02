const fs = require('fs')
const argv = require('./yargs.js')
const datosAlumnos = JSON.parse(fs.readFileSync('./datos/datosAlumnos.json', 'utf-8'));
const calificacionesAlumnos = JSON.parse(fs.readFileSync('./datos/calificaciones.json', 'utf-8'));
const faltasAlumnos = JSON.parse(fs.readFileSync('./datos/faltas.json', 'utf-8'));

// Variables a utilizar
const nombresAlumnos = [];
let nombreAlumno = argv.n;
let notaAlumno = argv.c;
let ponFalta = argv.p;
let quitaFalta = argv.q;
let crearInforme = argv.i;


// Enviamos los nombres de todos los alumnos al array "nombresAlumnos"
for (i = 0; i <= datosAlumnos.length - 1; i++) {
    nombresAlumnos.push(datosAlumnos[i].nombre + " " + datosAlumnos[i].apellido)
}

// Chequeamos que exista el alumno en nuestros datos y si es asi lo agregamos a calificaciones.json junto con su nota
if (nombresAlumnos.includes(nombreAlumno) && ponFalta == undefined && quitaFalta == undefined && crearInforme == undefined) {
    calificacionesAlumnos[nombreAlumno] = notaAlumno;
    calificacionesSTRING = JSON.stringify(calificacionesAlumnos);
    fs.writeFileSync('datos/calificaciones.json', calificacionesSTRING);

    console.log('\n El alumno existe y se le ha agregado la nota\n');
}
// Si el alumno no existe lo avisamos
else if (nombresAlumnos.includes(nombreAlumno) == false) {
    console.log('El alumno no existe, intentelo de nuevo');
    process.exit(1);

}

// Ponemos o quitamos las faltas de los alumnos en el archivo "faltas.json"
if (nombresAlumnos.includes(nombreAlumno) && notaAlumno == undefined && crearInforme == undefined) {

    // Si la falta que queremos poner ya existe se avisa de esto sin modificar nada
    if (faltasAlumnos[nombreAlumno] != undefined && faltasAlumnos[nombreAlumno].includes(ponFalta)) {
        console.log('Ya existe esa falta');

    }
    //Si el alumno no existe en el archivo "faltas.json" lo agregamos y le agregamos la falta correspondiente
    else if (quitaFalta == undefined && faltasAlumnos[nombreAlumno] == undefined) {
        faltasAlumnos[nombreAlumno] = [];
        faltasAlumnos[nombreAlumno].push(ponFalta);
        faltasSTRING = JSON.stringify(faltasAlumnos);
        fs.writeFileSync('datos/faltas.json', faltasSTRING);
        console.log('\n 1 Se le ha agregado la falta al alumno\n');

    }
    // Si el alumno existe simplemente le agregamos la falta correspondiente 
    else if (faltasAlumnos[nombreAlumno] != undefined && quitaFalta == undefined) {
        faltasAlumnos[nombreAlumno].push(ponFalta);
        faltasSTRING = JSON.stringify(faltasAlumnos);
        fs.writeFileSync('datos/faltas.json', faltasSTRING);
        console.log('\n 2 Se le ha agregado la falta al alumno\n');
    }

    // Chequeamos que la falta exista en el archivo "faltas.json" y la quitamos
    if (quitaFalta != undefined && faltasAlumnos[nombreAlumno].includes(quitaFalta)) {

        let nuevoArraySinfalta = faltasAlumnos[nombreAlumno].filter((fecha) => fecha !== quitaFalta);
        faltasAlumnos[nombreAlumno] = nuevoArraySinfalta;
        faltasSTRING = JSON.stringify(faltasAlumnos);
        fs.writeFileSync('datos/faltas.json', faltasSTRING);
        console.log('\n El alumno existe y se le ha quitado la falta\n');

    }
    // Si la falta no existe en el archivo "faltas.json" avisamos de esto 
    else if (ponFalta == undefined) {
        console.log('La falta que quiere remover no existe');
    }
}
else if (nombresAlumnos.includes(nombreAlumno) == false) {
    console.log('El alumno no existe, intentelo de nuevo')
    process.exit(1);

};




// Creamos un informe con las faltas y las calificaciones de los alumnos
if (crearInforme != undefined) {

    let cabeceraInforme = `Alumnado del curso \n--------------------\n`

    for (i = 0; i <= nombresAlumnos.length - 1; i++) {


        let calificacion;
        let faltas;

        // Ponemos las faltas de los alumnos en el informe
        if (Object.keys(faltasAlumnos).includes(nombresAlumnos[i])) {

            if (faltasAlumnos[nombresAlumnos[i]].length > 0) {
                faltas = faltasAlumnos[nombresAlumnos[i]].toString();

            } else if (faltasAlumnos[nombresAlumnos[i]].length == 0) {
                faltas = 'ninguna'
            }

        } else {
            faltas = 'ninguna'
        }

        // Ponemos las calificaciones de los alumnos en el informe
        if (Object.keys(calificacionesAlumnos).includes(nombresAlumnos[i])) {
            calificacion = calificacionesAlumnos[nombresAlumnos[i]];
        } else {
            calificacion = 'pendiente'
        }

        let alumno = `${nombresAlumnos[i]}\nCalificación: ${calificacion}\nFaltas de asistencia: ${faltas}\n\n`

        cabeceraInforme += alumno;



    }

    // Creamos el informe como un archivo de texto y lo guardamos en la carpeta 'datos'
    fs.writeFile("datos/informe.txt", cabeceraInforme, (err) => {
        if (err) throw err;

        console.log("Se ha creado el informe correctamente!");
    });
}