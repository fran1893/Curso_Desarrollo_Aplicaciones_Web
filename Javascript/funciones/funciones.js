let nombre1 = "Maria", nombre2 = "Pau";

console.log(saludar(nombre1, nombre2));



let nuevoSaludar = function (nom1, nom2) {
    return ("Hola " + nom1 + ", " + nom2);
};


console.log(nuevoSaludar(nombre1, nombre2));

let suma = function (num1, num2) {
    return num1 + num2;
}


let saludar3 = function (nom1, nom2) {
    return ("Hola " + nom1 + ", " + nom2);
}(nombre1, nombre2);

console.log("saludar3", saludar3);

(function () { console.log("soy una función automática") })();

//************************************************************************************************************ */

function saludar(nom1, nom2) {
    return ("Hola " + nom1 + ", " + nom2);
};



var flecha2 = (nom1, nom2) => { return ("Hola " + nom1 + ", " + nom2) };
var flecha2 = (nom1, nom2) => "Hola " + nom1 + ", " + nom2;
console.log(flecha2);




function duplicar(a) {
    return a * 2;
};



var flecha1 = (a) => { return a * 2 };
var flecha1 = a => a * 2;

console.log(flecha1(3));




var areaCirculo = radio => {
    const PI = 3.1415;
    return radio * 2 * PI;
};

console.log(areaCirculo(2));
