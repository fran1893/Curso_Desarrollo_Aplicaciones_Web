document.getElementById("boton").onclick = operacion;

function printar(x, y, operacionCB){
    let resultado = operacionCB(x, y);

    document.getElementById("resultado").innerHTML = resultado.toFixed(2);
}



function operacion() {
    let operador = document.querySelector('input[name="operacion"]:checked').value;
    let valor1 = parseInt(document.getElementById("valor_1").value);
    let valor2 = parseInt(document.getElementById("valor_2").value);

    switch (operador) {
        case "suma":
            printar(valor1, valor2, suma)
            // resultado = suma(valor1, valor2);
            break;
        case "resta":
            printar(valor1, valor2, resta)
            break;
        case "multiplicacion":
            printar(valor1, valor2, multiplicacion)
            break;
        case "division":
            printar(valor1, valor2, division)
            break;
    }
};



function suma(valor1, valor2) {
    return resultado = valor1 + valor2;
};

function resta(valor1, valor2) {
    return resultado = valor1 - valor2;
};

function multiplicacion(valor1, valor2) {
    return resultado = valor1 * valor2;
};

function division(valor1, valor2) {
    return resultado = valor1 / valor2;
};