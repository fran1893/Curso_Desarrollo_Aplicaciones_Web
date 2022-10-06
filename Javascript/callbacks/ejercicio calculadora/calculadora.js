


function calculadora() {

let x = document.getElementById("valor_1");
let y = document.getElementById("valor_2");
 
mostrarResultado(suma(x.value, y.value));

}

let radios = document.querySelectorAll(type=radio);

radios.forEach(radio => {
    if(radio.checked){
        
    }
})

function suma(x, y) {
    let resultado = parseFloat(x) + parseFloat(y);
    return resultado;
}

function resta(x, y) {
    let resultado = x - y;
    return resultado;
}

function multiplicacion(x, y) {
    let resultado = x * y;
    return resultado;
}

function division(x, y) {
    let resultado = x / y;
    return resultado;
}

function mostrarResultado(valor){
    let resultado = document.getElementById("resultado");
    resultado.innerHTML = valor.toFixed(2);
}



// let valor_radio = document.querySelector('input[name="operacion"]:checked');
    // switch (valor_radio) {
    //     case "suma": operacion = suma(x,y);
    //         break;
    //     case "resta": operacion = resta(x, y);
    //         break;
    //     case "multiplicacion": operacion = multiplicacion(x, y);
    //         break;
    //     case "division": operacion = division(x, y);
    //         break;

    // }
    // document.getElementById("resultado").innerHTML = resultado.toFixed(2);