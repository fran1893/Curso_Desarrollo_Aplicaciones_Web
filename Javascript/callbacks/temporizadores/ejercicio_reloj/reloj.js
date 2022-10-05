//Creamos una variable "tiempo" que albergara el setInterval que lograremos luego.
let tiempo;

//Se crea la constante "btnIniciar" donde recogemos gracias al querySelector al botón con id=iniciar-1.
const btnIniciar = document.querySelector("#iniciar-1");

//Le agregamos un listener al boton ya recogido anteriormente donde al hacer click arranque el setInterval cada un segundo que alojaremos
//en la variable "tiempo" que definimos antes, con el new Date().toLocaleTimeString() logramos la hora en el formato que la queremos.
btnIniciar.addEventListener("click",
    function () {
        return tiempo = setInterval(
            function () {
                return (document.getElementById("tiempo-1").innerHTML = new Date().toLocaleTimeString());
            },
            1000
        );
    }
);
// Repetimos la idea anterior pero en este caso es dirigido al boton con id=detener-1 y en vez de el setInterval dentro del listener colocamos el
//clearInterval de la variable "tiempo" donde alojamos el setInterval anterior y con esto logramos detenerlo.
const btnDetener = document.querySelector("#detener-1");
btnDetener.addEventListener("click",
    function () {
        clearInterval(tiempo);
    }

);

//Creamos una función reloj que nos arrojara en pantalla el tiempo separado por horas con su "h" al final y minutos y segundos con sus respectivas
//letras.
function reloj() {
    let horaActual = new Date();
    let hora = horaActual.getHours();
    let minuto = horaActual.getMinutes();
    let segundo = horaActual.getSeconds();

    let horaImprimible = hora + "h:" + minuto + "m:" + segundo + "s";
    document.getElementById("tiempo-2").innerHTML = horaImprimible;
}

//Creamos la variable "tiempo2" donde alojaremos el setInterval del segundo reloj
let tiempo2;

//Misma idea que con el btnIniciar solo que aquí en el setInterval llamamos a la función reloj
const btnIniciar2 = document.querySelector("#iniciar-2");

btnIniciar2.addEventListener("click",
    function () {
        tiempo2 = setInterval(reloj, 1000);
    }
);

//Misma idea que antes con el btnDetener solo que aquí detenemos con el clearInterval a la variable tiempo donde esta alojado el setInterval
const btnDetener2 = document.querySelector("#detener-2");
btnDetener2.addEventListener("click",
    function () {
        clearInterval(tiempo2)
    }
);

//Misma idea que venimos repitiendo para el tercer reloj
let tiempo3;

const btnIniciar3 = document.querySelector("#iniciar-3");
btnIniciar3.addEventListener("click",
    function () {
        return tiempo3 = setInterval(
            function () {
                return (document.getElementById("tiempo-3").innerHTML = new Date().toLocaleTimeString());
            },
            1000
        );
    }
);

const btnDetener3 = document.querySelector("#detener-3");
btnDetener3.addEventListener("click",
    function () {
        clearInterval(tiempo3);
    }

);


//Se crea la función alarma donde sacamos la fecha actual por horas,minutos y segundos, obtenemos los valores introducidos por el usuario y dentro del if los comparamos y si resultan ser iguales imprimimos en el html el mensaje de alarma.
function alarma() {
    let horaActual = new Date();
    let hora = horaActual.getHours();
    let minuto = horaActual.getMinutes();
    let segundo = horaActual.getSeconds();
    let hora_usuario = parseInt(document.getElementById("hora").value);
    let minuto_usuario = parseInt(document.getElementById("minuto").value);
    let segundo_usuario = parseInt(document.getElementById("segundo").value);

    if (hora == hora_usuario && minuto == minuto_usuario && segundo == segundo_usuario) {
        document.getElementById("alerta_alarma").innerHTML = "ES LA HORA!!";
    }
}

//Creamos la constante btnAlarma para obtener al boton con id="activar_alarma" y luego con un listener agregamos que al hacer click en el mismo
//se activa el setInterval de la función alarma cada un segundo, los valores del usuario se mantendran iguales sin cambios mientras que los de
//la hora cambiaran cada segundo hasta conincidir con la hora de alarma del usuario.
const btnAlarma = document.querySelector("#activar_alarma")
btnAlarma.addEventListener("click", function () {
    setInterval(alarma, 1000);
}
)