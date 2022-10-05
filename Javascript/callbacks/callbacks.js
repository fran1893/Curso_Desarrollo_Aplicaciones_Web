//segunda();
//primera();

//function primera() {
//  console.log("Soy la primera");
//}

//function segunda(){
//    console.log("Soy la segunda");
//}

//let cuarta = function (){
//   console.log ("soy la cuarta");
//}


//let tercera = () => console.log ("Soy la tercera");
//tercera();


//



let frase = "buEnAs tArdeS";

function salida(algo) {
    console.log(algo);
}
function fraseMinus(texto) {
    return texto.toLowerCase();
}

console.log(fraseMinus(frase));

function fraseCapitalPrueba(texto) {
    return texto.charAt([0]).toUpperCase() + texto.slice(1);
}

console.log(fraseCapitalPrueba(frase));

function fraseCapital(texto, callbackSalida) {
    let resultado = texto.charAt([0]).toUpperCase() + texto.slice(1);
    callbackSalida(resultado);
}

fraseCapital(frase, salida);


function fraseCorrecta(texto, callbackCapital, callbackSalida) {
    let textoMinusculas = texto.toLowerCase();
    callbackCapital(textoMinusculas, callbackSalida);
}

fraseCorrecta(frase, fraseCapital, salida)