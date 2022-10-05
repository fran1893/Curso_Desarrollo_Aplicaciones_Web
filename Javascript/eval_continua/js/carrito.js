let carrito = [];

function compra(precio, nombre, pesaje) {
    let cantidad;
    do {
        cantidad = prompt("Buenas!, ¿Que cantidad vas a querer comprar?")
        if (isNaN(cantidad) || cantidad == null || cantidad == "") alert('Tiene que poner un número')
    } while (isNaN(cantidad) || cantidad == null || cantidad == "");

    let totalParcial = cantidad * precio;

    carrito.push(totalParcial);

    document.getElementById("carrito").innerHTML += nombre + " " + cantidad + pesaje + " a " + precio + "€/" + pesaje + " = " + totalParcial.toFixed(2) + "€" + "<br>";

    let totalCarrito = carrito.reduce(function (a, b) { return a + b });

    document.getElementById("totalCarrito").innerHTML = "Total Compra: " + totalCarrito.toFixed(2) + "€";

};