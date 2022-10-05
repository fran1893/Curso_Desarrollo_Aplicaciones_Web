// Demora la ejecución de una función que se pasa como parámetro una cantidad de tiempo determinada.
setTimeout(
    () => console.log("Me he demorado"),
    2000                      //El tiempo se pone en milisegundos
);

// console.log("Voy a tiempo");


// Ejecturar la función por intervalos que dependen del tiempo que pongas en milisegundos

// Se tiene que crear una variable para detener al setInterval sino no tendría fin.
contador = 0

let intervalo = setInterval(
    () => console.log("Soy un intervalo", contador++),
    3000
);

setTimeout(
    () => clearInterval(intervalo), 15000
);