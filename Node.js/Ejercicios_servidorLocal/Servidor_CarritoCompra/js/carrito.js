const frutas = document.querySelectorAll(".productos a");
let carrito = [];

frutas.forEach(
    (fruta) => {
        fruta.addEventListener(
            'click',
            () => {
                let nombre = fruta.getAttribute('nombre');
                let precio = parseFloat(fruta.getAttribute('precio'));
                let unidad = fruta.getAttribute('unidad');
                let cantidad = parseFloat(prompt("Buenas!, ¿Que cantidad vas a querer comprar?"));

                let objetoEleccion = new Object();
                objetoEleccion['nombre'] = nombre;
                objetoEleccion['precio'] = precio;
                objetoEleccion['unidad'] = unidad;
                objetoEleccion['cantidad'] = cantidad;
                objetoEleccion['parcial'] = cantidad * precio;
                carrito.push(objetoEleccion);
                console.log(carrito);

                mostrarCompra(carrito);
            }
        )
    }
)



function mostrarCompra(arrayCarrito) {
    let lineaCompra = "<div class='container'>";
    let total = 0;
    let contador = 0;
    arrayCarrito.forEach(
        (eleccion, index) => {
            lineaCompra += "<div class='row'><div class='col-sm'>" + eleccion.nombre + "</div><div class='col-sm'>" + eleccion.cantidad + "</div><div class='col-sm'>" + eleccion.precio + "€/" + eleccion.unidad + "</div> <div class='col-sm'>" + parseFloat(eleccion.parcial).toFixed(2) + "</div>" + "<div class='col-sm'><a href='#compra' onclick='eliminarItem("+index+")'><img src='img/eliminar_carrito.png'alt='eliminar del carrito' indice='"+index+"' width='30' height='30'></a></div>" + "</div>";
            total += eleccion.parcial;
            contador++
        }
    )
    lineaCompra += "</div>"
    document.getElementById('carrito').innerHTML = lineaCompra + "<div class='container text-end'><div class='row'><div class='col-sm'>" + total.toFixed(2) + "</div></div></div>";

}

function eliminarItem(item) {
    carrito.splice(item, 1);
    mostrarCompra(carrito);
}

// const borrar = document.querySelectorAll("img");


// borrar.forEach(
//     (img) => {
//         if (img.src.endsWith('img/eliminar_carrito.png')) {
//             img.addEventListener(
//                 "click",
//                 () => {
//                     let indice = img.getAttribute("indice");
//                     carrito.splice(indice, 1);
//                     mostrarCompra(carrito);
//                 }
//             )
//         }
//     }
// )




/*
Hay que programar un carrito de compra de fruta.

Hay que programar la compra con el carrito:

1) SIN TOCAR EL HTML

2) Usando addEventListener

En la parte inferior debe aparecer la lista de la compra
con un icono que permita eliminar ese elemento de la lista.
El total se debe recalcular.

Igual que la sección con las frutas es responsive, la lista también debe serlo

*/



// let elementosCompra = document.getElementById('carrito');
// let divNuevo = document.createElement('div');
// let divNuevo2 = document.createElement('div');
// divNuevo.id = "lineaProductos";
// divNuevo2.id = "compraParcial";
// elementosCompra.appendChild(divNuevo);
// elementosCompra.appendChild(divNuevo2);