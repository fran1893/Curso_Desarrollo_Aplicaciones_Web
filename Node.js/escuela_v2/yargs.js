const argv = require('yargs')
.option('n', {
    alias: 'nombre',
    demandOption: true,
    // default: '/etc/passwd',
    describe: 'nombre del alumno',
    type: 'string'
})
.option('c', {
    alias: 'calificacion',
    // demandOption: true,
    // default: 'pendiente',
    describe: 'calificacion del alumno',
    type: 'number'
})
.option('p', {
    alias: 'ponfalta',
    // demandOption: true,
    // default: 'ninguna',
    describe: 'poner la fecha de falta del alumno',
    type: 'string'
})
.option('q', {
    alias: 'quitafalta',
    // demandOption: true,
    // default: 'false',
    describe: 'quitar la fecha de falta del alumno',
    type: 'string'
})
.option('i', {
    alias: 'informe',
    // demandOption: true,
    // default: 'false',
    describe: 'Realiza un informe de los alumnos con sus faltas y notas',
    type: 'string'
})
.argv;

module.exports = argv;