
let dias = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"];

let days = ["Monday", "Tuesday", "Wendsday", "Thursday", "Friday", "Saturday", "Sunday"];

const eleccion_usuario = prompt("¿Qué día es hoy?");


for (let i = 0; i < days.length; i++) {

    if (dias[i] == eleccion_usuario) {
        console.log("Today is " + days[i])
        break;
    }
};