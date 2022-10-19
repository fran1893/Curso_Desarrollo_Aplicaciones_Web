const datos = require('./alumnos.js');
const precioBaseMatricula = 250;
// Para una escuela de idiomas, hace falta saber:
// 1) que alumnos son menores de edad, ya que se pasa la información de su asistencia a los padres
// 2) que alumnos son mayores de 65, ya que disponen de un descuento en la matrícula, a razón de
// un 5% por cada año que pasen de 64.
// Función que indique para los alumnos menores de edad
// su nombre, cuantos años tienen y cuantos días les faltan para cumplir 18
// De este modo:
// Pepa Pi tienes 17 años y te faltan 32 días para cumplir 18 años.
// Función que indique que alumnos pasan de 65 años, a qué descuento tienen derecho y
// cuanto costaría su matrícula. Por ejemplo:
// Pau Guerra tienes 66 años, tu descuento es del 10% y el importe de tu matrícula es de 225 €


datos.datosAlumnos.forEach(
    (alumno) => {
        let hoy = new Date();
        let cumpleanos = new Date(alumno.fecha_nacimiento);
        let edad = hoy.getFullYear() - cumpleanos.getFullYear();
        let m = hoy.getMonth() - cumpleanos.getMonth();

        if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
            edad--;
        }
        // Función que indique para los alumnos menores de edad
        // su nombre, cuantos años tienen y cuantos días les faltan para cumplir 18
        // De este modo:
        // Pepa Pi tienes 17 años y te faltan 32 días para cumplir 18 años.

        if (edad < 18) {
            let dia_milisegundos = 86400000;      // Cantidad de milisegundos en un día
            let diff_milisegundos = hoy - cumpleanos;
            let diff_dias = diff_milisegundos / dia_milisegundos;
            let dias_faltantes = Math.round( 6574.365 - diff_dias)    // 6570 son los días que hay en 18 años

            console.log(`${alumno.nombre} ${alumno.apellido} tienes ${edad} y te faltan ${dias_faltantes} días para cumplir 18 años`);
        }

        // Función que indique que alumnos pasan de 65 años, a qué descuento tienen derecho y
        // cuanto costaría su matrícula. Por ejemplo:
        // Pau Guerra tienes 66 años, tu descuento es del 10% y el importe de tu matrícula es de 225 €

        if (edad >= 65) {
            let añosPasados = edad - 64;
            let descuento = (precioBaseMatricula * 0.05) * añosPasados;
            let precioFinal = precioBaseMatricula - descuento;

            console.log(alumno.nombre, alumno.apellido + ' tienes ' + edad + ' años tu descuento es del ' + ((0.05 * 100) * añosPasados) + '% y el importe de tu matrícula es de ' + precioFinal + '€');
        }
    }

)


