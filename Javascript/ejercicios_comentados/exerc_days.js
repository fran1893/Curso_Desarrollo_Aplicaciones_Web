/* Vamos a preguntar al usuario que día de la semana es.
Responderá en castellano: "Lunes", por ejemplo.
Con esa información mostraremos un console.log
con el mensaje con el día que corresponda: "Today is Monday", en ese caso */

// Creación de los arrays que utilizaremos, tanto con los días en español como lo que sera su respuesta en inglés.
const dias = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"];

const days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

// En esta variable almacenamos la respuesta del usuario.
const pregunta = prompt("¿Qué día es?");


// Creamos un bucle for en el cual recorremos la longuitud del array "days" pero bien podría ser "días ya que la longuitud es la misma.
// Luego creamos un condicional if dentro del bucle en el cual decimos que si cualquiera de los días en español (por posición dentro del array)
//es igual a lo puesto por el usuario responderemos con el dia en inglés que tenga la misma posición en el array que el día en español.
for (let i = 0; i < days.length; i++) {

    if (dias[i] == pregunta) {
        console.log("Today is " + days[i])
        break;
    }
}