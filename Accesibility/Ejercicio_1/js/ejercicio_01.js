
//Definir al array con numeros introuducidos por el usuario
const veces = 4;


function numero_valido(chequear) {
    let patron = /[0-9]+/
    return patron.test(chequear)
};

let numeros_usuario = [];

for (let i = 0; i < veces; i++) {

    let texto_prompt = prompt("Introduzca un número")

    if (numero_valido(texto_prompt)) {
        numeros_usuario.push(parseInt(texto_prompt))
    }

};

console.log(numeros_usuario);

//let numeros = [parseInt(prompt("Introduzca un número")), parseInt(prompt("Introduzca un segundo número")), parseInt(prompt("Introduzca un tercer número")), parseInt(prompt("Introduzca un cuarto número"))];

// esto es para hacer la suma de los elementos del array y con el consolo.log para que aparezca en la consola del navegador:

// let suma = 0;

// for (let i = 0; i < numeros_usuario.length; i++) {
//     suma = suma + numeros_usuario[i]
// };
// console.log('holi '+ suma);
// document.getElementById("respuesta").innerHTML = suma;

//Esto es para que muestre el resultado de la suma en el p con id respuesta:
document.getElementById("respuesta").innerHTML = suma2(numeros_usuario);

//Funcion para sumar elementos de un array
function suma2(array) {

    let suma = 0
    for (let i = 0; i < array.length; i++) {
        suma += array[i]
    }
    return suma
};







