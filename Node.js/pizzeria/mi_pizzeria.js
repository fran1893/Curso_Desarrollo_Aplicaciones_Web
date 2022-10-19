const datos = require('./ingredientes.js');
// Representamos una pizzeria que ofrece pizzas a gusto del consumidor.

// Por tanto necesitamos un menú para que elija:

// 1) el tipo de masa: solo puede elejir uno

// 2) los ingredientes: puede elegir cualquiera de ellos, incluso  más de uno, pero solo una vez cada uno.

// cada ingrediente debe mostrar su precio incrementado un 20% de beneficio + 25% gastos diversos, todo ello por un 4% de IVA
// (estos porcentajes no los ve el cliente) 

// Al final aparece el contenido del pedido y el precio total.


const readline = require('readline');
const rl = readline.createInterface({ input: process.stdin, output: process.stdout });

const condimentos = Object.keys(datos.datosCondimentos[0]);

rl.question("¿Qué tipo de masa quieres para tu pizza? \n 1- Normal, 2- espelta, 3- Integral:     \n", (masa) => {
    let eleccionMasa = datos.datosMasa[masa - 1].tipo;
    let precioMasa = datos.datosMasa[masa - 1].precio;
    console.log('Has elegido la masa ' + eleccionMasa + '\n');


    rl.question('¿Qué ingredientes quieres para la pizza? Sepáralos por un espacio y al terminar dale a enter : \n 1- mozzarella,  2- Cuatro quesos,  3- salsa de tomate,  4- Pollo,  5- Anchoas,  6- Aceitunas  ', (ingredientes) => {
        let eleccionCondimentos = ingredientes.split(' ');
        let preciosCondimentos = [];

        eleccionCondimentos.forEach(
            (elementosLista) => {

                let nombreCondimento = condimentos[elementosLista - 1];
                let precioCondimento = datos.datosCondimentos[0][nombreCondimento];
                preciosCondimentos.push(precioCondimento);


            }
        );

        let totalCondimentos = preciosCondimentos.reduce((a, b) => a + b, 0);
        let totalCondimentosYextras = Math.round(((totalCondimentos) * 0.20 + (totalCondimentos) * 0.25 + totalCondimentos));
        let totalMasa = Math.round(precioMasa * 0.20 + precioMasa * 0.25 + precioMasa);
        let totalApagar = Math.round((totalMasa + totalCondimentosYextras) * 0.04 + totalMasa+totalCondimentosYextras);


        console.log(`\n En breves entregaremos tu pizza, tu total a pagar es de: ${totalApagar}€ \n`);




        rl.close();
    })
});