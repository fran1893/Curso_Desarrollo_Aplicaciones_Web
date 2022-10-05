//Sumar los elementos del array que sean impares

let array = [1, 10, 14, 9, 5, 6];

let resultado = 0;

for (let i = 0; i < array.length; i++) {

    if (array[i] % 2 != 0) {          //CON EL "%2!=0" decimos que el resto del array dividido 2 sea distinto que 0
        resultado += array[i];
    }

};

console.log("el resultado es ", resultado);


