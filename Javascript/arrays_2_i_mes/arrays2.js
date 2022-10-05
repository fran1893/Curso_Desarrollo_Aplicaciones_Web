// *************** repaso ARRAYS ************************

let frutas = ["Peras", "Cerezas", "Limones"];

console.log("frutas inicialmente", frutas);





// array.push(elemento1, elemento 2, ...) : añade el elemento al final del array

// frutas.push("Naranjas");

// console.log('después de frutas.push("Naranjas") el array es', frutas);






// array.pop() : elimina el útimo elemento del array

// frutas.pop();

// console.log('después de frutas.pop() el array es', frutas);






// array.shift() : elimina el primer elemento del array

// frutas.shift();

// console.log('después de frutas.shift() el array es', frutas);





// array.unshift(elemento1, elemento 2, ...) : añade uno o más elementos al pricipio del array

// frutas.unshift("Mango");

// console.log('después de frutas.unshift("Mango") el array es', frutas);





// Unir arrays

const frutas2 = ["Castañas", "Mandarinas"];



// Creando un nuevo array con los dos iniciales

// let frutasTotal = frutas.concat(frutas2);

// console.log("frutasTotal es", frutasTotal);




// Otra forma : operador spread

// let frutasTotal2 = [...frutas, ...frutas2];

// console.log("frutasTotal2 es ", frutasTotal2);



// Otra más

// 



// Unir sin crear nuevo array 

// console.log("frutas era ", frutas);

// frutas = [].concat(frutas, frutas2);

// console.log("frutas es ahora", frutas);












// Asignación por valor : solo pra tipos primitivos
// let a = 1;
// let b = a;
// a = 2;
// console.log(a, b);


// Asignación por referencia : para tipos complejos
// const numeros1 = [1, 2, 3];
// const numeros2 = numeros1;

// console.log(numeros1);
// console.log(numeros2);

// numeros1.push(4);

// console.log(numeros1);
// console.log(numeros2);






















// *************** Bucles FOR ************************
// for (let i = 0; i < frutas.length; i++) {
//     console.log(frutas[i]);
// }

// console.log("\n");

// // for of : accede al objeto diectamente
// for (let fruta of frutas) {
//     console.log(fruta);
// }






// forEach array.forEach(función que se aplicará a cada elemento)
// == el argumento de forEach es una función
// https://www.w3schools.com/jsref/jsref_foreach.asp

frutas.forEach(x => console.log(x));
frutas.forEach(x => console.log(x.toUpperCase()));

let numLetras = x => x.length;
frutas.forEach(x => console.log(x, numLetras(x)));

numeros1.forEach(x => console.log(x * 1.21));





// así no se modifica el array original

const compraTotal = [
    ["Peras", 8.5],
    ["Nectarinas", 3.6],
    ["Limones", 1.56]
];

let sum = 0;

function sumaCompraTotal(itemCompra) {
    sum += itemCompra[1];
}

compraTotal.forEach(sumaCompraTotal);
console.log("El total es", sum);

sum = 0;
compraTotal.forEach(function (itemCompra) {
    sum += itemCompra[1];
});
console.log("El total es", sum);

sum = 0;
compraTotal.forEach(itemCompra => sum += itemCompra[1]);
console.log("El total es", sum);




// Ejemplo con nun objeto
let carrito = [{
        nombre: "Peras",
        precio: 2.5,
        cantidad: 1.6
    },
    {
        nombre: "Nectarinas",
        precio: 1.8,
        cantidad: 3.2
    }, {
        nombre: "Limones",
        precio: 1.5,
        cantidad: 3.8
    },
    {
        nombre: "Naranjas",
        precio: 2.3,
        cantidad: 2.7
    }
];

let importeCompra = 0;
carrito.forEach(itemCompra => importeCompra += (itemCompra.cantidad * itemCompra.precio));
console.log("el importe de la compra es ", importeCompra);












// for in itera sobre las propiedades = índice
for (let fruta in frutas) {
    console.log(fruta);
}











// ************* MÉTODOS FUNCIONALES ******************
// High Order Functions

// *************** filter() ******************
// filter : devuelve un array filtado sin cambiar el original
console.log("frutasTotal es", frutasTotal);

let frutasinicialM = frutasTotal.filter(fruta => fruta[0] == "M");
console.log("frutasinicialM es", frutasinicialM);


console.log("carrito es", carrito);

let carritoFrutasN = carrito.filter(function(itemCompra){
    if (itemCompra.nombre[0] == "N") {
        return true;
    }
});
console.log("carritoFrutasN es", carritoFrutasN);

let carritoPrecioMayor2 = carrito.filter(function (itemCompra) {
    if (itemCompra.precio > 2) {
        return true;
    }
});
console.log("carritoPrecioMayor2 es", carritoPrecioMayor2);












// ************ map() *************************************
// map : devuelve un nuevo array al que se puede aplicar una transformación
// Los dos arrays tiene la misma longitud

let frutasMayusculas = frutas.map(function(fruta){
    return fruta.toUpperCase();
});
console.log(frutasMayusculas);

// otro ejemplo
console.log("carrito es", carrito);

let carritoIVA = carrito.map(function(itemCarrito){
    return {
        nombre: itemCarrito.nombre,
        precio: itemCarrito.precio * 1.04,
        cantidad : itemCarrito.cantidad
    }
});

console.log("carritoIVA es", carritoIVA);
















// *************** reduce( ) ****************
// devuelve un único elemento a partir de un criterio especificado

console.log("numeros1 es", numeros1);
let sumaNumeros1 = numeros1.reduce(function (total, item){
    return total + item;
});
console.log("el resultado es", sumaNumeros1);

let sumaNumeros1Flecha = numeros1.reduce((total, item) => total + item );
console.log("el resultado es", sumaNumeros1Flecha);
